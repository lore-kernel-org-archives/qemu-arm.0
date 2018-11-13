Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4521607wrw;
        Tue, 13 Nov 2018 07:43:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5dsuvN9BfQZuz2PuduDfNFY55Jt133+0kW60fw2lCzB+YupsehvMLfGus8PWrpvVHxk2tUN
X-Received: by 2002:aed:3bd7:: with SMTP id s23mr5373848qte.207.1542123832628;
        Tue, 13 Nov 2018 07:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542123832; cv=none;
        d=google.com; s=arc-20160816;
        b=EqShAJxwR5awREJl0RFnMhS8ulv6rpBVOjATwf9h2UCADlk0bWeQEfUu3tWy9Jg4qS
         lEddjC5zhD+IeoAvLLzzvP5DIzuSRS46KPHC73Hu/5qQv7J2iLunJ0+wMb9zz7Ld013c
         iDx7UIrKrUJvAINPXornAxBfgv/lMuPyl//F8bVKlrLc0r9kYwWKuLPZ8iXcFbbJFr/d
         3qhm6MEf8DKjZF4Tob+opNFJ4SsQMekKrrfnZHzrqPOiOagP5QUin0Ci8GGQcjPq7rWS
         XEOAHNBv/eeL9TNiJyvj8KTuOKLxnWGP1rBde444ARYMpusNfVmQsnJaK3jcVBcbKX8F
         Fq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=cLRClBlTM1MdU6W5hsPIhDK5ftDIufuY11txlyX8/WA=;
        b=qVYiNPc1jxHh9KUd1y74mODrRMwjKXm2FJzrorOEtmfHrehJ6hQpxY5/XeBe5HrOcU
         8oto3sm9zHMzHh6jUd1waDHy1M+jWqBy4j0Zygyj6p3HyMofaYFrClPPoJYJNdJDODRi
         KAggOMA/OoRcww3QF26tG4ddrzc3qB2y0rmiLFIK2PkI3QuuQzUldFfzGXWdNs6v5xme
         xoKOUHDrpWsxo5OFUHPgidAdDBzHjbNAOO5BlJnkVN7rUxCOWoL+OcOxranNj/vihJA1
         JYsITqG1FGH92CZDyalqcaU/qSguUbK34UHIOSMutntvx9Sol/3b6qtxrIVtOQN5Jdmq
         e0ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bxm4pa+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17si6273963qvr.23.2018.11.13.07.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bxm4pa+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMar1-0002TC-V9
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:43:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqp-0002T1-QW
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqb-0002HE-5B
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:30 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMaqX-0002DX-9Z
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:23 -0500
Received: by mail-wr1-x443.google.com with SMTP id z16-v6so13857699wrv.2
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 07:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cLRClBlTM1MdU6W5hsPIhDK5ftDIufuY11txlyX8/WA=;
	b=Bxm4pa+vpccCdTFuYgTLB3AdeRhUuyCNkxISb0M+E44DSqSjF6jDlMSjHhnHVmgWgR
	sewMX7oFy6RIZgh3fy5tKOfOZUGivAaSkAUJjgQQnWDBwmrgpDZkGcvfWfyVB+7Cu/oi
	8JNtZg9v4IwLvKyl3GcqP5smNcBQsq8B1/SFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cLRClBlTM1MdU6W5hsPIhDK5ftDIufuY11txlyX8/WA=;
	b=jd5WeBwNuzXXYkDainWx9OfqykmlJPqQknG14BaBue0O97Ksbp78bati463A1ZEFYN
	c9KiEG2pGZcSXjEiwWjpsZvEvL7lRJIS4OVS/0GmZ4e/X8VRj+7IRPm5BD8en5vc+Vhz
	B/aE60jrCDV0RElkcY0tuu/GKAG9UXq026AuexxLUfKwCczvOXfzWaVUojxyKiaqUVCI
	KDy/ziWrHCawFb4cyob//GGblDgmZB8AL2V3ERgAIZSYxDsYslsB92KT5+x8zBM/8woX
	hYFSXmubvl11ByN2W9DJHUJEXXlEjlzI6QppeiYPMq+MlEGRSP+OdpJ38jL2/AMNPPDG
	CReQ==
X-Gm-Message-State: AGRZ1gIplFREc/mXzTTIKv1lWr/bIPLrH5BLoecw8JYPZZds7mkGdiZx
	2QMK7ytARBEDSUKahOliYnaFCw==
X-Received: by 2002:a5d:530c:: with SMTP id
	e12-v6mr5343995wrv.29.1542123798668; 
	Tue, 13 Nov 2018 07:43:18 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	s16sm3479709wrt.77.2018.11.13.07.43.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 07:43:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 16:42:24 +0100
Message-Id: <20181113154226.14396-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113154226.14396-1-richard.henderson@linaro.org>
References: <20181113154226.14396-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH v4 2/4] target/arm: Fill in ARMISARegisters for
 kvm64
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
X-TUID: AVUM64zt0rC0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 62 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 46fbe6d8ff..8dff8749c9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -456,17 +456,40 @@ static inline void unset_feature(uint64_t *features, int feature)
     *features &= ~(1ULL << feature);
 }
 
+static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
+{
+    uint64_t ret;
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)&ret };
+    int err;
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
+    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
+    if (err < 0) {
+        return -1;
+    }
+    *pret = ret;
+    return 0;
+}
+
+static int read_sys_reg64(int fd, uint64_t *pret, uint64_t id)
+{
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)pret };
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U64);
+    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
      * fill out the ARMHostCPUClass fields accordingly. To do this
      * we have to create a scratch VM, create a single CPU inside it,
      * and then query that CPU for the relevant ID registers.
-     * For AArch64 we currently don't care about ID registers at
-     * all; we just want to know the CPU type.
      */
     int fdarray[3];
     uint64_t features = 0;
+    int err = 0;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type. Fortunately these old kernels
@@ -487,8 +510,43 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     ahcf->target = init.target;
     ahcf->dtb_compatible = "arm,arm-v8";
 
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
+                          ARM64_SYS_REG(3, 0, 0, 2, 0));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
+                          ARM64_SYS_REG(3, 0, 0, 2, 1));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
+                          ARM64_SYS_REG(3, 0, 0, 2, 2));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
+                          ARM64_SYS_REG(3, 0, 0, 2, 3));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
+                          ARM64_SYS_REG(3, 0, 0, 2, 4));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
+                          ARM64_SYS_REG(3, 0, 0, 2, 5));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                          ARM64_SYS_REG(3, 0, 0, 2, 7));
+
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+                          ARM64_SYS_REG(3, 0, 0, 3, 0));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
+                          ARM64_SYS_REG(3, 0, 0, 3, 1));
+    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
+                          ARM64_SYS_REG(3, 0, 0, 3, 2));
+
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
+                          ARM64_SYS_REG(3, 0, 0, 6, 0));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
+                          ARM64_SYS_REG(3, 0, 0, 6, 1));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
+                          ARM64_SYS_REG(3, 0, 0, 4, 0));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
+                          ARM64_SYS_REG(3, 0, 0, 4, 1));
+
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
+    if (err < 0) {
+        return false;
+    }
+
    /* We can assume any KVM supporting CPU is at least a v8
      * with VFPv4+Neon; this in turn implies most of the other
      * feature bits.
-- 
2.17.2

