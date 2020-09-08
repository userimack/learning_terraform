package main

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
	"time"
)

func TestAlbExample(t *testing.T) {
	opts := &terraform.Options{
		// You should update this relative path to point at your alb
		// example directory!
		TerraformDir: "../examples/alb",
	}
	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)

	// terraform.Init(t, opts)
	// terraform.Apply(t, opts)
	terraform.InitAndApply(t, opts)

	// Get the URL of the ALB
	albDnsName := terraform.OutputRequired(t, opts, "alb_dns_name")
	url := fmt.Sprintf("http://%s", albDnsName)

	// Test the ALB's default action is working and returns a 404
	expectedStatus := 404
	expectedBody := "404: page not found"

	maxRetries := 10
	timeBetweenRetries := 10 * time.Second

	http_helper.HttpGetWithRetry(t, url, nil, expectedStatus, expectedBody, maxRetries, timeBetweenRetries)
}
