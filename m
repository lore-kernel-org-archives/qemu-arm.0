Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1160998wrt;
        Thu, 4 Oct 2018 10:25:34 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60lSYd4sQ0PupEhAIXkZFQDGNgafW9Pxf6PnYZO2ubIYJAxxDRbtSd+FoZKBjO1MKfZLCiQ
X-Received: by 2002:ac8:290a:: with SMTP id y10-v6mr6169758qty.42.1538673933955;
        Thu, 04 Oct 2018 10:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538673933; cv=none;
        d=google.com; s=arc-20160816;
        b=CpmXKtPoTfUeSiSvfOwn0eRA68V+huNv6EJ3p2zIar0srAzhQ2CGkxhgLrUNAMTfX/
         JwE4365w9KMEgaZdrfhPDCeoxQxV7MH7mbu8B7sdEKXGDkn5YInGtobwTEY/FTkm55xu
         4rZ8pTubPVvYfYmg2ajY8YWgq1+or1iDJFCT6/vRv1d17ZUCBqeH57xHfPoWRekSkBlV
         wyPVlef9DQEpmG3G2WRHlHfpIL53VcbmrVDXbcWpqTqiVtcLo3JLz2pjNgRKp5+yl50M
         0YQCRxuZGEDj9YOFSBNJniSuknDoMKVp/VM9hkSzUM/ug6AYpXHlLwNJOcZitrBVbdrm
         jhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ADMyQm9lw8Z6YYoO/WJDZN+9hK7xhYfLxaWV7rIgaKI=;
        b=UWAP22tvbmYj15pllL0LdjiOSOtNEm1H/fkJ3JfTyEIVmeV/nIVPMFYlQAtw1i0SBQ
         pPML4+xLY4KlC51RErmMHjsr7CoFDGy59bPVq/1bTNiqExTy+Niv5gEUEAF0/zKWMnCN
         l/TYX8hKkr+zpBmsPB4E+JgqlmIRYIlaqK6t4imGNLiAy8b5gz8ydFuCaea7oquzWBBL
         EmzQPFGaruoaQ/0Yyj8XC8n1zFaaPz4Hz/b26froGQ0/okogwF320QwsvpKPSxe9S890
         ICUTdcad/hSUQQfmPkDAQj2WieL0WMSdLByH/MJIQeL4YQewEOperb736LCPM3uAATaS
         frHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fmL4tEiz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j51-v6si3619115qtf.239.2018.10.04.10.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 10:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fmL4tEiz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g87NV-0006c8-Dg
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 13:25:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87N7-0006aC-Nx
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 13:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87N5-0008Fe-Pj
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 13:25:09 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:43341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g87N5-0008ET-Cq; Thu, 04 Oct 2018 13:25:07 -0400
Received: by mail-lj1-x22d.google.com with SMTP id r8-v6so9082394ljc.10;
	Thu, 04 Oct 2018 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ADMyQm9lw8Z6YYoO/WJDZN+9hK7xhYfLxaWV7rIgaKI=;
	b=fmL4tEizOKw0ADRAsFwZjkslM1XNZ218LysZMFaVCx01p6QHNb//YPE+ko6ZoPdXit
	65kDiaF05/TsLkcAZD5tqGMhN1Ma9bfwr1fptDKeB35opFk3vvVAT2LF/rlVodBrWCQj
	l36fQKbKlYbfDgDNDoH/zGplAS1A+diDnflaimqqZoPiiI/3IKJCIMNx5H+gQle7/079
	KAh8WZB4zS46cadIfBgS2dIyGaJ/+1ZGu7ZpGXUAOv/BktIGxuWhNa1vVuJ7N0HYCyg6
	txgDXVYk46BFAFOqPtSlJmy2l8hW95tre3a6g70Kw2XrrOayCygNtUqRYOUHVUP4Q860
	QDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ADMyQm9lw8Z6YYoO/WJDZN+9hK7xhYfLxaWV7rIgaKI=;
	b=VVaCbxBAsKQ1ha68H2WNxqMda8O9dkQrBrkWnUgB0BhbDU/4EddaXSq74lckiDfBdT
	4tvuEQBdtB5C4YHNLeKOKZZ8EJdFSv3iwMxTVweGBVM0Dj1WWuFeVsfN9JRDh4IWUS1H
	0qza/Gg5ZhXmJFFJQdKiRiqWpD/CvRiOoB2bvzTizUga9jKyTDKifFknzaQDERaGG7CE
	hJw6MWF71EtP+OaNaA9vfiuGio4scxDO65t6YJqrT45+4pdoYXzPxBIz3Nx0qskDN3zf
	g0vT5RWRZhlO4Cgi6CW0rZs0Eyss5U3Qj+M0MXs4hue6DKmmE62lBfNvx0xWU9alm+eq
	wI6w==
