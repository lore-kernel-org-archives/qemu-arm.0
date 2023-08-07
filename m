Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484913ejb;
        Mon, 7 Aug 2023 07:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLH4wbVG5ZL9AgZIWLbVRlA3w+tZOHFK1Mmes/Lh0+kvM+HtQtr0HjGgFbBe2K257a6akN
X-Received: by 2002:a05:622a:252:b0:40f:d56b:6f8e with SMTP id c18-20020a05622a025200b0040fd56b6f8emr7451381qtx.28.1691417852243;
        Mon, 07 Aug 2023 07:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417852; cv=none;
        d=google.com; s=arc-20160816;
        b=gAPXHoYirZLSXwKEqixHHCSble6EZ0jt+GNP9OZSjNybRx1bsTWfWSCRS3ab0+ejCY
         +Oy3L9tqfrG6iKPEJIp3PEDP4kH8yKlvWUo6m0KPQDZtj7YKpOflwI9gQo1KweNgaTvp
         yjh204YQTRxhawPKc5aIE7L1e5A03oz60l0wyYM7oorZKel1Uy0NlM+lfN3XPip6LYpz
         wBiYNSMYJ61V7EAufsE6JZhGzDa7VMp8oMOdAblRRSLP5G8ETza0MGVZ+vhlWX5jzLIN
         IyTht4md0uGmJwBiOFBH2tG199DoehLbDk7I0UDAF59QajJz5J9HVKV7i1qo0YeMEaua
         6Neg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fPUvCziy6lhHDDMmfmybg6TLiyhiL/Fc4MTynATEnX0=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=Qk+KMDdqCV4TAUJbot7K8YPLj7Tnx8DyYGaqFvJ8QlT7BxuP3ZzuSmHqGKjQS8DFhj
         kcl4l33a4ij27uVNi3rLiompPTGqTu8gqNhd50Bg6BUnvCM88Mm2yB6Af/Hf3VGYqLLx
         Gt0D8Vh7PBREjJuzN7HW3NRTEGfHuyqW3F6yAmg1S6OrPDp8U2BCwBlUWST1TtE/6mhU
         K4zovcnWzkPRDMTIRDZzU3p0pCv0WIm1yXMkue651OHkTdHAe1ue2pa1QvbN2XD51k/S
         kI67Dhh4s49L+u06vbSfoM2fCGQRMMKicGyLVWg2RR2x6kfhHEOy+HEWzwprvZqLSlrG
         oVbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgO+KSNt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a174700b00403cebddf3csi5090358qtk.90.2023.08.07.07.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgO+KSNt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT12P-0001mm-6C; Mon, 07 Aug 2023 10:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT118-0000B2-WE
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-0005UC-EG
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe32016bc8so38566815e9.1
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417722; x=1692022522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fPUvCziy6lhHDDMmfmybg6TLiyhiL/Fc4MTynATEnX0=;
 b=QgO+KSNtbuHjCyUPFYGSDYE1ttW8+KPbQbVYx50RkeUQbxt+voN9VYEBOOWfy/44Cm
 NE+W1vzKeDPpIjQuFbb6NzkO+zYTJYAOyuIbl5YsUY4lWvbt6ZU+l8dWn4PiY41auOp1
 PCkdeFfN5Y63jwF6cqcXm7q1+whrc1F//x0TyUi8qdo+Fe/gYomak701z7Jh30OMjqip
 vLYibZhN5rKhtWZkLaaGxsVpChO7Vrt8Zy8xLefAPC3rNxNQx+tlYCgmsqI5lQ70jlEF
 mEjiCwxAsh/qfN1xBD6wNdDP4WIlxg1hTkran9Bld/GmpkQK5ru00Uc17i3g79UvIxPa
 v4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417722; x=1692022522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPUvCziy6lhHDDMmfmybg6TLiyhiL/Fc4MTynATEnX0=;
 b=hzBzuEmL+l94u/OrXqLp4WTHS55hBl9ALIRlihFU3hMnu4CUy4MIgEcBI/Jo7jHgim
 lahMWrNA1wVDg9oXZ5fnMdg4qDHbP396NO2ncbk2AQfCR6hMG+9GkQkZrHz7kKoi6CD6
 aOan7la9sc26jwycAUU/XZQcLnjEO/8ZLOf7wIguWRlLE1fYFXZiGOfselgI2AaJwWbM
 98X9fB20SoYXF8Cjh+laHA79e571h9yZlQybjSQp0a8B1c8LER13aoAB0DX/BBRnXesT
 +AVAEEs9QhLZccuEIQsK5kscbqrlYGhO2t7AiXx4WL7EUEE6i+bmmmJS4NrbT+DxQmWp
 o4NQ==
X-Gm-Message-State: AOJu0Yzd4OSKNGe4HQP/izD21cDQP0MYxHJl9b2yb1MR3tkWutGErCOm
 mNd7EekV3kSO48jI+uP7F5/cdBruXf91CoXGB4c=
X-Received: by 2002:a7b:c453:0:b0:3f8:fc2a:c7eb with SMTP id
 l19-20020a7bc453000000b003f8fc2ac7ebmr5779539wmi.5.1691417721878; 
 Mon, 07 Aug 2023 07:15:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] target/arm/ptw: Remove S1Translate::in_secure
Date: Mon,  7 Aug 2023 15:15:09 +0100
Message-Id: <20230807141514.19075-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WcKxg6Bi7A+N

We no longer look at the in_secure field of the S1Translate struct
anyway, so we can remove it and all the code which sets it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1ca25438c3c..78bc679deef 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -51,13 +51,6 @@ typedef struct S1Translate {
      *    value being Stage2 vs Stage2_S distinguishes those.
      */
     ARMSecuritySpace in_space;
-    /*
-     * in_secure: whether the translation regime is a Secure one.
-     * This is always equal to arm_space_is_secure(in_space).
-     * If a Secure ptw is "downgraded" to NonSecure by an NSTable bit,
-     * this field is updated accordingly.
-     */
-    bool in_secure;
     /*
      * in_debug: is this a QEMU debug access (gdbstub, etc)? Debug
      * accesses will not update the guest page table access flags
@@ -547,7 +540,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
-            .in_secure = arm_space_is_secure(s2_space),
             .in_space = s2_space,
             .in_debug = true,
         };
@@ -1784,7 +1776,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
-        ptw->in_secure = false;
         ptw->in_space = ARMSS_NonSecure;
     }
 
@@ -3167,7 +3158,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ptw->in_s1_is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    ptw->in_secure = ipa_secure;
     ptw->in_space = ipa_space;
     ptw->in_ptw_idx = ptw_idx_for_stage_2(env, ptw->in_mmu_idx);
 
@@ -3403,7 +3393,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
-        .in_secure = is_secure,
         .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
@@ -3475,7 +3464,6 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     ptw.in_space = ss;
-    ptw.in_secure = arm_space_is_secure(ss);
     return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
@@ -3489,7 +3477,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = ss,
-        .in_secure = arm_space_is_secure(ss),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.34.1

