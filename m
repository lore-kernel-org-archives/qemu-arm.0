Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180241ejy;
        Fri, 23 Sep 2022 01:48:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gctEVdK9vNfIPSNKuMBfO2zUft2gG/rKNmJI7zJYqb9CjqmrkJEamDz8l3yCRKuH8JyP8
X-Received: by 2002:a17:902:e891:b0:178:7b6:92db with SMTP id w17-20020a170902e89100b0017807b692dbmr7543724plg.160.1663922896870;
        Fri, 23 Sep 2022 01:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922896; cv=none;
        d=google.com; s=arc-20160816;
        b=auJm0sjF0BiYXWvm4nwxIwAGtamRtJGA50cs2bFvB3ADtqDZRXFMlpXUEMv5W/NkbJ
         oHQ8pxd8m4ERs+/8fpsRYUH5qdStEI/5/I3k78Q2lL4kSh8aBEhK7ZcfEefZ1uZvXAHd
         rC6TRa5tFnG8cPjU+CY5OHJAwHvzfvSBCTWaiLFK4+eUwwihPEcGAHXPmfGYdwyATa/m
         hpTGxAVxohLd9YNn6e/nLcTLNKGLcstc/trQlAi9FjymmQJ1kTlq4dF1TZ98c/g2exkb
         Uyoph/gyVCYwa3r8+obbROjkEasowS8p5u/lhvoc9GlmOaNzfYnyHiLhSdH2auX/WSUc
         79tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=CJjUZCAMepMl6eNrRqNAqzJa8XJ7qeC4HG+kPSeoFZI=;
        b=RNQuL3ApROdg1mJXyByQMrKeH93c25daMIG4S9o2qKlefdSqF1ji2aiQNjVJSWOUas
         PLxlVagCOWskNL+JfgqqcYBak9j2B1u7B6rZKNqWtJ7PzJQZwIjSMrz82z/KYaqFg6rH
         U2R54XFgRO9fWSjyoi8vdy1naR8f4XGbO6uOQ6cKm0uIb3Y2iE8ymxtO9Svz3Q6Be2mj
         lDRFuaulXleWe8/QmZJwVhONXMuYNI0cmSvTYtWVJz59TG2UBmk726Aqj/VCCRip9Ehw
         uP5ohySzMYVYuOfvd5PEs5493vAsrcOH1iRNGxiIG8/6ngjd5DeUkYO9ihGo0iZplYHg
         XVYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id x8-20020a63b348000000b0042b57ff2893si8528995pgt.195.2022.09.23.01.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5B6BZGz4x1L;
	Fri, 23 Sep 2022 18:48:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm582Kdgz4xGR;
	Fri, 23 Sep 2022 18:48:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on buildroot
Date: Fri, 23 Sep 2022 10:47:58 +0200
Message-Id: <20220923084803.498337-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zYwL10mNrziA

Replace 'buidroot' and 'builroot' by 'buildroot'.

Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0f64eb636c28..c703be99a6f7 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -92,7 +92,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
 
         self.do_test_arm_aspeed(image_path)
 
-    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
@@ -109,11 +109,11 @@ def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
         exec_command(self, 'root')
         time.sleep(0.1)
 
-    def do_test_arm_aspeed_buidroot_poweroff(self):
+    def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
                                           'reboot: System halted');
 
-    def test_arm_ast2500_evb_builroot(self):
+    def test_arm_ast2500_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2500-evb
@@ -127,7 +127,7 @@ def test_arm_ast2500_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0x0')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -139,9 +139,9 @@ def test_arm_ast2500_evb_builroot(self):
         exec_command_and_wait_for_pattern(self,
                              'cat /sys/class/hwmon/hwmon1/temp1_input', '18000')
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
-    def test_arm_ast2600_evb_builroot(self):
+    def test_arm_ast2600_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2600-evb
@@ -157,7 +157,7 @@ def test_arm_ast2600_evb_builroot(self):
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -175,7 +175,7 @@ def test_arm_ast2600_evb_builroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
 
 class AST2x00MachineSDK(QemuSystemTest):
-- 
2.37.3
