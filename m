Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5016299lfr;
        Tue, 13 Apr 2021 09:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnoupSDrT6aGxmQ8CTEKNgeYo/kW8xQqIKxvs+G9fKkYDWGWfwnvsyteB7Ne6e4jochvTN
X-Received: by 2002:a92:cd88:: with SMTP id r8mr28906874ilb.152.1618330529304;
        Tue, 13 Apr 2021 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330529; cv=none;
        d=google.com; s=arc-20160816;
        b=vVtjeYEyvZHh+cfwQfvijEuOlUBTTptY7FApGwHnouk518T2DMJOTOx6yUFY0MrDRJ
         MX8fVuDFTV+aQswJfrSyfo8Cz/n7yRPQMJOPqZXvT4tpmUHecd9lPDpRSZqu/bSyqXmi
         RCAIUGIA0VUU56BM82ml+hf+yiaIJS4SiRR3FxKPHF64n1+FsuXv1rYOwBepBMFuQC9n
         gzCfwp2fuhslWbioPAPFHW3qEZ/5v5GvzdtL4Hb5ArqxduJKrfLmcBBN6/iNkQ3D42rD
         KgaWgTlh/JEwbr9M3jtPvwevVPIzWpa5H6bP2WCDZR3duM3b98Q3sV4cn9/0jyGPNoFG
         82wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zdbww2eZfuLbXUIxK79KlyCvFs2xptk6InEC6qngDcM=;
        b=galuH7pUjGzO1XUs5ILMAuUwAmsVFlBqXPK7NFjaLG/Gr/hwHp8y0kVt4tDABJ2mZP
         KnYFdYmq+5IoIsvEAm8SeNaeSqhBxnep4e8W5zachZltRxvofllNwT3Ei3HBoqCIKjhN
         L5ol+n93l22DzPubhiG97bKmFIQtKQ1FoLAQZ/B6npWFVhWw1yRhgM1oZG07ZoQJNcwo
         x8tRPyxu1/33J/RHJaf5gnoaKAWXBr2hE1XotAVQEiPvPlaVo2/djWgrz6RobFTVGVGo
         tc/as2kiGcGE6Uh5Tb8skuJC1HlfmUkJixtqYVXk1eZiAuZ7in79KfDqYlOrAzrkhsqh
         0kgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TJvozw2/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si16290300jat.35.2021.04.13.09.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TJvozw2/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLhI-0006e0-AH
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaY-0006PZ-9p
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006wJ-3n
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so1634202wma.1
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Zdbww2eZfuLbXUIxK79KlyCvFs2xptk6InEC6qngDcM=;
 b=TJvozw2/nXudNscTWJLSSgg5SAR8NuhCJieaqLNExiN4ClNkWy7AUXjkNw9oEdqJ2h
 nIy+cuJnqPHYoCHSP4DcZaM2WMT50TAKNk0AtZjw9k8V5YhrhDyKtyJNOpMXN8IdR9mT
 0GH6MgHiRD+jsByqgOj5Dqc6tMUfTaBk87AJnEFPQHC+JXq5DdnuiHN7tCs9U+a2pmrr
 zmXIzv9TVsBDGTfjpvFqkcjoJnSBAi1Y7d3tZujzcO4fPH9ltWDNK22VecXu1D2f9a1E
 OM72nqnxT+3lY7s4IgBOJup2Rp1jAeTXiH5erOrjMWDnTuNe/oQLMTXpXudfr1wHffSP
 upHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zdbww2eZfuLbXUIxK79KlyCvFs2xptk6InEC6qngDcM=;
 b=dVze+eC5oroQYsLwsAm9RbOg8Dh0JhlkOkBaPP4IqsfRPWL4b0rGekeiM7tUtzP4Th
 7KHKy704cJF4POlVBZS7YNJ45qPHx+YsijWmoAAh9sDUJo1z7fcEY5I5+2OJx9Se2k7x
 fruVgG1KE6Xg1F7UNG9m4Rj78WKyh2buk4zXq0SJiTsc85MVSt97961H/f2Loz+Wp0Lb
 vGVPLFGCMYTNhOYxfjDZnxMd0l561kSWb1PWodJfX8+mlzbx7ui2PqYu8ixhjVsKQ93j
 3xqIY2CI1+EFu0tsaeNgasakzUKPC+hYuvl54dfTL/A8ClfePg1HPt+rmQg88Ijn+Cyq
 x/qw==
X-Gm-Message-State: AOAM530CzbKdwahoOHOqOMTCJhOwJD2tuvLrvzv/t/yH48YfKLshnB4Q
 j2KIPT8nmJfMfJnASq5k9/4v8FEYoGBPu2V8
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr747606wmr.110.1618330101738; 
 Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/13] target/arm: Make functions used by translate-neon global
Date: Tue, 13 Apr 2021 17:07:58 +0100
Message-Id: <20210413160759.5917-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: xHJuFzb/7/rO

Make the remaining functions needed by the translate-neon code
global.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h |  8 ++++++++
 target/arm/translate.c     | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 96e6eafbde4..f165f15cc47 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -37,6 +37,8 @@ void gen_set_pc_im(DisasContext *s, target_ulong val);
 void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
+long neon_element_offset(int reg, int element, MemOp memop);
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
@@ -135,4 +137,10 @@ static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 /* Set NZCV flags from the high 4 bits of var.  */
 #define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
 
+/* Swap low and high halfwords.  */
+static inline void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
+{
+    tcg_gen_rotri_i32(dest, var, 16);
+}
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7f95ab16613..f6d71d03a3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -319,7 +319,7 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 }
 
 /* Byteswap each halfword.  */
-static void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
@@ -340,12 +340,6 @@ static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
     tcg_gen_ext16s_i32(dest, var);
 }
 
-/* Swap low and high halfwords.  */
-static void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
-{
-    tcg_gen_rotri_i32(dest, var, 16);
-}
-
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
     tmp = (t0 ^ t1) & 0x8000;
     t0 &= ~0x8000;
@@ -1047,7 +1041,7 @@ long neon_full_reg_offset(unsigned reg)
  * Return the offset of a 2**SIZE piece of a NEON register, at index ELE,
  * where 0 is the least significant end of the register.
  */
-static long neon_element_offset(int reg, int element, MemOp memop)
+long neon_element_offset(int reg, int element, MemOp memop)
 {
     int element_size = 1 << (memop & MO_SIZE);
     int ofs = element * element_size;
-- 
2.20.1

