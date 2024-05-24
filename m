Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1992809ejb;
        Fri, 24 May 2024 16:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjeJm1kxTjYTDRSN1gz4njLqglgLMc9BO0+yZUcDvbT4mXUlPG0zsbYhOx5p5L2HgjsoQf6yHI8rCo3PjSX6ryTEIg8jtv
X-Google-Smtp-Source: AGHT+IHSuC5fnC0ewQ385ByyvCsU8XCvjmA8dV1eCsekkzDh2fUe3oxlt5rq05abmVJFAPTo5chQ
X-Received: by 2002:a05:620a:2952:b0:792:9403:3aa8 with SMTP id af79cd13be357-794ab111a4dmr471371585a.58.1716592912762;
        Fri, 24 May 2024 16:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716592912; cv=none;
        d=google.com; s=arc-20160816;
        b=U9PyYbs3LP2YodDfSFhgg7eW9OBXe+Kd1gNS0tlVuudybSLUSjcnlhDFIJpxw3RMcw
         Jrc8U9F30FNxborXs9jtpCgo1rQPCE9zorCVfb/V3oBVtmm+/V3BFpxVO8sH46VmMi7n
         DLRW7YDojOJDprHffcWB1SSpAT3C/gW8mloSiW9qbftbrdJGDj7TxLQHDTOPw/7kzWlL
         WUbHopV/8o5fEvWJ48ljHDyu1j8icXK3jDCoIfJVFN+Qayn0aOMg4OZWemoumKWws5VR
         XdMEFM335ObXEqG5jcmBpp45WB3id9UhOL5Ctw8jm9xmEvZf/hwvPnkgsguqAEQWkM/E
         JT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YrL1JsoHB9ONacMQPzWVRwN8hE48sjAIXUCgFRSOVZo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=A1iCHhqzABPZFMfZtOFTBlwnIUHHwAylsDjei3fJS5R+k+FMWTd2fbfIgbhJGnmg7J
         MwNRuSZ4918V+T3SPxdmWpoadKjT0IlLizUtO76Iyz3855p/7KnRog9iKdyoUUwoN6ru
         nV+D8aDmu8WjITJys3foFHJD1wjf2c/9/ChYkRiLgZbsfKMzZ+hxfIDVZDA3YfMiyOkR
         r6eK58Lv8Jzzoluufvo5Q/HxKaE2eO1jFsY5ZxHL1LysdFB5fLJqG1gWSbBdvo4oM844
         GKF4gnUipb7l20mkkc9heQBfw754SUdv3SxY1UFewq1cnY1zhsgNenIKI9yxKbnCdojv
         g94w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8m4dH8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3bdb3si256414985a.412.2024.05.24.16.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8m4dH8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeE5-0006Mj-FH; Fri, 24 May 2024 19:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE3-0006Lo-QE
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE1-0005eD-7s
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f332511457so13027735ad.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592884; x=1717197684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrL1JsoHB9ONacMQPzWVRwN8hE48sjAIXUCgFRSOVZo=;
 b=L8m4dH8Yk+n2M/JR2gY2fb7wD9BWHwJGNn3atDGlLpsz14yj+iLvl0IcVClMKbKi5j
 KL41odVxkoDDxErDYRf4DYG+FcAgYvSGE3G8IfcHLkITnzAVY7G8AvaoEcJ1rymS6oek
 xpTxiP+HUE9TZ/e4e+/WwV3OPD8+4X9nclRnAXSiMT6+66MjtqnvFErjtE5ScJyZH33X
 1nUKnI1uKS7r7SSncJXR314V9kyz7adIWq2fTgQ+tFJCJW957HdCRxXKl5VSONorPFAP
 LM9w8IhH7IiF2wvpj2pH8StcOOTA4eaKv5bLYm+MCJ0X9rUpyCBQm4kUtz348AEbpRFN
 f1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592884; x=1717197684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrL1JsoHB9ONacMQPzWVRwN8hE48sjAIXUCgFRSOVZo=;
 b=LbQKFrnxDALF1MfdLRgFyTk2tbLeWZB9AWn15GnPBwqLkKNKckM0Tkn/i7sHHaVY3i
 1GP9r7LX6CaBJlmyPS21aXJJXwB2SXNwr+cdW2XuQRqZSxTAdaDa1K1bPvDGJ0maBdsl
 UpWqHCwaPza9v2evRFFjX6qsBgG9EA2qjIG3Wx2xYnHsqA3FCGaXpORuXnv4A7ymBqTo
 g4+d0c5KcpTRnau+AAbq7jRn7QrkOg2zQpnvg5Se7sN0OhT9v2hxCL2nPwLsYfVlPjpA
 YCJ1cPkRc+wBUyp9fibKd9JK+rzoCBqjqy3+L4RqihdqUJqp+YOMmKiHXF6k74Q2oMHL
 dTIQ==
X-Gm-Message-State: AOJu0YwVgQM+5esVyr3Z87DPyhMKT1fWRMEHMROxVKFmk7pzPF0kzFnw
 Z3eui12WV1PJBjJMS4f7hac2Ux+qzWPe22S5GR1C9Iz7c3OONHWC7zGIxRg8hzU=
X-Received: by 2002:a17:902:e5cb:b0:1ed:7cdf:f331 with SMTP id
 d9443c01a7336-1f449903c29mr44738935ad.68.1716592883758; 
 Fri, 24 May 2024 16:21:23 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/67] target/arm: Add neoverse-n1 to qemu-arm (DO NOT
 MERGE)
Date: Fri, 24 May 2024 16:20:15 -0700
Message-Id: <20240524232121.284515-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QYz5GxAfzwif

Hack, because there should be a better way to do this without
duplicating code between cpu32.c and cpu64.c.  Hack, because
qemu-arm crashes without ARM_FEATURE_AARCH64 disabled.

Needed in order to compare RISU results with aarch64.ci.qemu.org.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu32.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index bdd82d912a..6ee055c78b 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -978,6 +978,78 @@ static void arm_max_initfn(Object *obj)
 }
 #endif /* !TARGET_AARCH64 */
 
+#ifdef CONFIG_USER_ONLY
+static void aarch64_neoverse_n1_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,neoverse-n1";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
+    // set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x8444c004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0c1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+
+    /* From B2.98 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410c3000;
+}
+#endif /* CONFIG_USER_ONLY */
+
 static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm926",      .initfn = arm926_initfn },
     { .name = "arm946",      .initfn = arm946_initfn },
@@ -1018,6 +1090,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "max",         .initfn = arm_max_initfn },
 #endif
 #ifdef CONFIG_USER_ONLY
+    { .name = "neoverse-n1", .initfn = aarch64_neoverse_n1_initfn },
     { .name = "any",         .initfn = arm_max_initfn },
 #endif
 };
-- 
2.34.1

