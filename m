Received: by 10.28.173.206 with SMTP id w197csp2964724wme;
        Mon, 8 Jan 2018 13:54:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBosW65XFWwcuhFX6b6x9q3BoDfGJeTlpIC+vhQtUEYx1e9oJFMMKOOMQDW9hZsybSanPTIEz
X-Received: by 10.37.244.14 with SMTP id q14mr12022364ybd.264.1515448463570;
        Mon, 08 Jan 2018 13:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515448463; cv=none;
        d=google.com; s=arc-20160816;
        b=aUl9mVkRow+N7KtNu82lGU2PcpjywAqXcRY+QED9W3jgTui4Y+YbFheOIQPwyUH2Bo
         gXhMw0S++r89Djglvgc+cb7na7xQ0deqHURFo9MvZNmo62wKBH1dDj/9tb+PiHrDeEUa
         5iUV4HBK2M/v7GeYyO0LYpDOg9ynGaT5sFWC61Qbhd5mSIYKji1vKpP1tuYSDV88YNCT
         q3qx7oJhJWoMqzb0wBZWK6BQO3UPg4l39WognCzk5m3qRFMtK5jJhY5uQ0PiA26SEvGU
         C7aLr+RxYf6dicB5EYyHoAVxTcEbgZVKHph1iwVH0scDPMdp2O8Lg7julObqXbXVn07G
         zlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=luQ74Jab2UK23obuGsBcnys3d0+fEC2zNFXuLfh6Dvs=;
        b=ngfarNFp0MeyDdV2s1waU3NX1q1VLSzZvBUfueFadkwDasehUxHX8+/O5CaWqMlhMT
         Ww98Df90qvvgXWAx6OTwJXX5ltc89t5NSF8d4OsX/6MWnqvHjGvWrEK4F2jGg7kB0oiz
         ADNy136AM4ZpPWWz0KYz9XHcuGnnSk1wwLaNc/8+wfHPMC2INgW9w1ybavD09Zs2RoNZ
         0zy5O9Rjp1ngHRJeVegytcB3UJpfbT9ukX1kpGeLJbcGWyd9Q0SmEn2Uasn1DP0dQbYL
         t6uBpmD8CJ0wCCvIA7KDofoXAX+e0kiOT5a6U+ejsQdFXqqemP/mAF39++ik1TK9Fk50
         BHzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ya4srsbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68si2644178ywf.308.2018.01.08.13.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ya4srsbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfN9-0004Ju-3K
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:54:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfMu-0004JY-6v
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:54:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfMt-00069Q-E6
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:54:08 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:40821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfMt-000697-84; Mon, 08 Jan 2018 16:54:07 -0500
Received: by mail-wr0-x241.google.com with SMTP id p17so12243490wre.7;
	Mon, 08 Jan 2018 13:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=luQ74Jab2UK23obuGsBcnys3d0+fEC2zNFXuLfh6Dvs=;
	b=Ya4srsbqjhro1vDDl31G/zFvqwbzDbd2vZ2PEiz3gnYBgGEaopM8MgJZbJsSf1lAU3
	qkrxeacW1ygdJN7zTb2CqNKNRCsckptNqbZHOoIbS/zutpiNXc1yIh9shpdS4mDRir1S
	WSaIjuNSzRKldjHz2PRTZGUuMygBtB2VsftNxc383atRxqEi7wDUJx6gdG6jeP2lwVTc
	0f3OV3R5EXMJLGQAPn1nl7oQ/zCh+So6YpLNCGOK/Xr6uu13fBHOSDCnBU3QZuaO1Fdc
	E+GBfaPj9lo3H9WFfT7DnEkKikdrS1F7oMlJe4FEP0Z66ddFzbq4T4+DFWCyBvuvXgMr
	9QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=luQ74Jab2UK23obuGsBcnys3d0+fEC2zNFXuLfh6Dvs=;
	b=PCTKGJrEFGzI5AarSePSUDUaK56AbI/9B8Ryhwl1bH1a0LAkCCcCE3uYteFQj6dlsB
	yLVY+HejMIfuPf55sa7zY17lfuZYf+WfmZb/yIoDuv7ihTEX+HanW+c3PNduBXdo9Aqa
	nhVXsk4rOz4JUdAilCSCrv4a3jK5pemYOVsG9R4memWFJVgv1F2PKhKpLnalLIGatWt2
	adNMfhrIsUcN//QusZ9ZnZELIraveFhsEVACQdj68dHvHseq/07t4/MNZe+3qYUc1qve
	Lj0jMhNYZJg4yyHuWRZa/1Vv0kpoTdS0D5SfO5svMvQbRPTQsG1FRrtFwOhxhc8sASgS
	v7Mg==
X-Gm-Message-State: AKGB3mK/nRNyWkvMOfeIOjAqzBhwakZi9TK36J1wAKLGCwAu487Eprn+
	TRFLfzSx2PIpBQRpD+BUo5uhIRZb0TwdeW21LGk=
X-Received: by 10.223.158.144 with SMTP id a16mr12330676wrf.83.1515448446186; 
	Mon, 08 Jan 2018 13:54:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:53:35 -0800 (PST)
In-Reply-To: <20180108154303.6522-9-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-9-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:53:35 -0800
X-Google-Sender-Auth: gCBCDPvWa8DSgttdPRlFcU7ZLzo
Message-ID: <CAKmqyKMaGf=OwErtFZe-KsdQnGPgNy-1KmNz+OvKeHEU5d2Jaw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [PATCH v5 08/31] hw/sd: clean/reorder the Makefile
 adding few comments
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWCuaZOlumkA

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/Makefile.objs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index c2b7664264..0fe2501017 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -1,9 +1,14 @@
> +# SD/MMC subsystem core
> +common-obj-$(CONFIG_SD) +=3D core.o
> +
> +# SD/MMC host adapters
>  common-obj-$(CONFIG_PL181) +=3D pl181.o
>  common-obj-$(CONFIG_SSI_SD) +=3D ssi-sd.o
> -common-obj-$(CONFIG_SD) +=3D sd.o core.o
>  common-obj-$(CONFIG_SDHCI) +=3D sdhci.o
> -
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-memcard.o
>  obj-$(CONFIG_OMAP) +=3D omap_mmc.o
>  obj-$(CONFIG_PXA2XX) +=3D pxa2xx_mmci.o
>  obj-$(CONFIG_RASPI) +=3D bcm2835_sdhost.o
> +
> +# emulated SD/MMC devices
> +common-obj-$(CONFIG_SD) +=3D sd.o
> --
> 2.15.1
>
>
