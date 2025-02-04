Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472573njb;
        Mon, 3 Feb 2025 16:23:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8KvyKL9ajNqktK8W6iF5i2fEiUjlbSqUGA4qnsVCqiL3JYNZWo6JIEijTpeJYjNo++rLb1kKrfxD9tA==@linaro.org
X-Received: by 2002:a05:600c:3488:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-438dc3cb2a8mr265686835e9.14.1738628626102;
        Mon, 03 Feb 2025 16:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628626; cv=none;
        d=google.com; s=arc-20240605;
        b=WuSWRypTCnzWEewSUaTgfHKRcz3bJcDD3DYSC+jSjG1/GmyIAcH+N/gnvpmCR+JXRz
         sJa8ll9wK3sMy5JVKnnA6siU2wVkDJJnm3SIiL+/LGlavnyjEf8LwryIn94t2RrUIYMs
         5PVM1H7kv08WxGYeyS4KVxbTwt/KGu8UxGt567XU3AEB3BgBZ3mArnvMzTKkfP779MAo
         BPM9tU3yDphSreBRqUQsgraj4CdmEGpe5TzEYLKN2EZSwFVHzLN8WVeo8G3hAe5r/mgH
         YZiKBcaM/IAJiulFgTGJTrgmqObi3fZFAKkqZQAmHt5oQVbphbvMJc4u8ATihzRkSwap
         2P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5hQiwa2G4uGjFgckcI0Yx0+nxXdng0uMBIPPXR9mbN0=;
        fh=hcITO11J575ObB71J0WzE6b4sbGLqAHlqeCThT3UOA4=;
        b=BJMtRgHTJfvHHWHMR1X8NvMvH/YBT+TAnReNsFEoBUIBbnGgw6FpjGBomp+xultum/
         xRZzAN1H9kA+Da+MR/YC1jJ2VhP/U1/QNasakvNdBOo5Hoj5h1idRQNkzGftxwgr1TQm
         hr2xZGD9Lf1P6J0nxgGV+oWYs1qzh6fi/aOGL4PjqKz+2SM1VGabjKEpbxeWHDPhQdqw
         dIt91z6wl3xfChx79yocIZF5/D+CPD+LbA0OaEGt/Gt5JCcoyqP6Xqu9KvxZ9t45T1x7
         gyQnfCN05Yci9se/dvWXhLjPMwnSvNSeADH5R86HROWpd1Z2IWapMjthk7BeCLtINyOd
         wE9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrjKoA2f;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dda02sor4705375f8f.2.2025.02.03.16.23.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrjKoA2f;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628625; x=1739233425; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hQiwa2G4uGjFgckcI0Yx0+nxXdng0uMBIPPXR9mbN0=;
        b=CrjKoA2fVpvUhD9uOjSgEGgjYGKtlsjeyp7GdB1dqJQH/2Lg9QRHJReosL/I/Nps29
         IMGhxEB/z7x345LL72J1srQhy7ZhEbvJj/xnfiXbWA9V9mv1jtdNmp9CJoOnVfBGVNWL
         3mlHYe1JrThm4SMixgjxOY3jUJcZQ62EkIqz3k/guLBol/MyLMeDsk6tTwAPv/f85I/K
         cAolzwCZuGuAcORkka0cJfU0CJ72me8tlqFxwWMDIv6XVJl1U2jpNhLZX9OxChzH8U5K
         v4bjn6lTgvQIbBx03Mw/e/Us0xiYAD0UjF+vFP11ftvhSdZ7VsHdroz7uvzXGMo7Io4M
         hIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628625; x=1739233425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hQiwa2G4uGjFgckcI0Yx0+nxXdng0uMBIPPXR9mbN0=;
        b=t6p+8fo/tsm2AWO0+qzgFSuK8nQeKK2HEGBNYS3yKAYe8nAyrRugPLWIzWikQ8q5ea
         Z0JBGod1SKsH60AWKCFBMdm0G31pVC7iqvJvpJShkwNXc7jhhndQDUSVhz4PHZG08ws2
         3+CxLcBnaF6vEC1UeB5m8aSHvsnT7du6CaY8n4wOzXoa0NzVOcokQQBNYl0UcuO41NWh
         vlNZXXLuqXvtGvQ+zeJxj5Sviq/BbcsRhd99fyPhDOknNE7528zfZcVWPwycoUlejuI2
         PUCXJU/QB+0v8Z99KrngNV9/nHczfwZK8f+AV7nEDDgXRMv6DilIU7YG6QRWRC6O6U+H
         PLig==
