Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004565njm;
        Wed, 30 Apr 2025 07:58:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHK+ba5nfiS4b4+GR267xCRnVTwq6Wm4iCIBnMrzTuUW4FCr6wv9wrrxrm5iVvhGvXgZraIaGF3EN8zA==@linaro.org
X-Received: by 2002:a17:903:181:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22df576341dmr44456585ad.1.1746025136299;
        Wed, 30 Apr 2025 07:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025136; cv=none;
        d=google.com; s=arc-20240605;
        b=QkJZbp46Wdt8O1bdup0SuPxvOJAqJIJPgBsiXitgnhJkXJj5NZkK9vyZ78BOUpQ+02
         K5lTH2kt1TsYvxWAnjHmZWYf/hwI00QicZkQysMtsMZFMEMjSW/F/vNn6COwMNmys2yw
         J/DG8sX4SiMzUa/qewNUfpgfzQQQOFGRkPQjgGrDiBCD0nTwgzX0bc9c5vCG6WyVe91q
         8Lu2ND46UTrlSbiHNCjXI2CUeDlJbE1bAdRdhVuA9AhAL8k/GT8pc3cN1WcXGSoL54Gt
         KKtVDLkYI8zz/W7N1Nble7MifEajRhengFjgcnRYoLYOqJQfx41kqzdavczmaseHcrdI
         mvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hX/hJH1gLLVfS0bwh/LZYqdKvfx19Rxb8RxfxI3LnbE=;
        fh=nHTB6SEyKUD/wqnsTmrI+8T0AI60J2Owrbp8ERKQZ8I=;
        b=RQ/vhC7EHRJWLVJwS/kwTRiujwZZpe/id5pg/cQ6HnDMdZBIyyCTlauk8kp104lhbR
         i/H0jxjE7Go7Y6GXIjV3BCnL9XdjRqxbN/0Kj7rMUeKfGNHdJbIwJJM3jgdf+3jFQprS
         0lMFWk6Gx6iyMFxpOkAn8w7aw8rVeqzAlkk1mGSsUi3I/imvzqni8uNHhdaHrjW/kOgg
         4TUyzS3p2xR6NgHnluS6r3JX0oFaUnUrrHyYh7+GU3f69n08f6QuoJHhRPXTvKE5RDuN
         z9jC/7176PL89tbRDM3fguYB+5QuxvzXfVT4p3Y/EjDNpiXFTvyGqi0egpkHSgZc+smQ
         VIwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fJgtr1CT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4c1f895sor126530575ad.0.2025.04.30.07.58.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fJgtr1CT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025136; x=1746629936; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX/hJH1gLLVfS0bwh/LZYqdKvfx19Rxb8RxfxI3LnbE=;
        b=fJgtr1CTnX8pVdFZfQFGW2EZA1ChyTvX/3OlKxIqESpT6+Na//XbzvwNJSnWBZ1UcY
         o84sct5Pq26DLDMe48t4G3hvx5Ifr2cb5S+hzlrervkd5imNZbuNETgPpqKTXPT8hSAo
         UQ+lYVNYfXWGYLQOyKFqQhr99R+y3jQ7zQ+k26xSF3dtEAQ9O3K9OeKr322BycFFnE4v
         MaejHDN6cmOvkDrj6ZANOgg43E8V4fYPR5wyTbRDz4xv2d7IpqIX0KCvCgN3XX+jtMxQ
         NsLrzrrvAgvyVBhH2Bs33w6T5TUd8UfJdExhuniKCHNUgfld0MfarrzFaU4sTwq1tifS
         f6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025136; x=1746629936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hX/hJH1gLLVfS0bwh/LZYqdKvfx19Rxb8RxfxI3LnbE=;
        b=Ltf3zE7N+gKf9mNG9IdcTHEvVCPNRphnyhf3ace8Ad/Z/eeatY3Vv6mO6UXSmnk73S
         mviB/w2P1QS4ThFuL+iMqdpcGjJcmXqfotl0lSvvd+y0JN7XBJFUTJ2LbXVv7edYycXa
         d9h9f3mO1sdknwVKL1+m3x+jJ5uVpMoje+G8VEHTWeGoREB7hwf4p1Pm5ZmQSbX8PnZv
         Tn5QaCI2UQG/8Zdz2ajM5sm2xpaK117wW8iL13TFVpTyx5H+2MOmcUEikLBg8tehbIv2
         T9MAK+xHFy2su4TozeX/XSyVEFPkH+mnK9EgHeorG+BzZTS+Lt25mwX09RA90NXnrbfK
         jOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVzvGo1pZbf7SgjJ9UFN2ywQwrslxkjlQv1AQhmkrK81OcNGONeF4ruqdFy8l6+gDOJK9UmWZ0+8qU1Ug==@linaro.org
X-Gm-Message-State: AOJu0Yww+LVl3iQsGvek3mhz+PhObDVoOH9U/nncP83rHX7G/wqYcy48
	dtZSc/sRgKhzJYzBBg7Oe8+LeE+3aqMQ72YzW8tyBrmqBjsoQOy4frOtR4hrbDTuvg==
X-Gm-Gg: ASbGncu28yq2dIw7Zj6+/g9Is6FpiXYPaEq/2uG11af5MkoWP2rLTheZrcs1kE5aXGm
	xqqga/9SGCEOWFJZeaEdyDKHm410JY846f28bBernhUmoVUYRN95E6KgmIlj3AepHLeQRQ2/g2U
	IK2OpF4hi9xO4IJ+tfLf/4l59+8Z7UiAgFND+9S85sJ60J27MX2z9psZ+q61X3bE04qc8IcnY+Y
	f36XVnZ4R6kkdX2LCoRCPN/tH8Z7flyc/ciC1ck/6IZ9zunq9V8Y3fyn0MjWxOkDmoz3fN33mp2
	bZgHBSmAJcjQ08cydRZN/+ogkFXr4sJr3RayxUAA
X-Google-Smtp-Source: AGHT+IGRjjiEH+IBiShXoujq9YBdCredlo8Tlf7FnR1GflfbdHF/SogYBgWNL1xlnSq0hXKTupdl1A==
X-Received: by 2002:a17:90b:3806:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30a343e80afmr5103795a91.7.1746025135869;
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/12] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Wed, 30 Apr 2025 07:58:31 -0700
Message-ID: <20250430145838.1790471-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gJfmTHG+NBVq

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
