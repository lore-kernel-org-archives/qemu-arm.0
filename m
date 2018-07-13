Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp800304wrq;
        Fri, 13 Jul 2018 08:14:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeItrdClQlerbYgNKNAIBeViYbxzIfP0Jvqs36RRsChx34DO/cOTjf78F1jod6QTjTvkvSG
X-Received: by 2002:ac8:2a18:: with SMTP id k24-v6mr1348155qtk.219.1531494862789;
        Fri, 13 Jul 2018 08:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531494862; cv=none;
        d=google.com; s=arc-20160816;
        b=VEosSWhadd9yie5KifPB4XMj2PyL5xzn0ZwNVJHmQe0zTrwYHPh5pzfVEWvVm686gG
         UmfYdC3k5irS3y36wMoVhmaunIlOFNR9tfVLnm+WCSwYCzboGL66Wm/N3uDBui+MQVJF
         g3CBfoc7c2U9hXVDl4ZsGQyhPL3gs0cwmBp7eZCu5hqHMBdz9rLFN6lXZaHCKC0+bJUN
         5Vv9HxC95vYk6Vbapbjmluq9rcI8J+PhVH3XePW/HBFVbySgwDHbljZWvwCsepM9UpBA
         19wQIlM/07rdGq2gyeq+tP1XviyhGMrR1oGKXUGd0xRzoKoV0tmJhc6Rrs90CqMwx3OI
         3W4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=l43nMtRABx6mNfWqw+hkN8RywJpHvTrMoU2JcGu23QA=;
        b=h40NRDPjqhHfbP3oGzWx4aUoadgY/9J6H4mczoBZBpshXtT25rKFa2HjpcEsiFFwIX
         q5r7iv2fWigV39Ry3WQznKe0qTmvUwev2Vq3N/Dzlts+StlQdGzNNx+1vaWBOSfsj4+I
         mWuvFp/IULsTY7zBVG5toVN+766A6gVcb1RknQ7fM3GiJ4pisHzVqXbvEEqTTSwAnrfK
         9fqqW4mfP2l0lwe5x+cIu2fpMcXnpqxRuk0uCAxyKaIU7vbFOAVaw6JbYsFbHmwMt4AG
         FV3vnnkecRzV1dq8pU9+7Y0ehL8ykCQtBdrFVmCCLCcSLTRW4pGgaCRO1QS7+iqxwrtH
         y67A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvW5b3QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5-v6si9414310qtc.353.2018.07.13.08.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 08:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvW5b3QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdzm2-00023q-A0
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 11:14:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdzlr-00023a-U6
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdzlq-0006TZ-SX
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:14:11 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44338)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdzlq-0006TO-Lw
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:14:10 -0400
Received: by mail-oi0-x244.google.com with SMTP id s198-v6so62825440oih.11
	for <qemu-arm@nongnu.org>; Fri, 13 Jul 2018 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l43nMtRABx6mNfWqw+hkN8RywJpHvTrMoU2JcGu23QA=;
	b=CvW5b3QJPfDEjvoyocVpsTRDYIP9HBVOMVL9jipj18+CWaLXcoHpH5YOmewei3BGsb
	L3lW63flnIfuzrKl2y84DtwsxCxfXGEch58QjRpxOg+qpXfQ/kjsEg0Wbxxp8xvtvcAA
	Xl4jAqvHZfo4GOavZ2qbWI06BMnOlkXD9Z/cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l43nMtRABx6mNfWqw+hkN8RywJpHvTrMoU2JcGu23QA=;
	b=SO7slq+i0MbD7LZaoPPavWxj4v4SPzWbS2d3qtmbeydRB2klxvG/oMgC8gS9mA/wlo
	y7rwNcQmdiILVXj8lZYARl0o4rp7NgqdSlLmo609yiGtd1nLOFUNBFChE7ntNWOAPvCe
	GoyScboo3Af6PkmY/KAeiV7kEON5apqIcplz4WTjin+zlNp0QLCxCtV3ebkBD9/nqFhV
	UHclUfc4xMT1Fse2P0JDz/IvAO++pQ01BOtKl3fmhHq72nOjRQ0HQzjuDV7dVfp8z7Bi
	qlKC96orG/ToiI/cNGiXxHyFmRPuAWJSGGOl8gizyfQhabxxz0Zb0EM8FP7trWYeFHAY
	WuTQ==
X-Gm-Message-State: AOUpUlHHfsCzNSV7PUPSq/kw9ohQloHHYsovIe5ca5nmeiabwvuqgd8q
	LzsXJgZR06IQDRWN/+JwZ0suOBTqWSsD0Milntrftw==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr6883639oib.337.1531494849896; 
	Fri, 13 Jul 2018 08:14:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 08:13:49
	-0700 (PDT)
In-Reply-To: <CAFEAcA-q-cCJMVjPwu8UC667EyngNAoxQK6mb6Yjj5RL54b6uw@mail.gmail.com>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<66872d46-25b1-aa14-407d-359bae14815b@amsat.org>
	<CAFEAcA-q-cCJMVjPwu8UC667EyngNAoxQK6mb6Yjj5RL54b6uw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jul 2018 16:13:49 +0100
Message-ID: <CAFEAcA9_BPxnnqFQ=inNNUefaBsF1pfA2VtY4PQ=TATRx_NBsg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ywVEt6HYgeJ

On 12 July 2018 at 17:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 11 July 2018 at 05:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
>> I applied and quickly tested your series on a MIPS SoC I'm working on
>> which has a tiny SRAM:
>>
>> (qemu) info mtree
>> address-space: memory
>>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>     0000000000000000-00000000000007ff (prio 0, ram): sram
>>     0000000010000000-00000000107fffff (prio 0, i/o): pflash
>>     0000000014000000-0000000014ffffff (prio 0, ram): dram
>>     000000001fc00000-000000001fc0ffff (prio 0, rom): srom
>>
>> The firmware copies the ISR in this SRAM area, sadly it didn't work as
>> expected:
>>
>> qemu-system-mips: Bad ram pointer 0x4a4

> Are you sure this is executing from the SRAM at this point?
> The PC value in the backtrace is 2415932580 =3D=3D 900034A4. I don't
> know how the MMU is configured at this point, but my guess is that
> that's actually in the pflash area, and you're running into a
> different bug:
> https://lists.nongnu.org/archive/html/qemu-devel/2017-01/msg00674.html
> where when we attempt to execute from a romd device that's in romd
> mode we incorrectly think it's RAM in get_page_addr_code() and crash.

I just sent a follow-on patch which should fix the 'bad ram pointer'
assert. If your guest really is trying to execute from the pflash
here then it will just misbehave in a different way, though,
since pflash status response bytes are probably not valid MIPS
instructions...

thanks
-- PMM
