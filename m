Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp484411lfu;
        Sat, 30 Apr 2022 23:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJm/5LQF4GR9c00J872pxyV/aXKCHRMhPqxBcxE0EeaINJsXrEH8sCar1qmBRrMnnzyJ27
X-Received: by 2002:a05:622a:552:b0:2f2:538:d951 with SMTP id m18-20020a05622a055200b002f20538d951mr5821311qtx.466.1651387869097;
        Sat, 30 Apr 2022 23:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387869; cv=none;
        d=google.com; s=arc-20160816;
        b=uoHfp4PEm6X8vLJT4zAaV74fsKPLK+t8FsxBz5+GkGSEqljrQ+047VAEnEm6QnwsyO
         avCKPIaH41hVxXAl/gqTBJ1lm2C0t/st83Au7CTKLQ+jr9al7bO7pHBwqDgP3hccnLo4
         bMakvE8iep1cYTKVRhtxUbrc0RJF0ditoIXz7qwa3/TFbIyGFf+f/c3A4FlCg6ayU4aQ
         R8+IIgq6vKcmed29TxhD88nnBu8wB+nhlq8M0yp6Zq8K0UK7gfb1w+cc2hQPMvhRVGFo
         g4LiuAi/hGAAE4Ka2xhgJJoSxy7pmNu5W962QfG13Ha46R4jS7tk4ssLzP9XFlxSprEe
         cyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
        b=uWhns+bvvALXx8TAy/EJNMvqs4XBpXcefNWXQpoWIhxvDMeb5YS/2mlm2j3MMVa4jc
         jPou6DiDI9DZp2uZgkOFl8x3ewd2R2M7EyYrnWll10bZmuDHqz8hXafSvpsZVPyc388C
         gX3AlxaBgXXahyGEKq6Eej4DDkR+fAlNShlT2aTwxi5vOsHyt+iPh1WQb+/63yHh8wQq
         AlX2QDH+J8qGvkEF/yIOJbskIGhMCdiPaHnHL0KdSmzCu5Wd/wm7lVw5RgTvP2pJYDEN
         HdzutzWi4krt2x2aGPl6z/bYEJSEZEsvW6bKHzRIOQyXdzp52y4czvNgishaKRTsi/Nm
         89fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pg9nyjjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a05620a085e00b0069f6a02e50bsi4540391qku.623.2022.04.30.23.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pg9nyjjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3QC-0001nP-JU
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2UB-00077G-AZ
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:13 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-0001ST-C1
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so13738079pjb.5
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=Pg9nyjjYzzfQpFa9eoF8GpaSl+n3JbGSG+MXvYZJ1U2ElTbL22C7U7iRPbucs4AXdK
 WXTUf8qXMRfE0luelN0ous9Vd3TbwhW9AC6FIdsW9nqW4rmlrPIKw0owjNwFeFd/yci5
 d5nCpZwMBwoXOMytgU3Bde3v7Al8DKZaNEtTVYqxfG5hqqiL6MSlu3JhR9THEfBRtJBy
 1Lg3JgoFan/JYS4UWVmxCmUrk1a7hJqxoYvnCBqpDvPcU6Ner9HKfRQBxxXRtunWElzb
 zdw2NPPoLnCLIlptnuQht7OkSL1uLOe6fYT7R9G13qXywL0NiuI6O1AB/kbGhv/KvpCj
 rnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=xjjoTTYyPtqk6lxeuRe6/oTrTZazfDzFetvY8kD2hYrFymVXvNerOUDZqc0IuV7lHE
 0VSOuOaYk7teFsYih7USVYQw3i/141R13+P5U64+SF6iUwE1rS0LjIAL7gIWyyvbdFr0
 E45gRjQgHdiqZR2b+D9w3GTCBE6nmk8oeopNUneNzv+lQ5aBbaKepUTysrRySn66/Qhp
 ijjgbDZ87H7gVP9NLfl5A86ToyKuA9qSJqTp3UZMfdPYsS2eSoYQaMh5gqrx0YWvb7dA
 qJ2Kw1hvuTSR9Vh1/dtOOZrCNDS1lMKx/wd+cCiD8EKMx1jwkZtDtUcxhtr7N4xfYAf1
 QZMw==
X-Gm-Message-State: AOAM530rY1bMjHTxw5poydwQb8QYYHV5eI54U3SQho9HWjsG/oSyni6K
 cP9vGGnkZqknn+X7CwqG92gIvg==
X-Received: by 2002:a17:902:e80e:b0:15d:34d2:4e8c with SMTP id
 u14-20020a170902e80e00b0015d34d24e8cmr6485413plg.142.1651384266149; 
 Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/45] target/arm: Enable FEAT_RAS for -cpu max
Date: Sat, 30 Apr 2022 22:50:20 -0700
Message-Id: <20220501055028.646596-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ip/+LuN4ZeO

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0acac6347c..8110408000 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 88d3cef93e..35881c74b2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 337598e949..c5cf7efe95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.34.1

