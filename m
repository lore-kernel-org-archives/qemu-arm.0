Received: by 10.25.21.156 with SMTP id 28csp48834lfv;
        Thu, 11 Aug 2016 03:23:07 -0700 (PDT)
X-Received: by 10.200.48.42 with SMTP id f39mr9707150qte.81.1470910987654;
        Thu, 11 Aug 2016 03:23:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b42si1156316qkh.95.2016.08.11.03.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXn8l-00067P-2G
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:23:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn8i-00060w-D7
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn8h-00079C-FM
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:04 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn8g-00078p-GS
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:23:03 -0400
Received: by mail-ua0-x230.google.com with SMTP id k90so112833733uak.1
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=blcUrtH246MgjqKT81i1GUP8zv5if4RUeowx2VWDjP8=;
	b=DIvXe+6Jarteklf74iXSCVmrQpSvJhCTgqBdYGORzxQtD/RkOgYmN8Zunt4PepOYbw
	2QdUrnc3rc0/30EQIIoaTPaTibSTyWaWcHuiM7VXAq6zovCprED1xWQhw25NR8/F6AIJ
	OvFjCS401ahTgdTGpPaOFQ5NwwQR+uoPC38zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=blcUrtH246MgjqKT81i1GUP8zv5if4RUeowx2VWDjP8=;
	b=AHdmSwRTKJZH08BBvQx76tE2cdJGyXYQrdMBQj2yFcPn6D8Vf+SJhtkuii8HDRCU+P
	xHBM2mvRFxAi9DklrvtzmhXG5yicqjAbsJMWhTOun4XUcpbazzsvUXpAgZdCNTZV93LO
	u0NsEM97ATmUvF7lU+waOXQvA8nEbFRbIKpSkfDCpQkhQm2qDRtcmKEnPP+KGqWX19Gu
	uR1wf/+VZjBQzi3eS+NAKH1cMXYgcq3H/jCQmdimpCjrwlBE/LMyyZUAFtx/nKRcwIIr
	C0cMILTSkdfnPghPWADzH7nWGbR4+AOgaKLUO+I2BYKIT/PuJxTWp7e7S9u08p2dbs1x
	TtoA==
X-Gm-Message-State: AEkooutFrlU0Es0LcX2JZM3nO+t2Ssb6SdBN6BuG3eA3ld13XBB9mqoGmSMfHQpnQLgNLteyL4fqBiP0UNzJWX9R
X-Received: by 10.159.36.22 with SMTP id 22mr3450610uaq.119.1470910982064;
	Thu, 11 Aug 2016 03:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:22:41 -0700 (PDT)
In-Reply-To: <1470158147-16378-2-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-2-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:22:41 +0100
Message-ID: <CAFEAcA9oQF-kCB4-pYkQn7euwnwyjVo=Oxnv2DbFYssA4_BtZA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH v3 01/10] ast2400: rename the Aspeed SoC
 files to aspeed_soc
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNAR8DQ3/vvh

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Let's prepare for new Aspeed SoCs and rename the ast2400 file to a
> more generic one. There are no changes in the code apart from the
> header file include.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/Makefile.objs        |   2 +-
>  hw/arm/aspeed_soc.c         | 229 ++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/arm/ast2400.c            | 229 --------------------------------------=
------
>  hw/arm/palmetto-bmc.c       |   2 +-
>  include/hw/arm/aspeed_soc.h |  44 +++++++++
>  include/hw/arm/ast2400.h    |  44 ---------
>  6 files changed, 275 insertions(+), 275 deletions(-)
>  create mode 100644 hw/arm/aspeed_soc.c
>  delete mode 100644 hw/arm/ast2400.c
>  create mode 100644 include/hw/arm/aspeed_soc.h
>  delete mode 100644 include/hw/arm/ast2400.h

If you give git format-patch the -M option then it will
enable rename detection, which will then produce a patch
that just says the file was renamed, rather than giving
it as a "+229 lines, -229 lines" enormous diff.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
