Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981FCC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 23:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgsJI-0001TG-MT; Mon, 06 Jul 2026 19:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sDNMagYKCKEUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1wgsJH-0001SS-OU
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:07 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sDNMagYKCKEUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1wgsJG-00074T-4w
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:07 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-c89956023dbso4745865a12.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 16:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783378864; x=1783983664; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OLTxskLBXDENLFyN1dtTBrLCPkP5BiKim3I9wu6aM8I=;
 b=mingSwf+ytmSERi3h8PE6nwkAZf4ECD8FPN40V3PUTwvV6V6+22/bUmhlj88d5yh4b
 g5wtilFRF8Pq9Nouu/s0rACwS4CT034rWDa9EwVAIdSH0zHYUprRu8lgEBleb2vJGOp/
 WWA4oURvI4dPJztMXUDdSqI4yDgIekDpGYfn26U1LDAuU/GMgu72C5VL6IaQvK57FdDE
 yKFGUv+1Uojam1b4HeCTRDLu6FHssleHJHtUTgiix8Q1dgVeg5VZ33djRnqK1HeqW2WN
 gaeGzYHkDKwIPDJs6snqPneULnYMWF6BHpeKZRiE6GdSGRJmFHrK57bzS9DvDLXjQkCp
 wG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783378864; x=1783983664;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OLTxskLBXDENLFyN1dtTBrLCPkP5BiKim3I9wu6aM8I=;
 b=kVAlwtOhmSNMOafv6qh3lLS6Vc26gF+0L7R6LrBOHYeVRPJoNPbVRArdg9bwgetvgC
 bAl1rit0t5rU/NYQ7qBU5f3S3RAitbB0d7lbIYiZmN3AWOotfKZRRIb9orysUtn4Jugf
 sRpIFEE1kZ9QYeuxfkIpzyCOvaQhQXRlWYZDBu3qzq6KORCy9b7X4YEby22UyxIHetHw
 s79wSLX2o+lxqRo2v5+3zT/8B/Ems4xbVnhNHCK/HsAbLJp0Pp1s/JyyqTH+Wf1RgZyu
 Jw8OEmUas1BCtoPFgVZYeFAqbrYGwRFVczAppD51vjr0y6lM01RWjDTbB85/RwJTePwp
 A3XA==
X-Gm-Message-State: AOJu0YxJngloI+WUCqkGtXt2yDQxwS+cmguEDeQjEEFAc/eycxpXAbty
 PXJLEqsKwjsNv0HxZ4CglnYLSROvAypwnjx8XKet/V0pU34HL2rQ9k6Ipqd6ZGarg8NfDicHc53
 aZEViPg==
X-Received: from dlea16-n1.prod.google.com
 ([2002:a05:701b:4210:10b0:13b:3fa1:5d80])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7116:b0:3bf:e291:496c
 with SMTP id adf61e73a8af0-3c08edb1d45mr3167471637.17.1783378864356; Mon, 06
 Jul 2026 16:01:04 -0700 (PDT)
Date: Mon,  6 Jul 2026 23:00:54 +0000
In-Reply-To: <20260706230056.1888992-1-titusr@google.com>
Mime-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706230056.1888992-6-titusr@google.com>
Subject: [PATCH 5/5] hw/i2c: pmbus: add Linear11 format helpers
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3sDNMagYKCKEUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -94
X-Spam_score: -9.5
X-Spam_bar: ---------
X-Spam_report: (-9.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FUZZY_MILLION=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 12 +++++++++
 include/hw/i2c/pmbus_device.h | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 8befc27895..5039975520 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -39,6 +39,12 @@ uint16_t pmbus_data2linear_mode(uint16_t value, int exp)
     return value >> exp;
 }
 
+uint16_t pmbus_data2linear11(uint16_t value, int exp)
+{
+    return (uint16_t)((exp & 0x1F) << 11 |
+        (pmbus_data2linear_mode(value, exp) & 0x7FF));
+}
+
 uint16_t pmbus_milliunits2linear_mode(uint32_t value, int exp)
 {
     uint32_t ret;
@@ -58,6 +64,12 @@ uint16_t pmbus_milliunits2linear_mode(uint32_t value, int exp)
     return ret;
 }
 
+uint16_t pmbus_milliunits2linear11(uint32_t value, int exp)
+{
+    return (uint16_t)((exp & 0x1F) << 11 |
+        (pmbus_milliunits2linear_mode(value, exp) & 0x7FF));
+}
+
 uint16_t pmbus_linear_mode2data(uint16_t value, int exp)
 {
     /* D = L * 2^e */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 9f3569e997..44cd908fe7 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -477,10 +477,56 @@ uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
  *
  * L = D * 2^(-e)
  *
+ * Exponent is retrieved from VOUT_MODE register
+ *
+ *   7   6   5   4   3   2   1   0
+ * +---+---+---+---+---+---+---+---+
+ * | 0 | 0 | 0 |       N           |
+ * +---+---+---+---+---+---+---+---+
+ *   |_______|   |_______________|
+ *     Mode          Exponent (N)
+ *    = 000b
+ *
  * @return uint16
  */
 uint16_t pmbus_data2linear_mode(uint16_t value, int exp);
 
+/**
+ * Convert sensor values to linear11 format
+ *
+ *   L = e << 11 | D * 2^(-e)
+ *
+ *  |        Data Byte High             |        Data Byte Low          |
+ *  +---+---+---+---+---+   +---+---+---+---+---+---+---+---+---+---+---+
+ *  | 7 | 6 | 5 | 4 | 3 |   | 2 | 1 | 0 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+ *  +---+---+---+---+---+   +---+---+---+---+---+---+---+---+---+---+---+
+ *  | MSB               |   | MSB                                       |
+ *  |_________ _________|   |_____________________ _____________________|
+ *            N                                   Y
+ *         Exponent                            Mantissa
+ *
+ * @return uint16
+ */
+uint16_t pmbus_data2linear11(uint16_t value, int exp);
+
+/**
+ * Convert sensor values in milliunits to linear11 format
+ *
+ *   L = e << 11 | D * 2^(-e)
+ *
+ *  |        Data Byte High             |        Data Byte Low          |
+ *  +---+---+---+---+---+   +---+---+---+---+---+---+---+---+---+---+---+
+ *  | 7 | 6 | 5 | 4 | 3 |   | 2 | 1 | 0 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+ *  +---+---+---+---+---+   +---+---+---+---+---+---+---+---+---+---+---+
+ *  | MSB               |   | MSB                                       |
+ *  |_________ _________|   |_____________________ _____________________|
+ *            N                                   Y
+ *         Exponent                            Mantissa
+ *
+ * @return uint16
+ */
+uint16_t pmbus_milliunits2linear11(uint32_t value, int exp);
+
 /**
  * Convert milliunit sensor value to linear mode format
  *
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


