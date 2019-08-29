Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1562740wrs;
        Wed, 28 Aug 2019 19:55:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFfv//MYYcEOt+vj8mN8P+JyHGDDkqRIAXRbWQ973VJLUc70lHN5goG6I+NZqmjM/pEf6J
X-Received: by 2002:ad4:496b:: with SMTP id p11mr1434983qvy.29.1567047323568;
        Wed, 28 Aug 2019 19:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567047323; cv=none;
        d=google.com; s=arc-20160816;
        b=S06247Uza7OHnh2VLcm/b4yL+kocaLMvNmhLZNXST98EvFWSthbeyYIwCt+mAQZB7D
         I//Zdl12FvHTIdNyvZd21hNrtAeaub7+rRNznk/ZQf0voa8WMjZ8/3yuqC7oPaastuE7
         sDbvzNrzWAUBfMYcZSsig3nanNL8XMjz6rYDn6d9R4tUYf3UWAtzjvDVgMTFwb5/4FeP
         /6zqDJFzzqDFY+BZEBtsdHemVTQHnYbpL2kJvD9HsU3AqWMCyCOqx+WGhJFn8ypfIrBf
         6JexzTlMCEVMv3Ioqrhi4/fF5ryjCLz9Eg8yHxoYZJMtwEST5bF9G9/pGcwJx6rMSGct
         lg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=vcrcZrSrxdd2EuSxk79WIrwhEgiL6Ap2F26NbhLqZFo=;
        b=1EwKW9KZ1+9NeXjIlccMTSNSqKJcnH5E3kJIXirLGZwhKLX8uVGKgUNwkBrHc4POT8
         dSmzTn0+1SmJgUuryCpkBWvW6oSzoHfgLAsymiwZ34sMs6gvaDLT8rdoR6/csBfdEcsS
         JJ2MLhXv8upBPr98nT/0zq08F8EtfGaWuIKGybaas8ZAr/skPPDYL8jbKH26/YRVdfO0
         0ypaQzaQCuhbhxDTEcJGqPyDop2j93pqzzOjoO15O9CYTRtjjNLExu/kgp01NTvpkUJ2
         89Z1Wbrf2nic0klVx6KGXGOU5gFR3CCmi7z/kKYhn+TwuHn8ghejLzmOI0Ks1FP4keUz
         15Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si816053qta.166.2019.08.28.19.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 19:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Aao-0000Gv-Vd
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 22:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzenghui@huawei.com>) id 1i3AaY-0000Gg-QU
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 22:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuzenghui@huawei.com>) id 1i3AaU-0002pV-S4
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 22:55:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41688 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuzenghui@huawei.com>)
 id 1i3AaT-0002hs-VI; Wed, 28 Aug 2019 22:55:02 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B5D5EFFF1EAD691909A8;
 Thu, 29 Aug 2019 10:54:55 +0800 (CST)
Received: from [127.0.0.1] (10.184.12.158) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 29 Aug 2019
 10:54:47 +0800
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-3-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
Date: Thu, 29 Aug 2019 10:53:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20190827160554.30995-3-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.12.158]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [RFC 2/3] intc/arm_gic: Support PPI injection for
 more than 256 vpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ga4snfyJqxRq

Hi Eric,

On 2019/8/28 0:05, Eric Auger wrote:
> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
> allow injection of PPIs along with vcpu ids larger than 255. Let's
> encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
> ABI when needed.
> 
> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
> message.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   hw/intc/arm_gic_kvm.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index b56fda144f..889293e97f 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -56,6 +56,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
>        * CPU number and interrupt number.
>        */
>       int kvm_irq, irqtype, cpu;
> +    int cpu_idx1 = 0, cpu_idx2 = 0;
>   
>       if (irq < (num_irq - GIC_INTERNAL)) {
>           /* External interrupt. The kernel numbers these like the GIC
> @@ -63,17 +64,20 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
>            * internal ones.
>            */
>           irqtype = KVM_ARM_IRQ_TYPE_SPI;
> -        cpu = 0;
>           irq += GIC_INTERNAL;
>       } else {
>           /* Internal interrupt: decode into (cpu, interrupt id) */
>           irqtype = KVM_ARM_IRQ_TYPE_PPI;
>           irq -= (num_irq - GIC_INTERNAL);
>           cpu = irq / GIC_INTERNAL;
> +        cpu_idx2 = cpu / 256;
> +        cpu_idx1 = cpu % 256;
>           irq %= GIC_INTERNAL;
>       }
> -    kvm_irq = (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
> -        | (cpu << KVM_ARM_IRQ_VCPU_SHIFT) | irq;
> +    kvm_irq = (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) |
> +              (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
> +              ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) << KVM_ARM_IRQ_VCPU2_SHIFT) |
> +              irq;
>   
>       kvm_set_irq(kvm_state, kvm_irq, !!level);
>   }
> 

For confirmation, should we also adjust the vcpu_index in
arm_cpu_kvm_set_irq(), just like above?


Thanks,
zenghui

