Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4698414wrw;
        Tue, 13 Nov 2018 10:19:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5cL0i4zfH9n/bWTfXs3fwMfZHjFg6CryvV7+T+kSa7tWr8XOhjbrNyrinZEVaogmiZvUY1x
X-Received: by 2002:a37:6191:: with SMTP id v139mr6056553qkb.25.1542133194831;
        Tue, 13 Nov 2018 10:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133194; cv=none;
        d=google.com; s=arc-20160816;
        b=YBmyX4C6XcM2bxDvFAAj0fpohOtc0YwymWYlGLV9LyBFY2xdpCLpSy5xY7HQqFuDpE
         zn3aVQTi4FMNvnD3a/ZpUEhQF0vbZbJOtPq4f/GsS3Zt+UkxL9jtfdd3su87GMMHOw8K
         +bH6Pi4ORzQ/Gy2Ssqk0efISOQdLuyk+Vh9bTvIK34LRn8WCrTxRgaujz7s0YDWymINJ
         8oM1KXztEGtorrCfXnMEt0VSVhSV702vGjADe6evsZTYz5JgkKwXlLTIkJSj9TwGbSry
         Bdb3jOkAUBkRywoqba5odJ/+dbk580/yainjvpyd4dqTOds+CzKbh8zu1EaKLvO0tfW1
         8zYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EfAiDKdj8MJve7c/yYaz1b7RcIsaOXjic/PkLWMwso4=;
        b=jfmPC1xNUELTM8Zkz2xn4aHmQIZqYUuU/o+7TUom2kPBSrxcRRp4rU+EPDKU291Oi/
         ssdaevPkxKCtZL0AVQxl8v4EG3JNWKvmqNBLZi/t4ES5vRr5picjWYVfUOZZzk/GvpzK
         cY5kraBTccDkiV1eFGQvSOxff0vyGvUkKuJ71Hr47iJdcP+ZKAmyPwi/PiRx3jUnYQoN
         uev4KSx1nHrvcJqacJIvSyLwbBmX3rFjreZ4Eait1rl+EGLifJw3N9C5JfoxIZSeYtUA
         qGi1OlrqxIFXpWKmjl3r0myR7GFH9z/UP3SWijhXdrV/N0aOsyqlbmogjQsXJptwd5Xy
         VG1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c72eDAP6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si6970372qvh.178.2018.11.13.10.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c72eDAP6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdI2-0007Ca-7i
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:19:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMdEC-0003DO-UV
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMd1c-00081D-Ct
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:57 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMd1c-0007xe-4L
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:56 -0500
Received: by mail-wr1-x442.google.com with SMTP id l9so1486128wrt.13
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 10:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EfAiDKdj8MJve7c/yYaz1b7RcIsaOXjic/PkLWMwso4=;
	b=c72eDAP6llOj3+5j+0Q0Gv039/C4tLv2r0BRZrHhz8opYGV5jOja34Q3mlyF88OI8v
	00D0m5+qon25XS6aeTFWCoXP/+Wa69lMRzWcJIlqKqX4KsBy0Ro5WPJVLhc2c3uSPq5g
	EV6QSN07CSIE2v1oLxU2QZ8/CoIEBGf9CzfMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EfAiDKdj8MJve7c/yYaz1b7RcIsaOXjic/PkLWMwso4=;
	b=PIf1kyO/zWXBrkOPjRecrG94k1TPn7ADx+yk6Dc7bPigjvZE3iq68IVSBqo9dDjnBq
	VEgTTDRMoKh/kUTrbVGPdT6E9tt6XgwaNKzWwFcbXWDt5UPqqKW9rUkJQVHmChXAEfxQ
	dly1APfdRhTwrQqLFrWvAXd9Vi5gu+L2KJwiSW/58tO+uX7ypszuSp4Uc6P5tdsBVldv
	1QqfUKqUDZ4mK6WvDdGFUKRvUjvNrF6gqX+wjMsHBI6Kdq0JYLuwBH3GkKlpuHMD5uC6
	BQ54MYnKAr0nC8g6myl8ZtFEvmud9a7t41hTPJVXWJA0J5xMZ8URu7Ncn4fmOwEka3L6
	ALLQ==
X-Gm-Message-State: AGRZ1gJToHzm5haCkItggfx/HlslopVNL2v7mQ4FHVj0Ga8Hh+DoxwD8
	ij09CpqOlNo3ZJt4+xSy5xnH7cBVX28jPg==
X-Received: by 2002:a5d:4f08:: with SMTP id
	c8-v6mr5868310wru.310.1542132169833; 
	Tue, 13 Nov 2018 10:02:49 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm2715978wmb.1.2018.11.13.10.02.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 10:02:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 19:01:52 +0100
Message-Id: <20181113180154.17903-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113180154.17903-1-richard.henderson@linaro.org>
References: <20181113180154.17903-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v5 2/4] target/arm: Fill in ARMISARegisters for
 kvm64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yf+ai+bXjweH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 90 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 46fbe6d8ff..0a502091e7 100644
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
+    int err;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type. Fortunately these old kernels
@@ -487,8 +510,71 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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

