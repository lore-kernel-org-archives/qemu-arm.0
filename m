Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8635BCC6B3D
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:30:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIiL-0008OY-6A; Thu, 15 Oct 2026 06:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIg8-0003gG-4m
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:27:18 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIg5-00042u-29
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:27:15 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48de6a62a4cso2186402f8f.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060031; x=1792664831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Adz/rIkVxKmnpzPklQqKGWWgHGHy0e2h5cr4SvKWE0I=;
 b=WN2jB8GtSBjw3fdMG5HDy7HLZhUBJ5eGCTSLCT3H0YA4txFnQa7XjXBYyWWwOw+DEW
 t2pCryTTDpyPl8W47FPlrJQAiDyTNwopbYxgXhvleJjSLaXg1CZ7nPOba3MYonL3pT6e
 CJPeqITI4Bp7Qv+GPpNsRcZt6deyCeA5ZatysdkZugEh4y02LuJUl3mTasY2XJEl/2iF
 Z1ksa9pqMQsq8AdGCWoZeExnuEFLByp9flmDOC/qp7VYET+0dH0q2rsJqGeBDbKMwZX/
 wDcplGPt1klYeecjw8MokMgAHD2Z291IfdDVKF53mF8llCIxHzx3eVL0Co5Vyhrfdh23
 Y4AQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzyzOgNkN8l6imv84dl+nEGs2sBiI3NuofP6qh9iGqo+Lcp0j6OJh7IfgjNVNN9F/imrF3B9CGaXg==@nongnu.org
X-Gm-Message-State: AFq9FYLabFo6/wsAH0DdbBTDxY9FMq2g0iYE5FwnMcrVXgfH5sLNCOM/
 WLNDVHQZam1LbraHMywBcH4oC2FXMLVU9xHzHEgkaZB3UYiDxV2X/Q6x
X-Gm-Gg: AYBFou1xA2S/+6RCIavOM8wI00Heg310B6lDYKmzunMrcQhjZc2m989HkWpGcgu17gd
 z5bI1KBhc+TtzRvK8EPlmedt7H9ADoJ/2fiUtUX9myUU89K5aYBEZgbZsNXVt+YMZNf97gN/Qug
 1nflk1Cp4W5yLJwEv4b3FunSasMaMF4eBJ4MZ3L0jpFPwaRBfYhPA7L9n4if8+q3Me8l8nfYQqO
 DadFEtGp9qXyXZBCMHH1Y1HoaQyA6LVa4S25AZuXI+nj/SkFe/OUpssqZD3b6lqv6HZ5OcZoOEP
 Ctqdnv+K6NSAmFPWz0Q7Lk+6a3CFeBlmn1qHQ4shJKGiOb2HP/Z41Lr9sjCbB122VR5G19iwnFy
 EHqVYVBZjKXQAvuuZ6aAtPnUv0eAyhfbDY9/hnMWDGBrmKBeX5t61jVAZzLMplamye67loPjsGn
 t51Qub0DSKMdJjGmRIcFKtaXswGkLpiXJCLGbdMGi2V6vq2zdNQwhIO+TiDbr5rNPFtM0cwLpUi
 FyVJ5buqh9HVeXQi4DtCWun3hvnhR5p5SCdcvvzcldhhq6KMiBFuqR0
X-Received: by 2002:a05:6000:29c3:b0:48c:58d5:30fb with SMTP id
 ffacd0b85a97d-48dba7876bemr24188526f8f.5.1792060031108; 
 Thu, 15 Oct 2026 03:27:11 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de77606fbsm10342203f8f.53.2026.10.15.03.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:27:10 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:14 +0200
Subject: [PATCH v3 27/50] tests/qtest: ds1339: cover the end-of-month rollover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-27-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=3758;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=iOwmzyJ4hd6oW//GUNriTfBTlQKKZhGGR+JckreHq5Q=;
 b=uxSFlsTndJWAU+VPfl1yjgl8aVtXUmBtubp9+4Jp1uqFi1hFBfQRZpUH9kBOP8Xnwc2ij/lVJ
 cCNMQq/lYArBN1yCWGlW+Y29XlcdyLB/ttRNr8of89Ecp+8nDh71DoG
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
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

The end-of-month rollover was untested, for any of the lengths the
calendar gives a month.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 8c144579e6..7eec163049 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -14,6 +14,7 @@
 
 /* DS1339 register map */
 #define DS1339_SECONDS   0x00
+#define DS1339_DATE      0x04
 #define DS1339_MONTH     0x05
 #define DS1339_YEAR      0x06
 #define DS1339_ALARM1    0x07
@@ -169,6 +170,61 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* Program 23:59:59 on the last day of a month and run the clock past it. */
+static void check_month_rollover(QI2CDevice *i2cdev,
+                                 uint8_t date, uint8_t month, uint8_t year,
+                                 uint8_t next_date, uint8_t next_month,
+                                 uint8_t next_year)
+{
+    const uint8_t tod[7] = { 0x59, 0x59, 0x23, 0x01, date, month, year };
+    uint8_t resp[7];
+    unsigned idx;
+
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_DATE) != date) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[4], ==, next_date);
+    g_assert_cmphex(resp[5] & 0x1f, ==, next_month);
+    g_assert_cmphex(resp[6], ==, next_year);
+}
+
+/* A 31-day month rolls over to the first of the next. */
+static void test_month_31_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x31, 0x01, 0x23, 0x01, 0x02, 0x23);
+}
+
+/* A 30-day month rolls over to the first of the next. */
+static void test_month_30_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x30, 0x04, 0x23, 0x01, 0x05, 0x23);
+}
+
+/* Outside a leap year, February rolls over after the 28th. */
+static void test_month_28_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x28, 0x02, 0x23, 0x01, 0x03, 0x23);
+}
+
+/* In a leap year the 28th is not the last day of February. */
+static void test_month_29_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    check_month_rollover(i2cdev, 0x28, 0x02, 0x24, 0x29, 0x02, 0x24);
+    check_month_rollover(i2cdev, 0x29, 0x02, 0x24, 0x01, 0x03, 0x24);
+}
+
 /* The Century bit is guest-writable and survives an oscillator restart. */
 static void test_century_bit(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -314,6 +370,10 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("month-28-days", "ds1339", test_month_28_days, NULL);
+    qos_add_test("month-29-days", "ds1339", test_month_29_days, NULL);
+    qos_add_test("month-30-days", "ds1339", test_month_30_days, NULL);
+    qos_add_test("month-31-days", "ds1339", test_month_31_days, NULL);
     qos_add_test("century-bit", "ds1339", test_century_bit, NULL);
     qos_add_test("century-write-no-toggle", "ds1339",
                  test_century_write_no_toggle, NULL);

-- 
2.53.0-Meta


