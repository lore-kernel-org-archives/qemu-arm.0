Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1230270wrp;
        Thu, 14 Feb 2019 09:18:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYtAqbGSjJ9m1S5kvDVg+/C3fo+B3o0IPHU4ezJvZ/xw8mkfVAjI80HAKXDIoEr0TK90iHr
X-Received: by 2002:a81:9404:: with SMTP id l4mr3965434ywg.81.1550164708621;
        Thu, 14 Feb 2019 09:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550164708; cv=none;
        d=google.com; s=arc-20160816;
        b=JD6oFrsRWkr51BLiWlzzMoP5DMqPN1C0D7CQNw4LUwi5xUhjzWTT+hQgqpXa1tGCOj
         VEAUV15G4YMqwLFnb1Yfxc+a9g0j7UKGQeNtM5MWJHmbDFIwJdyJ1tI0Ox5xNHk+NTSk
         Dp0XpwBdBPxHS77vJB47iuqTT+yeSQakI1zlwVzhRPofYKNztgxaTyS8GzaxHyJRoxu/
         5W6AT5AFW+fox46v6TBSqcBu4FuBeqPQTt7n4aYlJPRZE+4jlh6Y5zdGOs0rSHKhevwj
         jxKTCZyx1ggdTnoj2gDxvlrY+r3v9wfZ4OemwWkG/Pwj6tJrPe1akWRjUNnvEGY0dLbt
         PZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C8lY+vVimYjJ+J6BLku9tCzzHs3XJpsHRYU5QWvZX0U=;
        b=EmOkc63dp286wR5oRM6DtLzVqVWdtWMQmRzy3LXCZkptUppSITcQcJgZN1OFWyABao
         X3YiRAgirvcPbTL3TlgMEOfngTE+nwAXMd7NWXw6Jr/l1VG1RYtzSQeI8sRtkfq4KXmo
         w4kNSjp2kFiJ/4KZwQWDF9gX0MFf7GK07o/xDtwhbJWyYrmaxSebbq0J24ZsticyMgck
         QdaRKMehbq8NfBO+mL3PeuXLGTKWyOq7uUufHNJIJmCeFIylZxCnhanKqu4TGx3xoJgs
         ZHtgto5Ww1FG9qfz52AZcYAjMUNahC/v5nH8w+ozKgYUhbFDv/texlTdF4gmswHiDyzx
         6SrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lvvWes7C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si1746444ybq.489.2019.02.14.09.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lvvWes7C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKea-0007Cs-0r
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKdg-0006lf-VW
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:17:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKcD-0008Q8-K1
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:16:04 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKc0-0007ww-SN
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:15:51 -0500
Received: by mail-ot1-x342.google.com with SMTP id i5so11724887oto.9
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 09:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C8lY+vVimYjJ+J6BLku9tCzzHs3XJpsHRYU5QWvZX0U=;
	b=lvvWes7C7oFkHuki9VAZnXwysUUrEXd/VmMbQhSFx1m8Ek+BSx/ZmC4ZDBAetQct1B
	FGc3dg7GJchLbFz/xBlFDwnr+6BYlepojmDGtIznxnwz66h9BJG0n7n/7zpz6i8ZLm4f
	wNDPpM3qzSP0CKyorfoHgigKSHp97YBdjg8+5UxnzUKLRnOJplbHMNywd0pGl3vOT9sw
	tv1EynjpGZuF5kCoObhvMzt+lJXKB2T6jJsvXeykjjTsfzulVQPNkVDSGy9akxByhIvS
	HN3Jb5q/jayjrY63PRPGFDEUKXhIjSQ+KXTovHU7MUA5vpDUQHp3u20ILWESroPXf0Vd
	lYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C8lY+vVimYjJ+J6BLku9tCzzHs3XJpsHRYU5QWvZX0U=;
	b=qUuaDH+NiZUWAcIjug8PE8UZrNQwNH1LAfJsDU8NHaOTFKcqcp+PsxZQB6ifLzwmx8
	Dro9VMKDBs3EsIq9FMJssqvRMP7OrAXERGakqtFndRtUTCeyQd6sDFMX3xmJo3gt5fyo
	mVnE7X0gi+aiBCT7G0JKd04yaoiOzRgnpDfoIIckVYEqL7nlWocHuUYL9yKUFeQVdwrW
	lpebfzWJTRoktClS8UVF7AdMIqiCpXTxTed2P6wJNwV8gpyjJS3Eljnm/93J4O847yNz
	MH3SinLMEWLoom2KFujdaH/UW97QfiCk3gGE9XK9ymVEGZQB0uuQp1NAOf6LlFuqRmQ0
	ja/Q==
X-Gm-Message-State: AHQUAuYhgLgBBfWplvqCWszwpsAL2tTXyS936xSIBmxsd/lYBKCJYoOc
	K/N3Vx0iKOxT8BBpHUq42uJGUrVOrR2eFWpIXZLYyg==
X-Received: by 2002:aca:af53:: with SMTP id y80mr3093968oie.170.1550164524781; 
	Thu, 14 Feb 2019 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-8-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-8-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:15:13 +0000
Message-ID: <CAFEAcA9OWQuuqO31-uzTuu-9XSdVkH7UvXdFA1GdvD9emoS0=Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v6 07/18] kvm: add
 kvm_arm_get_max_vm_phys_shift
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U6ALfhXkTWgP

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
> log of the maximum IPA size supported by KVM. This capability
> needs to be known to create the VM with a specific IPA max size
> (kvm_type passed along KVM_CREATE_VM ioctl.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v4 -> v5:
> - return 40 if the host does not support the capability
>
> v3 -> v4:
> - s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
> - check KVM_CAP_ARM_VM_IPA_SIZE extension
>
> v1 -> v2:
> - put this in ARM specific code
> ---
>  target/arm/kvm.c     | 10 ++++++++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e00ccf9c98..fc1dd3ec6a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -18,6 +18,7 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
>  #include "kvm_arm.h"
>  #include "cpu.h"
>  #include "trace.h"
> @@ -162,6 +163,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features = arm_host_cpu_features.features;
>  }
>
> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
> +{
> +    KVMState *s = KVM_STATE(ms->accelerator);
> +    int ret;
> +
> +    ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);

Why not name the function the same as the extension name?

> +    return ret > 0 ? ret : 40;
> +}
> +
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      /* For ARM interrupt delivery is always asynchronous,
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 6393455b1d..0728bbfa6b 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -207,6 +207,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>   */
>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>
> +/**
> + * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
> + * supported by KVM

This is the number of bits in the IPA address space,
right (ie 40 for a 40-bit IPA, and so on) ? If so, then
I think "Return number of bits in the IPA address space"
might be clearer.

> + *
> + * @ms: Machine state handle
> + */
> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms);

thanks
-- PMM
