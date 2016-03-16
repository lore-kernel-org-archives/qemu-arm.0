Received: by 10.25.208.211 with SMTP id h202csp1089599lfg;
        Wed, 16 Mar 2016 03:31:03 -0700 (PDT)
X-Received: by 10.140.172.212 with SMTP id s203mr4039561qhs.41.1458124263266;
        Wed, 16 Mar 2016 03:31:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13si2661315qka.120.2016.03.16.03.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 03:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag8jG-0001ZZ-Jw
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 06:31:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8jC-0001Ui-Tg
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8jB-00048h-PJ
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:30:58 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8jA-00048D-HU
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:30:57 -0400
Received: by mail-vk0-x22e.google.com with SMTP id c3so55800782vkb.3
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1f4jCzBu+g6wzPD+5LcPdzeXY4D55bqWiVaM6kVXwsM=;
	b=PizykZrg3gm54ZqckpLPtNzUfjx+XylPjsWY4sRWagt6sBHaLERgsZU5RdN77+s1Zz
	clWdd2C3rOxwIG5vZGuGWHEtAXDH+cydTuuVaYJv7W8/qmXIwzp5jxScBd8mb2Rkx4qY
	fTLmCAxAx9Wnm0CqowybUt1jLcqZ39uucE4PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1f4jCzBu+g6wzPD+5LcPdzeXY4D55bqWiVaM6kVXwsM=;
	b=JHYJvyG7ZLernUXAQNCuZ3ZYXG2YzzLu8jJ7aAaFNkOP1E1HNVmkT+ACE4Yl++D3r6
	F07OzRppGK5CTnNsnSXJvZuYbko81Zs5OlyPGj2BhQOIwfmVvzKzKj4XhPadPLyOJNPP
	TOVBaKtZZ1ukdQvfnsrwTlojTREu5XcQuWKojvxyWC2SZFj6V7WQdLP/jMaHRaABYYCt
	4mPKr/Ik6aEp8G3xmLKBAVJiqGutWFYeHOV39y7sbUn0L8C+IpSmZsjjBgw6bXP4aGGr
	9frmnIpW/eB0IMu3tGKyoCO1QYzI1lkdwP6lzmeswh4lu+XdFLkcJhmIup7WwcoQipFQ
	P5eQ==
X-Gm-Message-State: AD7BkJJHPf2qdQ8ksPfIqfPdVaTkZjuTjw/IcMLYCJZhXXx7+gHJJFWtTdxvTKVKWuz9zn/9iB46pIHKSvHd9WPH
X-Received: by 10.31.52.147 with SMTP id b141mr3379455vka.82.1458124256160;
	Wed, 16 Mar 2016 03:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 03:30:36 -0700 (PDT)
In-Reply-To: <1457422582-28799-4-git-send-email-peterx@redhat.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-4-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 10:30:36 +0000
Message-ID: <CAFEAcA9zjVEvswjrHnnefHJKrtA1CWoTs+dWwV-hMVZunZ6RfA@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 3/3] arm: implement query-gic-capabilities
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
X-TUID: IVY0p0gzZ2Pm

On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> For emulated GIC capabilities, currently only gicv2 is supported. We
> need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
> VM, we detect the capability bits using ioctls.
>
> When probing the KVM capabilities, we cannot leverage existing helper
> functions like kvm_create_device() since QEMU might be using TCG while
> probing (actually this is the case for libvirt probing). So, one
> temporary VM is created to do the probing.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  target-arm/machine.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 813909e..8f52f74 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -1,3 +1,5 @@
> +#include <linux/kvm.h>

This will break compilation on non-Linux hosts; you can't include
linux headers like this.

(This is all in the wrong file anyway, machine.c is for migration.)

> +#include <sys/ioctl.h>
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/boards.h"
> @@ -347,7 +349,97 @@ const char *gicv3_class_name(void)
>      exit(1);
>  }
>
> +static GICCapability *gic_cap_new(int version)
> +{
> +    GICCapability *cap = g_new0(GICCapability, 1);
> +    cap->version = version;
> +    /* by default, support none */
> +    cap->emulated = false;
> +    cap->kernel = false;
> +    return cap;
> +}
> +
> +static GICCapabilityList *gic_cap_list_add(GICCapabilityList *head,
> +                                           GICCapability *cap)
> +{
> +    GICCapabilityList *item = g_new0(GICCapabilityList, 1);
> +    item->value = cap;
> +    item->next = head;
> +    return item;
> +}
> +
> +#ifdef CONFIG_KVM
> +/* Test whether KVM support specific device. */
> +static inline int kvm_support_device(int vmfd, uint64_t type)
> +{
> +    struct kvm_create_device create_dev = {
> +        .type = type,
> +        .fd = -1,
> +        .flags = KVM_CREATE_DEVICE_TEST,
> +    };
> +    return ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev);
> +}
> +#endif

This is not ARM specific so it should go in kvm-all.c.

> +
>  GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>  {
> -    return NULL;
> +    GICCapabilityList *head = NULL;
> +    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
> +
> +    v2->emulated = true;
> +    /* FIXME: we'd change to true after we get emulated GICv3. */
> +    v3->emulated = false;
> +
> +#ifdef CONFIG_KVM

KVM specific code should be factored out and live in one of
the target-arm/kvm*.c files.

> +    {
> +        int kvm_fd = -1;
> +        int vmfd = -1;
> +        /*
> +         * HACK: here we create one temporary VM, do the probing,
> +         * then release it properly.
> +         */
> +        kvm_fd = qemu_open("/dev/kvm", O_RDWR);
> +        if (kvm_fd == -1) {
> +            /* KVM may not enabled on host, which is fine. */
> +            goto out;
> +        }
> +
> +        do {
> +            /* For ARM, VM type could only be zero now. */
> +            vmfd = ioctl(kvm_fd, KVM_CREATE_VM, 0);
> +        } while (vmfd == -EINTR);
> +
> +        if (vmfd < 0) {
> +            goto kvm_fd_close;
> +        }

Rather than open-coding this you might as well use
kvm_arm_creat_scratch_host_vcpu() (you don't need the vcpu fd but
it's pretty harmless to create it.)


> +
> +        if (ioctl(kvm_fd, KVM_CHECK_EXTENSION,
> +                  KVM_CAP_DEVICE_CTRL) <= 0) {
> +            /* older version of KVM possibly */
> +            goto kvm_vmfd_close;
> +        }

Do this in kvm_support_device() [mostly just to parallel how
kvm_create_device() does it.]

> +
> +        /* Test KVM GICv2 */
> +        if (kvm_support_device(vmfd, KVM_DEV_TYPE_ARM_VGIC_V2) >= 0) {
> +            v2->kernel = true;
> +        }
> +
> +        /* Test KVM GICv3 */
> +        if (kvm_support_device(vmfd, KVM_DEV_TYPE_ARM_VGIC_V3) >= 0) {
> +            v3->kernel = true;
> +        }
> +
> +kvm_vmfd_close:
> +        close(vmfd);
> +kvm_fd_close:
> +        close(kvm_fd);
> +out:
> +        ;
> +    }
> +#endif
> +
> +    head = gic_cap_list_add(head, v2);
> +    head = gic_cap_list_add(head, v3);
> +
> +    return head;
>  }
> --
> 2.4.3

thanks
-- PMM
