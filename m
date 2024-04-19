Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497977ejd;
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnfIC6iLoCWEyN1bq4jCfY+sTxotXL6F7x1wt1KVHAi6Up/+uL+03JAaOXce/u9BzGTU5BlHus7NFkk1xp2HyFiH8+FIiA
X-Received: by 2002:a05:6000:d4a:b0:348:ece3:b243 with SMTP id du10-20020a0560000d4a00b00348ece3b243mr1712111wrb.23.1713542393261;
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542393; cv=none;
        d=google.com; s=arc-20160816;
        b=VqJYdKvPiKFbz/56eYWv89MN7lE49R+CvClfSO5jo2W4BgQX+8DkJgxYL4skndfKMj
         NOMCUZ15yRWRiI5n+WEMRDrDxqSlLi/0BmwqjhUsekEq8q5OQE/W7Lxe2VaP8W2hF31U
         Ae9KTqMjtPnerkwyhD+Wp7jzn4IaB/8H87EicgaV5kZA0r0HDwwGO+wsMg8BBIsbVT50
         m3ducGVlAaACPN1BHPuWMTIyhpdwUo7FU7xiH7quADLtEFn0kCfZcU43X91aTOC2pCff
         /BLsqBoSlgkZ70Nyk3QetT2igWBTQmsOFXB35QF6vJKdUk8W398BVp+5nVU1zOeeekVd
         ufgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7l7h8u/bxo15dj8FUkHA8n7B20eh8IiyRKSK0v2thnY=;
        fh=J23nRhCpbKPulU2NDdNuvG7ceeoXDRPgEXLatlZWC+k=;
        b=FlhDSvU77cfbKgYzTAqXysnKZhfWdW9ZuGAlzMv02tjCexAmNECz5gwOzzs+KUGkNG
         13LGqdj4RbecAqC4bUCLA4Df82QW5bzeyF7aC9vqCEjpqkDnVlBW49fv5A6v2XaY9785
         Zg3rY+E1fPlre8c0vJO08aIF4xk2vbRiW7CnLPN0xJ1iPtIHh/zJw7A7EM+jqZNAZYyo
         PqPH1TBEr5rPPPuKj7qi60VTVE7YtvObcoHYMVIpBzXxgrrLOlS40sF1Rw7nURY/9KzF
         bJKWcmewh3NhgNow/Sc1i3JyZ1FCB9mD0pjS0wzI16W5/PSiNWI9KNRPx9aXjOSiid2h
         eKVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzybUTkY;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p18-20020a7bcc92000000b0041403ed09e7sor1317849wma.13.2024.04.19.08.59.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzybUTkY;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542393; x=1714147193; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l7h8u/bxo15dj8FUkHA8n7B20eh8IiyRKSK0v2thnY=;
        b=TzybUTkYlTkXrwxZfzcz8hWAva1oDN/z/jwVBiC5i0dyC6w1mEYVoo8XvRw4lnlo1F
         HRXO8LKNazaqOAKxG/MYAqQpy5OIEEjAKRskqyMOG0RZIuGUuMJrgIyRhCZuROiND7Pm
         MQCzshi4KRhXrjCAeD9dcCZkQ/lQcYDenCvo247WHH22/RNV3Sl25zbtqH/9e5osSj1t
         bubuCrlybDGAyOWunPW5lmCev86EDVhsksMphApwdoniwVMSPNisRQxsf+a0NwFqsq/Q
         0HPaBCaM0B80mMASf+K4knbiOgtV2SdGg3tsDxfSW8OqbBfQqR1hMxj9CRsEMRC8JXtd
         jq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542393; x=1714147193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l7h8u/bxo15dj8FUkHA8n7B20eh8IiyRKSK0v2thnY=;
        b=Ic85KZCYDvlVwLbFOr3qhSkpvlT5PvsQnFmntl1cYImrTa/oSGkH4cimYs5Vgc08ll
         Me1FffUh+1uEhgA4wugpj1RcVXGtc3TK8e3EkU+92SQzLKKszfrWEKyHe/MS7x4qnHL1
         mJDnh/U6KeGBAdPLNHp2OP+pqd65eI6I6hnKbNvJRrkVefYwO49qkEEfcvmjLfvDvmda
         PkayQ2LUCl+scJbn+RbeSRpYaLdYUYVTUZUqiLlc81oETgSvyffMO6UOJFFk1mfgMyzy
         VxR/7/l9Gdg5mUkTKWP7UJzEvsoL+xhW8ya1WY0eH3RqsP9gKTDSTpuvnmc0pAZwGrEL
         LS0g==
