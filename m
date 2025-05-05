Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178734njj;
        Sun, 4 May 2025 18:52:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlPOAF1Sz0iGjUHRruyoiMEPd8c4OyCO2gRnSbQgDojZDYWppTnWTiSvRvDXdLCbDEyi9dAXNpaCgGKQ==@linaro.org
X-Received: by 2002:a05:6a20:12d1:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-20e06436796mr10365227637.10.1746409954886;
        Sun, 04 May 2025 18:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409954; cv=none;
        d=google.com; s=arc-20240605;
        b=bBjV6BIVCSuLC8VR8EhpcoK2Uv6beCsb1B3E9ytZTBNSTB0INB4KY542+y1ShdI3sC
         OMjvEZO5gQwe4OP9ARLoVj0gqmcHdNdjXHz9gci+Ra1t02qn8RhdPQMicIbZ5teC4IeO
         GfhOCd61jsW85vx21Qn1/uYVkqoi6K1I9r8Bt33+JLT9SqGfB8TAk+rxny6+m64SC2i5
         2U6pP+yxw8WnPdz7ynwCxERGzEiES+iDpByAxX1rqFB5aVbNAPs0Wl8hYaL3mfedA5Zo
         UlRYT8lUrhYLPyGn9AtSTA6lmBJZqG7NGpHv5ReTQJGsav4iFSmZX9BVkHqIuFRZvgjk
         lRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        fh=qKPPB48noNu5r6ZDDIl+hn+i2RU0qmtlBRLASNa/d1c=;
        b=K5qqFv27PJfzP3LExKH78uDsUIL8GvYNBYtaDPy/oX6aArfu+hLbvyijKcCleYmTfc
         eWifMiiKE4TDrbO8HJYxWUrqKsMmlSnBzsM7fqh2kLwkvs4X6K5TXZ4XRlE/YhPJMGzG
         CTEtBWQZLJQAwtQrEecB2jp6hy0U/lqKHhEoqgmUYVG6DJBKc+C6YB1xe/wfZqDPSSNU
         GQhgWKYRiNTcXV+Yko7F8+YNk1LmpZKY48EvTe96nguSVuHBma77PYeDZHwrbwCvLvSU
         4sZslHmrzNCneXLhOaxGPe59I4OWWM66rOQUOW9PiBcLyp2YIo0rFQbGypC4RyfewT4f
         j80w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wJ/N9eFg";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d0d7bedsor4721436a12.0.2025.05.04.18.52.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wJ/N9eFg";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409954; x=1747014754; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=wJ/N9eFgn4/wQb5ZAqiyPyBxJZT3Dx/wKysE8Rl7KyXL1IKQqEbxCGOVE+vbfSv7SC
         Z9h1+8FsdAAyDWHV0M6XcntGeAfNyYCSxK8pOgINRHJOxc2waHCVeECwzSRhiWuPZRd9
         Pipru7qU/b/i+Rp1O5LIYnYn44DVM3HLnbj4WbBu2jEXbD82UlgXHQLFhQwS+XowsUWc
         KnicEQ2w0PbOlJ/nWCoxB6gEE1+2e2RauL7vEIbTB1zaSaQPuo/1YhWjuRjmw56p5xDn
         FALOqybmVA2kmvm9FypzyBl6GKGtQKkUR4MRHw1SoJ93RksyS2zN2hRac14hvFtnrztB
         7dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409954; x=1747014754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=HPiSKKvtXpq9R88tggtiLNWrtxFcs/MJXIZfrWv4ZTM9IGzes2xCOJTWWiIPwfheN9
         zq05EqEVtoQy0r3RZAAXnF1qIi/nkMSTUFvQxXSMon2SV/ULH8tqpBbT3IEfW2MkcQHV
         Rdg29P+4jzk6gAhpfT5Av48j4LvnoQVrSB7nKV5lTDmlQaKW3E67vMTsf7/SQItnZzna
         MfuDNLWeTaF/RSIIhw8TQ4gWFFQpWmWxq4+8um4HvgX9Nu4XOZZNd4i79b2lBgui5rRS
         kvuUqmfDzuTH0W45e/hz79eVxYSHgfwuTPHw/5Qf2jvRFENWNK+7HO8UoITxiK/vIFXw
         qzYA==
