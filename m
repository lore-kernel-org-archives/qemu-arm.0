Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F5CC54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmgD-0007BH-34; Fri, 31 Jul 2026 08:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmgA-0007AJ-Ui
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:49:35 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmg9-0002ho-CV
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:49:34 -0400
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so627600f8f.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785502172; x=1786106972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AD/ctxxaJ0c1UGixC9zPix/cWBFWLdoXJO6RiTcZO2E=;
 b=G6L1c4DvjgqhVgfPVQ5jit5KUNLbIKVcHgI3VuXkc116i16eiErxfAg46l7HCv/i0f
 cvON6FxtkzzaPHsVbxAwfnaQBPiUax9j8EFCe0y5E6QFKUCmX4sGlESxJ8ATj2DkVGKJ
 39QbStHNgtv8SuIS2aEHI7JxQNMwnWsqr3iSYWaqSf3soP+hMoJP2G0odj44+/y2DUoY
 1tJ2AeazovZ58gh0vn6gIWwPpEGqI16fHw7SNXmSZuY3ITw33/qnMKdUApwwo3H1zUPY
 lCAtHQG+tX3xa8BXtcwa1G4GLPGmrwgXxIGxIwqoX2FOPt8aiS0/3IV0TkeB7WD9egnE
 kPZg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVR6loXNap5JcviqMcb6ELdmw86P2fgrCziZI0Hd7v3zvO7bli3xYSJohBdKim6JSYCbyE3GHdSQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzxl5obllQZxqzep3RCyPlw2fNpDnIYUVHEuEctBA54R19XJiXy
 bBmEftlRoNqDnUAZLZ6JEImGL7XPlhdOutFYHf5lRlmU+oRQIwhCm03X
X-Gm-Gg: AR+sD11kcGRW25COxCWcPAkLo/ibAlwumsK80bThqzdR14SfDVCLOPrTlWzxrtdwxkb
 91i8V7mKtVlv2kpNw+dBNmLSKPD+ZEaOzVYvfgIXdR0cvupsC4BDjHaFPimA5C4+4R5sO0D7yFz
 AGE2pCSbIO5lrR9j+bDTMMF+mvTQVgOwo09m6vXtafKD/HDYqz1qHmVwpXOaf5fsgjHAcTpEcJO
 sQPnwwwNJEtDdPofvrZqLU4AXxbUAVg7Cph8w0SMZ3OZ5mIhdgE1ueYFO/TfX57fQzOYGF8vMe8
 eVGQe790OQEcnb204wBuqXANhFNSsz1jILdUN4dOOmoxE/TLMDnepZSPqIAAYI2sK+Z93wL403o
 6nRM+ECrvjdVvWeNpPo/+oSpGOmKNCcHvPrzyd+fh/Iv0/DV/CiBmxrw1w8pwcFeQ7aVXnQGWd+
 MDk320f3xf5lYFCsWXQ3rjSg0X8CArinQc4fm4bLMM7mvNRaYw0LXZ/Al/eFiPjz+wC5x/3w4uq
 xV0GjM7LNhWM/Gk42R8r008eJSYYnC0LAZZ
X-Received: by 2002:a05:6000:41f2:b0:47f:81fe:12f8 with SMTP id
 ffacd0b85a97d-47fd2ababd7mr4509615f8f.1.1785502171339; 
 Fri, 31 Jul 2026 05:49:31 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd4562a38sm4287639f8f.21.2026.07.31.05.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:49:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:24 +0200
Subject: [PATCH v2 25/25] tests/functional/arm: catalina: test PCA9554 IO
 expander via QOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-25-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494709; l=2183;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=8aTFJBX4+2Zfb9dvqeKFk8XY5h03hnbOmzH0dpRmEzQ=;
 b=sxASZf/orReLgvIfnA0D0nVO733hUkUx7XzpQ1f1JTllPMuobgPTDxSRDpwp9zwTOzjoZvrAx
 /pnDcsHJZs6BdXFaKvfkL2A+QTQqYTP30I90MEIZ2xxT0bwsNfOou5E
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f44.google.com
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

Cover io_expander5 (pca9554@27, behind pca9548@70 channel 6 on i2c1), an
8-bit expander reached through the pca9548 mux.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/arm/test_aspeed_catalina.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/functional/arm/test_aspeed_catalina.py b/tests/functional/arm/test_aspeed_catalina.py
index 5624774891..f9ee62260b 100755
--- a/tests/functional/arm/test_aspeed_catalina.py
+++ b/tests/functional/arm/test_aspeed_catalina.py
@@ -33,6 +33,11 @@ class CatalinaMachine(AspeedTest):
     # io_expander0: pca9555@20 on i2c2, a 16-bit expander directly on the bus.
     IOEXP0_LOCATOR = "/machine/soc::aspeed.i2c-ast2600[0]~i2c[2]~pca9555@0x20"
     IOEXP0_GPIODETECT = r"\[2-0020\]"
+    # io_expander5: pca9554@27 behind pca9548@70 channel 6 on i2c1, an 8-bit
+    # expander reached through the mux; gpiodetect confirms its 8 lines.
+    IOEXP5_LOCATOR = ("/machine/soc::aspeed.i2c-ast2600[0]"
+                      "~i2c[1]~pca9548@0x70~i2c[6]~pca9554@0x27")
+    IOEXP5_GPIODETECT = r"-0027] \(8 lines\)"
 
     def test_arm_ast2600_catalina_openbmc(self):
         image_path = self.uncompress(self.ASSET_CATALINA_FLASH)
@@ -54,6 +59,7 @@ def test_arm_ast2600_catalina_openbmc(self):
         locator = DeviceLocator(self.vm.cmd)
         tmp75 = locator.resolve(self.TMP75_LOCATOR, "tmp75")
         ioexp0 = locator.resolve(self.IOEXP0_LOCATOR, "pca9555")
+        ioexp5 = locator.resolve(self.IOEXP5_LOCATOR, "pca9554")
 
         # temp1_input reports the temperature in millidegrees Celsius. Drive it
         # through QOM (units of 0.001 C) and check the kernel hwmon interface
@@ -65,6 +71,8 @@ def test_arm_ast2600_catalina_openbmc(self):
 
         # pca9555@20 spans two 8-bit ports (pins 0-7 and 8-15).
         self.check_ioexp(ioexp0, self.IOEXP0_GPIODETECT, (0, 7, 8, 15))
+        # pca9554@27 is a single 8-bit port.
+        self.check_ioexp(ioexp5, self.IOEXP5_GPIODETECT, (0, 3, 7))
 
     def check_ioexp(self, qom, gpiodetect, pins):
         # The guest drives these lines as inputs: set_pin injects an external

-- 
2.50.1


