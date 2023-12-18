Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp725375eji;
        Mon, 18 Dec 2023 03:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMFtfvCiG2YX4nvGx6AmPuF6747nPjPF3OlSvAF3qHZPHkfF0ZSFjZK4oJNibNa533cfHC
X-Received: by 2002:a05:620a:3710:b0:77f:6d2:9912 with SMTP id de16-20020a05620a371000b0077f06d29912mr21440554qkb.38.1702899586123;
        Mon, 18 Dec 2023 03:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899586; cv=none;
        d=google.com; s=arc-20160816;
        b=Klrm89HO4Yx0FCJWJfSCIt4rMC6doFlxsLb0gAKVX4VlnKBlzw5RvWdy7pJJ4h4dae
         bUeqKr6FSKQHM1eg6QtxYsNV+pY7lPBtpYulJH2pSxYQGHhAD6uIw3F3zv1fEI5ejekA
         zAOWn+GnZRkyjvOe2Clp89Xd+w6B7Jz8IaVJMhYcp5WftS3+AwtuXnUYzoAvrvv7Eh7o
         oyLHASlZErNG4anmwOpkYvHC4krHCWO0PtZgrKESLzVwtBWyR27QgiQybtN6pDEe8zyD
         0d+3uy+5FiPN+iY9scZBchyXc+bMLzPD/7sxh5tDBysjTORRQHHSScVYv8A6uugkvaP4
         zDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q35dnGSoWYO7P8DMUTU7ajk5KESZuoV9yrkqAnTLLr4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=JNoTWEX6ZZPzlpRaJzyJdazb4/VFqw9od8BXeymz5TfqtyOLBBxjvegZDE1THqEncW
         n7ARRbXO8ZGRABjCzbS2QAOxiMaA/1h1WS+zzjxUzH3b4n/+Yp4h0MKGhI9B0W5bZmhu
         e2GcDv2Ct4rzHKDh0yvV7mxtXsJEhQlWO1kzubNTgy8R6CLSfIMD2JZI0BKz+S4JX315
         SwDdhFm+gRT5HGJH1atld1ns+1psyozil92GSVejlOvKUd2hoJ2tHnYKC81QvHRfRd/A
         uYd8OC848VIMbhKM+u40nNyDV0gALLxtds4QG8+MUEPJznVT6MsfHI0Wge9OsbUwv5Ao
         B0Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYao5VST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a44cb00b0077da5e2ff28si25702052qkp.289.2023.12.18.03.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYao5VST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsD-0006w6-Kb; Mon, 18 Dec 2023 06:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsB-0006i0-CX
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs4-0003Ka-87
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c236624edso31644645e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899194; x=1703503994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q35dnGSoWYO7P8DMUTU7ajk5KESZuoV9yrkqAnTLLr4=;
 b=nYao5VSTSJGY/sgatcbVE8k781YpT0WKZ6sxJXUx6tk9Pk+eiRm2oDaNxHoqkLxSgU
 97SlGWczHtvTu+pJz73SjK4oi1CeZf6ApHdvm4fhzKpL1zZZUylDArhOFO7XaxCPZiIH
 O3UWyUBTneIxAZz/uIDsEHZ6IDa8dnnUeFmJxsOORZNSh4X++jDVsN8Z3JIEraEOPIXI
 ObHM9AI49QsCyxQNOttx0b1rPjp5uNKa4REAI1JaMt8OY+bl0LZNRtC35n9C+O8O0hfF
 NlDzoTp6it/3eNvjrQe80ykMcjtRFWJh5pOjVQLFqVQJxMkwBvVmhLLmkXE/8w0WfHmu
 9Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899194; x=1703503994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q35dnGSoWYO7P8DMUTU7ajk5KESZuoV9yrkqAnTLLr4=;
 b=QGmZP0rfia4EogWFGS9ZW65UnZKZkaRh137u1NGpdL+XzS6wOEUEfyPcQaqwx2hlsI
 dxGNPMRCYbpbFLkKrgTnzBTl+xWev372Jx7GH3sGgom9jP+RdPBV4S768uQSyR19eL1I
 oFY3w15uYqVB2WroLBAfJzS0MTVxSnQzpju3EClQiqSYXLlx94yoKbsgl4LsE/KXYh8V
 DfF2wuNqCkgfw/+6dCEp3Ct798cadfKXR4z2jGlilYdCjha5ejXLFypE/uB2GfnpDTVi
 sGVwDa1Y6cdCCb7FaKmOTaZEiIJdZnTM7Xqu8YghwTlw9es4WetJqn/vsmyPkE5rWZqw
 Bl4g==
X-Gm-Message-State: AOJu0YxzyYreg9pjTf/g0nHLvvpyLuIsrUBU41Tjj/c5QAlpadm2regh
 IKOKg/s6VOg1gAcfHp90uvHsPoH2cGrxF2GoTvU=
X-Received: by 2002:a05:600c:43c9:b0:40b:5e21:cc1b with SMTP id
 f9-20020a05600c43c900b0040b5e21cc1bmr8517830wmn.70.1702899194637; 
 Mon, 18 Dec 2023 03:33:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/35] target/arm: Always use arm_pan_enabled() when checking
 if PAN is enabled
Date: Mon, 18 Dec 2023 11:32:47 +0000
Message-Id: <20231218113305.2511480-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: i1kPf3CqdZ0M

Currently the code in target/arm/helper.c mostly checks the PAN bits
in env->pstate or env->uncached_cpsr directly when it wants to know
if PAN is enabled, because in most callsites we know whether we are
in AArch64 or AArch32. We do have an arm_pan_enabled() function, but
we only use it in a few places where the code might run in either an
AArch32 or AArch64 context.

For FEAT_NV, when HCR_EL2.{NV,NV1} is {1,1} PAN is always disabled
even when the PSTATE.PAN bit is set, the "is PAN enabled" test
becomes more complicated. Make all places that check for PAN use
arm_pan_enabled(), so we have a place to put the FEAT_NV test.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3270fb11049..4b0e46cfaae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -263,6 +263,15 @@ void init_cpreg_list(ARMCPU *cpu)
     g_list_free(keys);
 }
 
+static bool arm_pan_enabled(CPUARMState *env)
+{
+    if (is_a64(env)) {
+        return env->pstate & PSTATE_PAN;
+    } else {
+        return env->uncached_cpsr & CPSR_PAN;
+    }
+}
+
 /*
  * Some registers are not accessible from AArch32 EL3 if SCR.NS == 0.
  */
@@ -3598,7 +3607,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             /* fall through */
         case 1:
-            if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
+            if (ri->crm == 9 && arm_pan_enabled(env)) {
                 mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
             } else {
                 mmu_idx = ARMMMUIdx_Stage1_E1;
@@ -3714,7 +3723,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
-            if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
+            if (ri->crm == 9 && arm_pan_enabled(env)) {
                 mmu_idx = regime_e20 ?
                           ARMMMUIdx_E20_2_PAN : ARMMMUIdx_Stage1_E1_PAN;
             } else {
@@ -12222,15 +12231,6 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
-static bool arm_pan_enabled(CPUARMState *env)
-{
-    if (is_a64(env)) {
-        return env->pstate & PSTATE_PAN;
-    } else {
-        return env->uncached_cpsr & CPSR_PAN;
-    }
-}
-
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
-- 
2.34.1

