Received: by 10.223.197.9 with SMTP id q9csp3378021wrf;
        Tue, 10 Oct 2017 02:55:55 -0700 (PDT)
X-Received: by 10.237.46.98 with SMTP id j89mr19748542qtd.182.1507629355471;
        Tue, 10 Oct 2017 02:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507629355; cv=none;
        d=google.com; s=arc-20160816;
        b=poBqdU8yMLAfut9KQw3Texc+byszorXG0S9Hq0YY3zAdVLKShgr/Ye6zgU3i18KOPd
         2zQLEnXL5gnOgjFink3k48OA0L5+4OIh8Eeg6fg6eHmoQ84tZFeD0dFKWNzJph8yZ/RR
         RwCzGelMsrn/eNd4X341Cidyte32Nu4mIRx7yPCY8TsgBZt8iN7Z/qBP9P5j/K169LzA
         kINhohUxj5zYQkH56RxVpFxOyRAfGEgxRrRb7HXJl5U5cVRouSpqQ6zcZfeTASAsWEXG
         ZvPqfDlU6fb1bgKeazDvB401tegd+aXbSjM+pG3LS2oKNjaRwbeZowXKOp0jDNGH1+S7
         bFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=nXcfDHeR4l72LGSZWQ4hsam1cn3Uc6gn4O/i3sIcWEU=;
        b=KyBSD8Gx7ROWkNkCFwT5hBoyuA8x5qjn5fr3f5WWm6AuAyaqfcnbTJ6VHM/GFPHQyY
         RxiJvXrTjvWCGKrCP55MfYlxmFYglsqXPa5d+IV2/vU/tnaRRZyXK0y4AnGV8QjI4mgf
         3nsgdtBR9ijm1uFKWixxE7YGyt9YrDrqW8h/hMeEFVoUbd7XZrzhUCyRKc2WOTm4lnWO
         G2/R02l95OE8EuliMJFSZmxg+psc+eLggIqJvzcwJpDAzC8UYOFyGinr8/GfQUXL8vTe
         GU+aVtnl6uCqeh6UEJOI8bxcNsOGCKCpnA8I5hXZceLvRgJDQ28nPivSKPZ+nUgV58Lm
         xM6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RPz9B2vg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k59si2301996qtd.227.2017.10.10.02.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 02:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RPz9B2vg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1rGT-0002qV-92
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 05:55:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1rFV-0002T5-OS
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 05:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1rFU-00070X-SN
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 05:54:53 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:46718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1rFU-0006zx-MN
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 05:54:52 -0400
Received: by mail-wm0-x233.google.com with SMTP id m72so3472773wmc.1
	for <qemu-devel@nongnu.org>; Tue, 10 Oct 2017 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nXcfDHeR4l72LGSZWQ4hsam1cn3Uc6gn4O/i3sIcWEU=;
	b=RPz9B2vgnMXb5kfBIuIm6LV1fDd2XscSuzNWMX5sbr6YPOU57eBPJs9H01KzIl9vxz
	v1yFyMKF21zDjo+rBPDGTUfmwxFgqXP9aDSybp4LWxMx+52f3+Sj44397X3wkU9usvsm
	aLb6vEeABs8kOVFxQJoxOOb64+gwLr/ZYcn7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nXcfDHeR4l72LGSZWQ4hsam1cn3Uc6gn4O/i3sIcWEU=;
	b=XvCvtdY9RMGaATftRWCEIB1ooarq/WXYX/NBcNwI3kbCZfQvSeNMX69fnseq2SgXDP
	+/TLEfMygnGocfl9l6NQLczCSNZ26CJxAYk7Tr8qVeeqh7zBjsbGjq/isGIAiuG3kY0t
	Oos7Y5WsYi6z6rL5lPARHwOvYpjZyM3ujWvu2deaNWl5Wf6JZ9i5VP/hZ+wcXTBQILQC
	ajXqBJKhzthGxxNQRqbRtbp98ioLmrwjEt/vFlqHzzmv3c3SgpvxtpbKvoWhMM5asdkU
	SMYmmypE+ZNKuechzzBBIdEmRr+i0etmSRbhi3QxEONON9k87QudFGeA3dm8vaKKfroI
	smpw==
X-Gm-Message-State: AMCzsaXajCqxEaq80ihOH9QFqI8N3jiTjC1cc+58U9ggf0s/A6mRvIE6
	4kgZASfU+y4qIJ8mQqGypsW5AGXSqxHbE1lmoxJcmw==
X-Google-Smtp-Source: AOwi7QAMfgByag75IdcZCUHGaI2KPe4zoHQPQmAYXu17NNysxW9aVE2YBEHTqWPM5fYP6GcofR9GzlGEMBYMDRMJpsk=
X-Received: by 10.28.113.196 with SMTP id d65mr9533457wmi.151.1507629291519;
	Tue, 10 Oct 2017 02:54:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 10 Oct 2017 02:54:30 -0700 (PDT)
In-Reply-To: <f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Oct 2017 10:54:30 +0100
Message-ID: <CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-devel] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4mXPQkyKGoh

On 10 October 2017 at 10:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/06/2017 05:10 PM, Peter Maydell wrote:
>>> +    mc->ignore_memory_transaction_failures =3D true;
>>
>> Please don't set this flag for new board models, it is only
>> for our legacy existing ones. Instead implement any devices
>> that you need for guest code to boot (stub them out with
>> create_unimplemented_device() if you like).
>
> I have dug into this a little more and it seems that it is
> required for the Aspeed bootloader (a modified u-boot) which
> uses static variables in early init phases. So legacy firmwares
> won't work in QEMU but will on real HW.
>
> It's fine with me but what is the goal of the approach ? Force
> SoC providers into fixing their FW when they use QEMU ?

The goal is to model hardware correctly. Hardware gives
aborts if you touch a physical address with no device there,
and so QEMU's model should do the same. If you have guest
code that touches a physical address and blows up because
of an abort (but doesn't when run on h/w) then either:
 * it is trying to probe a device that exists in real h/w:
   you need to provide a stub implementation in QEMU
 * the SoC's bus fabric really doesn't pass aborts back
   to the CPU; I think this is unlikely, but you can model
   it at the SoC level with a suitable default memory region

The purpose of the flag is purely for existing board models,
where it is impossible to enable the correct (abort)
behaviour without possibly breaking guest code images that
work for people using released QEMU code. On a new board
model we don't have that problem and we can get it right
from the start. If we don't get it right from the start
then we will never have a chance to fix it in future.

Our mismodelling of this (not turning accesses to invalid
addresses into CPU aborts) meant that in the past it was
possible to be lazy when implementing a board model and
just not model half the hardware at all. Now it isn't,
but I don't think that adding a set of calls to
create_unimplemented_device() is a significant imposition.

thanks
-- PMM
