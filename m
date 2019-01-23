Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp437333wrt;
        Wed, 23 Jan 2019 00:34:35 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7wo/iZG9Jbs20TFbU9vOihz8AJrzWcWUCArJOw1hwM1m3oYRqH3ti8ez91D0iQtv9yrhKE
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr1607117wrm.218.1548232475375;
        Wed, 23 Jan 2019 00:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548232475; cv=none;
        d=google.com; s=arc-20160816;
        b=U7kjz+zrd6B58utdofQyxoUWDdg00or51zoPcwaK0FNKbAgcpgQfIZGdmPIfs1gO+G
         4Vcyz74Koc1C0crswExORLgTcc/EXt/3YOr2DZM9L3KrRN8/DgUpnNcKgI1ITKyUhz9y
         j3ndQxlqW+MNFsiio85rS82Nk+DueLwBG/NGoTXlOl/Y4iXNzeHyBOhlkqIFMUMsasyH
         RyNvY0MXY351AG+eiQ0U1w3RRuCcdqhdTEdSASeCFShWv6KJPfi02efYMVTTM8ZkLbqu
         jqM2gCwEkAt1BZrhl/QcAJl/KlJd9QMftbTpC1mMSxJfCjqjPBvW2d2ZlOuLpDSSbP/Z
         CvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=Oi5Mx4ZmXMwIXfU3k5DGoRsaCy2ZIcPDitXo7H9my2Q=;
        b=LPZxp6ODVKIlKk1atl/LD6epKzLZtQypcVtF+0GobYcB0DmbX4P2XR0z6bUNkz3Ou3
         24fLRpVmH36XGXnXi9Jxq5FiOJdMuCzt9r1ECaY0tK62idJTJvw3lq05zbtiTMKJsg5j
         OtHfhlS52XltH6RRDV9efyDFS+laDs5uoxMvRYb/blmWwFH8U/3YENoF+5Azpuj49c9i
         MbJoClIHqDD9ZQp907rRORSBqNbbG4LPRjwLTOugGA4WKxCeB4KQSGFEP8xBfQrdAcu2
         o9IcEtIgzXLkNHhsJ2Sg4KmNq6uVDceA2CRlzHMXls62jxnHgx+6t+XkhoM6dT4l6O4C
         1UxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WbEuHA8Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si17510762wma.1.2019.01.23.00.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 00:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WbEuHA8Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmDzW-0006j6-EB
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 03:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1gmDyJ-0006Jc-7K
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 03:33:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1gmDyF-0003no-Cx
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 03:33:17 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
	id 1gmDyB-0003jw-Iv; Wed, 23 Jan 2019 03:33:13 -0500
Received: by mail-lj1-x242.google.com with SMTP id v15-v6so1106587ljh.13;
	Wed, 23 Jan 2019 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=Oi5Mx4ZmXMwIXfU3k5DGoRsaCy2ZIcPDitXo7H9my2Q=;
	b=WbEuHA8YZWsqHpAUr7kgvzb5W3jrCbxmbiOKnonMFovC1NwpDJ+LQ50BSIoEjUBIAW
	1Bv+Z2Tbbj3TfOFE6Jd9TyaJr46p/Pp9YopUEXN7H59BBOGmebaVlR2QTFeza+kiA2sn
	E7J50EPmlLuSB45WVyzFw8S5wPhecA7a6ytFiw1AtzYhGwcbZiZg9xyUMc5cubirUOD8
	r/+hBL/WxsCqTaK6oaT9VEAguBYCOgWKg3GQFA3IgN97lmPOQVh/Ax/epkLKTX8/3z4b
	OtFVeCVNiTDgZu8JGAH1UM/uyLxzh85Y8i+jQyg1ndR0W7mbJqCiPAOas12TjO0lA8ZS
	O5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Oi5Mx4ZmXMwIXfU3k5DGoRsaCy2ZIcPDitXo7H9my2Q=;
	b=MciRP3WlxeGPNN9MAujw0RZ3mnGmTzWXOYJ5E2vVeMUxsSF3vKc4FBB5SxTOZfVMCY
	2I0brGmOntwjSotBhN0F11hX8QpzQbioUVn35hSwemN675eKYiVKqrP/rF4L4dqpTxkS
	9aR1urrI6hVOGn0U/lhAn71GSOiVSbCEa2ao3ivJWP9euk8jb8ZO4YI2NU6R3zfstl60
	KSYECT8sxYHltV4cRpm+vEspwUarHuRLVQVa7EwzQVHmDdfa96yasZ9HH5cu+Q12MCCo
	xl1A+Bn7C006lpteDwrWmJbBJWw6/kgkB2bNOErGuN//79eTCmUgKq+qNAhEBPCaCnqV
	lVNw==
