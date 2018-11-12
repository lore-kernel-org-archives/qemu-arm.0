Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3075071wrw;
        Mon, 12 Nov 2018 04:43:35 -0800 (PST)
X-Google-Smtp-Source: AJdET5cIQjDXsydy7p12j/uxYPdzxJFOatzaiomMdmbAGuMDaTC/+xEZuyvv3y3FtEzJDEZc7Vu4
X-Received: by 2002:a0c:e84f:: with SMTP id l15mr723398qvo.124.1542026614932;
        Mon, 12 Nov 2018 04:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542026614; cv=none;
        d=google.com; s=arc-20160816;
        b=q++ck2fSt/93YV+8HuBv2EOpDuO0/uvaUVU3HKY+/kslGMO2Dpwxgu4Rr2NgY05Tkk
         ibd+gyQ/sZKQPg/JVBZv+EeP1ZgES4iAq7qKWgDA2fnnde8F8GctV0Q0wroyLIMNEL4H
         F3J9cb/01QNH8BY1OYOiPKRyROpBCumUc0xY3zHKkXsDiBFcBePNGentBbrqVdZehrfh
         NIEc5/LhgBMHyykGGMEdAQUoktJWH2EwgbT62cQKWkkTrcb0170r0TvrsH9qDsp6K61/
         vYyfpgXTsrKezdCWvO2q1SdtWIQ3sC/viysiZRs+fn2RKCjIQehgKZInhssZcht2aLY4
         YGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=e077ZNSyee2GliAtQsoKvaA5JGHxK3CBIl61lQMyFPs=;
        b=Z/KrWPITR+Jov36zeCa9Yc1HUYmPlrqGVsNXLq4NsUoRAbArZyzwSwZcPYqyReZO3D
         NHrgeDouD/2b//Lt7WSWjDn7DTknFB98Ugmov3MdcaEoxFOVhZmhauN9Ux/cKoFnAeZh
         X54gNNIz04+zr0hnczLxFTAwju/8+bns27+nUgGEMyxgofH2x/wWrtnPmPo8qefJHKGZ
         j/hbUcjTFzDjGfVY1A2i8cfHwD/404jTGlxMDG2hMfPZPNPtBPopRvyYozeOmvwvQKtY
         8Rw7tU+Cgli0HRIzPe2cPz6tMdpwjcE0zxLySDobTIGqrX6bLCk6WPSWDEZM6I3fQo+6
         7jnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ARENA4YL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si270593qkb.132.2018.11.12.04.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 04:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ARENA4YL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMBZ0-0004Fh-Db
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 07:43:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMBYs-0004FW-90
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 07:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMBYn-0005L4-Lc
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 07:43:23 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMBYj-0005Gx-7g
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 07:43:17 -0500
Received: by mail-oi1-x241.google.com with SMTP id g188-v6so7011251oif.8
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e077ZNSyee2GliAtQsoKvaA5JGHxK3CBIl61lQMyFPs=;
	b=ARENA4YLaJQaKrXaLCjejqKe+c02k9U/fWKao5LF1o33g1w2YMYE6OGzxzHtUiyAuR
	ltFLA23VlFc4TJOwir4YPYP8hO+K/vhVH85ytUAr57Gk1aSSyxJxNjlfaTDutN828gZ9
	37LF57yAGmsbDxy1Y3vObKolpjbIgvhvdgkqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e077ZNSyee2GliAtQsoKvaA5JGHxK3CBIl61lQMyFPs=;
	b=gy2f0/ZTJWB5txvNy7FcxQwV0gvjTc3ZeE7OYsenJ4J3T8Pau3uiDGHb6dpNIuaymq
	jc5QcgE5c3MbjcTGLpNnEottjMNTs7YMMHikKUCnO5Mb7nNBmABf8lDtQBB+IQvujAyR
	409n0iSBycKz+XErkN17HroYZPLF6lu2fHHUWMiHKEIauO6DSdTKNNm+eHvE7nHBVC1n
	SP+AEBM16C4HRbT9ArBh9PON8FKNhpeCaGcW2llWvyJYsuKB3u5LwgX4N2vict0gGDtS
	VWS2AG0JIR09lnnSim4qcx2niPxrF1YBVsAbk9noYuPLG0V6OE3WLwI54cZ2iRuYzQFq
	XFNQ==
