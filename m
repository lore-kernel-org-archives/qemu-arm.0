Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp670108lfp;
        Thu, 14 Jul 2022 06:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1szjfun/sFi5NXcHpmJqg/V5sCDaOeV8OzUlqSVYhBJnjBbU/Cfpc4VcwqeTESUdJ6asgwB
X-Received: by 2002:a05:622a:1051:b0:318:bef0:636b with SMTP id f17-20020a05622a105100b00318bef0636bmr8028488qte.456.1657805520963;
        Thu, 14 Jul 2022 06:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657805520; cv=none;
        d=google.com; s=arc-20160816;
        b=usANcxwhYwxE7kqGiAQh1yj3BVReCxAGO+BtiG65SFZvK/emhKXpdzWkN/nvyad9xE
         XJJp1HeXdwjDOuAc/lhjKOh/4tYsb7hrMiFO/3hUfcRNlbd/U0V9Kp/D3AgZb61DPGeX
         /fJsApZgNBAGCn2EGLI58V8pS8A5QbWyyaZZ13vpDUGClRVQEj30C3ybsQCJ0Plvw4mg
         v66g+j6pHHl2YfV+guZUASuoSEWVNOHmOKLB3dcoZxWgaZqSTQqKd+JOnBeUCq4TQPeP
         kpLIgEPYS9QhtxNXSC51qFq4er4EHbwo0zYb7DUgseuDVsj4PqqwXiqjeUi6m7qDHp8w
         GRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wAKemPdqPQXfGwjlKzJeGaRkjIPujLLaF6bX3+dsuqo=;
        b=YHLyrsvYhqulNT+4S4Bk6ULhEFjQwQfngW4+eRC142HsB4ZpqfGcq+gf+07e/8Gf0I
         yuj1m3OihM7EYvFqyZxO+OOrEYdlgIF074OyOKatbK8K52/u8sVSxxCouj07O3FiZXyb
         fLCXZDPhSVfY7KUR9mgUqSv4HM6SdqWjuO41LWnchnhuo1JAxo5rJZ5SGtAR2OEk0M47
         iPqotHAJrMvd75VlXigdqrJVhdFQOHguetP4FD/76+YWWvK2NsjgnIqr3gR+IkrtYRip
         55lomwopVYctg1dfYbA9w5rw/hHZIR5SIok7XFYZOih5hhTsbmRIYx35sFdtYbfCxc6N
         7Oww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuBgYljp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac85dd3000000b00317cdbdbf07si1210747qtx.496.2022.07.14.06.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuBgYljp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBywi-0001LT-Dn
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoD-0002IW-Ea
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:23:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoB-0004qH-LY
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:23:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r10so2562918wrv.4
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wAKemPdqPQXfGwjlKzJeGaRkjIPujLLaF6bX3+dsuqo=;
 b=TuBgYljp1BPSf4BCcqHCV2gAyEQl7q33Qw35pbW1IGo8DQzpT0m2a05xiJRK+y8d5g
 AvWN1ILLlaBsYl48JFALZZARJ5tzQby6OT2MyNUQ5TlnFNJaaHJtWeK71ritIDp6NTJe
 cYPsY0aCApLbeizzmGw2eQwjyu8bQCpx5Gv6cdWgqaHNzDzH566LXsHk00zpWMFeedjS
 UwZTOtRwipdPI6jKC28gV+9mQHznWNToPmVxdA2N043UQy4j8gE/U1K1lVJlrCYLxkMA
 aqHwyQ0c+0l24W78RlhZsfZNkrJVq/lSTTdTielCIsdgwBMJ5t+QLS91v2HkSV/Co/id
 td9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wAKemPdqPQXfGwjlKzJeGaRkjIPujLLaF6bX3+dsuqo=;
 b=mHmrdPGMVYwJ+fPbO9DD7G+dEowkhWEhq4uWUejncb9A6nfzaWoGxEoDWiuGTqkrDg
 kIrJ1FyK7BUnCSUMi9UeCCQ+b+C6OtzdmgqrX67z7JiTY9GjB56IMbglcFyB96Eefyr/
 Og7paG45d3pR4Ss7pQ9vi4nWTS50krOy6ukPwf/KIqXo+aHvmoj5tpGNojkFzGXmHOlZ
 JLEAUPghV1BJN2oMER//abABCfPxSGYavxkr7fbhcpF6EZ+ipwGaF6NOywWIFy7b2gP3
 U7j189xjwAoLqbcYqMkXDYtGj2ST7uoECKUrgaQugNu9lrT71V+hIVtNYh/kgb3gJxs3
 Ze1g==
X-Gm-Message-State: AJIora99JjuyRn+DC0hX834Ell7Noi+k2yqGLv0WYazn2b3juhqYIkgz
 Yvlb71SuDClV1sCY7JjOsI4CM51jpn8Gvw==
X-Received: by 2002:a05:6000:888:b0:21b:b950:f4bd with SMTP id
 ca8-20020a056000088800b0021bb950f4bdmr8369221wrb.253.1657804990350; 
 Thu, 14 Jul 2022 06:23:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 5/7] target/arm: Store VTCR_EL2,
 VSTCR_EL2 registers as uint64_t
Date: Thu, 14 Jul 2022 14:23:01 +0100
Message-Id: <20220714132303.1287193-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: wdqS0Le5Jg9B

Change the representation of the VSTCR_EL2 and VTCR_EL2 registers in
the CPU state struct from struct TCR to uint64_t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  4 ++--
 target/arm/internals.h |  4 ++--
 target/arm/helper.c    |  4 +---
 target/arm/ptw.c       | 14 +++++++-------
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e36a839ee4..445e477c710 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -340,8 +340,8 @@ typedef struct CPUArchState {
         uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
         TCR tcr_el[4];
-        TCR vtcr_el2; /* Virtualization Translation Control.  */
-        TCR vstcr_el2; /* Secure Virtualization Translation Control. */
+        uint64_t vtcr_el2; /* Virtualization Translation Control.  */
+        uint64_t vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
         uint32_t c2_insn; /* MPU instruction cacheable bits.  */
         union { /* MMU domain access control register
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0a1eb20afce..9f654b12cea 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -781,14 +781,14 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vtcr_el2.raw_tcr;
+        return env->cp15.vtcr_el2;
     }
     if (mmu_idx == ARMMMUIdx_Stage2_S) {
         /*
          * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
          * those are not currently used by QEMU, so just return VSTCR_EL2.
          */
-        return env->cp15.vstcr_el2.raw_tcr;
+        return env->cp15.vstcr_el2;
     }
     return env->cp15.tcr_el[regime_el(env, mmu_idx)].raw_tcr;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7eee2007a0e..eaf6521c615 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5413,9 +5413,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL2_RW,
-      /* no .writefn needed as this can't cause an ASID change;
-       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
-       */
+      /* no .writefn needed as this can't cause an ASID change */
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e9959848d88..8049c67f039 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -241,9 +241,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
             if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
         } else {
             assert(!*is_secure);
@@ -2341,9 +2341,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ipa_secure = attrs->secure;
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
-                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                    attrs->secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
                 } else {
-                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                    attrs->secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
                 }
             } else {
                 assert(!ipa_secure);
@@ -2385,11 +2385,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             if (arm_is_secure_below_el3(env)) {
                 if (ipa_secure) {
                     attrs->secure =
-                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
                 } else {
                     attrs->secure =
-                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
+                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
+                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
                 }
             }
             return 0;
-- 
2.25.1