X-Forwarded-Encrypted: i=1; AJvYcCVnCP3FZ6qbTQhSmQsqJGLUGMh3bKPOX2fH2ToiZpVs41SpsAPWpKN4uG34qJs9dx0XzLM/Dtr6L+dITg==@linaro.org
X-Gm-Message-State: AOJu0Yzlu+ozWisgGoqb7t0IloeWOym53yvKO9OUHZbrQSUYBlr21ATM
	zLoM7Ai0lh2lrvCF0FcjeI/IDETR0RjpYVdSwonXAvwUaXoJmzhhLzClb0ky03a9xdn5aSppDhD
	8BghSuw==
X-Gm-Gg: ASbGncvAm9xaFpnjC1alHBtkrPSvAJuevEZCef7gzOyYiEDVLzNb32EGcnrLlkJx/Vr
	dGCKTsxvsJxrnUjHEOG0vBhcv+6xwZtwXfH6yQXcM3nONp9vEXpn1BcTD35SJaQAfjn1kA1T2Dq
	WXnpE5RiS6NxitX+3jwxzyK9e4vW6N1naSDaPD8Y69cQZdJuwuq7JD4oBKHXvi6s9Jrw5imfyj8
	84hFb057vNuBtoFhN+DgoCyhftUhozoDrxuayBOiLy5W+UHN5qeoxM4bj6zDxHVZcAZWU2kpZ4t
	JdUoJYYfUpha+cXDOyKn9uw5D+/CO+0WTqG/iyce
X-Google-Smtp-Source: AGHT+IHVsm+2T98RMan+aqKpvWrHPBx/684xgAQ6PVkROPORQuD2CG4DFxexJTT4HWRoWnoTr19PIQ==
X-Received: by 2002:a05:6a20:9d91:b0:1f5:6680:82b6 with SMTP id adf61e73a8af0-20e079f2659mr10290006637.38.1746409954391;
        Sun, 04 May 2025 18:52:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 07/48] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Sun,  4 May 2025 18:51:42 -0700
Message-ID: <20250505015223.3895275-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DXedCSx4TwmY

Allow to get rid of CONFIG_KVM in target/arm/cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h  |  2 ++
 target/arm/cpu.c      | 31 -------------------------------
 target/arm/kvm-stub.c |  5 +++++
 target/arm/kvm.c      | 29 +++++++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 7b9c7c4a148..d156c790b66 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -221,4 +221,6 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
+void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e951675c60..07f279fec8c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1099,37 +1099,6 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
-static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
-{
-#ifdef CONFIG_KVM
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    uint32_t linestate_bit;
-    int irq_id;
-
-    switch (irq) {
-    case ARM_CPU_IRQ:
-        irq_id = KVM_ARM_IRQ_CPU_IRQ;
-        linestate_bit = CPU_INTERRUPT_HARD;
-        break;
-    case ARM_CPU_FIQ:
-        irq_id = KVM_ARM_IRQ_CPU_FIQ;
-        linestate_bit = CPU_INTERRUPT_FIQ;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (level) {
-        env->irq_line_state |= linestate_bit;
-    } else {
-        env->irq_line_state &= ~linestate_bit;
-    }
-    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
-#endif
-}
-
 static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index e34d3f5e6b4..4806365cdc5 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -104,3 +104,8 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
+
+void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 97de8c7e939..8f68aa10298 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2468,3 +2468,32 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
         cpu->kvm_mte = true;
     }
 }
+
+void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
+{
+    ARMCPU *cpu = arm_cpu;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t linestate_bit;
+    int irq_id;
+
+    switch (irq) {
+    case ARM_CPU_IRQ:
+        irq_id = KVM_ARM_IRQ_CPU_IRQ;
+        linestate_bit = CPU_INTERRUPT_HARD;
+        break;
+    case ARM_CPU_FIQ:
+        irq_id = KVM_ARM_IRQ_CPU_FIQ;
+        linestate_bit = CPU_INTERRUPT_FIQ;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (level) {
+        env->irq_line_state |= linestate_bit;
+    } else {
+        env->irq_line_state &= ~linestate_bit;
+    }
+    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
+}
-- 
2.47.2
