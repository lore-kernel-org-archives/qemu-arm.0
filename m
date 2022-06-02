Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5211034lfh;
        Thu, 2 Jun 2022 15:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEgkXrGogQMeHRUXabUWGqJAjwVz9x8Ge1yBz2f8ZszGFU2LEtKp/g7eiaDxORLty5NBaX
X-Received: by 2002:ad4:43ca:0:b0:462:6110:db3f with SMTP id o10-20020ad443ca000000b004626110db3fmr5139358qvs.118.1654208377136;
        Thu, 02 Jun 2022 15:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208377; cv=none;
        d=google.com; s=arc-20160816;
        b=B+cXUkbfMXmxMAJXznGSesBH/5HxHZ9dAxwoUYwsxFyvrLobx317u/zNtC7ok8nIxP
         UCEuleQiUNgLQp7R7gUibZATwFj7chLiryDSYIDDehSt70GKHL9ktNJY4/SJ3TwY5jnE
         MzQR3a2wjJqyYB/sJvIP3A13F+zyy1zSABC2ntR9xl90LZf+qX53ujas7QY1QpeeD0aS
         OuyjD1UYOQYKE0Y6yBMcBLR7uStsLoLmj/sguvi96+3RNUuz8Br1bJ7uBw7JqU8IXtHG
         a0EzGLvRDGAFnKA7ZikFaSZJE8hKrmTVT7qBb0coat9Pq5wHFhKozCrwlrmVin5DTVSF
         7LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0kEodHx06fEclTgSZQr1FM7FKwrQ5Md0/7IEVtNiVsE=;
        b=Qb1+SmNoJkx2C2aG/7Bh9Z5exI00DnqDoas7CQkBiY0Ksyv3wFraBfumwIenMxm77g
         45Pb51Y9SfKV01/nbyAESg18OAe9WRzrSyjV7a5E3lL41DMpQvjx1MmBF7WNQd6WGBJJ
         i1yDWRTGdxuOBA01TsKtf8jx6MOcOohPCN0wUrGV0TeEmlvHH9MEXBzp3IXskIGEawUY
         DGHzG2ZUvaVvLukASBtOumXpqRIMiZJdtr3KwSgOEJInplpes8vpXER2O1RNz334fMcW
         4khi5zxGIMshMSe0APtV4Heo9GPiS3D7P/z/uWCR+vczpYIwPdEQO1AARqSy+dVfJiEF
         +ovA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rb/EeB/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de18-20020a05620a371200b006a5cf2bebeasi2571946qkb.499.2022.06.02.15.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rb/EeB/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtAG-0001qP-Li
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgx-0004qf-7X
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgv-0000Ai-HZ
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so7460072pjm.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kEodHx06fEclTgSZQr1FM7FKwrQ5Md0/7IEVtNiVsE=;
 b=Rb/EeB/E2KaLKNbMwrl8y/jsEwm0gP3vyzOylYAyRD9YcCw1jKxvAbg0c58eGuOJE1
 1CaIXgnMmCJyx84QQjlM/EWL9mJhz+JW730sQl6au1XJ5uKvrruOBtq/fX3BaCUn4okI
 FffM5mzDBx1qYsrqk/u6IV13Jw05Qvao9+ownGb9iMoGM1S3Ij0nL9izjYkXtwWYklS9
 uTCa/xqtrlAP0sOPOO6e8LWt/KzP7lM1Prj4ppoV2PZaX61bSCJjRi4JAjko4EvEykLe
 TAC4RLvL89Ol8W2yxFKaEPa9vh/Aufz8icERDa5uzN2Dcu/9gapDI+Ejr7CADRR8gzCg
 k6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kEodHx06fEclTgSZQr1FM7FKwrQ5Md0/7IEVtNiVsE=;
 b=aRTGE99WVg5ebQbzSmwWUUO6xCp1XWhABrdGH1IMqUVUvZso17ZkRJDI4VWzKciDAT
 TptKjCCVvowIjxwQEh7RwtXeu/z2yliVhploWPW+F4iCvrvxjMfMJvwCtwPPKSdx8MRd
 GM2iLWhGjug7RRq6vq8fiStRBl3IG7YXp8NqgrWL0aks8plk0FRAfgCo0JZS/7XRzTZu
 z81f/fgL2e2ECOBNQi+qUMUCGCO6k+rUKeYybcNEO45h8YvHFUMrzWu2yA/5lnrWGebg
 jHe+xxwHa/nsKwR+Z7bYjx4BIYn0CkcfGwJtYAboTBPKl/xRdZrruyugllYQ+u1uSRNm
 vx0w==
X-Gm-Message-State: AOAM530KhUVwVqdeUib1a4jWclRJRYAfDx4ENI3GR7PzSqXSA2l4wuAT
 MRzTjPYm+vgrfzooIRno6xbEZHHNjdrggA==
X-Received: by 2002:a17:90b:1e46:b0:1e6:826e:73ea with SMTP id
 pi6-20020a17090b1e4600b001e6826e73eamr6611583pjb.68.1654206556182; 
 Thu, 02 Jun 2022 14:49:16 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/71] target/arm: Add SVCR
Date: Thu,  2 Jun 2022 14:48:07 -0700
Message-Id: <20220602214853.496211-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PMJ9zokZDtJd

This cpreg is used to access two new bits of PSTATE
that are not visible via any other mechanism.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31f812eda7..31b764556c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -258,6 +258,7 @@ typedef struct CPUArchState {
      *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
      *  DAIF (exception masks) are kept in env->daif
      *  BTYPE is kept in env->btype
+     *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
      */
     uint32_t pstate;
@@ -292,6 +293,7 @@ typedef struct CPUArchState {
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
+    uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
 
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1428,6 +1430,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define PSTATE_MODE_EL1t 4
 #define PSTATE_MODE_EL0t 0
 
+/* PSTATE bits that are accessed via SVCR and not stored in SPRS_ELx. */
+FIELD(SVCR, SM, 0, 1)
+FIELD(SVCR, ZA, 1, 1)
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 98de2c797f..366420385a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6353,11 +6353,24 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
+    /* TODO: Side effects. */
+    env->svcr = value;
+}
+
 static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
       .access = PL0_RW, .accessfn = access_tpidr2,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+    { .name = "SVCR", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, svcr),
+      .writefn = svcr_write, .raw_writefn = raw_write },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1

