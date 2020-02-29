Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1322214lfg;
        Fri, 28 Feb 2020 17:34:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBjffBWzzkAPcOTnX6YKR9grp2j7R8NBJo9dfSqAkkvil/4RYrv5s0zXOJ73wVBhlbeiPr
X-Received: by 2002:aed:37a4:: with SMTP id j33mr6874450qtb.363.1582940081726;
        Fri, 28 Feb 2020 17:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582940081; cv=none;
        d=google.com; s=arc-20160816;
        b=rgYB7qh4kbNFlOqOV/qr25VMKe6D82kEKqy2hid8U+hAew1e5nbq1yLOk49wki62RW
         X+cgpAbaS7xV2BqyMbMVadE6cDgPBrqDkY99s9yynPVchdefds/8Jo38QfQ3MWe7VMZX
         NRmSMqEOwv9hkJZUmEKJF0t2Fp1WjebeaiTpO61puaowEMfE1NI+dxum/IT+2XWxcJJk
         MoyVUdiX2gMXgI+6Jn6sYAiVp/LW+F7y3H3zLVi6vwO4g4sh8B82Gve5bfDFN9M4OcYI
         8Bov7+gBzGoGofE3AKpTXrlI9/iv+GvDM7jdInOR1SMp6QXHoYiaqjcJ1NLu8z1RysHx
         WFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tJiUGzvYuoPuLk2QE0BCekDbY5+UySrzDOvHDIAIJYQ=;
        b=YT5/9/k2cYbIu88rfv00zUShcljoKYbXgdLxGY1meyHezFQJ4FOZw+jOEr+TS0VynA
         AVK6hjQ8W6CBAPGoiWnHGoKSb9h3U6MyxLUzGqyswRk9UKt+ezqQ/UZrmWE0asZl1iYo
         kQu6QKFgJsBHkqJ3Zxdjt8yARUQW0fugqpt9L9C2ovg40vjmEEmWgu1B4HhW1loYRvjY
         Fohi0Wd0AWlCFwjQ5Qua44/xoOxxS8O6h9ABPkhOdNfdS7IJ8Sl6kN3n6Gqs3KiUg6nk
         6uEfW7cBpgAss5W448e+KVhaQkjOg7YkqEhIKyknPXDGVbP2oTpKP/E/efFNh5v89l5W
         Fw5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzI2+ptr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si2249456qki.241.2020.02.28.17.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:34:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzI2+ptr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7r1d-0007az-5t
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvh-000503-7j
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvf-00068N-1g
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:32 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:32776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvd-000671-T7
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:30 -0500
Received: by mail-pg1-x543.google.com with SMTP id 6so2406168pgk.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tJiUGzvYuoPuLk2QE0BCekDbY5+UySrzDOvHDIAIJYQ=;
 b=TzI2+ptrLaBOMBwL7ZVHvMwS7/PgSNAAT2STHQGL8rnda3G4X9kOGtBwrFDjiZntsi
 ogt+UIygL8rFO+zUGCGUVC4sOgO15541uHQSY/QD2BZHM3C/5ZOvFQuPxRWnH6C6rNWE
 2scWi95BjQxW1Olv0NDg5WzSNDz6gic2Sw1AdsZvZn177dTTaUDSGhuQ9BUstzPuF4uZ
 LVGX0ICma7TjarSMHzka/8S1eii+oicwJDbLALt6ZbaUBoYTGTMCHpK6sfAcdQmwqyWE
 OPFP6D8rhkZPOuzrcDT5qqcd06bSvopuQXGgT7Qccge9AMjdu6EJ7DWkFiX+VXhFUAHr
 0oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJiUGzvYuoPuLk2QE0BCekDbY5+UySrzDOvHDIAIJYQ=;
 b=jimD9JgxX1yv+v0KkIdxCOUkGLCirqh4JxOrSH7KUolmjBgSpXHrUFHOwmt/DaKmUL
 yIFnJISNJUmD91wmOAzbWLYjcRrraJ92TrPDycc5YUfTak2qHo0c4/4CsLdqHaSfZ0dp
 i1+hxwgNjuWH8cOpEMw7CQ3KJnvgjbsDVDCnd8vw7b9MktwS/OmwF51K0K2qFJmC2Rm4
 Isp0Ut9MRGgXaZQX81L192zewAkHlHytJ/D83nb/CZqA//KjO61znXg3rcg2INqOVY3G
 tVcARJtNAaEH8k0CdM0Jq1OXWJTJR9ztybfhYsC6lG7BBZwbwT8PzbcdWuSONWVArlvJ
 93KA==
X-Gm-Message-State: ANhLgQ1XQx96IX2bI4/RT0VuLl0fZehALrb5iQFuxvfqez83aOsCMZkj
 baR8ympHpkccm2VzwHYc94yS7Zw/Ovs=
X-Received: by 2002:a05:6a00:2d3:: with SMTP id
 b19mr4066314pft.2.1582939708659; 
 Fri, 28 Feb 2020 17:28:28 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/12] target/arm: Honor the HCR_EL2.TTLB bit
Date: Fri, 28 Feb 2020 17:28:10 -0800
Message-Id: <20200229012811.24129-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fwZKgSZIjz/S

This bit traps EL1 access to tlb maintenance insns.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 85 +++++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 30 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40faa70cb7..2f148e0dc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -563,6 +563,16 @@ static CPAccessResult access_tacr(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TTLB. */
+static CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TTLB)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2285,41 +2295,53 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .type = ARM_CP_NO_RAW, .access = PL1_R, .readfn = isr_read },
     /* 32 bit ITLB invalidates */
     { .name = "ITLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiall_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiall_write },
     { .name = "ITLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_write },
     { .name = "ITLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiasid_write },
     /* 32 bit DTLB invalidates */
     { .name = "DTLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiall_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiall_write },
     { .name = "DTLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_write },
     { .name = "DTLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiasid_write },
     /* 32 bit TLB invalidates */
     { .name = "TLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiall_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiall_write },
     { .name = "TLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_write },
     { .name = "TLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiasid_write },
     { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimvaa_write },
     REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     /* 32 bit TLB invalidates, Inner Shareable */
     { .name = "TLBIALLIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiall_is_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbiall_is_write },
     { .name = "TLBIMVAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_is_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_is_write },
     { .name = "TLBIASIDIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbiasid_is_write },
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .type = ARM_CP_NO_RAW, .access = PL1_W,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_is_write },
     REGINFO_SENTINEL
 };
@@ -4780,51 +4802,51 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_ASIDE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
@@ -4910,14 +4932,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 #endif
     /* TLB invalidate last level of translation table walk */
     { .name = "TLBIMVALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_is_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_is_write },
     { .name = "TLBIMVAALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .type = ARM_CP_NO_RAW, .access = PL1_W,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_is_write },
     { .name = "TLBIMVAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimva_write },
     { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .writefn = tlbimvaa_write },
     { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
       .writefn = tlbimva_hyp_write },
-- 
2.20.1

