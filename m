Received: by 10.28.91.67 with SMTP id p64csp564382wmb;
        Wed, 28 Feb 2018 04:44:50 -0800 (PST)
X-Google-Smtp-Source: AH8x2276WFLvEcc0G3yHzC68szYzv0NybCsiyZt+vJ5e+cFzP+hWpfD4159DMJpGj031l73Ei/mL
X-Received: by 10.129.113.133 with SMTP id m127mr11447331ywc.76.1519821890570;
        Wed, 28 Feb 2018 04:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519821890; cv=none;
        d=google.com; s=arc-20160816;
        b=h4u5BigznT2tYObSGUdVL5puULbiXcKAcOJIYkzNL2te1RCN6arrZewyEw8j66nzFK
         NkVqVhPlajZWcoeeHIIiqlKeldSJD/YoILMj8f6V8nWNFXi7sCWl7i7gq3N5jIwBdn2G
         P99hDHYuPXM+tyVKiaCk3Eo8YEaK1dTlfSqXWgTosdX/iTkXIILKeVFEsQY4/ApvbHem
         FFJgHtWZ6Rw1ESCTabeuUSeZSteuIvTSOprkBEuAucxvhylz+Y3f2EZ4cYKp2N+IjdtI
         pHXXXu1Bm0iGOOErDPi+i4eW2P+gA9WWX4uZpjU15PcNvvHrLOPAbuSul9MKDstYzm/c
         I4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ihAw8orTJbOquXU/T+rocCNFFEJGctfuOKX0KK3MPJc=;
        b=GYG5SBweQFqxk05qecvOWPtCcXWdtt0hjmNsBHLc1ofjuYmT5NlRNM+WrqFdtzr9JW
         hnSqrsH3Q1gUzGZL/aOyjVIU8Bp1ZuqqVxDyHsIgps/LjUrQOr72GfgxVWs7yf0CfkBY
         ie6CosHV2PiabS2EnrYxpKFn83tPWdmDhSdas+IvK/zE5XS8b0bYNGDywhEry1SGGs/f
         kpxSpZ2uFx8+4WcT3qP+L571jiko2mdXlolcOZjXuJ0w4SG3rZ7dvwFZkJ6qW0l8C/Yk
         zDeTuI9nf15ZuNKqYQf7iS9TwiOiq9gFBBExDPOdwxqEHMprL1kYyLzeELzDTGu+JB/+
         f5aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LGxyDLFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h124si247872ywe.566.2018.02.28.04.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 04:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LGxyDLFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er16I-0002lF-2H
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 07:44:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1er169-0002jp-2R
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:44:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1er168-0006bM-Ah
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:44:41 -0500
Received: from mail-it0-x22c.google.com ([2607:f8b0:4001:c0b::22c]:37492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1er168-0006aP-4b
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:44:40 -0500
Received: by mail-it0-x22c.google.com with SMTP id k79so3353611ita.2
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ihAw8orTJbOquXU/T+rocCNFFEJGctfuOKX0KK3MPJc=;
	b=LGxyDLFFxd7TF8yN6JtcLQGB76eXxzanf6Cm2S43wXEeeIcUdZ72CIgDBbilI6QMLg
	jm1FL2LVi1wxl+FSlNwcwpkVdLd8pxRuem3Tw8BJBJp5GX8Uh9kxgz2Rilir1V3XKeuH
	e86ZciwX0ACKxj4DiWbKkGaClO/tmXihQOzgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ihAw8orTJbOquXU/T+rocCNFFEJGctfuOKX0KK3MPJc=;
	b=JVYWc3e69fw7B7a3bpopk2sEoABjDHp50ABEOjqL3txSDXuBqF9qq/G7RdbOOCVT2l
	aBI33dDQnDfHjM6dKs90Ii8NhZqNJj5CnSQdxudv9jsXlFw7JtLBZw/rtZaaci+dOR1B
	gG9qFwmjn2nzFOMzwZr52oeoRe7b48RhREb2ZhTHeAcShAb/r0ZvzZIUtzqNXgZnFhAu
	unUKhxBTvHV614sXytgNNpw1tQ7HNRL/xKr6Y856CRjH1LfLybiHOxzGOXThAINxyi+n
	KRkHs3pXXPpxfYV/BtwM4wE6hf9FTc+Yckkbzs4qC/bJdvPwzj707bPCE/PLA0iH0UJU
	kjFA==
X-Gm-Message-State: APf1xPD3jzDNy+fZWXSalZ6Hs9TAlEM+Hqm9NA3h1bzz0de+Q2Tnf6lU
	QPslN/oEMSkPbx0LsfTmi7Rvl0Omr1CwNv/u5pHiRQ==
X-Received: by 10.36.120.19 with SMTP id p19mr9623578itc.115.1519821879219;
	Wed, 28 Feb 2018 04:44:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Wed, 28 Feb 2018 04:44:38 -0800 (PST)
In-Reply-To: <CAFEAcA9h9VjyS7QjHiRkYwThGyK0NErWSPxMGD=iRT82qECi8Q@mail.gmail.com>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
	<CAFEAcA9h9VjyS7QjHiRkYwThGyK0NErWSPxMGD=iRT82qECi8Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Feb 2018 13:44:38 +0100
Message-ID: <CACRpkdatS-+MF1+sv3i+DhgCaVwepvc2jntwqe64D8DPEpho_Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22c
Subject: Re: [Qemu-arm] [PATCH 0/5] Versatile Express SiI9022 emulation
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuQNkKnp6M0p

On Tue, Feb 27, 2018 at 6:26 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 27 February 2018 at 10:48, Linus Walleij <linus.walleij@linaro.org> wrote:
>> This series adds proper display bridge/connector emulation
>> for the Versatile Express, implementing a simple Silicon
>> Image 9022 emulation spawning a DDC I2C child.
>>
>> After the series the Versatile Express is successfully
>> presented the "QEMU monitor" through DDC I2C.
>>
>> The series includes two refactorings from Corey and a
>> minor bug fix for the i2c-ddc so that everything is smoothly
>> integrated.
>>
>> Corey Minyard (2):
>>   i2c: Fix some brace style issues
>>   i2c: Move the bus class to i2c.h
>>
>> Linus Walleij (3):
>>   hw/i2c-ddc: Do not fail writes
>>   hw/sii9022: Add support for Silicon Image SII9022
>>   arm/vexpress: Add proper display connector emulation
>
> Hi; I've applied this to target-arm.next with the tweak to
> the commit message of patch 5 and the reset function in patch 4.
> Let me know if you think those are wrong or you'd prefer to
> respin the series yourself.

I am certain you did it better than I could, thanks a lot.

I forgot about the reset business, sorry :(

I will test it once it hits the trunk!

Yours,
Linus Walleij