X-Forwarded-Encrypted: i=1; AJvYcCW3h4hOj4AJ1rKEDW/hHAWQqk/FWlWgpobuXnsidcY+n6MZdl/oMfGfHUXIRcI0GUc8ynjOwLAqXwlywQ==@linaro.org
X-Gm-Message-State: AOJu0YyX3XKKfOvpeUbQj0svPusFo3tt9ab1voIf/QeFAOPdw9PPUiav
	2Ev7tFUAkaGxrgVHcKbcLsLz7Jc8zkygg7Beu47Or/ff6SD8rbnypcN106HDqyn0BA==
X-Gm-Gg: ASbGnct+sK//MVVsPpOmj+hnuSCA0jNSo7W2dpn8kZhkfOoDr3ReRK9JydQb/QRdRPr
	0P0WbdxOlA7ldB/06HhzIS6EpP08BYsLiAg1wuXGOAfkGDxwA5rAd//1dGlRhLgO6awA056RLlB
	aE7/5qVYiqLxjn138Y1pTxE6EzYnmk7BqBrGl3I6yYOhs7rrC0FsQ85BGTlETUn/zOrMgukUhXG
	Bx6LZRWaa9f4Uv+hjkJ9+ONo77BpZrooV0dERO02452d4agiT6jkiPmYQBpXGTx0imZ8x4I4Ux8
	vvar0df3gaPTthi/GtfbOkgLc4NQsPMJAbhZUqeg1WAu37YL6Hvm5Ga+o3TJYklv8w==
X-Google-Smtp-Source: AGHT+IGlQD4ZmGLKUil5WfVZGYdxEsJmCOEa6i0RsnTR0Suea1nAcU2pJ0fJ4ozP82WDv94mnLgENA==
X-Received: by 2002:a05:6000:186f:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38c520a34b6mr25211298f8f.46.1738628625510;
        Mon, 03 Feb 2025 16:23:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11fadbsm13895097f8f.44.2025.02.03.16.23.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
Date: Tue,  4 Feb 2025 01:22:39 +0100
Message-ID: <20250204002240.97830-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Kqw5aN7Bji1y

All previous raspi machines can be created using the
generic machine. Deprecate the old names to maintain
a single one. Update the tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
QOM HMP introspection test fails because without the 'model'
argument set, no machine is created...

  $ qemu-system-aarch64 -M raspi
  qemu-system-aarch64: Missing model, try -M raspi,model=help
---
 docs/about/deprecated.rst               | 13 +++++++++++++
 hw/arm/raspi.c                          |  5 +++++
 tests/qtest/bcm2835-dma-test.c          |  2 +-
 tests/qtest/bcm2835-i2c-test.c          |  2 +-
 tests/qtest/boot-serial-test.c          |  3 ++-
 tests/functional/test_aarch64_raspi3.py |  5 ++---
 tests/functional/test_aarch64_raspi4.py |  4 ++--
 tests/functional/test_arm_raspi2.py     |  4 ++--
 8 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 4a3c302962a..c9a11a52f78 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
 Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
 CPUs. Big endian support is not tested.
 
+ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
+which takes the model as argument.
+
+    - `raspi0`` is now an alias for ``raspi,model=Zero``
+    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
+    - `raspi2b`` is now an alias for ``raspi,model=2B``
+    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
+    - `raspi3b`` is now an alias for ``raspi,model=3B``
+    - `raspi4b`` is now an alias for ``raspi,model=4B``
+
 Backend options
 ---------------
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 8cae1ff6f93..86ecc988e06 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -637,6 +637,7 @@ static void raspi0_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = 0x920092; /* Revision 1.2 */
     raspi_machine_class_init(mc, rmc->board_rev);
+    mc->deprecation_reason = "-M raspi,model=Zero";
 };
 
 static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
@@ -646,6 +647,7 @@ static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = 0x900021; /* Revision 1.1 */
     raspi_machine_class_init(mc, rmc->board_rev);
+    mc->deprecation_reason = "-M raspi,model=A+ (-m 512m)";
 };
 
 static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
@@ -655,6 +657,7 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = 0xa21041;
     raspi_machine_class_init(mc, rmc->board_rev);
+    mc->deprecation_reason = "-M raspi,model=2B -m 1g";
 };
 
 #ifdef TARGET_AARCH64
@@ -665,6 +668,7 @@ static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = 0x9020e0; /* Revision 1.0 */
     raspi_machine_class_init(mc, rmc->board_rev);
+    mc->deprecation_reason = "-M raspi,model=3A+ -m 512m";
 };
 
 static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
@@ -674,6 +678,7 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 
     rmc->board_rev = 0xa02082;
     raspi_machine_class_init(mc, rmc->board_rev);
+    mc->deprecation_reason = "-M raspi,model=3B -m 1g";
 };
 
 static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
index 18901b76d21..705e6b2362b 100644
--- a/tests/qtest/bcm2835-dma-test.c
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -111,7 +111,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/bcm2835/dma/test_interrupts",
                    bcm2835_dma_test_interrupts);
