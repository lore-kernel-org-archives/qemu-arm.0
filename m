Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778170njj;
        Mon, 5 May 2025 16:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM1AbAE0Cf9xHtK5SxdBdWeJpTccmbRlkalhse4dsQZTtF83QJ3M515Tja3NoAoBzGucJwnLzTUZgXRg==@linaro.org
X-Received: by 2002:a17:902:f60d:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22e32776c1fmr16226235ad.4.1746487227250;
        Mon, 05 May 2025 16:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487227; cv=none;
        d=google.com; s=arc-20240605;
        b=SY0DTQiOKH4svm3jzi0eMX7gMMUFgBrU0ZI7U5HeqExDS+fKqqLaJf20WLNmJcplCB
         IdqedKz3+S07PkdBfj2iEItsQtOHIKEPQXtlLul9Z7yNCZWERwoDWmnlyBS+AMVy/8+g
         OJ6hX2ejkvuuO6HXnUsbkXZRrK4Rdr47VutrBiG2iseFDj7GkkCyjzwAExbfpbUAHpJx
         xhqsVHwP/M9rtr3Qbcmf5oOKoEPO+sfqWntU5EvFV7tPT7Ak5o25JR1DhfRFsVFTvC6m
         A5PBqr9zZ9BwMdbgJUpM9pVkvojGG3Uap9S248VeosWCrohmroOh8uYb/ZGHD3FQavcR
         gIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        fh=eTWlML+Q/TN9ZjDpnBmD/I9RFOa2f9T45P8gIgqy1ro=;
        b=FYXoOS0PuG7uVcZLd+UAF46z+S8JafR185tAab63A3kKkXee45w4EP8J/nUMXGFtAG
         Ly/1HJNb9zctFEgDQj/Codm9jVuJ0b/gGNeFc+H3LDb8PSDYVg6KtqG14sC9K1QNAGSO
         O4AUmGQREzaMvEic0TnEC0rJ9U3qEhA7Zsf55cvMufdhQfylqdQvcM/L1rO8lIGbncTQ
         5XjWhv/kAyRD7ujgMP81cusApneL23sX2/Lb3pMf0BQKA43+yWhagJAJTWGQZPNKwnx+
         M4UF3yguQJyO6XEJNQ7CdRtZ2vavgK9JGv6LzcG0B70WPlpHBgfyhEwEsBWz9hHBLNQG
         sRLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFBFIhZj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba7f6cbsor45421695ad.0.2025.05.05.16.20.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFBFIhZj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487227; x=1747092027; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=DFBFIhZjhLHqWqfUvojPZYX5UoDSTGJbDgzBL4To/gk+G2rNR83JNr4Pgy5X+YKUes
         VPo2jwxm3Jz6mDCDa+t7MEgj5QEEP8pNatdMNTLpOfaSWcTxhVEPgPgAk0fQVbJ1to77
         78coPAvtn8C51/P2EkSeatJr5jBNABwN7s89fgurKJDMQMyjld+Y8FtlfhmeJXFj1pGU
         rln7OW+LsIodbO1Ru5L4mubR9VeerRumFHNYA+NHGrw7KQwimhMR1JTf13YMRgE10PnB
         LMH9EFX0JdGiK9ocy7aos7duz6p8i6RIES8gOysQwm16vFbvd7Numd6hnLr5CT8/sbn5
         mJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487227; x=1747092027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48VeJmtQLPOhxBVuGtRwfY5ps2vP+Hg73z2yA0rcj8A=;
        b=KcfkgkqFMtx5iZpeP8imXdTqTRQUSG7uVpSF7Fj+z5Q+2OZCEeXqyq2rm4JX+IHsXJ
         krju2j/vkjL7PT4F6I1B2wwBeYVopyjv9sIc+ndQUOAJrO5nvRdz2potvsMywJVlj9Bs
         uyjBHY3WPn7UFEoNzuZEg3C3p6kG6As3B2niDAdGOoZ8vrilb8vY9HQ85jwETOXTftD0
         mYXq16RoSmP328b14P0JCDqzHQ6IjCGr422l2kyHpsjtsdhe863uucxLaT1R1R8HWYBn
         BEh/nEgkGfvjb8uu5FQf8yibOXdDzXDVhO6sgXyK/8SSi03edQza22dPMZyM86bYRNHB
         dzsg==
X-Forwarded-Encrypted: i=1; AJvYcCU/OuSVROqaYLF5bVo32QiPuE33k0Sa1RE024r/eD5OePXwXDfkV2kzrNj55MvZ6cXUjjwGTHXmBM9j1Q==@linaro.org
X-Gm-Message-State: AOJu0YyTmFqCTpC+caEhjzoMUJL608TqB1B+TdJ4baRYwmeFC5SN3+bJ
	I3tn84UjGq4QZxm64KrfaUmC0kPkytW1x91PIMwlxjxlw+6NS60B5TzPRcWK64LvhQ==
X-Gm-Gg: ASbGncvwdGe2RsQyvfyzCOnBLLPCSo5sSsHgnlBllejpAojHUUZ94dPBy5NeJbHnBKm
	403iUL0CVq0FtgbqWfYtPIWr47Qw8TEz7nXFyQ90TQRLVfzy9Ke/Gyfh3UCCd0f7Fd295aHWUrO
	dJMmWHWC7kDp3YJO+Ag2wOy+nzRyakxOosa4BbRGQ39ELQAIXDgBMZC3uvSVkxz9yGrnNvfjOrn
	4Ro0jVXJXH7JnitKk2lNsl0VzMv8GruVC+2aMybAGa5ASRnlaIEdSelf1bRtINzKDJm38cOkO6p
	WI3Ob3pEKvJzoXnKrisLQf32zOXWiy4+Ee9ghkYj
X-Google-Smtp-Source: AGHT+IG7ArAq090ldoo+ZdQVBej7m6q6ZuRLjsuSHiLmFUTOGIKSXlNLu8HuIseupKBtlS+wsj+7ew==
X-Received: by 2002:a17:902:d486:b0:215:58be:334e with SMTP id d9443c01a7336-22e32776bf1mr17875875ad.10.1746487226858;
        Mon, 05 May 2025 16:20:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 07/50] target/arm/cpu: move arm_cpu_kvm_set_irq to kvm.c
Date: Mon,  5 May 2025 16:19:32 -0700
Message-ID: <20250505232015.130990-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ISIiP2P9r3aX

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
