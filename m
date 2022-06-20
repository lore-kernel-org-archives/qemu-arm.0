Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp606253lft;
        Mon, 20 Jun 2022 11:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCyyw2yu9R0JkjA+6mNcRcYaS1LVfok8X6BfuFr/1+FkxqDZZ3Y2f1zCtofHDFyEAtZ0zM
X-Received: by 2002:a05:622a:650:b0:306:77d2:d7c7 with SMTP id a16-20020a05622a065000b0030677d2d7c7mr20622084qtb.338.1655748568369;
        Mon, 20 Jun 2022 11:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748568; cv=none;
        d=google.com; s=arc-20160816;
        b=hVDsfxRmh136gG5ytLdILC2bPEA4KIkHJfwJCTOoyw65iNfxT0TE8De2kLS3KWRyV4
         mLaDiWOkZqb80x4VvR9NwEd86PLnI35FpD+JZa0C2SBoXtVJNNFDrepnj57rTembKH3a
         jME9TVTXvkMiKq6lV2In1HHrGklgQN8XONRb9H1QrF3gnkFgqvSIDnbQRvmxWC8FZ3Y6
         mshra6QDK98d52IrjJz59AOmb5or04LrTtWbbng3FS0gwZQ/7aMW46ULFG8IpIm0PDAm
         1FYXnOG1/CYJDIl0gxYNmgMSukvCP9/Ezr4XOqC5J7rSkikO6KquRf1ct0mkk3KWnL8I
         fSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zqd1McNM5D2fBRbn3StkKgKGGJ4F/qdBrurXM1jISUg=;
        b=KByx4vSLzifdk8BYana9k/Cc7so9HhsVKhCNQXnPxLO2m/n2j2SVR4YxHPtrnzyYcv
         s9tD6yUsr9BWMLQUor4sVstBw47vavVC4QcWkXY95Slwiuq1ulZCe0XPvostd4Sr8pz+
         C0rgbua1c5R6VGgr+g0xHz9Pw8N0d1uodnsm+lYrUKEkhHMi8mgrEBjw+rGQVrb9/H0c
         LXeByU7OUkvx2BKYs0C8i1Oa3DKdKAqTpjmaYJuIbJwsHOuU4UkXTdPUKPOUMQmu1jUA
         hE8fqU2WeWdOon7VDzg/CZzGu7wrek5cV2qx+vdfD0SarL+CBE/c/++esX90l0Omi/Re
         Swig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZZqb05L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a13ce00b00304e84a0444si8570572qtk.692.2022.06.20.11.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZZqb05L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Lq3-0002ho-9T
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaE-0006M7-Uq
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La0-0001Rh-0s
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id n12so3930601pfq.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zqd1McNM5D2fBRbn3StkKgKGGJ4F/qdBrurXM1jISUg=;
 b=sZZqb05L7zDr93Qf5Rl6MxSUx+E3E4dOSgNXdo4x6Ju22a9BTa4/2+MfoRD4iCLlZq
 nRCKVNas0EKKKianNUqnTsqNUov4ViaO7gFyMoNwYT7g464hoCsrhOnLGAWVrJ7cc19I
 maxUMLTiBwzZfp/0GTDNGMYVEq7AkPtyApJlrGMDbzawI+fd452oX0mu5YVoGZseOFBh
 kWegP/kRzjd/KHYcT9RvKxf/mkCNRIsQYNw3OHbynHkcBJyL7TMX6X5FII6wLQRbaszW
 /oe+z8vEELkSchxbkP8Cgy2hWQ7A1ZAQ3vPfZHkmAPzuADauDYOIstL048pbJdMPdSYJ
 T8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zqd1McNM5D2fBRbn3StkKgKGGJ4F/qdBrurXM1jISUg=;
 b=Dq3vqNPG+NuGoYQMbXfqyCyf8tTEn53Lm0hJEVhhP3uVvtJTqaKFUMqG/DZNPS5IH1
 OYbM1rPNuHyZknXz3O5oGsFrahM4+5LfaZxZhMSzXPeNc39oy7/ycrWSeTRh2u8wDSU/
 z/jQ89Zkmh/b5mIrGsweWKVjkennoCVjZKg5aPXVs6gHS08pucQXgHxnBhA57taUck7a
 jQ8Ybkqazv6ktoI/y519OaEWtZvji30eR9EjZDetcBpKl/uKBMbom4BS8vC4HnFdhMCr
 EEj03Ut7KxOMqfrFkuMSERt5QNguB9oFYyjZBthTP4sB+w23epiK7jUyMIP3cqXCauvW
 Olkw==
X-Gm-Message-State: AJIora8/8U2G5hxIDusY9zFVeBw2fOExRIDtulSR1ABntgVw4HdMD7Or
 iSrMXt33SrSsbrqh4w7g3YZ8vw==
X-Received: by 2002:a63:3fce:0:b0:40c:23a5:2827 with SMTP id
 m197-20020a633fce000000b0040c23a52827mr19903446pga.314.1655747569722; 
 Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/51] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Mon, 20 Jun 2022 10:51:59 -0700
Message-Id: <20220620175235.60881-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: 4kRpqPs+V9tf

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ece720a757..d8ff78d96d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -205,14 +205,8 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6f94f3019d..aef568adf7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1288,6 +1288,9 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
 int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..b5276fa944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1421,6 +1421,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1440,6 +1441,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
-- 
2.34.1

