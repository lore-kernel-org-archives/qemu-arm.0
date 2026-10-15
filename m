Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29AFCCA463
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:16:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN7r-0000QK-EG; Thu, 15 Oct 2026 11:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN7p-0000Je-Fl
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:09 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN7m-0001wB-Hw
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:09 -0400
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso25054215e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077125; x=1792681925;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ElO83exPm/Nk9fwRFrC4lA4TMItjH/WcdCQDoITT8Is=;
 b=DcpxaQsfm6ECcb+8xKpQLOva6uUN8/yTVbXxS2pF6k/RkS7o0NVcR+jb621dGAwKEv
 ZWN8dZ9gGNlneQt4OOtUauCPKYMjRFErQEjlLHa/GRwEP2GOfK7DhSKEm4Gg7VJzG+2g
 0kMVCer0bAoTwqo7fryQ8UIbt1A8/+DSf+nWaoFr0LSbxvLxA5pKBtNhoBs9AJoqrmbO
 ZoPkB8CNOVyP5R0JZfkL+5jRNJs9c5pnpTQ+B8/G23Hc2LewciW6Vk3dIMgtvbh4vatz
 kBINo6EydLM+m+Di50IfLAYhk6+4FnbktqNVbO5ZyUJlFAvs53LTkgROU2GeDcePKtGa
 aWuw==
X-Forwarded-Encrypted: i=1;
 AKwUvByOvK/JgEL3CSBUI1Xg+fGgSKgV1ugw3Gw9pjH/3QZprRk7EiAwILlemf+1dyGciLCzjJuF3AXyRA==@nongnu.org
X-Gm-Message-State: AFq9FYIF1amaNGDwOTzIO4J6iGDklB+fVgyjRa6OuKWuyIVtQ0ysr+fG
 wIW5vgfsutqf4REzOa+pJP2uBOHqn5nnEtTWDq8Nr3N4vyNfXWfjAN7o
X-Gm-Gg: AYBFou3xo6+QuCm2hjbxejQgy3nG5SqB7eoUw48JOozlpbA4DTvMFajmfodH2Bb1qW/
 ++8+EG51njuB71l+eM6yggMCj+/j4vyfNRsIdjYOM4k9SfnNz8vfAjw+88/CRegyIDdTFNVLZ63
 IgUgER0C1gUlH54yRp5bIRYNyswNPA7AsVnqH0B0XgyUjCXLZHf5RJfPiuCzexJCoOeh9/7Bw2Y
 JrMN16bripEzp1MXkAxNflUjpRguGPHoYa/+dis6qpKzNM4GMhpg+YpKU692sXNg5dE+Kmpbxx4
 tGtf1cE/i9lnMJM+21Czt7GwuINEtRB8OkR6Gsh6mrIlIPUMFHkS13/iA5qDC1HSdIZsYYZxpYk
 tjjdk2MoC3q4ZCrm8JdmlvOE3iWqryxUX3fqYMK2eFjnf96C4dMci51ubNMhWfr2D8rdc2PfOKI
 Vhp8B0NobuH2xNkS/DlBxw4cLxKTm1jq9EQAgpQ4Q53L2Ur3RNcGkncKbyXAn/fbSEtCfov/Rka
 mG+DPAjuzb8u/j/Yoiei7Uwng0qMBlzwDI0YNhKbmbMyA==
X-Received: by 2002:a05:600c:e547:20b0:4a1:946c:953d with SMTP id
 5b1f17b1804b1-4a1946c968cmr237610795e9.27.1792077124678; 
 Thu, 15 Oct 2026 08:12:04 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd69b2a3sm7488065e9.4.2026.10.15.08.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:12:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:53 +0200
Subject: [PATCH 15/22] tests/qtest: tmp421: cover software reset and
 N-factor registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-15-bf591886b5b6@free.fr>
References: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
In-Reply-To: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=2952;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=sHWJWSoGggCvrRbUN63qwoGmhhEQg3PCcE0NhyHKFWg=;
 b=DLjlvfZDbHQTytD6VL0ThDCgH/2DbYIwU81mWZhmGNuGZM1/JxPZ8kVvU0KYiGBZp5X+xfY0V
 I+9Nu0aOQ87Aj6FvQACjVlqqjroxrI7OIvnyW1NWZiDc0dszEZiz1wY
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f44.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Check that the software-reset register restores the configuration and
conversion-rate defaults, and that the N-factor correction registers
are writable only on the remote channels each variant provides.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp421-test.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/tmp421-test.c b/tests/qtest/tmp421-test.c
index 04f9252188..6c5332211b 100644
--- a/tests/qtest/tmp421-test.c
+++ b/tests/qtest/tmp421-test.c
@@ -25,6 +25,7 @@
 #define    TMP421_CONFIG_REN              (1 << 4)
 #define TMP421_CONVERSION_RATE_REG      0x0B
 #define TMP421_TEMP_LSB0                0x10
+#define TMP421_N_CORRECT                0x21
 #define TMP421_RESET                    0xFC
 #define TMP421_MANUFACTURER_ID_REG      0xFE
 #define TMP421_DEVICE_ID_REG            0xFF
@@ -191,6 +192,38 @@ static void test_channels(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0 + 1), ==, 0x1900);
 }
 
+static void test_soft_reset(void *obj, void *data, QGuestAllocator *alloc)
+{
+    const TMP421Variant *var = data;
+    QI2CDevice *i2cdev = obj;
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_2, 0);
+    i2c_set8(i2cdev, TMP421_CONVERSION_RATE_REG, 0);
+
+    i2c_set8(i2cdev, TMP421_RESET, 0);
+
+    g_assert_cmphex(i2c_get8(i2cdev, TMP421_CONFIG_REG_1), ==, 0);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP421_CONFIG_REG_2), ==,
+                    var->config2_reset);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP421_CONVERSION_RATE_REG), ==, 0x07);
+}
+
+static void test_n_correct(void *obj, void *data, QGuestAllocator *alloc)
+{
+    const TMP421Variant *var = data;
+    QI2CDevice *i2cdev = obj;
+
+    for (unsigned remote = 0; remote < 3; remote++) {
+        uint8_t reg = TMP421_N_CORRECT + remote;
+
+        i2c_set8(i2cdev, reg, 0x7f);
+        /* Registers exist only for the variant's remote channels. */
+        g_assert_cmphex(i2c_get8(i2cdev, reg), ==,
+                        remote + 1 < var->nchannels ? 0x7f : 0);
+    }
+}
+
 static void tmp421_register_node(const TMP421Variant *var, const char *type,
                                  uint8_t addr)
 {
@@ -207,6 +240,10 @@ static void tmp421_register_node(const TMP421Variant *var, const char *type,
                  &(QOSGraphTestOptions) { .arg = (void *)var });
     qos_add_test("channels", type, test_channels,
                  &(QOSGraphTestOptions) { .arg = (void *)var });
+    qos_add_test("soft-reset", type, test_soft_reset,
+                 &(QOSGraphTestOptions) { .arg = (void *)var });
+    qos_add_test("n-correct", type, test_n_correct,
+                 &(QOSGraphTestOptions) { .arg = (void *)var });
 }
 
 static void tmp421_register_nodes(void)

-- 
2.53.0-Meta


