#!/bin/sh

if [ -z $image_pm_enable ]; then 
	image_pm_enable=$(/media/mmcblk0p2/data/usr/bin/awk '{printf "%d\n",$1}' /proc/isp/pm/enable)
fi

cat << EOF
	<form name="image.pm" method="POST">
		<div class="panel panel-default">   
			<div class="panel-heading">
				PM
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="form-group">
						<label>							
							<input name="image_pm_enable" type="hidden" value="0" />
							<input name="image_pm_enable" type="checkbox" value="1" $([[ $image_pm_enable = "1" ]] && echo "checked" || echo "" ) />
							Enable
						</label>							
					</div>
				</div>
				<div class="row">
					<button type="submit" class="btn btn-default">Submit</button>
					<button type="reset" class="btn btn-default" disabled>Reset</button>
				</div>
			</div>
		</div>
	</form>
