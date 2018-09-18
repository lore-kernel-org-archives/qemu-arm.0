Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5570389wrd;
        Tue, 18 Sep 2018 11:47:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdadOkGalulDuE+T+6fzYICHZGG7v0Sm6wJTLpYP3nkGPQB+oVWTBbiZbSJPhL3mDWoAtvps
X-Received: by 2002:ac8:4596:: with SMTP id l22-v6mr22695945qtn.184.1537296468282;
        Tue, 18 Sep 2018 11:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537296468; cv=none;
        d=google.com; s=arc-20160816;
        b=ln6CJN2ZSQv3X2qZ3F9KNePU+FOgq+mSI3vlZEDc+jPQnhQE8oDMwiw7YfOTvADV+O
         HPQvvSDnpkknXiha64jToGFg5mcmMQ2KO5FJcuMqtyKbLK6SArfGDOEF4q8D340QZJtk
         ewrboC2uW6u5ALPlPDsgKskpW5fTDCT5sPgDUUAZGRmuBO4zPnZWr4OzpL8rdpQPV8zN
         cIeo8o39bGNXYxz2RJT2J3NsjPfNN4H2+f7FixVEI0iYOm+EKuMI9PvES9M3kIhbAMKZ
         KgLuFyvheSe9vwk2hQ6qdmW/pnZEJgu82EOmvxsa3/eB0GADQDOKMlT/YnwpIfjrrHpB
         wGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=sDFsMRmYL2rnWeZE5H4B3Kcghn0nuyy4tNJ2YM9+LBU=;
        b=KIZQMo1QB/FnyrBCK5HegYY4hoXE7PQktGgSkuW6RB1SIBLIrhA61TA7MzBkWCTpwT
         yKCGIov5j80zvFV3IL8DWW+VDrvmHW6h0DXO1mfMv4sz4H6zhCq+niMe3MsRnbHpoQaz
         8KCHxvIbe7cRgmdcFlNJUGIy20PEFcsdWMoDlUa8AgJ8aD9NIoNNyz679+PV2p3QvFYY
         TeRP9NK1LKbuGHOX3lZvzyhQBExdzsnha9BdnAzveo5KWkuWzO6x6a66ox3/uJxTJgRp
         HI9TiDNmVacM7lKHTWMrbiraGyY6rJDNm4DwkhYr/wcVAstsEUGOBr1RGl7HTIjedXcV
         8VNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Srn31Sgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w53-v6si5584849qtk.154.2018.09.18.11.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 11:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Srn31Sgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2L2J-0003Ko-Lc
	for alex.bennee@linaro.org; Tue, 18 Sep 2018 14:47:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L29-0002sF-70
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2KzQ-0006jz-Vk
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:44:53 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2KzQ-0006ic-P6
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:44:48 -0400
Received: by mail-ot1-x343.google.com with SMTP id w17-v6so3081122otk.3
	for <qemu-arm@nongnu.org>; Tue, 18 Sep 2018 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sDFsMRmYL2rnWeZE5H4B3Kcghn0nuyy4tNJ2YM9+LBU=;
	b=Srn31SgmssOLBJDGWk7sh0Gaq8wSmUIY+RJ/mbVJcFyM6BH5zMLibXnaPQc6fcSZ04
	ofmcuJm2DAtMjTHzXiKv+2EKPzRcbwY5FvLUDi7HjKffEIAnIdN0pb/C4fyvCohXDM2u
	uMKBUmosI/K/AKCAj34cpDX8jTU9IDI5pRvK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sDFsMRmYL2rnWeZE5H4B3Kcghn0nuyy4tNJ2YM9+LBU=;
	b=BnH7Bt6ehJEUcjaYBkptZcBfsV3TVxnx39TCpGe+kqyDRcuSDyZbi/5szwiawsDXXR
	ZfxFL5i1CqVwKTnVjFGUdPog66qoSGWbPaGqRA0LXMTB0SfL2FUIblbRWnB1LBL9MCyU
	IKz+ItLlSbQOddtuKaIuD49xmgYc7ymH0i+Ojwi/kff1mIxe2ttpJEr19FKhMCZ9mEYu
	o3AYR1A//UmPkgVChGpdnUI9CoJy5swAko+iJ1kjGlvPQQ+/YeaZov9PcCYZeJ4S5t4f
	Vr2fK7Wa63FnSRxusqFT0dZzgdYokUpw/OqQbbXDbTGlIv+z3ndyRLzFkrhp25EF7Cyh
	+BuA==
X-Gm-Message-State: APzg51CxLOj/vP6rQzlG6OG3rvgrRds9qd5bjWvcTxfhtnBUkGLcs6X6
	//cdiEVdhMXOPq631rGe/zXI7fBig6N3g+r5UyFBzQ==
X-Received: by 2002:a9d:640c:: with SMTP id
	h12-v6mr15886107otl.75.1537296282871; 
	Tue, 18 Sep 2018 11:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:44:22
	-0700 (PDT)
In-Reply-To: <20180831103816.13479-5-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 19:44:22 +0100
Message-ID: <CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M4Okx5pWx4YB

On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Now that MMIO execution is supported, introduce a 'mmio-exec' property
> to boot directly from CE0 of the FMC controller using a memory region
> alias.

The name of this property seems to be a reference to QEMU's
internals: is there some other name that would make more sense
to a user who cares more about the guest and the emulated hardware?

> The overhead for the current firmware images using a custom U-Boot is
> around 2 seconds, which is fine, but with a U-Boot from mainline, it
> takes an extra 50 seconds or so to reach Linux. This might be related
> to the fact that a device tree is used.

Is this overhead just because we do a lot of execution from the
mmio region and that's slower than execution from RAM ?

> MMIO execution is not activated by default because until boot time is
> improved.

Can the guest tell the difference? I'm wondering how much we
might need to care about backward compatibility if in future
we fix the performance problem, or if we can just switch the
default to execute-from-flash without breaking guests.

thanks
-- PMM
