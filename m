Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1872727wrp;
        Thu, 12 Sep 2019 01:57:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmul0E0eqOiM6tSOU5XOxgPYLVGibV55hT5LYaEaV0rG48n6S9m62DHFn/oRu7EY5G404+
X-Received: by 2002:a37:de17:: with SMTP id h23mr3801642qkj.307.1568278646472;
        Thu, 12 Sep 2019 01:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568278646; cv=none;
        d=google.com; s=arc-20160816;
        b=azhnfGgjrRcleB4TEuf09HrLAKu3QT2rz6lDEtlNX/T7masqt7qACRo+iTl4QiBTra
         99q6VfqWfDGyQmnaQJIuJ9aUcuEKkd8Se9cldtn04uO+JJTiZesniZIM7frwBrZmS99a
         cLUiOtWcyVKh9TtrX0Xr+dkthvVSU847nj3tNx+vQfcFKF8Q3amPAvQea9ook9rKlYDJ
         RzKJSEeqVCECeTkprZvSj4Jh4IMjc4xkHqyZiH2jHchcPHbPkEb56a2tH3xqhLMAVroY
         2xL9wfcn8T3YruXdmJNTwBGeeEqnHKwy8gNZM/3S5NsNw9zkgryl2leKgeWb2EPoekSc
         K57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=L2+lCPw2dACOtrAN/IUmh8XH7fC3e9VtqMWbv1GBeZI=;
        b=GMxEMzKg/L2QbGyqoX8FEaqVJ42go3xgMmgN3TNpBr1U8fVFzZlqPYsPpmcrwcBeoW
         9qgyKr9aNPEWhff6lkPa9U35NFzF2A5yILcC9WdhHdiofjOENN/EFe7AQ4ZAC8NMckph
         urKFT4nxmZOQdY69wXkPp+HyJLpNDL6VVHWE/zyfuV2AxAHseIQ6zMLw5ZidP2q3snYZ
         q8bC7FeI4qzrh75YqIGOFgyFRzHCvRkMGFeVlPqGdpti6us++J10EaNDTt0TLlD5P87n
         0Fi8gRvgJkLld7f7d7RUiIBXaP31/Ddts+LzOZ/OcJ/tYSQl7x/EHRpdnkwVTBkawlM6
         BH0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y48si18582209qta.45.2019.09.12.01.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 01:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Kur-0007Xd-KZ
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 04:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8Kuh-0007V4-G7
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 04:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8Kuf-0003ic-Gt
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 04:57:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8Kuf-0003iL-BR; Thu, 12 Sep 2019 04:57:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 577AF308212D;
 Thu, 12 Sep 2019 08:57:12 +0000 (UTC)
Received: from [10.36.116.238] (ovpn-116-238.ams2.redhat.com [10.36.116.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0985DA5B;
 Thu, 12 Sep 2019 08:57:10 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-4-eric.auger@redhat.com>
 <CAFEAcA-tZJ2C8=ZH5e7tXzigPu3SGjSJbnLybZTG+hZO-7ZV0A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1b849672-31a6-3d8d-b8ea-254e737e3b80@redhat.com>
Date: Thu, 12 Sep 2019 10:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-tZJ2C8=ZH5e7tXzigPu3SGjSJbnLybZTG+hZO-7ZV0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 12 Sep 2019 08:57:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uo3t7uETkgWD

Hi Peter,
On 9/12/19 10:42 AM, Peter Maydell wrote:
> On Wed, 11 Sep 2019 at 16:51, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=512
>> for ARM. The actual capability to instantiate more than 256 vcpus
>> was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
>> vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
>> a single KVM IO device instead of 2.
>>
>> So let's check this capability when attempting to use more than 256
>> vcpus.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c        |  4 ++++
>>  target/arm/kvm.c     | 21 +++++++++++++++++++++
>>  target/arm/kvm_arm.h | 15 +++++++++++++++
>>  3 files changed, 40 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 0d1629ccb3..465e3140f7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1575,6 +1575,10 @@ static void machvirt_init(MachineState *machine)
>>          virt_max_cpus = GIC_NCPU;
>>      }
>>
>> +    if (kvm_arm_irq_line_layout_mismatch(MACHINE(vms), max_cpus)) {
>> +        exit(1);
>> +    }
>> +
> 
> Is there really no place to put this check in common code?
Not sure what you mean by common code here? Do you mean in a common code
for ARM machines (I don't think we have any atm) or directly in
kvm_init(). I did not want to pollute this latter with this ARM specific
fix.

Thanks

Eric

> 
> thanks
> -- PMM
> 