X-Gm-Message-State: ABuFfojQSkcRLVJqpuZcA5ECe9MhtER7B3bVr7URUGdC0RF2zVC74+lc
	TLp3MOFyih6EAAdRf/PMyT9vgLtdiSPUyBCx/q4=
X-Received: by 2002:a2e:7e07:: with SMTP id z7-v6mr4887281ljc.84.1538673905571;
	Thu, 04 Oct 2018 10:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-7-damien.hedde@greensocs.com>
In-Reply-To: <20181002142443.30976-7-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Oct 2018 10:24:39 -0700
Message-ID: <CAKmqyKMzugzSZanqWe6U2=NSU45KNDZTYVZ2EFCj4uLuoSaXfw@mail.gmail.com>
To: damien.hedde@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::22d
Subject: Re: [Qemu-devel] [PATCH v5 6/9] hw/misc/zynq_slcr: use standard
 register definition
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TkCcPlQJA38V

On Tue, Oct 2, 2018 at 7:36 AM Damien Hedde <damien.hedde@greensocs.com> wr=
ote:
>
> Replace the zynq_slcr registers enum and macros using the
> hw/registerfields.h macros.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/zynq_slcr.c | 468 ++++++++++++++++++++++----------------------
>  1 file changed, 234 insertions(+), 234 deletions(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index d6bdd027ef..baa13d1316 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -20,6 +20,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/log.h"
> +#include "hw/registerfields.h"
>
>  #ifndef ZYNQ_SLCR_ERR_DEBUG
>  #define ZYNQ_SLCR_ERR_DEBUG 0
> @@ -35,138 +36,135 @@
>  #define XILINX_LOCK_KEY 0x767b
>  #define XILINX_UNLOCK_KEY 0xdf0d
>
> -#define R_PSS_RST_CTRL_SOFT_RST 0x1
> +REG32(SCL, 0x000)
> +REG32(LOCK, 0x004)
> +REG32(UNLOCK, 0x008)
> +REG32(LOCKSTA, 0x00c)
>
> -enum {
> -    SCL             =3D 0x000 / 4,
> -    LOCK,
> -    UNLOCK,
> -    LOCKSTA,
> +REG32(ARM_PLL_CTRL, 0x100)
> +REG32(DDR_PLL_CTRL, 0x104)
> +REG32(IO_PLL_CTRL, 0x108)
> +REG32(PLL_STATUS, 0x10c)
> +REG32(ARM_PLL_CFG, 0x110)
> +REG32(DDR_PLL_CFG, 0x114)
> +REG32(IO_PLL_CFG, 0x118)
>
> -    ARM_PLL_CTRL    =3D 0x100 / 4,
> -    DDR_PLL_CTRL,
> -    IO_PLL_CTRL,
> -    PLL_STATUS,
> -    ARM_PLL_CFG,
> -    DDR_PLL_CFG,
> -    IO_PLL_CFG,
> -
> -    ARM_CLK_CTRL    =3D 0x120 / 4,
> -    DDR_CLK_CTRL,
> -    DCI_CLK_CTRL,
> -    APER_CLK_CTRL,
> -    USB0_CLK_CTRL,
> -    USB1_CLK_CTRL,
> -    GEM0_RCLK_CTRL,
> -    GEM1_RCLK_CTRL,
> -    GEM0_CLK_CTRL,
> -    GEM1_CLK_CTRL,
> -    SMC_CLK_CTRL,
> -    LQSPI_CLK_CTRL,
> -    SDIO_CLK_CTRL,
> -    UART_CLK_CTRL,
> -    SPI_CLK_CTRL,
> -    CAN_CLK_CTRL,
> -    CAN_MIOCLK_CTRL,
> -    DBG_CLK_CTRL,
> -    PCAP_CLK_CTRL,
> -    TOPSW_CLK_CTRL,
> +REG32(ARM_CLK_CTRL, 0x120)
> +REG32(DDR_CLK_CTRL, 0x124)
> +REG32(DCI_CLK_CTRL, 0x128)
> +REG32(APER_CLK_CTRL, 0x12c)
> +REG32(USB0_CLK_CTRL, 0x130)
> +REG32(USB1_CLK_CTRL, 0x134)
> +REG32(GEM0_RCLK_CTRL, 0x138)
> +REG32(GEM1_RCLK_CTRL, 0x13c)
> +REG32(GEM0_CLK_CTRL, 0x140)
> +REG32(GEM1_CLK_CTRL, 0x144)
> +REG32(SMC_CLK_CTRL, 0x148)
> +REG32(LQSPI_CLK_CTRL, 0x14c)
> +REG32(SDIO_CLK_CTRL, 0x150)
> +REG32(UART_CLK_CTRL, 0x154)
> +REG32(SPI_CLK_CTRL, 0x158)
> +REG32(CAN_CLK_CTRL, 0x15c)
> +REG32(CAN_MIOCLK_CTRL, 0x160)
> +REG32(DBG_CLK_CTRL, 0x164)
> +REG32(PCAP_CLK_CTRL, 0x168)
> +REG32(TOPSW_CLK_CTRL, 0x16c)
>
>  #define FPGA_CTRL_REGS(n, start) \
> -    FPGA ## n ## _CLK_CTRL =3D (start) / 4, \
> -    FPGA ## n ## _THR_CTRL, \
> -    FPGA ## n ## _THR_CNT, \
> -    FPGA ## n ## _THR_STA,
> -    FPGA_CTRL_REGS(0, 0x170)
> -    FPGA_CTRL_REGS(1, 0x180)
> -    FPGA_CTRL_REGS(2, 0x190)
> -    FPGA_CTRL_REGS(3, 0x1a0)
> -
> -    BANDGAP_TRIP    =3D 0x1b8 / 4,
> -    PLL_PREDIVISOR  =3D 0x1c0 / 4,
> -    CLK_621_TRUE,
> -
> -    PSS_RST_CTRL    =3D 0x200 / 4,
> -    DDR_RST_CTRL,
> -    TOPSW_RESET_CTRL,
> -    DMAC_RST_CTRL,
> -    USB_RST_CTRL,
> -    GEM_RST_CTRL,
> -    SDIO_RST_CTRL,
> -    SPI_RST_CTRL,
> -    CAN_RST_CTRL,
> -    I2C_RST_CTRL,
> -    UART_RST_CTRL,
> -    GPIO_RST_CTRL,
> -    LQSPI_RST_CTRL,
> -    SMC_RST_CTRL,
> -    OCM_RST_CTRL,
> -    FPGA_RST_CTRL   =3D 0x240 / 4,
> -    A9_CPU_RST_CTRL,
> -
> -    RS_AWDT_CTRL    =3D 0x24c / 4,
> -    RST_REASON,
> -
> -    REBOOT_STATUS   =3D 0x258 / 4,
> -    BOOT_MODE,
> -
> -    APU_CTRL        =3D 0x300 / 4,
> -    WDT_CLK_SEL,
> -
> -    TZ_DMA_NS       =3D 0x440 / 4,
> -    TZ_DMA_IRQ_NS,
> -    TZ_DMA_PERIPH_NS,
> -
> -    PSS_IDCODE      =3D 0x530 / 4,
> -
> -    DDR_URGENT      =3D 0x600 / 4,
> -    DDR_CAL_START   =3D 0x60c / 4,
> -    DDR_REF_START   =3D 0x614 / 4,
> -    DDR_CMD_STA,
> -    DDR_URGENT_SEL,
> -    DDR_DFI_STATUS,
> -
> -    MIO             =3D 0x700 / 4,
> +    REG32(FPGA ## n ## _CLK_CTRL, (start)) \
> +    REG32(FPGA ## n ## _THR_CTRL, (start) + 0x4)\
> +    REG32(FPGA ## n ## _THR_CNT,  (start) + 0x8)\
> +    REG32(FPGA ## n ## _THR_STA,  (start) + 0xc)
> +FPGA_CTRL_REGS(0, 0x170)
> +FPGA_CTRL_REGS(1, 0x180)
> +FPGA_CTRL_REGS(2, 0x190)
> +FPGA_CTRL_REGS(3, 0x1a0)
> +
> +REG32(BANDGAP_TRIP, 0x1b8)
> +REG32(PLL_PREDIVISOR, 0x1c0)
> +REG32(CLK_621_TRUE, 0x1c4)
> +
> +REG32(PSS_RST_CTRL, 0x200)
> +    FIELD(PSS_RST_CTRL, SOFT_RST, 0, 1)
> +REG32(DDR_RST_CTRL, 0x204)
> +REG32(TOPSW_RESET_CTRL, 0x208)
> +REG32(DMAC_RST_CTRL, 0x20c)
> +REG32(USB_RST_CTRL, 0x210)
> +REG32(GEM_RST_CTRL, 0x214)
> +REG32(SDIO_RST_CTRL, 0x218)
> +REG32(SPI_RST_CTRL, 0x21c)
> +REG32(CAN_RST_CTRL, 0x220)
> +REG32(I2C_RST_CTRL, 0x224)
> +REG32(UART_RST_CTRL, 0x228)
> +REG32(GPIO_RST_CTRL, 0x22c)
> +REG32(LQSPI_RST_CTRL, 0x230)
> +REG32(SMC_RST_CTRL, 0x234)
> +REG32(OCM_RST_CTRL, 0x238)
> +REG32(FPGA_RST_CTRL, 0x240)
> +REG32(A9_CPU_RST_CTRL, 0x244)
> +
> +REG32(RS_AWDT_CTRL, 0x24c)
> +REG32(RST_REASON, 0x250)
> +
> +REG32(REBOOT_STATUS, 0x258)
> +REG32(BOOT_MODE, 0x25c)
> +
> +REG32(APU_CTRL, 0x300)
> +REG32(WDT_CLK_SEL, 0x304)
> +
> +REG32(TZ_DMA_NS, 0x440)
> +REG32(TZ_DMA_IRQ_NS, 0x444)
> +REG32(TZ_DMA_PERIPH_NS, 0x448)
> +
> +REG32(PSS_IDCODE, 0x530)
> +
> +REG32(DDR_URGENT, 0x600)
> +REG32(DDR_CAL_START, 0x60c)
> +REG32(DDR_REF_START, 0x614)
> +REG32(DDR_CMD_STA, 0x618)
> +REG32(DDR_URGENT_SEL, 0x61c)
> +REG32(DDR_DFI_STATUS, 0x620)
> +
> +REG32(MIO, 0x700)
>  #define MIO_LENGTH 54
>
> -    MIO_LOOPBACK    =3D 0x804 / 4,
> -    MIO_MST_TRI0,
> -    MIO_MST_TRI1,
> +REG32(MIO_LOOPBACK, 0x804)
> +REG32(MIO_MST_TRI0, 0x808)
> +REG32(MIO_MST_TRI1, 0x80c)
>
> -    SD0_WP_CD_SEL   =3D 0x830 / 4,
> -    SD1_WP_CD_SEL,
> +REG32(SD0_WP_CD_SEL, 0x830)
> +REG32(SD1_WP_CD_SEL, 0x834)
>
> -    LVL_SHFTR_EN    =3D 0x900 / 4,
> -    OCM_CFG         =3D 0x910 / 4,
> +REG32(LVL_SHFTR_EN, 0x900)
> +REG32(OCM_CFG, 0x910)
>
> -    CPU_RAM         =3D 0xa00 / 4,
> +REG32(CPU_RAM, 0xa00)
>
> -    IOU             =3D 0xa30 / 4,
> +REG32(IOU, 0xa30)
>
> -    DMAC_RAM        =3D 0xa50 / 4,
> +REG32(DMAC_RAM, 0xa50)
>
> -    AFI0            =3D 0xa60 / 4,
> -    AFI1 =3D AFI0 + 3,
> -    AFI2 =3D AFI1 + 3,
> -    AFI3 =3D AFI2 + 3,
> +REG32(AFI0, 0xa60)
> +REG32(AFI1, 0xa6c)
> +REG32(AFI2, 0xa78)
> +REG32(AFI3, 0xa84)
>  #define AFI_LENGTH 3
>
> -    OCM             =3D 0xa90 / 4,
> +REG32(OCM, 0xa90)
>
> -    DEVCI_RAM       =3D 0xaa0 / 4,
> +REG32(DEVCI_RAM, 0xaa0)
>
> -    CSG_RAM         =3D 0xab0 / 4,
> +REG32(CSG_RAM, 0xab0)
>
> -    GPIOB_CTRL      =3D 0xb00 / 4,
> -    GPIOB_CFG_CMOS18,
> -    GPIOB_CFG_CMOS25,
> -    GPIOB_CFG_CMOS33,
> -    GPIOB_CFG_HSTL  =3D 0xb14 / 4,
> -    GPIOB_DRVR_BIAS_CTRL,
> +REG32(GPIOB_CTRL, 0xb00)
> +REG32(GPIOB_CFG_CMOS18, 0xb04)
> +REG32(GPIOB_CFG_CMOS25, 0xb08)
> +REG32(GPIOB_CFG_CMOS33, 0xb0c)
> +REG32(GPIOB_CFG_HSTL, 0xb14)
> +REG32(GPIOB_DRVR_BIAS_CTRL, 0xb18)
>
> -    DDRIOB          =3D 0xb40 / 4,
> +REG32(DDRIOB, 0xb40)
>  #define DDRIOB_LENGTH 14
> -};
>
>  #define ZYNQ_SLCR_MMIO_SIZE     0x1000
>  #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
> @@ -189,150 +187,152 @@ static void zynq_slcr_reset(DeviceState *d)
>
>      DB_PRINT("RESET\n");
>
> -    s->regs[LOCKSTA] =3D 1;
> +    s->regs[R_LOCKSTA] =3D 1;
>      /* 0x100 - 0x11C */
> -    s->regs[ARM_PLL_CTRL]   =3D 0x0001A008;
> -    s->regs[DDR_PLL_CTRL]   =3D 0x0001A008;
> -    s->regs[IO_PLL_CTRL]    =3D 0x0001A008;
> -    s->regs[PLL_STATUS]     =3D 0x0000003F;
> -    s->regs[ARM_PLL_CFG]    =3D 0x00014000;
> -    s->regs[DDR_PLL_CFG]    =3D 0x00014000;
> -    s->regs[IO_PLL_CFG]     =3D 0x00014000;
> +    s->regs[R_ARM_PLL_CTRL]   =3D 0x0001A008;
> +    s->regs[R_DDR_PLL_CTRL]   =3D 0x0001A008;
> +    s->regs[R_IO_PLL_CTRL]    =3D 0x0001A008;
> +    s->regs[R_PLL_STATUS]     =3D 0x0000003F;
> +    s->regs[R_ARM_PLL_CFG]    =3D 0x00014000;
> +    s->regs[R_DDR_PLL_CFG]    =3D 0x00014000;
> +    s->regs[R_IO_PLL_CFG]     =3D 0x00014000;
>
>      /* 0x120 - 0x16C */
> -    s->regs[ARM_CLK_CTRL]   =3D 0x1F000400;
> -    s->regs[DDR_CLK_CTRL]   =3D 0x18400003;
> -    s->regs[DCI_CLK_CTRL]   =3D 0x01E03201;
> -    s->regs[APER_CLK_CTRL]  =3D 0x01FFCCCD;
> -    s->regs[USB0_CLK_CTRL]  =3D s->regs[USB1_CLK_CTRL]    =3D 0x00101941=
;
> -    s->regs[GEM0_RCLK_CTRL] =3D s->regs[GEM1_RCLK_CTRL]   =3D 0x00000001=
;
> -    s->regs[GEM0_CLK_CTRL]  =3D s->regs[GEM1_CLK_CTRL]    =3D 0x00003C01=
;
> -    s->regs[SMC_CLK_CTRL]   =3D 0x00003C01;
> -    s->regs[LQSPI_CLK_CTRL] =3D 0x00002821;
> -    s->regs[SDIO_CLK_CTRL]  =3D 0x00001E03;
> -    s->regs[UART_CLK_CTRL]  =3D 0x00003F03;
> -    s->regs[SPI_CLK_CTRL]   =3D 0x00003F03;
> -    s->regs[CAN_CLK_CTRL]   =3D 0x00501903;
> -    s->regs[DBG_CLK_CTRL]   =3D 0x00000F03;
> -    s->regs[PCAP_CLK_CTRL]  =3D 0x00000F01;
> +    s->regs[R_ARM_CLK_CTRL]   =3D 0x1F000400;
> +    s->regs[R_DDR_CLK_CTRL]   =3D 0x18400003;
> +    s->regs[R_DCI_CLK_CTRL]   =3D 0x01E03201;
> +    s->regs[R_APER_CLK_CTRL]  =3D 0x01FFCCCD;
> +    s->regs[R_USB0_CLK_CTRL]  =3D s->regs[R_USB1_CLK_CTRL]  =3D 0x001019=
41;
> +    s->regs[R_GEM0_RCLK_CTRL] =3D s->regs[R_GEM1_RCLK_CTRL] =3D 0x000000=
01;
> +    s->regs[R_GEM0_CLK_CTRL]  =3D s->regs[R_GEM1_CLK_CTRL]  =3D 0x00003C=
01;
> +    s->regs[R_SMC_CLK_CTRL]   =3D 0x00003C01;
> +    s->regs[R_LQSPI_CLK_CTRL] =3D 0x00002821;
> +    s->regs[R_SDIO_CLK_CTRL]  =3D 0x00001E03;
> +    s->regs[R_UART_CLK_CTRL]  =3D 0x00003F03;
> +    s->regs[R_SPI_CLK_CTRL]   =3D 0x00003F03;
> +    s->regs[R_CAN_CLK_CTRL]   =3D 0x00501903;
> +    s->regs[R_DBG_CLK_CTRL]   =3D 0x00000F03;
> +    s->regs[R_PCAP_CLK_CTRL]  =3D 0x00000F01;
>
>      /* 0x170 - 0x1AC */
> -    s->regs[FPGA0_CLK_CTRL] =3D s->regs[FPGA1_CLK_CTRL] =3D s->regs[FPGA=
2_CLK_CTRL]
> -                            =3D s->regs[FPGA3_CLK_CTRL] =3D 0x00101800;
> -    s->regs[FPGA0_THR_STA] =3D s->regs[FPGA1_THR_STA] =3D s->regs[FPGA2_=
THR_STA]
> -                           =3D s->regs[FPGA3_THR_STA] =3D 0x00010000;
> +    s->regs[R_FPGA0_CLK_CTRL] =3D s->regs[R_FPGA1_CLK_CTRL]
> +                              =3D s->regs[R_FPGA2_CLK_CTRL]
> +                              =3D s->regs[R_FPGA3_CLK_CTRL] =3D 0x001018=
00;
> +    s->regs[R_FPGA0_THR_STA] =3D s->regs[R_FPGA1_THR_STA]
> +                             =3D s->regs[R_FPGA2_THR_STA]
> +                             =3D s->regs[R_FPGA3_THR_STA] =3D 0x00010000=
;
>
>      /* 0x1B0 - 0x1D8 */
> -    s->regs[BANDGAP_TRIP]   =3D 0x0000001F;
> -    s->regs[PLL_PREDIVISOR] =3D 0x00000001;
> -    s->regs[CLK_621_TRUE]   =3D 0x00000001;
> +    s->regs[R_BANDGAP_TRIP]   =3D 0x0000001F;
> +    s->regs[R_PLL_PREDIVISOR] =3D 0x00000001;
> +    s->regs[R_CLK_621_TRUE]   =3D 0x00000001;
>
>      /* 0x200 - 0x25C */
> -    s->regs[FPGA_RST_CTRL]  =3D 0x01F33F0F;
> -    s->regs[RST_REASON]     =3D 0x00000040;
> +    s->regs[R_FPGA_RST_CTRL]  =3D 0x01F33F0F;
> +    s->regs[R_RST_REASON]     =3D 0x00000040;
>
> -    s->regs[BOOT_MODE]      =3D 0x00000001;
> +    s->regs[R_BOOT_MODE]      =3D 0x00000001;
>
>      /* 0x700 - 0x7D4 */
>      for (i =3D 0; i < 54; i++) {
> -        s->regs[MIO + i] =3D 0x00001601;
> +        s->regs[R_MIO + i] =3D 0x00001601;
>      }
>      for (i =3D 2; i <=3D 8; i++) {
> -        s->regs[MIO + i] =3D 0x00000601;
> +        s->regs[R_MIO + i] =3D 0x00000601;
>      }
>
> -    s->regs[MIO_MST_TRI0] =3D s->regs[MIO_MST_TRI1] =3D 0xFFFFFFFF;
> +    s->regs[R_MIO_MST_TRI0] =3D s->regs[R_MIO_MST_TRI1] =3D 0xFFFFFFFF;
>
> -    s->regs[CPU_RAM + 0] =3D s->regs[CPU_RAM + 1] =3D s->regs[CPU_RAM + =
3]
> -                         =3D s->regs[CPU_RAM + 4] =3D s->regs[CPU_RAM + =
7]
> -                         =3D 0x00010101;
> -    s->regs[CPU_RAM + 2] =3D s->regs[CPU_RAM + 5] =3D 0x01010101;
> -    s->regs[CPU_RAM + 6] =3D 0x00000001;
> +    s->regs[R_CPU_RAM + 0] =3D s->regs[R_CPU_RAM + 1] =3D s->regs[R_CPU_=
RAM + 3]
> +                           =3D s->regs[R_CPU_RAM + 4] =3D s->regs[R_CPU_=
RAM + 7]
> +                           =3D 0x00010101;
> +    s->regs[R_CPU_RAM + 2] =3D s->regs[R_CPU_RAM + 5] =3D 0x01010101;
> +    s->regs[R_CPU_RAM + 6] =3D 0x00000001;
>
> -    s->regs[IOU + 0] =3D s->regs[IOU + 1] =3D s->regs[IOU + 2] =3D s->re=
gs[IOU + 3]
> -                     =3D 0x09090909;
> -    s->regs[IOU + 4] =3D s->regs[IOU + 5] =3D 0x00090909;
> -    s->regs[IOU + 6] =3D 0x00000909;
> +    s->regs[R_IOU + 0] =3D s->regs[R_IOU + 1] =3D s->regs[R_IOU + 2]
> +                       =3D s->regs[R_IOU + 3] =3D 0x09090909;
> +    s->regs[R_IOU + 4] =3D s->regs[R_IOU + 5] =3D 0x00090909;
> +    s->regs[R_IOU + 6] =3D 0x00000909;
>
> -    s->regs[DMAC_RAM] =3D 0x00000009;
> +    s->regs[R_DMAC_RAM] =3D 0x00000009;
>
> -    s->regs[AFI0 + 0] =3D s->regs[AFI0 + 1] =3D 0x09090909;
> -    s->regs[AFI1 + 0] =3D s->regs[AFI1 + 1] =3D 0x09090909;
> -    s->regs[AFI2 + 0] =3D s->regs[AFI2 + 1] =3D 0x09090909;
> -    s->regs[AFI3 + 0] =3D s->regs[AFI3 + 1] =3D 0x09090909;
> -    s->regs[AFI0 + 2] =3D s->regs[AFI1 + 2] =3D s->regs[AFI2 + 2]
> -                      =3D s->regs[AFI3 + 2] =3D 0x00000909;
> +    s->regs[R_AFI0 + 0] =3D s->regs[R_AFI0 + 1] =3D 0x09090909;
> +    s->regs[R_AFI1 + 0] =3D s->regs[R_AFI1 + 1] =3D 0x09090909;
> +    s->regs[R_AFI2 + 0] =3D s->regs[R_AFI2 + 1] =3D 0x09090909;
> +    s->regs[R_AFI3 + 0] =3D s->regs[R_AFI3 + 1] =3D 0x09090909;
> +    s->regs[R_AFI0 + 2] =3D s->regs[R_AFI1 + 2] =3D s->regs[R_AFI2 + 2]
> +                        =3D s->regs[R_AFI3 + 2] =3D 0x00000909;
>
> -    s->regs[OCM + 0]    =3D 0x01010101;
> -    s->regs[OCM + 1]    =3D s->regs[OCM + 2] =3D 0x09090909;
> +    s->regs[R_OCM + 0] =3D 0x01010101;
> +    s->regs[R_OCM + 1] =3D s->regs[R_OCM + 2] =3D 0x09090909;
>
> -    s->regs[DEVCI_RAM]  =3D 0x00000909;
> -    s->regs[CSG_RAM]    =3D 0x00000001;
> +    s->regs[R_DEVCI_RAM] =3D 0x00000909;
> +    s->regs[R_CSG_RAM]   =3D 0x00000001;
>
> -    s->regs[DDRIOB + 0] =3D s->regs[DDRIOB + 1] =3D s->regs[DDRIOB + 2]
> -                        =3D s->regs[DDRIOB + 3] =3D 0x00000e00;
> -    s->regs[DDRIOB + 4] =3D s->regs[DDRIOB + 5] =3D s->regs[DDRIOB + 6]
> -                        =3D 0x00000e00;
> -    s->regs[DDRIOB + 12] =3D 0x00000021;
> +    s->regs[R_DDRIOB + 0] =3D s->regs[R_DDRIOB + 1] =3D s->regs[R_DDRIOB=
 + 2]
> +                          =3D s->regs[R_DDRIOB + 3] =3D 0x00000e00;
> +    s->regs[R_DDRIOB + 4] =3D s->regs[R_DDRIOB + 5] =3D s->regs[R_DDRIOB=
 + 6]
> +                          =3D 0x00000e00;
> +    s->regs[R_DDRIOB + 12] =3D 0x00000021;
>  }
>
>
>  static bool zynq_slcr_check_offset(hwaddr offset, bool rnw)
>  {
>      switch (offset) {
> -    case LOCK:
> -    case UNLOCK:
> -    case DDR_CAL_START:
> -    case DDR_REF_START:
> +    case R_LOCK:
> +    case R_UNLOCK:
> +    case R_DDR_CAL_START:
> +    case R_DDR_REF_START:
>          return !rnw; /* Write only */
> -    case LOCKSTA:
> -    case FPGA0_THR_STA:
> -    case FPGA1_THR_STA:
> -    case FPGA2_THR_STA:
> -    case FPGA3_THR_STA:
> -    case BOOT_MODE:
> -    case PSS_IDCODE:
> -    case DDR_CMD_STA:
> -    case DDR_DFI_STATUS:
> -    case PLL_STATUS:
> +    case R_LOCKSTA:
> +    case R_FPGA0_THR_STA:
> +    case R_FPGA1_THR_STA:
> +    case R_FPGA2_THR_STA:
> +    case R_FPGA3_THR_STA:
> +    case R_BOOT_MODE:
> +    case R_PSS_IDCODE:
> +    case R_DDR_CMD_STA:
> +    case R_DDR_DFI_STATUS:
> +    case R_PLL_STATUS:
>          return rnw;/* read only */
> -    case SCL:
> -    case ARM_PLL_CTRL ... IO_PLL_CTRL:
> -    case ARM_PLL_CFG ... IO_PLL_CFG:
> -    case ARM_CLK_CTRL ... TOPSW_CLK_CTRL:
> -    case FPGA0_CLK_CTRL ... FPGA0_THR_CNT:
> -    case FPGA1_CLK_CTRL ... FPGA1_THR_CNT:
> -    case FPGA2_CLK_CTRL ... FPGA2_THR_CNT:
> -    case FPGA3_CLK_CTRL ... FPGA3_THR_CNT:
> -    case BANDGAP_TRIP:
> -    case PLL_PREDIVISOR:
> -    case CLK_621_TRUE:
> -    case PSS_RST_CTRL ... A9_CPU_RST_CTRL:
> -    case RS_AWDT_CTRL:
> -    case RST_REASON:
> -    case REBOOT_STATUS:
> -    case APU_CTRL:
> -    case WDT_CLK_SEL:
> -    case TZ_DMA_NS ... TZ_DMA_PERIPH_NS:
> -    case DDR_URGENT:
> -    case DDR_URGENT_SEL:
> -    case MIO ... MIO + MIO_LENGTH - 1:
> -    case MIO_LOOPBACK ... MIO_MST_TRI1:
> -    case SD0_WP_CD_SEL:
> -    case SD1_WP_CD_SEL:
> -    case LVL_SHFTR_EN:
> -    case OCM_CFG:
> -    case CPU_RAM:
> -    case IOU:
> -    case DMAC_RAM:
> -    case AFI0 ... AFI3 + AFI_LENGTH - 1:
> -    case OCM:
> -    case DEVCI_RAM:
> -    case CSG_RAM:
> -    case GPIOB_CTRL ... GPIOB_CFG_CMOS33:
> -    case GPIOB_CFG_HSTL:
> -    case GPIOB_DRVR_BIAS_CTRL:
> -    case DDRIOB ... DDRIOB + DDRIOB_LENGTH - 1:
> +    case R_SCL:
> +    case R_ARM_PLL_CTRL ... R_IO_PLL_CTRL:
> +    case R_ARM_PLL_CFG ... R_IO_PLL_CFG:
> +    case R_ARM_CLK_CTRL ... R_TOPSW_CLK_CTRL:
> +    case R_FPGA0_CLK_CTRL ... R_FPGA0_THR_CNT:
> +    case R_FPGA1_CLK_CTRL ... R_FPGA1_THR_CNT:
> +    case R_FPGA2_CLK_CTRL ... R_FPGA2_THR_CNT:
> +    case R_FPGA3_CLK_CTRL ... R_FPGA3_THR_CNT:
> +    case R_BANDGAP_TRIP:
> +    case R_PLL_PREDIVISOR:
> +    case R_CLK_621_TRUE:
> +    case R_PSS_RST_CTRL ... R_A9_CPU_RST_CTRL:
> +    case R_RS_AWDT_CTRL:
> +    case R_RST_REASON:
> +    case R_REBOOT_STATUS:
> +    case R_APU_CTRL:
> +    case R_WDT_CLK_SEL:
> +    case R_TZ_DMA_NS ... R_TZ_DMA_PERIPH_NS:
> +    case R_DDR_URGENT:
> +    case R_DDR_URGENT_SEL:
> +    case R_MIO ... R_MIO + MIO_LENGTH - 1:
> +    case R_MIO_LOOPBACK ... R_MIO_MST_TRI1:
> +    case R_SD0_WP_CD_SEL:
> +    case R_SD1_WP_CD_SEL:
> +    case R_LVL_SHFTR_EN:
> +    case R_OCM_CFG:
> +    case R_CPU_RAM:
> +    case R_IOU:
> +    case R_DMAC_RAM:
> +    case R_AFI0 ... R_AFI3 + AFI_LENGTH - 1:
> +    case R_OCM:
> +    case R_DEVCI_RAM:
> +    case R_CSG_RAM:
> +    case R_GPIOB_CTRL ... R_GPIOB_CFG_CMOS33:
> +    case R_GPIOB_CFG_HSTL:
> +    case R_GPIOB_DRVR_BIAS_CTRL:
> +    case R_DDRIOB ... R_DDRIOB + DDRIOB_LENGTH - 1:
>          return true;
>      default:
>          return false;
> @@ -370,24 +370,24 @@ static void zynq_slcr_write(void *opaque, hwaddr of=
fset,
>      }
>
>      switch (offset) {
> -    case SCL:
> -        s->regs[SCL] =3D val & 0x1;
> +    case R_SCL:
> +        s->regs[R_SCL] =3D val & 0x1;
>          return;
> -    case LOCK:
> +    case R_LOCK:
>          if ((val & 0xFFFF) =3D=3D XILINX_LOCK_KEY) {
>              DB_PRINT("XILINX LOCK 0xF8000000 + 0x%x <=3D 0x%x\n", (int)o=
ffset,
>                  (unsigned)val & 0xFFFF);
> -            s->regs[LOCKSTA] =3D 1;
> +            s->regs[R_LOCKSTA] =3D 1;
>          } else {
>              DB_PRINT("WRONG XILINX LOCK KEY 0xF8000000 + 0x%x <=3D 0x%x\=
n",
>                  (int)offset, (unsigned)val & 0xFFFF);
>          }
>          return;
> -    case UNLOCK:
> +    case R_UNLOCK:
>          if ((val & 0xFFFF) =3D=3D XILINX_UNLOCK_KEY) {
>              DB_PRINT("XILINX UNLOCK 0xF8000000 + 0x%x <=3D 0x%x\n", (int=
)offset,
>                  (unsigned)val & 0xFFFF);
> -            s->regs[LOCKSTA] =3D 0;
> +            s->regs[R_LOCKSTA] =3D 0;
>          } else {
>              DB_PRINT("WRONG XILINX UNLOCK KEY 0xF8000000 + 0x%x <=3D 0x%=
x\n",
>                  (int)offset, (unsigned)val & 0xFFFF);
> @@ -395,7 +395,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offs=
et,
>          return;
>      }
>
> -    if (s->regs[LOCKSTA]) {
> +    if (s->regs[R_LOCKSTA]) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "SCLR registers are locked. Unlock them first\n");
>          return;
> @@ -403,8 +403,8 @@ static void zynq_slcr_write(void *opaque, hwaddr offs=
et,
>      s->regs[offset] =3D val;
>
>      switch (offset) {
> -    case PSS_RST_CTRL:
> -        if (val & R_PSS_RST_CTRL_SOFT_RST) {
> +    case R_PSS_RST_CTRL:
> +        if (FIELD_EX32(val, PSS_RST_CTRL, SOFT_RST)) {
>              qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>          }
>          break;
> --
> 2.19.0
>
>
