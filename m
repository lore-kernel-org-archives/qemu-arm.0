Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42575njb;
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMaXUy9YmDclacy75EQ1EEM2LqYKaQkVWUTkFLZmWlHfQG6gL3ATjMx0OI3hUGzk5fuwymJRr6Fx0Xgw==@linaro.org
X-Received: by 2002:a17:902:ecd2:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22fc8b63e31mr209630175ad.21.1747073117553;
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073117; cv=none;
        d=google.com; s=arc-20240605;
        b=U/xv5WSKaQyA5tW1b9AcaljyzbTMERQ3tlwktsIyX/fOtUO1Xvnq8VId45MrtcKDke
         LScbqR6qO6vm6iH9YQdQD8DOWxdSnhu0fksgeqp9TXG7eE9T2BbTAHDhhyILk8gH+Y1U
         oGhGbckRl4UXTZGAGksnZ8SUrXyuVZR0JQFvKIIdNRBO+NeUAm2d8sxjDb6CdgU28r/g
         +EjxWAvQfRIYDME/abH1Abf62QGXO8qPOyHlsC1MMz57UkzANKR+A+9tXhciCrG20Qme
         R3PMdOsDQ3NEmo3LsHpJE0WopIThLffPG5jM92HPI5g7/9y4Lg3nyGGQv1MsssMQXWq6
         uBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        fh=EEwf7UptFS1908xUMuAeQS9fd4uo70hFBU8q92W1R3o=;
        b=bB0i9+9KmWtcg92XGS6B8EX795RBCG21hpFvsrlspf5xwE3+DEXficLotXXvr3OEL2
         gSpeg6d2fPUhvyXXWFz9l4FeuiJiHDUHWhD1wdfBs5iz8TCEJNv+lBRiuqR2q0PElmj3
         AwQn2ZDPA33TgZTnPh3IS7T6GpDUcSWJzN9LVhpU9UPaXIr1MEiOiuSmr2RDCjsGiQjb
         TIcaWGO/F3wKmHXwKIdll0sMBRKK1fS1YNd24KTBodwb/PAunjzJ3mgE3tlumMx3QjDl
         mieLmjwnLO85AarbNFuwEehr5RCBqJSKM7IMBrh0jvnUetPQ5yL+7uWLyaZdGJVome18
         7BYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzRvvjlt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5828105sor45120435ad.1.2025.05.12.11.05.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzRvvjlt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073117; x=1747677917; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        b=JzRvvjltr3e9rwy7qqUrfJl8pqzDvJ3ZfNHmFAwNGmEWHgSwcf1qtTSJ2YCFvQ0tl9
         px0jzm35XhVoK3M0aadwP2Sgh3KONl0J9haXHQ640rr9GQKxRf3L6LNZg/VKd2EynZRx
         naWu4YRpga5avWrm9BavTWP9/iZ6UJpny5diZ5pB1J791k23jKt9qVePFZu9QOQqXu1N
         CciytdYEfxnXQaBpg7HJmiAMoav+grdjatZVyIiqsF60FotLpMwbM7qOkPM2uCmzgBYc
         rPTWhet68x2+rVr5FbPOUUx7zJb5Wuo8DSginEPZZXvsqCMB2XqNQj+Cdwx9uWUUC8Pq
         SOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073117; x=1747677917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        b=mPq90/an/t8DmuxWIW6OlIPeYwDbM7X15Cf/CQbt1eglKsAaKv1F8U9hTG/Ou3QYxd
         CKJMMcbi4VsYNNxIw7GLTLL34j2RSfugDhHnU3lgSlzvpLG8SN7zNAwRj9Qdl9Adpzvx
         TUrzV/ewI8iuWbuVswDEAh5XvB718lX+TsdbFL8NwMXIGTsKyWKHxgcTz9S5cPJfeqWQ
         wfW+WxEoreneuiJUriBw/VC+srJs/UPx8jeZPvvXDzViBGPu8ubCc1D2vmx2eZvIMx78
         irNp3Ad70BuEeondnaWGKYr3K+BU6d3CaQdMMCm5n0Lc3az5mqbWt23N0iUZmUDVEeAt
         o4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2/jSOpPRWx8IIWkZcNGRVrDu3eJ7OgxeQvRoNNXrAkJZKxqgvjXNn4ePx3Sau6frArJC3j+dmHtCuhA==@linaro.org
X-Gm-Message-State: AOJu0YypSs7TOXB2IyaLT4+OBr4Wrz+weoyrAf+Sgyql3cuyU8P9YqVU
	peEb2fRty9BpKCjAVOtr1K1EQsUcx74PpRD+iC8mqPxExAKGUIxxWc9vw/BVjp3NAw==
X-Gm-Gg: ASbGncv2z0ZkivDtZJ7PrDe+455IMuJ+IaNMdhhVcIqc/GKiLXVMWYHTXLkj38bnX27
	7G0QxzFMTuezOdlRAIinDyVea8vz9D4XuRiJEwZsNfv/JHxfdnr9CNt1Z4bXfnzmX0S+VtgzxEX
	2+mogbfUfzDgcuRPd1n7c6zoWOlnkOJrizgKRnJ0QlxJyBfKpQhDu+WZqvGT3m3htdY4dOWr4Pl
	WQrslCgVDsVwmMw0LzdeOwOn2o/G04X95FsK7qcY0lTgYaY7i9qUBJMWFmJyFTG7yuK6sRYEsaI
	bnVjTUmvjCDkbM9EFTmmGlOevAGKbm/iDebkuJGGSkBKbBZg6ng=
X-Google-Smtp-Source: AGHT+IETvanw0ckOxauhRh53BeO6QFOIvdwuGiTFcETu9+U7/rtOOWaOMqjOOmK8LiKZT11pMAkQYg==
X-Received: by 2002:a17:903:3d07:b0:223:65dc:4580 with SMTP id d9443c01a7336-22fc91cafbemr189319255ad.52.1747073117126;
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 06/48] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Mon, 12 May 2025 11:04:20 -0700
Message-ID: <20250512180502.2395029-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f24P+Z54zw0f

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
index 5bf5d56648f..b638e09a687 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -216,4 +216,6 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
+void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 45cb6fd7eed..d062829ec14 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1098,37 +1098,6 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
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
index 9c62d12b233..b6c39ca61fa 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2429,3 +2429,32 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
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
