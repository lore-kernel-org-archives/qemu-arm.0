Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp699687lfb;
        Thu, 9 Jun 2022 14:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGTt5MjakAUu2iDofo+ZtI1cIygD13qLruu5UVT1GvmtoU9xYO/GzoA1Ku7Lb4rNzxhZEZ
X-Received: by 2002:ac8:5bcb:0:b0:304:ff2f:459f with SMTP id b11-20020ac85bcb000000b00304ff2f459fmr10691259qtb.545.1654808939587;
        Thu, 09 Jun 2022 14:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654808939; cv=none;
        d=google.com; s=arc-20160816;
        b=M+z2uqugsPolWVzquacbUv+0zL5Q3chspiTgUu+DEqUi3gnmrAPTlj68/gQTEmB0cB
         QbAZQsBn/yMXBO1bEjfct8LKbvAXy92Q1OUP7Twpq9nncickd5w8PBxRnl1jthmKJ0RR
         3U8pa2zqBrB5iGqYoMFns+NKViIuJlB4+trlNfpIaExOIX1CeUkGgxAzRcyb6w1Dbze3
         kNPPV2adHiZs7ve+oocRFwzQ6MyhmRR8UqKrnHY2Ol7aPogaU39xwWOtEFWCKikXfVG7
         4cgbKDsZLE5q+F9fl3zT4CTEJNSaiqOV4vuVTLgDV7VWlJ1EGT88iKtbxJCQQlS26nbY
         aq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NNURr0Aht9d3sVCPfMyWxRyw8UmQdVCrRycp0Xr9WSw=;
        b=MatNI1b2jOUIJTe4DhA/mRElZ7e2Gx7uHqsEqsUK1agdXAG0zfzolQx1mCV/9f0Ll5
         NcosViFtYH6572Xb+w7+IS4j9hseJ6u08lsGtyjn8jBOO8vWuRGfTHDS6HC2Xd76Tdfc
         oOlYQZVP7LMlKHbtka+CJQWel61FzICigTozKIv51AwAwbPIPM222N6A4EG3l3mlngHB
         eaazxR8Fa94FcTxf/yAxrHaLL3ZeFS3hoP5EeeZb+Nmfkk6gqMX3TQRXT2/pv6j2dgjx
         dF6dE3yr9jZlVl+YwEGfzYQR0DWIKPwyDiM0WEe7PyxgXzI7qdE0R7o2/r2YSErut97F
         2t0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWzOqtuT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ae9f20c000000b006a658fd5a19si12298725qkg.84.2022.06.09.14.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWzOqtuT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPOl-0005nZ-0t
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmT-0004CF-E8
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmP-00006j-WE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x4so13473051pfj.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNURr0Aht9d3sVCPfMyWxRyw8UmQdVCrRycp0Xr9WSw=;
 b=SWzOqtuTgh4aufDOFdAO2VRhFLaSfi+bad40b0nEpx4v1wdexz4ihb7vfF7BAbMEX3
 6Ags2WacphEl0Cloz8pZFpuLlfRvczxNJyULz+4/oECzpMxJ3oNJoR0nZAd7uE0jXURa
 2LRuJabiylTPnIFjsTirxm69BeUgNfW4dWlYvb9fgDFmEil3gl2j+guzQHCyQ2auqOYf
 HdlQT7GNobyBq90+bYUlhymMmzTsyI8tDtJTu1wMhXLJu4mmbZqKG/Zxw4jRVWQmsDe4
 nUcyKr576RsoLhJtUaNgdxniZhpdlc9wzBlBLvxzaeA1nKmFTcs5vOchHiEf6PYpOCeE
 JsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNURr0Aht9d3sVCPfMyWxRyw8UmQdVCrRycp0Xr9WSw=;
 b=vhY5ig5dy/6dJCqh1gxyBDq0NMPve6XCdhhtDvUlvPPu93Z+3mHCUR/yBZkeCGEKOT
 xiPEXGirMVnjxL/pl7VFGOwAhVF8ATVJ8+xEb3Cc2V5Yqv2ehi+XtwBocGLX6eNXd2f6
 jJjVAUMSoIrG6SwzHJ+1FqX6+6dbXJ+jRc5Ptr+LqXT8UTVLSzx2u6Zi1QdAytd6xrmj
 eD7YlcSR3sIKPM4eSY44l6SY1eYY+LO8BGOyjMS7CK68BU3YFRBZBt2rrddpwe0S1CoO
 8eVuYEpKeTgWWdLN5djMbcwAfvShrNX4xmPATSlbE3Kjn5nFgL7dlG44pP4N3vXZx45n
 1PVA==
X-Gm-Message-State: AOAM532MTIyj8/siJ6KHe1ZYX0IoDLjLJvzRqxQNeB0O3EKTrrnu5Lq9
 uiJqmaGsnsRpyIAXGJFAInTATSAkRO5CkQ==
X-Received: by 2002:a63:1a0f:0:b0:3fe:4da7:1a38 with SMTP id
 a15-20020a631a0f000000b003fe4da71a38mr6055172pga.332.1654806560598; 
 Thu, 09 Jun 2022 13:29:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/23] target/arm: Remove default_exception_el
Date: Thu,  9 Jun 2022 13:28:58 -0700
Message-Id: <20220609202901.1177572-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L2oyQ8+MgCsT

This function is no longer used.  At the same time, remove
DisasContext.secure_routed_to_el3, as it in turn becomes unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 16 ----------------
 target/arm/translate-a64.c |  5 -----
 target/arm/translate.c     |  5 -----
 3 files changed, 26 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 850bcdc155..88dc18a034 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -43,8 +43,6 @@ typedef struct DisasContext {
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
-    /* Flag indicating that exceptions from secure mode are routed to EL3. */
-    bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
@@ -199,20 +197,6 @@ static inline int get_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(s->mmu_idx);
 }
 
-/* Function used to determine the target exception EL when otherwise not known
- * or default.
- */
-static inline int default_exception_el(DisasContext *s)
-{
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.  Otherwise,
-     * exceptions can only be routed to ELs above 1, so we target the higher of
-     * 1 or the current EL.
-     */
-    return (s->mmu_idx == ARMMMUIdx_SE10_0 && s->secure_routed_to_el3)
-            ? 3 : MAX(1, s->current_el);
-}
-
 static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 {
     /* We don't need to save all of the syndrome so we mask and shift
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4f6181a548..4c64546090 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14585,11 +14585,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->condjmp = 0;
 
     dc->aarch64 = true;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 81c27e7c70..6617de775f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9319,11 +9319,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->condjmp = 0;
 
     dc->aarch64 = false;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
-- 
2.34.1

