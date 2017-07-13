Received: by 10.25.44.15 with SMTP id s15csp1983889lfs;
        Thu, 13 Jul 2017 03:40:32 -0700 (PDT)
X-Received: by 10.55.20.230 with SMTP id 99mr3898163qku.236.1499942432390;
        Thu, 13 Jul 2017 03:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499942432; cv=none;
        d=google.com; s=arc-20160816;
        b=N2HpVivQPtYKZ/KtgpDcLJZy1A+h4NLnBwGmMVpJDTEes1XHIwPkX1F04Vnn7IAskD
         yD55w+f9mRL2Bgu7179aK/VoUXT6+6h9Bv1H0ZxUg3z0PIdnHdga3bnWGmfJQjqgDqJF
         pJHVaMHSNGb7gjSoYFL94TO3Wn3ZCKoP5BbGPyptB8ZyHYQfxYOr9+OIucAKaxM6HFvb
         0jfDYgOY+j4WGgxIJrTfuqsDSyXdl+9c+vTN+7q5x+A45ccfL1DATo+VDD7w9tW/DU9P
         iNq33aP5bfVF7rL+DR9DJ3ERfzNI4nipqWrB9txUsQYcV0wqj17k4YJTcyNsG3t5OK3J
         2JNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GbVP8lc1b9dgF6TTgge5rjNhUl/NFggtTT8v053qy/0=;
        b=x+2iooOR66x7hEhReAulL0XrNEszPjey6ThTP8uUNvmTkPmoZh1T9N/5yYgy9wcaH7
         vfHSFZgupJ/98V6LyGsOOfaNFNN2qNSpFFdiL8yPiPQdDPAa5Q120h48PvH/0ATeUg/P
         WxSyEDCyPxnTiLeSi+RrQrZorbwhe93PUecV+i8AtS48j8N9DvxA5dOK8JK0ELtaC8dC
         uIIu/uuTeC5ER9Mb4N/FMgynOdKtyi4VbiuxSKnkf4wsreKQq/VDDPNlZy6JFx7NH8Ec
         saQiLffSQs2n5MPy7WkjZ6TnWFKbW3M0B+WPCeU8pAqcOpz+f7pSQaNUBWx+ah26ULCX
         kcZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=OK3GwxwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c185si4754995qkd.316.2017.07.13.03.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 03:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=OK3GwxwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVbXp-0004wg-Ly
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 06:40:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVbXi-0004wT-SY
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 06:40:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVbXh-0002DO-W5
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 06:40:22 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVbXh-0002DF-Nd
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 06:40:21 -0400
Received: by mail-wr0-x231.google.com with SMTP id r103so50932378wrb.0
	for <qemu-arm@nongnu.org>; Thu, 13 Jul 2017 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GbVP8lc1b9dgF6TTgge5rjNhUl/NFggtTT8v053qy/0=;
	b=OK3GwxwBiGOeB1e4rJ4+iAzWgk6968a8jFMecsSlfAEkZaZLjtClIA4nJ5efSYPAwE
	9rN5L+Rl24nGktIOJWUbMfPCu4B8bu89nRGalPVeMPp4lvuG5H21BbdLpJMzB8AK89Mp
	yHh2Sk58/3l/QnH9OJZdCYkC493l2s+JGzzC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GbVP8lc1b9dgF6TTgge5rjNhUl/NFggtTT8v053qy/0=;
	b=dUotVJEbrEDkFcMfKRiOvsCFETkDlaEhcWE4vvVISWTr5cdJBn1tT+4CJNdgWoyW5+
	Z1zHZzIQSPYoNv7ngoUKnAta9xxukhtiXkIcTiam/gDe8UyrqNvHFoHwnaFklMw7oG/U
	RL/pvVOoAB6rNRsu8g0ELTQNu2xk0dBLwnmAnB9Y30rse4QMbwgT3Y4ZZkuqc7LHbn4H
	LJkTj17+yqk6BJ/kdm7kIm6xJBESFSr7apKPQSl4ZKLrnxAXOX+kA23Ij2H7pxoQULjC
	v+gBgWGvAh3JsuhEnwSjGEddyENwtk//Jquj340g6vkzokKsXvOY/jJAMV2d6Tl4pydy
	NMcA==
X-Gm-Message-State: AIVw110F+mA0/+IWvqHQ+vX88Iz6riKZV8aoHALmwnH63rRUhilfGLbt
	gF/u5pcGD8F8xjRQiKiutyXIvCCHyxGS
X-Received: by 10.223.133.239 with SMTP id 44mr1188563wru.177.1499942420436;
	Thu, 13 Jul 2017 03:40:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 13 Jul 2017 03:39:59 -0700 (PDT)
In-Reply-To: <CAKmqyKNR269fZpVz5zqyMbkU7JDKGswnyq10+zud0FxA5_m4Qg@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
	<CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
	<CAKmqyKNR269fZpVz5zqyMbkU7JDKGswnyq10+zud0FxA5_m4Qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 11:39:59 +0100
Message-ID: <CAFEAcA9s3+OYpvrriGu9CVaJHZhkaZ+Wq47PY2Ky0w-yCMWK_Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] hw/arm/mps2: Implement
 skeleton mps2-an385 and mps2-an511 board models
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XM2HumqY7caR

On 13 July 2017 at 08:27, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 6:35 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 11 July 2017 at 15:33, Alistair Francis <alistair23@gmail.com> wrote:
>>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> +#define TYPE_MPS2_MACHINE "mps2"
>>>
>>> This public name seems too common as well. I am just worried it'll
>>> conflict with something one day.
>>
>> I can see the issue, but on the other hand the type name is not
>> external ABI, so we can always rename it later if we have to.
>
> That's true, but it's still not ideal to be changing device names willy nilly.
>
>> The board names themselves (mps2-an385 and mps2-an511) on the
>> other hand we have to get right from the start. I'm not sure
>> tacking an arm- on the front of those helps; they're already
>> pretty ungainly.
>
> I think the boards are already long enough to be unique and probably
> don't need an 'arm-'. Although I think having the vendor name does
> clarify what the board is. Imagine a user is querying QEMU for what
> boards it supports and sees a board name they don't recognise. It will
> be a lot easier to figure out what board this is is you search "ARM
> MPS2" instead of just MPS2.

"ARM" is in the long description you get from -M help:
mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M3
mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3

(compare existing
realview-pb-a8       ARM RealView Platform Baseboard for Cortex-A8
etc)

Having thought about it a bit I think there are two options:
(1) stick with what we have here, just using "mps2" in type
and filenames
(2) use "arm-mps2" instead (in filenames, typenames and the board
names)
since I don't much like having the base machine type be 'arm-mps2'
but the board names just 'mps2-an385' &c.

But of the two I overall prefer (1) still.

thanks
-- PMM
