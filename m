Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5056419lfp;
        Tue, 4 Feb 2020 00:26:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEXRy42K0XkE15dGklHWzIXkaF/Jv0pxCdekRcW6eQXNeMxu2KapgG1eMj/VUV65BDW59h
X-Received: by 2002:a05:6214:8cb:: with SMTP id da11mr25456130qvb.228.1580804810557;
        Tue, 04 Feb 2020 00:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580804810; cv=none;
        d=google.com; s=arc-20160816;
        b=L33IEyp0q9L6xcMmU8fqY7P/O+fmfBrrqDgA+E9RA/Hle4UbFu6qxEUJ0jKNLr94ym
         Xg/wLBZVXZS6bFm6WNqgucRILLHGotP4Bnt7GuBt/22ekkmR3AUY5rVsbqKX4lm5Ce8C
         Ommj3hLEzvtAjRWILeIYY9Erqa6UmeqZ/mXjSWXGydqMRsS75a4rMR5L//2HNENh/syN
         ZjhgVpwchR71GcFKsT9+fGGVHojxyxGbAwFnKnCnF0TDYFiQp4XnNrv/5UGcjlr+4D2N
         /nSFZIkqKF0D9CsooZmVWCI343+fZevnLED07og34M3UBgGuuJhxAs1HBwgWaATJ2tsr
         gGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:references:to
         :from:subject;
        bh=Q5q58ygUjfCtGDPY8iV73EShAuIE6ROOYCmYEWGyZFc=;
        b=YAyd2D8smsA2IHgtFrLeH+oebZx1ZyCJH4BJ5O4IOq2J2Zxp99lOkOTDSqkaPUw2ye
         Z2mcCs1mIDdA+KiPDr/kd7hi08ErsvmtUyjwB6awVy2VrEcoBsgf+8x5oUe1cES84Gg1
         1txF2j/Z9IIOfIcVXi2eS1iYH84XaKsVf006zjLwH5BUBK3/i9xdXyyCa+S3rGYlEEOC
         TI61EEQhRakkzkI0NIB/WzIsEFlwoaK3j8hozqMLEC0hEyUL6WpoWTNyf4CbjKKF6wM+
         ZEmEWO+xb7TbIkm/KN/fY3VJuFk4K3OXs2Q+FtAkECRVNuPwjtuui6LfXM2iEZJ9gg2F
         dPOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si12916640qtq.348.2020.02.04.00.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 00:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iytXl-0003uK-Pt
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 03:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iytXd-0003uD-PK
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 03:26:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iytXc-0002ZC-54
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 03:26:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2695 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iytXb-000234-PQ; Tue, 04 Feb 2020 03:26:40 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B34012DCF8D3F3559FC9;
 Tue,  4 Feb 2020 16:26:32 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
 Tue, 4 Feb 2020 16:26:22 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
From: Heyi Guo <guoheyi@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
Message-ID: <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
Date: Tue, 4 Feb 2020 16:26:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gc489j6XD1QM

Update Marc's email address.

+cc Gavin as he is posting a RFC for ARM NMI.

Hi Marc,

Really sorry for missing to update your email address, for the initial=20
topic was raised long time ago and I forgot to update the Cc list in the=20
commit message of the patches.

Thanks Gavin for forwarding current discussion on ARM NMI to me.

For you said SDEI is "horrible", does it mean we'd better never=20
implement SDEI in virtual world? Or do you have any advice on how to=20
implement it?

Thanks,

Heyi

