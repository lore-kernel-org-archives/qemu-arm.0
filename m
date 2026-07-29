Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B2C53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:53:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6ac-0003a9-Iu; Wed, 29 Jul 2026 11:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6aY-0003Yb-Nu
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:52:58 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6aX-0003qP-8V
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:52:58 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49550ec592cso183445e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785340376; x=1785945176;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AD/ctxxaJ0c1UGixC9zPix/cWBFWLdoXJO6RiTcZO2E=;
 b=Dbq/jhnanb5nTc2dQ+j3yrkYuMkj8ubyHrDSZ+r+qYE7IKn5/FKf+uXbDVRhbj6Rg4
 5OvpQm0nTArNlwUmP/gwA3Jc6t6UoKB8ohfPDiuJ3KEgwOixaIquYRN41J/Jiq83ukiy
 Qt3gtaZdbz0erAQl1K+iTYnWWoMLbIQ8c54d61Fhsc7RQH70uePL7uHlRRFgjVpFgEAl
 klziCT8N0z69tVjNpy0fDKlDmgxpi9iGIhDw/Y6cTfJeezJCA1rHquZF5zNj+l103oh6
 C7+cETZYA2uAyfFdq48FJHPkAwwotRLmCuvBbX75fJilrOEcAFon2+QCREZjkzpW3zLF
 LEtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rom4swX+FW2hGIIxhf1Zz4GrA+W+TD3/A9IhcJFlRb+F6jt4j10T4iFHfT3CHkRfIASXr67RmFLNQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJ3Sj5J2unwM/7Pk6dTP/0jeLxNiyY34HmOvFQAn2ByJFFAnzH
 3oW6isHWOJTuu6oKeQvciPeGvN3zbMeLsN8qzOm7Li1EN2XDvlg2h5BE
X-Gm-Gg: AR+sD13mQoN2jwIbH4WcE6I2cqO0XhjMLEblgyXLlIXaduNhqV3VUc9xkcpO0RuxxzA
 2MfxvbUaomiEY1/epETL7tiwJAliB91SoWmp+IHlBxwFxZXTTu7EKpY+HhecvSgV7N6wK0v+Sxo
 ekRmQEssXPDaJG3OB0yncmbhRBVT2Ycorx4qZstTL7TcdPVp3eAQaeHzfQe8LNd3Mc5MBpv6N9x
 tGEmjnmWkkFD1QlWcpRm95dBF1KggOzoL8PDcvCDcQpBUQeIxlWq7yE0MTsss2gsy1Oc0+2vFX/
 zXqBfBVQh09TyBm1Ij5JI87ZxLchroAbmb74e4hDnOpnht5EPQdYzoH1Mu+zastn78zpsIcamum
 f7CW4vYMpVn+L6AxV2yiz2bDBmSk8LkPmNyLGBsNxTqhPE9rxd7o/wW/3WXHX6HOWYttPT5XZT8
 BxfMPfAJ9rtxsjPqA3/mvJwGfeCLoidi0AVxmQdgrA7qsHjFogv2NMapq0sxKiG4fSfW36ALE38
 9BFstQ702Ji/y4TcgoXqBiDL4YulTchLzq4
X-Received: by 2002:a05:600c:3b1f:b0:495:6022:5a23 with SMTP id
 5b1f17b1804b1-497fd321f45mr31393405e9.19.1785340375806; 
 Wed, 29 Jul 2026 08:52:55 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d72d9asm69319645e9.3.2026.07.29.08.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:52:55 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:13:01 +0200
Subject: [PATCH 25/25] tests/functional/arm: catalina: test PCA9554 IO
 expander via QOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-25-c8f9a8d101f6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337965; l=2183;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=8aTFJBX4+2Zfb9dvqeKFk8XY5h03hnbOmzH0dpRmEzQ=;
 b=BAjG5Wy4c7yHMBsCnKjOPpH/zt7w96VxJuztwuKqrjhTP0l1eFGjVbe1BXKIpiznBUsVdhfAt
 niP4X1dJuweDLofPmVHlZJqYA2rzeYkuy5VXcUbOnMLNeKCX/ZL5b4G
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
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


