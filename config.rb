# Require any additional compass plugins here.

# Root variables
relative_assets = true
http_path = './'
css_dir = 'ui/'
sass_dir = 'ui/'
images_dir = 'ui/basic/images/'
generated_images_dir = 'ui/basic/images/sprites'
javascripts_dir = 'ui/lib/'
additional_import_paths = Dir['ui/**/*','views/partials/**/*']

# Switch to format compiled CSS (default = expanded)
# On production build use:
# 		compass compile -e production

if (environment == :production) 
	output_style = :compressed
	css_dir = "/ui/compressed/"
else
	output_style = :expanded
end
