Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1097905njc;
        Sun, 24 Nov 2024 22:59:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/2LTj/WmSQ30/qnXmM728H6RIjBf+klfb7x2p2KAsbCwib6OBB9Yi6rrH2YJJ4n94jK1MK9pRyT4YDg==@linaro.org
X-Received: by 2002:a05:6a20:7483:b0:1e0:cf39:846a with SMTP id adf61e73a8af0-1e0cf398537mr1686909637.29.1732517995749;
        Sun, 24 Nov 2024 22:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732517995; cv=none;
        d=google.com; s=arc-20240605;
        b=JbeQD9WRvVo7+8dw4KAVN65gA9PKRjz0hqOveKX165XrE32yO7I9OmudPraNjzCTgQ
         YRVFYyG2KYhFjzCzKvIQA8qYLSQZdTXfOeh02hrV7qY1CTFqttZsHJV96lHkxnef2mKB
         LhHfn5O2boRLmVVXWICa2BJzd6k1am7aZEzSsZntsD0NtDKC4ce7Z0mr637qEeKmEbUE
         Ia51YnJOnG57KVsU+1no5YQeQzTtUa0GqSNc+EslN4HF4/guJWmxTfpHbw/HikWZNVP1
         U+/61CbvMrszHh3BWq4Eb/pP9X6UYKlcbu5yhfCYkjsej1xmZBp4x8ttPbuGz8rWfUaW
         BltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Bn7NxH5CTNFEKOKyiJSwD1xFNrPz8+UgiToRUfTH7Yo=;
        fh=WUZqn71wUtgiQCsq4/noaOMEXeHQk7deBgvS2LhWr/o=;
        b=ElLG39EIwfvJzEYVFSY5Drs9AwRIImRmsCJFlwghTR69lId2/Qhg3kIgBDLr+x7RAQ
         rs8k5yZCQ6hdrgozURuhObvUb3NPkfKiM623sXeaV7vHIH+5hQj9N6lkz3FTDVvrYVug
         58dBR53RFakRywY90mWVvWXFjsoXVsaPSaoyW+duo6j0/455WRCaTt7UqXvd89M2K/hT
         /Tpg5GrBVfpGd2AtK6kkzj77U5D3AJzP8N9H4RGSWO/7gVZzCzfVj5Ww9NyZ0h+T4H7o
         aZv94uEjl2SWEPK10ovUMLYt8jJWwjSjsLyMRhQvKwinQ5fxvbFpYHYH5/5s8/K/kli/
         iUIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSMyc2Rv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-724f5831d0fsor3255309b3a.4.2024.11.24.22.59.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Nov 2024 22:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSMyc2Rv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732517995; x=1733122795; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn7NxH5CTNFEKOKyiJSwD1xFNrPz8+UgiToRUfTH7Yo=;
        b=WSMyc2RvaT2iG1f7ndau7rf1GbklzGDiC7JE2l9VeuAaIFv+w/qEiHeUMnZYfmVNv7
         GULENJfhP+BrsjJZJrRvCm6McfpxEf5ULbC3avCUhB8Xsy9ZBmyUFS66jrFq5jbhSv+r
         ht665zUofVawvzjXjkJQ4nAWM8bM3SKQ5TXerVE9ZH+yTgcpHKs8mcOYC/19/ukxDixu
         TDX8YAMvAIX6rbCGGzTqH9UW4ugdBotPHQIY1kGbz7jecjLvcgKSOZNjz7IzKSaI9iIo
         3q0wvzFl8B6MUg780/Op75lYod9E3uk61dg/VLHeDna9/fiUsBu05D9ja9WbUKv+16ce
         mR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517995; x=1733122795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn7NxH5CTNFEKOKyiJSwD1xFNrPz8+UgiToRUfTH7Yo=;
        b=IeFMb3VcyRX4LZV9KK4xcRrp2NmiAPoTZ3iHcOvzsL1Uve3J4aszz67t/KlBkD/9Uh
         eWS8D9HGv6mDtgOKjzt5jHsoCYc5l3Lmyrvc33Wfaoz03+Xy/bNEW6RQFCaZh+GLc2Ry
         nZbKS+92pChy6lTilmLxN1OYnRKwsYyWjwGsWNbBD7KPpeFxpd4ngU9wKU7fDwZbgZjI
         rNx/yiPIDtuSUajtpQr5V0K92M1KPSIrnnzC754MUfRddElaoj/xON7jgJTqQB/4M87a
         soBszm/uvyhuCmN/NsyCdrlherOixkVTffY94lNWcgv2TApM4QwT5zC6jC8iQAkpdLj6
         99mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPs1+TBVpLZMQwgb1icWGBXtZfa+NqYi2IwpkJN0U9xFNja7etuiO4XQZhuvPZpWOq/c3R0cHn9AFrVQ==@linaro.org
