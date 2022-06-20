Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp603742lft;
        Mon, 20 Jun 2022 11:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0sH3+LvU7niMJZ9PKG1AT30UO/cHazFvg6pxDwISfwmjuDZZRTt2DOy0rswEmYpTaBk+c
X-Received: by 2002:a37:742:0:b0:6a6:9ed5:14ee with SMTP id 63-20020a370742000000b006a69ed514eemr17253792qkh.124.1655748325488;
        Mon, 20 Jun 2022 11:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748325; cv=none;
        d=google.com; s=arc-20160816;
        b=Bpe8GKnzf8xxDjIv7Dq+TQBJpoHXrj1M/TNZz02grQYvPYCrc4lyUx7nr4HFRjuwQU
         J3tbLGYPRiZFrLDHx1IiuOpVJm0blAlkHkzCy2XzVxLtMAom7pWTQRhtrqLECW8UHcoR
         pJUL9fYBY2mvIeaRUIAK4x7mPon0E9nyWUFyyyR2WPGPkXe7H19P66ZQCbJlntLvN2OW
         CQFF2E0LXRjcspTNupXVPoQxEIBvP4+32fS7pjFo3wplZuIRqhOabm8P4vGHydiP6AO1
         98qX7dMe+eH8JeirbTYipdbdX4OUECVfVmimJ9NG0b98a13kjIC96GQykgGWoSmPMREX
         jc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0GkGtDVAyt+ZiAYpm1KJyv57Q9M+Q57+AxwceX30tYs=;
        b=1E8+0IZNK0GZUKhL0SJsKi099otgWWVsZsktOv3h1cEiZBcErrgDjaE9XVos67973U
         /t5FD5UOoeb2SYuZ7PXmnfvEUDB0xBEAdP1pY/qlux6Yb0ZNr7bQCMSwWQ6U+wjSzdLl
         cANXKfpgzD8VT588Yk0WH6VmIeqQSYWmHjzP8EbjSCsMXaSGofhiYVMIXctEZWb1fI0a
         UiItALVrfLQ+ezhH/LjTSGOtFz63jxarzkcGXtDqgFbie+SefOBKipVfR4MWyKHXxPT6
         LPkJTPz52x0RwgV1vg9bZXIgZEDqfMPZZmrWPWCpK4X3y2CnF96zb5RQdx0M1JLpv2ei
         Mf+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dsq/UyEP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t36-20020a05622a182400b00304ee82f25dsi7298731qtc.783.2022.06.20.11.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dsq/UyEP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Lm8-0003cG-SP
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La1-0005w7-Cy
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:53 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZz-0001KY-BS
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:53 -0400
Received: by mail-pf1-x430.google.com with SMTP id i64so10863171pfc.8
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GkGtDVAyt+ZiAYpm1KJyv57Q9M+Q57+AxwceX30tYs=;
 b=dsq/UyEPLkSSnX//nUKplY2EL2+fM3/aQQhDBOk69b/OZKsayqxlMXYeiNWzcDcdeR
 C50pQuSJzHP2FlPzZvt1u1RSC+XQULc5V2MRGbR8h8OFgGKe3l7gEiXcQRMzS1QzstgD
 KH6riiFY9GHH9u+tVKJ4IIF2qo1rS3qvTHIgBYGDDFmvxknJh7oPxK+BTm6nhSAuGbLx
 pztGn1B0IDs5ZH7Y4dVeBpymWAW+eZ/P9uZRVrvsHf28AKdwXFY0sUgeXY6ySQ2YWG3y
 lJ3sJp8xROIWazdHAjCU/DIkl50ZLhdbFR57S1ZHod6/tCPFAPt0cc+2hNV0L/jx47Ic
 Zesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GkGtDVAyt+ZiAYpm1KJyv57Q9M+Q57+AxwceX30tYs=;
 b=sK9JTt1kMgxFjX0Ocb/LdCOlk1TzxwQ8H86DX5eYuGZAUHQbLoFnsGY+PpmU89Rz0k
 u1F4aSEKLw77oXiVarBkRa3ReBG/32ZFvmQtdMniCmwE0qjNJMQ6bKr7veLmlGysG5yw
 FpUnLWoEgleEDMMCqrSKJoPZ0/eTentnRNDplxgdZ5vSCN2zJwbSkOsDbKIzKHSfOtzG
 g/6TopfSHkhiyO1NWD86ubDcjBqClno5wko/Go2uiv1oT17gyKY2bmuyXJC1E1kkUK8Y
 EdJRL3W6h1CwNj/mkkKCZMrg8Z7GpLf//pALE6Ut4UuZgMA1UXRFNRoIfhIeJLWh66eC
 CUDA==
X-Gm-Message-State: AJIora9ByTBZW2A4NdNNPZ6fTHJ327fRtzZyeW2/dWfGeYSyixvdEuwR
 hsoPJmb8P18qkNTfWpHi7QL2JA==
X-Received: by 2002:a63:7248:0:b0:40c:762e:c866 with SMTP id
 c8-20020a637248000000b0040c762ec866mr12090026pgn.558.1655747570639; 
 Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 16/51] target/arm: Unexport aarch64_add_*_properties
Date: Mon, 20 Jun 2022 10:52:00 -0700
Message-Id: <20220620175235.60881-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: 8LGrjdgb7bWu

These functions are not used outside cpu64.c,
so make them static.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d8ff78d96d..c73f289125 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,8 +1097,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
-void aarch64_add_pauth_properties(Object *obj);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
@@ -1130,7 +1128,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b15a0d398a..6f6ee57a91 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -689,7 +689,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-void aarch64_add_sve_properties(Object *obj)
+static void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -752,7 +752,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-void aarch64_add_pauth_properties(Object *obj)
+static void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.34.1

