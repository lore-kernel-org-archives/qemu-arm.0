Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp470365wrd;
        Wed, 19 Sep 2018 03:06:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaqTuVfgPiyTUNDknNlbchzLzRR8UEAyz73tAoQ/v5LPE9QNgDB72HTQ+tyMIHzJqoa8y2u
X-Received: by 2002:ad4:4251:: with SMTP id l17-v6mr23367368qvq.70.1537351569853;
        Wed, 19 Sep 2018 03:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537351569; cv=none;
        d=google.com; s=arc-20160816;
        b=MAkBJBgJlxLmsL6sAjhaSNZBu34iqB8576FZ/wTReo/hHAcgM9xhJR+BJwvhqvstLr
         +GDY0663amqbV3Ej3ebBeqPDNaBXmVn+ITFafQOWDagzLj8bkQfj830DCUnh3I7nQXHG
         zZ3Ja8CUMI7Np04LSZwZbNUgqNEJW65Bs5VbKDuhl0p5sQY+asH4XE+vxC6PJk33at4r
         BRXUQwx4/5vv/x8SEAJ9TSKkxp4h3/HXEbQ91uElB0+8Xajpt8dqhTMGUCbY0QrPLLy/
         O1gsQPzo3mHHM271G4dMHtC+0bP5P+cvSdCfEWGUjWXp0WncTjT1Kw7iCinF1nocyEK0
         wE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=JkRRszdsT/dLgxaVMjs3I/58TMwf6Q56sZYfO3jx4a4=;
        b=V+/K1EWJXclDNTdeE03hsJ0wuvrhE/7N0bjxOEnmbr2cMnPxDoGOwcC7isi1FxB7QY
         NBaqCkLFD9R0jfioXKtsUES/LL613PULUaGyf/o6EgH731p/0tixOjpgvJKkTndKRu5Z
         YP5dfScpfGjPp5aCnrv4p8EDxkXP2PoXSj1giaEmNLF3A9FcbyhUNgMHscmnf5Cv1tal
         Mh6jC52AoU1KpkjuFSIV5MMxGJNBRErNvs5Dk1nECtycfvvYcgIcujBXroblX+z7iCUM
         eBqbiDnNTH3Air+OH46nOHRx+VcmKJ2b376hSZGu6RLa7ioYUAcm0+ewAq8EHdnmPhfk
         ReJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M1Qi0kI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si1811727qvn.239.2018.09.19.03.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 03:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M1Qi0kI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2ZN3-0007SZ-AI
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 06:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZMn-0007Fb-C6
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZMk-0007g6-JI
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:05:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZMk-0007eF-8y; Wed, 19 Sep 2018 06:05:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id f21-v6so5580892wmc.5;
	Wed, 19 Sep 2018 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JkRRszdsT/dLgxaVMjs3I/58TMwf6Q56sZYfO3jx4a4=;
	b=M1Qi0kI1PU47/7BB1iWtleUzWPwDuahsc7lI1K2I0NXh5oYkS+oStw0sRBnRxX4GKP
	WH2kHxlTEIP9KCcUYAW2KE+Jum/BIXLutJ32K0EbxjVkuGM/er0jQu7NdXvXkYUO/inA
	DgjUezSU8hlziLgjDUxv+z5+uiNAO4HCgTgv/pvzAQ2+kYAn71TR9Rx2xSZLqbYNzMQC
	bQBWBQzTvwy5sv023pl4fQBo/AuzOyXFS9fzzrADsnxU/Ma0E7JL7aDI/p15KjdBE2pC
	PIFWruRus76nOD8YsxsFq3lLYwOvL6cjAChR/qJAPvj7nNC3zeTBzk4yawuaptK0OW+r
	dQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JkRRszdsT/dLgxaVMjs3I/58TMwf6Q56sZYfO3jx4a4=;
	b=aBFLb1UkzLvJb8kQmJY6VhFS8Ldq94qjgC3wd4tK80YvAMzo67yqYGsGnq6vogYk2g
	MrkrMRs5yP3xyZwqNnD4T3//+r/AOLK+W14NCyBVtijboi91Nx0ktyL/zN3Q7TCkAH1j
	4tYageniofquJswT8V5k1xYbDSlLz8w1PMqTzYce9fXmGMvsnSwsj+SyNJC81uPSPvko
	uZoIy7ib+UtXlq8jHjrgvUAnrVA12xDJRMXV1MKXtnvDHNk83TSO0zRRJO2uMw2vbkw1
	AbddzPX+NPQhbM3f07c/y/Wv161riQY+f91DVNhIzeAg23IgMzKRzhSaPqiPkNKv8o8r
	7nuQ==