X-Gm-Message-State: AOJu0YwG2/OCuKfGpNkSbhYmRNoGSdSdFXXbpC/vl6rxYATRRPkuyACt
	woxjgw/OJdGNIrCDx2FdCdC9HavNdkWRFnoHnu69osym7tLQsPMFcFT5atF2d7eDSw==
X-Gm-Gg: ASbGncuJsd6zu13rNR6GFHTvadaOOpPHUnkd6Ky8EXaDQhOlYSZfPoEx0OEVM2r+vi4
	FIBpMyn2aBAltDqH3N3bNezxOrxfqz/48YE/gMPxGGvtQukOdCA8fR13G6K8pe66mkxWiYxbBwr
	IThTP3hftdb8PB2BDeJ1a+p/RVA4J/OJWU72yWM+QSiF1q6f9+Eu3dh1hdxgoUGwljTwU7e9+uD
	deeI5ZNLwvFK46JfjKLc1DVVJIHEDruJNer8N2vR5qVfx4P+qWRTtgRwn00mIOMfsJG1hiRY3wb
	myzX38R4JfmYIw==
X-Google-Smtp-Source: AGHT+IF0TS2PAUId3MwBi1Bm2sxNWzHRCH4G4icKj4IY/3Rb0bGno90jHLOsM92e4UABeYAjY7LBlg==
X-Received: by 2002:a05:6a00:1d91:b0:724:f10b:e663 with SMTP id d2e1a72fcca58-724f10bfd03mr9903358b3a.0.1732517995217;
        Sun, 24 Nov 2024 22:59:55 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b5asm5866634b3a.27.2024.11.24.22.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:59:54 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: mathieu.poirier@linaro.org,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	jean-philippe@linaro.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] tests/functional/aarch64_virt: add test for FEAT_RME
Date: Sun, 24 Nov 2024 22:59:50 -0800
Message-Id: <20241125065950.1179068-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Tn1O/5YjyzgH

This boot an OP-TEE environment, and launch a nested guest VM inside it
using the Realms feature.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/test_aarch64_virt.py | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 30bab5a677c..3e8f9372132 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -18,6 +18,7 @@
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import exec_command, wait_for_console_pattern
 from qemu_test import get_qemu_img, run_cmd
+from qemu_test.utils import archive_extract
 
 
 class Aarch64VirtMachine(QemuSystemTest):
@@ -129,6 +130,67 @@ def test_aarch64_virt_gicv2(self):
         return
         self.common_aarch64_virt("virt,gic-version=2")
 
+    # Stack is built with OP-TEE build environment from those instructions:
+    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # https://github.com/pbo-linaro/qemu-rme-stack
+    ASSET_RME_STACK = Asset(
+        ('https://fileserver.linaro.org/s/JX7oNgfDeGXSxcY/'
+         'download/rme-stack-op-tee-4.2.0.tar.gz'),
+         '1f240f55e8a7a66489c2b7db5d40391e5dcfdd54c82600bd0d4b2145b9a0fbfb')
+
+    # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
+    # and launching a nested VM using it.
+    def test_aarch64_virt_rme(self):
+        stack_path_tar_gz = self.ASSET_RME_STACK.fetch()
+        archive_extract(stack_path_tar_gz, self.workdir)
+
+        self.set_machine('virt')
+        self.vm.set_console()
+        self.require_accelerator('tcg')
+
+        rme_stack = os.path.join(self.workdir, 'rme-stack')
+        kernel = os.path.join(rme_stack, 'out', 'bin', 'Image')
+        bios = os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
+        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
+
+        self.vm.add_args('-accel', 'tcg')
+        self.vm.add_args('-cpu', 'max,x-rme=on')
+        self.vm.add_args('-m', '2048')
+        self.vm.add_args('-M', 'virt,acpi=off,'
+                         'virtualization=on,'
+                         'secure=on,'
+                         'gic-version=3')
+        self.vm.add_args('-bios', bios)
+        self.vm.add_args('-kernel', kernel)
+        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
+        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
+        self.vm.add_args('-device', 'virtio-9p-device,fsdev=shr0,mount_tag=shr0')
+        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
+        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0')
+        self.vm.add_args('-append', 'root=/dev/vda')
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+
+        # We now boot the (nested) guest VM
+        exec_command(self,
+                     'qemu-system-aarch64 -M virt,gic-version=3 '
+                     '-cpu host -enable-kvm -m 512M '
+                     '-M confidential-guest-support=rme0 '
+                     '-object rme-guest,id=rme0,measurement-algo=sha512 '
+                     '-device virtio-net-pci,netdev=net0,romfile= '
+                     '-netdev user,id=net0 '
+                     '-kernel /mnt/out/bin/Image '
+                     '-initrd /mnt/out-br/images/rootfs.cpio '
+                     '-serial stdio')
+        # Detect Realm activation during boot.
+        self.wait_for_console_pattern('SMC_RMI_REALM_ACTIVATE')
+        # Wait for boot to complete.
+        self.wait_for_console_pattern('Welcome to Buildroot')
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.39.5
