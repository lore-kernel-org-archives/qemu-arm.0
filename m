Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp514602wrs;
        Thu, 22 Aug 2019 02:08:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxn07wrnv3RCpoVay4PeuluYK0K+yy6QTxVEbdH9SF++36ZjcuOnOoSxGIRbrKZ22izupc7
X-Received: by 2002:aa7:8705:: with SMTP id b5mr40884987pfo.205.1566464930339;
        Thu, 22 Aug 2019 02:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566464930; cv=none;
        d=google.com; s=arc-20160816;
        b=zM4FNavOC+JEkU4vy+gAeMxWDvQlTaMW7UWbUDEEe0NVjTZ1o4bXV3aDqA/ZAoV7Jd
         vXGZhH1gOn5xETWd4mFhgK+zAVRU25VbPwwInFYSJuE8uvTlUWBSSu3deflVFyepJQOW
         tfIKowdyTmWB1qk5a0bInCsYLfhSVW4+YJTL49ae86jNKY6W/zZDXlzxwHiwULlWtxdp
         C/BhyFdquRlAH8U6iGztGJqA9Proas1IfLq0Z8rCvkBu2WLmFzogaywPQt/t8tAVV6hb
         oi9v4cCFKlq8kDE90VBxlftZyob7HxZVT2xypE6oqm8ImOs6BXmNCVwJ0a9O9D6MPphN
         XQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=lzh3UBQOw/OBoabhJ/V3Q6vKib6lUPSzN7SVI19eQR4=;
        b=j9w3KfONZfqNMuoQVt0mcFD7mFlCdl4ejq7IDo2hKszgxae3B9vlbFnH8PKIp710Rm
         ZTP/VOBYacjmCrcpmKV9ikprFYheQPzSB8/6U4gw5BpE4h2Z+fO7Ju2+jlQN3Q+7cp8F
         +B6gqiBFKEFabOYZTi2O6wHxOulLp/gN0hg6rMbt3JvCjaktmIB/QKOWQ98QCUo9b58L
         XpLpU/M8QSL+SvLatAIzVRX6NVvG6EhLIVGcVkwbR0Iu3evPlS5QKaLT9wgfs3alQSuv
         tI+JIZNxSsROu8UntZA/fUjMuuWxr1U/P9YZLqUp35z1j9IGnica1zliATsifTxQ9bk0
         tfUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si15977356pga.260.2019.08.22.02.08.50;
        Thu, 22 Aug 2019 02:08:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbfHVJIt (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 22 Aug 2019 05:08:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50228 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729284AbfHVJIs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Aug 2019 05:08:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 77D0E308403B;
        Thu, 22 Aug 2019 09:08:48 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F88210016F3;
        Thu, 22 Aug 2019 09:08:45 +0000 (UTC)
Subject: Re: Can we boot a 512U kvm guest?
To:     Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.cs.columbia.edu,
        qemu-arm@nongnu.org
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        suzuki.poulose@arm.com, peter.maydell@linaro.org,
        kvm@vger.kernel.org, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
        zhang.zhanghailiang@huawei.com
References: <86aa9609-7dc9-1461-ae47-f50897cd0875@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <da5c87d6-8b66-75f9-e720-9f1d80a76d7d@redhat.com>
Date:   Thu, 22 Aug 2019 11:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <86aa9609-7dc9-1461-ae47-f50897cd0875@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 22 Aug 2019 09:08:48 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: B9X8LJHqKrI8

Hi Zenghui,

On 8/13/19 10:50 AM, Zenghui Yu wrote:
> Hi folks,
> 
> Since commit e25028c8ded0 ("KVM: arm/arm64: Bump VGIC_V3_MAX_CPUS to
> 512"), we seemed to be allowed to boot a 512U guest.  But I failed to
> start it up with the latest QEMU.  I guess there are at least *two*
> reasons (limitations).
> 
> First I got a QEMU abort:
>     "kvm_set_irq: Invalid argument"
> 
> Enable the trace_kvm_irq_line() under debugfs, when it comed with
> vcpu-256, I got:
>     "Inject UNKNOWN interrupt (3), vcpu->idx: 0, num: 23, level: 0"
> and kvm_vm_ioctl_irq_line() returns -EINVAL to user-space...
> 
> So the thing is that we only have 8 bits for vcpu_index field ([23:16])
> in KVM_IRQ_LINE ioctl.  irq_type field will be corrupted if we inject a
> PPI to vcpu-256, whose vcpu_index will take 9 bits.
> 
> I temporarily patched the KVM and QEMU with the following diff:
> 
> ---8<---
> diff --git a/arch/arm64/include/uapi/asm/kvm.h
> b/arch/arm64/include/uapi/asm/kvm.h
> index 95516a4..39a0fb1 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -325,10 +325,10 @@ struct kvm_vcpu_events {
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER        1
> 
>  /* KVM_IRQ_LINE irq field index values */
> -#define KVM_ARM_IRQ_TYPE_SHIFT        24
> -#define KVM_ARM_IRQ_TYPE_MASK        0xff
> +#define KVM_ARM_IRQ_TYPE_SHIFT        28
> +#define KVM_ARM_IRQ_TYPE_MASK        0xf
>  #define KVM_ARM_IRQ_VCPU_SHIFT        16
> -#define KVM_ARM_IRQ_VCPU_MASK        0xff
> +#define KVM_ARM_IRQ_VCPU_MASK        0xfff
>  #define KVM_ARM_IRQ_NUM_SHIFT        0
>  #define KVM_ARM_IRQ_NUM_MASK        0xffff
> 
> ---8<---
> 
> It makes things a bit better, it also immediately BREAKs the api with
> old versions.
> 
> 
> Next comes one more QEMU abort (with the "fix" above):
>     "Failed to set device address: No space left on device"
> 
> We register two io devices (rd_dev and sgi_dev) on KVM_MMIO_BUS for
> each redistributor. 512 vcpus take 1024 io devices, which is beyond the
> maximum limitation of the current kernel - NR_IOBUS_DEVS (1000).
> So we get a ENOSPC error here.

Do you plan to send a patch for increasing the NR_IOBUS_DEVS? Otherwise
I can do it.

You mentioned you started working on the QEMU fix. Do you plan to submit
patches to the ML or do you want me to attempt to fix the situation on
userspace?

Thanks

Eric
> 
> 
> I don't know if the similar problems have been discussed before in ML.
> Is it time to really support the 512U guest?
> 
> 
> Thanks,
> zenghui
> 
