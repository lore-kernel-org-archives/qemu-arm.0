Received: by 10.223.159.74 with SMTP id f10csp140364wrg;
        Fri, 15 Dec 2017 16:01:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBovrQJ5EYXKZvVc7gwwVM9fIUyB9tY5gHVvfyqS+59jDdrxB3F37/0QczOf+TZyyk5alow87
X-Received: by 10.37.72.5 with SMTP id v5mr8047620yba.203.1513382502809;
        Fri, 15 Dec 2017 16:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513382502; cv=none;
        d=google.com; s=arc-20160816;
        b=Snw4miNt3tr2EJKEza1bGXfCUNaFLT1PWbN2+aa4+vvMhMvCO2oyYR6ZCn7Hks/DK6
         NNgp4g1KojVnx1XdEiNrGlZq0i3zc8Ii3zgA3oOPjE0+RfqbzOnGKh4tTOPt+zJa9N1P
         8Zw26hDJtA1xN0ESWqY8e9nWGgYoOJ9IoPk2JcuamByXPp4Poc5Rl10SPzaMac581+GZ
         lobN5JU/H2bt+NZLyi0vlOIymEkwTssTtIn+O9flwlBI4HOsXZkga6bQmrTzE2jU2Fhl
         3qdREyOqTCMqN+mFb4s8qhYTe8NVC2HRGcH1ZUiDYAqFkyA+EApBHnaSrQ1IoMXYWcin
         8eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=LU9QlHdN6PeV97CCGbIFJPTaXrfeppJi3mNttwrIF80=;
        b=JHEvraLowZKOWKpPTAHnPUsuFzY8iU//AiioFtHt4OKMo1zmln97nqh20ZA4gbXPu6
         QfTE5cRZMt3tYVtAdQL5sK2KKQUg401Swap3vYre/6z9bwcjtH8eMlFb7pKtN03eroa/
         LbtJs5I6r3tc3bGRNxpusfH2ZTE+NQh9KYWjA1xk3+WG6uYsu957hM7HcfGu4AjdN3II
         dbbkgjAtdixxrl3ADGaP9BbTk0Y8iHo9Cw9wGsZi8r5cIZ4/Tyixdt5b5rPyBmMvoE6E
         q4A8kmSt1alBVpP3A9DhPwoqMVhSnSdo/qhOP7GkBidnGDBBjtnz2h5cHwaAChxFXMJ2
         209Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tf/NGMbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124si1502169ywe.352.2017.12.15.16.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 16:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tf/NGMbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePzvC-0001R7-9t
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 19:01:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePzuy-0001PK-7G
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:01:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePzux-0004aN-CI
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:01:28 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:40341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePzuu-0004WQ-Iw; Fri, 15 Dec 2017 19:01:24 -0500
Received: by mail-wr0-x243.google.com with SMTP id q9so9395629wre.7;
	Fri, 15 Dec 2017 16:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=LU9QlHdN6PeV97CCGbIFJPTaXrfeppJi3mNttwrIF80=;
	b=tf/NGMbjt64hda0Nj02CZG9AOCwq0U01T1liSpnAlep6TtO7rfeK9fTTLGlvJMNjUU
	Qps/cODfaJw2zS18PJIvhpqTnj2p6BardCyTifjT6isKLy30eqsYflKasx2GomtfxN9E
	8sVWIbMIioANL0UYbbmfzj0spaDaFIQIXT8BLtw/9hame2/8PywRdd/lf5oI/KweYkVW
	CLQCH5uVY5gqdVoBLp3cxvCVK7cH8vTh1tshMlvEt1csa6BVhIGkR8ORYboigerPEZ/I
	d3SFV/+OVkt6iFOBEbzTTHdyJbh/TV2/9+35xBdZFXKmORACpKiuG3PhBfH54RCoZPUO
	YMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=LU9QlHdN6PeV97CCGbIFJPTaXrfeppJi3mNttwrIF80=;
	b=eVTkFhiHv3DrLnUdNfzVlMx4b/TbcYxhCgxEY56eXKIJ34sulB9JzazfAdXETxENI0
	hCgnUQ/lS12ZC1OOvmUj/1dWE6MX4CSzcnsDS8li7f0keJm/mtEjAftgO0QrZHdIOc6p
	Mz5/gHYkKNAwKW+/1iDVBfN4z+loiVQGEaE5hTNPAVZqbf8cVkrOO8di8SkSgGpJSUoB
	qFoUZP2p0q+BL0R0brRN3aCAgOJKjftos8v3sbbgVeizpV8DkPjRfwDfvwFTdlxxGzix
	Pp3rWE32WkpN7MqEqn3K60rJvzw0jIvp+2RYDaysrTxW6kIwWJwg6KLE1lmNL/FY3b0v
	T94g==
X-Gm-Message-State: AKGB3mL/uSnZnpfXIKmhIQCXRCAQOHjqvqQ13zzCJWD6zgPYoOBWUS6d
	jDIcv5Yp2Zl9qeCSGTrv+QdCxfoogn5dq7eDxFI=
X-Received: by 10.223.171.79 with SMTP id r15mr455610wrc.219.1513382483378;
	Fri, 15 Dec 2017 16:01:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 15 Dec 2017 16:00:52 -0800 (PST)
In-Reply-To: <20171214020025.4004-3-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
	<20171214020025.4004-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 16:00:52 -0800
X-Google-Sender-Auth: GhECj8-Snrf0E4NlozgO-T6SNsw
Message-ID: <CAKmqyKOmR_qrmVAA=CLMUp-AZK-Xz_HYP1wMVO+AWuK973p0kA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] sdhci: some ARM boards do
 support SD_HOST_SPECv3_VERS
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ig682lQpI8KZ

On Wed, Dec 13, 2017 at 6:00 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> set the property with object_property_set_uint() or qdev_prop_set_uint8()=
.
>
> [Zynq part based on a patch from Alistair Francis <alistair.francis@xilin=
x.com>
>  from qemu/xilinx tag xilinx-v2015.2]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/bcm2835_peripherals.c | 7 +++++++
>  hw/arm/fsl-imx6.c            | 6 ++++++
>  hw/arm/xilinx_zynq.c         | 2 ++
>  3 files changed, 15 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 60a0eec4d1..e686725015 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -264,6 +264,13 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>          return;
>      }
>
> +    object_property_set_uint(OBJECT(&s->sdhci), SD_HOST_SPECv3_VERS,
> +                             "sd-spec-version", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 59ef33efa9..c474e707af 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -348,6 +348,12 @@ static void fsl_imx6_realize(DeviceState *dev, Error=
 **errp)
>              { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
>          };
>
> +        object_property_set_uint(OBJECT(&s->esdhc[i]), SD_HOST_SPECv3_VE=
RS,
> +                                 "sd-spec-version", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized",=
 &err);
>          if (err) {
>              error_propagate(errp, err);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 9275ae6daf..0292feea74 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -250,6 +250,7 @@ static void zynq_init(MachineState *machine)
>
>      dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
>      qdev_prop_set_string(dev, "sd-bus-name", "sd.0");
> +    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
> @@ -262,6 +263,7 @@ static void zynq_init(MachineState *machine)
>      object_property_set_bool(OBJECT(carddev), true, "realized", &error_f=
atal);
>
>      dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> +    qdev_prop_set_uint8(dev, "sd-spec-version", SD_HOST_SPECv3_VERS);
>      qdev_prop_set_string(dev, "sd-bus-name", "sd.1");
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
> --
> 2.15.1
>
>