On 2019/12/23 16:20, Guoheyi wrote:
> Hi Peter,
>
> Really appreciate your comments.
>
> For other platforms/boards emulated in qemu, like omap, imx*, etc, are=20
> they just TCG platforms? Can we just enable security and EL3 emulation=20
> for these platforms instead of implementing copies of firmware=20
> interfaces in qemu? Also I think it is possible to optimize the code=20
> to support all KVM enabled virtual boards with one single copy of SDEI=20
> code, so at least the duplication of code inside qemu might be avoided.
>
> I can understand your concerns; the exsiting SDEI code in ARM Trusted=20
> Firmware also tempted me when I started to writing the code in qemu. I=20
> agree the ideal way is to use the existing firmware directly, but how=20
> can we achieve that? Either I don't think it is good to modify the=20
> firmware code too much, for firmware should be kept simple and reliable=
.
>
> Does James or Marc have any idea?
>
> Thanks,
>
> Heyi
>
> =E5=9C=A8 2019/12/20 21:44, Peter Maydell =E5=86=99=E9=81=93:
>> On Tue, 5 Nov 2019 at 09:12, Heyi Guo <guoheyi@huawei.com> wrote:
>>> SDEI is for ARM "Software Delegated Exception Interface". AS ARM64=20
>>> doesn't have
>>> native non-maskable interrupt (NMI), we rely on higher privileged=20
>>> (larger
>>> exception level) software to change the execution flow of lower=20
>>> privileged
>>> (smaller exception level) software when certain events occur, to=20
>>> emulate NMI
>>> mechanism, and SDEI is the standard interfaces between the two=20
>>> levels of
>>> privileged software. It is based on SMC/HVC calls.
>>>
>>> The higher privileged software implements an SDEI dispatcher to=20
>>> handle SDEI
>>> related SMC/HVC calls and trigger SDEI events; the lower privileged=20
>>> software
>>> implements an SDEI client to request SDEI services and handle SDEI=20
>>> events.
>> Hi; I read through these patches last week, but I didn't reply
>> then because although there are some aspects to the design that
>> I don't like, I don't have a clear idea of what a better approach
>> to the problems it's trying to solve would be. However I didn't
>> want to go home for the end of the year without providing at
>> least some response. So I'm going to lay out the parts I have
>> issues with and perhaps somebody else will have a good idea.
>>
>> The first part that I dislike here is that this is implementing
>> an entire ABI which in real hardware is provided by firmware. I
>> think that QEMU's design works best when QEMU provides emulation of
>> hardware or hardware-like facilities, which guest code (either
>> in the kernel, or firmware/bios running in the guest) can then
>> make use of. Once we start getting into implementing firmware
>> interfaces directly in QEMU this rapidly becomes a large amount
>> of work and code, and it's unclear where it should stop. Should
>> we implement also the equivalent of firmware for omap boards?
>> For imx* boards? For the raspberry pi? For xilinx boards?
>> Are we going to end up reimplementing more of ARM Trusted Firmware
>> functionality inside QEMU? The code to implement firmware-equivalent
>> ABIs in all these boards would I think quickly become a large part
>> of the codebase.
>>
>> My second concern is that to do the things it wants to do,
>> the implementation here does some pretty invasive things:
>> =C2=A0 * intercepting interrupt lines which ought to just be
>> =C2=A0=C2=A0=C2=A0 emulated hardware signals between devices and the G=
IC
>> =C2=A0 * capturing register values of other CPUs, and arbitrarily
>> =C2=A0=C2=A0=C2=A0 stopping those other CPUs and making them run other=
 code
>> =C2=A0=C2=A0=C2=A0 at a later point in time
>> I'm really uncomfortable with what's just an 'emulated firmware'
>> interface for one specific board model doing this kind of thing.
>>
>> Finally, the stated rationale for the patchset ("we'd like an
>> emulated NMI equivalent") doesn't really feel to me like it's
>> strong enough to counterbalance the amount of code here and
>> the degree to which it's moving us into a swamp I'd prefer
>> it if we could stay out of.
>>
>> I'd be much happier with a design where QEMU provides simple
>> facilities to the guest and the guest firmware and kernel
>> deal with making use of them. I appreciate that it's not
>> clear how that would work though, given that in real hardware
>> this works by the firmware running at EL3 and KVM not
>> providing a mechanism that allows guest code that runs at
>> a higher (effective or emulated) privilege level than the
>> guest kernel...
>>
>> thanks
>> -- PMM
>>
>> .

