Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp330529lft;
        Fri, 8 Jul 2022 08:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5odCCYf/Nzh7MQwWp/y7ubPzJjqaQKAZWr8brURNp0ehtNMT8RWYO8M+NWBvdhkKivgn+
X-Received: by 2002:ae9:e005:0:b0:6ae:f7b2:55d0 with SMTP id m5-20020ae9e005000000b006aef7b255d0mr2640254qkk.424.1657293408905;
        Fri, 08 Jul 2022 08:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293408; cv=none;
        d=google.com; s=arc-20160816;
        b=Lu6219Sq0iuKcqRoFWY6EULdJ5xVJW6z+lAJQaNAj7H8qg3FlYcLNm3N59YpeBESHq
         26CKJx+MNi0hFZzgJ8AYZeLU/op3+OMTxvyTwNAjWE7mluy5xlZpoVCmTMW8nAkanrwu
         FjueMH1yZ4OSjUs0BMqk9s8HK5HKLsqsEfl0AH/On7ved9nxuP3wCJWaasCj4yURuOTa
         mfUQJnwlRxN1UCppM5GHoqRdZeFAkCo9t6PxW20KhBfWuGU2MCj5FIfXSvjFNrM2s+1e
         Qv5abg6c/a7m3XDtZJAxsgviSINGKxZXPlHRrB3XoPvVNiO6UCQXZRn8K4bbIS7kb1WM
         7sTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
        b=B5E2UMtE0L1h4WyVF98PfKKoYFfmCsHElzBFOOxnIvhvRslG3v4La5gW5s3G+egPDR
         hHlM32+EoHTyIYf872A4Sqv8Ui49f6j3V/+CmD5YMqwSPfp2y61jcY/3c/ME/jvRrRh6
         TZGbhvyP0xwt6aGedboCq8plN2Ojw/NC4PDC1Z5SGgixarZovkGf6TOKbUbVK0ksRaIF
         ji59JH5vJrEcqZsRArUsGezPN+t2WglLb5ZyyAVmoD1MPAWIZzK4gff0ej3oVjEBRUsh
         oAPsIAJ4zX8I3fcJeIZh7EeHKv313p6xTTzq0Xxx9AD7DGGU4NIf4ZfrscUjijKM62KK
         CdQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UqFq1/TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a056214202500b0047337362780si3876341qvf.232.2022.07.08.08.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UqFq1/TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9piq-00029W-C6
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi4-00027l-Sw
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:02 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi0-00024o-2o
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:00 -0400
Received: by mail-pl1-x635.google.com with SMTP id m2so16610783plx.3
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=UqFq1/TVBNhb5c6+fH4hnMe/83viqNxKg4+zV/SzExDiHGApEDwulsois1HrtFeYVj
 9CQPdoGjcBhfJOeeDF+s8TzY6WJfogWWGcw2PaM1BGO2vdS7lw7+i16yHi0i5zNFBhs0
 RzgrEFP3G/KOO0mlzVrzeeBNlafsEEMf1pnSUl6JyHS1yrd3lYY6jUlwP8s/s5oR5Ux5
 wqKs8lI8rP39U2lxdnaTmmBi/qaaXd3KPY4hv4cQhFKPgFFrJ+bgDWKo2vJU2tFH8tFB
 Lw1biauhMlSqalUF9elGyX9MozDGe7ur3uBICA0akQObjZFUKECTN0qfB/WS8rRu2O2z
 ZCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=eJeTmb2KWf88CsmZe6Y6XRZy2ADJSJ7Za7xdy8WueEC0C70rHi+8JQodZSEdhPQRBO
 jL46fmQNvSQvHbOleAIbVAIerdboVXAdKOSWrrc/6UleJpCWBJtHOj0S0a1IuBDa3YTK
 Z3Yt8nn6n8NUhDpsxkiumEBJwezeQL8of4210eEhoSgYhHpfA6XAQT2LLu3jFnacwtMn
 pAPYUoaiYSAld24GCEbkeM/pze2szeb9C/p6pFQVoiNdcUFDGYre7OP3OU+asapEcHWe
 VoZ/qmtNF/D4zO30DGxVKT21atvHQmrpBvVwmqgke1M2k+Lv+UipW5VPbPJYg9dFj69S
 dKYA==
X-Gm-Message-State: AJIora92Lim8HL1To5/N1UmkT3Uc8D9mnHF5u59Bxw+m1dYBN7kDc0Z0
 Bi22fO82LE7rn4Ki/ri66L0fAQ==
X-Received: by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id
 i4-20020a17090332c400b0016a4227cd68mr4070860plr.173.1657293349602; 
 Fri, 08 Jul 2022 08:15:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:15:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Date: Fri,  8 Jul 2022 20:44:56 +0530
Message-Id: <20220708151540.18136-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: SAnRJshG4ub7

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

