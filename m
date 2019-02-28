Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp625981wrx;
        Thu, 28 Feb 2019 06:12:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZBJi6OfUMyjoxxA8Kp4i8k7c7k2/NF7mScU4BHPfBjZKC/+grCIMyX7YCCsILyOHHfqkyS
X-Received: by 2002:a25:8b09:: with SMTP id i9mr6538883ybl.153.1551363173343;
        Thu, 28 Feb 2019 06:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551363173; cv=none;
        d=google.com; s=arc-20160816;
        b=RpbNQNwooKYxOJPe9Csy9gvrw5Duiv/5GeyB6VCT2JtNGOWVUcxTwhLgvNKpcdeOdi
         TcJoy16HVUj7SWaIgcFRqnbfmdwhtX6aEo2/aNz29jzVuVEIKyC9y4YUWOP1H5JJnZaC
         qPVa5BrIOPOnXa4OuZqkt052B2xcsLttFW59LpNSDZw/jqo8X3nExVPsU28/6iw8E0Lg
         xa7aXIATJ6+Gfq/7Kv39uZSARU/MX9zI02+55VofXiNGLKOfvEKpnTNYiD//BmO2Atyn
         kdxzN8CDFj9w2R7riSXQU7zjzKShgvbKVRlUn7ky2j0Huq7drEgvC7qBxVRpmpBi6CWH
         0Sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=3l5kGCNto1sfjJGJXNfQwSO7jj5uHyaO0bW1yxhe6L4=;
        b=z+oxgw5KpKeVn7SZY86+sNDm9aBkesDgq8K2CW4coWs9HvsOHoj8CMZkg3dtZzApeC
         2KiOJ+2LAvmvea2cifTDJXJ+ajadlEobJdGBda1duHByVnZVP/UtaF8cIyw4b94JHBiM
         GH4tGQIc4Elctbp+rnWCPIP3bGi9gndJVTc0HGadI0t3G7V2ZVEVuK+WR/ZG2R3jaR1h
         MiU+WNJwB5yRjwGHSioM2GRumXavlmjE54sAjeIe95zoDQt6K/Hv6D/uJMQlfWG9M72Y
         FUoK2VFUcL/SEURrTadCOjj/n21u5I/i60iC5dQKRrYFUDR9BkQAHIts30cEJj48EouC
         VjOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ca2etgX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b71si5891703ywb.454.2019.02.28.06.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 06:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ca2etgX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzMQe-0008WO-Q5
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 09:12:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gzMQT-0008Ut-D6
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 09:12:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gzMQS-0002PK-Fg
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 09:12:41 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:40982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1gzMQS-0002Oy-7A; Thu, 28 Feb 2019 09:12:40 -0500
Received: by mail-lf1-x144.google.com with SMTP id y7so665883lfg.8;
	Thu, 28 Feb 2019 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3l5kGCNto1sfjJGJXNfQwSO7jj5uHyaO0bW1yxhe6L4=;
	b=Ca2etgX1BhGkkJWklTJ/DgGQDdG4zo1T0Ds2QaioTl+z1ksey7x/77mpBSTHxAdQHs
	qYwkEVyaceY5Yyu3aMKlJXpXY0FTuHQNBEtiPKSKC0MuQtaXWUGirm2Vyl64iQnKqYdg
	ubLuLkAElIJ946civSmH4YjMSSNIcHcrQ30ufahwcHIB8zmoHKP2JBHJLXyBcPkS0N3f
	dqEjxJYlbOkA7kT/0MHqkaFftqiHZBzE9N6KWSTXAR8L9PAh2nJhYfx6TOYFDxWudtv8
	yDDMAX0SGmGpeW7nsdInLwdlcEvqqv5pM3Kdmu3r8SRdJvd5hlQm4m0SpT+ZZU2Aq+kr
	gZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3l5kGCNto1sfjJGJXNfQwSO7jj5uHyaO0bW1yxhe6L4=;
	b=iLAhQxg1rB1Ee2oyHBCZFVSM9cX0UsPQ6M6eTIVpla+3Vqu9KXsudHV7SV4OSVyw7A
	kHL7Fk2Y0mYlIAazZD7NLiLqD/tBiGzVpE1/md7/dz1OdkVeC2J73lujutDuX4sOklsg
	fJ7nBgP0nWmqcw0lt25AOt7XaPMmCHH0NYk2bvtJeCUGWSXQL1rMmFZDTUCTvdVJwp9+
	N5lzWfKl1MYnwvC62Xl+h3Pkz1RWk2k3enqJt+z+DnMNRRqhe88/w6j8QeHzlCUF+fLu
	Hioa89HGRln3bzLy9gDcUac2quLFBCtPKBvEgOyPUk9I6tZ0Y4JxpGbZ6LjYtaDcYVdj
	Kjdg==
