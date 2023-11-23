Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150718ejj;
        Wed, 22 Nov 2023 20:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrfS0YUcVLND1vLhGUY3fLUVx42LmHY7B8HNkubQgCy1WlrcGCqHpY3oTSGOPy1ySboI/L
X-Received: by 2002:ad4:5f48:0:b0:679:f232:ba48 with SMTP id p8-20020ad45f48000000b00679f232ba48mr4916162qvg.38.1700714786540;
        Wed, 22 Nov 2023 20:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714786; cv=none;
        d=google.com; s=arc-20160816;
        b=k1WEOZIWi6AbQUj/HyQTIF5Jl6QHaaanm6nMsUpIrLPpDvrXndNzUFGL9XJ8xOj6MG
         RTzjzK2fvG35iLJ6uTsiOQ9DBoxUVPggEMrXJvbjpf2xF/X4mR6u8UDKZziJKHdO8Q56
         2aq4NRR4gFSLb4HjSQIY5TGWGYOqF7GPIVfEUAVzOtc14+3m4fihLlkjlnScEzKT2ftz
         zlfqjUHSwozcKnD/MKGDEpEV9vOUlxHmFgGziaNJ8/AgQ66q+chidxpg3TKPp5MfLvZn
         010jYTytdeCD9vExHfT8sHAB87LjoLDt+6uohR+wN1HTwQ9YNDR1jYjjedzzF+2P85Qy
         SLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QMxrWeuiHOLByxeE5N6Cs/cc7NkJUHDeIn2aLelpULE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=neKHONHbqKC/frdnAfQjhyFgvLxal3gOO15zO5y7+DFtHzMQTROiVY9PYb9TeX1F2L
         dxrEFWxLdRbLmruUBy8EJxXMolDSskcfhHHKTf0HW8LZ+ZYVu8dL1GMUe8OB2joNOv9l
         3vzNzBwjInVS3QS8IxLMveJTTPIto1BCZw9KONB5EKfB8W7n93JuE7pk+dECb0hyeJPD
         lIsxpxtwgZxh7RAwVWdgh+LQk+2rKBpyunHxrd23NMCC/ZOWTa2aaJbn47deTH6YXR80
         kwqCuCKuFpNkfsR+6rq8u05e1tzvMCJI0+j7wmAzzmOJ0QR5/W22QMCP0pHmrkzx5+iD
         HYpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGdVhUsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a0ced23000000b0066cee1c3e95si440844qvq.76.2023.11.22.20.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:46:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGdVhUsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YM-0006e5-WC; Wed, 22 Nov 2023 23:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y7-0006T1-3P
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:48 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y4-0006Hr-0v
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:46 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b842e28917so287706b6e.1
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714562; x=1701319362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMxrWeuiHOLByxeE5N6Cs/cc7NkJUHDeIn2aLelpULE=;
 b=QGdVhUsKc5Ko4aCEd/QuwPa5MF68JTZuE3ZVVI/vAz0zeyHTqtlikRzHX1eg+dEe5I
 AvBrV2MQ5u4kYAgSeHXd2IxEwoBc3hLQCHzwQFC8DshpDE7ajNssMTaPznqOI2VHaAZH
 UuEOjz++0fit43Xi7bzZm3/HbNtiPpXkburwtPVaBD4P5jliIGuLB9elpOTU+ShcQzFQ
 WRJlwtg2vqRmrdBW/Nf0D28P5s4de6tgU4cU+ATlgnwaaOHjNwvUKqcOM31WZ9nN3ZTc
 N5MvX7I8ID0Jfo1v9qUTMQtNRg2JcFmVQr8b88+Y9vvGoMnJVc15RVMAt1+eHR8rJTdD
 NEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714562; x=1701319362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QMxrWeuiHOLByxeE5N6Cs/cc7NkJUHDeIn2aLelpULE=;
 b=B4dP2+Gr/QbzWJZf5wkyDZS6nKtzOX2ldMv6qsvbB/ctwNXE5kUfNKvsM2XGBsGRK8
 4tYZQacf6UxUzFjiUKI18ePghSscCpUNPKi585dcEplCXJl+fxZKUs5TDLKdW2sCxcs0
 3wl09OfFuC4aincf+NRuFZ0BKIlFLTJdlCuRsSilw/UwUCNGqeYpd0D8gRK9HSejtHpT
 XP9WS1EASWib3PjrsOFoyZfd7vpJ1RCcVmX76N7X67x+tEOhhezZqjoBgyRwLU4o9mdT
 EX+zaFeBI1VbUrn86kteIL43UXHZ2+VAMgJJKbsB5HBlHRW/n9+gLJvvQ+kSYAJ/it3u
 fcOQ==
