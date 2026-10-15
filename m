Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4782BCC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIgo-0006O1-Dw; Thu, 15 Oct 2026 06:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfP-0002g8-9c
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:32 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfN-0003w8-7n
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:31 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so40038395e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059988; x=1792664788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oYoBAtb0sGasvrkB8IWuXlvz+SK9VWJjTLvw46YHTLI=;
 b=AKMcHA0TcZuYStSCBS64vAfTIhWpECVf5o5eJwu1dvNvOAq+SK17BjTPTbQMRb6XWT
 DdAt+VhjGUh/wrg6ujjdpr4C1HjwQ5H4D+HqrbK8G6FP3ouERqDJ4UNsxjBNEj/YYYJo
 8HSRH66LRj6uUToF9f8fF9tiDHFKhxbNTw+ug0rhZXDUlGxsu0y31BKAjI3QE746ZR4L
 9nDCOy8VLcX6IZYx54SXiziVWNoFlR4cuWGVNULb46iXENFTsA9RRvbgZNp3wCISVeWm
 bpV7p1+67CCLh1ePhQ1xrvTMIwNNhX2qTrdZbKNfEoToAIMfTYRhDgCQrauiCr9WqIFJ
 3GRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxw/29N26sxKDexiRnhizbkGbHnHISvimVWCv8dNADCdp4p1O64Zi79Ll/z9+MSQk2OkGkvFCzgvg==@nongnu.org
X-Gm-Message-State: AFq9FYKlzoLUwR9i2dpBqWol9BuJ94D0yKWZRDBU4acbnR/mKHo19yo6
 Lz83YMjfFcGIPD3SV04fXLGADM0rgS7Z9/UpoYA+Wv9QIujdJcZXMhHu
X-Gm-Gg: AYBFou3308YgEWPbilQdqC5VnxswQnw0kY9SJjvCysBxr4cTWJzV8qqBBeNmgsbWlcY
 yN0VQCDpXxL3tdImHzeSOYM651nUU9xRuxxfZiVrTVg2o69z97MuGXEKPXnCF8DL/PI9BMAgGHE
 DW3JD/atkurBObWdmplSxhTUJOZuA+FwNlkJre9JxRkEIIpaAIP0NpH6AoOG1afgEQ9twvkYruZ
 NKwsaqacrhSFmliyKuuNJR3smNps+S/erPgW9fz95E9FWwmmP+ZKO4IH3lf5zR+Bnt/eHKDmMI5
 RSSRh8Yjih1HJFlRVfzZAwDQt8rwrLoglw7wLSxCO2zmuclFUSIYCsAw1MXmYdPUOTDEBozt+y+
 QxgoizpWVaXcE37CKdxLdRTwQ/PPCbf87m9n15zqEDPwbq9nQdzTFShMztqMspwSsGVeKv1+vhq
 NMMqdKYpfAb78C6xg3QHGurkJ8+Zz+lzyI4FW5prDH1iyOFvHw5SSJ/ltQUqb6vBtgy7CbAKIz0
 /lAk8Dbx3qkYvBKVSV7ZLBoL+Br4YPOXde/bwsCndi0RA==
X-Received: by 2002:a05:600c:e558:20b0:4a1:946c:953f with SMTP id
 5b1f17b1804b1-4a1946c9744mr194405325e9.20.1792059987590; 
 Thu, 15 Oct 2026 03:26:27 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac4f65sm18038435f8f.39.2026.10.15.03.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:26:27 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:08 +0200
Subject: [PATCH v3 21/50] tests/qtest: ds1338: cover the reserved bits of
 the time registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-21-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=2167;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=suWA8DePj/ePX9LP9LtQ2tCEt/OdWCTqNVEUhuz1G58=;
 b=+ZuLY7a8CHeahUH1ED4xvngjh43Dac+KT7VlkbboLvKBgSPq8/FiSa0jiHbeMo7XjKIM29LCL
 8x786UP6CB0BiLQiehgRgXYE0SDpPlf84NxO2RcEu8PfI5WULukX65L
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f47.google.com
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
2.53.0-Meta


