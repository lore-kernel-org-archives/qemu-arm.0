Received: by 10.25.0.147 with SMTP id 141csp354197lfa;
        Thu, 2 Mar 2017 08:14:13 -0800 (PST)
X-Received: by 10.200.40.178 with SMTP id i47mr16892000qti.259.1488471253252;
        Thu, 02 Mar 2017 08:14:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si7263306qta.11.2017.03.02.08.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:14:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTMo-0008PU-Kh
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:14:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTMh-0008Od-QL
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTMg-0001pF-Qo
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:14:03 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTMg-0001ou-KP
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:14:02 -0500
Received: by mail-wm0-x22d.google.com with SMTP id t193so16194633wmt.1
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6CcDtkwb7WZiFYtbGTqiRQbxfq+hWKY3EAZGZekpJik=;
	b=kKHaSzryXDsPMFMsJiZqOs/oNqXAukStdoOyUK3FxxgEinB6YeS9XWKm2R6yf8G3U1
	tFrKNmyk8nKaNC8GWho9haPQWya9VqztODKlv2Q49S81t5uFM5bp3HBFhYk3flb2n/2J
	4OJz43s7X05QkID9ppI26MchjO7ZZRJTTolvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6CcDtkwb7WZiFYtbGTqiRQbxfq+hWKY3EAZGZekpJik=;
	b=e4R4Z7BH1avaiMjkQUp799ip1VFysYk1qA8Io2NVsknG45jV+wlmQDWXo8TEVBZsml
	Ar1ssSvBdG0E1eW1kiKpXm6Fgek3Mn3dTKxSJnE1UCT+tAcvvoAC2eD25L16k41/fMXl
	8yja70rdiEsG27pv/ulgFNlSsLzLCoKHXf210SgIEeyrbckzLqqmsMHrZ2BNOkURJf2V
	RGOuDvfBN19PA/2GNvXiDXG+T/anpFWoaC59WoG3hOD2rca3sjwFPd0po2YlvlU3t70W
	trYQIVM5jUVXozRameKwASCYIb5jElKSJHi+bAKtPeeS2u79s3TmyFKgI77p8lG6zhtk
	goAA==
X-Gm-Message-State: AMke39nRmPnbGm+IL08A6BA9KHIuoBnFcG6M9Uu7vOKyuRf0FF8b4oJwTS7/Z6q/Hz1QYICbCYWnvX7zN+zktquZ
X-Received: by 10.28.55.199 with SMTP id e190mr8516271wma.92.1488471241430;
	Thu, 02 Mar 2017 08:14:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:13:40 -0800 (PST)
In-Reply-To: <20170227173706.15210-3-drjones@redhat.com>
References: <20170227173706.15210-1-drjones@redhat.com>
	<20170227173706.15210-3-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:13:40 +0000
Message-ID: <CAFEAcA-ScxCc5-pizNjeV4S_NpNziWWmVTbP+zAs2KCY=V0wyg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH 2/2] arm: kvm: set MPIDR when we can
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Igor Mammedov <imammedo@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebJiwbCVkM/p

On 27 February 2017 at 17:37, Andrew Jones <drjones@redhat.com> wrote:
> If KVM supports user provided MPIDRs for the vcpus, then provide
> them. This simplifies management of vcpus as we can be sure of
> the identity of a vcpu even before it's been instantiated.
>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c   |  3 +--
>  target/arm/kvm32.c | 22 ++++++++++++++--------
>  target/arm/kvm64.c | 22 ++++++++++++++--------
>  3 files changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f7157dc0e59d..83cd5eefbef8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -741,8 +741,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>
> -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> +    /* We don't currently support setting cluster ID ([16..23]) (known as Aff2
>       * in later ARM ARM versions), or any of the higher affinity level fields,
>       * so these bits always RAZ.
>       */
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 069da0c5fd10..5ad732498e5c 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -186,7 +186,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      int ret;
>      uint64_t v;
> -    uint32_t mpidr;
>      struct kvm_one_reg r;
>      ARMCPU *cpu = ARM_CPU(cs);
>
> @@ -223,16 +222,23 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          return -EINVAL;
>      }
>
> -    /*
> -     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
> -     * Currently KVM has its own idea about MPIDR assignment, so we
> -     * override our defaults with what we get from KVM.
> -     */
> -    ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_USER_MPIDR)) {
> +        ret = kvm_set_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR),
> +                              &cpu->mp_affinity);

mp_affinity is only the affinity bits of the MPIDR. I would expect
the kernel set_one_reg interface for the MPIDR to want a complete
MPIDR value with M, U and MT bits.

(compare the way that when we set mp_affinity from the kernel
reg. value we mask out the bits we don't care about).

Similarly with the 64-bit version of this code.

> +    } else {
> +        /* If we can't set the MPIDR, then KVM will generate one. We must
> +         * update our copy to that one in order to stay synchronized.
> +         */
> +        uint32_t mpidr;
> +
> +        ret = kvm_get_one_reg(cs, ARM_CP15_REG32(ARM_CPU_ID_MPIDR), &mpidr);
> +        if (!ret) {
> +            cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
> +        }
> +    }
>      if (ret) {
>          return ret;
>      }
> -    cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
>
>      return kvm_arm_init_cpreg_list(cpu);

Otherwise this looks fine to me.

PS: I assume we are targeting 2.10 (or whatever we call it) with this.

thanks
-- PMM
