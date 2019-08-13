Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp59591wrs;
        Tue, 13 Aug 2019 14:45:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwirqIIF8WVH/xBl3aV6PjWJLYhutx0F59Ze/RRLZLLGkWt44FkN9tWtu746f9t4ZfIcZ5g
X-Received: by 2002:a65:514c:: with SMTP id g12mr36233849pgq.76.1565732733436;
        Tue, 13 Aug 2019 14:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565732733; cv=none;
        d=google.com; s=arc-20160816;
        b=wYgvVFhMeqi9oiVi8SRKjn3ysMzLK5aedVYimK0TLuy6rdJMUH0OgpI6G9AQTy1ySd
         lNEvheAFzUl+aFeW6rJGwMfAvcY56p+O38BGtMm/XJBE95cSDZBkWyGXS2NorkOhZQcU
         1JPuZ3uLbiIT6JawkoDT/hcN5xHWO7vFSfvM4zbVFk7J4+Nl/U9BUaS6gD8pyTU09DHO
         56g5meNaQZ/irQ2/X6O7iRC3jtl3exNS+2HRe/E0TSyafFPBHB6J2AKxxJu12TNRFCQm
         qB7sGwjUTvR1BIvtMoCl3Jyoj2zY0Zvt5GlR6Sfw9rgxbdhBy6sWk1WGml2CZzH/FZm5
         bYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=1qzB4AaZKPwCV929JEvg6OCqhfgc5njpSc7EnYsnUrc=;
        b=ZkI8UYwA68ha7x4FPHOLoEosawZWyH5RY+384wIi34CY7B413gz1cpypxFT/TzYzlQ
         HCzzNHxm/VncOKcvXj7/4RLHQVUkJM538Kg3/vIKRtmZx5EiWRuGSvvfiVonq55JHYfH
         La6805aRG5amc2i459Onw1xEmbuhLYr8n5SQtGwD0q9/eL1iUUXffRWkWG6ded6IHlM8
         sXopD26+v3SC+OLVR8rJs6SUdtCjgX8bplz4XWczyFqJT0OTJaIonYXugEZEEi4Y0z6k
         deV817wwv0h/CWa6phkjq8S14N+Bzz29wqTYgpL/eSJLIMocrNkb47c4ldJod1O0595w
         MpYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e62si68813346pfh.254.2019.08.13.14.45.32;
        Tue, 13 Aug 2019 14:45:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfHMVpb (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 13 Aug 2019 17:45:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50948 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfHMVpb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 13 Aug 2019 17:45:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9449C44BCF;
        Tue, 13 Aug 2019 21:45:30 +0000 (UTC)
Received: from [10.36.116.22] (ovpn-116-22.ams2.redhat.com [10.36.116.22])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B26D382AEF;
        Tue, 13 Aug 2019 21:45:12 +0000 (UTC)
Subject: Re: Can we boot a 512U kvm guest?
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>
Cc:     kvmarm@lists.cs.columbia.edu, qemu-arm@nongnu.org,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        suzuki.poulose@arm.com, peter.maydell@linaro.org,
        kvm@vger.kernel.org, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
        zhang.zhanghailiang@huawei.com
References: <86aa9609-7dc9-1461-ae47-f50897cd0875@huawei.com>
 <86d0h9no9j.wl-marc.zyngier@arm.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <a2b12b81-29a8-4ef4-b3ec-e4635e93dc7b@redhat.com>
Date:   Tue, 13 Aug 2019 23:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <86d0h9no9j.wl-marc.zyngier@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 13 Aug 2019 21:45:30 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qOxTqXhDDbi5

Hi,

On 8/13/19 4:17 PM, Marc Zyngier wrote:
> On Tue, 13 Aug 2019 09:50:27 +0100,
> Zenghui Yu <yuzenghui@huawei.com> wrote:
> 
> Hi Zenghui,
> 
>>
>> Hi folks,
>>
>> Since commit e25028c8ded0 ("KVM: arm/arm64: Bump VGIC_V3_MAX_CPUS to
>> 512"), we seemed to be allowed to boot a 512U guest.  But I failed to
>> start it up with the latest QEMU.  I guess there are at least *two*
>> reasons (limitations).
>>
>> First I got a QEMU abort:
>> 	"kvm_set_irq: Invalid argument"
>>
>> Enable the trace_kvm_irq_line() under debugfs, when it comed with
>> vcpu-256, I got:
>> 	"Inject UNKNOWN interrupt (3), vcpu->idx: 0, num: 23, level: 0"
>> and kvm_vm_ioctl_irq_line() returns -EINVAL to user-space...
>>
>> So the thing is that we only have 8 bits for vcpu_index field ([23:16])
>> in KVM_IRQ_LINE ioctl.  irq_type field will be corrupted if we inject a
>> PPI to vcpu-256, whose vcpu_index will take 9 bits.
> 
> Irk. Not great indeed. Clearly, we have a couple of holes in the way
> we test these ABI changes (/me eyes Eric...).

My bad. At that time I was able to test with 224 vcpus with QEMU (256
vcpus were tested as well) and I failed to see those other limitations,
thinking the only limitation left was the number of redistributor
regions we could register.
> 
>>
>> I temporarily patched the KVM and QEMU with the following diff:
>>
>> ---8<---
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h
>> b/arch/arm64/include/uapi/asm/kvm.h
>> index 95516a4..39a0fb1 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -325,10 +325,10 @@ struct kvm_vcpu_events {
>>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
>>
>>  /* KVM_IRQ_LINE irq field index values */
>> -#define KVM_ARM_IRQ_TYPE_SHIFT		24
>> -#define KVM_ARM_IRQ_TYPE_MASK		0xff
>> +#define KVM_ARM_IRQ_TYPE_SHIFT		28
>> +#define KVM_ARM_IRQ_TYPE_MASK		0xf
>>  #define KVM_ARM_IRQ_VCPU_SHIFT		16
>> -#define KVM_ARM_IRQ_VCPU_MASK		0xff
>> +#define KVM_ARM_IRQ_VCPU_MASK		0xfff
>>  #define KVM_ARM_IRQ_NUM_SHIFT		0
>>  #define KVM_ARM_IRQ_NUM_MASK		0xffff
>>
>> ---8<---
>>
>> It makes things a bit better, it also immediately BREAKs the api with
>> old versions.
> 
> Yes, and we can't have that (specially if you consider that this API
> is shared between 32 and 64bit). One "get out of jail card" is to
> steal a few bits from the top of the word, and encode things there:
> 
> diff --git a/arch/arm/include/uapi/asm/kvm.h b/arch/arm/include/uapi/asm/kvm.h
> index 4602464ebdfb..86db092e4c2f 100644
> --- a/arch/arm/include/uapi/asm/kvm.h
> +++ b/arch/arm/include/uapi/asm/kvm.h
> @@ -254,8 +254,10 @@ struct kvm_vcpu_events {
>  #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
>  
>  /* KVM_IRQ_LINE irq field index values */
> +#define KVM_ARM_IRQ_VCPU2_SHIFT		28
> +#define KVM_ARM_IRQ_VCPU2_MASK		0xf
>  #define KVM_ARM_IRQ_TYPE_SHIFT		24
> -#define KVM_ARM_IRQ_TYPE_MASK		0xff
> +#define KVM_ARM_IRQ_TYPE_MASK		0xf
>  #define KVM_ARM_IRQ_VCPU_SHIFT		16
>  #define KVM_ARM_IRQ_VCPU_MASK		0xff
>  #define KVM_ARM_IRQ_NUM_SHIFT		0
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 7b7ac0f6cec9..44cb25bfc95e 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -308,8 +308,10 @@ struct kvm_vcpu_events {
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
>  
>  /* KVM_IRQ_LINE irq field index values */
> +#define KVM_ARM_IRQ_VCPU2_SHIFT		28
> +#define KVM_ARM_IRQ_VCPU2_MASK		0xf
>  #define KVM_ARM_IRQ_TYPE_SHIFT		24
> -#define KVM_ARM_IRQ_TYPE_MASK		0xff
> +#define KVM_ARM_IRQ_TYPE_MASK		0xf
>  #define KVM_ARM_IRQ_VCPU_SHIFT		16
>  #define KVM_ARM_IRQ_VCPU_MASK		0xff
>  #define KVM_ARM_IRQ_NUM_SHIFT		0
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index 90cedebaeb94..fb685c1c0514 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -889,6 +889,7 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
>  
>  	irq_type = (irq >> KVM_ARM_IRQ_TYPE_SHIFT) & KVM_ARM_IRQ_TYPE_MASK;
>  	vcpu_idx = (irq >> KVM_ARM_IRQ_VCPU_SHIFT) & KVM_ARM_IRQ_VCPU_MASK;
> +	vcpu_idx += ((irq >> KVM_ARM_IRQ_VCPU2_SHIFT) & KVM_ARM_IRQ_VCPU2_MASK) * (KVM_ARM_IRQ_VCPU_MASK + 1);
>  	irq_num = (irq >> KVM_ARM_IRQ_NUM_SHIFT) & KVM_ARM_IRQ_NUM_MASK;
>  
>  	trace_kvm_irq_line(irq_type, vcpu_idx, irq_num, irq_level->level);
> 
> It should work because we've been careful not to allow value outside
> of {0, 1, 2} for irq_type. I don't like it, but I really don't feel
> like adding another IRQ related ioctl. We still have 16 irq types
> (which is already a waste of space), and we can go up to 4096 vcpu.

> 
> Peter, what do you think?
> 
>> Next comes one more QEMU abort (with the "fix" above):
>> 	"Failed to set device address: No space left on device"
>>
>> We register two io devices (rd_dev and sgi_dev) on KVM_MMIO_BUS for
>> each redistributor. 512 vcpus take 1024 io devices, which is beyond the
>> maximum limitation of the current kernel - NR_IOBUS_DEVS (1000).
>> So we get a ENOSPC error here.
> 
> I can reproduce that issue here ("499 vcpus on my Chromebook,
> baby"). Not an ABI problem though, and we can bump it up if that's
> needed.
> 
>> I don't know if the similar problems have been discussed before in ML.
>> Is it time to really support the 512U guest?
> 
> The real question is "why the hell would you want to do that?" ;-)
> Seriously, I'm very interested in finding out what is the use case for
> these gigantic VMs, other than debugging the kernel for big machines.

The initial goal was to keep up with the HPC physical cpu count increase
and allow similar numbers as x86 supports.

Thanks

Eric (with limited internet access atm)

> 
> Thanks,
> 
> 	M.
> 
