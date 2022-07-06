Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4537255lft;
        Wed, 6 Jul 2022 01:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vR0nt1dMmxToIWYmquhOCIbqdjP4RbwOGQp63+mLFGM9PFPJVSRvBgxr2iaojBsJ6EPWKN
X-Received: by 2002:a0d:fd43:0:b0:31c:f619:a7c3 with SMTP id n64-20020a0dfd43000000b0031cf619a7c3mr765560ywf.252.1657096242132;
        Wed, 06 Jul 2022 01:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657096242; cv=none;
        d=google.com; s=arc-20160816;
        b=FNj8B5UhchAY3FeyMCYPnJTPUtqulSrPeItx8L4bCrhuBXgqhmenl7MW31QUNA3VJE
         ZkKp3Nz8IcIAsgOBKJCABnnoJt8k/plhELsu70Nk4hzk9qD10anUDHf6pF+pXzvFs+Xz
         Waf8gu6CIcC2Pn0QCyC9ZE+7kJrYPqcLGcaLIQ5e7OJGDHIk7vYGsRoEcCavOIUhB3iA
         r2pc3snqFXq2ZL6A9tYOu4FPkvAxZ7puvD2rqRRpoay9clX4cjg46oUxIjkF0DGMLv0e
         v/YG2aluM8m7m0D5EpYEFScXe42Z3WhECAbf/Cx2faj+ajGlBCOr32+hg77iXAOVm5J+
         yj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
        b=TXjkvzKhgMMfttrS583t05CM6MX2JsvE2GGymp/2BvBk6rnFGwOhKd0RBaoR4nyD3z
         vd/VrStPyhCmYKfxnsSx7B+KTNkdBmQlDFLBNqW861cAgpdEK6TZR1kn/5MzQ7R4G1y4
         pEhaBmHLgfbzlTbhZFZ1lc2nOIhSfpFIUjFg7fmLFtMFvmNkRmAhdBHPHvZ25ZuMdkRm
         BgijuO+t48CwFbyES1TS8Pu5bwXYRqvJN/fizIsDRdYrN9jbYWEV9CQkmksbMpWqcf6X
         jMROlMv/XuWYfaNyi7n5XdlZc0Q1glNQUulmA4/EhVnhZkF+//cU2nmSAkA8o4KDQx0m
         Vx1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfOpWNFm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k192-20020a813dc9000000b0031b66510702si46249442ywa.315.2022.07.06.01.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfOpWNFm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90Qj-0000Mg-D8
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kh-0005ep-7w
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kb-0000Iu-5t
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q82so6274179pgq.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=jfOpWNFmWX07NF4c4nXo0EhwOcvwYb9QFlHmyDhxV+IlM2CkjZwBJ8V8thX8Lsrodm
 20Inq8m/yG8003DrVuwa4NZge3eQ5clBNr0wrzCiCBENm28TwpdWFsBJ0v12yzGUhvEK
 xE7P/nD/PYDD21SNDB+bRkgEtRUXOAkTeCODLRSspsbl2t+v2dbRYyZnxolMzxwV51Vv
 vBBSaaajWekOoHSNw/avkdlaOtEWIXqAaBCxNZ8VfZJisCqW15HfqvhhrGTEOQCzykUL
 h6xtJoWW6lqETf4d588JZrzbsQChSopek4RBIQxlbwXPGp4vZWVmtVdtDwoaQwRDEzVs
 kVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=U2zlUqEEkOoaQje6G7927f++nCx7RTwWV7mXDA35q6n3w4DzNBKOYvpOGmTM9B0zoS
 ZVeAdOYqfhAluyAgmSiNM+GPZ01CYDOXdYyj5j40kH6GyCrtCjzCXvP8PofCIVnUleOb
 BInyoje1ARLjSz3wF68j7fBQW52kTiAt3n3WGM1d7DGjtLKpo2BGPbkEl1hxe0F0vcuO
 opODrxNkxrKHG+Ou2fcdSTPlKO+Bnh1Tt0SBwBk5epGUul9rkc1nHqU5YmRb0BOe2n1V
 UXECwghdZt95PN8/QhwQBaSEa6mfrpIG/idEqVWILPSiiNngfHemc01+mgZEovBNuqXS
 0vPw==
X-Gm-Message-State: AJIora/LsT5OGVam3HbkMbVu3KA3j2jCQ+/gbgITpKfIgSdlNziH8yoo
 T5DABC0jg4CSioINWtcLaRrPnihtvWwG0/qT
X-Received: by 2002:aa7:8b47:0:b0:525:4214:c195 with SMTP id
 i7-20020aa78b47000000b005254214c195mr47017842pfd.55.1657095859055; 
 Wed, 06 Jul 2022 01:24:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Date: Wed,  6 Jul 2022 13:53:27 +0530
Message-Id: <20220706082411.1664825-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: GvxWVqtXIaXx

Dump SVCR, plus use the correct access check for Streaming Mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae6dca2f01..9c58be8b14 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -878,6 +878,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int i;
     int el = arm_current_el(env);
     const char *ns_status;
+    bool sve;
 
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
@@ -904,6 +905,12 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  el,
                  psr & PSTATE_SP ? 'h' : 't');
 
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        qemu_fprintf(f, "  SVCR=%08" PRIx64 " %c%c",
+                     env->svcr,
+                     (FIELD_EX64(env->svcr, SVCR, ZA) ? 'Z' : '-'),
+                     (FIELD_EX64(env->svcr, SVCR, SM) ? 'S' : '-'));
+    }
     if (cpu_isar_feature(aa64_bti, cpu)) {
         qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
     }
@@ -918,7 +925,15 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+    if (cpu_isar_feature(aa64_sme, cpu) && FIELD_EX64(env->svcr, SVCR, SM)) {
+        sve = sme_exception_el(env, el) == 0;
+    } else if (cpu_isar_feature(aa64_sve, cpu)) {
+        sve = sve_exception_el(env, el) == 0;
+    } else {
+        sve = false;
+    }
+
+    if (sve) {
         int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
-- 
2.34.1

