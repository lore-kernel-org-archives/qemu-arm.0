Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp363231lft;
        Fri, 8 Jul 2022 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suPXxF5j9UZs8L6xxTQPa3rqM6bYzqg3NAi6P5DDviuhDEXZb+nIpVzDOGogK7IPYwy/yo
X-Received: by 2002:a0c:e504:0:b0:473:28d3:f09 with SMTP id l4-20020a0ce504000000b0047328d30f09mr3294668qvm.119.1657296550778;
        Fri, 08 Jul 2022 09:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657296550; cv=none;
        d=google.com; s=arc-20160816;
        b=cAjDcAI06+xS16ENRyTDgB+9YRIQM1FM/MFJhuPyBjc0AihtViriAFUoCn5D0dYoi1
         jYOObZ4FhygKbaREbyAgWundRyVw94LJk0HJloDxT0SYJHwSJfHSr3NVDYpdXxjHxpB3
         O9HjlKuZWypGgQPIhivFoi6EdCKEYvxXpuFBfCpf4FNe3lg7qtWn6/CmzoIAjz81XF1q
         tbhU4DVC9PET5ePUhv+3uEEgjTtlJlzcig+gQFnPalJ/m8nPD6t6ORimOVP0QI2qEkI/
         6HGlMBnrSmWhSsGj3O45U0ZFHyOS0UOET9gv35ars0O2sq482+tAks6ZdKPz7nEHCNSl
         HZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vlO0Hy0xq7x5BD/ngIXXowwVL1t8ftN3CmLzeuQQxqU=;
        b=H7PmDglJvIfXHckEgEGrYs1Amw+HuBylW3QX5Y/auviVfWbHHkoB5aWblxlRmvwoax
         DfuOSsFv2ORc25GTZ4B9xjVvL29YKLdJBeZiAQjtLSlNB6xCAkthETPxrVzwt/0FZQjl
         tkjKlch22Gx+DlIdVtw3f/O6hpzeKjENph+hzv2J5GiBwDm3q5bt6bTpp52K2ntzOpLK
         RAVC8iQA8sUKnAHSrvUuJgMkWZ7cKafDaHHiB1ZLj3Wynsm4zIJLJGuLG2BTH9MPekvN
         0MhXUV4NJ6iS4N88OKlXDwYB6YYGcf/xTR+myggUN7i/yrROj7ZvL0e5JSsn5loZ19wU
         UN2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k7NtZtb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q36-20020a05620a2a6400b006b568ff7348si1028797qkp.30.2022.07.08.09.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k7NtZtb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qXW-0007Pe-8R
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD9-0005yj-Ao
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD7-0002XV-P1
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:07 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y18so8655526plb.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlO0Hy0xq7x5BD/ngIXXowwVL1t8ftN3CmLzeuQQxqU=;
 b=k7NtZtb/c/RkM48ccJZB8FEawARumCpACdsbVAjUMYfQBdDRkLJvoSlJBjkWs0sbop
 knQ1w33qO9tHTCwgcBw7LwdkhKAnHB4Aelc0jSFkbg89qLRu3iZTmLSe/2RuX+WA/x3c
 3RTtUqArfNriGtvemu1ILADTB6L11CH5yFB3+eHmfT54inJlKfHrGKNrMTEGR+cJrezP
 cTxpMtiKlzvODNybmacg5nMuN0umBo4oiT8CEAMc0KH5rxUxrjoeFvdtx3ibsKqoXJ5j
 dtYJDt5hwwGcDo4FPwH1XQXLjcpeDQcl8g6fUj4Al19fYB+klYtk0a5UWL1tPXJvcmPu
 +9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlO0Hy0xq7x5BD/ngIXXowwVL1t8ftN3CmLzeuQQxqU=;
 b=kzWtNOCM8u7xViphw96KC4s5b7kXpe8EzRxng6KdAMqEQK9VTEjEpOBrzNEDRvuwbq
 kYONZEwfQQmPwlJX3zFwpmP6qfXpQPOmB9MUuHLxEgmwj0Pnc96AVPYV+BDNxRNEQdfx
 I3O8jXHUxmwqbLTktrK4CGrfaFZ3bn4bLNFmAS5Sn23cusjG4+j7Xk9M+YY+pNj/+NMy
 Gc8sjbllQVHU07wyU/kN1ZPMVNqxZvjZrgFJb6lguiLbfbYvoJjwLWsaGdyQVIjYxa0o
 5toTYeCV5TeIcgU5NKThovLPmIFqPuXUXcbjlwMunkRMmzas+exZWQa79JF1CIHu/EEz
 +biw==
X-Gm-Message-State: AJIora/klrWy+Gje/rkUP5/28mxcboZ6ErU3Qe8eDySc2GCApotWAlHM
 VpPfpwIDS2WtcjonOfErQWgyGw==
X-Received: by 2002:a17:90a:474c:b0:1ec:f898:d85b with SMTP id
 y12-20020a17090a474c00b001ecf898d85bmr518525pjg.11.1657295284590; 
 Fri, 08 Jul 2022 08:48:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 19/29] aarch64: Assume system support for SVE
Date: Fri,  8 Jul 2022 21:16:50 +0530
Message-Id: <20220708154700.18682-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 2sf/ZL1l0DBs

