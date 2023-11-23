Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592860ejj;
        Thu, 23 Nov 2023 10:36:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzimIIL2w5kG+sfNt4v6oNvEdKTrOeZDmAttR0mG4uwhGsFNcSFY3Ru4HhIbqdMyDp0lZG
X-Received: by 2002:a05:6a21:980d:b0:18b:426a:725b with SMTP id ue13-20020a056a21980d00b0018b426a725bmr337948pzb.57.1700764593742;
        Thu, 23 Nov 2023 10:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764593; cv=none;
        d=google.com; s=arc-20160816;
        b=Mr47BJMk+yuKpZOm8IyRNr/gYhuQPZQVegofIPiwrZr7vtejl6VNUwMMg6xFMnzlk4
         OdybizlX5IsFdNa1JBPK7L+L/cRikYDYYAjdvYwr8W46z6m/r2bAh4o8U1NePp5AIM9L
         +Cu3mfsU7O3w6bK8yM6dsYLFrl5bJMqmyZj8i+3EefuKl2L/5EjsAglA9Zbu28hVDTyS
         MrsvGGi4QfxWBMoOKpA533TMOernnTFMWXggkH+qxA772qaqSbanIS/Y5Nz7jzUMXb8c
         pgqvGXXgfydA8XqsCx//YXtc2jZLh7Q+40R+rw6fAwVTDHo3+zJ7Nm6mT1SAlQ4VSB5o
         /s+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=h+SHiNudBaJoVQ05FaR4tXQE9WbV9fq8fmbm8eyNxHM=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=vJ1CUNM2eXVK9cVN99DehOK47Dk1wvPUoDbbpIhVT2vft1MV3h1TDoJJSVM12q6qFc
         pRtWQaxOtpG02zhu0W0qZfpak5we0CckrU3pEmhBkshYmlJXe4dl7uA1pLfv5sBS1IzI
         IqD9VCN9IXQeDJSq8/h+OCDtNeEEV6G1xr3/EGx2Bdz9WzVBjA/qx3G/ODu25H3Clr5o
         ClQu/MuLewRqzhLP8NJQevdCMOEQYfTzFfayQWZbqgmWswsGQxwHitXM0Lxcq0Hno66e
         Xh9CqvTAUQZeYkc6SuzGwoaW3dKf9R/bs6pgA9p8WJGc6TJe4ixOWYYaDs3eBc9Eb2lr
         dT1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2tNxw7E;
       spf=pass (google.com: domain of kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id e7-20020a63e007000000b005c1b316d768si1698636pgh.664.2023.11.23.10.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2tNxw7E;
       spf=pass (google.com: domain of kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2380-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94339B21701
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA474CDFA;
	Thu, 23 Nov 2023 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2tNxw7E"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BD9D7E
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:23 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso685821f8f.1
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764582; x=1701369382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+SHiNudBaJoVQ05FaR4tXQE9WbV9fq8fmbm8eyNxHM=;
        b=l2tNxw7E2Ci0yc0E2BlGhCDFTMISd7lV5r8Pfvvt227jvsvFHSDj0jML5xZ3ONKqmK
         EPMM3wtvfQFhKn+gB56UXl0jODeTmy9bQkNsbZEgzwW6BJ3Qd1isqazyutDcvb3Ypf08
         /ZnSRbrw8a01JiCqHygwxfyaUUct0D5n+GzKaoxVjivrBvl051g7iHCxOOLHBZ+Sf2Aq
         EpGGAgZIIGY3eZ4nRD/O9gx3tfkiSVl1LlsXCWpGhGr8A+ixE1tFNXSqepRdnNZKIhMb
         2d7nce0dSgZ+LfZjOAgYh/aWYI/IbNnp0Y++wUvxne/R3GC84U8puepojFllF5jZBkJO
         K3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764582; x=1701369382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+SHiNudBaJoVQ05FaR4tXQE9WbV9fq8fmbm8eyNxHM=;
        b=H8gKLwN5I1m3KUDBhDT1t2hUqhF4dxC3LrrVVb9v4R+5/o0vdCcg/Ue86kKlefHyNG
         zbyO2CHi02sPU1+RCobY+6k8K6tR0cAkMAXlm/yhInQbFEXIDtgwkecAbNzub0FxLFDw
         ashe32hZ6BQI/bYov2XT2xcreSJvKiGvhvaFGYIi+wjYjkWegT+zWdFY0SsIrq9RUocF
         /NhvpNO+kvb5ZIEa8mKIGNhFz8qIJDp9REqZR5c/yUA/Q0gTyDvvi2Yc3gwT8bd298Ud
         uergOu6cPil8ThzaMxCsyn71nGXcPjHMJryQl7Y1VaFX8yYb69kqTRkfd4X02En/tgr0
         3BTg==
X-Gm-Message-State: AOJu0YyC+PyliZAiGhzmzo6Y80jCYpvlGBvfYXQKMrWLwEbLRlbM0hI9
	hvYniA+lZ/6a8JJG5Ys4lwTG9LkOzxgj38Ij/nU=
X-Received: by 2002:a05:6000:1ccd:b0:32d:c792:fcaf with SMTP id bf13-20020a0560001ccd00b0032dc792fcafmr2898941wrb.26.1700764581996;
        Thu, 23 Nov 2023 10:36:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id d1-20020adfe881000000b00332c4055faesm2259393wrm.87.2023.11.23.10.36.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 11/16] target/arm/kvm: Have kvm_arm_vcpu_finalize take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:12 +0100
Message-ID: <20231123183518.64569-12-philmd@linaro.org>
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
X-TUID: vg528CHtiFMo

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 854e423135..dba2c9c6a9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -80,7 +80,7 @@ static int kvm_arm_vcpu_init(ARMCPU *cpu)
 
 /**
  * kvm_arm_vcpu_finalize:
- * @cs: CPUState
+ * @cpu: ARMCPU
  * @feature: feature to finalize
  *
  * Finalizes the configuration of the specified VCPU feature by
@@ -90,9 +90,9 @@ static int kvm_arm_vcpu_init(ARMCPU *cpu)
  *
  * Returns: 0 if success else < 0 error code
  */
-static int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
 {
-    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_FINALIZE, &feature);
 }
 
 bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
@@ -1923,7 +1923,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         if (ret) {
             return ret;
         }
-        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        ret = kvm_arm_vcpu_finalize(cpu, KVM_ARM_VCPU_SVE);
         if (ret) {
             return ret;
         }
-- 
2.41.0

