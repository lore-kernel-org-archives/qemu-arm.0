Received: by 10.28.173.206 with SMTP id w197csp4559704wme;
        Tue, 16 Jan 2018 15:12:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBouk7WcGr+M1AQjVB3k5oq7kNxq8WzQwnqIIp3pT35IFfZY1g3e0hbVQK7ly8LImWL2inJA6
X-Received: by 10.37.130.133 with SMTP id r5mr10117775ybk.316.1516144330628;
        Tue, 16 Jan 2018 15:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516144330; cv=none;
        d=google.com; s=arc-20160816;
        b=M3Qglfz+7nfTaLJQcVaOPZhK/ULfTJOvAq4P0GsI+yF6GkS8ZFDMK0LaPcxSOspZ7s
         5MQWkVjhq62dwtZ/B2lKF5UQTxaGcHTNfFQOkl/zEhh86jYV3L2RGBQZweddzkAca/oq
         vI24EFwV/J2xIe4GVe31SF9ngY8J6mMoxUCAJRNNJ4TXfoo5Vam6TSvsSSEPqADCUTCg
         IWzprTQyvodh1lhQKLoYUlVopC88ANgOomu52rhGxl/cJMZi3J3v/LAzQEQAv79uyuNU
         AEM5wBioj6zf5IXy+Z9Urd3mUMnZ9IocH7jAdKm+eOJV0pZn/gHegxj9LPtCejN7pp59
         ubUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=3TL0q1ySV4kyA7fyniyKtb2EcP+dgOyJXh3ZJqAimYs=;
        b=ZdB7CPdjQuvbnfg+n8dvIptER0nsbA5HnmDg/LRMNNh4RPZgmAaGIazqs1u+B51m/r
         dmuMdf+Uqub9odQ/rQ2KUe2ma5pN6hcJk20FQznFTmszrdkB1USMcJXoi3LCYDvvfSX8
         K/tLfqtQIIbw7Ammywh8tr1Yqgc3qbRA//Z4j0875UDq9ilbf97usAA9PTvuKFgH6e8R
         UMg3U7+WA13nbE1IAWRuOpPGtV8jwFqo9J4y0KpxLN01FK/sb3tz6JlGj34pBPFoBuJJ
         Le/tMJJy/fcE7b6QA2WjZeT2GzRY5/XB8UBVbLq789xMQUsWV8brRLEXaJAlVrdZElnN
         lAFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JVHCKEQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8si796622ywl.50.2018.01.16.15.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JVHCKEQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebaOo-00052i-1K
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:12:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebaOa-00051A-Qf
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:11:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebaOZ-0001LE-IJ
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 18:11:56 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:44419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ebaOW-0001Ik-IB; Tue, 16 Jan 2018 18:11:52 -0500
Received: by mail-lf0-x241.google.com with SMTP id w23so19478227lfd.11;
	Tue, 16 Jan 2018 15:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=3TL0q1ySV4kyA7fyniyKtb2EcP+dgOyJXh3ZJqAimYs=;
	b=JVHCKEQYP1qRuliRBv+VycMOfmFYIrSrLOMWpeFYV8XJcGgPi82G1may93tpSfpdZG
	wD9yFrdK6Bj7NeUH94ooDYvuff3/O8y1edMOCQp80irzT07jgdRTCQ6E3wTQZUqD65R9
	yFPaUlfR1oayRQSyTK48TWyaUaGFq0EoifhLLvGNokin5ueKjLQsix8feJk2bdRMgYtZ
	Yn8+EOQvamOnVUcbT3K3o5pxTWc4Q37/xSJPMbZPz1XeQL5iNo2gxKsrsjR3gCy3Ejl7
	YKlDZcTUq30RG6RW2OPV/MF5rEN4XjGIdsEvPZToSOFJvNtlo+V5pJ0AQoij3roWU4y0
	pJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=3TL0q1ySV4kyA7fyniyKtb2EcP+dgOyJXh3ZJqAimYs=;
	b=lHjyd0FcX9mn6CxRHjcNLXmpb3K8mqPW4cl8xUyTx2LSH5SQgvYAmR+aUP9vouXCyd
	jkl+KkHn+Y3n3W+/Cb9WGPBp1tFeciRQV1g3JE1ehAF3cQkUKtGWXLqoTGRn6IVd4Vtz
	OA7O+PPQptWRlDSMDoz7l+Fejw3aLZHAknD2od49JlObHeBYQ9qq1bKzAZofDgAhB+TW
	j19GcSv5C114pVuuo58nbmi/YVotb2jPUmVqLaVAXYYwe/en3lRmEqAEr0c5nIGUmtzQ
	0DhPPu4rDQznunUWeurD6dAPQpYlmwsIhcRSKPe5WxOjOlCbS5okeih+k3GlYLgc0D6j
	71Ag==
