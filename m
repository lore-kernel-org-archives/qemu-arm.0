Received: by 10.25.21.156 with SMTP id 28csp901505lfv;
        Thu, 28 Jul 2016 09:41:38 -0700 (PDT)
X-Received: by 10.55.12.1 with SMTP id 1mr43461178qkm.136.1469724098299;
        Thu, 28 Jul 2016 09:41:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si8519877qke.146.2016.07.28.09.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoNN-0005n5-QW
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:41:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoNK-0005mn-C9
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoNI-0005ij-DQ
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:41:33 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bSoNI-0005id-86; Thu, 28 Jul 2016 12:41:32 -0400
Received: by mail-oi0-x243.google.com with SMTP id d204so5026332oig.3;
	Thu, 28 Jul 2016 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/8lpoQ5ePuaRn1WnN3qo9X+ivbL/g8OuORanA1gZoWA=;
	b=Z6pNMvNwLIBZG0d5Od8fjOtvtw2g1qnaBaxIZdNoGjeSw5yCBHqunpfJCsY1Y9fZ4D
	D+uws9J9pgC1RmT4TIp5fCN5VN0m5r1YeUsNmVsweCX7coJxgttldxuX2xJ2CQiGwF82
	BOyqq8Fm0wjMqXIvFeLOebe6uKwRB05a7P9fPOiqHJrucyipBCVBxaD79ho/R4MpyE62
	yjbpKWa3tSw3J8ewt1hP/QtOGGae3iciJSfSi4morgbOriYMorwTM0GauKrMwAQkOnaz
	iX0NVJrvHCbpXM44flentRI72D3Pa/yv5pyTd/YrflBa2CRqD6pIXny9JWVCu27D5ESP
	+v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/8lpoQ5ePuaRn1WnN3qo9X+ivbL/g8OuORanA1gZoWA=;
	b=XRZ2v77Fwr9fX0Igz/Sdu3MzYcoX+UfOWnS3cpj8lgAav9epzi65zbt5NWY5RNt5wL
	WBV4GlNFSEnG+K/OEHDH7CrgthFQjn5Xqcjdcfnv+uDQ1eXmFd1hi2YjIQ067ZBvn73S
	CzKvksfm9YMy/l0rdb1h+6R+giwJFnrWSUYXZg3IN3YZ9GwpcQm6IPT84iLdVhb9fvnc
	c8TSfTI24S7A6nElRwMBVloS1v98wbg/rDTDJTiOP8ClRy2cexF7CJN52o1BYpbrLd46
	BjTmu8IkbFMpEFwFNNqLVGZJxlwhpLUEJQQLlGpSmOhgy3ec4lGcLu8rXLW6V1IKLHWH
	N7oA==
X-Gm-Message-State: AEkoouuEHGZpDbNW1v34w253boZs9gKNWAmTz22FV3p7/ewa+NMitPKwbWK5pWZeryrDOhkDalPPC58viR6IbQ==
X-Received: by 10.202.232.1 with SMTP id f1mr20195462oih.75.1469724091709;
	Thu, 28 Jul 2016 09:41:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Thu, 28 Jul 2016 09:41:02 -0700 (PDT)
In-Reply-To: <CAFEAcA-2JYdTaBbxUB+D=6OyVHOQE=QC6CGO=vJFc5BC4CLEYQ@mail.gmail.com>
References: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
	<CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
	<CAFEAcA-2JYdTaBbxUB+D=6OyVHOQE=QC6CGO=vJFc5BC4CLEYQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 28 Jul 2016 09:41:02 -0700
X-Google-Sender-Auth: BNPc6cGXb6pnc00Vyi2atKGLSGk
Message-ID: <CAKmqyKPv11rO-za=VJqS4scg0-vUFUKkSKbo6Wbmt3PiEJfN3g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/6] cadence_gem: Add queue
 support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /fQI3Ua/HD08

On Thu, Jul 28, 2016 at 9:36 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 July 2016 at 17:33, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> On Thu, Jul 28, 2016 at 2:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 26 July 2016 at 19:25, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>>> ---
>>>>
>>>> There is a indentation error in this patch in the gem_transmit function.
>>>> I have written it like that to make it easier to see the changes. It is
>>>> fixed in the next patch.
>>>
>>>> @@ -1417,8 +1500,8 @@ static void gem_init(Object *obj)
>>>>
>>>>  static const VMStateDescription vmstate_cadence_gem = {
>>>>      .name = "cadence_gem",
>>>> -    .version_id = 3,
>>>> -    .minimum_version_id = 3,
>>>> +    .version_id = 4,
>>>> +    .minimum_version_id = 4,
>>>>      .fields = (VMStateField[]) {
>>>>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>>>>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
>>>
>>> This bit should have moved into the other patch with the change of
>>> the CADENCE_GEM_MAXREG define, right?
>>
>> Woops, I have moved it to the previous patch.
>>
>>>
>>> Otherwise
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Thanks!
>>
>> Will this make it into 2.7?
>
> I'm afraid not, no (we discussed this when you posted v1, I think).

No worries. I'll send the next version out and ping you again after 2.7.

Also, I have a MAINTAINERS patch on the list, that should be fine for 2.7.

Thanks,

Alistair

>
> thanks
> -- PMM
>
