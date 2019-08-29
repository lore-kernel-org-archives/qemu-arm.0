Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1532985wrs;
        Wed, 28 Aug 2019 19:11:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnARVg+/6QaDCmjOrZ75uz9iGaYfkBFO139sq9tdpmqXSo+fIrj1Mz+/B/NKL3kM4yS7Ss
X-Received: by 2002:ae9:edd3:: with SMTP id c202mr7177708qkg.347.1567044685184;
        Wed, 28 Aug 2019 19:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567044685; cv=none;
        d=google.com; s=arc-20160816;
        b=JkhYhSaFYZ6xzvj/7m3PelqacqjnbvYZdtT90Vh6iMAB4g0+jsIePTYQrxEO5Ok5aX
         L4mQn6+yrBB/xAbV1VtNVyqD5aTCFSv8AvTApQjiR4ABZaonXIxjJ93hltQzfOwhos24
         bJZUdsxTyzzD1f+ukHNx1XQ8r6ItF8+hcyl6DEi6tNXe6jxHxjPIl2YI5HLlZCbU8ZmX
         4GBoLusw/esDZohmX5ZWRY85FgQbfckJEIcTorJHKM8qdyjALmvSIEU52N8TYaG2k15u
         uMLhCgr2RCOJVWcyAcxCyU19YI8VZu+bDY7vDx31t8vATXuNL7Kt3LgtIv9A0aQ9gjVF
         kUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=LHmw0UQAEeFEscsH3z4oXZNOXA61tO0MP2zqSM88APM=;
        b=EF0S5HQkd7uljjNp4H6TC9An4gfAdAp/7LZlxjDBPVS7/MCz9b6eYR7eAXRiS4p5FJ
         HgQ5pCB4lqo4vPlit4k6ZDbfZyqWnCmaMzhH0bwaa+9qT9I/Do756z64Moxj5DoabaJq
         /96fm6sUTeAzRKA4FRpte9Co+r/EIaXn1ot1O+1J0l0+bkj8h5xgV3wb6I6et60sBVIZ
         /W/QkZzn9eF44GYK1WSVg5ia9IKY/fWg4PBPPnaIfWzxNYDLNitgeBGyYPJ81RvuyBPm
         JDk0mVSnIjJkqbqbGeQlh/gugKzWljBEkB2YgzzLHYLGyNyW1TTj4xUZVEHW+VpgwZS0
         wxkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w31si870249qvf.189.2019.08.28.19.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 19:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i39uG-0000aD-Ke
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 22:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzenghui@huawei.com>) id 1i39u6-0000Wq-9m
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 22:11:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuzenghui@huawei.com>) id 1i39u5-00078G-4h
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 22:11:14 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2257 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuzenghui@huawei.com>)
 id 1i39u4-00074q-R6; Wed, 28 Aug 2019 22:11:13 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9E8565E696147CB115BC;
 Thu, 29 Aug 2019 10:11:05 +0800 (CST)
Received: from [127.0.0.1] (10.184.12.158) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 29 Aug 2019
 10:10:59 +0800
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
References: <20190827160554.30995-1-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <2b9f6028-117b-f3da-e40b-3e5e217ad826@huawei.com>
Date: Thu, 29 Aug 2019 10:06:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20190827160554.30995-1-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.12.158]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [RFC 0/3] KVM/ARM: Fix >256 vcpus
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
X-TUID: 2tdew6VgTIUk

Hi Eric,

On 2019/8/28 0:05, Eric Auger wrote:
> Since 4.18, KVM/ARM exposes a KVM_MAX_VCPUS equal to 512. However it was
> reported [1] that a VM with more than 256 vcpus cannot be launched. 5.4
> is about to fix the situation with 2 patches:
> - one upgrade of the KVM_IRQ_LINE API [2] supporting a vcpu id encoded
>    on 12 bits,
> - the reduction of KVM IO devices consumed by each GICv3 redistributor [3]
> 
> This series uses the new KVM_IRQ_LINE API and also checks the associated
> capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2) in machvirt.
> 
> Without the series, as soon as the -smp arguments exceeds 256, QEMU exits
> with "kvm_set_irq: Invalid argument".

For the series:

Tested-by: Zenghui Yu <yuzenghui@huawei.com>

together with [2], [3].

> 
> Best Regards
> 
> Eric
> 
> References:
> [1] Can we boot a 512U kvm guest?
>      https://patchwork.kernel.org/patch/11091501/
> [2] [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for KVM_IRQ_LINE
>      https://patchwork.kernel.org/patch/11099609/
> [3] [PATCH] KVM: arm/arm64: vgic: Use a single IO device per redistributor
>      https://patchwork.kernel.org/patch/11112141/
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc-v1
> 
> Eric Auger (3):
>    linux headers: update for KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
>    intc/arm_gic: Support PPI injection for more than 256 vpus
>    virt: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256

Thanks,
zenghui

