Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497969ejd;
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdYSBKRJzAmeOp21AkGwIm4dI2fGFR8JO8e/2CcXqZSAgo81elNqG1c/jdgp6ZQvlOLJi4cNxqwtrvcdCO2Ag5AmGHI3gv
X-Received: by 2002:a05:600c:3504:b0:418:9d5a:f680 with SMTP id h4-20020a05600c350400b004189d5af680mr1887089wmq.25.1713542392803;
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542392; cv=none;
        d=google.com; s=arc-20160816;
        b=oXC3TnRSQqMGIn936gREd5vNcnjYKH4a6NDT+jkoDWlOky2rWiHBPRz73FiOgrEdWV
         40swX+3TKKW7MsbxqO1fRNNqLzAKYdTvipoxqNFmGep/ltq3oLj+h5jUhiMsc/6IkaIn
         MvdPgqy+PVbae1vQLlVm8h98tUipvIx4alSFrCiWRtlEdjKs3DavaUSI83R3X2Z3IdtW
         iUtdRtOTa//Oa6plinY2cUflSeEhmUETci2/Gw49ysXJ7urOvimncVc3jkxER9Krf/ml
         i4D2udzZQoPKyUWXfCTz2MMXb78FjdVjF9r2yYCBLnWe/UaeoBUnkqO7hIfWoC+KHWLy
         36Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EQHElS3YY06JrxJsFkVRbTnlkqXQPEN2MqSOomU202A=;
        fh=8/QyFgW2S4jcRDEi1PLqbQxgd2rrDCY5edxwpHTLGgo=;
        b=PGWQmpQ0da7mXaPaXlW32m5FOA9r/LPXdbd/pub5XD7fyWkK4aHpNehD9fkXWYeRAC
         2uPgOpZnE/KVYUt+2ig2GOWt6vMVmCqpeLN+6+f1tuNZXp4y4eHAMmpJasMza5hC1ELV
         GX3BIYjKDCyYuYn0yjoSy5PLx+W6LbXyPZvQMGyHs1QV3Pm3/FZT4Iw/EOhNokIwxwU/
         1Pp7g6YPCUdEGyvdQTbKASrhzyuTC++DWQOqHu2UxOL+lwwftHQdSunKCz73p1rKn/8z
         EQth/xJrJdTY9TzByArdtEHa/uhF3BUv7id7Ww+tr7tT71dkUrDd0aLIeQFjioGeOzHd
         64/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TgLUPv/X";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g16-20020adfa490000000b00341b9dc4f4bsor1248313wrb.1.2024.04.19.08.59.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TgLUPv/X";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542392; x=1714147192; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQHElS3YY06JrxJsFkVRbTnlkqXQPEN2MqSOomU202A=;
        b=TgLUPv/X/udHzDdZJI6BPF9LIVHFRxny6j/gcgpbDNWuMeO/g7/O4kz6OrgqOAHCCX
         Apqw/nVe/rCNwGvpnBUCW0YrLWZpqOzib4gnOptqS6nMdkGiTaGtnbNu8OOGg1JaLtdQ
         UQ89wnYpMoXwNzEnxx+WmkA5qLVQ+lcI5Zmagizggktd1XfnqxnG1LQ/QELf3VTC8cJJ
         aJzQD3SgbZXlXxSO6rccDu2fYzgUuCSlZ11VjWsmVPGbd9mhddbqyrrXBwaKQWOLvu1f
         ZF9jDpSklOUwp/cUTtzvyZlQnfzEoJ5BAYdWLIouloceGCP0vcao/h3+VrHd6pj+ZLSC
         f1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542392; x=1714147192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQHElS3YY06JrxJsFkVRbTnlkqXQPEN2MqSOomU202A=;
        b=iaX5hMmyXiu+1Rfud6tiWQ/c8yDlu+Swwh8YT5KQNMfTPCNj7WZaeJhZjgugVg3O/f
         0UbO+WwJqcTRS9U88iLBu3TKjp9VQVStfNWUtT7WqVIOgzh8WOq648lJpe3vd1IIJyhf
         VxjuXuEJTrvlpFkY+ndPWMEE0/3RYuzgBO3RZILGRhZq+cQKYvX3RoWb5qxWFOI1Z05M
         +mQzSTHfHv8Hh9XBeDb7y0V0SLFR6rnxqO3FF/rRwx/oDDs2I+jr7HUSebWsJbDpquBg
         1wWQuGPn430B8h53MG6MGccZRBHdhoCuqFo7CUPvaYLoU2/3YvSl22H+D2fO9eQjC+b1
         tUww==
X-Forwarded-Encrypted: i=1; AJvYcCVpEXg9seTZyuYsxcyAc+P/5tSaQ6u918OzZ6lVkYZLoaXBYIgpcjUOt9Pj8Xj59QkuyUWcNL2J0odTTDizk6M+GkW62lUa
X-Gm-Message-State: AOJu0YxLotdUh65Za3+aq+5O7S5M64NY6WexbH3eQ3wulRrmLqPUzyyo
	XH3J0pt3qWfOKvKUzfpcnPFxLzSFH/EvQZaIEEDTPtffa86HnAklXrgtzxJMhro38Q==
X-Google-Smtp-Source: AGHT+IHmfre/WtSkx5TiRXN2ShYLuSNHji6jc90xBDmEWEXfCMjkEhDoIkS0aPXwd0+4HswaKGSxuA==
X-Received: by 2002:adf:e4c6:0:b0:34a:6f8b:1237 with SMTP id v6-20020adfe4c6000000b0034a6f8b1237mr1184972wrm.41.1713542392299;
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.51
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
Subject: [PATCH v2 08/22] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Fri, 19 Apr 2024 16:56:56 +0100
Message-ID: <20240419155709.318866-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0c73Z9FFVkD2

The confidential guest support in KVM limits the number of registers
that we can read and write. Split the get/put_registers function to
prepare for it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b00077c1a5..3504276822 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2056,7 +2056,7 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, int level)
+static int kvm_arm_put_core_regs(CPUState *cs, int level)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2159,6 +2159,19 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_put_core_regs(cs, level);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -2240,7 +2253,7 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs)
+static int kvm_arm_get_core_regs(CPUState *cs)
 {
     uint64_t val;
     unsigned int el;
@@ -2343,6 +2356,19 @@ int kvm_arch_get_registers(CPUState *cs)
     }
     vfp_set_fpcr(env, fpr);
 
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_get_core_regs(cs);
+    if (ret) {
+        return ret;
+    }
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.44.0
