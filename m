Received: by 10.25.21.156 with SMTP id 28csp462391lfv;
        Thu, 18 Aug 2016 12:06:08 -0700 (PDT)
X-Received: by 10.237.44.195 with SMTP id g61mr4383339qtd.105.1471547168141;
        Thu, 18 Aug 2016 12:06:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si2175998qkd.274.2016.08.18.12.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 12:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baSdj-0003rO-IT
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 15:06:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baSdg-0003p3-6c
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baSde-0006dF-6X
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:06:03 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:33576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baSde-0006d8-1e
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:06:02 -0400
Received: by mail-ua0-x22e.google.com with SMTP id 74so44025914uau.0
	for <qemu-arm@nongnu.org>; Thu, 18 Aug 2016 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T6IkiToineVzKRR9u8XOVSU2umues7a17rNkk3DwQSI=;
	b=K3GmKpkbUfrefdBCVXX9PGQFuuPG0NUmZGy4MriiIKt7LglOUWeRm5VsuPYFk9nG5W
	sKMvY7/23ngH2jupZWjTFzg6ZQo/6Fidfs+IBYi4n5uh96vKWXmo5ZmSAKNznN5NBVIr
	lsZA6py7saeh2/5kMuRQhRC1Cy8Ay12u4Mc6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T6IkiToineVzKRR9u8XOVSU2umues7a17rNkk3DwQSI=;
	b=PZ6Woo7jGOMkScyFdzBGmj/sFseUUHrUO+bsfd1MpWq/hC24WAcYNJbe9C7WP4Br4H
	pOmTlMnVi2IydLUJfqpE09D106NZHf9FlUvOWxFvX9aJok5p067pGOPQckGj2VdPzSST
	I2FfY6FtLer/qMDIxLgtGM0kfBHXMEOW0D3Zksoad+MWWPz5N43pjgfr+f33JmZJBfXf
	SKJ6IcrJtv+cYyJi21qOxAom5gcPX0xAFdS7p9GDyUgWkrEFLGQ4VatB0948UYdv3aT3
	DobEKo/KsOEgzdJeHH3WVVz5xwHINZeG6sWoFJhCu4BWPLu1kZ8bsF1sp/r7dvyVFY05
	cArQ==
X-Gm-Message-State: AEkoouuSAk3UWqoU19mkxK9E15y+vrjuKObNjNMG61x+dJQ/w/KEB8B97d5t+T96Q7BLEIhApPrLg3dxG6r9s11S
X-Received: by 10.176.80.4 with SMTP id b4mr1851249uaa.17.1471547161630; Thu,
	18 Aug 2016 12:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Thu, 18 Aug 2016 12:05:41 -0700 (PDT)
In-Reply-To: <20160818190421.GE2009@work-vm>
References: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
	<CAFEAcA9oAi5++H0eYiE-SyHMtLFmD5haw+d0DsN+MLo29f9U_A@mail.gmail.com>
	<20160818190421.GE2009@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2016 20:05:41 +0100
Message-ID: <CAFEAcA-bnav367B38xcjZt0-TLXh68ZWB3DoJwvu2RT3qRu-Sg@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] hw/arm/virt: vmstate-static-checker.py results
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
Cc: Andrew Jones <drjones@redhat.com>, "Krzeminski,
	Marcin \(Nokia - PL/Wroclaw\)" <marcin.krzeminski@nokia.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xM+AZSLGP+ni

On 18 August 2016 at 20:04, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> Hmm, except there are two separate things with the name "xilinx_spi";
>      vmstate_xilinx_spi in hw/ssi/xilinx_spi.c
> which is the state for the "xlnx.xps-spi" (aka TYPE_XILINX_SPI) object.
>
> and for added confusion:
>       vmstate_m25p80 in hw/block/m25p80.c
> which is the state for the "m25p80-generic" (aka TYPE_M25P80) object.
>      also calls itself "xilinx_spi".
>
> These went in a pair of Peter Crosthwaite commits at about the same time 4.5 years
> ago; I'm guessing it was just a copy-paste.
>
> I think my preference would be to update the name for the m25p80 so it's
> not got the clash; but it seems m25p80 contains definitions of about a zillion
> flash devices all derived from the m25p80, so I think I'd have to try one of
> them to see if the xilinx_spi name finds it's way onto the migration stream;
> I suspect it doesn't.

Aha. Yeah, we should fix that. (I have a feeling the m25p80 devices are
all only for boards where we don't care about migration-compat, but I'm
not completely certain.)

thanks
-- PMM
