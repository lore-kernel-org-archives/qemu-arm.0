Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94255njb;
        Wed, 7 May 2025 16:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8PZlEzmwWywUUu1zqYa0sIlyTorEi6r2NSgeLBs+TY8MxNSMv1fLszpml+HV8FZQamGv7am49RQxoEw==@linaro.org
X-Received: by 2002:a17:902:f315:b0:22e:6bb1:f717 with SMTP id d9443c01a7336-22e6bb1f833mr37868205ad.41.1746661369057;
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661369; cv=none;
        d=google.com; s=arc-20240605;
        b=J1QdyvVxJLwUkGZSCs1yYY4zszRq8MvptxHO2fdYVy1VuzFZjZWyACzfcxOWTDD8pd
         HaUrWQhQhUUZDI+7JcyGDc2OSLERbAc28RoXbsO1GUDTkkt9COlMfW1UynPmEsLmv8ul
         9Fgo/XxhG4AhG+Gh9nWoNpAmDsCnA6R0Zsqpxjq4A6KrWueJ9LLyEjXA7FCLVoXjAnxr
         3I+EvdmX4Qydpg1hjgehiozP4xLlielz/G8S79Y19FArkF/1mjdeu+LMBeWoZGskYAkX
         bxCbjR/Gb2KxpRmbYcDtdEeASOkLx/ByA4t4YqmqC+0XyOh2L63twDiIsB0ZfQp4R5le
         oHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        fh=x02HShZZjDF/2cmUUy0xWZbnOWZIL6vvLiNUICDLEak=;
        b=NqmGVtaxywz3pv/G+GdUs/jLCdKrfo4gQt1VoKkbtmeJEj9qft8nZe3lz7QJF9BEi6
         PU32fIDIIwpPPJftAUvPmfEaiQTUr0mrNnZe1hXVyB6mJKsi443jFvCDYwd/Vl3YVFtY
         NJv0LsAiE9TNd/Fmoao1/iV+glpkVp7y0Jf9H3k4o3Q317DXCyG9FQQuayC8OB4GAEjv
         i45MJxc9vtioYAeFhGcCj2t7PJahk7Nfnfq3G+4kv4n+NyUQUn9rwB2fFRJg6pKm5NCJ
         74VTMw2WfTLO+aQ/pwOKntRmCH32uhWd8O7uhyXGXVQcdNj/PpjIfCC/sSSQ2YwCnTSA
         e+Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vV8n6B8b;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7991dc62sor10004625ad.12.2025.05.07.16.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vV8n6B8b;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661368; x=1747266168; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        b=vV8n6B8b9F3UkdGsYMLC6jJC8NlupqwM5ovZZjzSD84DQGlWO3symJ1p2THlH7gzJw
         u5mD2Krx24j4nqM12I3ZA9Efw5Ec5Tkf9oqFgEQzKLMZ2oOR3WK/hUb2/jrudoCOsftM
         lhxwpj5prCFwepxUmEKpIgKorlBiHQ4mbiEqyNOD4pK7A6QXggU9vfNhL04RzI305p25
         Br5IUVjbMH/UYD9CtIp7DmuM16VbfwD+8ShBPjBLhX8+1s7SOADctE8CTIZQ0uNa3nvI
         8tkFXLtGIHqRHXAQPMuz5FA9j7TQ5G0A7zIf6Xvv+iqmhIByteHe8vlgRLMTX5IcDjAL
         ulEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661368; x=1747266168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH5ZtRCeVBPeaEwJ188gDPaPfkE7sAMWROIwRI8/rfo=;
        b=QYaglR5hzOBVI4zNCq3n1zYcwZx0q8F4Nre0+Ds2NRJF56PfjFUua+CMWIFkbkK7G8
         b5Al3UIfo1VGoyNedVwYAjJtv8tU5Rc18cJoaYx2dycjfQ9lXa058OgOlpz8E1TutPCN
         /D8TUZOMMiO7ldDhJi0JMPNA5B1e4+qR+tT8UHu8svPXqKZ215IK4VSiWjezDn756VL0
         bSInYp+bhfxpStcgC2YCJFYpz/Q8YsBM8KwCzo086Zn1hJcxBKb/8OIiGNEl9bbpDqT/
         QZ73NiVrhS4O3zFEhSWxiilnTR4VHkueJcs+wneDt5jBAHjS0HZlq4TjgKMT02/PjqrF
         su7A==
X-Forwarded-Encrypted: i=1; AJvYcCW/SKbQ0J9oo4X4FFySHzDVFGuzsrJH641kJYDqOGzhZa53X/KDZSPy+dphCnrMEaADm99aSb23HS5V3A==@linaro.org
X-Gm-Message-State: AOJu0YxMzPqKMxc91eWdBn7RhT8nLdgTDkE17eOXKahfF54oVyowgEUG
	JIaV5VO/UobEUoXBFjllc4PcxVp3uPhxP2TzA9CzYCBwW5+zpFdGdkiVlFRgJfUEWQ==
X-Gm-Gg: ASbGncuTEZM0f2e7ZPG460hxbKGfrrop/xmYY1vkfugq/TyXNnn4o6Iuj2dT9c1vnht
	3N2dfUQ6NsLHIsy6oDCYHemgfOEujENW+hRs618GwlH/rvJaT2WIjTl+GlQQrK1Jo42hIrZUqpx
	UAKi+sffluckLPy2mr56xcP1rln3tVVvyU5hueclkI+iyg1/zyZIZonjNgIbTpVulkkoJqJX04K
	30y75sbJ96EGZUO3/nZwMBOsYmrbVJFNUTvN6sAFF4bWF1b3neCB6WJjHzi+mghscu+zYc2M/+z
	C2G2j508MPhBzTwO1gmJk8+objMyzpal1RqF+fH+
X-Google-Smtp-Source: AGHT+IFDUVNwwhWVulYfNSLoyuZxcW1zQrk5HN1MrlYxS3XpcmOjPsatZYcv0uHEc9J9FrqM7d+Acw==
X-Received: by 2002:a17:902:d50f:b0:220:c911:3f60 with SMTP id d9443c01a7336-22e5ee1cc66mr81484075ad.47.1746661368656;
        Wed, 07 May 2025 16:42:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 06/49] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Wed,  7 May 2025 16:41:57 -0700
Message-ID: <20250507234241.957746-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r86cleAmF5NN

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
