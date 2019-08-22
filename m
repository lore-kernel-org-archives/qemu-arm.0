Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp533857wrs;
        Thu, 22 Aug 2019 02:29:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzC3Qzx+E2hWV4HSwFGWhcC+s2sdhiiWrAV7c+xQW2EKqbLaxomkPPykVxmWrMwJQdzUR+H
X-Received: by 2002:a17:902:9b90:: with SMTP id y16mr35043506plp.17.1566466164063;
        Thu, 22 Aug 2019 02:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566466164; cv=none;
        d=google.com; s=arc-20160816;
        b=KRVzCWJWBOJbScOqy0IGIADB4K3j/4u3p0GJSa+BL6K1KSZgVUw6/VL2HTjv9DZ56Q
         O6iF2T6iZMjFOOsw8IHG3Yi+pxWEIwzhUat9T6jkxK3mxvZjbRYHLpjsrLk3TATkTILj
         05weQtUDoTXXgsnZDdVcWCa3RhIhXfM008eKobCSDPpGBeF1mz1XZvHZcGePrrxTsRjZ
         8eEDO4R6sU1+CwIaqvgDmbjTqZfke8JsCmLb34REPOQYJnX5QtHn4qmh911Q1PDNKakS
         +baK/Yq0YP6Romfi788aBF8rIcIL+tn73HQ5+W4XOFpzv1N495Yxqmch78En1yn7EoKq
         Ct6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:cc:to:subject;
        bh=+FllBbow5Fl054B9YsCNKUjKc/ejDYEr42q7aIPZtMc=;
        b=kDlaTuIxtSpg/rbm53OvfkXOJcyXRDhDSZ9C3A+3wcGVvaln0pCC4ekhHGAGLhHlgD
         ul1rYA9PZnzw4gmfDzcHRzrqy9iYBmuJkL0GFSO6Kf5LYVo5IP1gQgWFxtbwE8vtBmXs
         Ffrw8YGiP9HCnEzQ9w5vaUplP0PHWddAmWO60TVnv/LkmyTdNJ4N9/JpHk+EMWWLfTte
         bJsU5mDt6U9w6gqUkUaWB1D4edP9EZBbVA5g9ba5Omx3WEvhLtwiAi8byqDHNQUQkX+2
         P6YG6owriXypJqv/m9PxiEZ9wKFMGc1WhRomEfGSHBp9Z/9jj46SNPumD2pKbdA6vvHv
         u0hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w13si17744336pfi.181.2019.08.22.02.29.23;
        Thu, 22 Aug 2019 02:29:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731609AbfHVJ3X (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 22 Aug 2019 05:29:23 -0400
Received: from foss.arm.com ([217.140.110.172]:42122 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731373AbfHVJ3W (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Aug 2019 05:29:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9B2360;
        Thu, 22 Aug 2019 02:29:22 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93FFA3F246;
        Thu, 22 Aug 2019 02:29:20 -0700 (PDT)
Subject: Re: Can we boot a 512U kvm guest?
To:     Auger Eric <eric.auger@redhat.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        kvmarm@lists.cs.columbia.edu, qemu-arm@nongnu.org
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        suzuki.poulose@arm.com, peter.maydell@linaro.org,
        kvm@vger.kernel.org, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
        zhang.zhanghailiang@huawei.com
References: <86aa9609-7dc9-1461-ae47-f50897cd0875@huawei.com>
 <da5c87d6-8b66-75f9-e720-9f1d80a76d7d@redhat.com>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <fbeb47df-7ea2-04ce-5fe3-a6a6a4751b8b@kernel.org>
Date:   Thu, 22 Aug 2019 10:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <da5c87d6-8b66-75f9-e720-9f1d80a76d7d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: q4SFkr2L1owp

Hi Eric,

On 22/08/2019 10:08, Auger Eric wrote:
> Hi Zenghui,
> 
> On 8/13/19 10:50 AM, Zenghui Yu wrote:
>> Hi folks,
>>
>> Since commit e25028c8ded0 ("KVM: arm/arm64: Bump VGIC_V3_MAX_CPUS to
>> 512"), we seemed to be allowed to boot a 512U guest.  But I failed to
>> start it up with the latest QEMU.  I guess there are at least *two*
>> reasons (limitations).
>>
>> First I got a QEMU abort:
>>     "kvm_set_irq: Invalid argument"
>>
>> Enable the trace_kvm_irq_line() under debugfs, when it comed with
>> vcpu-256, I got:
>>     "Inject UNKNOWN interrupt (3), vcpu->idx: 0, num: 23, level: 0"
>> and kvm_vm_ioctl_irq_line() returns -EINVAL to user-space...
>>
>> So the thing is that we only have 8 bits for vcpu_index field ([23:16])
>> in KVM_IRQ_LINE ioctl.  irq_type field will be corrupted if we inject a
>> PPI to vcpu-256, whose vcpu_index will take 9 bits.
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
>>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER        1
>>
>>  /* KVM_IRQ_LINE irq field index values */
>> -#define KVM_ARM_IRQ_TYPE_SHIFT        24
>> -#define KVM_ARM_IRQ_TYPE_MASK        0xff
>> +#define KVM_ARM_IRQ_TYPE_SHIFT        28
>> +#define KVM_ARM_IRQ_TYPE_MASK        0xf
>>  #define KVM_ARM_IRQ_VCPU_SHIFT        16
>> -#define KVM_ARM_IRQ_VCPU_MASK        0xff
>> +#define KVM_ARM_IRQ_VCPU_MASK        0xfff
>>  #define KVM_ARM_IRQ_NUM_SHIFT        0
>>  #define KVM_ARM_IRQ_NUM_MASK        0xffff
>>
>> ---8<---
>>
>> It makes things a bit better, it also immediately BREAKs the api with
>> old versions.
>>
>>
>> Next comes one more QEMU abort (with the "fix" above):
>>     "Failed to set device address: No space left on device"
>>
>> We register two io devices (rd_dev and sgi_dev) on KVM_MMIO_BUS for
>> each redistributor. 512 vcpus take 1024 io devices, which is beyond the
>> maximum limitation of the current kernel - NR_IOBUS_DEVS (1000).
>> So we get a ENOSPC error here.
> 
> Do you plan to send a patch for increasing the NR_IOBUS_DEVS? Otherwise
> I can do it.

I really wonder whether that's a sensible thing to do on its own.

Looking at the implementation of kvm_io_bus_register_dev (which copies
the whole array each time we insert a device), we have an obvious issue
with systems that create a large number of device structures, leading to
large transient memory usage and slow guest start.

We could also try and reduce the number of devices we insert by making
the redistributor a single device (which it is in reality). It probably
means we need to make the MMIO decoding more flexible.

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
