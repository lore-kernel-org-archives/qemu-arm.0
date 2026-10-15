Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29556CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN8F-0001cC-HP; Thu, 15 Oct 2026 11:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8D-0001UV-1y
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:33 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN8B-00021E-AZ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:12:32 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso20949545e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077150; x=1792681950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MoxM5c4druc6hrP13chgHZYE5IKLOb3cz4rjvIwFDIY=;
 b=oxnheZ46IgF6rSb0WhF0rB2Tn5+NpwUsN5Lr5sL3btjeinjvmRPFzZyRT7JmfaugkD
 yQpNBvfOWHZ4dOyRrfZlVSd+i2rGe/zf5rLQl7KhHpUO4OGVTgTFpPE6A7PDpFE3bJge
 kwnQ3QZ9qCZtv/O+LTHCU65HYgz8iKppjMZwqcO7qXEacpq1Z3TJk+gWTeN7jTLOJPWN
 r6r444aE/Jtp7syBUfglYzqeXgEs7umX3ctx5U5He1/8VcRbJ9yk9ytA3SfSNc/Yw9FR
 X2Ib4HBpa45WRiu9pFVLAYG26m2qkO9RYjqesdhuaKsv2C1BZm3lpF6lqyfjjF2NGX4R
 7fhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAkSIb/lVyEZ0DOMgXjQaDSxhqdCvy1bmYQYuDGA/ZkTqQBM/CqdkWEF6qMM0KPD3eM5cN7TAruQ==@nongnu.org
X-Gm-Message-State: AFq9FYIZbqJzOHQWmzaptRjzmghozr/bAmOKLT+4JjsRq2EM0d1ZkVCx
 jZwxxLJ4TTDY76UAx9AX9b9GtGOCN8M2Zo4cJNh+pvmHJj+3oiLu29Ks
X-Gm-Gg: AYBFou0XSTZAWLj7PhccoiMtGH1sUlmRnM9ssEN16DypCq9LdBJbSVsNHzZZh5ZnNsb
 qK40vtfSt9A/vRDO6RI3JbeYY3XFf2tWRZSCURAGeGpt/uRdN7c4EeqDxdTGmGgY3ERWnixmH0R
 uZLVheHHf1oKypctsiB7m57XRdl1EKRgw81ok1U+VDG7KXVW9bVPG1Mur73VC6PvUW0XivtKL74
 JPjFKwDl+Lac6PSTValm/wvUtNsQ0AF9uUBT8EcBJ8S0M5bV9XvZvpK/OhD6o4dtWAUL4chnKJl
 2MCAhor6o48yeUr/ZbflSLxpeEgxplIEdOD3kZwb7rU0WJqk3hI7grDqEMeJaohDNRfivrJhHM1
 VzgIMCZNZThlHB3IoXvh1bStS5efn0x7gLPHOh/SSqgF1zW+2taMH50CmS+vYoqjV88LIjjr2l8
 12aTHZfHxvkp/J/AeOHCS+BRm6DAl/zQwLyxZxvWkm/q2SKVGDl0Y08xT41x4s86XQWYnE5qjUq
 /KQVbBNk7i4o0VU+VSikrEkKLHb3XkbLvf/CPVG2DIizazBhjmjqbrqPg==
X-Received: by 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4a18e4d5a01mr390564975e9.32.1792077149604; 
 Thu, 15 Oct 2026 08:12:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd97349esm77362195e9.3.2026.10.15.08.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:12:27 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:56 +0200
Subject: [PATCH 18/22] tests/qtest: tmp105: cover the TMP1075 device ID and
 reset defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-18-bf591886b5b6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=2634;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=C0jpl30ify3Wt49PXTihQ8qoGkN1Yk7KjYV9D5fof48=;
 b=W24LohWIJn07GlvfAC0K6rkgtEfFAmB3SfjBgLVXcHNKvDE0iKAavzWFUiik5ERvdx6qEtuPM
 XCiRz4PcdFUBITs/sREfYhzKoQjX+zMN/vpcaVOFjiEf0+MrHWKpAwt
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
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

Add a TMP1075 node and check its power-on Config, limit and Device ID
register values, including that the Device ID register is read-only.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index 504f6b7202..426c4f9ae7 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -28,6 +28,8 @@
 #define LM75B_TEST_ID    "lm75b-test"
 #define LM75B_TEST_PATH  "/machine/peripheral/" LM75B_TEST_ID
 
+#define TMP1075_TEST_ID  "tmp1075-test"
+
 #define TMP105_CONFIG_POL   (1 << 2)   /* ALERT active-high when set */
 #define TMP105_CONFIG_TM    (1 << 1)   /* interrupt (thermostat) mode */
 #define TMP105_CONFIG_FQ_1  (0 << 3)   /* fault queue: 1 consecutive fault */
@@ -419,6 +421,26 @@ static void test_lm75b_shutdown_clears_alert(void *obj, void *data,
     g_assert_false(get_irq(0));
 }
 
+/*
+ * The TMP1075 answers a read-only Device ID register and powers up with the
+ * modern reset defaults.
+ */
+static void test_tmp1075_device_id(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_CONFIG), ==, 0x00ff);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_LOW), ==, 0x4b00);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_HIGH), ==, 0x5000);
+
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_DIE_ID), ==,
+                    TMP1075_DEVICE_ID);
+    i2c_set16(i2cdev, TMP105_REG_DIE_ID, 0x1234);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_DIE_ID), ==,
+                    TMP1075_DEVICE_ID);
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -475,5 +497,16 @@ static void tmp105_register_nodes(void)
     qos_add_test("limits", "lm75b", test_lm75b_limits, NULL);
     qos_add_test("shutdown-clears-alert", "lm75b",
                  test_lm75b_shutdown_clears_alert, NULL);
+
+    /* TMP1075: 16-bit Config register and a Device ID register. */
+    QOSGraphEdgeOptions tmp1075_opts = {
+        .extra_device_opts = "id=" TMP1075_TEST_ID ",address=0x4d"
+    };
+    add_qi2c_address(&tmp1075_opts, &(QI2CAddress) { 0x4d });
+
+    qos_node_create_driver("tmp1075", i2c_device_create);
+    qos_node_consumes("tmp1075", "i2c-bus", &tmp1075_opts);
+
+    qos_add_test("device-id", "tmp1075", test_tmp1075_device_id, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.53.0-Meta