X-Gm-Message-State: APzg51BPQNjX//rzmt16JGmyuBiqiVV02u30UPSIB3cwUFkgZnZJjnBh
	dlWsteGJj/z0P+l7k+TOJMA=
X-Received: by 2002:a1c:4182:: with SMTP id
	o124-v6mr19699794wma.101.1537351548971; 
	Wed, 19 Sep 2018 03:05:48 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19450087wrr.81.2018.09.19.03.05.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 03:05:48 -0700 (PDT)
To: damien.hedde@greensocs.com, qemu-devel@nongnu.org
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-8-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <48006be9-47be-5136-bff2-33a607294447@amsat.org>
Date: Wed, 19 Sep 2018 12:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180917084016.12750-8-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32e
Subject: Re: [Qemu-arm] [PATCH v4 07/10] hw/misc/zynq_slcr: use standard
 register definition
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HsRRwpnyCju

On 9/17/18 10:40 AM, damien.hedde@greensocs.com wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
> 
> Replace the zynq_slcr registers enum and macros using the
> hw/registerfields.h macros.

This looks cleaner, indeed.

> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
> -    SCL             = 0x000 / 4,
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
> -    ARM_PLL_CTRL    = 0x100 / 4,
> -    DDR_PLL_CTRL,
> -    IO_PLL_CTRL,
> -    PLL_STATUS,
> -    ARM_PLL_CFG,
> -    DDR_PLL_CFG,
> -    IO_PLL_CFG,
> -
> -    ARM_CLK_CTRL    = 0x120 / 4,
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
> -    FPGA ## n ## _CLK_CTRL = (start) / 4, \
> -    FPGA ## n ## _THR_CTRL, \
> -    FPGA ## n ## _THR_CNT, \
> -    FPGA ## n ## _THR_STA,
> -    FPGA_CTRL_REGS(0, 0x170)
> -    FPGA_CTRL_REGS(1, 0x180)
> -    FPGA_CTRL_REGS(2, 0x190)
> -    FPGA_CTRL_REGS(3, 0x1a0)
> -
> -    BANDGAP_TRIP    = 0x1b8 / 4,
> -    PLL_PREDIVISOR  = 0x1c0 / 4,
> -    CLK_621_TRUE,
> -
> -    PSS_RST_CTRL    = 0x200 / 4,
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
> -    FPGA_RST_CTRL   = 0x240 / 4,
> -    A9_CPU_RST_CTRL,
> -
> -    RS_AWDT_CTRL    = 0x24c / 4,
> -    RST_REASON,
> -
> -    REBOOT_STATUS   = 0x258 / 4,
> -    BOOT_MODE,
> -
> -    APU_CTRL        = 0x300 / 4,
> -    WDT_CLK_SEL,
> -
> -    TZ_DMA_NS       = 0x440 / 4,
> -    TZ_DMA_IRQ_NS,
> -    TZ_DMA_PERIPH_NS,
> -
> -    PSS_IDCODE      = 0x530 / 4,
> -
> -    DDR_URGENT      = 0x600 / 4,
> -    DDR_CAL_START   = 0x60c / 4,
> -    DDR_REF_START   = 0x614 / 4,
> -    DDR_CMD_STA,
> -    DDR_URGENT_SEL,
> -    DDR_DFI_STATUS,
> -
> -    MIO             = 0x700 / 4,
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
> -    MIO_LOOPBACK    = 0x804 / 4,
> -    MIO_MST_TRI0,
> -    MIO_MST_TRI1,
> +REG32(MIO_LOOPBACK, 0x804)
> +REG32(MIO_MST_TRI0, 0x808)
> +REG32(MIO_MST_TRI1, 0x80c)
>  
> -    SD0_WP_CD_SEL   = 0x830 / 4,
> -    SD1_WP_CD_SEL,
> +REG32(SD0_WP_CD_SEL, 0x830)
> +REG32(SD1_WP_CD_SEL, 0x834)
>  
> -    LVL_SHFTR_EN    = 0x900 / 4,
> -    OCM_CFG         = 0x910 / 4,
> +REG32(LVL_SHFTR_EN, 0x900)
> +REG32(OCM_CFG, 0x910)
>  
> -    CPU_RAM         = 0xa00 / 4,
> +REG32(CPU_RAM, 0xa00)
>  
> -    IOU             = 0xa30 / 4,
> +REG32(IOU, 0xa30)
>  
> -    DMAC_RAM        = 0xa50 / 4,
> +REG32(DMAC_RAM, 0xa50)
>  
> -    AFI0            = 0xa60 / 4,
> -    AFI1 = AFI0 + 3,
> -    AFI2 = AFI1 + 3,
> -    AFI3 = AFI2 + 3,
> +REG32(AFI0, 0xa60)
> +REG32(AFI1, 0xa6c)
> +REG32(AFI2, 0xa78)
> +REG32(AFI3, 0xa84)
>  #define AFI_LENGTH 3
>  
> -    OCM             = 0xa90 / 4,
> +REG32(OCM, 0xa90)
>  
> -    DEVCI_RAM       = 0xaa0 / 4,
> +REG32(DEVCI_RAM, 0xaa0)
>  
> -    CSG_RAM         = 0xab0 / 4,
> +REG32(CSG_RAM, 0xab0)
>  
> -    GPIOB_CTRL      = 0xb00 / 4,
> -    GPIOB_CFG_CMOS18,
> -    GPIOB_CFG_CMOS25,
> -    GPIOB_CFG_CMOS33,
> -    GPIOB_CFG_HSTL  = 0xb14 / 4,
> -    GPIOB_DRVR_BIAS_CTRL,
> +REG32(GPIOB_CTRL, 0xb00)
> +REG32(GPIOB_CFG_CMOS18, 0xb04)
> +REG32(GPIOB_CFG_CMOS25, 0xb08)
> +REG32(GPIOB_CFG_CMOS33, 0xb0c)
> +REG32(GPIOB_CFG_HSTL, 0xb14)
> +REG32(GPIOB_DRVR_BIAS_CTRL, 0xb18)
>  
> -    DDRIOB          = 0xb40 / 4,
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
> -    s->regs[LOCKSTA] = 1;
> +    s->regs[R_LOCKSTA] = 1;
>      /* 0x100 - 0x11C */
> -    s->regs[ARM_PLL_CTRL]   = 0x0001A008;
> -    s->regs[DDR_PLL_CTRL]   = 0x0001A008;
> -    s->regs[IO_PLL_CTRL]    = 0x0001A008;
> -    s->regs[PLL_STATUS]     = 0x0000003F;
> -    s->regs[ARM_PLL_CFG]    = 0x00014000;
> -    s->regs[DDR_PLL_CFG]    = 0x00014000;
> -    s->regs[IO_PLL_CFG]     = 0x00014000;
> +    s->regs[R_ARM_PLL_CTRL]   = 0x0001A008;
> +    s->regs[R_DDR_PLL_CTRL]   = 0x0001A008;
> +    s->regs[R_IO_PLL_CTRL]    = 0x0001A008;
> +    s->regs[R_PLL_STATUS]     = 0x0000003F;
> +    s->regs[R_ARM_PLL_CFG]    = 0x00014000;
> +    s->regs[R_DDR_PLL_CFG]    = 0x00014000;
> +    s->regs[R_IO_PLL_CFG]     = 0x00014000;
>  
>      /* 0x120 - 0x16C */
> -    s->regs[ARM_CLK_CTRL]   = 0x1F000400;
> -    s->regs[DDR_CLK_CTRL]   = 0x18400003;
> -    s->regs[DCI_CLK_CTRL]   = 0x01E03201;
> -    s->regs[APER_CLK_CTRL]  = 0x01FFCCCD;
> -    s->regs[USB0_CLK_CTRL]  = s->regs[USB1_CLK_CTRL]    = 0x00101941;
> -    s->regs[GEM0_RCLK_CTRL] = s->regs[GEM1_RCLK_CTRL]   = 0x00000001;
> -    s->regs[GEM0_CLK_CTRL]  = s->regs[GEM1_CLK_CTRL]    = 0x00003C01;
> -    s->regs[SMC_CLK_CTRL]   = 0x00003C01;
> -    s->regs[LQSPI_CLK_CTRL] = 0x00002821;
> -    s->regs[SDIO_CLK_CTRL]  = 0x00001E03;
> -    s->regs[UART_CLK_CTRL]  = 0x00003F03;
> -    s->regs[SPI_CLK_CTRL]   = 0x00003F03;
> -    s->regs[CAN_CLK_CTRL]   = 0x00501903;
> -    s->regs[DBG_CLK_CTRL]   = 0x00000F03;
> -    s->regs[PCAP_CLK_CTRL]  = 0x00000F01;
> +    s->regs[R_ARM_CLK_CTRL]   = 0x1F000400;
> +    s->regs[R_DDR_CLK_CTRL]   = 0x18400003;
> +    s->regs[R_DCI_CLK_CTRL]   = 0x01E03201;
> +    s->regs[R_APER_CLK_CTRL]  = 0x01FFCCCD;
> +    s->regs[R_USB0_CLK_CTRL]  = s->regs[R_USB1_CLK_CTRL]  = 0x00101941;
> +    s->regs[R_GEM0_RCLK_CTRL] = s->regs[R_GEM1_RCLK_CTRL] = 0x00000001;
> +    s->regs[R_GEM0_CLK_CTRL]  = s->regs[R_GEM1_CLK_CTRL]  = 0x00003C01;
> +    s->regs[R_SMC_CLK_CTRL]   = 0x00003C01;
> +    s->regs[R_LQSPI_CLK_CTRL] = 0x00002821;
> +    s->regs[R_SDIO_CLK_CTRL]  = 0x00001E03;
> +    s->regs[R_UART_CLK_CTRL]  = 0x00003F03;
> +    s->regs[R_SPI_CLK_CTRL]   = 0x00003F03;
> +    s->regs[R_CAN_CLK_CTRL]   = 0x00501903;
> +    s->regs[R_DBG_CLK_CTRL]   = 0x00000F03;
> +    s->regs[R_PCAP_CLK_CTRL]  = 0x00000F01;
>  
>      /* 0x170 - 0x1AC */
> -    s->regs[FPGA0_CLK_CTRL] = s->regs[FPGA1_CLK_CTRL] = s->regs[FPGA2_CLK_CTRL]
> -                            = s->regs[FPGA3_CLK_CTRL] = 0x00101800;
> -    s->regs[FPGA0_THR_STA] = s->regs[FPGA1_THR_STA] = s->regs[FPGA2_THR_STA]
> -                           = s->regs[FPGA3_THR_STA] = 0x00010000;
> +    s->regs[R_FPGA0_CLK_CTRL] = s->regs[R_FPGA1_CLK_CTRL]
> +                              = s->regs[R_FPGA2_CLK_CTRL]
> +                              = s->regs[R_FPGA3_CLK_CTRL] = 0x00101800;
> +    s->regs[R_FPGA0_THR_STA] = s->regs[R_FPGA1_THR_STA]
> +                             = s->regs[R_FPGA2_THR_STA]
> +                             = s->regs[R_FPGA3_THR_STA] = 0x00010000;
>  
>      /* 0x1B0 - 0x1D8 */
> -    s->regs[BANDGAP_TRIP]   = 0x0000001F;
> -    s->regs[PLL_PREDIVISOR] = 0x00000001;
> -    s->regs[CLK_621_TRUE]   = 0x00000001;
> +    s->regs[R_BANDGAP_TRIP]   = 0x0000001F;
> +    s->regs[R_PLL_PREDIVISOR] = 0x00000001;
> +    s->regs[R_CLK_621_TRUE]   = 0x00000001;
>  
>      /* 0x200 - 0x25C */
> -    s->regs[FPGA_RST_CTRL]  = 0x01F33F0F;
> -    s->regs[RST_REASON]     = 0x00000040;
> +    s->regs[R_FPGA_RST_CTRL]  = 0x01F33F0F;
> +    s->regs[R_RST_REASON]     = 0x00000040;
>  
> -    s->regs[BOOT_MODE]      = 0x00000001;
> +    s->regs[R_BOOT_MODE]      = 0x00000001;
>  
>      /* 0x700 - 0x7D4 */
>      for (i = 0; i < 54; i++) {
> -        s->regs[MIO + i] = 0x00001601;
> +        s->regs[R_MIO + i] = 0x00001601;
>      }
>      for (i = 2; i <= 8; i++) {
> -        s->regs[MIO + i] = 0x00000601;
> +        s->regs[R_MIO + i] = 0x00000601;
>      }
>  
> -    s->regs[MIO_MST_TRI0] = s->regs[MIO_MST_TRI1] = 0xFFFFFFFF;
> +    s->regs[R_MIO_MST_TRI0] = s->regs[R_MIO_MST_TRI1] = 0xFFFFFFFF;
>  
> -    s->regs[CPU_RAM + 0] = s->regs[CPU_RAM + 1] = s->regs[CPU_RAM + 3]
> -                         = s->regs[CPU_RAM + 4] = s->regs[CPU_RAM + 7]
> -                         = 0x00010101;
> -    s->regs[CPU_RAM + 2] = s->regs[CPU_RAM + 5] = 0x01010101;
> -    s->regs[CPU_RAM + 6] = 0x00000001;
> +    s->regs[R_CPU_RAM + 0] = s->regs[R_CPU_RAM + 1] = s->regs[R_CPU_RAM + 3]
> +                           = s->regs[R_CPU_RAM + 4] = s->regs[R_CPU_RAM + 7]
> +                           = 0x00010101;
> +    s->regs[R_CPU_RAM + 2] = s->regs[R_CPU_RAM + 5] = 0x01010101;
> +    s->regs[R_CPU_RAM + 6] = 0x00000001;
>  
> -    s->regs[IOU + 0] = s->regs[IOU + 1] = s->regs[IOU + 2] = s->regs[IOU + 3]
> -                     = 0x09090909;
> -    s->regs[IOU + 4] = s->regs[IOU + 5] = 0x00090909;
> -    s->regs[IOU + 6] = 0x00000909;
> +    s->regs[R_IOU + 0] = s->regs[R_IOU + 1] = s->regs[R_IOU + 2]
> +                       = s->regs[R_IOU + 3] = 0x09090909;
> +    s->regs[R_IOU + 4] = s->regs[R_IOU + 5] = 0x00090909;
> +    s->regs[R_IOU + 6] = 0x00000909;
>  
> -    s->regs[DMAC_RAM] = 0x00000009;
> +    s->regs[R_DMAC_RAM] = 0x00000009;
>  
> -    s->regs[AFI0 + 0] = s->regs[AFI0 + 1] = 0x09090909;
> -    s->regs[AFI1 + 0] = s->regs[AFI1 + 1] = 0x09090909;
> -    s->regs[AFI2 + 0] = s->regs[AFI2 + 1] = 0x09090909;
> -    s->regs[AFI3 + 0] = s->regs[AFI3 + 1] = 0x09090909;
> -    s->regs[AFI0 + 2] = s->regs[AFI1 + 2] = s->regs[AFI2 + 2]
> -                      = s->regs[AFI3 + 2] = 0x00000909;
> +    s->regs[R_AFI0 + 0] = s->regs[R_AFI0 + 1] = 0x09090909;
> +    s->regs[R_AFI1 + 0] = s->regs[R_AFI1 + 1] = 0x09090909;
> +    s->regs[R_AFI2 + 0] = s->regs[R_AFI2 + 1] = 0x09090909;
> +    s->regs[R_AFI3 + 0] = s->regs[R_AFI3 + 1] = 0x09090909;
> +    s->regs[R_AFI0 + 2] = s->regs[R_AFI1 + 2] = s->regs[R_AFI2 + 2]
> +                        = s->regs[R_AFI3 + 2] = 0x00000909;
>  
> -    s->regs[OCM + 0]    = 0x01010101;
> -    s->regs[OCM + 1]    = s->regs[OCM + 2] = 0x09090909;
> +    s->regs[R_OCM + 0] = 0x01010101;
> +    s->regs[R_OCM + 1] = s->regs[R_OCM + 2] = 0x09090909;
>  
> -    s->regs[DEVCI_RAM]  = 0x00000909;
> -    s->regs[CSG_RAM]    = 0x00000001;
> +    s->regs[R_DEVCI_RAM] = 0x00000909;
> +    s->regs[R_CSG_RAM]   = 0x00000001;
>  
> -    s->regs[DDRIOB + 0] = s->regs[DDRIOB + 1] = s->regs[DDRIOB + 2]
> -                        = s->regs[DDRIOB + 3] = 0x00000e00;
> -    s->regs[DDRIOB + 4] = s->regs[DDRIOB + 5] = s->regs[DDRIOB + 6]
> -                        = 0x00000e00;
> -    s->regs[DDRIOB + 12] = 0x00000021;
> +    s->regs[R_DDRIOB + 0] = s->regs[R_DDRIOB + 1] = s->regs[R_DDRIOB + 2]
> +                          = s->regs[R_DDRIOB + 3] = 0x00000e00;
> +    s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
> +                          = 0x00000e00;
> +    s->regs[R_DDRIOB + 12] = 0x00000021;
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
> @@ -370,24 +370,24 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>      }
>  
>      switch (offset) {
> -    case SCL:
> -        s->regs[SCL] = val & 0x1;
> +    case R_SCL:
> +        s->regs[R_SCL] = val & 0x1;
>          return;
> -    case LOCK:
> +    case R_LOCK:
>          if ((val & 0xFFFF) == XILINX_LOCK_KEY) {
>              DB_PRINT("XILINX LOCK 0xF8000000 + 0x%x <= 0x%x\n", (int)offset,
>                  (unsigned)val & 0xFFFF);
> -            s->regs[LOCKSTA] = 1;
> +            s->regs[R_LOCKSTA] = 1;
>          } else {
>              DB_PRINT("WRONG XILINX LOCK KEY 0xF8000000 + 0x%x <= 0x%x\n",
>                  (int)offset, (unsigned)val & 0xFFFF);
>          }
>          return;
> -    case UNLOCK:
> +    case R_UNLOCK:
>          if ((val & 0xFFFF) == XILINX_UNLOCK_KEY) {
>              DB_PRINT("XILINX UNLOCK 0xF8000000 + 0x%x <= 0x%x\n", (int)offset,
>                  (unsigned)val & 0xFFFF);
> -            s->regs[LOCKSTA] = 0;
> +            s->regs[R_LOCKSTA] = 0;
>          } else {
>              DB_PRINT("WRONG XILINX UNLOCK KEY 0xF8000000 + 0x%x <= 0x%x\n",
>                  (int)offset, (unsigned)val & 0xFFFF);
> @@ -395,7 +395,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>          return;
>      }
>  
> -    if (s->regs[LOCKSTA]) {
> +    if (s->regs[R_LOCKSTA]) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "SCLR registers are locked. Unlock them first\n");
>          return;
> @@ -403,8 +403,8 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>      s->regs[offset] = val;
>  
>      switch (offset) {
> -    case PSS_RST_CTRL:
> -        if (val & R_PSS_RST_CTRL_SOFT_RST) {
> +    case R_PSS_RST_CTRL:
> +        if (FIELD_EX32(val, PSS_RST_CTRL, SOFT_RST)) {
>              qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>          }
>          break;
> 
