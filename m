Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E345CA9EBE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:10:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDY-0001eQ-Rp; Sat, 10 Oct 2026 03:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDT-0001bh-F3
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDR-0001BE-S6
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:09:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48b9d8055dfso343581f8f.3
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616196; x=1792220996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YvCmWBNKpCw559LBK1/4u4TqFg6AtOQbb6mofL8w7lc=;
 b=GaAAqXI9g7qxHr81qOEM4cY0gbLgnpljpyLZ/eHctrzPR6r9mWjp3WiGL9SHB9R05N
 NV/HsqAGHuBiuqovNjzs+gwnGwpTrI+/N0a809FrwENvZ7GgktL68HEfhZFkNaZxlOtF
 Fo4qURLq4/HRlZLkLMs3+LtE4IDp2Ow902ni3lMCTRbnaLJVuVqIPBEEu7Pqg0GBFCjP
 EGXw4CJC/J6ayvqeUAsVu/YVy7QEAB+I4lnGAtY8dw2wsloJI1uwN7npZ17MFBebbMLf
 aBK5cpgkPnOfFzOZ+0eiM5UAEg+CfLhd8P+rNoPPctEBm4JO4eYHWIF62fDXu3Xx3y6l
 9Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616196; x=1792220996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YvCmWBNKpCw559LBK1/4u4TqFg6AtOQbb6mofL8w7lc=;
 b=M2c24qpBjMaCSEGV1gZ+SWMCb/vq41/tbufLhja8oyyW8guzrdrp+iXfqBnahZyeNx
 OhvrS/HYLoAJb0xojtdtYqPdZfGf88qasGqC1emvhVG4I7zROs9pEksOphbs/Mb4hmd3
 iGpIW86thfgHpDPBsLGhE2OclcGV+jELDKodmVmecgetJQ+h612FspD3DxTcnip6PDmV
 Vy+zuFGSNYh1tzJD0axmI4KukjpWctYuagRzlZImb1kOoz48fE5cFaeIgOH8WPgbV1Ui
 I0unPjGH9kGH8pu8q6H1fKhsg4WhwWlbUTG8h9ZWPb9jT0zxmUwVKWDgt9SVDLnXYaTx
 gOLA==
X-Gm-Message-State: AFq9FYLk8DQG5Wn4Dbu+PpDaxhZgmBR591nOxP1Y67NWen+sCuYt0yfZ
 QKkPmaUnMhdWPvN7eYt4vIjFpg5KLiVD4sw313rQf51niIw2L/u82hH57JwiPk9SYFX8o5sr2AP
 pVcCopQ0=
X-Gm-Gg: AYBFou06XGXI6e8iROhzPC2fA9igz7XeR3kznQlWSmpDkyQcXADvvYCXnO0MFsBkPhT
 GcUFHT1U+x+8H8J9uNiNc1pHzaIqvL8oz6SURMXlo8lWRC14JozPt53s2ISlXb7R+z7LzpuLVYj
 /cAJUF9hk55KqS2qfc/3hD3wIjKqCefgQP8L2qBIFv5UbhdZviOhYWkCaW/I1L0YFkkFPL2j4Bd
 8crIo2PsG9d/yY7ATlryUiUiwVG/5OQeuaMejRif3aXyyBU9gpzdRU7ZQPMDp17IdCIlr/2MliT
 1feFL7P4CZLmQ3dSuPUlagZCItES/y2+w0OSsJ/gidP5nMv1wkMUYM1zixWKbMcFJ5Me6crQaqg
 YyipBfTEo9fSv4MNNKNMln9wPUqRVy4J6zk98q/S4famrHDv5mKpV63KyAwT1agdU7L+AXeLu4J
 mmrX3hjDB9GsqeEQVvriJkLdKNeqBMCI+of7mtAwm7QuXPfL1F6J5VbI+py4ZlUpy7SjTz/J7GO
 qCdPhvIBPc=
X-Received: by 2002:a05:6000:25c1:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-48dba78a613mr7180094f8f.1.1791616196304; 
 Sat, 10 Oct 2026 00:09:56 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:09:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 2/6] target/arm: Enable writes to SCR_EL3.TID{3,5}
Date: Sat, 10 Oct 2026 09:09:48 +0200
Message-ID: <20261010070952.323466-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
References: <20261010070952.323466-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/cpu.h          | 2 ++
 target/arm/helper.c       | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 2fc1bf02cbe..96ec12f64f4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1408,6 +1408,11 @@ static inline bool isar_feature_aa64_idst(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) != 0;
 }
 
+static inline bool isar_feature_aa64_idte3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) >= 2;
+}
+
 static inline bool isar_feature_aa64_half_evt(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, EVT) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 06ebed4a8fd..a0355ba9e1a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1811,6 +1811,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_EASE              (1ULL << 19)
 #define SCR_NMEA              (1ULL << 20)
 #define SCR_FIEN              (1ULL << 21)
+#define SCR_TID3              (1ULL << 22)
+#define SCR_TID5              (1ULL << 23)
 #define SCR_ENSCXT            (1ULL << 25)
 #define SCR_ATA               (1ULL << 26)
 #define SCR_FGTEN             (1ULL << 27)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ff0b766b73d..187d0e9213d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -960,6 +960,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_rng_trap, cpu)) {
             valid_mask |= SCR_TRNDR;
         }
+        if (cpu_isar_feature(aa64_idte3, cpu)) {
+            valid_mask |= SCR_TID5 | SCR_TID3;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.53.0


