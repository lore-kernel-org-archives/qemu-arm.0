Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2163C53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:51:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Z9-0002e6-VV; Wed, 29 Jul 2026 11:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Z9-0002dn-17
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:51:31 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Z7-0003ia-C7
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:51:30 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-495437bb891so62295e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785340288; x=1785945088;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QZUm9tfsjEjTtlnBZiVGDO9i7PQPNiLnEUF75edt6r8=;
 b=LsDJrIIgFvJy0doSwyC5cFz/mbNpnKJTTBiKjUXoETeZzT/0IwtIZaAdkpJpXPA2ul
 Xab0mcHSRSLudxz78fp255WaQpd3fzMidNVs2SMI1apOzENHnLVnnUbarbY3o+moTBX3
 KpOM6qmuwXm241PIR9gXTv4SBxuuPfGu6SmFD3V5VC1dj51cBqabcrLcS+a2i+anFCsb
 Lggq9axKuQU1xDiY/hoQ+jslDhjbBJDYnlQuWZJGf7MGLE/IY07Py8y6e/3t32Nqtwjd
 ygC57Bn5zqfFb5/WSZoW7iry8OmpPXu7mfqVjK7lfMAUX0Eo0nceTktksajiGncAb/Ha
 CAtA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/b37M0DKNUA6ytT6ZVcUHZ8FXHSUTbgBo70rI1VwrFIeR8JbFvoOxcWmUiC/MJVfVXOot3zesIA==@nongnu.org
X-Gm-Message-State: AOJu0YwXF40jbUfHT8rwxMTTWoKwnwtosrG9jDG19XE0QVYMC6luNBsb
 M0XpC5Hk3/qHxd99hbavblj5c/QsTMu5/Xi9kjy6MRkNO/LDL2GiiBD3
X-Gm-Gg: AR+sD10N8ws6kIvf+GSlgFbR+PimxB17NESl25hQqtirQAgVlN8+30Krk96tybJQWsi
 mc96l67X+AUwbUPpxKYPKfvZOPKhW89fNi7+lC4lAh/9g9IEqfuzFBoyBMplNfV1dM12OdoT5/q
 W2Gtuulk3/NcJNwrrRCt8Uch/xfaFsO0TUu7P0A2XHjftPgyE/TMUQ+WQnZfoReHgcicVzYO7CN
 Hor4EUW4bQs8nc99qcNP+T+SeegCB0odyx/jp4AuBAa36tB22Cl1mzHQcKKrxT/XVS01Y7u5sej
 Je2fG3aWzyUOmPKGLfuAAH+YHpFTe9KMyIg+IMbJOY/XJASUXndwfsS3B1nCMQaB2CQiGBSugas
 ms8aGwk/3JWvSRVqvGfZSTG1e5stJ8q6tZQSyQYTTNON+geLl71xVtiomlErFId+chwePkoo/uQ
 Je2R9Z1E+0OWHfnd+DcrYhejLsQ1JV57jL3ait65KcctqzfDeX3k0OHAQd7oyL6DioAr8ksdsx0
 PbqbNbBbZnO7p+E+hGcNHUBotiV4c0ExbaO
X-Received: by 2002:a05:600c:4746:b0:495:3c6f:7c18 with SMTP id
 5b1f17b1804b1-497fd2f50bbmr29949825e9.3.1785340287675; 
 Wed, 29 Jul 2026 08:51:27 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4976bd83fabsm67580295e9.15.2026.07.29.08.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:51:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:59 +0200
Subject: [PATCH 23/25] tests/functional/arm: catalina: test PCA9555 IO
 expander via QOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-23-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337965; l=4869;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=x+swaeJ/f66FZ473PfGW+ic8eASLYIskyDGJo0YAj4k=;
 b=L2VjD8kMI40onDaVTPP/4MaReFi085o/rT1wZ2U7xAYYJ/98Vm7oKDkvClup9EVTwfq7WB5Bm
 VqGK1rrbdd6DI7w3UrzkqIT/QJ3C2ofhun0yaZ47z7+3bEyvOJPr0X5
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Drive the io_expander0 (pca9555@20 on i2c2) input pins from the host
through the pin%d QOM properties and read each one back both via qom-get
and via the guest kernel gpiochip (libgpiod), spanning both 8-bit ports
and both ends, then check two pins on different ports are reported
independently.

Introduce a check_ioexp() helper doing that round-trip so further
expanders can reuse it. Address the expander through the device locator
rather than a hardcoded QOM path.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/arm/test_aspeed_catalina.py | 64 +++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/tests/functional/arm/test_aspeed_catalina.py b/tests/functional/arm/test_aspeed_catalina.py
index b80b5fe92b..5624774891 100755
--- a/tests/functional/arm/test_aspeed_catalina.py
+++ b/tests/functional/arm/test_aspeed_catalina.py
@@ -2,6 +2,8 @@
 #
 # Functional test that boots the ASPEED machines
 #
+# Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+#
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import sys
@@ -28,6 +30,10 @@ class CatalinaMachine(AspeedTest):
     TMP75_HWMON = "/sys/bus/i2c/devices/9-004b/hwmon/hwmon*"
     PROMPT = "root@catalina:~#"
 
+    # io_expander0: pca9555@20 on i2c2, a 16-bit expander directly on the bus.
+    IOEXP0_LOCATOR = "/machine/soc::aspeed.i2c-ast2600[0]~i2c[2]~pca9555@0x20"
+    IOEXP0_GPIODETECT = r"\[2-0020\]"
+
     def test_arm_ast2600_catalina_openbmc(self):
         image_path = self.uncompress(self.ASSET_CATALINA_FLASH)
 
@@ -45,7 +51,9 @@ def test_arm_ast2600_catalina_openbmc(self):
         if sys.version_info < (3, 10):
             return
 
-        tmp75 = DeviceLocator(self.vm.cmd).resolve(self.TMP75_LOCATOR, "tmp75")
+        locator = DeviceLocator(self.vm.cmd)
+        tmp75 = locator.resolve(self.TMP75_LOCATOR, "tmp75")
+        ioexp0 = locator.resolve(self.IOEXP0_LOCATOR, "pca9555")
 
         # temp1_input reports the temperature in millidegrees Celsius. Drive it
         # through QOM (units of 0.001 C) and check the kernel hwmon interface
@@ -55,6 +63,60 @@ def test_arm_ast2600_catalina_openbmc(self):
                         property="temperature", value=milli_c)
             self.wait_hwmon_value(self.TMP75_HWMON, "temp1_input", milli_c)
 
+        # pca9555@20 spans two 8-bit ports (pins 0-7 and 8-15).
+        self.check_ioexp(ioexp0, self.IOEXP0_GPIODETECT, (0, 7, 8, 15))
+
+    def check_ioexp(self, qom, gpiodetect, pins):
+        # The guest drives these lines as inputs: set_pin injects an external
+        # level, read back over QOM and gpioget. Outputs are covered by qtests.
+        chip = self.resolve_gpiochip(gpiodetect)
+        for pin in pins:
+            self.set_pin(qom, pin, "low")
+            self.assert_pin(qom, pin, "low")
+            self.assert_gpio_line(chip, pin, 0)
+            self.set_pin(qom, pin, "high")
+            self.assert_pin(qom, pin, "high")
+            self.assert_gpio_line(chip, pin, 1)
+
+        # Drive two pins to opposite levels at once to confirm they are
+        # reported back independently.
+        lo, hi = pins[0], pins[-1]
+        self.set_pin(qom, lo, "low")
+        self.set_pin(qom, hi, "high")
+        self.assert_pin(qom, lo, "low")
+        self.assert_pin(qom, hi, "high")
+        self.assert_gpio_line(chip, lo, 0)
+        self.assert_gpio_line(chip, hi, 1)
+
+    def read_catalina_console(self, command):
+        return exec_command_and_wait_for_pattern(self, command, self.PROMPT)
+
+    def resolve_gpiochip(self, gpiodetect):
+        # awk already prints the "gpiochipN" name; just pick it out of the
+        # console output (the command echo and prompt hold no such token).
+        out = self.read_catalina_console(
+            f"gpiodetect | awk '/{gpiodetect}/{{print $1}}'")
+        for token in out.split():
+            if token.startswith(b"gpiochip"):
+                return token.decode()
+        self.fail(f"could not resolve gpiochip {gpiodetect}")
+
+    def set_pin(self, qom, pin, level):
+        self.vm.cmd("qom-set", path=qom, property=f"pin{pin}", value=level)
+
+    def get_pin(self, qom, pin):
+        return self.vm.cmd("qom-get", path=qom, property=f"pin{pin}")
+
+    def assert_pin(self, qom, pin, expected):
+        level = self.get_pin(qom, pin)
+        self.assertEqual(level, expected,
+                         f"pin{pin} QOM read {level!r}, expected {expected!r}")
+
+    def assert_gpio_line(self, chip, pin, expected):
+        out = self.read_catalina_console(
+            f"echo LINE{pin}=$(gpioget {chip} {pin})")
+        self.assertIn(f"LINE{pin}={expected}".encode(), out)
+
 
 if __name__ == '__main__':
     AspeedTest.main()

-- 
2.50.1


