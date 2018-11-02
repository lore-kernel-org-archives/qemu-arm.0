Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2208560wro;
        Fri, 2 Nov 2018 07:55:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e05OsnYESxWqCSpj/LnuluAPRijUllWAfij0f7dMMTuC+4Y2gGTrmGS+jY/Tz3uUiepKyW
X-Received: by 2002:ac8:1909:: with SMTP id t9mr10778004qtj.327.1541170500607;
        Fri, 02 Nov 2018 07:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170500; cv=none;
        d=google.com; s=arc-20160816;
        b=c05qnRXO8skD/IZ5/h3Y/zv3a94XwT0Q8k09IK0zdmPk58vlO9JPnQliTv1MknKYcy
         k2rT/lLZTPYnBeVVZPaCS4zGzqlySukIHQb8CB/gHc5jjn6wS7Jfmb8fyjmrxB2YdbJk
         6/P+wr5lSMhEU8fuRIDPpCrUAXmjvqGl8mLx/KYK2RuWub5i/1CW6SQ9FTAkf7s5V2JO
         QjlyIt2vIqaWaUA90C0Yz5ve/xqj735exLp8jdNMMFUam4K0QfqjOBpO9LFzOqqPjS80
         P6VxK6v4H183Xh0hVhQPTzYfJsqNgMA/Bse8SKJIhwBVHYtyj7R+86xJPFoRxQv+DF6U
         EJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ffmgcNzfXibNpDQsqKV4PQiksneuZIsACAOYCKu/8+E=;
        b=fwnaQfXhW+pm7TyZQ20N47eVk1f0sEihArUZdsfbnrsMLiZeApoNoIz3GaeY0OagOL
         GOMOH9VGVzTjbyruLRNZkkVHtH4ZKdw8gB3zkOFCFSDrO+kFIoqPYsWj13kPghw0/76G
         gmCKS9nUloneT0U2M9XWnZS0/ebinQwdsW/Znv5i61/a+WsByyDtBkgSDP9AQC8as6oM
         hG8b9rxfixXmjer24YvkKT+UJK4Ng1Ghnr8Cs5FYtEohPv/j7m8joq5pLpesSC1BZqJ2
         HQR4voK/IkHfd9JWKftAOIihVO0s6cNeKWPn9YIfRHogs/0p64VPRFZ6LRQg38K/V3Xk
         PfWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FsqeCJ3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17si4056949qkl.76.2018.11.02.07.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FsqeCJ3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIaqi-0002Gh-4S
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:55:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0002EM-Ch
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqT-0003Gu-GP
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:47 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqR-0003Ew-IW
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:44 -0400
Received: by mail-wm1-x344.google.com with SMTP id a8-v6so2135426wmf.1
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ffmgcNzfXibNpDQsqKV4PQiksneuZIsACAOYCKu/8+E=;
	b=FsqeCJ3xN7NjX/11jKkWQcXlrZiBFo0WbKa+EOUcDVOZpXQ4NtumdEEgGe0JnCPUJl
	yxh++xHkIT9+RgY9cAjJ4KW1PmTRM5h5cmDD65GphmCjANSOIm/50RzKrPLfbw6MLH9W
	/EaB7YrtFR7yHbKq568OGN6fK2NUd0uo5cVfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ffmgcNzfXibNpDQsqKV4PQiksneuZIsACAOYCKu/8+E=;
	b=MR3tkeSsT/1AV0LKaSRNn8elh4laGk5V1WUSLSXuticTwyAzYqqnvzZnGeN6G+Jd7X
	pb7Ac4piHDd6YKAQTewTR8RX/u7EgvP1AsHk0JbOtIaYMj01v43WQPCF5HAMTK9B9669
	mqlFl1S4jfXYYxKVdiGKL6MdbL3WAlfNDe9QlV5JVl56mOyzIgGPkvMzOIkPqcGwkwqC
	qMyzZCQhPFh0ePJUslsBjKBMyKSCPLE5HGHe6RrG9ihlyw3YZLpJ43OI7bVFUBNsMhEo
	T99TUTY6mXFYmDDHAipJCwaPPgadL5/fJoZevYrXyxJFosnPI8wIicy6HnOVyo6/+nCd
	IpUA==
X-Gm-Message-State: AGRZ1gL/u/ZqTLHjkiBG51wvG37/f7PjSBLbB3B62Alb+7Egy3NzEh/G
	9lg6Aheq0AaqmmV1y4NRhNtGBA==
X-Received: by 2002:a1c:3492:: with SMTP id
	b140-v6mr19250wma.115.1541170479869; 
	Fri, 02 Nov 2018 07:54:39 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:30 +0000
Message-Id: <20181102145433.4553-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 2/5] target/arm: Fill in ARMISARegisters for
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
X-TUID: 8+I+a8LU8oVB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5de8ff0ac5..d4d4e63140 100644
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
+    int err = 0;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type. Fortunately these old kernels
@@ -474,8 +497,50 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     ahcf->target = init.target;
     ahcf->dtb_compatible = "arm,arm-v8";
 
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
+                          ARM64_SYS_REG(3, 0, 0, 6, 0));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
+                          ARM64_SYS_REG(3, 0, 0, 6, 1));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
+                          ARM64_SYS_REG(3, 0, 0, 4, 0));
+    err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
+                          ARM64_SYS_REG(3, 0, 0, 4, 1));
+
+    /*
+     * Note that if AArch32 support is not present in the host,
+     * the AArch32 sysregs are present to be read, but will
+     * return UNKNOWN values.  This is neither better nor worse
+     * than skipping the reads and leaving 0, as we must avoid
+     * considering the values in every case.
+     */
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

