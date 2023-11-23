Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592492ejj;
        Thu, 23 Nov 2023 10:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9KMQEnJBZNqRVJW6kRf5+cHWz3sdjefUpVvQ+EVrGa2qTo5gmElgJdaF4Lj+Kklse0OSr
X-Received: by 2002:a05:6a20:7d96:b0:18b:d207:d857 with SMTP id v22-20020a056a207d9600b0018bd207d857mr545461pzj.11.1700764558839;
        Thu, 23 Nov 2023 10:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764558; cv=none;
        d=google.com; s=arc-20160816;
        b=PRYkeTJUw3WHPxZVVPlGFwRRnOwsxVoTPaEoIwQDPOc+E+uSk8HUi1wsXnt2bbDz1X
         6ba8QOZpUp+jN8YJIx9WVlYJrGhVKJQAlv+aNdnex0Oo3pBoNHEaJ8jmiZ6O1IuPjpMk
         xD56OvIQz2nYv/CFQsWd0ljkK5wo6pvuUfpf9MLmSpqG/pHmUAOpWqGYx7OrPqGB0tuI
         +LXhX1qKtEGV5+YDkFevVXiA1znVMHIedcz2Lt6+4RSwi5hZ3FyQ0kAeax9MtgvizGRS
         y1Sb8Nt2wOW/OZFO4Z17TnIevBZjas60QLYyhY8OE+QFlKe2ZGeCwfoAVrzdaJf1EKc+
         xuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=BbxwUSVkjdWQxr0WbjMFM/ALqAenG4WEeRbrPnMTydM=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=Vm2LMEq0K+Gy9yXAGgkasugXK/78/YCYQ1Xe3alXbxlu6s5V8Tsn7b+Xwdrbuo3ULG
         MFmkvQjOhowAwQgiAZ7W/vrKe7Y4qEGGjuS9QqEWL2ZW92P433fbeIaohOM/+yc7yEMu
         z4MwQuyg+VwbK/3JEhN135jOheCAIqfR8c8Sp1fEjzgZWdoIfEddslLkEfzeTHP6og/d
         si285E4b4ntz3BL/iukWcVrfmvZb5JdYNZs6jpNjd0MbPhvxNlthZvTIYDVsR/4CWa89
         ZsMMPycjezljzG190LFCdZe1W0SBD0cXhwseGx7+QLhoSyZY5A/wpd+Q2GSAIW2uxwMo
         qexg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHDmArgC;
       spf=pass (google.com: domain of kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id h16-20020aa79f50000000b006cb84e342dcsi1668317pfr.129.2023.11.23.10.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHDmArgC;
       spf=pass (google.com: domain of kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2374-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF607B21771
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999474C3D8;
	Thu, 23 Nov 2023 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHDmArgC"
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923CCD68
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:50 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so698119f8f.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764549; x=1701369349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbxwUSVkjdWQxr0WbjMFM/ALqAenG4WEeRbrPnMTydM=;
        b=cHDmArgChxL4e9KGlI4yt/GHEqbJcByrUZDPPxMF6SIfRoZ3gKYwKKWcvBBGotElcV
         +fdQm5imOgkZn5YdaA2mGMhgWtMu2ypQ+pvLOCSlM+wSs9xGYMoB9TQwNmL/AKRFNhkZ
         yzC2a/1E+UjAg/sqaQWJnZkwaOUgG3/KaRzH+bA4ND7cfWQAuVClzgHBwJqoAwsMT4a/
         tuOMHdft661fV1dSwUofhApE08FE4Rf1WBJcbc5I1U5nZLvA0UuSQuIyCdr3JuxzZJ9z
         6SJQbJuVM7CnmuZYdRYdstX+J2Lq/nsx61/z7tVkxZ0ZVDmbSwZojNK6RwKHNomhSTxQ
         vwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764549; x=1701369349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbxwUSVkjdWQxr0WbjMFM/ALqAenG4WEeRbrPnMTydM=;
        b=mFm2qodl4AaVusbIZ8vmAw6kDX5AfpAJucprJM9CcU884Ia+NhVH97THG582Uyiifp
         zip8S4eu/Sp7hz45wqZduwqft8sw4xAmnfIH4qzPs9TfYSy7JPmIfsIe+cuVpUwDIvnZ
         cOh2s1yGy0OXy2011UPK6H+r3TCrsIPVghX9Dj3lzwQKQjxoGVwMPkj+lCYiSmublDEX
         NbKYlnULF1S2H0shGECdruDl3fT7LSfHTqUREPkml8DwiBv6Udgm+ls1B8po32zXB63l
         Z8IfVO8Sl4mUjms6rZAYyJnj0/L438e4cwIDvM4yD/4KMJssgn1cNeRgJ8HF4MVOkvf+
         YkEg==
X-Gm-Message-State: AOJu0YzQQjSwzFEvQ6Btvi2Hj2KDUTZgYDfjH2FsUsF0VFCGcW7qpI2e
	1kS3OruAe7pQ/9IDsSPCubKJKA==
X-Received: by 2002:a5d:4ac8:0:b0:332:e2e5:46a5 with SMTP id y8-20020a5d4ac8000000b00332e2e546a5mr37511wrs.7.1700764549059;
        Thu, 23 Nov 2023 10:35:49 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id f6-20020adfc986000000b0032d829e10c0sm2293981wrh.28.2023.11.23.10.35.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 05/16] target/arm/kvm: Have kvm_arm_sve_get_vls take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:06 +0100
Message-ID: <20231123183518.64569-6-philmd@linaro.org>
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
X-TUID: 8W3QIxWHgq0X

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 6 +++---
 target/arm/cpu64.c   | 2 +-
 target/arm/kvm.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6fb8a5f67e..84f87f5ed7 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -129,13 +129,13 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
 /**
  * kvm_arm_sve_get_vls:
- * @cs: CPUState
+ * @cpu: ARMCPU
  *
  * Get all the SVE vector lengths supported by the KVM host, setting
  * the bits corresponding to their length in quadwords minus one
  * (vq - 1) up to ARM_MAX_VQ.  Return the resulting map.
  */
-uint32_t kvm_arm_sve_get_vls(CPUState *cs);
+uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu);
 
 /**
  * kvm_arm_set_cpu_features_from_host:
@@ -278,7 +278,7 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
     g_assert_not_reached();
 }
 
-static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
+static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1e9c6c85ae..8e30a7993e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -66,7 +66,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      */
     if (kvm_enabled()) {
         if (kvm_arm_sve_supported()) {
-            cpu->sve_vq.supported = kvm_arm_sve_get_vls(CPU(cpu));
+            cpu->sve_vq.supported = kvm_arm_sve_get_vls(cpu);
             vq_supported = cpu->sve_vq.supported;
         } else {
             assert(!cpu_isar_feature(aa64_sve, cpu));
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 71833a845a..766a077bcf 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1803,7 +1803,7 @@ bool kvm_arm_sve_supported(void)
 
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
-uint32_t kvm_arm_sve_get_vls(CPUState *cs)
+uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
 {
     /* Only call this function if kvm_arm_sve_supported() returns true. */
     static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
-- 
2.41.0

