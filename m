Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp613377wrt;
        Tue, 25 Sep 2018 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Sj8eJ3jGjQZyWplYfp7MuC3F0kumtRAULkvrHxwBKIbmG8VXHAGGxetDhyLAuBNng2GDY
X-Received: by 2002:a37:5805:: with SMTP id m5-v6mr532329qkb.346.1537878652403;
        Tue, 25 Sep 2018 05:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537878652; cv=none;
        d=google.com; s=arc-20160816;
        b=jBB365Qv0PRPY6z2tl1uCP2GEWaYlYI/oPbtltNUDEpRJiJGUlHDYKA+xedTEIDFsu
         RIgfYBlRcMBOQx3zDj97Q0NGLgeDrA/2wSkA+ZotlyH0XSoiPufpqcJQyFC8Z093kp1g
         FMLLbrwt/sr+cK3WWXykYq97/Llnhw6U3IsPFdl7BkSoeO3fPvJHhAaOi4NstvCrmri+
         ARmvGrNQ4aKN2B9GW+L8BPCr7k6Jjd8d6dPIvZKt4lYc9/HN7I400/zLm0iNeFELp/97
         T3m4L4QBNEz9UkDVImzlLGuV0tgOi/6rayyFPMQP3Cmz9u8IKpZuzz4xQ3EwGE2Jcmsd
         3B5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=eUzf3Ww38uII9jjY2SCoKvuUEx9IdQyWJjMHcrubYtk=;
        b=IuHfbJL9cbwWvM/99P3djJwvyWteFIIT+NL3abW799t0VGeIdh3r1AfPZ1mvnN5qx2
         HGm1SqXH8hWBg5sv+PdSrDABp8fj/44nwyPddJbwN8RvThS3wY+oWKebARcgpwygGKTk
         yNIGTZOwaWkGXI/utrK7101Bk901UxUeXhzbrrYs2HQOkmB33aaKFGdR1S2pyAx0ehmu
         OxQgWiUmd7WgR+9E2q0seaknYu5aXMJtaJv2jiWGYLQPeGyjXARPM+f9fRs1PmlBAgIC
         u1QpzhFb/UbQdIHyAMxA+gjAVb6C9wG8IDzA5lvhWn1QSUDvEJuxzj+aXM5YdCIZUgcs
         OViA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dG241oZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1-v6si1482684qth.268.2018.09.25.05.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 05:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dG241oZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4mUN-0004RA-Ts
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 08:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mUE-0004Q7-8i
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mUD-0004n6-Bt
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:30:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4mUD-0004k8-5G
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 08:30:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id g14-v6so10531304otj.7
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eUzf3Ww38uII9jjY2SCoKvuUEx9IdQyWJjMHcrubYtk=;
	b=dG241oZJob/KS2IjgT8soF2lncK8n5KyCCVyBrASI7FoHJA6Um4xjAMBZPixY0IMc0
	8l2HTFrZhIAht97eXgGEEkQ5Sv+lDT+EsX7pZxageQTibAKKJ2xyPGVdjvFg93K4zdta
	zzhtUMS8OgHYro7QNfCfwDurDZtD5AFPHR2kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eUzf3Ww38uII9jjY2SCoKvuUEx9IdQyWJjMHcrubYtk=;
	b=cnQrMydhFVc7oif3SBR28SzAhif/5SOAZdXrxlvxv+f9gI7bc9mg78Ye1kkyE+Lv/G
	V7N/bmp3aNdL/DMXzeypQlGbi2gx6TjTaFqW4L0LGi+Aj4veqoiYDCW9ubTpMUCcbJL9
	IK8lfIt+2xDsjsAmr9reOsnfPWDL78xmEzn+oHUY/Gm88Wsr1UEpVcbvMCbvIvGNiGBQ
	1EwR3YgY9wr02R6Qrsg35ipYPC1QvPmo+VZwl20rAjOlOejgQJgmDG098ggieRK1x0Ij
	pMVDSgUfNZCzjROwd3sPWvGylrLdY/m+xpNhRB0eBf00XqjYslibTEGpulxtN2ceOWD+
	k6Aw==
X-Gm-Message-State: ABuFfoji/0gPxKxDrYmmRWxVJvZ9y5MZ/OXirApB5xCSFYLFV4P9OoWg
	tn4yQ/j1KSbeEuPgR7ctXBWYc1kaIdW14xC6qG3sgNOSbNo=
X-Received: by 2002:a9d:640c:: with SMTP id h12-v6mr528480otl.75.1537878635632;
	Tue, 25 Sep 2018 05:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 05:30:15
	-0700 (PDT)
In-Reply-To: <CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
References: <20180921161939.822-1-clg@kaod.org>
	<CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 13:30:15 +0100
Message-ID: <CAFEAcA8FuQRB-p-CxQ+D9ins1ubFzC4TpW21=0076LWETFv4Gg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 00/11] aspeed: misc fixes and enhancements
 (SMC)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s79sXTmBnF2U

On 25 September 2018 at 13:20, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> Hello,
>>
>> This series adds a couple of cleanups and two main features to the
>> SMC controller of the Aspeed machines :
>>
>>  - a 'execute-in-place' property to boot directly from a memory region
>>    alias of the FMC flash module using MMIO execution. This is not
>>    activated by default because boot time needs to be improved on
>>    recent firmwares. It also breaks migration compatibility.
>>
>>  - support for DMA to access the flash modules. Our primary need is
>>    the checksum calculation which is used to evaluate the best clock
>>    settings for reads.
>
> I've picked out the easy parts of this series and added
> them to target-arm.next:
>
>>   aspeed/timer: fix compile breakage with clang 3.4.2
>>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>>   hw/arm/aspeed: Add an Aspeed machine class
>>   aspeed/smc: fix some alignment issues
>
> and left the rest for the moment (I've still got this series
> on my to-review list).

PS: review from people familiar with the SoC would also be helpful.

thanks
-- PMM
