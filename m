Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19513njj;
        Wed, 30 Apr 2025 23:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfww1MbqEiR+mQmqfwQUtinWHXAFKLFm8O/XBXbwoiOxtqJadSU/ZOM8M2sp3+kbsIM7FPKCzbZF6YZA==@linaro.org
X-Received: by 2002:a05:6a21:a4ca:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-20bd6d3c490mr1899181637.15.1746080637315;
        Wed, 30 Apr 2025 23:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080637; cv=none;
        d=google.com; s=arc-20240605;
        b=E8BHb8vOWddtCFWGvDrkDvIxqqPYi2ieRLVand+3UH74nRbO29E/+yEbchnW5FQx2k
         ItLPezjI2t15mFnoSS+H08xU6IRGdM2k0PHX5Vc48uE3KRZsnzZJsiIrlYtWexriuubE
         VLz+3P8S2Zq4S+cYX/fFy5iD0GlViGzmaMGi4qI7n4K3Z/3W7STDQwdKzCer2pN4lAc1
         hmNBJFao0fJzziRF3tX8cmpnTnXId13Ww2J0xqG6Y6armx+cCD3XXgtiCcZQvliTWOkB
         FOOmPkkhuind79+/dDssmqQEKqNxr5PAQTAM+exlEjggXS/dkl7kvMOTDn6bBXKqm3NQ
         qiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kOxKXFGwCu039etMQxzOSUx9I5tz+a2xiou6nYotXOs=;
        fh=oc47Afa/kl1S5HPMjX+7jIA9OJUG5lBQoOWMRKl/74c=;
        b=N4pGdw48LvQOZsg5ZzIrWbpQlcCE49zhAnTvwYRBMI4urgBuJo8LQLCeKIYG519AhN
         dNq5vHfJUKfxtLP6bfF4Cv6ey3YcQ2FliD//UxleiKKg9wTi3KqfLkto4tDl8APdo4+E
         5CksJm8r1vJaMwVoSejGwBwjhTPd66bm/WveEiRoSwcXjzYVtFDPTxciSs2WYB0oJO9O
         Rq97wEpdbw+Uk4StSK6ABEkqCsTolIMNCqVP8TLbPDwSp2/ZF7fKEnt2mehUIoZ8ZVpm
         0XOfV/m/uT7op8812VQgSyieK2khsdTP7gdx+67F8edNPBbl/pty9KVSMGrvNR6IXa1h
         hXXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mSA52/KU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1379sor72680b3a.1.2025.04.30.23.23.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mSA52/KU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080637; x=1746685437; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOxKXFGwCu039etMQxzOSUx9I5tz+a2xiou6nYotXOs=;
        b=mSA52/KUOZ22blw8kwtHKeyXuSFKhxltkSJGnCyWTJDHWQ5kPu3Wa0p8p40Cd/6sv+
         xFq/e8jktpLhh4XKNMkn2OoCK3YwNo0h9oCiq6PATGsjLKbCJ8L/Prpp0V2MmL+Uou+o
         xUgtjWBtNUHdAmmKlUKSbmL2bgS9U4GQFHOzz9TXWTxoL58at501bAdJEAlaWx5Ym6tn
         ikEUFl0vnpu0aLEAS9JzDvAd6CESAT8cs31b2QCVAACLhYoySQoTKhBySKCqQ2CVkLjK
         0Ocwc3oS6GQBXca7myWrz2H6aVMqlOCfilkilyGmJq700NannntsCzGPAZEdeHICq6e0
         Vbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080637; x=1746685437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOxKXFGwCu039etMQxzOSUx9I5tz+a2xiou6nYotXOs=;
        b=O20T288/Uqv5/FGWdlrwk6tca8Lu5F1iR4h/0ByK+C6Egzc0DdchPBkdXjj6EzIBX1
         BfccWWfhU+4eql6ZZoK2htEAHc7zHv3hsfmKHN8oj10K4LwhS6xFttja01x0VHYkq0g5
         cEUq+G+D1NtRTQQWACEEsI0FMdVniWodcKVsZNZ+WzKDd4JMqaY0PzdpFz4hbreVpB/3
         iuMWgM5dQ5j9uVuVUSAZfxspznJjLTZ2y+sl+C6z1TySXuM/k/8+ePPPmizbJk9XrXTd
         ofJhaecjiEBEbAhCwBP+HxvVIRGii4gNyu+7O36zfQMhOltqdyaK/kTqGXRqI4PObfej
         WiZA==
X-Forwarded-Encrypted: i=1; AJvYcCUFJfaewTlMrYIp5N9jDzCtOF0c07fPAdD65LDcMj8jXeXYqc2/pxdO5r3ZabVLVS49WF5twnVH+KYGpw==@linaro.org
X-Gm-Message-State: AOJu0YzMuR9rGnfTr6mYYxIpRfG6cPJF390cSj7a2D5CvY1/qFy1ozu1
	sCslIMeww9kLPPPOHtMca0XZJtODn6nt66lPnILLtqScpqEaKt3/NzJExouJ7k3RcA==
X-Gm-Gg: ASbGncstAuGxLlwMOSx/1YaYZdfOqYRsESglhVPqWARiIapXrYoNXbJ6JTjqFCEZljR
	LbpCpxhqP/UGkKl9ZoGPLQf2xEahQ88vsLQ86CAjeRQi/IqdMOnUOtyy285jaFAjaaDAKnJTGTD
	pBpawF6Anz/cI9ZQy1MfQMGApTW61RNavvGOrzxGA5QTFWdxICIJjABvrV+i93QfF+anBHScNtD
	45P67IIrAAYyRBfQClL5YSvf4a8WjOEYPjiT8WpceLgOZHLuUOQqWQGuvDZZqYwDlT5OOAHjIQY
	rmptjnbMNWEczOa35mmnY6Ba3+06vKVYFAwKU+bo
X-Google-Smtp-Source: AGHT+IHRnR+IPmf7SIZRqz2UrjJSmL/cOAzb0b8262p6NW8Ku0JmPcQONHO4WRpvOKQAo1aOXHsskA==
X-Received: by 2002:a05:6a00:a96:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74049239b22mr1705425b3a.17.1746080636763;
        Wed, 30 Apr 2025 23:23:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 06/33] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Wed, 30 Apr 2025 23:23:17 -0700
Message-ID: <20250501062344.2526061-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sC6ydMIyvEOp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
