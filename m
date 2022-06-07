Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1813214lfb;
        Mon, 6 Jun 2022 20:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj1flxZF5Xd17HBNdfIpybkV8hgGfax7cOrfdnP9+C2NdUyivakZdJiAfceZOl+D/xyIWI
X-Received: by 2002:a05:622a:1a28:b0:304:ec1d:e8c3 with SMTP id f40-20020a05622a1a2800b00304ec1de8c3mr6945793qtb.175.1654571925257;
        Mon, 06 Jun 2022 20:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654571925; cv=none;
        d=google.com; s=arc-20160816;
        b=ClQkhYESq0GD7uiTNGWuSEkgACi1dGMjCGJ6jPA8Gw0Xo5Tw3CSGzMPUcAp40VVGhG
         q4uDokEOKtvgazWvLICFBisCkns7Lbl6PBlJ+bwhnDTgFFikFykckohuJJiY/8yS02nk
         8BkQIdiAtlisZYykkayWOtCx6gRdt9GP4xHj4RHBzoBVxNXjwa8VhwawLcGjfT0JVULD
         sS7OsF1d2AgI9QZBSGNIpkA1oWzLMUXlCz8dBnCV13yZAn0jl5Z5di3toYH3pxA/IlEc
         3TChq30uupvfwkYHLhZhUPNyuBOCh+a1ZdE55UsHDXkn5pd0ISWbSdtRNToAloXbpmGp
         gPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6fpGwv3kCXG8ZtfQZNZua0/iQeuwiDUTLYdlJx9okG4=;
        b=pYY/zfekBE6XgOhB8bJc2rnUMGtLAtUeYqzkCYbG8KZw2wqItt0Jzhy/bUrPsGKQ+0
         62SwcfBgO4ZadYC0BSF5fXNqSozLsQwX3LI/KsMboQn3VUobWkXcgYjwuyYkAKALwbfk
         t2pvGiyceCcLLRxqBLcaKZY6hWqCnNWm5n8FgERxEL/UeoVshpswwY1LDVpw17LlD0Pf
         bC3lhRVciF6AmUDOUcQ+SVGP3mPCBHgGV7+7qveyCl+Gbpm+tJClB0zugK8OttbFFcYp
         yL8xQ9eUVA0FYx9qAdEVq2geqgQWIQySjT49wGGtMtsRJF10gmQfZLVfJVQ75ZvWP1I9
         xroQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gtj4lgnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b00304d815c015si7601401qtx.332.2022.06.06.20.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gtj4lgnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPjw-0000hM-PF
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG8-0007JQ-U2
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-0000Gk-T4
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: by mail-pg1-x535.google.com with SMTP id h192so7759511pgc.4
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fpGwv3kCXG8ZtfQZNZua0/iQeuwiDUTLYdlJx9okG4=;
 b=Gtj4lgnlDJP0UcCIfJj0C4utjUIMBCR3LwbDYJBzEo2BGgQvzWu+R5Vo7F6bZK26VE
 J6Gs341t8bpbgmDfl60Vpqvn6NuBAXZyGEeMyeUQcMEXueyKZleRi5jkl+r/bWWeQOLe
 KNLjp0bktfXUnfbrvu/A+nvjeuiAjTEOGwnmRYY30yVKuTg1TsA9XZTWLUASX5DdN/rz
 u5U+dU4VDRbgv4yGbL2SXU22MypoSgCfnoM+PrvFisZFq+CV8sdvuyki7wkXyMmbyVqp
 RMFXn33tao0M0GcfX6Q6iyW8nL32ZeB51v5zAlnWU+wyRzKbl5FZ4793QiAFfLQCqQJd
 ODgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fpGwv3kCXG8ZtfQZNZua0/iQeuwiDUTLYdlJx9okG4=;
 b=KO7drPlnTC26l8snGnZOICcItzXK7rpMWYkRlT8W//1J19Jdq1vtp3+Qae4aQzVyyl
 KFcXAs8Je8E1buIkaE4EoGx10H6Vuz60pYW7UIwgoUtz423FSaGO25gfUSCuM2ZXZRb+
 MHz5a+dtQLG5ZkQ/xkSmdY2lYFyDgZ2NnYG4rpmez/Ndj1nH9MgcaxsHpgffCDmE44c7
 rcMo2B5bbQSq/YmMYwjHEr9LzzLpCrMsQwkzFUz84yGFjIbr5s1u2gEaGKBGEdsJxOyb
 Y2xirf98KnpjGJRD0YpkL/sBohpY1AxLPJIObXOFIkUxQP0F7eacEac7aNF57GTiyxjJ
 qVXA==
X-Gm-Message-State: AOAM530KLkLHx8HyMntljGR8Oa7lan8jN1q/Gx3S9SvckXo7+einL0cD
 HI5I3ODcXJH476aG04gP3h7GAg==
X-Received: by 2002:a63:fa56:0:b0:3fc:d3d2:ceac with SMTP id
 g22-20020a63fa56000000b003fcd3d2ceacmr23481606pgk.99.1654570073961; 
 Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 21/25] target/arm: Remove default_exception_el
Date: Mon,  6 Jun 2022 19:47:30 -0700
Message-Id: <20220607024734.541321-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KDrxAdn5soR7

This function is no longer used.  At the same time, remove
DisasContext.secure_routed_to_el3, as it in turn becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 16 ----------------
 target/arm/translate-a64.c |  5 -----
 target/arm/translate.c     |  5 -----
 3 files changed, 26 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7a9acf5a9..b01a58653e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -43,8 +43,6 @@ typedef struct DisasContext {
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sve_len;     /* SVE vector length in bytes */
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
index b45039a124..8da2ca8324 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14584,11 +14584,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
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

