Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5207460lfh;
        Thu, 2 Jun 2022 15:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsJobUl9rfxSaDLoR2f9anZw0k0dNx59Kl9kzAow8l1ma7BLoxqShV03lWnDeljV8sLged
X-Received: by 2002:a05:622a:1907:b0:304:d3ff:ee27 with SMTP id w7-20020a05622a190700b00304d3ffee27mr3306204qtc.346.1654207952880;
        Thu, 02 Jun 2022 15:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207952; cv=none;
        d=google.com; s=arc-20160816;
        b=Bth7O9Cw4sBVI8aMonX/iVn+i1LMQZg1Hpru6wtWp9wie0fE32z2D5HsyggMjCwzrz
         bcqsDL6TgAf5ATdnaYBL7WHD8RRf8XF+U7g6MH5JfTKOGnycd62EJKSy71U/JTY1JvQ2
         1HMvFgSu42p7OdbtEuWI3SawIlsq7x+hRTPscPzgPzNLZXAfes+NmgQFXA9/7E148AhH
         pLxUofi4MijjA9mgou9rGrTFKaqrXVr0+r1aNCsL6ngQSmJT7+mw/bD6lo5+6trX/KoA
         Invcx88P74IxaiqhqNtG7yo5BZ07ixDwdZ0VFoihozogXckTm1rQDB7PeVVIbPXnp0Ao
         WtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cptDVDAPnRISvdNMPdFhnZ4KpjGI4FllpSb5JTC9nVk=;
        b=xsaVvywnc6nucRclsS1KmN75Ir9qronyNKNO8gqv1RU4hR/hF7DqsEzXlJ+B+dmokN
         gYmy8WE4V9bKVxUtTPZuxgJTIudty+Gb2C29SyMhaQVv6JSEmAat4mWP88hsPevv7b/i
         gTudBBx+M+UhuhxSmgj5nP/OzQwXqzhxYsW87fmZCd0aH4YCJZZGPf9Zy4ymBeWyTq6F
         /jXE8OJSnsTxg17jO/wlIqTasOb18P/9jo66FPS+RUByLCGY7IFaUSQZ2SdkKJQiDhm3
         QBfv3HaLPo+9YWgff/TnuquYn3071HxEoapeRbCVq8ZLC+TdfGuARrVfbJAUmdcQWrtd
         fIPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1TVtzgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk6-20020ad45d46000000b0044410c8ee72si2921183qvb.381.2022.06.02.15.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1TVtzgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwt3Q-0007G2-B6
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh8-00055U-44
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh4-0000EW-Mx
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id s12so5581228plp.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cptDVDAPnRISvdNMPdFhnZ4KpjGI4FllpSb5JTC9nVk=;
 b=Y1TVtzgysdjXS8v9yyvcN78l81+LL6z7BGRlj9F5cg5qsk1GNXd+E6ownjs58Y4ATt
 oLXNXrAsSXavZ4x456Nl65F+52vgQHmfVgnPz/tvESferiWGle47qMoHRTq6ZL+CU0Wd
 bycl/zoS5ngKT8a7CaBWsZqzaEMqpJAEmcdie62oPPW4lYJk13WZrxrJ7ovEEajt0TSs
 ZRYEjAbTKeEVkoP6aWObiG3TDnQ80oZApAo8+P9tzK0hHCHgxYP3ZvLtmx/5FlRtJWWh
 7h9NCO/VVuPMcbcwOBPiry+cNO23+9Jz/283BJIt/joB3G4TxA3qkaNOHKliRP9oSdzQ
 R41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cptDVDAPnRISvdNMPdFhnZ4KpjGI4FllpSb5JTC9nVk=;
 b=v7ztF3dy4mk5+jKo1yzCcmgiZAgJ8bDGvwJJ7MVt/7COCAplXnc8Hw33MxJmtbutWu
 raTRd3Jlw3Q+mgJc5i6AECm5r0MHNhhbEtNCuVQStbvoyBT2F6J73o6f0ohkLGkElBNL
 INBwyPI8AEfxYrEpzWAV/qgDsub667lTpCHc1C1pNJizmLz+crfj/vgtGo7pjw+gV4Ub
 xJpLmLJiK5WDiqMtOVUOlqbh2bJI+s8Fmm6KfSd6/FxaJZscAa+uHjhKTie3DlgzdhQw
 yJw+Hyq6Wp6M4UqD/fsMWf8x/gCdn16bUYcSa3RaiQznrx2i8svJ+j/kLc1YsKqy7LcR
 +rbw==
X-Gm-Message-State: AOAM532t204qijAjBxWI05RsY3d5N0M6ptVO6jIj3x4p44260nR9IB+l
 JbhOzAIORNBllmhfUubSGupmdV6Ka+VUlA==
X-Received: by 2002:a17:903:41c6:b0:164:1050:49ac with SMTP id
 u6-20020a17090341c600b00164105049acmr6983047ple.138.1654206565342; 
 Thu, 02 Jun 2022 14:49:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 35/71] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Thu,  2 Jun 2022 14:48:17 -0700
Message-Id: <20220602214853.496211-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: dMomiZJG8RsO

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9408d36b8a..3999152f1a 100644
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
index 8bac570475..756301b536 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1309,6 +1309,9 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
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

