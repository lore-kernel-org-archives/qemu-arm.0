Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2197498wrt;
        Thu, 17 Jan 2019 11:37:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN68Zez+8Gbe2yWfl1bUa7kIlHEhFHrNv3q+Xk1wcRL70iyqTUwpoMKmzOEc2gJKJkJi8gr4
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr12774187wmr.7.1547753847888;
        Thu, 17 Jan 2019 11:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547753847; cv=none;
        d=google.com; s=arc-20160816;
        b=cU4jvVuINwjDNWOwj7JJQQ7REvvSYAYxLlTBJfaxRH7iF3kFmbu7h7HfEhvmSBRvBq
         arGMNd/M25ZsiguINNQHKKF05oJWszp5ah1NlK98qpjoV3rOBdPNYayfLA2skj1RjL8m
         3XXldwUB/wFMXDGmLcaAf9EJ87SHyLcS7ApDGzfrtEQ4v9YJfjFBcvpMDWXVXidu6gtM
         lCmREMxrz1U2NEnhLCJFi5uL3wSYydoYWyGWp9jGmVvmXyNlGz78G18b+qBT2hrnVzGt
         ITg8tNVx61uWildTkjDMEV85eFEYqjc67WmTBw76f+MBolZrHa7s1eoGpZGGWDvTmiCB
         L+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gflyLJGqnnzlTuSRncEPmdW0z8iPlEB7nOzDKrEMzCE=;
        b=tUjgvYgBUZAyeh9cE5XogQGrQcUQmkX76dPlz9xRrDIrSKHzcnUNxTlIbAg1O2NM+X
         zeXm7QxpjZvcG2t/TBBSwapCYErFk1vaDvITR1PuEwG7s82TCZrE7HajnyHCIAhJxYXX
         sGQCqs6em5CWJZkrsIBgh/tVLuuyTpI9KX/BcNfmr83N5ORwQ3C4cnBduQfLZgrpL93f
         IZ5NG7V7RupKInoLNdA7LmrlXBB4oqR3AQKgS8I2RrRc9Bc9ja6jnoUhaRIRmzX5NcyD
         oAPglpJYk1JpCATPROZl4pF4BYTMczWRH326JWLVmiTELfPp0NSK2LPwiZlmNwt7rJkD
         twfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J9S5A5dm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c189si25630088wmd.73.2019.01.17.11.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 11:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J9S5A5dm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkDTi-0004Cy-Sf
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 14:37:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkDTR-0004Bj-4E
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 14:37:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkDTQ-00088f-5V
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 14:37:09 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkDTP-00086t-B1
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 14:37:08 -0500
Received: by mail-oi1-x242.google.com with SMTP id a77so7098882oii.5
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 11:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gflyLJGqnnzlTuSRncEPmdW0z8iPlEB7nOzDKrEMzCE=;
	b=J9S5A5dmbqIF2ppVtKCS+nFn439V3HezQUhr/qLTHvExV/rND8Pofn+YteA4BTkO4d
	EloeNQ3sGnCrkfUDHJpoSn+TPXed86a3Oj5GUL5ImPKh9HZSgFxTpToxzrj4qRqOuvoP
	cHGAmlgAd6ReSbM8Tqkz2oD8Z0hYDbLsG6a18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gflyLJGqnnzlTuSRncEPmdW0z8iPlEB7nOzDKrEMzCE=;
	b=HRnns3FWFVD8z8xgVt6LtRjMubU5iJWY8f2RmqqzeC8JY7PpDWz0mEYkLru9SHKf7U
	6P6Y8uqIEk+ywMxeIaK0x2EaKD/TnfTKD+iU8MCCuPhyrGk3WnANH/GQhtP6BzTBCSwb
	E1mgxJHAkz58XCM/4df8M3ppeh1IO7mNz90SAdHlCZZD1FzuckPOfulwSt2ZqPYe/qF+
	aCHs0WxdCX2GYGda2kTPeZJkRjRDfwo9/pcz5UJvHra/lbYpuQeCBALyHvpha6UVZ54O
	LAJvb5ErGWSEgpeTab9XMbNz+5HtfIdPHYQ+C0//6h5xCF+qdhAxQWoulb6DcuSE6R3y
	bEtg==
X-Gm-Message-State: AJcUukdONJk8cUk+Yg3+3I6x6KLSoeIyc4CPk/nBwWlSLZXnKuek5xHS
	C1eSBJYKIHu+bdN4G0+amRCv2Nsab3DjjalfX/gvGQ==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr1908065oih.112.1547753825683;
	Thu, 17 Jan 2019 11:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20190117030917.18844-1-shannon.zhaosl@gmail.com>
In-Reply-To: <20190117030917.18844-1-shannon.zhaosl@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jan 2019 19:36:54 +0000
Message-ID: <CAFEAcA8w-JSvCcU70W63Yr_L0ZS44H26LPrPn4TgL=rW+2FULQ@mail.gmail.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] ARM: GIC: error out early when creating
 VGICv2 failed
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
X-TUID: PQ1o7LiaIM98

On Thu, 17 Jan 2019 at 03:09, Shannon Zhao <shannon.zhaosl@gmail.com> wrote:
>
> Currently if creating a gicv2 VM on the platform without
> VGICv2 support, it failed in kvm_arm_pmu_set_irq while
> trying to set the interrupt number for PMU with below
> error message.
> KVM_SET_DEVICE_ATTR failed: Invalid argument
>
> This error log is a little confused. Also it should error
> out in kvm_arm_gic_realize early.
>
> Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>  hw/intc/arm_gic_kvm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index a611e8e..b4f2133 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -554,8 +554,9 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
>                                KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true,
>                                &error_abort);
>          }
> -    } else if (ret != -ENODEV && ret != -ENOTSUP) {
> -        error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
> +    } else if (ret != -ENOTSUP) {
> +        error_setg_errno(errp, -ret, "error creating in-kernel VGIC, maybe "
> +                                     "vGICv2 not support on this platform");
>          return;
>      }

Shouldn't we be able to tell specifically whether the
vGICv2 is not supported on this platform, without
having to emit an error message that says "we got
some error, maybe it was that there's no vGICv2
support but maybe it was something else" ?

It's not clear to me what the various
possible kvm_create_device returns are. We have
I guess several cases:
 * new device control API supported, vGICv2 supported:
   return >= 0
 * new device control API not supported at all (ie
   old host kernel version): return some error, which one?
 * new device control API supported, but vGICv2 not
   supported: return some error, which one?
 * new device control API supported, vGICv2 supported,
   but something unlikely went wrong in the kernel:
   return any other error

What are the errnos for the middle two cases, and can
we end up with userspace code that can distinguish
these four cases rather than merging some of them
together?

thanks
-- PMM