X-Gm-Message-State: AOJu0YwRaa9/yGOo47Ywm8J0k0ZkgG65pUjyz9kNCAxgKvqhHa/XcYM4
 47Px2hEvb5CjeugAx7yxvgYFw+g93w4DZ9zBVaNTD+yI
X-Received: by 2002:a05:6808:1a0d:b0:3b2:dfa0:aea3 with SMTP id
 bk13-20020a0568081a0d00b003b2dfa0aea3mr5571900oib.3.1700714562036; 
 Wed, 22 Nov 2023 20:42:42 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/21] target/arm/kvm: Unexport and tidy
 kvm_arm_sync_mpstate_to_{kvm, qemu}
Date: Wed, 22 Nov 2023 22:42:18 -0600
Message-Id: <20231123044219.896776-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
X-TUID: B95TTrph4YNM

Drop fprintfs and actually use the return values in the callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 20 --------------------
 target/arm/kvm.c     | 23 ++++++-----------------
 2 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b4339d49d1..8a44a6b762 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -200,26 +200,6 @@ bool kvm_arm_sve_supported(void);
  */
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
-/**
- * kvm_arm_sync_mpstate_to_kvm:
- * @cpu: ARMCPU
- *
- * If supported set the KVM MP_STATE based on QEMU's model.
- *
- * Returns 0 on success and -1 on failure.
- */
-int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu);
-
-/**
- * kvm_arm_sync_mpstate_to_qemu:
- * @cpu: ARMCPU
- *
- * If supported get the MP_STATE from KVM and store in QEMU's model.
- *
- * Returns 0 on success and aborts on failure.
- */
-int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
-
 void kvm_arm_vm_state_change(void *opaque, bool running, RunState state);
 
 int kvm_arm_vgic_probe(void);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f9aa55b1a0..19454f432a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1006,41 +1006,32 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
 /*
  * Update KVM's MP_STATE based on what QEMU thinks it is
  */
-int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
+static int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
 {
     if (cap_has_mp_state) {
         struct kvm_mp_state mp_state = {
             .mp_state = (cpu->power_state == PSCI_OFF) ?
             KVM_MP_STATE_STOPPED : KVM_MP_STATE_RUNNABLE
         };
-        int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
-        if (ret) {
-            fprintf(stderr, "%s: failed to set MP_STATE %d/%s\n",
-                    __func__, ret, strerror(-ret));
-            return -1;
-        }
+        return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
     }
-
     return 0;
 }
 
 /*
  * Sync the KVM MP_STATE into QEMU
  */
-int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
+static int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
 {
     if (cap_has_mp_state) {
         struct kvm_mp_state mp_state;
         int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MP_STATE, &mp_state);
         if (ret) {
-            fprintf(stderr, "%s: failed to get MP_STATE %d/%s\n",
-                    __func__, ret, strerror(-ret));
-            abort();
+            return ret;
         }
         cpu->power_state = (mp_state.mp_state == KVM_MP_STATE_STOPPED) ?
             PSCI_OFF : PSCI_ON;
     }
-
     return 0;
 }
 
@@ -2184,9 +2175,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
-    kvm_arm_sync_mpstate_to_kvm(cpu);
-
-    return ret;
+    return kvm_arm_sync_mpstate_to_kvm(cpu);
 }
 
 static int kvm_arch_get_fpsimd(CPUState *cs)
@@ -2367,7 +2356,7 @@ int kvm_arch_get_registers(CPUState *cs)
      */
     write_list_to_cpustate(cpu);
 
-    kvm_arm_sync_mpstate_to_qemu(cpu);
+    ret = kvm_arm_sync_mpstate_to_qemu(cpu);
 
     /* TODO: other registers */
     return ret;
-- 
2.34.1

