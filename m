Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp442982wrw;
        Thu, 8 Nov 2018 09:55:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5f7NK4CABfSzkXl2L4PoN9dl2wSNj0A87yaHhPdOiDxyCDuqJa2FP6JnOjKdLjh8WWmRpsK
X-Received: by 2002:a37:17df:: with SMTP id 92mr5325892qkx.191.1541699715464;
        Thu, 08 Nov 2018 09:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541699715; cv=none;
        d=google.com; s=arc-20160816;
        b=DWrKbUpfFAoHQIsZcWdS1AoSAof9FJAJ6Loz1iuiqHDCgN2jhcheTYVhTHCOJ4Pz+q
         3rXJrIGuoBPcXIyVbUE4PShD8v2K0ysE19U1GTBioZbZZ57eFPcybv/I9VxibpAOwhTz
         YaMcSGq2kuApFQ8I9Y+sbEfNVXJeFyo1Rvaaj+OI3h0VJ9GuTse13Bs+VIgPualtY93b
         Wl0pxcgcdYt+MqDpsSW4nowBw665IKymiIv9wab7K+aRGzsItpMzRI0/A8XWUVkymsfK
         Uc0dMDRn+il+07ZeDkJloXc7sJfV6dEFv8g/h5MALiuum7rPJk15pBVMPCMIUwW76BZQ
         ksYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
        b=Q44PxR5Ip/1kvEfrcC40ifvKNImYzvR1SEU5b3n3MOKRnxfp3DxjPG6byYHv6BiGG3
         ZXurq1eDW4ln4wM95hE2+Sx0AqHxoNH2o/gzVZ8Oy8/EeZE+6RlgI8y6V6Ie9OwPmzFa
         CfrSGLsAUVMK+PLUxW9Pu7nl30GVz8kEaFPsUYUCHqIki6niTw+qebBftA49j0X7zZJj
         jVEyh/G/6m3YtkKw5UfeMWGWdZrfNY+KlYM0B+JtqDY2piQcJ/w6FpKgzFQhLIBg+ehX
         CPNeUqZ9XQIyhE5G9SkFnuJ3EXvQFyJX6oKMdelnFEvxYBoHU3QoQ+FGAstctNdSQUyC
         LVgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gQXEy2uN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e68-v6si354358qkf.144.2018.11.08.09.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 09:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gQXEy2uN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKoWQ-0001hp-Uu
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 12:55:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0001c9-Du
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW5-0008Ay-Hc
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW5-0008AV-BD
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:53 -0500
Received: by mail-wr1-x444.google.com with SMTP id 74-v6so22188630wrb.13
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
	b=gQXEy2uN88J7Yo7w6NMfD53nZ+4U4HgzHJHSj/vAzj4EMwvD4FHsPQsy4oDvuDNnME
	jwsxUVwr9SVB6OCbLYj/KJxHF4GLdbpMU/72zYvdvILx8JfhglJsmlyr/nWcYFDvfT28
	fgipWiKTnRibtBFmAELV5qjvXRyqtqk4PLysA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
	b=BkBJYYNIcG1P9uFZ3wykUt4XOG6FgNS/eYHiNpkldZBYOilk1vXoLpS1OY9BJsZgGG
	M+Yj9c8V8FJH1F8qWONI/6j2yoQWaD3ZZ6QOOZtn10h5jCTacHIwh0B+RIOFIlT07hyn
	KUrwTdINxDeXMT6ZPkCRMYdKzwwxptwcEDcsvjuVToPh9etx4YTFdVg2edjhRGx7FK6V
	UKT+IVtzuWE7NZnrS8rJLZhvObTIA6TLLUnWF47gMqgDZJYme43IemRi63BOZRCKkJws
	PgJI+62nJzaYRe2tiS4bNbB5EM4WDDb8vnwFJ3D5gDYVIpGbQw1hS+ED4lQQvw6dvRIk
	1Dfw==
X-Gm-Message-State: AGRZ1gKFPTXKjOPfPsrLJEt7jzsGn+Rb1MZkGTUTjoElobMkipIyKz7G
	wyro6R6dLAzMQDe6sHnTKoathg==
X-Received: by 2002:a5d:4708:: with SMTP id y8-v6mr5438396wrq.16.1541699692309;
	Thu, 08 Nov 2018 09:54:52 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:44 +0100
Message-Id: <20181108175246.13416-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108175246.13416-1-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v3 3/5] target/arm: Introduce read_sys_reg32 for
 kvm32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pcpHFv1u80aE

Assert that the value to be written is the correct size.
No change in functionality here, just mirroring the same
function from kvm64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 0f1e94c7b5..de573f9aa8 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -28,6 +28,14 @@ static inline void set_feature(uint64_t *features, int feature)
     *features |= 1ULL << feature;
 }
 
+static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
+{
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)pret };
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U32);
+    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -35,9 +43,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * we have to create a scratch VM, create a single CPU inside it,
      * and then query that CPU for the relevant ID registers.
      */
-    int i, ret, fdarray[3];
+    int err = 0, fdarray[3];
     uint32_t midr, id_pfr0, mvfr1;
     uint64_t features = 0;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type.
@@ -47,23 +56,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         QEMU_KVM_ARM_TARGET_NONE
     };
     struct kvm_vcpu_init init;
-    struct kvm_one_reg idregs[] = {
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | ENCODE_CP_REG(15, 0, 0, 0, 0, 0, 0),
-            .addr = (uintptr_t)&midr,
-        },
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | ENCODE_CP_REG(15, 0, 0, 0, 1, 0, 0),
-            .addr = (uintptr_t)&id_pfr0,
-        },
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1,
-            .addr = (uintptr_t)&mvfr1,
-        },
-    };
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
@@ -77,16 +69,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->dtb_compatible = "arm,arm-v7";
 
-    for (i = 0; i < ARRAY_SIZE(idregs); i++) {
-        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &idregs[i]);
-        if (ret) {
-            break;
-        }
-    }
+    err |= read_sys_reg32(fdarray[2], &midr, ARM_CP15_REG32(0, 0, 0, 0));
+    err |= read_sys_reg32(fdarray[2], &id_pfr0, ARM_CP15_REG32(0, 0, 1, 0));
+    err |= read_sys_reg32(fdarray[2], &mvfr1,
+                          KVM_REG_ARM | KVM_REG_SIZE_U32 |
+                          KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1);
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
-    if (ret) {
+    if (err < 0) {
         return false;
     }
 
-- 
2.17.2

