Received: by 10.28.71.27 with SMTP id u27csp20996wma;
        Tue, 23 Jan 2018 16:41:14 -0800 (PST)
X-Google-Smtp-Source: AH8x227m4QD0Yesjhoz95KKlHX5e9P2IOa7s8PDUih9oe8OotOUEj0dYw3cHPUBcFdKJS3nIy4c4
X-Received: by 10.37.8.69 with SMTP id 66mr3976006ybi.433.1516754474719;
        Tue, 23 Jan 2018 16:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516754474; cv=none;
        d=google.com; s=arc-20160816;
        b=LSEx/8fVgBfJ6RcStKxybsJbMX5AHRJh7woLaDhQjiSXT2jicAEQyLaLLQu6oLsbOK
         56t06lJ7OzKZh9dNfbARI3SuOcZXBmIif2Dv01I+8OvcI+O70VmFjJdnKrEVAQWPa8Or
         9nz1QIVkGU7IIYG00IjftZZ7n1kxL9dUtf0rl3iXeq4386tICDsAxDZhD39uKe5GFANP
         b+hoXov2uFGHEH1B5zZNazBE8dwDxxFRKqelfj4rz7zrb5eIGwSZs/b8Ol2WLTsM6d1W
         f8QjFD7ds5oNUg5weoybcUYj+Uv5rdQBE5yUNU2bx3ddi1eKdR9tHLG6dcQLR4dnvicf
         KdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=EDzBiO6Q73v4HZxOMgbDb1dPzVrm8Afap094p/1HX2s=;
        b=it0M5/tdb0ayemGTpI3qhSfn+4Qt9vuYyCX3mlfL6PTQYaijDwtTspaqJKO0aqBt+b
         r82D/C7wV4cApajv8UmdUDj3ba9HxMsFCDaaHo3zMgi4/Pi/Gpku3BIVgl9KeOftwX36
         G/hT1IW/eUSOp6qnQ/A3JV4d/d+zwT6BGLBX43vg4JAVYhmCgz42BEyzYev7vOgQ3GGz
         /U/2dx9p8NzkODvG7a5nnxw9eXyPxknxMHzvbdVidFncZpYuwx1Vs6L9uO4+0BzdV+7c
         ZpeZbTZZCtlH6QiUwhEhIb5hFPlKtaCftBi3akY6iOdaenO7h73vKukW0IAYtvnx6Jy9
         drTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ebQcpFPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si2631879ybm.378.2018.01.23.16.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 16:41:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ebQcpFPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee97q-0004s6-5N
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 19:41:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee970-0004MF-4g
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 19:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee96S-000655-M8
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 19:40:21 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee93s-0008B0-Ng; Tue, 23 Jan 2018 19:37:09 -0500
Received: by mail-lf0-x242.google.com with SMTP id t139so2967791lff.0;
	Tue, 23 Jan 2018 16:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=EDzBiO6Q73v4HZxOMgbDb1dPzVrm8Afap094p/1HX2s=;
	b=ebQcpFPT6FpZd9UPWgddqpMET82hYBAELIZuHWcemcxph4QkB2TD/C5llNN5kQCgJH
	C7A7Xx0pxBTloSZ4eHIWjljCJsuQG0PyPUgSc56IuAfX4vDy30PZTHC0oUaGXRjcbsbV
	3q4cGfL1LaqOK+KBgkIZb7TgvBRNh3v5jx9yoMva9RheMWhTTy9ATz7ttXJoI1HkciU7
	lA7pv/Siid6jzqehPk0eUec1SpH2rlCfNInHOkumbuH77KIJ/ApxILOyBNHPTwh5wO1v
	GnrL4Mg+3PsTnZoAiD356CpUkPZR1wuO0zyjKcR0qNFSJH0L4YyQ9lbsTEqoWykNVDqB
	deVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=EDzBiO6Q73v4HZxOMgbDb1dPzVrm8Afap094p/1HX2s=;
	b=IXJuZG/74B6I2VZPzSeXaA7eeZ3a5Vc+8CNqM7jHXG7IHi0PlFZotOO05JDgvoI2W0
	2bh9SnZIvjolAaFoEzhwCVvTm11huZZrvHQqH2TfsOpqEoPcMZMvYJLF2a9bhqmkfFCp
	ve05aueVYGh7WBjcAo09VRxzkH2UdtBsAQ1CbQ+vL8nGDh00trBHSrsMu7Rp87c7yBee
	Vjh+uBJblW+mlPOEkCXzfiEuTC2eOpu3XSgxh2etRIezwiGLJWSaLYTFi8I3ftOHWWg1
	aShOQOr+N/cGmrhMvV5SiX6u3pzbIqDkV0au8+eBzseOdZosH3BYxB53d++DBUY9Uhr5
	+AEA==
X-Gm-Message-State: AKwxytdx0lGXkBCH6kdOIZivWWpRHHq8VHauxabyZcJWXGGrQ80b9ztO
	1H8dXVNMve2VignKawq1zr+8WGanfPvK+MKUHJ4=
X-Received: by 10.46.2.221 with SMTP id y90mr2246749lje.39.1516754227458; Tue,
	23 Jan 2018 16:37:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 16:36:36 -0800 (PST)
In-Reply-To: <20180123020820.1288-17-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
	<20180123020820.1288-17-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 16:36:36 -0800
X-Google-Sender-Auth: vjCJZLUJEv150aL4tF2ywJsloTE
Message-ID: <CAKmqyKMDrb2VJsndm1X1Bk_iPmLJ_MpSAx6DJqJ49_d1B7-3Dw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 16/16] hw/arm/xilinx_zynq:
 fix the capabilities register to match the datasheet
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, Stefan Hajnoczi <stefanha@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FpcmvNPJfnFa

On Mon, Jan 22, 2018 at 6:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> checking Xilinx datasheet "UG585" (v1.12.1)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 53 ++++++++++++++++++++++++++++------------------=
------
>  tests/sdhci-test.c   |  5 +++++
>  2 files changed, 34 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 1836a4ed45..0f76333770 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -61,6 +61,8 @@ static const int dma_irqs[8] =3D {
>  #define SLCR_XILINX_UNLOCK_KEY  0xdf0d
>  #define SLCR_XILINX_LOCK_KEY    0x767b
>
> +#define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1=
) */
> +
>  #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
>                          extract32((x), 12,  4) << 16)
>
> @@ -165,10 +167,8 @@ static void zynq_init(MachineState *machine)
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
> @@ -247,27 +247,32 @@ static void zynq_init(MachineState *machine)
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
> +         */
> +        dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> +        qdev_prop_set_uint64(dev, "capareg", ZYNQ_SDHCI_CAPABILITIES);
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
> diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
> index 094e0570e1..aae2cfc1b5 100644
> --- a/tests/sdhci-test.c
> +++ b/tests/sdhci-test.c
> @@ -41,6 +41,11 @@ static const struct sdhci_t {
>      /* Exynos4210 */
>      { "arm",    "smdkc210",
>          {0x12510000, 2, 0,  {1, 0x5e80080} } },
> +
> +    /* Zynq-7000 */
> +    { "arm",    "xilinx-zynq-a9",   /* Datasheet: UG585 (v1.12.1) */
> +        {0xe0100000, 2, 0,  {1, 0x69ec0080} } },
> +
>  };
>
>  static struct {
> --
> 2.15.1
>
>
