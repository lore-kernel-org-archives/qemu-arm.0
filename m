Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp442858wrw;
        Thu, 8 Nov 2018 09:55:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5cliiJutiCyZNlaqJX3Po/w/RIzVN5iOQph0LojY7dva6OyTwl4D6pguIs/G1eRwMC3XQBn
X-Received: by 2002:a0c:c2ce:: with SMTP id c14mr5649896qvi.7.1541699708984;
        Thu, 08 Nov 2018 09:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541699708; cv=none;
        d=google.com; s=arc-20160816;
        b=A447pA29jWckOgUf6Hm7X3tDZTFqG/EcGFeIVTjoCpdNk/bhkTjOHli+dUDgqUn8hC
         k0bmq7YTNbGR5NGfk1bewUJIJwvemPI+/ITvXOimFK4UVDHBVcTw+wT3STDS98X7FZ94
         ce89f43t70YWF6lDJwx3JhMfvb+dwPEP5Gswaq1noW6v/KFJVOIIvmW5JBUBMjpYwUnR
         rrjzzmxrm7y+PLQ2GQ8SpzyRo9mliu6oVXucgbbFBVnJcbEG9pX23u/05RMsdeJsuzKB
         abX6hebBdQ+XoRtXLxnlBPRJVI8/ecWVIP10Ohd7kQWZd+h9+LOKFAh83O1xk+QZuXFt
         M/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6uQuU327VC/BRal1lZ+nVzurXjaVdMxrSfBdC83uyXQ=;
        b=Y4CP1LQtGQkIF2+x/damfciePAlZ+dZmt0A+eVeJ+KziU3DFV+fPIp/szYRd9WbLCx
         i+0WWFinRQulUbaqWFXQuG3aOdnph4NsUUMm22MCi2EIph0bwZIUsuxTMTkS9zV82PSY
         mJtIAnexLuNXUGMIDojDD7BnedTuk1LgsgQX2N/sFqdBsS66u95W0mxeJLAeZjpjcw+F
         abZuHKsSuETqRnzUW72KHNMIy4ON22u1ONLbKKh9XhwJ8x5GnmaScdDchRAS840dPU1h
         sm7oXXYj+vX2eg/wjvD7mLk/SOcyQQVMYBqb2H4RnYrT8l6GEcHKLc+ItIoow+/2ItSl
         kqiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AdXeHyjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si2072114qki.200.2018.11.08.09.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 09:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AdXeHyjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKoWK-0001d3-FH
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 12:55:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0001cA-Dt
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW4-0008AF-IE
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW4-00089r-Au
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:52 -0500
Received: by mail-wr1-x443.google.com with SMTP id z13-v6so19843972wrs.3
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6uQuU327VC/BRal1lZ+nVzurXjaVdMxrSfBdC83uyXQ=;
	b=AdXeHyjb4bhTngj2jOmlKAc+dTMxjLHweNLh6SHBSnPE0K3GeEmT3U3xirg7jyd1e/
	9umS4anC7dFpYyxGLE2d4zVVd+OS/aj2jO//ZoznjvfVngGp2SyF9ux/HAxeZ4DZXxBo
	DDOyDu+DmeJplsM5Wuhk/URBVkdQMAhYMXx6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6uQuU327VC/BRal1lZ+nVzurXjaVdMxrSfBdC83uyXQ=;
	b=JB4UNIQNluq8ka5DkKRmT895k/jqrysW7aDai/hWdwDbi+XoQDlsMBUsg2wMioxTuL
	M6eYQwhmrdzasXSh+YMfrvA6XkR5zfeMRKxcs/gxNBnf8udlqFXeCOMG9mJfjwFMI/Fl
	X8aBzS5USEd88BwlKvrrrzuO0EZNm4M2N2vjiJXHsqdkhan9i8+jfdbqiqmV5QSWnxtV
	py6tBDT1kz+Ppqvkw0GitAFe5hMlMG0kFAxAMJMJFvwrB0UfSoFSpVs9oq0p4mL76g6q
	AxPgVx5xFF5AzB8GPE6Ovs+qIN0yy7cmQOEZMCXBV6SzZelkRaf25AObYR+QNpqd/9c1
	nSQg==
X-Gm-Message-State: AGRZ1gKM8IK9pG9P7lPqxDwWstGht1XwQPcEjuN22mPvgwoVXEUa8v2r
	/b7jarU43fyEWkLRcvkC7wcVhA==
X-Received: by 2002:adf:fb12:: with SMTP id
	c18-v6mr5172342wrr.200.1541699691212; 
	Thu, 08 Nov 2018 09:54:51 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:43 +0100
Message-Id: <20181108175246.13416-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108175246.13416-1-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH v3 2/5] target/arm: Fill in ARMISARegisters for
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
X-TUID: ontSsrBJzu/3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 90 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5de8ff0ac5..e1128b94b2 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -443,17 +443,40 @@ static inline void unset_feature(uint64_t *features, int feature)
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
+    int err;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type. Fortunately these old kernels
@@ -474,8 +497,71 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     ahcf->target = init.target;
     ahcf->dtb_compatible = "arm,arm-v8";
 
+    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
+                         ARM64_SYS_REG(3, 0, 0, 4, 0));
+    if (unlikely(err < 0)) {
+        /*
+         * Before v4.15, the kernel only exposed a limited number of system
+         * registers, not including any of the interesting AArch64 ID regs.
+         * For the most part we could leave these fields as zero with minimal
+         * effect, since this does not affect the values seen by the guest.
+         *
+         * However, it could cause problems down the line for QEMU,
+         * so provide a minimal v8.0 default.
+         *
+         * ??? Could read MIDR and use knowledge from cpu64.c.
+         * ??? Could map a page of memory into our temp guest and
+         *     run the tiniest of hand-crafted kernels to extract
+         *     the values seen by the guest.
+         * ??? Either of these sounds like too much effort just
+         *     to work around running a modern host kernel.
+         */
+        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
+        err = 0;
+    } else {
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
+                              ARM64_SYS_REG(3, 0, 0, 4, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
+                              ARM64_SYS_REG(3, 0, 0, 6, 0));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
+                              ARM64_SYS_REG(3, 0, 0, 6, 1));
+
+        /*
+         * Note that if AArch32 support is not present in the host,
+         * the AArch32 sysregs are present to be read, but will
+         * return UNKNOWN values.  This is neither better nor worse
+         * than skipping the reads and leaving 0, as we must avoid
+         * considering the values in every case.
+         */
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
+                              ARM64_SYS_REG(3, 0, 0, 2, 0));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
+                              ARM64_SYS_REG(3, 0, 0, 2, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
+                              ARM64_SYS_REG(3, 0, 0, 2, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
+                              ARM64_SYS_REG(3, 0, 0, 2, 3));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
+                              ARM64_SYS_REG(3, 0, 0, 2, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
+                              ARM64_SYS_REG(3, 0, 0, 2, 5));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                              ARM64_SYS_REG(3, 0, 0, 2, 7));
+
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+                              ARM64_SYS_REG(3, 0, 0, 3, 0));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
+                              ARM64_SYS_REG(3, 0, 0, 3, 1));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 2));
+    }
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

