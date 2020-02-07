Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp566958lfp;
        Fri, 7 Feb 2020 05:18:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsVZSSeWr1ZaOtYH3dZokhbcVK4qQ9NUsoiFqRBhojBFUHPASC8NUaszbTS9K2G3+Q+FL9
X-Received: by 2002:ac8:1835:: with SMTP id q50mr6998331qtj.210.1581081505753;
        Fri, 07 Feb 2020 05:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581081505; cv=none;
        d=google.com; s=arc-20160816;
        b=n4O+wXUS81AG6uP1NzsELkEsI+hSi+W6l3GHHubfEqAyFgR2tPwaRWIjf6KRNFWD/n
         pPLt/l+6M2n816hhucOFhgFo9wtwFi5EvZu9rPkPKUNvOLb8UDLhOaTsswKnSiBOFMa/
         3oEwNKFrxtpccVEGaHgqdUuZh/E4ZIFOPHlR4FH7PfEvN1ZMtBKigJiNKZVxbpJQBIJ0
         e6fGTX821Mo75XV3+/lFLdpnzUWHgk8W4/MpfqnRQAFatzGzwJ1AfIqG7L56x7vbChhO
         yrvXW70tzZe68zPBRHq1W2Xqjehin+8EYbcwTBP9Qqonb2vefW4kJUwT+DXurcTwnmdf
         zfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=ZmZW+dAeMW8YQzGob0AORwEoPAH3C1vm/LAmWkBsM7M=;
        b=IPyOKF4uXBWxA4W5FV51KlTyu6IOBDQs0Cxk6m0dJXSGqF0RgBbPySwUZO+3yDKQ+u
         EG1v58rX8UK36KB/oC4nX0GAaepLq5mFAXqSfio5+l3/0Fh6Io/PY/sxERdzAx6iNdEM
         ylsvZdBXOLQDbKbfngTNm73ijmwf1s0Zx9A6aBV9nqJvmncPJQxrAgcRx48rm/33vfcU
         e0abz9fhEmIJ5SM0enfdGK8/QsMJCQ/5qrICus1agSdIF6hP95qyz2ndR1dZmi8AQi6g
         4trxkvfH+l6ngNSLqwQLUbVbnpmUD9jDB3RXf2JvXGwPXAXMytXinAnrWWoWAJTB8CNo
         BKtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si1347871qtj.64.2020.02.07.05.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:18:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03Wb-00035W-4X
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1j03WS-00035I-UI
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:18:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1j03WR-0001HH-Mu
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:18:16 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:38246 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1j03WR-0001Au-A0; Fri, 07 Feb 2020 08:18:15 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3B0F73F34A8B2E1395DD;
 Fri,  7 Feb 2020 21:18:07 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 7 Feb 2020 21:17:58 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Marc Zyngier <maz@kernel.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
 <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
 <f8394aafb2adb513186cd2784a1cb077@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <659a85d2-07e0-ad33-a2c0-99f21fc24ef8@huawei.com>
Date: Fri, 7 Feb 2020 21:17:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f8394aafb2adb513186cd2784a1cb077@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.173.221.228]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-TUID: Lg1bhQvsKlb5


On 2020/2/7 1:30, Marc Zyngier wrote:
> On 2020-02-06 01:20, Heyi Guo wrote:
>> Hi Marc,
>>
>> On 2020/2/5 21:15, Marc Zyngier wrote:
>>> Hi Heyi,
>>>
>>> On 2020-02-04 08:26, Heyi Guo wrote:
>>>> Update Marc's email address.
>>>>
>>>> +cc Gavin as he is posting a RFC for ARM NMI.
>>>>
>>>> Hi Marc,
>>>>
>>>> Really sorry for missing to update your email address, for the initi=
al
>>>> topic was raised long time ago and I forgot to update the Cc list in
>>>> the commit message of the patches.
>>>>
>>>> Thanks Gavin for forwarding current discussion on ARM NMI to me.
>>>>
>>>> For you said SDEI is "horrible", does it mean we'd better never
>>>> implement SDEI in virtual world? Or do you have any advice on how to
>>>> implement it?
>>>
>>> My concern is that SDEI implies having EL3. EL3 not being virtualizab=
le
>>> with KVM, you end-up baking SDEI in *hardware*. Of course, this=20
>>> hardware
>>> is actually software (it is QEMU), but this isn't the way it was=20
>>> intended.
>>
>>>
>>> It's not the first time we've done that (PSCI is another example),=20
>>> but the
>>> logic behind SDEI looks much more invasive.
>>
>> Thanks for your comments.
>>
>> Thinking about them for quite a while, below is my understanding,
>> please correct me if I'm wrong:
>>
>> So should the KVM based virtual machine be treated as one with CPUs
>> only having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model,
>> isn't it?
>
> Well, that's exactly what it is (until we have nested virt, in which ca=
se
> you will be able to add NS-EL2 to the mix).
>
>> PSCI only contains some one-shot operations, so it is much less
>> invasive than SDEI.
>>
>>
>> I've another question. The origin of "virtual" SDEI requirement comes
>> from the lack of hard lockup detector in VM.
>
> Sure. But nothing guarantees that the guest is going to register a SDEI
> entry point anyway.
>
>> We can have some kind of
>> watchdog, but how can the watchdog trigger the VM OS to panic and run
>> kdump, even in irq-off state?
>
> Nothing. All the events, including SDEI, are maskable, one way or=20
> another.

Indeed...

>
> Gavin's approach to inject a SError is probably OK for Linux, given tha=
t
> it tends to run with PSTATE.A=3D=3D0. But that's not a guarantee either=
 (if
> you take a recursive exception, SError won't be delivered).
>
> The long and the short of it is that there is no way to do what you wan=
t
> with absolute guarantees on the ARM architecture. It just doesn't exist=
.

Much appreciate your explanation and advice.

Thanks,

Heyi

>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M.

