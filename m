Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756094njj;
        Sat, 3 May 2025 22:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7iEcZmTHdaDHers/XcXQ+bFA2lEoqSy3t5+zcbq34VMDYTMVR2eXsSisddS/yFO0pwWRRk16PEHbO3w==@linaro.org
X-Received: by 2002:a05:6a00:a904:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-740673faa22mr7200510b3a.18.1746336567058;
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336567; cv=none;
        d=google.com; s=arc-20240605;
        b=V4GeKEPsuYHdWwK3wtvSYSiztKSN4TKblJYhMend066P3afPKTEVdnkIqc635Vntx1
         seT1AgCd3QplKuIh0HTjS7B6bosR06uYF8z/DzQXEJNG4AqoXws+cph+iLk4fWOnYncW
         m0fPapLHqqbB3dl7DaE48v6K3OCTBRUjEmu24dIo5U5sR2qLWBO34J5+uqrRbJ1BVJHM
         soaA7VFA70qFZklifFvYj1RV+vwgwkMrEG3C/ZDaoaIQ17XxO8c1RmSsJzeE6gYwySAj
         wneiDaLxedZQOTmzTCEROEwWLCBFaTfWfvXHfZ3HXE7f67nMBFb0wbgRK0ujW5A3zdUO
         koSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        fh=0RyKB600LM6OmBNBhv+bDWnkf4Sc45CbdECRVmAK+Qc=;
        b=gFXaB4WTcADECU+mwBpfEtd8N3bRTV37u+oGl1KU+Sm8rTOjaPQy67jstmgVqFKWhU
         2C9+1UPQyxsU27aNLgHHHMJQYrW4kd5dpVpWuqKrSHWA+03VMCwTFcqpDgdWx6wOgQaD
         T72W8zHbWY6bIxCcqPHPqDfKrRG9vWAI/kWwrNQUDJuKJxLdl5kK4/xZctU8qu35KERo
         DO4zIrjxC/ecOESxFXI5aEp3MW6FkoWp5dsexg2ushkrhJnUvHqmgmzMRoeYTh9co+iF
         6f0Jcz2XT3xEo+p1Gt/zV1fmwJQd9qPD98604S5fEQ32YeSomrGi8vcqGxVPBAbgBz5d
         UEww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZGFD/wz9";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ed8e7sor5098793b3a.8.2025.05.03.22.29.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZGFD/wz9";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336566; x=1746941366; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=ZGFD/wz96NxYG0pODdi0mIyrOuKqvD0mijw49EWjJU3uNefKEX04CnYPjUUkiufLUO
         uSv4gtWJDpuVnzopO5NpCn44GlunOE4awQYnOBDO7YOUNuer1PoKC+2qUpPHwV/+xo+Z
         jBkRvspcqxB1oG/QkDSWtvyRUQzE/U/J1NxiKbWuyopYzV1rZomlOx0MvdjuV7U/22r0
         6yklJZoC73ikFrouo68iiiGyr0FEFndM+ifnZlc2mSxYjdnAlk4J2JUtwGw9h2Y7haBx
         YH5HhBXCDZwGoe8m8qUsg26w7dWS8YB9pI+mgrBv9cPt9TiVdHKgYIENJYc9t63qiLwC
         DFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336566; x=1746941366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=IoTgMWRro8GmXcg7xaaZKrZNMMBq+Ro5y15IN0TxyNKVG7wO6ew9Jd3Kt6mjEocXu/
         ycvoApR3VbU15upf7LSI9wOB0wUCRi3QAMYV8z8twnXqx8v/wMiviRHafaJoOHMmbcNk
         A1K62Vywv9JtvOcKasEshIuIJkNIiBdc8ZK24NBU4bJB0uWxoNcmuixgwcTbV/q1/6BR
         FeBhu/NUHXQ+zb7lmrfLp4gtVmH0VVFUO9ju5oxmCbZhaT90c1Iad1ovuzugbR7idTtz
         bir/OLtw8rXeBnoitUQxA4P9hyo+1EjvZEoy7dTKczjwO07aBqTbKEQdcGviXIYZpsVZ
         GXRw==
X-Forwarded-Encrypted: i=1; AJvYcCVoplVpcpaI2F3x1jMUZy8+fEGxLQvQSqtotpRszGqxZErNItMxQWHotr8HL+wtoOWIBNfqO+J4beJmPg==@linaro.org
X-Gm-Message-State: AOJu0YxQjBTavolrpWFpy8sYpBOYPohOUNgHkJEMk5EM4NHbansGcKk9
	X1ijcqPlLBSd5dM/cYElKDZYVvsgjgAwVC9MPj0uVm6qZ1ZhScMIScqRmC+Adu0QwA==
X-Gm-Gg: ASbGncvse1Y3Fimt0LWPAqnkoJEin8QK19q5NrzH+JbZU4Umo7nNAqqOe3UwJ/nW+9v
	OQSUNNAObYs2tBKItMO+pG2kKbpZbL5cRz2wtXf/+LA6tvNEGZ5tBAGf5FXJazs4WJ/bKjfgeFI
	8nX+ecYID1a0CVtVT/ktNNdlHuKXdV9jn1FdJ9AYACuISbUw9/jQzOtU94Nm9ENYRf6btwQaifa
	Fha9dCckvmL8NlREYjfwJG/xNJyAVoDk+Vrs8/xVQPQRWO+n2dTsPcENa2CPZkzJxpOAj2JezCK
	ArEr31aanFK6nojNzIiiwU2AQ6tAl9PyKseMtJ02
X-Google-Smtp-Source: AGHT+IEGCJ8bOHzgy9WrMpyjAziCFb1lEAaArfWX0xV8zNipX1Q0lcIdis5LRQByYZG4ALdALvRpJg==
X-Received: by 2002:aa7:9306:0:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-740672b165dmr5420738b3a.5.1746336566670;
        Sat, 03 May 2025 22:29:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 07/40] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Sat,  3 May 2025 22:28:41 -0700
Message-ID: <20250504052914.3525365-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nP1Qfn2runlc

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
