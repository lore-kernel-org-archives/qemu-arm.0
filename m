Received: by 10.28.91.67 with SMTP id p64csp4772636wmb;
        Wed, 21 Mar 2018 01:01:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELufEvAOzQbaazjRjvDGMffPsMAcwXIcKRzYBDGEK6sibJpUhve/diUrDwO9dx4J3svmeo/H
X-Received: by 10.55.100.20 with SMTP id y20mr20871756qkb.21.1521619304193;
        Wed, 21 Mar 2018 01:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521619304; cv=none;
        d=google.com; s=arc-20160816;
        b=rqgDRaTPrC5I3zTHSXQVdE4HA+asTCYZzU2SWyooMu/2vualBihfbN20E5nBOxPshM
         lLVMmGlcdVekklEfjrTQNskOSUdOApskdGTkQvUqJAgLwhUUGJHpGp8wi0HtvNIGAWhS
         JJOWGkXxf/r1PqoFM1I5fyMDpHpmqb10Gg9Rniwa7F3f2LXo8665/F80JJse4H23uJe3
         82MAfFQQwYraSXFFzOeJOqS9wmR4Yjby5mkoi1p5lYyIruGNJ97iDZcFsuHg3D4IzHsU
         XHQ8xT2y0ngwqpXyIGH8WDA5wwElWdQUl0xS/aWxjjLVufE+hbSDL4/dHnBCNYyCQytF
         NEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=8YfqMtixBSMtGVxYioew4KA2FEeBV6dLJSDjQtC+Uwk=;
        b=mJR9m7w9Dv7MzSLvMMVmda6L+hfdrx9FgBGLITMil+Zrep4eu7WfyJeTK9lasx+Sr1
         8UUnwPvwrtok1vjJYDHMbsUhhAoRYepyvxlIc3OWXbbn+HiiUwvnviQBgpmU3Ht+UTdC
         zCH6H8X2dvMPWmmXQ4AgY4zeEiS94kjpz9oIIUbJmV1m70+4XynKG4jCpuXBAbtB5M0V
         ZHfjbXju6m9HBEkCbxhvx96sOw3prVNDX+f3AMyJbxXpjKNt10a8+mcSsnE0AeyvtIfF
         vq6lIcfoVisgz/ug1NpjNwl9FIAoMsapBKaIkqeuDxZbKrVGm20XR40TtADQ+wvdGF6h
         Z+rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f93si4989998qkh.166.2018.03.21.01.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 01:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyYgp-0002TJ-Lj
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 04:01:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyYgd-0002Ss-Oc
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 04:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyYgZ-0006kl-TH
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 04:01:31 -0400
Received: from [45.249.212.32] (port=59883 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyYgZ-0006hH-IK; Wed, 21 Mar 2018 04:01:27 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E02AF8687BF99;
	Wed, 21 Mar 2018 16:01:19 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.361.1; Wed, 21 Mar 2018
	16:01:16 +0800
Message-ID: <5AB21130.2020309@huawei.com>
Date: Wed, 21 Mar 2018 16:00:48 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zjlqvaMPQlh



On 2018/3/20 19:54, Peter Maydell wrote:
> On 20 March 2018 at 11:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>
>>
>> On 2018/3/20 19:22, Peter Maydell wrote:
>>> On 20 March 2018 at 07:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>>>> accordingly. This will overlap the GICR registers value and leave the
>>>> last GIC_INTERNAL irq's registers out of update.
>>>>
>>>> Fix this by skipping the registers banked by GICR.
>>>>
>>>
>>> I'm still not entirely sure what the underlying problem
>>> you're trying to fix is...
>>>
>>> Do we fail to correctly migrate a VM without this change?
>>> Does the code work on some host CPU/GIC implementations but
>>> not others? Is this just improving efficiency by avoiding
>>> doing some unnecessary work?
>>>
>> When we reboot a VM and before entering uefi or guest kernel, we expect
>> all these registers staying at the initial state. But currently these
>> registers of the last 32 irqs are not reset. For example, the PRIORITY
>> of irq from 32 to 255 is 0 but the PRIORITY of irq from 256 to 287 is
>> 0xa0(Linux kernel set the PRIORITY to 0xa0 by default).
>>
>> When migrating a VM, since we don't save and restore the registers of
>> the last 32 irq, so the PRIORITY is 0 while we expecting 0xa0.
>> And also it will overlap the PRIORITY of SGIs and PPIs.
>>
>> We don't fail to migrate a vm since currently we don't use the last 32
>> irqs in virt machine. But the bug is still there.
> 
> Oh, I see, the number of registers we transfer is accounting
> for the first N registers in the bank not being used, but the
> first register offset to transfer wasn't.
> 
> Can you still successfully migrate a VM from a QEMU version
> without this bugfix to one with the bugfix ?
> 
I've tested this case. I can migrate a VM between these two versions.

Thanks,
-- 
Shannon

