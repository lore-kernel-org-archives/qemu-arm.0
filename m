Received: by 10.25.208.211 with SMTP id h202csp2258307lfg;
        Tue, 29 Mar 2016 13:04:53 -0700 (PDT)
X-Received: by 10.140.220.207 with SMTP id q198mr5539895qhb.103.1459281893213;
        Tue, 29 Mar 2016 13:04:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s141si332340qhb.115.2016.03.29.13.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akzsi-0007KF-OZ
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 16:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzsf-0007K2-NM
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzse-0004Yj-Jk
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:04:49 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akzse-0004Ye-Ec
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 16:04:48 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k1so34027041vkb.0
	for <qemu-arm@nongnu.org>; Tue, 29 Mar 2016 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OxsreiH6y8RyxWm00ENkqaLv31csX/mwimhn4ir4iQM=;
	b=IoU4wgyIHTT/bJo7keVZwy7/3UsF41CycXMumPwZdHEuXiRlZl7oHg6OxtJxdv+mvV
	YQH3rekMtKLN8tughk4UekP+Ih/zPAv2D/rYGG3hnj3O292Thxb74XwDtAJuMKFdVQce
	ZlwBkeP+eFOtSwVYUYtK4veBK63xRFz+NXei0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OxsreiH6y8RyxWm00ENkqaLv31csX/mwimhn4ir4iQM=;
	b=B+uHsDs7papfd2abaxp+mbApiYVReDTi5RajhifNI74L/5trEoHfP662fXKUzm4tus
	FF69tUZ+LRSxq5Ctp3+TZfv0tEm4qDvAi41wzwxZ2wGZkEVBqsUZ5Z0tLqoZs0J6l1Ow
	pT5bR8RyLAhR/OVToBjIVXbOXgCAUqwRXvWuuIn0HrShK0XGrf41dFImy2OpKI0RfBD+
	a6yLKLCs++NTec13FTieYp/u0K8r1l3Wmq0LhbtTYJzg0XUbWkItlYOzRPQTqnSQD4l3
	bKYjm/jD3f6AWUWLy35lxMsTwaGqyiklkq1m2lN4eYbu8s14MPTeH2HZyuFNKUjjaUx2
	Axkg==
X-Gm-Message-State: AD7BkJKuPKAHUaq76WV5mjl5dswwXm2hZZ3j701GinTRVV7jzkpJEQv4h3QxIOGZn0nRsPnY8AWxsEX13f+eoZuo
X-Received: by 10.31.8.17 with SMTP id 17mr2447792vki.139.1459281887992; Tue,
	29 Mar 2016 13:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 29 Mar 2016 13:04:28 -0700 (PDT)
In-Reply-To: <1458788142-17509-3-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
	<1458788142-17509-3-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2016 21:04:28 +0100
Message-ID: <CAFEAcA9wbburAMbLL5=B4LKbmpe0T9mUa2fbXDgrDsCCfrBEKw@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Andrew Jones <drjones@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
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
X-TUID: 7xoXWmqLRqdk

On 24 March 2016 at 02:55, Peter Xu <peterx@redhat.com> wrote:
> Some more lines to make sure we allow NULL for 1st/3rd parameter.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
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

aka "treat a NULL cpus_to_retry like an empty list".

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

"preferred". Better phrased as "a NULL pointer is treated like an
empty array", I think.

>   * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
> - * @init: filled in with the necessary values for creating a host vcpu
> + * @init: filled in with the necessary values for creating a host
> + * vcpu. If NULL is provided, will not init the vCPU.
>   *
>   * Create a scratch vcpu in its own VM of the type preferred by the host
>   * kernel (as would be used for '-cpu host'), for purposes of probing it
> --
> 2.4.3
>

(I'll fix this up in target-arm.next, it's a minor nit.)

thanks
-- PMM