X-Gm-Message-State: AGRZ1gJDW1k6DH9xaYDpFFY09dwkLc8ChUV7IkHpnbXrLh8/iR+Et+oT
	k74PhbpgqcxsclyD6AQz0/tSDtid9qvCbKcJf626Iw==
X-Received: by 2002:aca:ed51:: with SMTP id
	l78-v6mr389782oih.112.1542026594248; 
	Mon, 12 Nov 2018 04:43:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 04:42:53
	-0800 (PST)
In-Reply-To: <20181108175246.13416-5-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 12:42:53 +0000
Message-ID: <CAFEAcA-ooeVt=GRmu2Q+9DcaAs96B5AonpspVVExqQbf3kORPQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v3 4/5] target/arm: Fill in ARMISARegisters
 for kvm32
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIQvlR0HtXy9

On 8 November 2018 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm32.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index de573f9aa8..9ededa3c73 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -44,7 +44,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       * and then query that CPU for the relevant ID registers.
>       */
>      int err = 0, fdarray[3];
> -    uint32_t midr, id_pfr0, mvfr1;
> +    uint32_t midr, id_pfr0;
>      uint64_t features = 0;
>
>      /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
> @@ -71,9 +71,32 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>
>      err |= read_sys_reg32(fdarray[2], &midr, ARM_CP15_REG32(0, 0, 0, 0));
>      err |= read_sys_reg32(fdarray[2], &id_pfr0, ARM_CP15_REG32(0, 0, 1, 0));
> -    err |= read_sys_reg32(fdarray[2], &mvfr1,
> +
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar0,
> +                          ARM_CP15_REG32(0, 0, 2, 0));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar1,
> +                          ARM_CP15_REG32(0, 0, 2, 1));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar2,
> +                          ARM_CP15_REG32(0, 0, 2, 2));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar3,
> +                          ARM_CP15_REG32(0, 0, 2, 3));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar4,
> +                          ARM_CP15_REG32(0, 0, 2, 4));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
> +                          ARM_CP15_REG32(0, 0, 2, 5));
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
> +                          ARM_CP15_REG32(0, 0, 2, 7));
> +
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
> +                          KVM_REG_ARM | KVM_REG_SIZE_U32 |
> +                          KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR0);
> +    err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
>                            KVM_REG_ARM | KVM_REG_SIZE_U32 |
>                            KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1);

Testing this on my aarch32 system (a cubieboard running 4.0.0-rc4)
this fails with
qemu-system-arm: Failed to retrieve host CPU features

strace says:
ioctl(14, KVM_CREATE_VM, 0)             = 15
ioctl(15, KVM_CREATE_VCPU, 0)           = 16
ioctl(15, 0x8020aeaf, 0xbea1bc74)       = 0
ioctl(16, KVM_ARM_VCPU_INIT, 0xbea1bc74) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = -1
ENOENT (No such file or directory)
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0
ioctl(16, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xbea1bc30) = 0

so I deduce that this is because the kernel doesn't support reading
ID_ISAR6.

Adding the following change allowed me to boot:

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 8b2c9b3..2f7df81 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -84,9 +84,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                           ARM_CP15_REG32(0, 0, 2, 4));
     err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
                           ARM_CP15_REG32(0, 0, 2, 5));
-    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
-                          ARM_CP15_REG32(0, 0, 2, 7));
-
+    if (read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
+                          ARM_CP15_REG32(0, 0, 2, 7))) {
+        /*
+         * Older kernels don't support reading ID_ISAR6. This register was
+         * only introduced in ARMv8, so we can assume that it is zero on a
+         * CPU that a kernel this old is running on.
+         */
+        ahcf->isar.id_isar6 = 0;
+    }
     err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
                           KVM_REG_ARM | KVM_REG_SIZE_U32 |
                           KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR0);

thanks
-- PMM
