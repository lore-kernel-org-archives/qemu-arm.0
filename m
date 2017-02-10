Received: by 10.25.77.65 with SMTP id a62csp532922lfb;
        Fri, 10 Feb 2017 07:20:30 -0800 (PST)
X-Received: by 10.200.56.4 with SMTP id q4mr9415790qtb.73.1486740030390;
        Fri, 10 Feb 2017 07:20:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b197si1449722qkc.251.2017.02.10.07.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 07:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccCzr-0000tA-By
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 10:20:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCuL-0005Gh-35
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:14:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCuK-0005OS-6m
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:14:45 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:37918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ccCuK-0005NT-0E
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:14:44 -0500
Received: by mail-wm0-x22b.google.com with SMTP id r141so51067606wmg.1
	for <qemu-devel@nongnu.org>; Fri, 10 Feb 2017 07:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6orDMorTVhbYNPehJYwIfcD92UXHs1LoDZMULoHdswg=;
	b=a7LR67rNRmQ6X/sNuBFfuZZNj6prsPnBxgD+EJDLLBwal5RGav8FiATwHSR56n2khv
	g6Vcno2WdEyCYQn98YI50BdcZorI8l9fIomsj2qkXD641PR98pFiShCxlR/6lUDfjRRD
	6kF6Ekn2kt3aC84cry0tC5WtdTZzyeziih2Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6orDMorTVhbYNPehJYwIfcD92UXHs1LoDZMULoHdswg=;
	b=YLX37oyhn/9Fjy9CWylDX+fGK7tA64OIx/ZKkwZeFucqfaZBumqoyO9Lsq7QbI7JRs
	ruJN/TNzo1sqNfjI1pgaAVv8jaPquLfwoMyHi1LuIHL/S/c0Kj4jCuxRwbL4cTeMUc4A
	ANf2uK0n2lKEhiNNKZ4/cZUF0ePkv22/BefS6Mlin3bwlZ4PV+1IIclwOUO7fcjSZMTP
	K6FRbJFB+6Zi13tCirMh0wbaCyj413TtQMqLF9pz4YuC5c+Z1hrhBdw/8PVq8Tfy8pVl
	3cl1bcD9HPJlePnqJD15xHk34Q2FHByBD0A4TC6dZ5u+bDcGroVVxLUyQgkd/6OjR2B1
	bNrQ==
X-Gm-Message-State: AMke39mDJ1aAkkQ57jLYXkLDcVcPM5yRsFijZ5DmdP/mH70KIU8fIJS8yvdNCv0x6PNqB8SXIRHgERTD26gu3VJh
X-Received: by 10.28.91.16 with SMTP id p16mr7734667wmb.111.1486739683084;
	Fri, 10 Feb 2017 07:14:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 07:14:22 -0800 (PST)
In-Reply-To: <1486648058-520-1-git-send-email-clg@kaod.org>
References: <1486648058-520-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 15:14:22 +0000
Message-ID: <CAFEAcA_3WVww5Nnr7oBOAQtCFsZCUWNZQrEVivSJtay_Z9WkhA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-devel] [PATCH 0/4] aspeed: miscellaneous small fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gPwj0X+db2qv

On 9 February 2017 at 13:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here is a short series fixing small issues in the SMC controller model
> of the Aspeed SoC.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (4):
>   aspeed: check for negative values returned by blk_getlength()
>   aspeed: remove useless comment on controller segment size
>   aspeed/smc: handle dummies only in fast read mode
>   aspeed/smc: use a modulo to check segment limits



Applied to target-arm.next, thanks.

-- PMM
