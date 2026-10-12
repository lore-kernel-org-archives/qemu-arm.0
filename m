Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C91CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:22:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHqw-0007kV-Ps; Mon, 12 Oct 2026 11:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHqr-0007fm-AG
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:22:10 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHqp-00010K-PE
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:22:09 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48dd33a7bd4so327020f8f.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818526; x=1792423326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xDaZUroT2n8sJrtLzMe0uCr4D4Xox3szI0g/uL81yHs=;
 b=pnUFlJJCWtvgjMdm97YrBmRNhcD1GHs/UusyW7ZFMbBPtc5XSob/G/1CjCBkvyLv1l
 LXwYaTO0rL9crjG5RiGorCgcnm3K5BiSqyywYZVDG+X/4vcHm8F/mw/yCyPxjnwS4qo3
 yhAvH3F7O04v72N321nFLiYL3yR96vgWj2Bln2EJwzqczaE6N1f/7CVMBlOuD6yF2pkm
 t3/SEY/nYCUSo67PSIVr7A/ySzVGoDSlhZERGFLnvi56MPpwV2eEw3XuILcvSHF+6RnC
 oyf/Czjg386oor5HNvx1FUogdR6M412ilD1I4ZR239ChG02AZ66iJihQJ/P/cWSHrdmh
 ryaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkJMeHw1M6sPAcIjikNvJYKEZW4lOeYXIRS9SNz3wbJAKABGdCQZIFideuAeiduwXiqjspn4/DwA==@nongnu.org
X-Gm-Message-State: AFq9FYLWp85X3diaxq5QloHTotQEHGPZdUSGBpxViQ6rCJ4HiftzPmry
 /756+ejwEjbm1yybdhRSulv7/dqunYn0V60hyLnuIqJLvKFjvouDBkyN
X-Gm-Gg: AYBFou21Kk1P4JNo0YErTuC9bl0TAeJK1eWiMQqgI0D8s1wIzoxFAa3JDX9JicfcKaL
 3UfapYswQ/A3ESZzKbPJtVEij6yvG6KCRDjhhuza9raJ0waFXOJgAqyqjCrKqPAuLHJGhw6BwCq
 cQcwiiz5vFjUaJb/JKMcgB1SPKvP3EPGHBIFWyIlBPMTiQw7iadpXK6n43raqle+LYSkMMrbK/j
 Kwh8wPKro9YCM+kpmLA2433EF87oxWuL/wX1OVWPleR9V9T/Lg7i3kfTOkX0eYk++vuzxhDVLgo
 iFxbXA5iQAwmrsQ9voNNVAx8dEHr2zQC3KSH1yRU5rCp6bdIivUopOeWi/p00F7K+wYz9QHoScU
 sA8aWlJL15KjwH3Fix0IBnXdMXSgHGfGvto/5G06qaMPlSdaO9E8yBn1bNqO7gYDl080M3IDDfb
 PhrzhKcqG5qlrT2Q9tCTa+wj1faovlI0BlydSYmYHIfzmg4zPP10mI5qdtKMH1kJTB9wzP0JPSw
 vl/5PQ4uN19ARca4iod1rrECxOiagLjOpqhXEOCWeo2vQ==
X-Received: by 2002:a05:600c:8709:b0:4a0:20c7:6d4c with SMTP id
 5b1f17b1804b1-4a18e3eccebmr193751195e9.0.1791818526154; 
 Mon, 12 Oct 2026 08:22:06 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc85b1sm8340f8f.54.2026.10.12.08.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:22:05 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:22 +0200
Subject: [PATCH v2 29/50] tests/qtest: ds1339: cover the day-of-week
 counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-29-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=2630;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=K9HOm83SsQOK9R4XDnsjhxDGcTLTCjXMrgk6bTqgUo0=;
 b=becHwSrqJhCcJAcvCpfFfr3igfA+ZHnrM6SShPCihQ1wDv3AdB0mXZW/d11ZJMqrAuh/S/IOF
 XBHKs7RokgPDlhEPwCvo3TG/wgfxZxNBZYRJDCMcpGRTBDEwfIBm2Zc
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

The day-of-week register and the offset behind it had no coverage at
all.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 3259fa1df3..12562eff5f 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -15,6 +15,7 @@
 /* DS1339 register map */
 #define DS1339_SECONDS   0x00
 #define DS1339_HOURS     0x02
+#define DS1339_DAY       0x03
 #define DS1339_DATE      0x04
 #define DS1339_MONTH     0x05
 #define DS1339_YEAR      0x06
@@ -174,6 +175,36 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* The day counter is the guest's own numbering, and steps at midnight. */
+static void test_day_of_week(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    /* 23:59:59 on 14 June 2024, the day counter reading 7. */
+    const uint8_t tod[7] = { 0x59, 0x59, 0x23, 0x07, 0x14, 0x06, 0x24 };
+    unsigned idx;
+
+    for (idx = 1; idx <= 7; idx++) {
+        i2c_set8(i2cdev, DS1339_DAY, idx);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, idx);
+    }
+
+    i2c_set8(i2cdev, DS1339_DAY, 0x03);
+    i2c_set8(i2cdev, DS1339_DATE, 0x14);
+    i2c_set8(i2cdev, DS1339_MONTH, 0x06);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x24);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, 0x03);
+
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_DAY) != 0x07) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, 0x01);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DATE), ==, 0x15);
+}
+
 /* Midnight and noon are the hours the 12-hour encoding special-cases. */
 static void test_hour_mode_12(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -414,6 +445,7 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("day-of-week", "ds1339", test_day_of_week, NULL);
     qos_add_test("hour-mode-12", "ds1339", test_hour_mode_12, NULL);
     qos_add_test("month-28-days", "ds1339", test_month_28_days, NULL);
     qos_add_test("month-29-days", "ds1339", test_month_29_days, NULL);

-- 
2.50.1


