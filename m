Received: by 10.25.208.211 with SMTP id h202csp500735lfg;
        Thu, 24 Mar 2016 02:13:46 -0700 (PDT)
X-Received: by 10.55.80.136 with SMTP id e130mr8973175qkb.28.1458810826216;
        Thu, 24 Mar 2016 02:13:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si5728092qka.117.2016.03.24.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 02:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj1Kr-0005rt-OO
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 05:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aj1Kj-0005r6-Gf
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 05:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aj1Ke-0003Of-FG
	for qemu-arm@nongnu.org; Thu, 24 Mar 2016 05:13:37 -0400
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232]:34465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aj1Ke-0003OR-72; Thu, 24 Mar 2016 05:13:32 -0400
Received: by mail-lf0-x232.google.com with SMTP id c62so26503445lfc.1;
	Thu, 24 Mar 2016 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DtcYZusdfELl1GJOGqn1Y+gXtP1XxAwimfRKFdKi3go=;
	b=vXoKxeu73990Pbg3flUM/7VimRd9J7/Hn/1Lh4/kOwEIlmPm3Pa7wE4XOyll32oO/r
	p/PPtjIbkFPM7VvAKdnRc0a9RJ0foIcvuw2uAOd0ukRJeqrqnEFmhg5x58RXHVFkGxnw
	fxN4ZeAlSb8BMaDPVfxjA1U0rL74tiBq80Jiz4G5lGBnwSEbEKEe9E91dUt504fqWLql
	vnRCCeQ0+fb9ZllxkdoRaXvPo7l4a4smGxMJ+Yn2zRtKGaQZR2yoUcEtcvokXhNcGZF/
	LDIoPQVGJjatgtXsxtknBCGHIlVWD4T8G8u2yQ+74yuCpT+dwVyh0CKuynCkVEemFPoP
	cvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DtcYZusdfELl1GJOGqn1Y+gXtP1XxAwimfRKFdKi3go=;
	b=ZJiZfCpbWtMkzHLhd+JtC0A3qjOPnMwSPVPBCZJr4eGCJNGseMHaiB8MB6XfMq3d1D
	PZBJ0vY+yoMHdEwh4HChLusjpxWkQJH1H+5k2g0cTs07wgFKr+B3px+Wu90qekmdqlrU
	G/wKkeWZZKUAIxPrT/XGOA2wqj5H7JCFEOtj4YzIyCad+5ociJCWxOy6+B3+WkBixEcj
	kgi/SWMkwvxB8X9SkAH2gPe5vusuHNOVIJeJh22xh7ImM2v9bwUIlKZO7/knlPGdB7r+
	i3fGeO3woa+lrS88JyzPCQHAlXbIsLIjbi6ga5deBPmG0f4oH8/lflWriBbhECLxD7PY
	S9mw==
X-Gm-Message-State: AD7BkJKw3Q/oLJH+68ogDU9wzOhQ0AKk1JI9FaCsF3M0r67FQKTzAIHnVtmz4CmKpg6e5Q==
X-Received: by 10.25.138.5 with SMTP id m5mr2968941lfd.28.1458810810766;
	Thu, 24 Mar 2016 02:13:30 -0700 (PDT)
Received: from [192.168.0.56] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	m187sm1058655lfg.3.2016.03.24.02.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 02:13:29 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
	<1458788142-17509-3-git-send-email-peterx@redhat.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F3AFB9.5040704@gmail.com>
Date: Thu, 24 Mar 2016 12:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458788142-17509-3-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::232
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [PATCH v7 2/4] arm: enhance
	kvm_arm_create_scratch_host_vcpu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E+x0cstEWeyV

On 24/03/16 05:55, Peter Xu wrote:
> Some more lines to make sure we allow NULL for 1st/3rd parameter.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Sergey Fedorov <serge.fdrv@gmail.com>

Kind regards,
Sergey

> ---
>  target-arm/kvm.c     | 14 +++++++++++++-
>  target-arm/kvm_arm.h |  6 ++++--
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index 969ab0b..bb6935e 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -62,13 +62,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto err;
>      }
>  
> +    if (!init) {
> +        goto finish;
> +    }
> +
>      ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
>      if (ret >= 0) {
>          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>          if (ret < 0) {
>              goto err;
>          }
> -    } else {
> +    } else if (cpus_to_try) {
>          /* Old kernel which doesn't know about the
>           * PREFERRED_TARGET ioctl: we know it will only support
>           * creating one kind of guest CPU which is its preferred
> @@ -85,8 +89,16 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          if (ret < 0) {
>              goto err;
>          }
> +    } else {
> +        /*
> +         * Here, we got init != NULL but cpus_to_retry == NULL,
> +         * meanwhile, we failed to probe one preferred target type
> +         * (no matter what). So we fail.
> +         */
> +        goto err;
>      }
>  
> +finish:
>      fdarray[0] = kvmfd;
>      fdarray[1] = vmfd;
>      fdarray[2] = cpufd;
> diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
> index 07f0c72..4f01a99 100644
> --- a/target-arm/kvm_arm.h
> +++ b/target-arm/kvm_arm.h
> @@ -124,9 +124,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
>   * kvm_arm_create_scratch_host_vcpu:
>   * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
>   * QEMU_KVM_ARM_TARGET_NONE) to try as fallback if the kernel does not
> - * know the PREFERRED_TARGET ioctl
> + * know the PREFERRED_TARGET ioctl. If NULL is provided, will try
> + * to use perferred target, and fail if no preferred found.
>   * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
> - * @init: filled in with the necessary values for creating a host vcpu
> + * @init: filled in with the necessary values for creating a host
> + * vcpu. If NULL is provided, will not init the vCPU.
>   *
>   * Create a scratch vcpu in its own VM of the type preferred by the host
>   * kernel (as would be used for '-cpu host'), for purposes of probing it

