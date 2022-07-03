Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2448313lft;
        Sun, 3 Jul 2022 02:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUaoUcq2cCVpNSx3aORgK6i3dgQEo5KWvVU4ud+T18s9UF9f3xR4lDSjQNRxcj9h5fDEv2
X-Received: by 2002:a25:8182:0:b0:66e:2037:7052 with SMTP id p2-20020a258182000000b0066e20377052mr7093087ybk.346.1656839154946;
        Sun, 03 Jul 2022 02:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839154; cv=none;
        d=google.com; s=arc-20160816;
        b=bAIJbBqG1kWJ4ra9nZCIyyEEZHBy+BnFNfLn31PQ1/5EK2kNSc6OAxDYT6KfNMP8xL
         YtCP/IZrKMaogfUl9UtJZwV8ui9FttFijBrMtsEIJWAmczg0TtXHVnvOyOv3vEqv4yYI
         +fbIC8JOHF1JcqOOJkgodXebqaiTdqMkq3FD1Fzb8goYwvih+KI0n0uxjtoqR5LfSkUs
         IW2rgSt7EeCm1OkMZxGxR/FbKF6i9XSfmr2JcwMnesmRG6e1szerBaBgNHbYdsPJgU7L
         c1gpxjK8N96xCvRU4KBzr9+koE+Kihwu8bnQvoKfDL8njGlqfTrJTCJpaIbnKqh3l7OW
         kE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EdP66MHMryaQaJvVD3+svd3zvQ53nAmBQ9v9hny/93Y=;
        b=BEO/ZtzwXGB6rhctRV0PhXF+S8V0EqtgD4cwJWCgQS9BCFqD8sPU2GkJm5c8lkVMCq
         P3iWWaz4l63VkbfELBKe8DsqCt4+m+ZGu+b4Rmb/fRgYfkPls0TsQbuS+3DEB4emLPLW
         9Foie305wSiA8Fxxx6p5xpRWtIX1PC9MVICtCopXrJXIlX18xJSMAFOVQ3HsScKvYLSz
         AC1GT15X0/swg5tgKJu/rmOEwS3JvvR9+YOEM4p7wm4bcorY0EMw42cdA1zoVnDX/6Kt
         KAENEThR6M3QLu1kreCeCQp0Hs14HQzPTRfmZ9HTY4ZOvjQbcdsnd1R5GgwMlOLD29Dw
         45lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWlIMf0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a252d47000000b0066df7789518si7838483ybe.108.2022.07.03.02.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWlIMf0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vYA-0001BO-8l
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzg-0001ax-FN
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uze-0006gb-Oe
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so10564340pjm.4
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdP66MHMryaQaJvVD3+svd3zvQ53nAmBQ9v9hny/93Y=;
 b=IWlIMf0Sei8CaQrDB69wVfNB8V+/QcKjiIThPjsGm2spNV7nGK7cr+MLfGCsZV61Eg
 dvmrDu7lGUjmGlnd4dOckNmJgndK9JBM3KjP2OaYYcBA3NnPFYZOcP6IIKetSzNXVLPB
 FTK+MJB1J0HIzOWkNlXBzOiyVzlikME8QrgcSaVZRzn/xGSDmYzmIZSY1dy78WSe9PN0
 BR+I6tVB+jbtIHLMEOBE0jI3QtVjRBN8WFSfkJtS9gpgIcIyiItjPJqsXCia8KdNWpaB
 yxRddIXMeqi9l6NAGRDxsWARta0uj+t33unBEzUwLU95xdAhEmjnnbUBYf4RyeyF6mp4
 Yu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdP66MHMryaQaJvVD3+svd3zvQ53nAmBQ9v9hny/93Y=;
 b=I7c8L9lqtVaHpUYlVWsX14ouW2RTUt4uC2Vd8mu+OvAOrc3dvpAKUN1TLvX0uv2u7b
 b2AYBDdruoAsn9Srx4MHtWE8tvQ/ikMiI0QGJgzV7QmnsH7a35B8BGpvUsP8hMYuspkx
 nLxgfvnJXc61jBJT5GrBDC+7F5OpOzZhhIu7phaYRFK87V6pOCNP+VjX2hozulMBIGOW
 AiLh2Z7Z21gCW7gpNlW/KlmmilKKOcEU1oiFOvpD3KwgLN+Qpuqt1/Xsfw5fkYdM1x2D
 +EGlTTV4iiT0OOenXnfr2EOkF1BMGfNqAoah8wG2tD8L6JFkDnQpU/lKKLk+5MtrvH6p
 CKJA==
X-Gm-Message-State: AJIora8Dt/8Mxc8k8MyGX8DfYD9iXpf53D26XGP9Ct09VDfX4LAtVa8K
 hvzBwVulX2O/z76oQXZDjYPs/w==
X-Received: by 2002:a17:90b:4b0e:b0:1ec:df4b:33e0 with SMTP id
 lx14-20020a17090b4b0e00b001ecdf4b33e0mr30736076pjb.73.1656837014086; 
 Sun, 03 Jul 2022 01:30:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/62] target/arm: Move be test for regime into
 S1TranslateResult
Date: Sun,  3 Jul 2022 13:54:12 +0530
Message-Id: <20220703082419.770989-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: mJfUzse4Ha5E

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 32937ec7db..b5105a2e92 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -192,6 +192,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 typedef struct {
     bool is_secure;
+    bool be;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -261,6 +262,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                         ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
                         : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW));
 
+    res->be = regime_translation_big_endian(env, mmu_idx);
     res->gphys = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
     return true;
 }
@@ -273,7 +275,6 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint32_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -281,10 +282,9 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldl_be_p(s1.hphys);
         } else {
             data = ldl_le_p(s1.hphys);
@@ -295,7 +295,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldl_le(as, s1.gphys, attrs, &result);
@@ -316,7 +316,6 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint64_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -324,10 +323,9 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldq_be_p(s1.hphys);
         } else {
             data = ldq_le_p(s1.hphys);
@@ -338,7 +336,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldq_le(as, s1.gphys, attrs, &result);
-- 
2.34.1

