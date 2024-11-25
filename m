Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569275njc;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbfL2W34mubhvqiJ6A2qLrEVym4HayLwL/lhTT+5iEeYyPu1IRtrd4S3GiARA6kJZ7aeiqJhhim5RxQw==@linaro.org
X-Received: by 2002:a5d:6c6a:0:b0:382:40cc:5057 with SMTP id ffacd0b85a97d-38260b46461mr9592135f8f.8.1732564768612;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564768; cv=none;
        d=google.com; s=arc-20240605;
        b=Zz7nCtjIJhpOBYjZ8YxzE/T5AMxLETpElTDgpR+uL23VPCKj2ngnWIKct5kyuMGX/Q
         w/gqrFvMm8Bl5zHifU9KtzddLmHAOjNsrNg6jjS83FT5bbmHJOSCHLWAzjUXO4PHrK8s
         J7c0+BI/dMA4q4gIU5dWsnEc7JDRmQwTq/RNRPzLfW8O/2HXk9MEpsuDat5xhgh1V4BP
         gnddwKJMmQyoBzA+YGiuhZhz8THpc5fdxkQuzutzrcDsyc4VqPKkAGy6lY+ycH5OpI5a
         uaEoqFw7Vlqr3ZkMHyARYYEDoMXbtbyBntYF3VIpYnrArKiByXDRFrlJBHjoL3Y1or0z
         jkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tQShuah4RPH85LfDxttMiyLaDhN+5oe8+p7fsP3yrqw=;
        fh=9TXKkgRrn5w6HWkHT3L/aJoWaLT0mHoNbtm1xwgFJog=;
        b=dkSZ7cDRvD24frKlDtngDDoWWxt1YzQzzzzRS6/yEpn8I0BERutyzR9zdpWfeFWN9F
         nambqBNHBGDn5zvbeFo28eyHofHQQoTLl/Szl6DhV/yCL3Ro46+ix8RpWeIVHG8kVEYR
         0JBOKrpKIkyl/EIDr39wxvCUL2X+gJJOJkN1qUWzOQYnj0mEoYJeAqCILlvMkKDGLeKK
         P4OmN+IWpE2XjRqCjuOVCaCKSJh6qSkONn6GzEJfP8ePws8hQMqvSj6Akiwu//5enSEI
         Rckqoxl9DGQFlcf2xBXkVMUXWSe+AlWoEj5/+8yQTPJimka2AQEfzKiz0lFwvVBthEod
         v0kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AAhscYcf;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385be98dd89sor372030f8f.6.2024.11.25.11.59.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AAhscYcf;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564768; x=1733169568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQShuah4RPH85LfDxttMiyLaDhN+5oe8+p7fsP3yrqw=;
        b=AAhscYcfS56nKUCxqfsggacmlpop4BOvkUrhRdlqtOMUawb4lWiN/pIHTAt6uCHB57
         BifmOG6hr5v29kaG6MhcNXmCTOE4AIax8G2yuc/870nVk3CRB24dRcOktClUfVyZ0jmz
         qtNF1yeSRidw/4eVLYFgFbIbUU5l5TgRbhkOyifDmY4bP5+CErdDI9D7Yjp3JuXsBG6L
         UgETRxgb7wysyUVBMKYMEj+QArdshDpujmcKGBK0GA7Pf6lILmfCxF/J8dFmkaES80EG
         KKbYXX7xm9D3TjfVskpkaH39rLfkLMyLmGgGEM6o/av7+Mfp/r9ZRkafvrzqnC0m2c7w
         KxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564768; x=1733169568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQShuah4RPH85LfDxttMiyLaDhN+5oe8+p7fsP3yrqw=;
        b=EtjxzPEajH+LqwuaH4OJmPWTUgOxBBwOsf0MF2ewlI3xALgcvlEq8NmotXx4BTMg+C
         FcqgMh7Fc4UtzYr9unkCfii71ePjZ/ZrkLfflFZolTilI/9co4M3eS096Sw5zt7KyNRB
         0EdS/4mXFKtg8gewMZvV8tFrTG2mb46TGzokipuUswya1lWMnClVJ02hFpsZDFfOMmkT
         EtF7BnXcVuBLQC8i75J9Z6m2cDr3MmeaoQTRcldQ1l4lrg26kEo1bHGt3x4cA8aaNJ0o
         1ouYsQlMDda54PuZsPTlSe/dT4rOzaLHPsz55/7LH1HGqC0+oYio83lBDP2AB4LKrdUT
         6Nsg==
X-Forwarded-Encrypted: i=1; AJvYcCXiUTDjUhyPDaa+HU3suYVHPaH1ClyiOXPtxXZcDZGqTmcVNiTMvtO2RvNL2fFkVkiDVhybcePq9MDtjQ==@linaro.org
X-Gm-Message-State: AOJu0Yw5g3xMSFDZb1/E/BdfTuY2OjvIIMSk7r/PB/MCxBFB/ziStida
	5/mahHRdrCb7lET+CJx9TdqbplLdRVO0Nx9Y4pAbbtkwwSfFLDdna2Ui1KJoNmZdVQ==
