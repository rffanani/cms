<form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="varchar">Nama Ketua <?php echo form_error('nama_ketua') ?></label>
            <input type="text" class="form-control" name="nama_ketua" id="nama_ketua" placeholder="Nama Ketua" value="<?php echo $nama_ketua; ?>" />
        </div>
	    <div class="form-group">
            <label for="int">Time <?php echo form_error('time') ?></label>
            <input type="text" class="form-control" name="time" id="time" placeholder="Time" value="<?php echo $time; ?>" />
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('admin/tes2') ?>" class="btn btn-default">Cancel</a>
	</form>