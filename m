Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1258937ejn;
        Fri, 28 Oct 2022 06:40:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cw/RhDQVyc5nPtCB/odWqfuYVcKSLuHxwYUXGBX9nCACub+WKFt8o9qIM7wwzLOBDJAXL
X-Received: by 2002:a05:620a:22ce:b0:6fa:b77:1c4f with SMTP id o14-20020a05620a22ce00b006fa0b771c4fmr1480226qki.432.1666964451859;
        Fri, 28 Oct 2022 06:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666964451; cv=none;
        d=google.com; s=arc-20160816;
        b=dq4KFSyzEhbCfIVQf0H/tb4BcLv1gIFNFLpAm0Dv5Pc6oFjeUTOK41M7KpbJbTYFyI
         68ZYSYMgZqsrZu5Ix2+hGXN4JsCxRZWxxgIrWnawBNUYSTOUqLTQwBxTv7gfFsfZO7Ok
         jId/UU/5KDAfxxH4UOvC5Y+isnLVmOgcw3Kug/IpsPxPkrtVn0/KdBjRweA/Kr4DOoNv
         ueK0/Hm31n3xOXZPnPMzfAj9+rvNC335BlgT9Uev/A9iqL9kPPtevByd7Ru0FzV8qiLY
         cHOJiwwh9vRYaPPRpwZ9Bv3ijLltS3rbG1bs1Bid1iPELfYA8BSau0zSS254EgkcOSJk
         d5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/thusHPuC/cHTeKn9J5h/MSrlwz9RjeKgKHlXo/nxr4=;
        b=ZrU0NEQgyI/At2Lag4f3yb5eAjbubzD3WFjvrgbF37wqsXVuYifMh+slIYGRQb8EBj
         UeoqMmkA4q6s4yZhctci2pr3RcXyoGgM+muTQY0RkC1hxiZy3rwJKhX+YM11DX0OMWje
         ywZsqKOYJBZIXjE6fjdKk4PFgwouUbkmgXJ/B/CNBQfXkB6UeJSvIoFySg2eyhxtFHoC
         baBOjsowEK4td3gkMLwyRXMd6WlmbMD5qRGvHEEwDFQxQPV0EpRJkrCjs2/HKMCQvFe/
         Te6LCEqeQ5moY41tda0MFUw0Jowbl6F+vmbKR+miYwdU1yiiw87golML7FWXbpN0ze9E
         sxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2iEATvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fp8-20020a05622a508800b0039ce31a47c6si2698211qtb.625.2022.10.28.06.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 06:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2iEATvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooPas-0008PH-8D; Fri, 28 Oct 2022 09:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPal-0008Jt-Es
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 09:40:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPaj-0007rQ-Hu
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 09:40:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id j15so6662886wrq.3
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/thusHPuC/cHTeKn9J5h/MSrlwz9RjeKgKHlXo/nxr4=;
 b=v2iEATvYbuwbbm/KcbdVHAVH0oh/2S0s/TL3Hx36jqmf0ukXyftkBkjhk8l0hU8y6o
 0O/LqtQUpaWJIe8YVOEJygyhPURnFl562Kb+RrqT8zi/POS3e0q8G6RBndhc4Uy17Uoq
 lJJaIeIUgDViratBVznavGtakucgCluxluvc71zS4IYOeL5bWBnHQMANdPFvYPPjZpHQ
 BN/iF5Jz4C6Qgjv+nsV0G5aoOM9puNNcQ+348cNzdOq6KiwN7zb6GSVVSqjbvxn/T9Gm
 74E6MJRXJI6GjoYls0u0XVTqg8NQxiIAIgtXTyOybLE4eLNGXAM4s8P9iqi5KJKjCakE
 ZIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/thusHPuC/cHTeKn9J5h/MSrlwz9RjeKgKHlXo/nxr4=;
 b=2N7eUY5nzf5woPsoomxzwXX7gV4r9CLSymUeMISv+h/lqu3xtDlEjgs6hLc+SLVZkX
 CzZGTxN+P8QYFOPar1CNqcyYnYSRJ2H/B8tFKYbBtdHiiQLitY1niBWnqu7PMr1Iaeyq
 9279/JKlxCpEjmQbvbTX6ogVJM+gg0el92/q/tWtH9itNmIpNKPnWqMTUCcNixfXUB00
 BXhiXVwQETIreL3KPWW6Fntf/8soFtCwhCTnpEdDyq1B+0Zq7wc3rNSHWhroE8mEZHOE
 txJj8pGuhCeNW09FaaMpn/ZrYm+4XveQM37Ze87a06kq+34Y0h1gaP5YB1ujRXopyjqu
 YFrQ==
X-Gm-Message-State: ACrzQf20VJTj++B1TuIS5HG5y++T++E6W34VrC9vNj4WUyrNSH81bXy6
 Gd22jseERNb3K45vwiaJl73iShfjD0yvlA==
X-Received: by 2002:a5d:6d4e:0:b0:22c:9dfd:4159 with SMTP id
 k14-20020a5d6d4e000000b0022c9dfd4159mr34196471wri.307.1666964407780; 
 Fri, 28 Oct 2022 06:40:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Allow relevant HCR bits to be written for
 FEAT_EVT
Date: Fri, 28 Oct 2022 14:39:57 +0100
Message-Id: <20221028134002.730598-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xPBrLgP9caIX

FEAT_EVT adds five new bits to the HCR_EL2 register: TTLBIS, TTLBOS,
TICAB, TOCU and TID4.  These allow the guest to enable trapping of
various EL1 instructions to EL2.  In this commit, add the necessary
code to allow the guest to set these bits if the feature is present;
because the bit is always zero when the feature isn't present we
won't need to use explicit feature checks in the "trap on condition"
tests in the following commits.

Note that although full implementation of the feature (mandatory from
Armv8.5 onward) requires all five trap bits, the ID registers permit
a value indicating that only TICAB, TOCU and TID4 are implemented,
which might be the case for CPUs between Armv8.2 and Armv8.5.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 30 ++++++++++++++++++++++++++++++
 target/arm/helper.c |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index db9ec6a0389..ae8397481d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3757,6 +3757,16 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
 }
 
+static inline bool isar_feature_aa32_half_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 1;
+}
+
+static inline bool isar_feature_aa32_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 2;
+}
+
 static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
@@ -4029,6 +4039,16 @@ static inline bool isar_feature_aa64_ids(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, IDS) != 0;
 }
 
+static inline bool isar_feature_aa64_half_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, EVT) >= 1;
+}
+
+static inline bool isar_feature_aa64_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, EVT) >= 2;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
@@ -4298,6 +4318,16 @@ static inline bool isar_feature_any_ras(const ARMISARegisters *id)
     return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
 }
 
+static inline bool isar_feature_any_half_evt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_half_evt(id) || isar_feature_aa32_half_evt(id);
+}
+
+static inline bool isar_feature_any_evt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dd6fc30faee..8e358d32033 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5264,6 +5264,13 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         }
     }
 
+    if (cpu_isar_feature(any_half_evt, cpu)) {
+        valid_mask |= HCR_TICAB | HCR_TOCU | HCR_TID4;
+    }
+    if (cpu_isar_feature(any_evt, cpu)) {
+        valid_mask |= HCR_TTLBIS | HCR_TTLBOS | HCR_TICAB | HCR_TOCU | HCR_TID4;
+    }
+
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-- 
2.25.1

