Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592397ejj;
        Thu, 23 Nov 2023 10:35:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNRBjJ5Q8meigOC4Tt2M91b3EJTfU+8Gxej0CaQstFX0aJ8AJ6bDmYCEgMNlTo0NvTAFsD
X-Received: by 2002:a17:902:ef82:b0:1c7:29fd:33b6 with SMTP id iz2-20020a170902ef8200b001c729fd33b6mr303475plb.40.1700764547201;
        Thu, 23 Nov 2023 10:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764547; cv=none;
        d=google.com; s=arc-20160816;
        b=jApjviFiWdn84p2N0I1M4VjjB+ZNW5WeSJWEDRIWlPnAu9Hypn+vgjyIXqPUADSuS1
         0DZt0mtp8yoQkYHxImHiFYYNTm5eCLxLmO6qK87IduOIogtalgLaSwBNbKH2BTT2seXe
         X/si6HVltXqw+B7gKRDAxy2aBWDOnOAy/WAx7t9V6PwC+Ekzm0WMF0RmjmLmcH39/tZF
         ypgmyU/L5WlByLEDnKtP9Y3hSQcOKOnwQ02jYXnYTGldWuEDLIaYQ7gUVR4xggNM0kLA
         JE7ioA85ef+jSyGAEbpiz399nDitl2Djz0ql0rTwPCb8d4iG2r+js+tJEPFPQ1Gv33+p
         gkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=LUz0XGe6SRMXqOSVJvQiXoUHGpw35/yPoukvsO1/DGo=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=mPwBAuojlWswROj49Hr/TijnESuYs1oG/EhnrhG5OEz8WUrO6XDYsBVm2mPtGaNrvU
         K3RffTY55R15nGQ3+Irv4vvNfk2+AhSNNdCX2xCE+s3zfI46TEnKjoADVxzb6OFFEumX
         QWaztaAftEtVoorL8ElsuHYnZqLBLnUFTsFNMiJ4hLrw6OTZHvGmSfjl0QHQNzjaB74n
         q8Zs+W/jDnt/UJnOMEUi+GQKUEquk/liCyiWN5em244mDm7tTrU1JbMitac+eDmOlvCE
         a28nByYiiywVdhc+T8JnmQayoLQGJH/fRCTEyScM8Ze32d11fOwYTX7CDSwsvJtpKC/A
         +zbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xeql+3OG;
       spf=pass (google.com: domain of kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id n1-20020a1709026a8100b001cf9e863152si379021plk.642.2023.11.23.10.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:35:47 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xeql+3OG;
       spf=pass (google.com: domain of kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2372-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3797B21664
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B62A4AF74;
	Thu, 23 Nov 2023 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeql+3OG"
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947D1D7E
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:39 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c8879a1570so14777801fa.1
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764538; x=1701369338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUz0XGe6SRMXqOSVJvQiXoUHGpw35/yPoukvsO1/DGo=;
        b=xeql+3OGCWL9t/v0cQ6IvIDYEpA2Jir4JD63qBWyXMIxp6b5zX5HHEydg8vACcK5bu
         /S6yvxapukhTn//OhCo7+ihtHkwL6AaQSDxkdrJK+g3A7FsTAkhOz/uUANoldJU99v35
         T+amRZ9jNbSnNOjVTUbd4HfHaS0W5XqPn+sdzVW2vbcf7z20TfTmnINOwtfJKWDHklyh
         ls5OJd6hJhB+pRPYp+RDZIRRgYWNl3GEPYcFK0vBeJBIQhO0xFivsnoAFLVMBvevJwSl
         C8Em//p2aEoMLOTunRMdKcwRhNUrH7K943PHjednMHsGt5ZbtVaMvbl0XGqplm70V/ag
         9F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764538; x=1701369338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUz0XGe6SRMXqOSVJvQiXoUHGpw35/yPoukvsO1/DGo=;
        b=AIijd5NESVI4+oJbaNnaZfrwIZHyqEFWJfWLL0E/pEotJwb7GLM9EKGEzrBkaLdqZL
         DfiiUMDeHNgXWUWJ9IPQf+w92lHQ9coqE2HWSjH+rdt/sjaeW37Rw6jocdxZiKn4kHlm
         0eien7AuEiPY5QU+6Me9UgEd7/WdRH7etT5okSOfiNif7L1uGlbGdUDzD/RRMa9Gft+B
         NvCl7AagdLVb3ZA/DnKbJJSPYWC3Q3X/rKvf7egCH1AS1sNFuRxWTWKmkjlu/Vg/wJ/K
         Qkwgx/bLksLYBOgDHsY5RG1rTD2l7xjxEQHCiaJS+C56UJldC0OqsGXKXvjMSGZ1LNOm
         njmA==
X-Gm-Message-State: AOJu0Yzr89zvCAd8jnUI9Gg8zD8Atil2KXeC4Vn+l2ba4qaB74Ng4Lk6
	B1YiZo495X7NtaTWgwqv/+ewDpTRAc4/nHXg4aw=
X-Received: by 2002:a2e:b00e:0:b0:2c5:70f:614a with SMTP id y14-20020a2eb00e000000b002c5070f614amr155623ljk.17.1700764537845;
        Thu, 23 Nov 2023 10:35:37 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d6847000000b0032dab20e773sm2268980wrw.69.2023.11.23.10.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 03/16] target/arm/kvm: Have kvm_arm_add_vcpu_properties take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:04 +0100
Message-ID: <20231123183518.64569-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PZG7LFSEIJDR

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 4 ++--
 target/arm/cpu.c     | 2 +-
 target/arm/kvm.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 50967f4ae9..6fb8a5f67e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -153,7 +153,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
  * Add all KVM specific CPU properties to the CPU object. These
  * are the CPU properties with "kvm-" prefixed names.
  */
-void kvm_arm_add_vcpu_properties(Object *obj);
+void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
 
 /**
  * kvm_arm_steal_time_finalize:
@@ -243,7 +243,7 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     g_assert_not_reached();
 }
 
-static inline void kvm_arm_add_vcpu_properties(Object *obj)
+static inline void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 25e9d2ae7b..97081e0c70 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1686,7 +1686,7 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (kvm_enabled()) {
-        kvm_arm_add_vcpu_properties(obj);
+        kvm_arm_add_vcpu_properties(cpu);
     }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6e3fea1879..03195f5627 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -495,10 +495,10 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
 }
 
 /* KVM VCPU properties should be prefixed with "kvm-". */
-void kvm_arm_add_vcpu_properties(Object *obj)
+void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
     CPUARMState *env = &cpu->env;
+    Object *obj = OBJECT(cpu);
 
     if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
         cpu->kvm_adjvtime = true;
-- 
2.41.0

