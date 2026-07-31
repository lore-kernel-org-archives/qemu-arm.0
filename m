Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBE4C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:46:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmdS-0005Vp-6b; Fri, 31 Jul 2026 08:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmdD-0005V9-9k
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:46:33 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmdB-0002Oi-BQ
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:46:30 -0400
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f9ab7ee38so556127f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501986; x=1786106786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=74jbyL6fPJ4k+KuBJbacmztdNW2KvwZdLLnAZhfQEFc=;
 b=PHsleKutrT+tbraevnodcKTkbRlmC+KfIYUO/aA9M2UETMj8DUfjqPelKjluPXwfHL
 0BlwhlGoG0RSGvtQ8piJkFEa+WNWrvee2TYVsJiXm6fIZNepXT+My7sqsHgmGfZUYxlx
 3EDUlRTnMhFDUpIGip4wH0pU2otVEmkHj45UXaNPI1Xv1gjUOIauk+t21G41yQaEct69
 FucQdjjGYOE9h+Vo56F2SweFRcrpbgf5Qv4WgZg4J4+f9LVBGYAQq/L0qTOFrjjz4+QY
 lHPtl7eAn+z65x8kkq04IYsiRy1cjYgt8nRNl/5dQ0TKBeyX/NJvkbuOyQ7hDTy2Iw40
 dfZA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqm1TdMUyV/+DBvvPqRjNrUMurEZE7ptPbJl18ck3E5tlyjur8J5wndCOAfzy5TGPYNr6mqr8G3FQ==@nongnu.org
X-Gm-Message-State: AOJu0Yykue7MhGB9mTKozFG+X5B9i2TNou7ipBE0Np/YnzFlYikdLLv7
 YeXvN+wfEKlCnIMU0vCukE9cTUCV3zTlxS5iRWUJochkCVHAjsyXp/b7
X-Gm-Gg: AR+sD12HDrJFb3IF1c8xsBGcnRl47z0tINvqUuSscbDsbtGQTaLHqgxZUDkNLmPSTK7
 u//NSiT2MqAkZ0BcfVuM2SgM436KButerfMsS3rzVUxsDwt+4bn+q8QQkV3252N1nY+/OxUt4cU
 7pB1EUdyYOH5CoYfTaCLaYFxnsphzy5tA73T3QPoBREo5msnoVtk6YBMD8ix1vbR3SCgrDSKXeJ
 R4dcRNiz2Qr9m/dVSwmPVJWY6zbZCyNVG7v1kcNy687UUhUKB1DmitUb4OKsim+L3kQpY4kx3v2
 gLSrSkRfzj9VXQwPAJxaUHcoWM3rgsCgmTTFDFQux4xQGFqj+kFnCleLqpqD5Tn988iykvGe4zi
 xAopblSgghggdVJSfaOkW5hRzHKwz1hU/kCmeBj87khyiiJlqyNlN/rvHFfpFVBu1EhsmibUgJe
 aFpLCWLS8xEFQf7NcSF3xz6Sf6V2UnOaJI+A4pzeU2/u3bobVyLZTPFYLJU62qQSRKQ9tHRobKg
 WSOjiNhFaDdT2rmpkcaXgDqsM8mJeLrujo+
X-Received: by 2002:a05:6000:1843:b0:47f:cf99:b0bc with SMTP id
 ffacd0b85a97d-47fd2b32c4emr4426667f8f.38.1785501986017; 
 Fri, 31 Jul 2026 05:46:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd42d91bfsm4960391f8f.15.2026.07.31.05.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:46:25 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:21 +0200
Subject: [PATCH v2 22/25] tests/functional/arm: catalina: test TMP75
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-22-1266926ba769@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494709; l=3329;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=ltFXNfKtRdSz7pZKawpvHBeNBUB93gRly05M45TjzOE=;
 b=tHrrYgRR9I6PJxh5nDzHjisSEtq5C2w6lrm67jECcv5f1a9fyXZzlJeTukmMdq1nicwM/sEO2
 u8otAP8J9xlCwEoORAqad8zdqUf8UKgTHUmkThwy8WuRMkN7CpDtKlt
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.54; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f54.google.com
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

Extend the Catalina boot test to exercise the TMP75 sensor on i2c9:
confirm the guest exposes it through hwmon, then drive the temperature
over QOM and check hwmon reports the injected value back.

Address the sensor through the device locator rather than a hardcoded
QOM path.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/arm/test_aspeed_catalina.py | 37 +++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/tests/functional/arm/test_aspeed_catalina.py b/tests/functional/arm/test_aspeed_catalina.py
index dc2f24e7b43..b80b5fe92b7 100755
--- a/tests/functional/arm/test_aspeed_catalina.py
+++ b/tests/functional/arm/test_aspeed_catalina.py
@@ -4,16 +4,30 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+import sys
+
 from qemu_test import Asset
+from qemu_test import exec_command_and_wait_for_pattern
 from aspeed import AspeedTest
 
+# DeviceLocator's type hints require Python 3.10+; import it only when
+# available. On the 3.9 baseline the module still loads and the boot
+# test still runs; only the locator-based device checks are skipped.
+if sys.version_info >= (3, 10):
+    from qemu_test.locator import DeviceLocator
+
 
 class CatalinaMachine(AspeedTest):
 
     ASSET_CATALINA_FLASH = Asset(
-        'https://github.com/legoater/qemu-aspeed-boot/raw/a866feb5ef81245b4827a214584bf6bcc72939f6/images/catalina-bmc/obmc-phosphor-image-catalina-20250619123021.static.mtd.xz',
+        'https://github.com/legoater/qemu-aspeed-boot/raw/a866feb5ef81245b4827a214584bf6bcc72939f6/images/'
+            'catalina-bmc/obmc-phosphor-image-catalina-20250619123021.static.mtd.xz',
         '287402e1ba021991e06be1d098f509444a02a3d81a73a932f66528b159e864f9')
 
+    TMP75_LOCATOR = "/machine/soc::aspeed.i2c-ast2600[0]~i2c[9]~tmp75@0x4b"
+    TMP75_HWMON = "/sys/bus/i2c/devices/9-004b/hwmon/hwmon*"
+    PROMPT = "root@catalina:~#"
+
     def test_arm_ast2600_catalina_openbmc(self):
         image_path = self.uncompress(self.ASSET_CATALINA_FLASH)
 
@@ -21,5 +35,26 @@ def test_arm_ast2600_catalina_openbmc(self):
                                         uboot='2019.04', cpu_id='0xf00',
                                         soc='AST2600 rev A3')
 
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', self.PROMPT)
+
+        self.assertIn(b"tmp75", self.read_hwmon(self.TMP75_HWMON, "name"))
+
+        # The QOM round-trips below resolve devices with DeviceLocator, which
+        # require Python 3.10+; skip just those on older interpreters.
+        if sys.version_info < (3, 10):
+            return
+
+        tmp75 = DeviceLocator(self.vm.cmd).resolve(self.TMP75_LOCATOR, "tmp75")
+
+        # temp1_input reports the temperature in millidegrees Celsius. Drive it
+        # through QOM (units of 0.001 C) and check the kernel hwmon interface
+        # reports the injected value back.
+        for milli_c in (55000, 30000):
+            self.vm.cmd("qom-set", path=tmp75,
+                        property="temperature", value=milli_c)
+            self.wait_hwmon_value(self.TMP75_HWMON, "temp1_input", milli_c)
+
+
 if __name__ == '__main__':
     AspeedTest.main()

-- 
2.50.1


