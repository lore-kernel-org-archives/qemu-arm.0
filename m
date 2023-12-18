Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724467eji;
        Mon, 18 Dec 2023 03:38:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETc4vTw5UbBTSrWBEUBJDUF8v4+WxRH6lZrA7vvOLfA/CwD+6fDuUigkMPpI96T3DvMgPx
X-Received: by 2002:a05:620a:166a:b0:77f:d5e:f929 with SMTP id d10-20020a05620a166a00b0077f0d5ef929mr17795114qko.91.1702899481450;
        Mon, 18 Dec 2023 03:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899481; cv=none;
        d=google.com; s=arc-20160816;
        b=PeHrFwr9c45atsn5l4qNq3MbG6k0IgF2KK2CvL8/sk8vpRbDS3fPTfW+FnoJTjUuo+
         0XOeM6YZR89FN1dFznDizj+T70JxH61og05WBtEZl8JD0Frvn4XVpgOxca0FAjjlO/cu
         uDiFcf+dEYqPNCrVRhJd3DAncOdERQS8Rwm7QbA/NgITTlDQ3tW5sGMBnaP1owEz4CVB
         F9ztM3sTRxZ+aVP0uOalC6+WCa8cYhq/zB9V7Dwu6WqoPe4nojjcgH/1w/3Ig4w0aHTr
         YChvm2fNNuxBPaGI8fUtUu/9dycxlAd/H2Welpw6jxHAZljM8qLxb40jUQ2tJ3/jznBY
         7gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pgRuvvR7bxTkZhOa8SyNi9HYuZxCwzQYbnW0ZI1B8ww=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ZsooiM2nesDvC3EHfKfs62RQU/5S8qYDKIzwWneC9dN68o+uwI/4MxM+T23kDKjksU
         kIsyS/ncx4P9UmivxR4NVOWU95iuNGwD1q/SrV1estpXM25wR3K8lhfIpyaua/2Xa5li
         r072KuTJ0YJF38ui+UnM1EV4Sn87FDjPsw+4ep52Uz+t8XGZt/l3jrPjsxzGdiloKsBZ
         VjIiSZQTbyBai8Crge7ZXMBMGxEMxs2rPSuK4CdEAlA0yOKniLFnIbheiFtlcrPZc2wJ
         xXwxAtL1PXkd2ZhmM9jeSTrpgoIhvabFSRusaz7FwYnOOG+SWz+n6SNfuyZ+YlqHzg7p
         idIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTCOTtF5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26-20020a05620a015a00b0077f6bde837bsi18216182qkn.165.2023.12.18.03.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTCOTtF5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBs3-0006Zf-Vu; Mon, 18 Dec 2023 06:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs1-0006XE-J7
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:13 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBry-0003HL-2Q
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c69403b3eso27556315e9.3
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899188; x=1703503988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pgRuvvR7bxTkZhOa8SyNi9HYuZxCwzQYbnW0ZI1B8ww=;
 b=FTCOTtF5+FITmoRq8IBLH6RSw5fwpQzxB2mAgVYLmiNNC5qvuJT8XahQZXnMYmDEDs
 OCp4zlf1B/HW0+2rVQF9t3umnyNY+Up1tJ3MxfmmGgjGOj1pdpyatwjOiaaagh/kSrVS
 SfAgkxmIko95gcjVdYuMeaDwYlx7hQySpLCiWACTT1Z82d9IdCNRM7z4pf/ITr7GX9Qy
 sRDnxnwui12aRu8LNNuqzr+rhMqHnUzvxrHLJxR5aHxcMDWOttO/RnFxc7uYbdfH+GOI
 jJOGHxqFQWthfTDx/Nk8sDmnEcnxwZj+aWwOIV/Y56mk4wMdb/F8BHDjCLTuiNvujVNg
 uXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899188; x=1703503988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgRuvvR7bxTkZhOa8SyNi9HYuZxCwzQYbnW0ZI1B8ww=;
 b=k5Rkc6H2P0+Z2mD780N/Yda3JAUXSd+zl0TPyw01FkGtfxNj4NsOYED9DlUm3bRtQE
 vaRcxLhVqoc/15KcWjhHMc46EXFQq/Dk6A11CZsFzFNDiuBFVKRoLwsOn+O537n/8Qf4
 RSsw1T4KA5vtS+0eqE7qU5diw7MOuacYplMnsg7mSG4DckVVGrOLQRH+YEMG5TDt47G5
 iBbEOaRH0eCpA3+dNbhBd17/zTIwDevaCTDsy1G6bha7yIy1TCG/IcrTsyubUZyZd/Tt
 DWjDE4yIINoytinXCvBOreyOM9ShaMH8Bv+Oe85fHvLS6HQujw6td9AGneNAFVA569YP
 6QeQ==
X-Gm-Message-State: AOJu0YyhGqWAB5fhuwACjEToK5jvcewD1Ywfue5hY0VODr9Ns83eBuYv
 WuMxHuJ3h4rLtM+JOUZuS6WiVA==
X-Received: by 2002:a05:600c:1149:b0:40b:5641:438f with SMTP id
 z9-20020a05600c114900b0040b5641438fmr7593959wmz.6.1702899188708; 
 Mon, 18 Dec 2023 03:33:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/35] target/arm: Handle HCR_EL2 accesses for bits introduced
 with FEAT_NV
Date: Mon, 18 Dec 2023 11:32:34 +0000
Message-Id: <20231218113305.2511480-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GHruCMAw2ilf

FEAT_NV defines three new bits in HCR_EL2: NV, NV1 and AT.  When the
feature is enabled, allow these bits to be written, and flush the
TLBs for the bits which affect page table interpretation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/helper.c       | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 954d3582685..3a43c328d9e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -839,6 +839,11 @@ static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
 }
 
+static inline bool isar_feature_aa64_nv(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, NV) != 0;
+}
+
 static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 39830c7f948..ca8de414bdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5799,6 +5799,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_rme, cpu)) {
             valid_mask |= HCR_GPF;
         }
+        if (cpu_isar_feature(aa64_nv, cpu)) {
+            valid_mask |= HCR_NV | HCR_NV1 | HCR_AT;
+        }
     }
 
     if (cpu_isar_feature(any_evt, cpu)) {
@@ -5817,9 +5820,10 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_DC disables stage1 and enables stage2 translation
      * HCR_DCT enables tagging on (disabled) stage1 translation
      * HCR_FWB changes the interpretation of stage2 descriptor bits
+     * HCR_NV and HCR_NV1 affect interpretation of descriptor bits
      */
     if ((env->cp15.hcr_el2 ^ value) &
-        (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB)) {
+        (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB | HCR_NV | HCR_NV1)) {
         tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
-- 
2.34.1

