Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592999ejj;
        Thu, 23 Nov 2023 10:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+k0EGyGhpAiNbXLS4GAmDAmukyPNkCS50eFSRCpwLJ9gj2DetgZyRO/G5W6QT+YYg8Sy5
X-Received: by 2002:ac8:5d8c:0:b0:423:7766:a6f4 with SMTP id d12-20020ac85d8c000000b004237766a6f4mr303334qtx.15.1700764606970;
        Thu, 23 Nov 2023 10:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764606; cv=none;
        d=google.com; s=arc-20160816;
        b=bUNzd9Ff6ZfAEGBfzD1aOmYfk6IxXO36LCdDITI5IKFG9JCZpMEVlbdRTt2aYGv2ez
         zXbUV9APCDObz0zCqNljqfZa2Sxwe72hlX9Ocx+U5z8Wd5j+dxf++MeqXB1ICITEYJqp
         9FlC2JNZUGn2FenYTe+orsJf5BuJue67R0IB9WbNiGFXraaOjDgRSryacut/2/h57VUu
         CzcGyrRYVf5aCjgHdkEiT/GnRhShTdn+8EOqlBRWIdl6CvbLbOliQ3yV2a/gfVS/hzJP
         THYB/OYVlOGjYeZzjMmMiY7IQv8C1Vqk1WVoJefljDY8BT6kcLPRZJbkEhAgLUFmb2Ts
         cyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=q9UsbPHxQcdfZLTnOccu24vjYBcOtxtHjR4chUoHDsY=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=C8gXwM+7QhKYC6Mj2GFJMm5gMLsq6XfX7hbUzaeRdGNY/NdXWa5t0JQsOCBZziL4qe
         DTxclBOIyy3QZyNj5U7+Pxnvm1OC96+45XGgN5ky4Wgz8DfaDY223wwm4Wj2NgHeARdk
         jVscl2rKKJqcQ2QbQsTqWz67ltO5cTB5l0is89dCVqwXjP+Yweoqfnz1za17jkTQxaiM
         BiqTeJDVZTTynJjfWv/Ywuzu8xsimDziaH3iwWBtHU01aPlEL+Dx8cjatglQEthpFXzm
         6ETX9SgKJAZ/KCGKr0zA3q2KG611h8J6DU2KM0lzRN8fuufXhYwYRn7g3RA5UtDYmxL6
         lZvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EBFlK/dV";
       spf=pass (google.com: domain of kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id v31-20020a05622a189f00b0042371956d67si1645290qtc.188.2023.11.23.10.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EBFlK/dV";
       spf=pass (google.com: domain of kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2383-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A921C2102D
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC914C3D8;
	Thu, 23 Nov 2023 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBFlK/dV"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E0A10C3
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:39 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b2a8c7ca9so8919355e9.2
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764598; x=1701369398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9UsbPHxQcdfZLTnOccu24vjYBcOtxtHjR4chUoHDsY=;
        b=EBFlK/dV0IFOkyVDn2y8BuLph4K9v72muUPXHtqjnQNbAH/BK8Hp6UKgmL769HqbHS
         rEQNspmbn+u1wSdfj1qmb/BeBshR4JiIiB59mFR/vkNfinErd/RSp8rQt1l9x302wQiI
         DBbp/MLrHfHFGjfJA08lKU81Adr2KRWEAbgcptQZTpT/NzkF0Z/HizE7FD3aGOph4IO6
         ASk5eq9gz3jLvKHGy56wgwSM5U2T5jWjN45FofJmDmxBmExyf4FqEw10SlUMmbVIe2Hi
         irpYAusZcMmrCtkr4omTI5PgbG/klasKmncTLVwUig8+rj8lS910NoaKQ9jtvtl5FTvS
         zYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764598; x=1701369398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9UsbPHxQcdfZLTnOccu24vjYBcOtxtHjR4chUoHDsY=;
        b=DnmgU6j5WxG/fAwqsZ/Q2odraftKeW8wgwR1hiIDScQzPSsQxbEBjH7U7dTAGsY7LV
         dmKdYz3abUyt3Oed9kMIb9yPfvHDiNT7DzWlyQtKg7nz0XBdqulT1eI9ZGcBVPUhcvdm
         k9wOjTITkIhh8WLznFYBUr5HZcrkEUAvOZ6yDYroRDCQoTUUhhtsZQxazsKio2s6QTeW
         7GHlZzOHKqhMjdmXAOfobblBdsG5FWJIDSKhimkVxE4f+5td+t5rvtr4J4WC26a5aGQn
         gXkN8uHAZnfaeQd4oYFAZVjSDlfdIFSEgBtWLhfZjmwom6gj/BY62Wop2XB1fTyl6Xyh
         Kcog==
X-Gm-Message-State: AOJu0YzrpKtgrchn4YTrFAkSylkNhJaJnfPNfogoAAHtXrdLysLPQVpK
	YRiUQ/58EBP9owkgijjKzERv6g==
X-Received: by 2002:a05:600c:3110:b0:3f5:fff8:d4f3 with SMTP id g16-20020a05600c311000b003f5fff8d4f3mr326179wmo.7.1700764598088;
        Thu, 23 Nov 2023 10:36:38 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c4f9000b0040b38292253sm1316405wmq.30.2023.11.23.10.36.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 14/16] target/arm/kvm: Have kvm_arm_handle_dabt_nisv take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:15 +0100
Message-ID: <20231123183518.64569-15-philmd@linaro.org>
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
X-TUID: orHxBXsTxFmI

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 91773c767b..9f58a08710 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1304,17 +1304,16 @@ static void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
 
 /**
  * kvm_arm_handle_dabt_nisv:
- * @cs: CPUState
+ * @cpu: ARMCPU
  * @esr_iss: ISS encoding (limited) for the exception from Data Abort
  *           ISV bit set to '0b0' -> no valid instruction syndrome
  * @fault_ipa: faulting address for the synchronous data abort
  *
  * Returns: 0 if the exception has been handled, < 0 otherwise
  */
-static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
+static int kvm_arm_handle_dabt_nisv(ARMCPU *cpu, uint64_t esr_iss,
                                     uint64_t fault_ipa)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     /*
      * Request KVM to inject the external data abort into the guest
@@ -1330,7 +1329,7 @@ static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
          */
         events.exception.ext_dabt_pending = 1;
         /* KVM_CAP_ARM_INJECT_EXT_DABT implies KVM_CAP_VCPU_EVENTS */
-        if (!kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events)) {
+        if (!kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events)) {
             env->ext_dabt_raised = 1;
             return 0;
         }
@@ -1422,6 +1421,7 @@ static bool kvm_arm_handle_debug(CPUState *cs,
 
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
     int ret = 0;
 
     switch (run->exit_reason) {
@@ -1432,7 +1432,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         break;
     case KVM_EXIT_ARM_NISV:
         /* External DABT with no valid iss to decode */
-        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
+        ret = kvm_arm_handle_dabt_nisv(cpu, run->arm_nisv.esr_iss,
                                        run->arm_nisv.fault_ipa);
         break;
     default:
-- 
2.41.0