X-Gm-Gg: ASbGnctNB5icWzJpoOE/6W9eb/Iz6jR5RWZC5xTjEypuss0CEnlTECTGmFn5MHm9V19
	bGS8U0fb6+73uJ+99NERc8uFMK3oTKjuSohMcozSFqPTWpHV6h5QR2d44PkVT934RoZRNN8ccCP
	jNpoEMrbdhGK3lkrYVOTN8MYgy7Izf5dukVaaKqgGxD0vfJQjtSiJcJ4ueTBNtMp68EnAG9xg5s
	X0Zj3/FyhEdTI4m3ZaKW7cpsbk/7s1ZJtcPaXGOPkeN1bYtTgsMr4TYIZs89mH3TRXx
X-Google-Smtp-Source: AGHT+IHu0epn53EoPbJ5rBYNXd0hSz17fN6MkrV+SiPxv6AdYWmai7LEbVLtwK/yGBV3nNkYp1vi2g==
X-Received: by 2002:a05:6000:1f82:b0:37d:5364:d738 with SMTP id ffacd0b85a97d-38260bcc4cemr12792210f8f.45.1732564768083;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:27 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 06/26] target/arm/kvm-rme: Initialize vCPU
Date: Mon, 25 Nov 2024 19:56:05 +0000
Message-ID: <20241125195626.856992-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /vYmwnrkAhLf

The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
the PC can also be set, and is ignored at runtime. KVM also accepts a
few system register changes during initial configuration, as returned by
KVM_GET_REG_LIST.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h     |  3 +++
 target/arm/kvm_arm.h | 15 +++++++++++
 target/arm/kvm-rme.c | 10 ++++++++
 target/arm/kvm.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280..f617591921 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -961,6 +961,9 @@ struct ArchCPU {
     OnOffAuto kvm_steal_time;
 #endif /* CONFIG_KVM */
 
+    /* Realm Management Extension */
+    bool kvm_rme;
+
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 9d6a89f9b1..8b52a881b0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -245,6 +245,16 @@ int kvm_arm_rme_init(MachineState *ms);
  */
 int kvm_arm_rme_vm_type(MachineState *ms);
 
+/**
+ * kvm_arm_rme_vcpu_init
+ * @cs: the CPU
+ *
+ * If the user requested a Realm, setup the given vCPU accordingly. Realm vCPUs
+ * behave a little differently, for example most of their register state is
+ * hidden from the host.
+ */
+int kvm_arm_rme_vcpu_init(CPUState *cs);
+
 #else
 
 /*
@@ -339,6 +349,11 @@ static inline int kvm_arm_rme_vm_type(MachineState *ms)
     g_assert_not_reached();
 }
 
+static inline int kvm_arm_rme_vcpu_init(CPUState *cs)
+{
+    g_assert_not_reached();
+}
+
 #endif
 
 #endif
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 60d967a842..e3cc37538a 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -137,6 +137,16 @@ int kvm_arm_rme_init(MachineState *ms)
     return 0;
 }
 
+int kvm_arm_rme_vcpu_init(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (rme_guest) {
+        cpu->kvm_rme = true;
+    }
+    return 0;
+}
+
 int kvm_arm_rme_vm_type(MachineState *ms)
 {
     if (rme_guest) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0c80992f7c..a0de2efc41 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1926,6 +1926,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    ret = kvm_arm_rme_vcpu_init(cs);
+    if (ret) {
+        return ret;
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = kvm_arm_sve_set_vls(cpu);
         if (ret) {
@@ -2062,6 +2067,35 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_put_core_regs(CPUState *cs, Error **errp)
+{
+    int i, ret;
+    struct kvm_one_reg reg;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * The RME ABI only allows us to set 8 GPRs and the PC
+     */
+    for (i = 0; i < 8; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    reg.id = AARCH64_CORE_REG(regs.pc);
+    reg.addr = (uintptr_t) &env->pc;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static int kvm_arm_put_core_regs(CPUState *cs, int level, Error **errp)
 {
     uint64_t val;
@@ -2072,6 +2106,10 @@ static int kvm_arm_put_core_regs(CPUState *cs, int level, Error **errp)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+    if (cpu->kvm_rme) {
+        return kvm_arm_rme_put_core_regs(cs, errp);
+    }
+
     /* If we are in AArch32 mode then we need to copy the AArch32 regs to the
      * AArch64 registers before pushing them out to 64-bit KVM.
      */
@@ -2259,6 +2297,25 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_get_core_regs(CPUState *cs, Error **errp)
+{
+    int i, ret;
+    struct kvm_one_reg reg;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < 8; i++) {
+        reg.id = AARCH64_CORE_REG(regs.regs[i]);
+        reg.addr = (uintptr_t) &env->xregs[i];
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
@@ -2269,6 +2326,10 @@ static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+    if (cpu->kvm_rme) {
+        return kvm_arm_rme_get_core_regs(cs, errp);
+    }
+
     for (i = 0; i < 31; i++) {
         ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
                               &env->xregs[i]);
-- 
2.47.0
