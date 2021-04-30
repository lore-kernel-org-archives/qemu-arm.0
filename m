Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp517103lfg;
        Fri, 30 Apr 2021 14:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2jNpF/pobBxv5bYC94lKhMkxQV9i424ODFKTKf9V3sFt7UH/66XGqvklR6m5GgOJOPO8u
X-Received: by 2002:aca:eb55:: with SMTP id j82mr5366476oih.93.1619818645373;
        Fri, 30 Apr 2021 14:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619818645; cv=none;
        d=google.com; s=arc-20160816;
        b=oaxHNcJFDuabljuiyvqFYl2Fr+abvT+VOw14ci6WKwSUROd395Gos5ZNkba+Pzx1se
         NohO5nR8X2amUnhJZW1B0b3tW3XvX0ksXPCLy/JkeZolIX+kL0fsjdyJoav6Tqu7INFg
         YA5zBLPpe1h2tDMYmhFoKPHBUSLMr79YotORP47t4su1ua4Z2GKC7ySZ6+8ShkJbyENK
         B+UBe1ih8rNyi+Yui8IzWaSHIqulKSRXFx6RZMqBdyPGXbxNOoy5U1mjYZxx+xLbC//M
         weNz0q4Gs9m9MdDj43CG56BATw09OMzy/xhe6pYpTcfXmt/xvOIyNJrS+5fMXZVJROvR
         XHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
        b=TO1J8p8Fbxsnyyj4oqKhOVUebqQP8cVqaiN0OS8YdB8EX0S7c/e9tSHzu9dYag6k8E
         0dQTFmdOyREgOW5NSRcoYKMorlkx1hmO1rWl07JKV1syxU+m6Is02ibDuTlgl/JsvkTs
         MzxE8n4ewXOEkjy6/LVqgB9CEimSbk7HQL/9KeNKVrOnOh7JFuI4sJ6omdNYko2vhHA6
         5RtRxFyFudBDMBAInc/l1ni/YS69y8FCyD4dEsTa+A+1D4zOpDyj3p0u6tE4N5l8VQo/
         vgAnMqZt1qp6/8+mBbMqHWILj8O1DgS3d18qj/se6uG+C4qEAclsJlVB1lXQatPx0ahV
         7KQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+SFglPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h66si5537344oia.74.2021.04.30.14.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:37:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+SFglPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcapA-0001D4-Jo
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZp0-0006l8-4V
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZot-0000s7-Os
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:09 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v13so23644652ple.9
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=F+SFglPeAJACCHKXIlweuKO6pSv5yG7lT733zNeN4pdwHcJj5R7V860HrPZTh42ZBB
 pSfX+5LyPhGStoSrV75UOTBRoIUjosZwOlEPnaitPaAVKVQ/zDdfgoSli/OD32gkhEKl
 J4tS5paOK/yvcoftJ3pJkhplCI5M07gbvXNoqdVfcnTuTZhvg41WqPo8mwL29mZJjeYm
 jKbS+xTEijDvz2dtk9zTr5erHhJ6mMhQ+dahC9IqutIaqsz9wXWcHajJCh9fwETx+5L3
 Bn88bk4kVTHxAxphHdcBS+XlUlN9n1l4mQtVmM86W7/SdGAIHn93p82FvmsayBItqsyG
 oJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=kMLL05eysHY4lU4HAQrhDQN3rTVMLcSeruvvzlT2+aACYi6gbW/vdgK56Cjj/HhB80
 XID3992fYMgYH3oaUVM0Gz4i0CEKxEHiFebNbee+b6/oMKe+eRLRKl4Tv/OrARCfMqSj
 VcRLWSSUsDXuklPGeUSLkGAHMPAEcGEW6EJizkrfxWK7+aUunOmGPxxHYkuCi3AE7edc
 lFj82b65e/L+I5ZkJkrtPVcY4Sl9oD7ft/8g4RPvBvCyLf56GulMfRgrD5ZejMRNUQ7h
 nQ73GBtIZYyT2gkvJ+lJS9xoDFfEqBD6HwzFvv4pNcM7UrIdYaxU41LXfwcRxGaOlKSN
 HMQA==
X-Gm-Message-State: AOAM531XOPBKaetdCxt1cFlBv5151Iyxfjk4QXBaDxBeeQgtG+vHahXP
 CLs/BOwVs+V+2OTjU22wdi4qsA==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16447281pjb.79.1619814782517; 
 Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3792511pgt.42.2021.04.30.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
Date: Fri, 30 Apr 2021 13:26:10 -0700
Message-Id: <20210430202610.1136687-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FMVby2QcRQ4M

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   |  1 +
 target/arm/cpu64.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0dd623e590..30fd5d5ff7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.mvfr0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..379f90fab8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
@@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.id_pfr0;
-- 
2.25.1

