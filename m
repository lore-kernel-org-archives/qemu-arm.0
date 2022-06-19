Received: by 2002:ac2:46e6:0:0:0:0:0 with SMTP id q6csp129416lfo;
        Sat, 18 Jun 2022 17:16:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s044WbjkNXRl9pMY1TqfFVw68bE2UmgRCDPBS4K+tINX8qNohDWvSlpo2DOft3WMAw0Wso
X-Received: by 2002:a05:620a:c51:b0:6a6:6ef1:aeb6 with SMTP id u17-20020a05620a0c5100b006a66ef1aeb6mr12167603qki.503.1655597782687;
        Sat, 18 Jun 2022 17:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655597782; cv=none;
        d=google.com; s=arc-20160816;
        b=VxThDDvcKJw/1jPm/YV1BdQeeAFnASSp7Y1xstHZ2ErQVrpz/6WmzAmLaQX6El4OEl
         eGsmUB7lUH31jjuENzg6UKH4AxcZL3K3tqIwe6Gu+1ruHNZVOoVilIlW6rMhBnmwZ84J
         7SqfNlWB2lQZ7cIvx68hoEfUiAjyzklUiIRgZT/QPzVXAOWgZdBc/AvxoMhCMR+e2f33
         M/+omwL2JFnX9usGLPrDSQgXgg+K1HERLAkXDc6cKWkuuReK6M5LSmis/GwaJ0eBui5w
         fLu2YlPyxTsSoaV6akSQa7R6B8ac9yfrUU13jHYFwv812y2LABfQ7lABRP1sH2xdOlHH
         kT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3fyCK09yDw/jVGyY/tTStAMtSUFUHJ5jHv1xqBw5ZNE=;
        b=jihpWAXApvrRb5I14NZY4viaG71h7ibXFI0kuQQ0QyzwFR2db5sOrt6o2z1CfGvpDb
         xduKZnWgA+zYsrlX3NvR74u4plAppQimlO7XQVaP8WdzjmakL+aELzs7oS/hU/gBnRda
         hiGsw8c4u3QDvRo5ypP46FD/G2ro8w/55F6rPfU8/Qy/RVdSwUlZTOJWkdfDUxDJx2n8
         qjt6SXUcTml+4/ZZrCHUqHSlZxQfRqlJjX9vZ8LnT7/ZFls2O75PMtyQEhEEf61bpadr
         EecQ3gkeTwIfYZHqUKfXihpbX/kysvXxVwYYaxDfUcNbT7yn5xMlnF9CFtjPvTK9W4qv
         FPFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAvlLLNG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020ad45aae000000b0046bb0eb7e2fsi5976625qvg.506.2022.06.18.17.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jun 2022 17:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAvlLLNG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2ic2-0007VC-1s
	for alex.bennee@linaro.org; Sat, 18 Jun 2022 20:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibX-0007TU-15
 for qemu-arm@nongnu.org; Sat, 18 Jun 2022 20:15:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibR-0001wx-3J
 for qemu-arm@nongnu.org; Sat, 18 Jun 2022 20:15:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id t2so6805759pld.4
 for <qemu-arm@nongnu.org>; Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fyCK09yDw/jVGyY/tTStAMtSUFUHJ5jHv1xqBw5ZNE=;
 b=pAvlLLNGFb5QnYjnb04QXZDcyvTRYb5lW33oaEZcAbQP4A9PONhICVf/Kis0TU+Jnp
 j6MXA64SUHXT2P+7wb0AySvY+N8R2Cbc5GMch6fLAiVEXRIckcf+b8yUMJPWxx+nNRiY
 FZR/8Idt5kZSOSzw0oNU4vNhPMy+knGOCyaG/EdCiAncYBbx5x1mewwW5eFQLLe6+LsC
 yzKGNnYn1LP0zavOTXfOr42uGKofJkMwg6Ektt1bAkP6RKhnLfME9RbH78oLdHnj/LMv
 85C80/uS02MWaGnSy1UgXM/M9XBv6x9BiaFxTCAC38L4I9BYUXRw3LPgnB+FdTw4ZFbg
 Lv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fyCK09yDw/jVGyY/tTStAMtSUFUHJ5jHv1xqBw5ZNE=;
 b=AHFC7ndA6BhTYLRZcgZk9O0BGfe/Q1j4UKIsr7x3glEjPwpvOsv3ceDxXGVYHU7vhT
 oVIpv0vVYCgZIiYjFr1rRb84SnijQvlsXYK7xkiyCTd8MQMGf0YZMu8EzX4Pp0gM/shY
 Xfw9dtyKi852zcPhnzAykIZC8hvewo0/dgp9X/4g3oCXt79FAQE5BP7P1Y0ng8CgSOs0
 Q3Kw0/3+QuEbt+evbnQkelnBPtfnZ32laaSUyCWlXxTytU6hggws+k8hByaOeSCDjLeF
 lD3SBqaGn3pv1HBISL89PsjqyflrBXBTdzaKISCk1Hj0bobH4thCmRY/42EU+jp5sVss
 j5gA==
X-Gm-Message-State: AJIora8ysEoGvZwj5md9xlrhFdzh9NxWfHTGw1gerEmUnDpqM2oXQfv9
 EKBD8Iq5IOlkolYCH2496tkjbg==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id
 q17-20020a170902edd100b001588318b51emr16969311plk.89.1655597743660; 
 Sat, 18 Jun 2022 17:15:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:848a:b814:8a9c:88d6])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a5d1100b001e0d4169365sm7790724pji.17.2022.06.18.17.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 17:15:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Extend arm_pamax to more than aarch64
Date: Sat, 18 Jun 2022 17:15:40 -0700
Message-Id: <20220619001541.131672-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
References: <20220619001541.131672-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: tiRXikqrj5wm

Move the code from hw/arm/virt.c that is supposed
to handle v7 into the one function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c    | 10 +---------
 target/arm/ptw.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 097238faa7..5502aa60c8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2010,15 +2010,7 @@ static void machvirt_init(MachineState *machine)
         cpuobj = object_new(possible_cpus->cpus[0].type);
         armcpu = ARM_CPU(cpuobj);
 
-        if (object_property_get_bool(cpuobj, "aarch64", NULL)) {
-            pa_bits = arm_pamax(armcpu);
-        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
-            /* v7 with LPAE */
-            pa_bits = 40;
-        } else {
-            /* Anything else */
-            pa_bits = 32;
-        }
+        pa_bits = arm_pamax(armcpu);
 
         object_unref(cpuobj);
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4d97a24808..07f7a21861 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -36,15 +36,23 @@ static const uint8_t pamax_map[] = {
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
 unsigned int arm_pamax(ARMCPU *cpu)
 {
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        unsigned int parange =
+            FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
-    /*
-     * id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.
-     */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
+        /*
+         * id_aa64mmfr0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        assert(parange < ARRAY_SIZE(pamax_map));
+        return pamax_map[parange];
+    }
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+        /* v7 with LPAE */
+        return 40;
+    }
+    /* Anything else */
+    return 32;
 }
 
 /*
-- 
2.34.1