-    qtest_start("-machine raspi3b");
+    qtest_start("-machine raspi,model=3B -m 1g");
     ret = g_test_run();
     qtest_end();
     return ret;
diff --git a/tests/qtest/bcm2835-i2c-test.c b/tests/qtest/bcm2835-i2c-test.c
index 15991949260..15904abf393 100644
--- a/tests/qtest/bcm2835-i2c-test.c
+++ b/tests/qtest/bcm2835-i2c-test.c
@@ -104,7 +104,7 @@ int main(int argc, char **argv)
     }
 
     /* Run I2C tests with TMP105 slaves on all three buses */
-    qtest_start("-M raspi3b "
+    qtest_start("-M raspi,model=3B -m 1g "
                 "-device tmp105,address=0x50,bus=i2c-bus.0 "
                 "-device tmp105,address=0x50,bus=i2c-bus.1 "
                 "-device tmp105,address=0x50,bus=i2c-bus.2");
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index a05d26ee996..fbafd73facb 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -188,7 +188,8 @@ static const testdef_t tests[] = {
       sizeof(kernel_pls3adsp1800), kernel_pls3adsp1800 },
     { "microblazeel", "petalogix-ml605", "", "TT",
       sizeof(kernel_plml605), kernel_plml605 },
-    { "arm", "raspi2b", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
+    { "arm", "raspi,model=2B -m 1g", "", "TT",
+      sizeof(bios_raspi2), 0, bios_raspi2 },
     { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
       kernel_aarch64 },
     { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
diff --git a/tests/functional/test_aarch64_raspi3.py b/tests/functional/test_aarch64_raspi3.py
index 74f6630ed26..05766d93b3f 100755
--- a/tests/functional/test_aarch64_raspi3.py
+++ b/tests/functional/test_aarch64_raspi3.py
@@ -21,10 +21,9 @@ def test_aarch64_raspi3_atf(self):
         efi_name = 'RPI_EFI.fd'
         efi_fd = self.archive_extract(self.ASSET_RPI3_UEFI, member=efi_name)
 
-        self.set_machine('raspi3b')
+        self.set_machine('raspi,model=3B -m 1g')
         self.vm.set_console(console_index=1)
-        self.vm.add_args('-cpu', 'cortex-a53',
-                         '-nodefaults',
+        self.vm.add_args('-nodefaults',
                          '-device', f'loader,file={efi_fd},force-raw=true')
         self.vm.launch()
         self.wait_for_console_pattern('version UEFI Firmware v1.15')
diff --git a/tests/functional/test_aarch64_raspi4.py b/tests/functional/test_aarch64_raspi4.py
index 7a4302b0c5a..3becee9333a 100755
--- a/tests/functional/test_aarch64_raspi4.py
+++ b/tests/functional/test_aarch64_raspi4.py
@@ -34,7 +34,7 @@ def test_arm_raspi4(self):
         dtb_path = self.archive_extract(self.ASSET_KERNEL_20190215,
                                         member='boot/bcm2711-rpi-4-b.dtb')
 
-        self.set_machine('raspi4b')
+        self.set_machine('raspi,model=4B -m 1g')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'earlycon=pl011,mmio32,0xfe201000 ' +
@@ -64,7 +64,7 @@ def test_arm_raspi4_initrd(self):
                                         member='boot/bcm2711-rpi-4-b.dtb')
         initrd_path = self.uncompress(self.ASSET_INITRD)
 
-        self.set_machine('raspi4b')
+        self.set_machine('raspi,model=4B -m 1g')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'earlycon=pl011,mmio32,0xfe201000 ' +
diff --git a/tests/functional/test_arm_raspi2.py b/tests/functional/test_arm_raspi2.py
index d3c7aaa39b0..37390a9c360 100755
--- a/tests/functional/test_arm_raspi2.py
+++ b/tests/functional/test_arm_raspi2.py
@@ -39,7 +39,7 @@ def do_test_arm_raspi2(self, uart_id):
         dtb_path = self.archive_extract(self.ASSET_KERNEL_20190215,
                                         member='boot/bcm2709-rpi-2-b.dtb')
 
-        self.set_machine('raspi2b')
+        self.set_machine('raspi,model=2B -m 1g')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                serial_kernel_cmdline[uart_id] +
@@ -65,7 +65,7 @@ def test_arm_raspi2_initrd(self):
                                         member='boot/bcm2709-rpi-2-b.dtb')
         initrd_path = self.uncompress(self.ASSET_INITRD)
 
-        self.set_machine('raspi2b')
+        self.set_machine('raspi,model=2B -m 1g')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'earlycon=pl011,0x3f201000 console=ttyAMA0 '
-- 
2.47.1
