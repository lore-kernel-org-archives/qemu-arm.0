Received: by 10.223.197.9 with SMTP id q9csp4734418wrf;
        Tue, 17 Oct 2017 08:41:18 -0700 (PDT)
X-Received: by 10.200.52.149 with SMTP id w21mr20568819qtb.75.1508254878388;
        Tue, 17 Oct 2017 08:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508254878; cv=none;
        d=google.com; s=arc-20160816;
        b=eb3GBwo6JqU0EIWSQPBSne9k22RhrfajtaWibxZ1q/JKSVi3WvVJ8NYwSxYIwwIpsR
         P6O7dVGA9ZtoKQDnTsRIpLfIl4bIf0svumeAr166DwtviMUCtG8INAxNqSynwmLCGx17
         r5WasweFkDYyhcRSo9zAqzcW9fIgSaCGSE3CqMmLe57vQm6wktCiqbQyV4FTWe55RVTF
         9yXq9NZMsMGvSkJiWkcUjZ/xb4+ABxBkUZwgKoCn0m/JcL1QctfLimo1usVFG/fdeOn6
         zSMOjUvkpwaPcSKfUBPSF2tS9c917KjQ1jiaNSh/S4ihyYJzViXT6GqcIVLCDJ/iF6uT
         +vLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RKk0au0WLTnpNJW0u0053W58JYCV9twQGISEnnKFrco=;
        b=J5bTKEucYguga5xRB78iQ5sgYDHw1ryVDuhiGj5dgik7hUAL+ggGOLe37LsE/If52t
         kXF9HRPNu7XT0Rb5tgRsEjZdh9YKh2fTNfSHksYdTRmP4ZOrXhhj3IvAibpYNZRUxpyt
         tCQmZR64ACN2oqQ1mjJctawt0tEUxiCTnRgcgXjOP3hXwLoJBZhjEw4S7qAb/4/RcrJA
         R4Hu7o7gp7+MLI11t90jW8yeF/0BhQpGqWQNKoifQQX50c2DFw2ICQI7X0DJk5ufUTyY
         sVWMAkX/IeZyXUmonbBVZbtkDBcfHf84J6vU3nOzP7dtPo3F2CGmjJUu1KECxmLty6R3
         Frvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M1fxlF7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u123si922855qkh.184.2017.10.17.08.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M1fxlF7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TzY-0006wV-48
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:41:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Txx-0005dl-8a
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:39:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Txw-0007Hm-4w
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:39:37 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:49876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4Txv-0007HX-Ul
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:39:36 -0400
Received: by mail-wr0-x236.google.com with SMTP id g90so2150809wrd.6
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RKk0au0WLTnpNJW0u0053W58JYCV9twQGISEnnKFrco=;
	b=M1fxlF7RBR+v+Y4LMI1d2myZ41JDzmc1FJLAz26OgdHJCr7/lN7JDk04gwFSr6o7Wn
	sM82HU55DcldH9cSvM/wkT61cx1dUyrmZa1pPdABosdRJyySW5PXahHaWRezRlTbKT8W
	9jg9YUBDCncmVpGSvPzSQet534kG135Z9tQvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RKk0au0WLTnpNJW0u0053W58JYCV9twQGISEnnKFrco=;
	b=S9HX76tSQwwUEkMgGcpQ6JtpBx/GzjVRCHhZV6brlZqJyFv8+XOrcH4BiAPLMf9V3X
	OTcNF9nCbrKWrjFB9IdFByZH9QyU8jh8AzKNizUXe/TvCx7t5rk6CaNpmseG/A4VLvhh
	srDTg9pe69h3sXIkfU3yIKqywSupdvPMly0SYbnSoZvOgBJIvnDA1zcA72Gk+Vvanx92
	cy5LTCl23crV36bezblF0TpJ7m+fiVXFUcUAGkidfIQZ23ExsatjWOpkcKh/G9siSfSa
	uFiZLy1/9556cI9iwFhFpNJbhd7mAdfrTOtyOIYHUtIj3WHGNzzmq2spXjq2b4XrTdv9
	7/jA==
X-Gm-Message-State: AMCzsaUvcXtPQwwmk10ijv8QGlfuHg48xI/Uog4FfIBOd0p7pdxh2ABS
	eYuMCc5Ll12LHzhArJISeNXzP6G4yqohBiZN6DchmA==
X-Google-Smtp-Source: ABhQp+Qkz/xnjO7YAcTQG6CePIPTU2NPrsu1oBGfWwB37tL3TDxevhIcjBgYUqOeVaSLJCi2UvJm9xFxGZLtRUNtEZ8=
X-Received: by 10.223.197.19 with SMTP id q19mr4441310wrf.272.1508254774791;
	Tue, 17 Oct 2017 08:39:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 08:39:14 -0700 (PDT)
In-Reply-To: <20171013142852.916-2-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
	<20171013142852.916-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 16:39:14 +0100
Message-ID: <CAFEAcA-gYYbQu-Nuds3E0Aw7j0OdD5_ySm=EdMb1_FzxEoMTBQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] [PATCH v3 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5cLemZO1oGv

On 13 October 2017 at 15:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
> Let's add support for their BMC including a couple of I2C devices as
> found on real HW.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
>  Changes since v2:
>
>  - removed 'ignore_memory_transaction_failures' flag on the machine.
>    Will require a couple of fixes in the legacy U-Boot accessing wrongly
>    the bss before the DRAM is initialized.
>
>    The HW drops the write access surely because the SMC controller is
>    configured in autoread mode by default. I don't know how to model
>    this behavior in QEMU. I think we would need suppport to boot from
>    a MMIO region.

It is actually possible now -- see hw/ssi/xilinx_spips.c and the
request_mmio_ptr code. It's a bit experimental at the moment
though (in particular it breaks migration, a thing which we
seem to have forgotten to fix for this release cycle :-( )

The other similar thing we have is the flash devices, which
allow execution, but requires that the guest doesn't try to
execute at the same time as it's put the flash into
reads-like-a-device mode.

How are you modelling this bit of the address space at the moment?
A "reads like RAM but writes are ignored" lump of memory is easy...

In any case we can deal with this as a later patchset.

thanks
-- PMM
