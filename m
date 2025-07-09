Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C08FC83F0A
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 18:07:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZZBq-0001TI-B0; Wed, 09 Jul 2025 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZBE-00018u-ND
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:06:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZBB-0004AM-AY
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:06:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2350b1b9129so2021305ad.0
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752084358; x=1752689158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEjr7l7Vs6ji+drc/SRFgbkpYtZx+u1bmbu4VpSnODg=;
 b=XMVYadiyAGursnXJyCIehcvIBZq4QbBEzY7KKpikeIFhmkxYLNI6ObVAyQ1qs2JKlr
 bxFfA5jmW/QwA3e6/zPIlRx3HEing5AJGRmbcjWb0cwBmXVVIbXXCnInn5Q5cemhbk4x
 BcI6MUlElpSAyb7KtFqdys3YNJKa49BjXe6Ur1o7q2uoNsW8PZfb73btGNuYaYgtfc4n
 RbKosPXP9XWJ5XRiwsnPLhRgXVNY2vc325497fsGsAhZxCIShkkClTkO2WkWtScp/OWs
 X4Kk9IBhAU/h/f34EGzYJG9k+Juj+lbx8xNGlxzaYC27DfDs/+o8rxaLH5uCgmj5RLgA
 H69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752084358; x=1752689158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEjr7l7Vs6ji+drc/SRFgbkpYtZx+u1bmbu4VpSnODg=;
 b=OKAkhmvVx17agVbKdy40lpbN7XfZmnZCT/UQo0YjigpHBVLWZeI5NDB8rvCPLM7+Hv
 BDSsApILN2HVWfvH5xQs8FPl+Kd0+u+dJ8N4XvpBjl0lIo77akVLatugvjZQv0lniWxt
 OQYA9O9Xc0nIg8HxH9yZnwWe4VdFNEXy5JxtQNcP6Nhh/wtt990euYK4BDBBtjbTJxFg
 vjUNV/ANK9Hu47mY2Gb5yPnTLZZZ2ZM/OMDcSYv/deSRytCUoaNLqmgBoAjuHY79XBCX
 xH/aQlv/UBhSmNBb4v2Y0n77siESCzPhp3+xmnHoi8GVvzyVqPsFNSdAXdeSwucLc3UJ
 +O+A==
X-Gm-Message-State: AOJu0YylY9QmFuEUnrSW1sAv2Ie+2srQRoSMCxlCH/Y9PhNxPE02yxVA
 GCxar2rcY3D7j/snCCwxVVdkfaSUrLosj4stKl3v0HetchSy2UESLehzU9cLo/5E5rGJXkjHBs3
 DArE+Ijs=
X-Gm-Gg: ASbGncsHi4leqHQ0bSX4/8zwReJ9Izlt5PjrwI/ZsDoG7zRzY06+d6+l9GmJQS3tUlA
 iker6iONOSUAoxZHvelU7OvTwDXAts33f29kOqDy+z4CgLzBm+bv1cyEIkMyepFXJzZKrB91sgm
 aPe4JLKhxSyA4FhnCUF5gYy50JLfWjaVXWcbYJ1jnqA4XMmNHHE3Y8jpP5kxeu35dzK4z0AqYOh
 rQmQWz4ktJHX7UrZcSZ5Hx30rHMaZQfHoZ88JnLPXkCT/c1JsLv9EqKK/0v7K0R9EO7dLb7xI4G
 ybUTPYsdn0m+K/O7SyY0OLrjgMwF+dCYy0sBj38COa+D3h9ao7oQFw7ZKoTxdvp+gBs9bngnItO
 2Mg==
X-Google-Smtp-Source: AGHT+IG+RVMysxOUJfOgSpCWXAGxsJabgQPJ/CbTIhkqh9lc5crJYKgrDoBeJUjQjtass0GaTBdKbw==
X-Received: by 2002:a17:902:ce07:b0:234:8f5d:e3a4 with SMTP id
 d9443c01a7336-23de2436d01mr14864655ad.2.1752084358111; 
 Wed, 09 Jul 2025 11:05:58 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84599f07sm153380175ad.218.2025.07.09.11.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 11:05:57 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v4 5/6] target/arm: Implement FEAT_MEC cache instructions
Date: Wed,  9 Jul 2025 18:03:25 +0000
Message-Id: <20250709180326.1079826-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709180326.1079826-1-gustavo.romero@linaro.org>
References: <20250709180326.1079826-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This commit implements the two cache maintenance instructions introduced
by FEAT_MEC, DC CIPAE and DC CIGDPAE.

Because QEMU does not model the cache topology, all cache maintenance
instructions are implemented as NOPs, hence these new instructions are
implemented as NOPs too.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 34e12bde90..36cf2b6415 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4996,6 +4996,34 @@ static void ic_ivau_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 #endif
 
+static CPAccessResult cipae_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (!cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+        return CP_ACCESS_UNDEFINED;
+    }
+    if (el < 3 && arm_security_space(env) != ARMSS_Realm) {
+        return CP_ACCESS_UNDEFINED;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult cigdpae_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    CPAccessResult ret = cipae_access(env, ri, isread);
+
+    if (ret != CP_ACCESS_OK) {
+        return ret;
+    }
+    if (!cpu_isar_feature(aa64_mte, env_archcpu(env))) {
+        return CP_ACCESS_UNDEFINED;
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo v8_cp_reginfo[] = {
     /*
      * Minimal set of EL0-visible registers. This will need to be expanded
@@ -5094,6 +5122,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .fgt = FGT_DCCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
+    { .name = "DC_CIPAE", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 14, .opc2 = 0,
+      .access = PL2_W, .accessfn = cipae_access, .type = ARM_CP_NOP },
+    { .name = "DC_CIGDPAE", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 14, .opc2 = 7,
+      .access = PL2_W, .accessfn = cigdpae_access, .type = ARM_CP_NOP },
 #ifndef CONFIG_USER_ONLY
     /* 64 bit address translation operations */
     { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
-- 
2.34.1