SVE support is no longer new, assume it's present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.h |  4 ----
 risu_reginfo_aarch64.c | 24 ------------------------
 2 files changed, 28 deletions(-)

diff --git a/risu_reginfo_aarch64.h b/risu_reginfo_aarch64.h
index c33b86f..efbca56 100644
--- a/risu_reginfo_aarch64.h
+++ b/risu_reginfo_aarch64.h
@@ -20,7 +20,6 @@ struct simd_reginfo {
     char end[0];
 };
 
-#ifdef SVE_MAGIC
 struct sve_reginfo {
     /* SVE */
     uint16_t    vl; /* current VL */
@@ -29,7 +28,6 @@ struct sve_reginfo {
     uint16_t    ffr[SVE_VQ_MAX];
     char end[0];
 };
-#endif
 
 /* The kernel headers set this based on future arch extensions.
    The current arch maximum is 16.  Save space below.  */
@@ -50,9 +48,7 @@ struct reginfo {
 
     union {
         struct simd_reginfo simd;
-#ifdef SVE_MAGIC
         struct sve_reginfo sve;
-#endif
     };
 };
 
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 7044648..16a57ba 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -24,11 +24,6 @@
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
 
-#ifndef SVE_MAGIC
-const struct option * const arch_long_opts;
-const char * const arch_extra_help;
-#else
-
 /* Should we test SVE register state */
 static int test_sve;
 static const struct option extra_opts[] = {
@@ -39,11 +34,9 @@ static const struct option extra_opts[] = {
 const struct option * const arch_long_opts = &extra_opts[0];
 const char * const arch_extra_help
     = "  --test-sve=<vq>        Compare SVE registers with VQ\n";
-#endif
 
 void process_arch_opt(int opt, const char *arg)
 {
-#ifdef SVE_MAGIC
     long want, got;
 
     assert(opt == FIRST_ARCH_OPT);
@@ -64,19 +57,14 @@ void process_arch_opt(int opt, const char *arg)
         }
         exit(EXIT_FAILURE);
     }
-#else
-    abort();
-#endif
 }
 
 int reginfo_size(struct reginfo *ri)
 {
     int size = offsetof(struct reginfo, simd.end);
-#ifdef SVE_MAGIC
     if (test_sve) {
         size = offsetof(struct reginfo, sve.end);
     }
-#endif
     return size;
 }
 
@@ -86,9 +74,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     int i;
     struct _aarch64_ctx *ctx, *extra = NULL;
     struct fpsimd_context *fp = NULL;
-#ifdef SVE_MAGIC
     struct sve_context *sve = NULL;
-#endif
 
     /* necessary to be able to compare with memcmp later */
     memset(ri, 0, sizeof(*ri));
@@ -110,14 +96,12 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
         case FPSIMD_MAGIC:
             fp = (void *)ctx;
             break;
-#ifdef SVE_MAGIC
         case SVE_MAGIC:
             sve = (void *)ctx;
             break;
         case EXTRA_MAGIC:
             extra = (void *)((struct extra_context *)(ctx))->datap;
             break;
-#endif
         case 0:
             /* End of list.  */
             ctx = extra;
@@ -137,7 +121,6 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     ri->fpsr = fp->fpsr;
     ri->fpcr = fp->fpcr;
 
-#ifdef SVE_MAGIC
     if (test_sve) {
         int vq = test_sve;
 
@@ -184,7 +167,6 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 
         return;
     }
-#endif /* SVE_MAGIC */
 
     for (i = 0; i < 32; i++) {
         ri->simd.vregs[i] = fp->vregs[i];
@@ -197,7 +179,6 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
     return memcmp(r1, r2, reginfo_size(r1)) == 0;
 }
 
-#ifdef SVE_MAGIC
 static int sve_zreg_is_eq(int vq, const void *z1, const void *z2)
 {
     return memcmp(z1, z2, vq * 16) == 0;
@@ -241,7 +222,6 @@ static void sve_dump_zreg_diff(FILE *f, int vq, const __uint128_t *z1,
         }
     }
 }
-#endif
 
 /* reginfo_dump: print state to a stream, returns nonzero on success */
 int reginfo_dump(struct reginfo *ri, FILE * f)
@@ -259,7 +239,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  fpsr   : %08x\n", ri->fpsr);
     fprintf(f, "  fpcr   : %08x\n", ri->fpcr);
 
-#ifdef SVE_MAGIC
     if (test_sve) {
         int q, vq = test_sve;
 
@@ -287,7 +266,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
 
         return !ferror(f);
     }
-#endif
 
     for (i = 0; i < 32; i++) {
         fprintf(f, "  V%-2d    : %016" PRIx64 "%016" PRIx64 "\n", i,
@@ -336,7 +314,6 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
         fprintf(f, "  fpcr   : %08x vs %08x\n", m->fpcr, a->fpcr);
     }
 
-#ifdef SVE_MAGIC
     if (test_sve) {
         int vq = sve_vq_from_vl(m->sve.vl);
 
@@ -365,7 +342,6 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
 
         return !ferror(f);
     }
-#endif
 
     for (i = 0; i < 32; i++) {
         if (m->simd.vregs[i] != a->simd.vregs[i]) {
-- 
2.34.1