X-Gm-Message-State: AHQUAuaQSi12SffByEUNoXiHFvQ4Jqh0RnB4SZJrrQG4Bd63G4L6YUL7
	Xx4znrieAHymUl14FOKZsVaJEAcbHzb946RP8Ck=
X-Received: by 2002:ac2:5196:: with SMTP id u22mr4455400lfi.43.1551363158215; 
	Thu, 28 Feb 2019 06:12:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP; Thu, 28 Feb 2019 06:12:37
	-0800 (PST)
In-Reply-To: <BN6PR21MB0785CB5DAEB34BB0F1C465E09E740@BN6PR21MB0785.namprd21.prod.outlook.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9G73yrRvj3AdyxAi2uUBH9GPPerwi7y38oMDKw8F0B=A@mail.gmail.com>
	<CADYoBw2pm=j8QejJyC17MNye==gcyM1TgG=jN+0nGjgYJ0qkFQ@mail.gmail.com>
	<BN6PR21MB0785CB5DAEB34BB0F1C465E09E740@BN6PR21MB0785.namprd21.prod.outlook.com>
From: bzt <bztemail@gmail.com>
Date: Thu, 28 Feb 2019 15:12:37 +0100
Message-ID: <CADYoBw2C0roYiv4nLrYPJuO43atL+s=7X+6jOwZoE9KpYdJhAQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4QFRw4upwqs3

Hi Andrew,

That's great news, I'll then bring those drivers up to the modern qemu API!

Maybe that's a Linux kernel module configuration issue as well, but
with the BCM System Timer small delays depend on polling the counter.
Without the qemu support that counter register remains zero, causing
an endless loop. TBH it was years ago when I last checked raspbian,
but I know for sure that many bare metal applications and libraries
(like https://github.com/rsta2/circle) fails to boot because of this,
and the community is very excited to have the BCM ST emulation in
qemu. The PM thing is mostly for me, I'd like to reboot and shut down
the vm gracefully from the guest without the semihosting hack :-)

Thank you again, I'll get to work!

Best wishes,
bzt


On 2/27/19, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: bzt <bztemail@gmail.com>
>> Sent: Wednesday, 27 February 2019 03:54
>>
>> I'd like to add more drivers for the bcm283[567] too, and this question
>> goes to
>> Andrew Baumann mostly. I've seen implemented those missing drivers in his
>> repo, which aren't in the qemu mainline yet. I don't want to reinvent the
>> wheel,
>> so I'm willing to fix those classes to get them right, but I'd like to
>> know what's
>> wrong with them in the first place.
>
> Nothing's wrong with them per se, but when I was working on upstreaming the
> raspi board I prioritised the device support needed to boot Linux and
> Windows on raspi2. The remaining devices were always planned for eventual
> inclusion, but just fell off the end of my TODO list. They never went
> through code review on qemu-devel, so would probably need some work to bring
> them up to modern qemu APIs and standards.
>
>> I'm interested in fixing the
>> TYPE_BCM2835_POWER and TYPE_BCM2835_ST drivers, which I know many
>> hoppy OS developers lack and would improve the raspi emulation experience
>> remarkably.
>
> Sounds good to me!
>
>> It would be still a long way to boot a raspbian image, but still, a
>> small step towards that goal at least.
>
> That's interesting. Raspbian did seem to be working (on pi2) when I last
> worked on this. Perhaps it now depends on these devices, but didn't before?
>
> Cheers,
> Andrew
>