X-Gm-Message-State: AJcUukekicv7iRKLO6ittjvIDDarTC90D/UcCJyh8rgqoXfx+NRd3tAc
	5wXVUFotACa4o4282OFzhGs=
X-Received: by 2002:a2e:2c02:: with SMTP id
	s2-v6mr1082591ljs.118.1548232387501; 
	Wed, 23 Jan 2019 00:33:07 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
	by smtp.gmail.com with ESMTPSA id
	q6sm355346lfh.52.2019.01.23.00.33.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Jan 2019 00:33:06 -0800 (PST)
Date: Wed, 23 Jan 2019 09:33:04 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20190123083303.5vb6gqzhxkfxwm2t@fralle-msi>
References: <20190121154928.32065-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190121154928.32065-1-clg@kaod.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-devel] [PATCH] aspeed/smc: snoop SPI transfers to fake
 dummy cycles
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LQsYc2AxR6O+

On [2019 Jan 21] Mon 16:49:28, Cédric Le Goater wrote:
> The m25p80 models dummy cycles using byte transfers. This works well
> when the transfers are initiated by the QEMU model of a SPI controller
> but when these are initiated by the OS, it breaks emulation.
> 
> Snoop the SPI transfer to catch commands requiring dummy cycles and
> replace them with byte transfers compatible with the m25p80 model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
> 
>  I have had few hacks to work around this problem, Andrew also, but I
>  think that the model for the Xilinx Zynq SPI controller has an
>  elegant solution.
> 
>  Tested with on different Linux kernels (OpenBMC, 5.0.0-rcX) and
>  different Linux drivers doing fast read SPI transfers in User
>  mode. It would be good to give the patch a try on other proprietary
>  Firmwares using the USER command mode to access the flash.
> 
>  include/hw/ssi/aspeed_smc.h |   3 +
>  hw/ssi/aspeed_smc.c         | 115 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 115 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index b8b2dfbec280..f3909440d53c 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -104,6 +104,9 @@ typedef struct AspeedSMCState {
>      AddressSpace dma_as;
>  
>      AspeedSMCFlash *flashes;
> +
> +    uint8_t snoop_index;
> +    uint8_t snoop_dummies;
>  } AspeedSMCState;
>  
>  #endif /* ASPEED_SMC_H */
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 0dc22e44cfd4..69683aca61b7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -166,6 +166,9 @@
>  /* Flash opcodes. */
>  #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
>  
> +#define SNOOP_OFF         0xFF
> +#define SNOOP_START       0x0
> +
>  /*
>   * Default segments mapping addresses and size for each slave per
>   * controller. These can be changed when board is initialized with the
> @@ -587,6 +590,101 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>      return ret;
>  }
>  
> +/*
> + * TODO (clg@kaod.org): stolen from xilinx_spips.c. Should move to a
> + * common include header.
> + */
> +typedef enum {
> +    READ = 0x3,         READ_4 = 0x13,
> +    FAST_READ = 0xb,    FAST_READ_4 = 0x0c,
> +    DOR = 0x3b,         DOR_4 = 0x3c,
> +    QOR = 0x6b,         QOR_4 = 0x6c,
> +    DIOR = 0xbb,        DIOR_4 = 0xbc,
> +    QIOR = 0xeb,        QIOR_4 = 0xec,
> +
> +    PP = 0x2,           PP_4 = 0x12,
> +    DPP = 0xa2,
> +    QPP = 0x32,         QPP_4 = 0x34,
> +} FlashCMD;
> +
> +static int aspeed_smc_num_dummies(uint8_t command)
> +{
> +    switch (command) { /* check for dummies */
> +    case READ: /* no dummy bytes/cycles */
> +    case PP:
> +    case DPP:
> +    case QPP:
> +    case READ_4:
> +    case PP_4:
> +    case QPP_4:
> +        return 0;
> +    case FAST_READ:
> +    case DOR:
> +    case QOR:
> +    case DOR_4:
> +    case QOR_4:
> +        return 1;
> +    case DIOR:
> +    case FAST_READ_4:
> +    case DIOR_4:
> +        return 2;
> +    case QIOR:
> +    case QIOR_4:
> +        return 4;
> +    default:
> +        return -1;
> +    }
> +}
> +
> +static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
> +                                unsigned size)
> +{
> +    AspeedSMCState *s = fl->controller;
> +    uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
> +
> +    if (s->snoop_index == SNOOP_OFF) {
> +        return false; /* Do nothing */
> +
> +    } else if (s->snoop_index == SNOOP_START) {
> +        uint8_t cmd = data & 0xff;
> +        int ndummies = aspeed_smc_num_dummies(cmd);
> +
> +        /*
> +         * No dummy cycles are expected with the current command. Turn
> +         * off snooping and let the transfer proceed normally.
> +         */
> +        if (ndummies <= 0) {
> +            s->snoop_index = SNOOP_OFF;
> +            return false;
> +        }
> +
> +        s->snoop_dummies = ndummies * 8;
> +
> +    } else if (s->snoop_index >= addr_width + 1) {
> +
> +        /* The SPI transfer has reached the dummy cycles sequence */
> +        for (; s->snoop_dummies; s->snoop_dummies--) {
> +            ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
> +        }
> +
> +        /* If no more dummy cycles are expected, turn off snooping */
> +        if (!s->snoop_dummies) {
> +            s->snoop_index = SNOOP_OFF;
> +        } else {
> +            s->snoop_index += size;
> +        }
> +
> +        /*
> +         * Dummy cycles have been faked already. Ignore the current
> +         * SPI transfer
> +         */
> +        return true;
> +    }
> +
> +    s->snoop_index += size;
> +    return false;
> +}
> +
>  static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>                                     unsigned size)
>  {
> @@ -602,6 +700,10 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>  
>      switch (aspeed_smc_flash_mode(fl)) {
>      case CTRL_USERMODE:
> +        if (aspeed_smc_do_snoop(fl, data, size)) {
> +            break;
> +        }
> +
>          for (i = 0; i < size; i++) {
>              ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>          }
> @@ -634,7 +736,9 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>  
>  static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
>  {
> -    const AspeedSMCState *s = fl->controller;
> +    AspeedSMCState *s = fl->controller;
> +
> +    s->snoop_index = aspeed_smc_is_ce_stop_active(fl) ? SNOOP_OFF : SNOOP_START;
>  
>      qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>  }
> @@ -670,6 +774,9 @@ static void aspeed_smc_reset(DeviceState *d)
>      if (s->ctrl->segments == aspeed_segments_fmc) {
>          s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
>      }
> +
> +    s->snoop_index = SNOOP_OFF;
> +    s->snoop_dummies = 0;
>  }
>  
>  static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
> @@ -1100,10 +1207,12 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>  
>  static const VMStateDescription vmstate_aspeed_smc = {
>      .name = "aspeed.smc",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
> +        VMSTATE_UINT8(snoop_index, AspeedSMCState),
> +        VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.20.1
> 
