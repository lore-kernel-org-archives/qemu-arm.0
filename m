Received: by 10.25.221.202 with SMTP id w71csp2148292lfi;
        Sat, 12 Aug 2017 06:52:45 -0700 (PDT)
X-Received: by 10.237.32.68 with SMTP id 62mr26972007qta.164.1502545964973;
        Sat, 12 Aug 2017 06:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502545964; cv=none;
        d=google.com; s=arc-20160816;
        b=e4gRrNzVfoaY+oHk2nknV5LQ2XxZYnnIC1/DR9RFNxNv+hKtfgl6tyhb/KFHlCGREm
         tMqnjwgDsPR5HD/1TvPsJkD9D7j5vmzS9029HopaP9Jx+CqmQdzHYoLQSg0rzBV8+vAl
         GHdROdZuamvzrk0kyto0zuhxzMIfq2ivzisMPpx4UMBC1RLqDcKGkLnHCWOV31qH6ibe
         gZzPuibCaVvxK6oZEq9sMh8vM633zM++lv0pr6tF0kTve0+IzE1TsxMKxReJwHBeihDt
         rCwFCxkeu2uYqc+HLa1dBL36bym97ZnvfV4KBUeovYg1NXvuArxM1AR1gMkQSywE986w
         OAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zxXLTU/jL9zeVXIW2YxsKz93z4OfwBoQeW4A3Xyy//E=;
        b=0NVy7kvBQTM2f6DD30nRjK5t4fyEDu/wdhZNV5Kwh+J4TUxVSfDq5oQV1XcjO4xupJ
         MqnvJKwYRJTzJ92l1H1poSZd7HjxynVKPyefljJdmAYBfqB482m9abikyjYmxChAJcPF
         EgMaqok3rve5jhIBk58nw+d0IJov9Wf6eQ8thAxMpiCTt8aUn373j5i5NJzYFWXDnYaQ
         uzV4bYqqoe1jxISglirb456ILWnmNyqLEvwboDXVt4cnFHsqhWMN40FvDZo2WHWpNpwg
         te/41vvKjf/QCDiCS4WaxB0negXSzZEmTt0m2NoQxO+yVP99X1l9qDDMvEd45iGvJCIP
         IhjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IsPQ50mH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si2885830qko.410.2017.08.12.06.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 06:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IsPQ50mH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgWqI-0005Uc-Ia
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 09:52:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgWqE-0005Sm-4H
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 09:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgWqC-0002pV-V1
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 09:52:38 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgWqA-0002m7-4q; Sat, 12 Aug 2017 09:52:34 -0400
Received: by mail-wm0-x241.google.com with SMTP id r77so9415551wmd.2;
	Sat, 12 Aug 2017 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxXLTU/jL9zeVXIW2YxsKz93z4OfwBoQeW4A3Xyy//E=;
	b=IsPQ50mHJ+zrdDh/fd/q7fH37av9MicXCCy1mTbTz7emmTbCknrlgmovWXkXQBu0Lb
	6XQZLZUPzlHP2rEsP9nvK52/5wNGrWJ7OpTWMaZ0IVxuVhKvTdmZKDC1k3hO3YlhxYDJ
	iTqv20+5FRojc4uZf8iU6wIMCAI3jVUavW5HHpwAvyva4eWyc+c41JPx6njIE0qjS8EV
	XTCfM2TdC0uIkTYGtxcWf3kppTOK/okKE4poBHWOdw+bvA21/2uFNH0BNXxjbKtsnk4e
	PQCLd+3dgSzO782w7NjornhFMx45DHb7fPuYASVqnosqwQAlAS7K/1e5mP2r8bBuWuW5
	ntaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxXLTU/jL9zeVXIW2YxsKz93z4OfwBoQeW4A3Xyy//E=;
	b=H1dGSmDo6dEARAuu6NO8f6iCWRO4zKeIHgUBQWSHJGFF33+3A4be7AjIF2r4Mg6vRI
	nq3EMk9QOMLI35T848l3tSVaGXQTLpuy1qSy2d2fnUXidzOsWaaueR1oDtqB7JQR3mGb
	A+ne3iZ0o68kTgd3iyobsUptuSaB0P8+knCRdszZJyFgqAQK4tFqZuo9MxPSybiBgEzV
	l1lDgYSMqpOEZ7P+ccCja+mGWt0QjtkMO4Hxvt9cs7lVTnDQbNXBoywPOWKtOw0buuUz
	BXeajG2BHObKSV1CoK+rzboQjRKt1+NhqexGl0ghrCSC7M6i8gLVLjmTKEvSzvSF6deG
	FGjw==
X-Gm-Message-State: AHYfb5hiLbQZRTbsMXPy9d9eC9nSTcSuySLRm25OMaHp8828pe1FribE
	UvX6wE9zZBeGd2QHSebbpexLipyThw==
X-Received: by 10.28.207.10 with SMTP id f10mr1050476wmg.159.1502545952948;
	Sat, 12 Aug 2017 06:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Sat, 12 Aug 2017 06:52:02 -0700 (PDT)
In-Reply-To: <20170812114243.GZ12347@toto>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<CAFEAcA_GsfrueJQYbL6dzNBnLwMWHd3fv24CMRczuf_TxYo6NQ@mail.gmail.com>
	<20170812114243.GZ12347@toto>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 12 Aug 2017 06:52:02 -0700
Message-ID: <CAKmqyKM3BUg9SKTiHaSRSn3iThJtwBagi64Tn0FvjT74QXzPwQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v1 0/3] Fixup exclusive store logic
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mvg9P2eyPREr

On Sat, Aug 12, 2017 at 4:42 AM, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Sat, Aug 12, 2017 at 11:24:30AM +0100, Peter Maydell wrote:
>> On 11 August 2017 at 23:17, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>> > I found some issues with the way exclusive store was working. This patch
>> > series seems to fix the test cases that were failing for me.
>> >
>> > The first patch is just a simple adjustment.
>> >
>> > The third patch fixes the main bug I was seeing.
>> >
>> > The second patch is left over from the RFC that seems like it is still a
>> > good idea.
>> >
>> > Changes from RFC:
>> >  - Rewrite the third patch to correctly fix the issue.
>> >
>> > Alistair Francis (3):
>> >   target/arm: Update the memops for exclusive load
>> >   tcg/tcg-op: Expose the tcg_gen_ext_i* functions
>> >   target/arm: Correct exclusive store cmpxchg memop mask
>> >
>> >  target/arm/translate-a64.c | 4 ++--
>> >  tcg/tcg-op.c               | 4 ++--
>> >  tcg/tcg-op.h               | 2 ++
>> >  3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> Is this series (or at least patches 1 and 3) worth putting
>> into 2.10 ?
>
>
> I would vote for including it...

The only reason not to is because this bug has been in QEMU for a
while, so it obviously isn't hit very often. In saying that it is a
pretty big issue (32-bit pair stores are completely broken) which
might become an issue during the 2.10 support window and I don't see
many complications from including the series.

I agree with Edgar, probably worth including.

Thanks,
Alistair

>
> Cheers,
> Edgar