X-Gm-Message-State: AKwxytciKcWjcHiBRuBrOKS7oWVh9z9bN++yLFnYHAjVPo8WUjBk9kT5
	8DcMclUrteBfKJE05958VbHvMWD4pbRejJ0Evo0=
X-Received: by 10.46.77.193 with SMTP id c62mr11412150ljd.148.1516144311110;
	Tue, 16 Jan 2018 15:11:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.64.196 with HTTP; Tue, 16 Jan 2018 15:11:20 -0800 (PST)
In-Reply-To: <20180111205626.23291-12-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-12-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 16 Jan 2018 15:11:20 -0800
X-Google-Sender-Auth: 1YjY6Q19Of-c5uMKk2zbZMjuYv4
Message-ID: <CAKmqyKO83wzFUZdHSPf4bjwtERaOPhPkm8K75z8V3qjjeNKm5A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/21] hw/arm/xilinx_zynq:
 implement SDHCI Spec v2
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Re1lhfP1dSI/

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 64 ++++++++++++++++++++++++++++++++--------------=
------
>  1 file changed, 40 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 1836a4ed45..9a106db7b7 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -165,10 +165,8 @@ static void zynq_init(MachineState *machine)
>      MemoryRegion *address_space_mem =3D get_system_memory();
>      MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
>      MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
> -    DeviceState *dev, *carddev;
> +    DeviceState *dev;
>      SysBusDevice *busdev;
> -    DriveInfo *di;
> -    BlockBackend *blk;
>      qemu_irq pic[64];
>      int n;
>
> @@ -247,27 +245,45 @@ static void zynq_init(MachineState *machine)
>      gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
>      gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
>
> -    dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
> -
> -    di =3D drive_get_next(IF_SD);
> -    blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> -    carddev =3D qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_C=
ARD);
> -    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> -    object_property_set_bool(OBJECT(carddev), true, "realized", &error_f=
atal);
> -
> -    dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
> -
> -    di =3D drive_get_next(IF_SD);
> -    blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> -    carddev =3D qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_C=
ARD);
> -    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> -    object_property_set_bool(OBJECT(carddev), true, "realized", &error_f=
atal);
> +    for (n =3D 0; n < 2; n++) {
> +        int hci_irq =3D n ? 79 : 56;
> +        hwaddr hci_addr =3D n ? 0xE0101000 : 0xE0100000;
> +        DriveInfo *di;
> +        BlockBackend *blk;
> +        DeviceState *carddev;
> +
> +        /* Compatible with:
> +         * - SD Host Controller Specification Version 2.0 Part A2
> +         * - SDIO Specification Version 2.0
> +         * - MMC Specification Version 3.31
> +         *
> +         * - SDMA (single operation DMA)
> +         * - ADMA1 (4 KB boundary limited DMA)
> +         * - ADMA2
> +         *
> +         * - up to seven functions in SD1, SD4, but does not support SPI=
 mode
> +         * - SD high-speed (SDHS) card
> +         * - SD High Capacity (SDHC) card
> +         *
> +         * - Low-speed, 1 KHz to 400 KHz
> +         * - Full-speed, 1 MHz to 50 MHz (25 MB/sec)
> +         */
> +        dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> +        qdev_prop_set_bit(dev, "adma1", true);
> +        qdev_prop_set_bit(dev, "high-speed", true);
> +        qdev_prop_set_uint16(dev, "max-block-length", 1024);
> +        qdev_init_nofail(dev);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFF=
SET]);
> +
> +        di =3D drive_get_next(IF_SD);
> +        blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> +        carddev =3D qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_=
SD_CARD);
> +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(carddev), true, "realized",
> +                                 &error_fatal);
> +    }
>
>      dev =3D qdev_create(NULL, TYPE_ZYNQ_XADC);
>      qdev_init_nofail(dev);
> --
> 2.15.1
>
>
