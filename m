Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E799CC6B3C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:33:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIgp-0006Th-6i; Thu, 15 Oct 2026 06:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfq-0003Ba-0T
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:27:01 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfm-0003zG-2f
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:57 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so43904915e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060009; x=1792664809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T+aQuOytqkO9L6viQdmuDORw5uxFjnolQFIJ54bA1P8=;
 b=ho8dks8ynts3CWTD7UvJDe/0hUdgyiopWGh+HfGFxHrMMQTnFCy/ON6IFz99lguKYy
 QuuQkeIbcW7J0AJQNDgJuF+hlyMRMRNJ0UzxSu4l0dTicdCQ5l7g/HkyJflkDaMUtIiR
 kpAVjyyHtuTqqP36nR0DwVbv2F4KwXvXUE6ZmcyHR8917k1fAeFmM80jmQGLelR4y+WV
 /ByDmNvFPA8r3S+Sx5k2iqaKrIfeXzgOSZbVFUWB7YfmEIbgfSR4GEDFlHMvJEqe8XbP
 22rwLQ039Zs0ghQXoiOR/6Bu6xu3URzF2mJ7gLTHA5O5Fh1q3m7Sft271ThFD1HR2DPI
 u3HA==
X-Forwarded-Encrypted: i=1;
 AKwUvByVndwxjRkuCYvOadufRRd63NYOWN5A6EulJyR4TY+AUnBBPud0kwtdYVWjCZDp+YFh4FQHexeuQQ==@nongnu.org
X-Gm-Message-State: AFq9FYIV7Hd+nizvV+otumPiCo12MvFngAm95EhGLLhqfYNyKgc8lZHh
 ewfC9G5eGZL/17sJGasiDJygxRxCrJbi3YQETv9xbsosXVildBkjnOMv
X-Gm-Gg: AYBFou2ABcsR8TeuwIr6KGubprq41u400qRf8UhOfYKSuKfSY2/WfNJNYRkXvKXpRBo
 OYV37aUHxbQP4VMoUMDl40WFd0WGuh5WtWCwOttYzatRauS87254mbWnVLWuZXDQanhidE5byTX
 687/rKOsCdEIqU6ZX8Vne97A4DaW41+Ti7itWdaNMxbx+OQzsEzaEvwFaX8n6D6Ae58d8ZvQ20o
 xPEMUYzGJwxDsKIkyRTOas5ehFNwnCgmiVQKe1Y6bTEUjZileCZljzYiEG9N9U2YJK7ITB0/Vd4
 cGRJEKOfG2o6hHn2173HrzAipxKAquEPuWJjjKil1iGf6blTjCLZUbTNVsxkaHZjJk+IZtK8PjA
 K7RzJHfwyogD4GpEQtjMtZTcy6YLHh94NCxyjUOEoz+PczCynkYzhTy059BG+LJxc+CqtCXsg63
 eAR8j8mE1ikg+TLJFRQvvNbLVESFGN+8nX60VX2Plz6kO74XTjHakgiRgUib5Zc6qSbnzzAajza
 nZyLlE0CHnB9k6V2GlZUROmZocYLFhs9q9G+uTQSel2BA==
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a18e4c9944mr370499565e9.30.1792060009306; 
 Thu, 15 Oct 2026 03:26:49 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd993caesm121133065e9.12.2026.10.15.03.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:26:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:11 +0200
Subject: [PATCH v3 24/50] tests/qtest: ds1339: cover power-on defaults and
 reserved-bit masking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-24-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=3431;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=4kpdPaxvZVkT90Xwee/1AVTNKhV96yGus/onpPPZ95Q=;
 b=i3Tm8leRLj5bP7SHK5ToXEEgS5s3WTD7f43095ebsS1hBelVa0cpcDUuTM0EaI9F0Q8wG8ZQy
 UvLwr0l3A4AB4q+6NJQNd/wdwF8J7p+WoZJQB/I0Ipfy8Z6IYqUgPvC
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
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

Neither the power-on defaults nor the reserved bits of the register
file were pinned.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 08fc16acda..e9dcdc36da 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -74,6 +74,53 @@ static void test_osf_write_protect(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
 }
 
+/* The control and status registers come up in their power-on state. */
+static void test_reset_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0x18);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+}
+
+/* Neither the reserved status bits nor the alarm flags are guest-writable. */
+static void test_status_register(void *obj, void *data,
+                                 QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x7c);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x03);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0xff);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+}
+
+/* Reserved time-register bits read back zero even with the clock stopped. */
+static void test_stopped_reserved_bits(void *obj, void *data,
+                                       QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t all_ones[7] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+    uint8_t resp[7];
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    i2c_write_block(i2cdev, DS1339_SECONDS, all_ones, sizeof(all_ones));
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[0], ==, 0x7f);
+    g_assert_cmphex(resp[1], ==, 0x7f);
+    g_assert_cmphex(resp[2], ==, 0x7f);
+    g_assert_cmphex(resp[3], ==, 0x07);
+    g_assert_cmphex(resp[4], ==, 0x3f);
+    g_assert_cmphex(resp[5], ==, 0x9f);
+    g_assert_cmphex(resp[6], ==, 0xff);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -155,8 +202,12 @@ static void ds1339_register_nodes(void)
     qos_node_consumes("ds1339", "i2c-bus", &opts);
 
     qos_add_test("time", "ds1339", test_time, NULL);
+    qos_add_test("reset-defaults", "ds1339", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1339", test_control_register, NULL);
+    qos_add_test("status-register", "ds1339", test_status_register, NULL);
     qos_add_test("osf-write-protect", "ds1339", test_osf_write_protect, NULL);
+    qos_add_test("stopped-reserved-bits", "ds1339",
+                 test_stopped_reserved_bits, NULL);
     qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);
     qos_add_test("block-wrap", "ds1339", test_block_wrap, NULL);
     qos_add_test("alarm-registers", "ds1339", test_alarm_registers,

-- 
2.53.0-Meta


