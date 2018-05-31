Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5641256wre;
        Thu, 31 May 2018 01:05:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLIEReytmZNfmL2i05oxj1oPxbXiAF2woZ1MKulzRnvKFJQfIGI9fpsBlMQUEU13HANsi0Q
X-Received: by 2002:a0c:8842:: with SMTP id 2-v6mr5616129qvm.117.1527753957290;
        Thu, 31 May 2018 01:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527753957; cv=none;
        d=google.com; s=arc-20160816;
        b=oRqaS1T/Tr7nt6E0q/xozjD6ftHWzYqADZAdtxc7Fpv2dAlOiVL7aOtcU9t9c+rtDT
         2OyClxYSa1Dpekjfgwi0L6sTKH+yE9/0wCpYY+99ReunyZt5KCjKDlJS7kXvPSF1AXnA
         VJvLDzB97jRCfZ/lj7MAMRPYupzxZmH602qekm0EZdDpa7G0q5cp4aBSbVHLV8pCjg0G
         WKAGM7q6XS962PB4Ulp1NtTrGTl6fZV+V6MnTysrK2Sn/J5yMXmuVRter/MhYYrVE9hB
         TXBIAbu9sCk36dyXQVC1xE/agQRX+dWcNvmtidJRMPHrIAj+LjobdOFCb9xCUjZ9hGof
         nACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=Q0h5z0s9xbBiDlKg9YhBUjygn6RgpmvJiRmczpP8KgI=;
        b=pYNqNX5hpXmZ0Pear53bXFtuSvGjJ7v+91UcV9coEBju3d1clvYzJJVVnVtew8JS+1
         wUHrXIqikdwYA0AUYHlvctLmxnB+vOqCFGLkH6JEw67q/STdTR8fsbI3KXVDmVogLqKh
         cql89oxnxGjyP/HI2sVIGJzvJUlJHMndYm10Ux2pzf5D08xxBW7eXfW4UXH48MpC4AhY
         vjOyhA4FGBfxJht8awSsdCVwzgk02BW6xeJqF3WohG37sa4QPMaVToQ9jxUmhd9pw/oW
         105uQjeeBs27mekdlxS9bJVVWSc+aDxQEurRqsuhT0Uy/45TeXCzAaCcWjtDPfD5eort
         Nl9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17-v6si3089966qvl.117.2018.05.31.01.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 01:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOIap-0000Wj-SZ
	for alex.bennee@linaro.org; Thu, 31 May 2018 04:05:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOIah-0000SZ-56
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOIad-0002Ey-3T
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:05:47 -0400
Received: from [45.249.212.32] (port=37404 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOIac-0002Dm-Ms; Thu, 31 May 2018 04:05:43 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 78A6EABE0D835;
	Thu, 31 May 2018 16:05:37 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.382.0; Thu, 31 May 2018
	16:05:29 +0800
Message-ID: <5B0FAC9E.6090306@huawei.com>
Date: Thu, 31 May 2018 16:04:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, <qemu-arm@nongnu.org>
References: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
	<84171c12-e281-8de5-ec3d-ac0aaf3c3dbb@redhat.com>
In-Reply-To: <84171c12-e281-8de5-ec3d-ac0aaf3c3dbb@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] KVM: GIC: Fix memory leak due
 to calling kvm_init_irq_routing twice
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHRoFtkhwtwp



On 2018/5/31 15:54, Auger Eric wrote:
> Hi Shannon,
> 
> On 05/31/2018 09:16 AM, Shannon Zhao wrote:
>> kvm_irqchip_create called by kvm_init will call kvm_init_irq_routing to
>> initialize global capability variables. If we call kvm_init_irq_routing in
>> GIC realize function, previous allocated memory will leak.
>>
>> Fix this by deleting the unnecessary call.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> openpic_kvm seems to suffer the same leak. Don't you want to fix it as
> well?
> 
I have a look at below patch of openpic_kvm which says on ppc it doesn't
call kvm_irqchip_create. So no such issue for it.

commit d85937e683f6ff4d68293cb24c780fb1f6820d2c
Author: Scott Wood <scottwood@freescale.com>
Date:   Wed Jun 12 15:32:51 2013 -0500

    kvm/openpic: in-kernel mpic support

> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
Thanks.

> Thanks
> 
> Eric
>> ---
>>  hw/intc/arm_gic_kvm.c   | 1 -
>>  hw/intc/arm_gicv3_kvm.c | 1 -
>>  2 files changed, 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
>> index 6f467e6..204369d 100644
>> --- a/hw/intc/arm_gic_kvm.c
>> +++ b/hw/intc/arm_gic_kvm.c
>> @@ -572,7 +572,6 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
>>  
>>      if (kvm_has_gsi_routing()) {
>>          /* set up irq routing */
>> -        kvm_init_irq_routing(kvm_state);
>>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>>          }
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index 001d82b..aa4c7c5 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -813,7 +813,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>  
>>      if (kvm_has_gsi_routing()) {
>>          /* set up irq routing */
>> -        kvm_init_irq_routing(kvm_state);
>>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>>          }
>>
> 
> .
> 

-- 
Shannon

