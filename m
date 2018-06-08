Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp802871wrq;
        Fri, 8 Jun 2018 05:14:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJzHamH1qfKgRA0AtReGOX13Z1I5cnisGrmdTtrF4xFViwKdhZhcmxVKPMSRrmW9wTbu2Sc
X-Received: by 2002:a37:5a47:: with SMTP id o68-v6mr4803361qkb.226.1528460041313;
        Fri, 08 Jun 2018 05:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528460041; cv=none;
        d=google.com; s=arc-20160816;
        b=jU/x9VPHWmlxKIXicKJlaeGP+c6Wu4kmg11mz8C+CNjaY8h3lprq7qx56iYumQwAMO
         0uiOj1jMshv/UWD2vUeRiai4R/4nTBpkoVe4cL0nRJqk8mMskJoOC7q+Av5PAO/nIqL2
         CVJacz7xfAfbNhlizMTvjmfxpKyMwyTxSa1RJO+LrNrfcC0NQiciGOxLxQX3RWNXZ4wt
         2JzryRPUtAPJ1zkRZbWXc7lotxM2ApsXGwktNDaexii7iBOBaRMD1ImX7NfaPhaa8qLk
         RQW3LnHUC/VtiqUsAS8h/BkKHykxx70C8og+pLDu+vTb8/V+Cx/Iv0BHjcay3g6y3nu8
         +ZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=pasf5yMMHgV8xNZ7QD9FOTkgXCiXatrJ4F/6rKxWowM=;
        b=tUMjSFV6W5TrhYM6X6z1mN3XOkEI+kjZxZzCqBEkTsSSXR16UZu5iQwG1xF9lc5PkU
         W+ad9/keSZDs2X3ixykBPn2BNlX6sPRsAfF0NXsciwQMPdIbkt8kW2qcnzWNGfVOYvX3
         gkDBdrV9BRpd5fKUdvMtlWmW0Ud9APfbIMpkf1w/gARA2WbqqtOXTx79fE/1Bk4M3Rgr
         n6/RIWu3XyORA/w9Nq1kD7TJCafThZMkcYo5FP0+8yO6vGF3mBu6QKEq/xBdveCogHYH
         yBVxnFruh4eoAJqrOtnaY5ZwjXaOAM6NAEVKGcCXbVl9YaxQv9/us1k5ovzB/WpCAutf
         hIRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bjr231VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t48-v6si3655260qte.236.2018.06.08.05.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 05:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bjr231VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRGHI-0002fL-Rw
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 08:14:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRGHC-0002f9-Dh
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRGHB-000746-AC
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:13:54 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:45861)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRGHA-000734-TA
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:13:53 -0400
Received: by mail-ot0-x244.google.com with SMTP id a5-v6so15385629otf.12
	for <qemu-arm@nongnu.org>; Fri, 08 Jun 2018 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pasf5yMMHgV8xNZ7QD9FOTkgXCiXatrJ4F/6rKxWowM=;
	b=Bjr231VHVBNHH5//oZcmaP2A40rkag+2uDN6Z82BznK4ajO14liNJHzpehZbxGedeF
	u4eUa6Iit4D9/FgusGzNPmx4ieI9BNRzXMJAXoscXW72jrEPJW54/AcsV/IKOfyRrRYo
	fmvtdgu3OODwYSz2wCLawI8OfDLt5T+nAvvhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pasf5yMMHgV8xNZ7QD9FOTkgXCiXatrJ4F/6rKxWowM=;
	b=kD26I6w3bARk7hgpOKCYJyMOOEqJnAPYmSpOyeB6TIfidz4pn8IpwuX1NQ3kLSfoCa
	lUO+wUeevGsMg4I67QQcu9AnmTW/Hesw2qNvRnV/XGzAMx74zWVNVSkVzDeTtCdeehwl
	5IOF3NQ8UXKKiDhPPQETtNwf7GJV27FXx4f7K8/+WFbi6XRY4xaBQMRCuWcS4TBwTs0e
	ZuH7+HXDjWVpGs/1E1Q7JuyRufrYK5Ucuy1EKxEM3SpJSxATitrvvKusMZ/QCiYcJFvA
	7rwd+YE7WA2aa7V/s7samRgPaHhYCRLI5U+NlpGgdCIhERYqpIzbrciDendnbKwZsCf8
	wUiA==
