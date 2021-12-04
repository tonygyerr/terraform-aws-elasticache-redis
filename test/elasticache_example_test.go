package test

import (
	"fmt"
	"log"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the Terraform module in examples/terraform-aws-sagemaker-example using Terratest.
func TestTerraformLambdaExample(t *testing.T) {
	t.Parallel()

	targetRegions := []string{"us-east-1"}

	awsRegion := aws.GetRandomStableRegion(t, nil, nil)
	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(dir)
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples",
		// Variables to pass to our Terraform code using -var options
		VarFiles: []string{"../env-config/dev.tfvars"},
		NoColor:  false,

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	planOut := terraform.InitAndPlan(t, terraformOptions)
	assert.Contains(t, planOut, "aws_elasticache_parameter_group.default[0] will be created")
	assert.Contains(t, planOut, "aws_elasticache_replication_group.default[0] will be created")
	assert.Contains(t, planOut, "aws_elasticache_subnet_group.default[0] will be created")
	assert.Contains(t, planOut, "aws_security_group.default[0] will be created")
	assert.Contains(t, planOut, "aws_security_group_rule.egress[0] will be created")
	assert.Contains(t, planOut, "module.cache_cpu.aws_cloudwatch_metric_alarm.this will be created")
	assert.Contains(t, planOut, "module.cache_memory.aws_cloudwatch_metric_alarm.this will be created")
	assert.Contains(t, planOut, "Plan: 7 to add, 0 to change, 0 to destroy.")
}
