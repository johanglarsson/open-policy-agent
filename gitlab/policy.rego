# METADATA
# scope: package
# description: A set of rules that determines if project settings are ok.
package gitlab

response := http.send({
	"method": "get",
	"url": "https://gitlab.com/api/v4/projects/1234",
	"headers": {"PRIVATE-TOKEN": "test"},
})

# METADATA
# scope: rule
# title: Allow if we have correct settings
allow if {
	response.body.remove_source_branch_after_merge == false
}