X-Gm-Message-State: APt69E0qC9hzZNLaVuvJ4GoTGWsVYgZnbM0dsYhbsmKY/4yKv6ecXJ/m
	wdHGc0ImrH9Rxb38GHBfmVVGfuFhSWNCQKHoEm02uA==
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr1041440otc.294.1528460031838; 
	Fri, 08 Jun 2018 05:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 05:13:31 -0700 (PDT)
In-Reply-To: <20180607180641.874-8-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
	<20180607180641.874-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 13:13:31 +0100
Message-ID: <CAFEAcA_9e6_=2doj0_uJCDEWiho0WqnAU6SXhdh--Yeb7m++nw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [RFC PATCH v2 7/7] hw/sd/ssi-sd: Force cards
 connected in SPI mode to use Spec v1.10
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CheYH2LAcD9F

On 7 June 2018 at 19:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Due to physical restriction in SPI mode the maximum transfer
> speed is limited. All the extensions added after Spec v3 are
> simply not supported in SPI mode:

You say here that SPI mode doesn't support extensions added
"after spec v3"...

>   7.1 Introduction
>
>     The SPI mode consists of a secondary communication protocol
>     that is offered by Flash-based SD Memory Cards. This mode is
>     a subset of the SD Memory Card protocol, designed to communicate
>     with a SPI channel, commonly found in Motorola's (and lately a
>     few other vendors') microcontrollers. The interface is selected
>     during the first reset command after power up (CMD0) and cannot
>     be changed once the part is powered on.
>     The SPI standard defines the physical link only, and not the
>     complete data transfer protocol. The SD Memory Card SPI
>     implementation uses a subset of the SD Memory Card protocol and
>     command set. The advantage of the SPI mode is the capability of
>     using an off-the-shelf host, hence reducing the design-in effort
>     to minimum. The disadvantage is the loss of performance of the
>     SPI mode versus SD mode (e.g. Single data line and hardware CS
>     signal per card).
>     The commands and functions in SD mode defined after the Version
>     2.00 are not supported in SPI mode.

...but here quote the spec which says that commands defined after
version 2.00 are not supported in SPI mode...

and then the patch itself enforces spec 1.10, rather than 2.
So I'm confused.

> The card may respond to the
>     commands and functions even if the card is in SPI mode but host
>     should not use them in SPI mode.
>
> Some firmwares use the CMD8 in SPI mode to poll which Spec version
> the SD card supports.
>
>   7.2.1 Mode Selection and Initialization (SPI mode)
>
>     The SD Card is powered up in the SD mode. It will enter SPI mode
>     if the CS signal is asserted (negative) during the reception of
>     the reset command (CMD0). If the card recognizes that the SD mode
>     is required it will not respond to the command and remain in the
>     SD mode. If SPI mode is required, the card will switch to SPI and
>     respond with the SPI mode R1 response.
>     The only way to return to the SD mode is by entering the power
>     cycle. In SPI mode, the SD Card protocol state machine in SD mode
>     is not observed. All the SD Card commands supported in SPI mode
>     are always available. [...]
>     If the card indicates an illegal command, the card is legacy and
>     does not support CMD8. If the card supports CMD8 and can operate
>     on the supplied voltage, the response echoes back the supply
>     voltage and the check pattern that were set in the command
>     argument.
>
> The NuttX RTOS use it too:
>
>     /* Check for SDHC Version 2.x.  CMD 8 is reserved on SD version 1.0 a=
nd
>      * MMC.
>      */
>     finfo("Send CMD8\n");
>     result =3D mmcsd_sendcmd(slot, &g_cmd8, 0x1aa);
>     if (result =3D=3D MMCSD_SPIR1_IDLESTATE)
>       ...
>     /* Check for SDC version 1.x or MMC */
>     else
>       ...
>
> See https://bitbucket.org/nuttx/nuttx/src/nuttx-7.25/drivers/mmcsd/mmcsd_=
spi.c?mmcsd_spi.c-1645#mmcsd_spi.c-1645

This seems reasonable guest behaviour, and it's what the spec says
to do. Why do we need to enforce 1.10 to get things to work?

thanks
-- PMM
