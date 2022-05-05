Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1304419lfj;
        Thu, 5 May 2022 12:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD1V+wiQ16lfyaH/+LbLs9aJd5kWWTV4zwt9H2HbbeAWDplUGS2VP5t3VqGjMvnHN3TFVt
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id s15-20020a0562140caf00b00456402790eemr23001683qvs.35.1651778616835;
        Thu, 05 May 2022 12:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778616; cv=none;
        d=google.com; s=arc-20160816;
        b=fZjxYOCZnxcnjMr4u8PaOxKTGJdVA3KkR16/tmgOLcVbARgTCinW+gjfocBPi2wyXq
         0r56FgZ+FyD9MYLK6GG21H8iQAbtzx+UDak2zNRcmPGUUpX0pK7w/IVyN+QcysMNgzLA
         RxqS+aFvbmJ7otJ73bvpizjXS3da5/mJs31THPiJ6VImTpFoqhRuPK1EFQkr+FcoLO5X
         VuM4pQEFQmIy+oPGQrI0pPUYT9sMpTmrbQnrf4lhJYwHU97JYogqhYfiGUcvSaEOvcxb
         FO8VERdXqtkpZ5kBp7QgrWsukz5E3uhi1171f1Z+YkpH+cf/XbqOUtEb+sBIPApg9jd8
         KLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BIWTkf1wrFK+RU/H3vuJZSVWXtZJEi+LVYp9vG7Klf8=;
        b=SEZ4sGj/NhdIApoppx2D4eQ4lne8b+Xeyl4die+FwUTfNBwh9zEgMD5V1M/jALsvh7
         EIcVkDkxoT6JxAE7BgzLBcV7xhw1HzIVBe1cRten/10pcB6azg1UPfbQw7ncb/1zxDpQ
         Q+QL5ug0i4TDICJCRN12ZcPpQQzdzh1xQ+PleWZXStf2yCfCBM+oHxxX8myKII+r0F61
         DM4qfMGrWfUOHhwtfjIzjWOZ3SdFdMRkkWPejah9OUxhczdaiF3e6TzEC6/6OsI1Dt1H
         BP1dpW75BQgjgGQThRU3oh/ALAtBxLrDK7AxqsVTHIdGs22sIjXoiAv0wnC0QMR5tQg7
         CBkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E78Zelin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a05622a11c900b002f3c5ec5018si96339qtk.240.2022.05.05.12.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:23:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E78Zelin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh4a-00009L-A2
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYZ-0002rC-K5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:31 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYT-0004NS-6q
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:31 -0400
Received: by mail-oi1-x232.google.com with SMTP id r185so435561oih.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIWTkf1wrFK+RU/H3vuJZSVWXtZJEi+LVYp9vG7Klf8=;
 b=E78Zelin07uucl1imqFcFm/5F9ha/ke19c0UvbYG1Ti5Odl/K/J2F7U5BbAh9DFg8U
 tST/ZepKVWdWSDFJ4UzBE07Ve7YJPgkX7V6XhBDibzY6XU7r8kaOSu4JqN+/cwRbssOM
 bGWvkQJYgH1NbrAkRacqR76//+c5ML4Kzw9neA+4mF7Q3KfDwVXe/O9623wcGP2qb4bo
 xmqOhHlqfMqkT3ruBhCd9Ik2qYO6PQnGG/3qWXMCJdO5DY5HugqD6dHIXnv5t0A3FaSU
 SB53ZJCbG+MHkZL083xXew6D92Woy5FuEBjwyUS0h+scZHGiWZ29hbA3gbEUCmbiktdL
 xOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIWTkf1wrFK+RU/H3vuJZSVWXtZJEi+LVYp9vG7Klf8=;
 b=oMPu3hS668c6GzTVWxJIyyNe7TaWgXEYfA9g9o3qSaeEOLfQumx+UDZEuyzR7rhL0O
 6pI3/caibN34ngX1r08fCjR1pyaDv16cxQq0oeWdGQpT9k7U1Q+z3eWWQcymfkJth0I0
 SBDTN3IVsGQuk/xGWjuyphQ6eHMB+kGLpdnglIWj580tQTtFp8Y3rYMhS/4s3qsR6FI8
 M2aIh6JasB3MQ2b9WJm4r7h6dZ602uxyHaVDU774F79ugDX1tBeWW/UqhOQATDNrITrb
 T7j3Dt6rzx5tBDHx5muALGFOwYPF+Pe4bgtv+SwfaWV31a3gqZX9GsdsQT4qLv1Bbtpb
 971w==
X-Gm-Message-State: AOAM531Il9YsrSJF2JVtZdgvi9q+SEXLK/KEQdmr0uDr4NOh5LwzEPgf
 NImlztUulJg+0xNvViclJ+sSQ90FSzXCuAhj
X-Received: by 2002:a05:6808:208e:b0:326:2e82:79f0 with SMTP id
 s14-20020a056808208e00b003262e8279f0mr3404125oiw.196.1651776624511; 
 Thu, 05 May 2022 11:50:24 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 11/24] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Thu,  5 May 2022 13:49:53 -0500
Message-Id: <20220505185006.200555-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
X-TUID: u8J+Vwnx+cE2

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c3bd0676a8..965f35d8c9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7995ff2712..2667aaf28b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1806,6 +1806,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5fce40a6bc..202fd5c46e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,6 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bc8f9d0edf..b6fc3752f2 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,6 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1

