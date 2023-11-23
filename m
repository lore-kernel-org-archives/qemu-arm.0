Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150168ejj;
        Wed, 22 Nov 2023 20:44:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyQttLWMq3nCzbNtGVX9aeA/sbJtiW0zXYevvESzUrGp8PbmlZOeVq/FbdAHEY+F3brxHl
X-Received: by 2002:a25:a2cb:0:b0:da0:3c22:8374 with SMTP id c11-20020a25a2cb000000b00da03c228374mr4127999ybn.5.1700714694544;
        Wed, 22 Nov 2023 20:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714694; cv=none;
        d=google.com; s=arc-20160816;
        b=Pwlqf+x5XbubHB/uf7OknspCxEC8IsLTYR2nKQYREOvNxuhLmgnuO4UBJcAofw0KNq
         1aDQZmlC3hZj/JdIetT4R3aRck8lFKmkrdMu6/EMD3VGmRT+i3hz1TPG8hPaPzhRI5zB
         snSoMJTg9nKj1e9FMw2nvdhsfznWZBvfv/ClROt6LceLWKm9tX39Ki71XGroOVunqkqs
         +Bx81cdv/6/6NQf8dqYa29aWZvd00MrKbzggs61y+GQaWaHFKVVb7J87Ca2pPA5743Vy
         iZH9FtgnWVzzf26Gptympq266re5bGcj7bLzl6DjRqBzTBOwsho6qp07fADyAJgaPK3F
         JsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=okagnWg4RiqPvXVssy7I/tpmDkLttXZFA5jqAhyzY9s=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=EEfKweNyiJMmZkre6XbKblamFZilOC+68NntENI9muf3Uw6Sbg1U9nbR5LBpX2R4eH
         ISH1ZWRRKJO/R3+XQNdUygvsKYsGe+dx1xEwX/0Qy0N2/BO/FulF6fM3ibVgK9bVgXKm
         jMcz2MPQpGw7oi2YrwFnBeZ98OmeT5eUmqqCDbwBRzZOg0qYimNX5IIc+4ZM2kpXQxIQ
         7gEwNK1YIv3SJxzUJ7RsWs6WwRFdcghbXk4XBV8EItV1bIC/9J/Rk3vLoEgsxi4Zw7OV
         A8FdbP6Bf2SpmsZ4LzwKTNujLvMTtVOUP1ZwJZaqrpvJcHm2NXHBaPRrMihRQ1GwN+hE
         jVNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNbJDXQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020ad440c2000000b00679e2cd191asi447297qvp.174.2023.11.22.20.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNbJDXQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YJ-0006ac-49; Wed, 22 Nov 2023 23:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xv-0006NP-5r
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:36 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xs-00069b-RG
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:34 -0500
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3b565e35fedso338108b6e.2
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714550; x=1701319350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okagnWg4RiqPvXVssy7I/tpmDkLttXZFA5jqAhyzY9s=;
 b=jNbJDXQJc0jmuTonRgh96lNAnP9Hv27YUQKbSoUWjCxOkhZzRx2nJNsuTZzUzKBwPw
 EVy2IeulkJYJPSVwSOpFR6uzlLV8lgB4O+aUkWaYmTrq5mjT8dVCPi3ZP5nVn9Xz01ig
 b9d8roIdQJhekLCkUPRFa/G1KkulxuJ5sXv7Dkv14Hy4KFxIHevk1UxxFrjEgWkky2Hj
 Zo1E/yUy54v7fDa09wCDf/GQPKYqNnm9ZN1fNBdlMckwjQRvCKjrRwrQJiqkqyc4LW/q
 FjNR7yJxQshPbpyeKEGp2B0TXXTBWZcXAtiDcK+PvTtf9A1h4hjlLTpJJEkfuAFL34He
 Kaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714550; x=1701319350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okagnWg4RiqPvXVssy7I/tpmDkLttXZFA5jqAhyzY9s=;
 b=Dzg029kPAefo0ZVdOVRsi8H1Xvi3F732Q7IVQ5kAVJPSv2jGROKRAgLxx335qA+liG
 YjoOxq1mOx+eL/6uvFByIk1NzbC4OrRdg1RqO4Wo0az4IPjUvfVKUs1+F/ghbn+CbHif
 kPHfhfX7Otv2XCP1zLLv9UI41DqRtYWd3SixbFxC3crMPERTk26Yt56BUm8btxS16vOI
 ghAAXf/VsamY7yjKz6NgD760CF34v2SJqc8GIFNXNjbbwIWypBS/auM7vWVh5ZJQe8SN
 3h764fL6HiNqMd6ICadm91DDuErWmz+nq3OIEDkVoT7kvqRbhVLaBMLGcGgN0DLmGfB0
 3rFA==
X-Gm-Message-State: AOJu0YwmAUvl06mzqd8fqbZlUR1W05V8QKOs4pe4exT2q3rvBlnz3C6N
 c1L5EDVH9lm631KjZts8wPl6l+XC3KTPlbSXP9nix0CH
X-Received: by 2002:a05:6808:b1c:b0:3b5:6462:3191 with SMTP id
 s28-20020a0568080b1c00b003b564623191mr4849132oij.48.1700714550558; 
 Wed, 22 Nov 2023 20:42:30 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/21] target/arm/kvm: Inline kvm_arm_steal_time_supported
Date: Wed, 22 Nov 2023 22:42:07 -0600
Message-Id: <20231123044219.896776-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: nGvKkB3jG/+c

This function is only used once, and is quite simple.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 13 -------------
 target/arm/kvm64.c   |  7 +------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index e7c32f6ed0..58c087207f 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -274,14 +274,6 @@ void kvm_arm_add_vcpu_properties(Object *obj);
  */
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
 
-/**
- * kvm_arm_steal_time_supported:
- *
- * Returns: true if KVM can enable steal time reporting
- * and false otherwise.
- */
-bool kvm_arm_steal_time_supported(void);
-
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -374,11 +366,6 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
-static inline bool kvm_arm_steal_time_supported(void)
-{
-    return false;
-}
-
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6b6db9374c..fca4864b73 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -399,7 +399,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_arm_steal_time_supported();
+    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
@@ -437,11 +437,6 @@ bool kvm_arm_sve_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
 }
 
-bool kvm_arm_steal_time_supported(void)
-{
-    return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
-}
-
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 uint32_t kvm_arm_sve_get_vls(CPUState *cs)
-- 
2.34.1

