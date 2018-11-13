Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4696009wrw;
        Tue, 13 Nov 2018 10:17:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5fZXeTfbtQmlnDa0diFs7ip1glK0QGkOGbzkxxrgVqYFkf2LPgdNvn7vQyp5Tvs5ylp9G5t
X-Received: by 2002:aed:2c87:: with SMTP id g7mr5949848qtd.52.1542133062581;
        Tue, 13 Nov 2018 10:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133062; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlNws8oHpESGzFf1ZpP21pOZVl9tmk1vJ4Hiu1xjWGn3JyTC31N9WS9p8AN546xOkX
         gBf1dRLbYjN+1ZdWHW2E26moaJCnY+8LUn6dA4gCCjvjwqH5tC0d+jQ5UOtWa5Er93/J
         3HWvGQKHoupm8oye+aDk5NNMvu33VmoxPyN/os9ox9BLME+eCKhGekwjuzi6Xz/dEyBE
         noAIdZiZHMi5face1Jk6IIMVwGLBRmTyh3w6BOt9b+cfwehmT5dbaYcmCkr+d45Sdfd1
         4sT9+rTh+29Fa9E5okIJgOfpFKX8RYWXdBp71SJFgBej/cwy66nXAUINHe1iDMwjmM0H
         eYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
        b=mXGJhJaRnLB8B2piHN4LfdUiGQjU4zRxxPTaZoFCpzv5LM5AS4xqHTRBzji6xnjAq1
         zpZOlRIq7QGg1dhFRzt41uDx6XQVnJYfUD83VZQtO87MDUxunXdDVpAV0o4WzEwwCbrl
         UUBVELw0/4qCZHoJUSF43eBCk8o3ToT/U3ts0sN5tDpJeFBQ9wFXBkwXkm7J4yVgp7+T
         Chs3fUKbuOFS6bK7TkMT6mwweyKfh0ehB7CucJqRt3uu2sZ9WU/6eHICpj9cGZSGj2p6
         Zawdx7VuOcqQNanZ7AHp6wmILC6jLYha8d3CnJP/i4V9lbGXWRp3OIsDCNPGKwIftTHO
         sfvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PO3CEbp0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l18si3241115qvl.106.2018.11.13.10.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PO3CEbp0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdFt-0004TE-VM
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:17:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMdEC-0003Dk-VS
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMd1c-00081a-Ee
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:57 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40738)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMd1c-0007yr-6M
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:56 -0500
Received: by mail-wr1-x444.google.com with SMTP id p4so5186939wrt.7
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 10:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
	b=PO3CEbp04thuqo99BpLvgbZ5RCWbNLH2Igpi5WBSjLZWtcR130UwSu5LNVrVO88Q4K
	cSXqaoLVikfQ54cAqnRq1LMIW+8gp4XiVMBEfQoa4eqjCcg9jhmHyWkIlhbe7biktg4Z
	A6xHrUhjcClEeSCIa0Vivx4N3jGm7jzerr0EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
	b=o1v+/OmbDwUA5N9CnKlcPQR49fHfKxiBNj8D0nWqTtYXwlLzBnLlT3SR2LLGbD/ZQR
	3zq5MFn223s9kSrv3bEn47Hzsbh/LvwIsghgGNK8HFzA7QQUyeWERf+SpjWd+W1w5y/5
	jhiMUSWiwTIJNGlr0+dDLaYibTBJ4jRljqWNa1ZHG3HakIJRffs9+tqY1pxAPBdxh5n5
	kJKkUwFfNRTOseJXg/3imJzhT8xKDI4I0MpgLE0Qwf9hf1W0iEJDLOV7raH0OBDnBh+4
	yqszZqlc09Cwh88YHWmGRNC9SgIdc0ER6Q8IrC7FloS25Mfm1x//o6NLnBRlaRa4fxdF
	1ZAQ==
X-Gm-Message-State: AGRZ1gJYOcjNqhGXab14gT4dTofteZk4xiZ7pnlTjm0sG3lBl5DpA7Gh
	enJ2vbIyFgEmbq79nXOxW9Q8P71im0LZmg==
X-Received: by 2002:adf:c647:: with SMTP id
	u7-v6mr6070017wrg.174.1542132173197; 
	Tue, 13 Nov 2018 10:02:53 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm2715978wmb.1.2018.11.13.10.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 10:02:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 19:01:53 +0100
Message-Id: <20181113180154.17903-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113180154.17903-1-richard.henderson@linaro.org>
References: <20181113180154.17903-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v5 3/4] target/arm: Introduce read_sys_reg32
 for kvm32
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
X-TUID: qhnFudoLzSfF

Assert that the value to be written is the correct size.
No change in functionality here, just mirroring the same
function from kvm64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index cb3fb73a96..bc0badf53d 100644
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