X-Forwarded-Encrypted: i=1; AJvYcCVf8wmqterknoIBmSsWt4VY8xh5Rx1WUbucz+q+pONdiEir7dv5jB2BxgoE/Nd6Z21IEmOFTRAlaavpU7CByM+c8ROkJRO6
X-Gm-Message-State: AOJu0Yyzarv3X4/c1t2GK+wHNA5Ttkxe/aDQkTWPaUorXvobFXGTxntr
	Yq8ASyL8MkrF6RCr2fAnmS4sp9280dkd+Kagm/HlhlhRgZ/l1XQjrPnqAU8ziCKGjg==
X-Google-Smtp-Source: AGHT+IF860s44i+iY0UVmGVcOh/CDrs78uYJvS8fck2EA3pOZTiNLQ3UAvR3r73qt0LuoujRtxz5RA==
X-Received: by 2002:a05:6000:4022:b0:34a:5d59:5501 with SMTP id cp34-20020a056000402200b0034a5d595501mr2062192wrb.4.1713542392891;
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 09/22] target/arm/kvm-rme: Initialize vCPU
Date: Fri, 19 Apr 2024 16:56:57 +0100
Message-ID: <20240419155709.318866-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7joa71GWwnyt

The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
the PC can also be set, and is ignored at runtime. KVM also accepts a
few system register changes during initial configuration, as returned by
KVM_GET_REG_LIST.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: only do the GP regs, since they are sync'd explicitly. Other
  registers use the existing reglist facility.
---
 target/arm/cpu.h     |  3 +++
 target/arm/kvm_arm.h |  1 +
 target/arm/kvm-rme.c | 10 ++++++++
 target/arm/kvm.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bc0c84873f..d3ff1b4a31 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -945,6 +945,9 @@ struct ArchCPU {
     OnOffAuto kvm_steal_time;
 #endif /* CONFIG_KVM */
 
+    /* Realm Management Extension */
+    bool kvm_rme;
+
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8e2d90c265..47777386b0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -220,6 +220,7 @@ int kvm_arm_rme_init(MachineState *ms);
 int kvm_arm_rme_vm_type(MachineState *ms);
 
 bool kvm_arm_rme_enabled(void);
+int kvm_arm_rme_vcpu_init(CPUState *cs);
 
 #else
 
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 23ac2d32d4..aa9c3b5551 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -106,6 +106,16 @@ int kvm_arm_rme_init(MachineState *ms)
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
index 3504276822..3a2233ec73 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1920,6 +1920,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
@@ -2056,6 +2061,35 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_put_core_regs(CPUState *cs)
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
 static int kvm_arm_put_core_regs(CPUState *cs, int level)
 {
     uint64_t val;
@@ -2066,6 +2100,10 @@ static int kvm_arm_put_core_regs(CPUState *cs, int level)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+    if (cpu->kvm_rme) {
+        return kvm_arm_rme_put_core_regs(cs);
+    }
+
     /* If we are in AArch32 mode then we need to copy the AArch32 regs to the
      * AArch64 registers before pushing them out to 64-bit KVM.
      */
@@ -2253,6 +2291,25 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
+static int kvm_arm_rme_get_core_regs(CPUState *cs)
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
 static int kvm_arm_get_core_regs(CPUState *cs)
 {
     uint64_t val;
@@ -2263,6 +2320,10 @@ static int kvm_arm_get_core_regs(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+    if (cpu->kvm_rme) {
+        return kvm_arm_rme_get_core_regs(cs);
+    }
+
     for (i = 0; i < 31; i++) {
         ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
                               &env->xregs[i]);
-- 
2.44.0
