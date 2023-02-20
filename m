Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706186ejb;
        Mon, 20 Feb 2023 15:26:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/gi6mr4c5f56+hzrhCfmrSvx8Y54TWVngx+Ad5kRr6/RZDmeTDfG8YLELLbXVdQOYcmdNn
X-Received: by 2002:a05:622a:592:b0:3b6:334b:2cbc with SMTP id c18-20020a05622a059200b003b6334b2cbcmr4134385qtb.65.1676935605033;
        Mon, 20 Feb 2023 15:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935605; cv=none;
        d=google.com; s=arc-20160816;
        b=lezoAyeZmBkOd2ji8X5N6FgP9ISKNrIJBkSwSTazIIxuL4J3yD6Ky+FqCW54XE8yl+
         3iE3mOnsLO4SBoa8PzyN+J7dF6RZhfrxjOdLLRuRsVxUvA4tkYxs0sOz+y2qHdG6fOmL
         DN7unXTZdloAeiiInGQYchCBCVzHG0LlMrCijR6U4kmke082m+pez+BuEKzT5RhCwLK+
         8Hvf73IxHFzOHApYX6AY7hvo/TJrSs+azBOsoHOCeVfM8e0wtUMJdLO46EyFML9VB1AN
         ALW9A91baz26w/wkaw2CfSauumj4yactudKjraBpBwtzwUlIu4UhzNnpeXtNfP6eEAx3
         7+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6Qu5gxD3YQ1g3NpmrFTN+XCbNU1pC9zMqzEJSxEiZBE=;
        b=XpXXvEP26AdoxpDlTg5YXJi5Ua8M6woR/w5VX01SStY2/HJnWUiFNmMSC1I7/wiE7C
         auD/t0TRw7XgUMLyrT3+syR4Y9RCMeD4fFk3QmbL9klmsuY4jffIfTmmzKluOrFElfW1
         /4kcLuk+RDoseg7abBLQfPuL/kn52X/TsIo4AkZWeersIFUXA2o2gqXLsLveDDHhKxS/
         P7YG/ztwH17eQP+8f4hKg7PRwY2vaHng6v5Afsx+mNFSA5MKYegZVI79g27M7+PixOsm
         VJKa/mQvFoTVZdWmFD+NcSPBJK+5+mrOop2Ja43ZEkAAj+efWGq+tlRhayqR4CzgXCAs
         eung==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKXdduJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t189-20020ae9dfc6000000b007333725598fsi9559664qkf.126.2023.02.20.15.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:26:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKXdduJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYN-0003gg-Uo; Mon, 20 Feb 2023 18:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYL-0003fb-Tv
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:37 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYK-0000IS-Bc
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:37 -0500
Received: by mail-pl1-x643.google.com with SMTP id s5so3043135plg.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Qu5gxD3YQ1g3NpmrFTN+XCbNU1pC9zMqzEJSxEiZBE=;
 b=EKXdduJeENkKGmYARPZuvL7nQxI2Igm3uWPxBmFsncScgp1LYpRiQvYefGiokIeWv9
 VJiqZ2J1057wvZTcK9Wff9gKkILwnI6eoIcSg5rUYys6wGUImYnfCZzm6cvICMT32ogE
 8WV6zKCfXKrm/PdPiMw0+ypn9Qi3ZxzFcpSdMO7BcNpgUbij4PMIWxC81tsdp2mVBfIe
 ARHw83iUwVNO2FXYicNeoR2/X68BDhgBpjuqkQVolv8PIOA9KN+hA9V+maoDh8P9lEO5
 iBV3GUhrzGsxDK05drysVBP64AiDCmjGaavFadgxb6o/8NGN0lMyZf0TG+69g0s2S9d6
 NCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Qu5gxD3YQ1g3NpmrFTN+XCbNU1pC9zMqzEJSxEiZBE=;
 b=b6HVZhtSUQShqYUfouPWUUtJPP1qlOHkrCtxy0Zfpifph0jwv/4dilEyH7tJ6xHCjg
 c6wP9MBVtLpF7u+QQ2yjcgvD7Ge6ygDb6Fcq0m8ILo1t6x5gvmdvsmoUkdZ5MUfNkUAB
 uEiMUBg84vNoSg9OWEOg9Ig4szkgGWgT4X3YdgREFNsy/vxUv9xu+xCsIV8SVaBS4jbm
 az5KJMTJBeeJrVK9NpIBADy3/rNzuECBaqsMFqF5J3lT7t+IUgUXefxxlFKa32iylJ2T
 RQKEr8A+cpt80g33HG2ydrkowccFZRkzYme4R4saN18U2w4C9gJxLR9Wra8kqVpz2KFA
 5m5A==
X-Gm-Message-State: AO0yUKUWPe+88CZaQDaFyv07iEX20gekvJpAI3DAeI9105u3xDFbHSCE
 kKC4KyVPDfCrP7HYXlKU2yThsxuNvE12Wums5s1MYw==
X-Received: by 2002:a17:902:cf46:b0:199:1682:9175 with SMTP id
 e6-20020a170902cf4600b0019916829175mr3264866plg.8.1676935594414; 
 Mon, 20 Feb 2023 15:26:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/21] target/arm: Add isar_feature_aa64_rme
Date: Mon, 20 Feb 2023 13:26:07 -1000
Message-Id: <20230220232626.429947-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jL+a2UekWym5

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..04f000cc54 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2190,6 +2190,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -3802,6 +3803,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..83685ed247 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1947,6 +1947,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1

