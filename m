Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D95CC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIgJ-000441-FT; Thu, 15 Oct 2026 06:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfE-0002PR-Tp
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:22 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfA-0003ta-Tt
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:19 -0400
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so42696365e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059975; x=1792664775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QSX7oFL3j7413Q4nQT+SGQuVL91uJZdU8V0ijp2OEps=;
 b=VOuGiazfUNZ8wwx5U9sDDglnaZ9Z59YXwc0YtHM6quFECC5jElVzXUh6M3Jf94kjHh
 cYHyAVFvf2G9C7JkMEL87jBCNHX4G03BIeXblu76EHED60n4aq1bkui7fTJdbq0zZQvq
 75CC7lTi5osSBCKU86vlDBYQhy7w9in86QwdcnFMOyHB0iahm7dKO6b/KkkUI99h4lFb
 /XiBrvDkRp6eIx/RLTI7J/UdKIn/Msl8kPWXLx9RfPboRJGU2q7gqe7UtUbkEHw+lVdT
 eNEzHPHmCpPA0gQWfCWS5ljkVNpZy3wESbqKYNFhENLLQXWEA0g44fvXmMzF/wPlwMOp
 58PQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzWYjiTsCqOgOIREboKBlinZtckbBnk4KYJHQxLCfe1JHsFjO7WRoUIfcDWUHgUXDhUTniTgzEWeA==@nongnu.org
X-Gm-Message-State: AFq9FYIDSOgSuYeW5BzMtCzGHk7NzwQoOVjYb6FaPTV2jG+y0b88DkfU
 rLFaXYQabxGtTjo01IXJZcPqgQNyRUbF0cHZfgzf20ZoH19y13En1xxA
X-Gm-Gg: AYBFou1leuYwIe/QdDgPcT6g/X4568VQ3BFw7hYXY42mvl9h7LT4NYhZQ8CQK9+gxIY
 tNTWyoRum8kCCjb0/T3vrHbWtpxV1C3G/epo+ViF6XOToNsL/JQypeapWV5+PXVPCe7qgsr13i+
 qFhSWy2ok30necxbZN9bewIrZaiSZSKrKzB5QHIBCkpc6fdMqOvj76Pj5tNkzXzeYqJ1LoMm6sA
 q/MgtZLxV9dM4qjyeW7DL7jKDbbnqUJ99mDR8BBgoePokP7WI3iJZlqx5BLxqZhfhhfuwgR9HwK
 9tbmv9Lnn91IJ+BL5bvWHHlckyp6Q4hE/eDn5e8f4ikUsqGoJXGjS6T8MDBUuk10hXnNIQIgoLE
 KA18Of9rjYw1mrO2sMZOxEAHS7tIn498V6Q8P+S14i4gkL9Jl4MSsRqzNX/ABwYEDaC3B0ETXho
 59VafnGupNnkrYG9agePN/Wl3zUw8LolUGZdMiu3JPRaay0cVOCGvYTPvWGfJ9asPO3q6Jcrhx1
 alEJ8k0jFKkx5eOBmgX/SQ72AU2TmmGl2rO2m7Oxh3m5Q==
X-Received: by 2002:a05:600d:8644:20b0:4a1:9eb2:b2a8 with SMTP id
 5b1f17b1804b1-4a19eb2b2dfmr181516715e9.29.1792059974927; 
 Thu, 15 Oct 2026 03:26:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd64b5e7sm59827875e9.2.2026.10.15.03.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:26:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:06 +0200
Subject: [PATCH v3 19/50] tests/qtest: ds1338: cover the clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-19-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=2998;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=ZuX+spACHMjQ3cHCqU6XOjJREiGhA+BBWl2nnVGddEk=;
 b=QvrwoeOUmFWDQQvXZbmJm6utK8KmIgrJuafMbJKRJTRRW6Fvu4kz+S++4Sg29UqtgHEB1SgZO
 lI7EXn1H/SvBJrwU9YRZSIl6j1hNjSt71ODsDWnKmbAuBJQ8bo9+w2+
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f46.google.com
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

The clock-halt bit had no coverage, nor did its effect on the
oscillator-stop flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index fad0ca53d4..1b73dca98d 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -32,6 +32,7 @@
 
 #define DS1338_CTRL_OSF  0x20
 #define DS1338_CTRL_POR  0xb3
+#define DS1338_SEC_CH    0x80
 
 /* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
@@ -85,6 +86,42 @@ static void test_osf_write_protect(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
 }
 
+/* Halting the clock freezes the counters; clearing the halt resumes them. */
+static void test_clock_halt(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t frozen[7], again[7];
+    unsigned idx;
+
+    /* Clear OSF first, so that halting the clock is what sets it again. */
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
+
+    i2c_set8(i2cdev, DS1338_SECONDS, DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS), ==,
+                    DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+
+    i2c_read_block(i2cdev, DS1338_SECONDS, frozen, sizeof(frozen));
+    g_usleep(1200 * 1000);
+    i2c_read_block(i2cdev, DS1338_SECONDS, again, sizeof(again));
+    g_assert_cmpmem(frozen, sizeof(frozen), again, sizeof(again));
+
+    i2c_set8(i2cdev, DS1338_SECONDS, 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS) & DS1338_SEC_CH, ==, 0);
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1338_SECONDS) != 0x30) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmpuint(from_bcd(i2c_get8(i2cdev, DS1338_SECONDS)), >, 30);
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+}
+
 /* The user RAM returns what the guest wrote to it. */
 static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -122,6 +159,7 @@ static void ds1338_register_nodes(void)
     qos_add_test("reset-defaults", "ds1338", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
+    qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
 }

-- 
2.53.0-Meta


