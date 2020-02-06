Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp833077lfp;
        Wed, 5 Feb 2020 17:45:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyadaR2Cb8r+YfOSPMETrgWe8E4BBS1Lbd/fNAE2p1uG/9lKGq0uja8qxiSmuDIvqSWHKVM
X-Received: by 2002:aed:2284:: with SMTP id p4mr570242qtc.329.1580953521414;
        Wed, 05 Feb 2020 17:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580953521; cv=none;
        d=google.com; s=arc-20160816;
        b=hMV00egR3d/Vs4x/HG/TqtsTMG6BLHbIA8K4UMCyKUXw67MOyhf1qJtkXOyJAflsUL
         ItdP93utsShd1EN1GIC3JBwd6v2t3bTrYFgZZYRzCY2IEgF8a4UDcCE4nHbCJERvv3Ip
         monNcBngf2PKz3J+8UcAh3B6ZTRa/HnNrqOgGn3BqYexfkr2JFecvWZOoZGQ50Rs4+Br
         ITIACambBLpmKZnRUDXN3ep+H/lyk/tP342ao5cagWgK9m4xWdUl+q2mTTM0cn8ZEikI
         7uHPBeVn/BRoeGCAjEGBtRYbXSplMYKP3rA/HNW46sCvuEJCS1jMQiEc0xCcDxVF5rBN
         ouWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=E69Rquzj4694IAYggYvrfuCfUib3c+4kWK02HXqiHE4=;
        b=LZoExbEJmhRK2JbY3sA8MrCJSQQ4rhgHffSNCfq5+AM9o7tw2aqrRq0c4hRDVRxeEq
         saIWYkLbWAXR6pi5BE4JOm/ynVi8tFK79wqViGWJH79GT4pVt/nfDIo85jdEqwdjJGSl
         nIYVY5wmZFeRjPEOGGJ/6pJmfKuFfXdPubaxGd9U1ne4eMtJrLh0HGUWa1KShGTNAJmE
         MusIu8ZmI1AlOoYf6BNtCwpvX17St0eETUPR6SvpcQjowhiCNiOPs5reFXWCx4ikVYwj
         Ot6e4Ij4ST9boRQRHdjCuBgx4y5zkEfLpT3gzHOYlngXBY1DQeKgjVk2d5JMPHSUBV4/
         j0NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20si798866qvq.67.2020.02.05.17.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izWEK-00031r-R2
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1izVqM-0003M6-EO
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1izVqL-0002A6-Cd
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:20:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2697 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1izVqL-0001Xg-1P; Wed, 05 Feb 2020 20:20:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 371BABC200ABA29A102D;
 Thu,  6 Feb 2020 09:20:28 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 6 Feb 2020 09:20:20 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Marc Zyngier <maz@kernel.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
Date: Thu, 6 Feb 2020 09:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <350aa4ca1b57a466ed882236caf23051@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.173.221.228]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James
 Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YcCQwHg/nHKV

Hi Marc,

On 2020/2/5 21:15, Marc Zyngier wrote:
> Hi Heyi,
>
> On 2020-02-04 08:26, Heyi Guo wrote:
>> Update Marc's email address.
>>
>> +cc Gavin as he is posting a RFC for ARM NMI.
>>
>> Hi Marc,
>>
>> Really sorry for missing to update your email address, for the initial
>> topic was raised long time ago and I forgot to update the Cc list in
>> the commit message of the patches.
>>
>> Thanks Gavin for forwarding current discussion on ARM NMI to me.
>>
>> For you said SDEI is "horrible", does it mean we'd better never
>> implement SDEI in virtual world? Or do you have any advice on how to
>> implement it?
>
> My concern is that SDEI implies having EL3. EL3 not being virtualizable
> with KVM, you end-up baking SDEI in *hardware*. Of course, this hardwar=
e
> is actually software (it is QEMU), but this isn't the way it was=20
> intended.

>
> It's not the first time we've done that (PSCI is another example), but=20
> the
> logic behind SDEI looks much more invasive.

Thanks for your comments.

Thinking about them for quite a while, below is my understanding, please=20
correct me if I'm wrong:

So should the KVM based virtual machine be treated as one with CPUs only=20
having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model, isn't i=
t?

PSCI only contains some one-shot operations, so it is much less invasive=20
than SDEI.


I've another question. The origin of "virtual" SDEI requirement comes=20
from the lack of hard lockup detector in VM. We can have some kind of=20
watchdog, but how can the watchdog trigger the VM OS to panic and run=20
kdump, even in irq-off state?

Thanks,

Heyi

>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M.

