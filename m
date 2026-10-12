Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FE9CA9EDD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHj1-0002Yh-Ns; Mon, 12 Oct 2026 11:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHiv-0002Xe-Ll
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:13:58 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHiu-00085F-0T
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:13:57 -0400
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so1082070f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818034; x=1792422834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m2GA4fazsDlog1s+fRBtwXY8L09cn4aW6lhQjZ5SfME=;
 b=QweerGtIBJIRANcD4RZfJutJDhizE4dh0lXSK83Sov2ccSS3JQirwPJR4510ZVadxp
 X/xdMaYEZ7qCXUq/jThz8FDbl3828HqXlB6DynkslDyi+8CZs5sb1xBvyJ0DMJ2WrC+f
 JXhDOu6rfqXHKCwxIAAA6VLkiQAEt6iUA1m242o1A1y6/zQwiN224+Eo6SoYMoetO4jM
 sXQvPWgsYkdP5kWEcUqhvHUodvj9yDqaJGebmv3fmU/9ktm3ZVw6V4p6NVQs6BDsDK2F
 KzIeg79ZpF+I2YeW8Ow/taC28V4U28xAoCA2H1oZnuaJ6FxTaGU8/HUXbiQG+uGxR4eF
 VsaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBPDM1yGwExGcRetYE0eEYmYH8HBWeUhm00y0oJezikpiMGy9m/c4B9enu0YPTBq1KjwPlI4SElQ==@nongnu.org
X-Gm-Message-State: AFq9FYJtHYeCwRWr7p28HH+DxpJhx1t7yE92vCV7NOBg5USXKxvXr308
 gJs8+/my9nhoscOeoThCMLY1ayTIWKBHoZuTJS6lck+XmCQjTTmmOBZD
X-Gm-Gg: AYBFou1o+ZT3JtjCvr0OhaxaGOA8VIwBPS57zW0lia3Qlf5iJ+SnCD6HdL08gdfl5u4
 cp4lRjcql2noEj3IPGJdjxhhMw0g3Y6VRZcP3D1ufk/NXW8IV0VDJVjIkR3w3+o8KzR73fXxITa
 cIDg2+LiOn0kISs4N27F8ppdiT5Kbo7+IcPFt40igKTbLoVYFXDxrH75tYBYJIB0ZcjVhoFteNi
 9H8bOf9kg1w5VpPbAHElVJUYVWWVtRLQx78O7D+Vevmt6Ud5ZwuUOVg13T8jgCzd7pr/3jPO3By
 1qtT+HMwbiIfwH0OS0E92oGqS6DwRbJgYU1pnjeUH980Y9lXZk8YLtyu7s8pvFFzRB9PJFXiMvq
 QVwx03Gjy7UT9bf9VnH2vtQFd7dDTrXPAg5Dr05dQdzj1vAYYufAgomYd9oZi1oH0DRSXwugTl9
 dCVasKz0dS95mXK0jF4xlbAfnZg8DZvdNepFHRgKL7vTdxz2BqSm2FLYHtwlQU1JUZU0C21954V
 qiiSTJ0OU4vW1ERbNrexDhxSq/hkHhpJZ6t/5cxV6GR8A==
X-Received: by 2002:a5d:59c5:0:b0:48a:f592:fb63 with SMTP id
 ffacd0b85a97d-48dba7bea5dmr18541428f8f.1.1791818034234; 
 Mon, 12 Oct 2026 08:13:54 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0514ab1sm122891f8f.0.2026.10.12.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:13:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:14 +0200
Subject: [PATCH v2 21/50] tests/qtest: ds1338: cover the reserved bits of
 the time registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-21-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=2162;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=KJY0zIrKxG//LL1WKd4K1qyh6CHHxQ+6MszW1XMqpgc=;
 b=1iKV0oV3yRvjn623f+4E7dwXeJvrn/Atpfy20ZcQS0vfIIs2QwYrYErpilCTCDogvTZkW0I7j
 s42MtSTZ0vFByJP2wL5Ur5U+fqT3yfRebJ4WUolrZbgU803kZn3A1Ck
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

Nothing pinned which bits of a time register survive a write.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index 1b9c02d931..9e2e257307 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -125,6 +125,26 @@ static void test_clock_halt(void *obj, void *data, QGuestAllocator *alloc)
                     ==, DS1338_CTRL_OSF);
 }
 
+/* Reserved time-register bits read back zero even with the clock halted. */
+static void test_stopped_reserved_bits(void *obj, void *data,
+                                       QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t all_ones[7] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+    uint8_t resp[7];
+
+    i2c_write_block(i2cdev, DS1338_SECONDS, all_ones, sizeof(all_ones));
+
+    i2c_read_block(i2cdev, DS1338_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[0], ==, 0xff);   /* the halt bit is writable here */
+    g_assert_cmphex(resp[1], ==, 0x7f);
+    g_assert_cmphex(resp[2], ==, 0x7f);
+    g_assert_cmphex(resp[3], ==, 0x07);
+    g_assert_cmphex(resp[4], ==, 0x3f);
+    g_assert_cmphex(resp[5], ==, 0x1f);   /* no century bit on this part */
+    g_assert_cmphex(resp[6], ==, 0xff);
+}
+
 /* The user RAM returns what the guest wrote to it. */
 static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -207,6 +227,8 @@ static void ds1338_register_nodes(void)
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
     qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
+    qos_add_test("stopped-reserved-bits", "ds1338",
+                 test_stopped_reserved_bits, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
     qos_add_test("reset-clears", "ds1338", test_reset_clears, NULL);

-- 
2.50.1


