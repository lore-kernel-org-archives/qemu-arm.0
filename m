Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1416468wrd;
        Thu, 23 Aug 2018 10:24:38 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZWdW78nq9j3lowetVXSCrgAKJfQ8y3J1IXh7tfIWOdEAcTZeM8HpvjvQre7hGtztk+3IFS
X-Received: by 2002:a37:2a16:: with SMTP id q22-v6mr25042615qkh.197.1535045078129;
        Thu, 23 Aug 2018 10:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045078; cv=none;
        d=google.com; s=arc-20160816;
        b=CXURsuyttyJjBqKboSkyXBK+X59q8p1WFr22p4kF8AjVQzGRI87SAwp6UdTrf4j1v+
         7OgkXGpCWBn36hgKvqU1k6FIuOc3hoad+1yiBEyCGMVHOFrDqH+H3FHm3ZCmiNoQ62rD
         a1jckQwvp7L1Efc6H0zCsiEol5vHALM82j+1nTAFRDW7ih6R0nnM/Yqbt2Wrht+oY6O8
         nT58H+PuR9KQB/J5OSUjxayInex08DYsAA+EL5xQh1m0mLztatK7R1xqAdaAVmgXJoKJ
         Y0mTrOgcHnYykLhBRjnDpHZ7eXnRfvVOE+AuvpvINcOB0DgPmy6N7tovhnZj9RF3M2Oz
         pAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VMKucdxxcFKOJsUIYdNaM7UdbBesPxbj6Lq+VMkiZu0=;
        b=sGxH+l+stMOcENENDZyr/CPJPlKggARdPUj61/H2OM0H00fjNlyu4+MFPub4xBcVtI
         YcB4ZaEi76sd386H62HsQcrCBI9wguowfoY6yX8Js525DL7BNJC8ABXET7m7WgIMiW9F
         FH3VSmE7A6HpqVnaxzuugtuFYD+faRNEFhxRQYbfA7UO+hWdpYMSH+e0zFTx/ppbbv9P
         D24PBsRPKqdwTL58poTKbE8VHRfx+X2rXgLNc9MUF9oMwN1FaOXWMclptI/ymuYcVZ/l
         wzsmPuyzcvcBR+DwD43HAMMa/RKDTZyRHjKtuS2qF6J5wsymiEOlS1tCIOhkhQJjuiSZ
         5xcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PP8Nd0Cs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7-v6si1670733qvm.118.2018.08.23.10.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PP8Nd0Cs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstLZ-00059K-JF
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:24:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fssqb-0007Hu-H9
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 12:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fssqa-0001FN-Au
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 12:52:37 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fssqa-0001El-10
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 12:52:36 -0400
Received: by mail-oi0-x243.google.com with SMTP id b15-v6so10420701oib.10
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VMKucdxxcFKOJsUIYdNaM7UdbBesPxbj6Lq+VMkiZu0=;
	b=PP8Nd0CsLFW1peUmun+iB3UURuZtE0bv6RqhR3DYZDWjosUtDyQiaCk5gcEf+RxSaR
	i3hj60mHmTrqddBps8KL6mqGaz4TJ3vOeDtgQSbvIa7E+gijWy826AS3UCVKcbhqsRR/
	qRPGsmk8f9k4KN3MC7DF5lV9L46nKSYXu9tSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VMKucdxxcFKOJsUIYdNaM7UdbBesPxbj6Lq+VMkiZu0=;
	b=PWbHMOHW9EnPGU5j5piSFQ1b+G9HrIS1kgU3FuvZ3waY6bVqiQ7ltV0rDrNDedNXJy
	L+bwK+9rVjEG9tJb9ukQG5VJ59ZABrSB9O+pPhzrbWnIi6ieIYP3Jt9VY6MRaOLkzqcm
	dbXnIkz9xcRTF9jySCR1dbTcFw/AXLOa9SZhxsAHUGECA68YHR2dKEhwYBntX7aryqLG
	gbLZN03mie26Rq4tNcHgHY20Ikax/HyFu36K+BbWOQ8Ssyw1ZE/XnkKm188WiEgsEMwf
	ro03vIqCX2DAh/voBofABCEk9iuGpB5kMJ14mIQreHZBCoBGm1KWIX7cdN+6cf8q97FX
	TIQw==
X-Gm-Message-State: APzg51Av6zbpKSXdI46y8ouCss23ZEFo067NKsy1WXLq7rINhyitEl8d
	8/QduQmsmaz2Nz5pSihKAFUTRC3KpIEAcKK14O8Qig==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr9974577oif.338.1535043155279; 
	Thu, 23 Aug 2018 09:52:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 09:52:14
	-0700 (PDT)
In-Reply-To: <1535039100-11248-2-git-send-email-gengdongjiu@huawei.com>
References: <1535039100-11248-1-git-send-email-gengdongjiu@huawei.com>
	<1535039100-11248-2-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 17:52:14 +0100
Message-ID: <CAFEAcA9DJ_GMkq1fGUjXJDu9GUM0cd6Pjm1HsXpm5rQ5n78Zew@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v6 2/2] target: arm: Add support for VCPU
 event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DTxphi/qNjPK

On 23 August 2018 at 16:45, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Did you forget to send a cover letter for this patchset?
I didn't see one. Our tooling prefers cover letters for
any patchset with more than one patch in it.

> ---
> Change since v5:
> address Peter's comments:
> 1. Move the "struct serror" before the "end_reset_fields" in CPUARMState
> 2. Remove ARM_FEATURE_RAS_EXT and add a variable have_inject_serror_esr
> 3. Use the variable have_inject_serror_esr to track whether the kernel has state we need to migrate
> 4. Remove printf() in kvm_arch_put_registers()
> 5. ras_needed/vmstate_ras to serror_needed/vmstate_serror
> 6. Check to use "return env.serror.pending != 0" instead of "arm_feature(env, ARM_FEATURE_RAS_EXT)" in the ras_needed()
>
> Change since v4:
> 1. Rebase the code to latest
>
> Change since v3:
> 1. Add a new new subsection with a suitable 'ras_needed' function
>    controlling whether it is present
> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
> ---
>  target/arm/cpu.h     |  7 +++++++
>  target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c | 22 ++++++++++++++++++++
>  3 files changed, 88 insertions(+)


> +static int kvm_put_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events = {};
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    events.exception.serror_pending = env->serror.pending;
> +
> +    if (have_inject_serror_esr) {
> +        events.exception.serror_has_esr = env->serror.has_esr;
> +        events.exception.serror_esr = env->serror.esr;
> +    }

I realised that the effect of this condition is that
if we migrate a VM from a machine which supports specifying the
SError ESR to one which does not, and at the point of migration
there is a pending SError with an ESR value, then we will
silently drop the specified ESR value. The other alternative
would be to fail the migration (by dropping the if() check,
and letting the host kernel fail the ioctl if that meant that
we asked it to set an SError ESR it couldn't manage.)

I guess that's OK? It's all hypothetical currently since
we don't support migration between different host CPU types.

> +
> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
> +}
> +

> +static const VMStateDescription vmstate_serror = {
> +    .name = "cpu/ras",

You forgot to update the name here.

> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = serror_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool m_needed(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu = {
>  #ifdef TARGET_AARCH64
>          &vmstate_sve,
>  #endif
> +        &vmstate_serror,
>          NULL
>      }
>  };
> --

thanks
-- PMM
