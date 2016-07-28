Received: by 10.25.21.156 with SMTP id 28csp899320lfv;
        Thu, 28 Jul 2016 09:36:44 -0700 (PDT)
X-Received: by 10.129.158.197 with SMTP id v188mr29703079ywg.170.1469723804830;
        Thu, 28 Jul 2016 09:36:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r12si8517250qtr.135.2016.07.28.09.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoIe-0002iR-Ay
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:36:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoIa-0002ht-I2
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoIZ-0004nR-Kf
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:36:40 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoIY-0004mh-Su
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:36:39 -0400
Received: by mail-vk0-x236.google.com with SMTP id w127so36011148vkh.2
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xSuY7MOCyj5MVHB+YGHucj4XY6/2xiZDNpZ/tpWgUY8=;
	b=BhKRTlCJa4/97ceiWr9cw5fK5kirGhYXcJusyKvzjohWlI5I7ggxNro8qISXIBqUVO
	JI2OlxMEZz3axwz+p6hXb2r7EoKK0979dUWbTgCq/qikG2/FQUMyCjN5Nle6LwL05Za3
	aVJEwQI6jTf3ZASuTmTnhVmFqW/OuHil8PM10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xSuY7MOCyj5MVHB+YGHucj4XY6/2xiZDNpZ/tpWgUY8=;
	b=TSjWITj4syc+BmpuA9/Z6l8v9xiCQfIDkrphIOPJ3iazAD2wPUSToVqRyOzqNvK6+L
	AOxdGOdDDPO5m/9xvUJvTVel87oe1guBouzzhDfKx8h1mVmop2e97Hi8kflwsJAJ7ogJ
	e+aBH1uHucEVkWYvEA3oMnHRLvWQibPAE0JFu/rekm2QRG7yfxcenvqeO6e+em3kuLG2
	sDMXvuwqlr9YHkp5xvMZv6PTlyd1Jvo9DND3PJBHQBJ8EgYyFv0jpFAwnButO9xBF5JC
	hmV4mWLLfxzb+5qkg/uVezA5FHe8YDjV//1GyeJfwwsz7I9PZU1V5XPR4tfmTQqOFZdy
	gqMQ==
X-Gm-Message-State: AEkoouulklfTqALn3jtY7gUAaakgzTnedHEE1nRkUwIXkMH9ofBZ+G+mXVTpTtgZPbhc6xL/GDtJmqbKTg49U/uD
X-Received: by 10.31.188.203 with SMTP id m194mr16472326vkf.120.1469723798403; 
	Thu, 28 Jul 2016 09:36:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Thu, 28 Jul 2016 09:36:19 -0700 (PDT)
In-Reply-To: <CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
References: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
	<CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 17:36:19 +0100
Message-ID: <CAFEAcA-2JYdTaBbxUB+D=6OyVHOQE=QC6CGO=vJFc5BC4CLEYQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcJ33xXpigPH

On 28 July 2016 at 17:33, Alistair Francis <alistair.francis@xilinx.com> wrote:
> On Thu, Jul 28, 2016 at 2:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 26 July 2016 at 19:25, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>
>>> There is a indentation error in this patch in the gem_transmit function.
>>> I have written it like that to make it easier to see the changes. It is
>>> fixed in the next patch.
>>
>>> @@ -1417,8 +1500,8 @@ static void gem_init(Object *obj)
>>>
>>>  static const VMStateDescription vmstate_cadence_gem = {
>>>      .name = "cadence_gem",
>>> -    .version_id = 3,
>>> -    .minimum_version_id = 3,
>>> +    .version_id = 4,
>>> +    .minimum_version_id = 4,
>>>      .fields = (VMStateField[]) {
>>>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>>>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
>>
>> This bit should have moved into the other patch with the change of
>> the CADENCE_GEM_MAXREG define, right?
>
> Woops, I have moved it to the previous patch.
>
>>
>> Otherwise
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Thanks!
>
> Will this make it into 2.7?

I'm afraid not, no (we discussed this when you posted v1, I think).

thanks
-- PMM
