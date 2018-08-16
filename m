Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1919510wru;
        Thu, 16 Aug 2018 07:28:47 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx2NRl8DjR1gSWehhrWmUgFKhZ2CknRFyAbfVimG0CSkFf2kC/TxnwgvWgsjNkxj8v5bp4X
X-Received: by 2002:a0c:e582:: with SMTP id t2-v6mr21071591qvm.69.1534429726901;
        Thu, 16 Aug 2018 07:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429726; cv=none;
        d=google.com; s=arc-20160816;
        b=ku84IbNjdbD++iKFlzLuBS0/YVgMxvQ9Zo2HHhGKtNkFyPJ0PtTaSU6OM3Mk+D4V/s
         0tE3FgCdkNx0DauvWaY0cwdO/zTj04CN+e4Y/tmw3NbKNFwdcFGCKCjIXF8QHYQHR5vf
         R1+hPlSuSUN1JjAUHf8LOuejBmgniUow/crUenwGBCXwTW6KGwhAzO17IEJ3xU0QEqup
         khqsBnBsyZbVDqzX5WyVy17fa2+w9f4k6t24fArW84m4X9s5H525V/E6u8VvkyK10IIq
         9dj25WlhOwK3So62UvFBUHl/Ct3nMdaRkvjHMEcgCFWM/r7kVxByid7lzqM7YS0jygXU
         4IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=NDzdn7otLIu4Rq85/WPkZ0uNVWIqdoq9gGaRPQ+Z918=;
        b=xieuRvjprbA5y45HaC9Y/XO1hWSZVqFs21o23H19w0t8o1Zuu6wrZgkAVs7Y+lU7lT
         RFwhAV/+NugjMt3KT+QvoqanYRfWx/B+Am/HTErAUDOfgqLgfDimGpStF+LC+DfgjL19
         i7PentDmIlCR4akMUdxuiRQeXpOjypZHErcgqfYq9jub7h3/yeoXfQWmyoBVxOAqWLl2
         IRrPoJlkKWF2xI0i2OLQm1Wix1f0pY2KjxJYPUII9i8xEB0OmDeAYrZiXsewvJhqDYpX
         UPT6NyTiZFxFwxkbGSZkrgYoG60rQPlZYIg2yajTWlR4mGBCBQNTAp7cPXrsTsCyYKGo
         9JTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z6cwkkJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6-v6si10516947qtj.223.2018.08.16.07.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z6cwkkJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJGY-000668-ET
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:28:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJEl-0003kH-1B
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJEk-0006D3-C7
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:26:54 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJEk-0006Cn-6d
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:26:54 -0400
Received: by mail-oi0-x243.google.com with SMTP id y207-v6so8296940oie.13
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NDzdn7otLIu4Rq85/WPkZ0uNVWIqdoq9gGaRPQ+Z918=;
	b=Z6cwkkJ/tGMi8LPrw8Py07dsl+KnXlJQRWYhSjybMAqCiDb8T9frCvMOvUFKKz289B
	0bJF30ihCZfE7ag4rpcGIOGykJ/i6Ifqy/vl/6LMIEEmnI8iae/utnPeWcCbHoSM8elL
	6Jj8HrfXdoSiGch2JQc5Z2rs09ZYGar2R1bcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NDzdn7otLIu4Rq85/WPkZ0uNVWIqdoq9gGaRPQ+Z918=;
	b=f6psm5jSQjRsn8iuc9HVbSxv+0aBFglyy29Y3/I05MV4RPa3Qsxc2vjQ1PcsZF2Lq/
	7TG2rlX8Avdg6EQnjPBHKApttE2T44qIoFCSwNH/XD6XR50DQvl+Nf94q4SFwQ6MJ7PA
	SO7++6UY8DQQQpXF4eVVHr2RUFBTAwAhSHr5qYU8pIc4GEuMQJtNbSnsY5q4lD/Dj3KV
	gqInQByzb+W/p7iGUv7iePzXwNxIEOJ11EVPwmtwTtMQ2K2sz0+j65rucKLX5uWVe0VC
	y/X6FgPXKgBHVcdu1Xa2NS6at3ZJjclLWO9F2iiZ5U6vMm0U/KGYnjWRfEKYaki1nE2t
	8xKA==
X-Gm-Message-State: AOUpUlHdjA5RNS7puJQMmJe/BUlyIFBhIX1IjFJx6E8NMYaS5G/duvwh
	9awdtW0Vz+bK4iQg0neHJeAq6L2bR5+lCn2HUPLmFA==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr34015428oib.137.1534429613641; 
	Thu, 16 Aug 2018 07:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:26:33
	-0700 (PDT)
In-Reply-To: <07bdb32f-fcd2-c9d1-23ea-388d256e240e@steffen-goertz.de>
References: <20180803052137.10602-1-joel@jms.id.au>
	<20180803052137.10602-4-joel@jms.id.au>
	<CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
	<07bdb32f-fcd2-c9d1-23ea-388d256e240e@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:26:33 +0100
Message-ID: <CAFEAcA_OuWRBT8c2kT9vibrwi1bN0p2RUbzJXDd39h6_RO9C_g@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 3/3] arm: Add BBC micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>,
	Julia Suvorova <jusual@mail.ru>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmBrHO242pMa

On 16 August 2018 at 15:19, Steffen G=C3=B6rtz <mail@steffen-goertz.de> wro=
te:
>
>>> +
>>> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_file=
name,
>>> +            NRF51_SOC(soc)->flash_size);
>>> +}
>>> +
>>> +static void microbit_machine_init(MachineClass *mc)
>>> +{
>>> +    mc->desc =3D "BBC micro:bit";
>>> +    mc->init =3D microbit_init;
>>> +    mc->max_cpus =3D 1;
>>> +}
>>> +DEFINE_MACHINE("microbit", microbit_machine_init);
>>
>> Your subclass of TYPE_MACHINE has extra state, so it can't
>> use DEFINE_MACHINE (which creates a subclass whose instance_size
>> is the same as the parent TYPE_MACHINE). You need to do this
>> longhand:
>>
>
> Hi Peter,
>
> this is covered in <20180811090836.4024-1-contrib@steffen-goertz.de>

So it is. This patch is wrong though, so the fix needs to be
made by folding the relevant changes into this patch, not as
a separate commit later.

PS: you don't really need a header file for the machine's
struct, because nothing except the machine's .c file will
ever need to include it.

thanks
-- PMM
