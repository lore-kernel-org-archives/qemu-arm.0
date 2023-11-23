Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592780ejj;
        Thu, 23 Nov 2023 10:36:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU65IiSfqXfAqO+M/csKkmfe/oMD5IGPfQyOKt+vPubAJ1YlxdOb/qYefldHxqE15dEP1p
X-Received: by 2002:ac8:5996:0:b0:423:74f7:c286 with SMTP id e22-20020ac85996000000b0042374f7c286mr273302qte.36.1700764585520;
        Thu, 23 Nov 2023 10:36:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764585; cv=none;
        d=google.com; s=arc-20160816;
        b=RRwW1Py8gQYNNc4wqAk5QBL1WrnN4TKbQYTCMI8SSMSecL8Dvxm0ui2G98kDyHMXEp
         eQBndDQiY6N2IPJ4nh4majU52ZBEa30znEvIvC0bmkYQMXYq94Rd40yYf6CMfglcBs22
         EDsjHjeSFm4DyB4hzc/cHoznd1Dl4YoHNGuoRfPi26JGFM3w/vw1wlnZUsFXLjiJARUl
         I9BJe4DvSx2X3eo2Z6J45GVkjCpD6zBmiS4mcA5wJ5TessRw3AeH85hwY9KO0VshofsP
         PAKk/S++56NwHZybXG6SJ1uqpIg21a94H9Xz4DLWpCCYfCfrhi9LnebMSr/kJWHcUr3J
         AHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=l8RzLhxd8bqvmSn68iMRFd2gB17HmY4vJB225vFPDs0=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=dlsrLmsNaMRkSXYGnoY1oOsTOaby82FsRk1tw3Q82AKckJ5O45hTgkjn4oKtj2goph
         2avkIQ38FxWchWZF9u8z32goKLzzCEtlFS72oOwhx26P0BtZM91naCmwfwmvjrxJiWit
         JHeYFXk+Yl4b0u0R4+sesqxEVFtUvg+/G6YP+uhO3zOaIqwh1XY/Ecg+yFDxThsz8n7V
         EmnZbzIE7pkCU5BdYQT3Y23WzTWl986ydbMfuhr4m+6iXgzmloT8CF0p+JIvl2n98SC8
         DAzu7WLma3DSBXqRIAomO3opltEKjB0FEri0kIxHSOS0CTQ4x5fMTUhKthmkVsrMpT1p
         Zwpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exiDkDFU;
       spf=pass (google.com: domain of kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id h14-20020ac85e0e000000b00421b4dedaf6si1581375qtx.296.2023.11.23.10.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:25 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exiDkDFU;
       spf=pass (google.com: domain of kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2379-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 307FB1C21044
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9284C3AC;
	Thu, 23 Nov 2023 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exiDkDFU"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7094DD7E
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:17 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so768778f8f.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764576; x=1701369376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8RzLhxd8bqvmSn68iMRFd2gB17HmY4vJB225vFPDs0=;
        b=exiDkDFUpWR0vV47oW3+xlrNrSJwKxsNMU2CvEdolynoqhJT6Qv6ICvKt8pvfq0+nM
         6ik8Qw7j5BhYHk+Ri38hHoH8jMTCZIztoYz8+3hMbHTQ4JdQ9eQXNRhQIA6DQFjFY6yO
         ridREy2E0nEADjpxmVmwn/l3kxmT5uWwNvYUUKhLZLY7mhDqjY5GOAowx/8NxsAAP13Z
         IkTYAw3A6TFH4enLIOh2whITseFGW81/cvbxH2WIYyU+x8625rk0Hqx0hXUkssHwOien
         N+/jCVa8e+KUD5bT2HeDYA8TNZY3tbgDj/0iWBVoLEMSFyjcaC8qfPNYI1yYbRSkdi50
         Lazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764576; x=1701369376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8RzLhxd8bqvmSn68iMRFd2gB17HmY4vJB225vFPDs0=;
        b=T2vp9T7nOYA1VL161/5DH6B12zOnuTeZPA61L7QVBqG1B7UDNBPlorApU+kITxsfnn
         4UFuTo8O0yu5jKUB/2DNKudQQPsEbGeeKOZaIv+O5rfAp2dE6unUzOQILyNKasbLC2du
         1Z6Rqcr/9litGNFrRrjdCB5yVFI9vZbkly1AUh8Q/uTUQVPhXlO/WJqqZtrkt5w3So2p
         BFsLgL1tiYPjdgY4Mw/fIyih4KcAkZMCLV/qKF6jfsr+xH/tPqEHRG282enqlmiTWV0w
         RjQkWpRViW6Rapx+xPy+LMLaql2XdYRgBzDzw4KwC/N+8SCjWbZI6wUXEj7U4sMs4vhu
         NiyQ==
X-Gm-Message-State: AOJu0YxgYxr786n5V7mXgs7m/et4Dm9+UKDoa8E1xPu98/879WmN1SNi
	8u6mg9afDtbARjrzJfhN7A7u1g==
X-Received: by 2002:adf:e692:0:b0:332:e4fd:3263 with SMTP id r18-20020adfe692000000b00332e4fd3263mr195947wrm.62.1700764575984;
        Thu, 23 Nov 2023 10:36:15 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id df2-20020a5d5b82000000b003317796e0e3sm2280492wrb.65.2023.11.23.10.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 10/16] target/arm/kvm: Have kvm_arm_vcpu_init take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:11 +0100
Message-ID: <20231123183518.64569-11-philmd@linaro.org>
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
X-TUID: 7WqES0O/gDdc

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f17e706e48..854e423135 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -60,7 +60,7 @@ static ARMHostCPUFeatures arm_host_cpu_features;
 
 /**
  * kvm_arm_vcpu_init:
- * @cs: CPUState
+ * @cpu: ARMCPU
  *
  * Initialize (or reinitialize) the VCPU by invoking the
  * KVM_ARM_VCPU_INIT ioctl with the CPU type and feature
@@ -68,15 +68,14 @@ static ARMHostCPUFeatures arm_host_cpu_features;
  *
  * Returns: 0 if success else < 0 error code
  */
-static int kvm_arm_vcpu_init(CPUState *cs)
+static int kvm_arm_vcpu_init(ARMCPU *cpu)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_vcpu_init init;
 
     init.target = cpu->kvm_target;
     memcpy(init.features, cpu->kvm_init_features, sizeof(init.features));
 
-    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_INIT, &init);
 }
 
 /**
@@ -984,7 +983,7 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
      */
-    ret = kvm_arm_vcpu_init(CPU(cpu));
+    ret = kvm_arm_vcpu_init(cpu);
     if (ret < 0) {
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
@@ -1914,7 +1913,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
-    ret = kvm_arm_vcpu_init(cs);
+    ret = kvm_arm_vcpu_init(cpu);
     if (ret) {
         return ret;
     }
-- 
2.41.0

