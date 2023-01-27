Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232500ejc;
        Fri, 27 Jan 2023 07:16:00 -0800 (PST)
X-Received: by 2002:a7b:cb88:0:b0:3d9:f801:73bf with SMTP id m8-20020a7bcb88000000b003d9f80173bfmr39232539wmi.12.1674832560274;
        Fri, 27 Jan 2023 07:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832560; cv=none;
        d=google.com; s=arc-20160816;
        b=x8S7x0LTOf+9c2uRJMaTuZzTg6Kb7mxxA0gl1NLGJrHH15e656k8v+s2PofGz/ASj6
         P/oiB398CzvsitRJ887TFGm7MdhiT84GwGhhJEyqck2vvvVNm62YAU9tUcoZl7mdb3Hv
         f1dpN+sMDjBxL1G33LNQDSp0gpCwzfi5bZVyI7aqRTx2Yz2mp8JlKDoZvEcFnjQjxv5E
         X3ApfC1Ld179xsZkZXfb5IZJ6c3dmop8n4iFIq7f0psmVOxgHoq31+n6puzYmaQWzupZ
         WWoFfw/1DW8HI47Mf0tZIyaCs0JJfYKPIfzF2NxJijcroAHeJsFtzFVYrQqbOFuVzkZI
         7vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EkDTo9H45EkE/zEGKHtV2OQbE8kpvF6cvdXdghq8wmc=;
        b=a7kgCaq9hsafBgwNCH0OBgsFhUBacki+bIqAOsqPxLM+24PYsD8jDtmBpYmQHeBxJB
         5Q5Tut5H97g/Ldqx5M1cwTmyXZcCSuQuYs5XtPK4u76BIfCVInG5oGwZkv4KbfyAedlV
         GTKm5Sa3e7p/SByqwYIfLI+XaeiqywoPmI1wizm76jbszvxf9At0JUzjHYW0jyHBAOJe
         1fO5/skiFu8MjlcIUMKFSGxdwd1XSDGipfXUOzp35x/lvZvo7stW6yNIcOQdVA07oDCn
         h/DfutflAFJgBFzY7V3GB2twAIowwB0s9iyI76JtvbnGQ2w8vC6sruGsm7uZIoZ70Xxp
         JhIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWULx+A5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q1-20020a7bce81000000b003dc0b74ff51sor1638715wmj.20.2023.01.27.07.16.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWULx+A5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkDTo9H45EkE/zEGKHtV2OQbE8kpvF6cvdXdghq8wmc=;
        b=AWULx+A5moZZHjX8vWgLG6/vAvORIoPn4ngk0GqgF6O9FD5pP0CBhLp7t1TPo89RS6
         YpvfBcViJjipEe8K8EbJbm0PG4IU8GuXn/57BCx3mTfle77khlq17bXKjRwg+6Xxem9x
         KQ8WlHElNlF7s9t66GH7jPQtob2cG+8QLU12CwVGOqjf4WDeJdiZYsfs6HTaVGMj/QoY
         +96FwmPsFknadXJXPefvyfDsQuOBmT70obTHDYzPER9ShO1jSbdE+CldG2Nr0+yvxdgL
         6SiO8+CYiKMsg5eL2xW/mmbdjfQGCCpgW4rfIXyXMFe9y5Ct7lRHUNCcbD745N6aIUEF
         o+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkDTo9H45EkE/zEGKHtV2OQbE8kpvF6cvdXdghq8wmc=;
        b=WlUBEdWjmD5Y372pVrlSnGCc7H4UkDc9TEJ1CNvT3RMCLN4xkCtHkuwLQOAdhcppN8
         Fhtd3ohEVBFbk5H25ae8MM2bJgYGuKDycZQI0ppNY1jcMyWIn5zHUTCHznNDAQit20r6
         xcIXMBmDY0kf/O779dN24FXC6pl3VgPq8Ujx+/LizfzYinBtGSn9aXqpiafvaqdE2Bpj
         XvDfTmmOLFIm0WzCcq5Oq05vuoYS2Q/Dgm/b+tDE0itTrFPhsE4vgAVO0Xf8XeuPTDy6
         YZ2UrMS1utZsWyF8RR7+lfE2S/bX3aJRKY2hf7XGXieWVcQaGe1SPdvRw8DLABrb1Xa3
         YifA==
X-Gm-Message-State: AFqh2krRsbmpYvMpGMw69gDzbU4ecDRVzTlq/bzEMLFhiS9WhIm+xiZQ
	i+iJy334aTSTj0m6q/PFpnCs8hlCbdQa2UMclIvc2YhC
X-Google-Smtp-Source: AMrXdXuMpq4rynySX5uXo7SHUNT7onAQa8XisQTwXFy1C1rAWz1KY7cjILStBYd4otmaPbgHS0LHwQ==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id n3-20020a05600c4f8300b003db0eaba600mr36209817wmq.7.1674832560032;
        Fri, 27 Jan 2023 07:16:00 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 05/16] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Fri, 27 Jan 2023 15:07:18 +0000
Message-Id: <20230127150727.612594-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n3CRACZgaIjF

The confidential guest support in KVM limits the number of registers
that we can read and write. Split the get/put_registers function to
prepare for it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm64.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..55191496f3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1080,7 +1080,7 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, int level)
+static int kvm_arm_put_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
     uint64_t val;
@@ -1200,6 +1200,19 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
+    ret = kvm_arm_put_core_regs(cs);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -1293,7 +1306,7 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs)
+static int kvm_arm_get_core_regs(CPUState *cs)
 {
     struct kvm_one_reg reg;
     uint64_t val;
@@ -1413,6 +1426,19 @@ int kvm_arch_get_registers(CPUState *cs)
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
2.39.0
