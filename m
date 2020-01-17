Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9182290lff;
        Thu, 16 Jan 2020 17:55:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6XZW2gaxJR40uAtSo+8tS3U9X1w74+zN3vUjXCqsOMzkHJ32iD9cVyq8AoEGXvLFDbyxT
X-Received: by 2002:a0c:f748:: with SMTP id e8mr5605992qvo.233.1579226125728;
        Thu, 16 Jan 2020 17:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579226125; cv=none;
        d=google.com; s=arc-20160816;
        b=Zcq2Qy8ucN8NwKESRWdMLd4dp6VVBGIrWi7Vr0l2indnmhV4/326eoUQSRf4uyZocZ
         10ProKm5a+64PS/dc5NGR5lS9WfP5X2d/kq6ORVrGl8v9Cy89KCp2AoZ1R9TEZRx5f3y
         XGib405U6GNlVfKEiM/i1/gq/52c1dUmgf9EXL0uV6mRk7DFG3tyd8B+ockQ/JR7gU01
         7AIjk0o3btHXZYyqdhccq5fFbiXaaocfCd7S4ACyPxVg23N2zcu+35rjVaOXMbCE3wpT
         nmv5hGJPj/fX2FgMPazYWELYPnjVH1DUY4IhA3wItZE6ozpc5tAWbv7VJLI0bKawOYEw
         rnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=XdbQ4W4L2k6+Q2FcaQtMhpUVgoCo/Fy0uvwcUw8dQ/A=;
        b=x+9+HBex+XiCoaoEKtv2s9OywvcurXlCp2HahojpKojqy5obegjLv91Xykzmshd6GT
         aMasvttiLt9p5Xuhw1+rHw0Mux6w9tdX6svFk6h3yy02gDZlR1h0Y5f5b8pZkfzINCUs
         taRR8ZKM+LeRS45onz+jMqJOR/LuJdDD9xXdElUE81VP+2gRpmj2OyXQE1VsvtyRBGK8
         M0elte3Cg8NKa7dOKgkgz3iD9c1qIHUUuUVrR+Nc1C1PGFvQnnVQDFhW0WsS/8+lb2jj
         CBHeWNiL6iq/hF3o/flMXcM26ewuZSs1w8wFPtj65jmhrOvdL8b0GxJ+CyhNzJwznfSk
         t22A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u39si13959281qth.337.2020.01.16.17.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 17:55:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isGr6-000789-WB
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 20:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1isGqy-000780-Ec
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 20:55:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1isGqw-0006x1-Op
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 20:55:16 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2736 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1isGqw-0006qE-EE; Thu, 16 Jan 2020 20:55:14 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3BDB247A1078ECE07340;
 Fri, 17 Jan 2020 09:55:09 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 09:55:00 +0800
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: Igor Mammedov <imammedo@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <20200105074308-mutt-send-email-mst@kernel.org>
 <a4992b63-e8e7-7f54-341e-f7dd3d7e8880@huawei.com>
 <20200116142508.1d82af31@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <ebbd5d5b-473d-149f-7937-b41c0e80c77d@huawei.com>
Date: Fri, 17 Jan 2020 09:54:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116142508.1d82af31@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Corey
 Minyard <cminyard@mvista.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kFkXKEwtTpOw


=E5=9C=A8 2020/1/16 21:25, Igor Mammedov =E5=86=99=E9=81=93:
> On Thu, 16 Jan 2020 19:56:19 +0800
> Guoheyi <guoheyi@huawei.com> wrote:
>
>> =E5=9C=A8 2020/1/5 20:53, Michael S. Tsirkin =E5=86=99=E9=81=93:
>>> On Sun, Jan 05, 2020 at 07:34:01AM -0500, Michael S. Tsirkin wrote:
>>>> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
>>>>> According to ACPI spec, _ADR should be used for device which is on =
a
>>>>> bus that has a standard enumeration algorithm. It does not make sen=
se
>>>>> to have a _ADR object for devices which already have _HID and will =
be
>>>>> enumerated by OSPM.
>>>>>
>>>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>>> Are you sure? I would think this depends on the ID and the device
>>>> really. E.g. PCI devices all are expected to have _ADR and some of t=
hem
>>>> have a _HID.
>>> To clarify I am not commenting on patches.
>>> The spec says this:
>>> 	6.1.5 _HID (Hardware ID)
>>>
>>> 	This object is used to supply OSPM with the device=E2=80=99s PNP ID =
or ACPI ID. 1
>>>
>>> 	When describing a platform, use of any _HID objects is optional. How=
ever, a _HID object must be
>>>
>>> 	used to describe any device that will be enumerated by OSPM. OSPM on=
ly enumerates a device
>>>
>>> 	when no bus enumerator can detect the device ID. For example, device=
s on an ISA bus are
>>>
>>> 	enumerated by OSPM. Use the _ADR object to describe devices enumerat=
ed by bus enumerators
>>>
>>> 	other than OSPM.
>>>
>>>
>>> Note: "detect the device ID" not "enumerate the device" which I think
>>> means there's a driver matching this vendor/device ID.
>>>
>>> So it seems fine to have _ADR so device is enumerated, and still have
>>> _HID e.g. so ACPI driver can be loaded as fallback if there's
>>> no bus driver.
>>>
>>>
>>> Note I am not saying the patch itself is not correct.
>>> Maybe these devices are not on any standard bus and that
>>> is why they should not have _ADR? I have not looked.
>>>
>>> I am just saying that spec does not seem to imply _HID and _ADR
>>> can't coexist.
>> More reading on the spec, I found a statement as below
>> (https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf,
>> section 6.1, on top of page 343):
> I'd replace 'It does not make sense ...' sentence with pointer to spec
> and quote below in commit message.

Sure; actually I hadn't found this statement in the spec when making the=20
patch :)

Thanks,

Heyi


>
>> A device object must contain either an _HID object or an _ADR object,
>> but should not contain both
> [...]
>
>
> .

