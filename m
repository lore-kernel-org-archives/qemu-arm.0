Received: by 10.223.172.38 with SMTP id v35csp1313522wrc;
        Thu, 14 Sep 2017 13:35:47 -0700 (PDT)
X-Received: by 10.237.63.248 with SMTP id w53mr9884692qth.290.1505421347107;
        Thu, 14 Sep 2017 13:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505421347; cv=none;
        d=google.com; s=arc-20160816;
        b=sZTFhCZ+3ooUFycjRmp5DISZndL0yE3KuW7BYNRGaOg9ITyXI753NWV3xgULbUst7N
         E+ttVccGF83d1q+V4KUvRlHFQM7uGqfONCTXANBl1qztP/zo6coKgC+2YCkEyAI+PG/S
         59PvZKQ6ZQY9KHyB51wAfdmmQevY2m/cKk2mKcojG72OB6Dekku/aspiWPNEI6raHwUf
         c91tSsYHa/D8CQUoEHum1JlzwO91fjDJA9eyqJuxDeJ8YKAl55sJbQwGKY+81CSx9/dP
         8jbZhOJ6QN6/EtBBjKmxa+MjHWPc9oKWYGfdZdFnoxfQIiK6Nbg3Sqo6np1OK2wjdOlS
         6E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tFf2coWqSdw3GOSSwIOA6ZfDL8aEf4gXer7j8h6FPfI=;
        b=ghey7BovZFStik66mRRwPpT60ZPY34wbAuiYZQwCgptP4NlDUubCMU6viGI+RzUnI+
         /yr5HXFNckQ9IRJR5Uc017tdbuC85QRtiqtKKhuyYaVMBryhSgEvkCoX8I9CDDX1kIln
         PoHX+tZ/Duw76tBWeAYR9subJnK/cO7MghmbubBEtf6RBA38IkCawe8eJ7VAG2hJpvqO
         K9HIhXEnUzD9Q7bb83IoaOjchorYX1HqDI/t5+Fs+HAwbBuXYFsAmFP315qHpRHlOtBB
         v+CbwGuayA/epPWSTW9WU7k5Wm3TfwU6I8ObsXSXdPvQclzvWrXbP6RimiFK6T3gGlkB
         5yfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qBSUMfLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si9539412qtd.448.2017.09.14.13.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 13:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qBSUMfLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsarQ-0000T4-Qf
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 16:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dsarE-0000QN-Ne
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 16:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dsarD-0001pY-Ta
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 16:35:32 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:36217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dsarB-0001o6-Ok; Thu, 14 Sep 2017 16:35:29 -0400
Received: by mail-wr0-x241.google.com with SMTP id g50so233290wra.3;
	Thu, 14 Sep 2017 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=tFf2coWqSdw3GOSSwIOA6ZfDL8aEf4gXer7j8h6FPfI=;
	b=qBSUMfLQAkECED4smDBzAdUbWRsvli7O/NUTBJnRjnAU9i++EELIhcBeKn5nflX0Sl
	Xzd+8CXlq6lrx+JHnbDs6DJbgnQmyTQNbwthtDp2aN/jRlaKiWUVTc3tKhgR2CvYCo0Y
	Ne7I1bkEnGNl9kV0ct1WDnkwlGzEbbAP/wb8XJThmUn3AgGyT53LUlil7Yx4dNNaeOQN
	Lqj5OuDAGN0GzlgO+2cBKrqUJt0L6miV1H9TtUNy7yRAPEs9CPuDkNvMM1Q29pldIIUp
	fIRBljxE8R58E4fMSTxSIJMflELgKGhCkDEAGoa5NOLlBkF5lMvaZuEo4DDOsAEZ8h/P
	XJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=tFf2coWqSdw3GOSSwIOA6ZfDL8aEf4gXer7j8h6FPfI=;
	b=d9FLijKW3uUuI0IRu9L27MDVjIS/lpXh6hwMak7VzDUiWD3IMrHQRLkWQgKn1g9ysg
	ZNGELjGYUjcejdsxh2xi4bO3/WGp3n5Qhqo80rBB5dm8MT2GkGclHq/qtgxDxyA6QGAw
	g241t2HUa/FenaOJ2GaozWTUUPR3wHpLqiXobkU4jakkK4wlOi4JB9GWdHFzGP5AhVl5
	9UnoyefS6NjlIF3ittHoedAacYl+f+syhwauRo+ALitxUNRaYmNtMiqg0fuklN/sDoc0
	E6VlIxshC0HtkK1VLMbpOINOD0Rxu6TNeXHxpk1oMq5LJChoyKvvA0mhsic9KB+x1NVE
	cvYA==
X-Gm-Message-State: AHPjjUi+b+wRk664eOncRoFUSk2bmTLIvGsViYNxf5vS5/uStpNstuZn
	toDP1HcT9UO/OVA+TLbILh03FM439A4Fpo4NWqc=
X-Google-Smtp-Source: ADKCNb68fY6hHU4KSvP8rsv91uJIozDXZ0smKZcrjzIJCLrhBLtibXmdFUvo7D8VdNYB9D4YbQ1iH2eksnMKTOWPM1I=
X-Received: by 10.223.144.71 with SMTP id h65mr19939162wrh.41.1505421328592;
	Thu, 14 Sep 2017 13:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 14 Sep 2017 13:34:57 -0700 (PDT)
In-Reply-To: <CAFEAcA-A78rWzUeBh3M_k2SUmu3A8LwROQKCmw78D8PyE2neJA@mail.gmail.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
	<26b702658b5bf9984edaecb22b1190be0a9d7052.1504293917.git.alistair.francis@xilinx.com>
	<CAFEAcA-A78rWzUeBh3M_k2SUmu3A8LwROQKCmw78D8PyE2neJA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Sep 2017 13:34:57 -0700
X-Google-Sender-Auth: g06JuIBpL-SVvGinDK9MVDOPCFs
Message-ID: <CAKmqyKOYqQeu31Ewb8E1AKKAeaG2kBgmwMGUxne_6yVxTKtQsQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/6] aarch64-softmmu.mak: Use
 an ARM specific config
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3jFw6o01Ipfw

On Thu, Sep 14, 2017 at 5:50 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 September 2017 at 22:00, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> In preperation for having an ARM and MicroBlaze ZynqMP machine let's
>> split out the current ARM specific config options.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>

Thanks Peter.

>
> I'm assuming this series is going be reviewed and go into
> master via a microblaze tree, not the arm one...

I talked to Edgar and that is the plan.

Thanks,
Alistair

>
> thanks
> -- PMM
