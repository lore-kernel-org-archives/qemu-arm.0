Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp61680wrt;
        Tue, 22 Jan 2019 15:53:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN533YDBH7CXhDEkyqJA1bwarvT0VOIuPTfgXgHorptHQi2NsECUIzcnyYCRbwPKNCDsYpuC
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr35422073wrr.51.1548201219117;
        Tue, 22 Jan 2019 15:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548201219; cv=none;
        d=google.com; s=arc-20160816;
        b=Fhr6722ko+igQX77siSh6kbnp730qqjaQPAkXyLWl2IOhLLoZc6JthFVTjYLMNIXho
         4ASytyvDNwZ9nRnnva4Lmzg9DgODhbAe9z5DJPNx3/xWkNmjha5Bxje8kHMlNQ8/vFPR
         BoE/qCugsiKJKCSV+Z7wp5lCIwRMMRxylqEJC+gL5Mvafw2p/2izkHRvTK6cnRPyeTSR
         GvY7+0oeIm89Tec60f3MZgMvHGL1O6gjOSemjZ14uQ7GlMlIrIrfBneY21sM8mv2VHJx
         uOrIbkaay6CwtAVn0c+C35vai0JBoeef7EgDLtxf6qgXzGvYkt8kGaJvORZOsmbErPgC
         SlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=wKCSQhZiTcE33pC1oJ5AZViA3ZNRooP4HzWoRKPgkLs=;
        b=D/co02VcmNmqNauoRhG46WoK5YIugry3MdaG4aPi91RfXZZqn9qpG5hq6mVmnSPakm
         MdeyjX7YKwQ6cEmimNfixUjbe95GX2aH8sngXM4DKRHJ/8nPURy1rerAUjyj1tGdKf3V
         hcBKc7gHLw5Eydq8Jndcw5KdU8LW/UwsNBBwGSyUu/GYbpuSKux8u4Vl6H8XGJ3YappK
         sNqraRx2THzW0f6O9RQGP2tt4tn4GG6yOLXb4Ueg+1ylgC705AI33X2KZIG/JqxycKpE
         o0Bj1+aFoBbvJXYr9ZDEsoaOzpIrudqaMIY8rjM37eLuQIPrWTNk7dlmZRicsc4LGf82
         aq0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vog8zvyi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si51873242wrc.280.2019.01.22.15.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 15:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vog8zvyi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:52381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gm5rO-0002Gs-6p
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 18:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm5qy-0002Fc-DV
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 18:53:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm5qx-0004h9-0o
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 18:53:12 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm5qw-0004fm-IF; Tue, 22 Jan 2019 18:53:10 -0500
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so255856ljh.13;
	Tue, 22 Jan 2019 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wKCSQhZiTcE33pC1oJ5AZViA3ZNRooP4HzWoRKPgkLs=;
	b=Vog8zvyiFwlBvlGTv2EVVh/YIMoAoEOtL4gQ12B1bTXETmH7SwzJUJtahD9phU6xPR
	puf1Toy5WsZGowggobCtfNBmV48mV8dJdluOlDJPiWW36auKcaDAPC9Kaqy4MwBnqcfO
	uqYLq8WIOAXJcSJlPu68mH4DsZaNHtESks1lMTntyVUgw08SHTqNahBaxvuOxaTg4Zmz
	/Q6wl7LqrRUqSuLsDHXQFnFAwjS2+j9EiiSBd4j5t0bD7eYz6kpfpIrdVGuOFT3p/Xbc
	P/LSLdNHj85+wxqLkmoB1P9Cf4UlvraapMLzpdi+Q4QDQniYEaTwy4u/bY2hVhk9o7rz
	bonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wKCSQhZiTcE33pC1oJ5AZViA3ZNRooP4HzWoRKPgkLs=;
	b=jv9Yi98hPwW/gS8Km38O08Db3nZ4fspmpHP7U8iRFU08wTEzlJSPWQcsPa3ULWd49b
	s8nwkqoZXh8oqLUGD6Gi4XCG4eRiqwxv6OvzpxfgS36m3z6qnSCSYe+LZ/0JnucjQaJw
	aB4t+iKf617WYI9tslgiralabeba1HiSQtAmXTnCdb2uSj13vDgoaKOldB1/IaeYx+uW
	QFo9bI8WiOy5MgVBFU/SQJ/vH7zVuSMiWlBUHZ4AYi4H1UeASmmmnxMZifvJ6+4HEnxy
	9a+6SJlP8wnMU4pF+k90nmHAG2ryUQahmEz8ONwvVh6MTIgqzGS5TIXbsHlP4uzcvvW3
	yrpg==
X-Gm-Message-State: AJcUukfzo3HoeEJuK8acgKv/QQNPre6f7psd+qMI23moHwEo7SOdHWQC
	GNRrfuN0DpsFmVzEv4k9g+N4ZhyBe7bflekRnn0=
X-Received: by 2002:a2e:8855:: with SMTP id
	z21-v6mr2165107ljj.191.1548201188597; 
	Tue, 22 Jan 2019 15:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20190121154928.32065-1-clg@kaod.org>
In-Reply-To: <20190121154928.32065-1-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 15:52:41 -0800
Message-ID: <CAKmqyKM4N=4dyH2Az9s0sct3s=8Jj15W6zJM0ea6r4yA28FkAg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
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
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qy9MHZMXUv9S

On Mon, Jan 21, 2019 at 7:50 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The m25p80 models dummy cycles using byte transfers. This works well
> when the transfers are initiated by the QEMU model of a SPI controller
> but when these are initiated by the OS, it breaks emulation.
>
> Snoop the SPI transfer to catch commands requiring dummy cycles and
> replace them with byte transfers compatible with the m25p80 model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> @@ -587,6 +590,101 @@ static uint64_t aspeed_smc_flash_read(void *opaque,=
 hwaddr addr, unsigned size)
>      return ret;
>  }
>
> +/*
> + * TODO (clg@kaod.org): stolen from xilinx_spips.c. Should move to a
> + * common include header.
> + */
> +typedef enum {
> +    READ =3D 0x3,         READ_4 =3D 0x13,
> +    FAST_READ =3D 0xb,    FAST_READ_4 =3D 0x0c,
> +    DOR =3D 0x3b,         DOR_4 =3D 0x3c,
> +    QOR =3D 0x6b,         QOR_4 =3D 0x6c,
> +    DIOR =3D 0xbb,        DIOR_4 =3D 0xbc,
> +    QIOR =3D 0xeb,        QIOR_4 =3D 0xec,
> +
> +    PP =3D 0x2,           PP_4 =3D 0x12,
> +    DPP =3D 0xa2,
> +    QPP =3D 0x32,         QPP_4 =3D 0x34,
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
> +    AspeedSMCState *s =3D fl->controller;
> +    uint8_t addr_width =3D aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
> +
> +    if (s->snoop_index =3D=3D SNOOP_OFF) {
> +        return false; /* Do nothing */
> +
> +    } else if (s->snoop_index =3D=3D SNOOP_START) {
> +        uint8_t cmd =3D data & 0xff;
> +        int ndummies =3D aspeed_smc_num_dummies(cmd);
> +
> +        /*
> +         * No dummy cycles are expected with the current command. Turn
> +         * off snooping and let the transfer proceed normally.
> +         */
> +        if (ndummies <=3D 0) {
> +            s->snoop_index =3D SNOOP_OFF;
> +            return false;
> +        }
> +
> +        s->snoop_dummies =3D ndummies * 8;
> +
> +    } else if (s->snoop_index >=3D addr_width + 1) {
> +
> +        /* The SPI transfer has reached the dummy cycles sequence */
> +        for (; s->snoop_dummies; s->snoop_dummies--) {
> +            ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
> +        }
> +
> +        /* If no more dummy cycles are expected, turn off snooping */
> +        if (!s->snoop_dummies) {
> +            s->snoop_index =3D SNOOP_OFF;
> +        } else {
> +            s->snoop_index +=3D size;
> +        }
> +
> +        /*
> +         * Dummy cycles have been faked already. Ignore the current
> +         * SPI transfer
> +         */
> +        return true;
> +    }
> +
> +    s->snoop_index +=3D size;
> +    return false;
> +}
> +
>  static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
>                                     unsigned size)
>  {
> @@ -602,6 +700,10 @@ static void aspeed_smc_flash_write(void *opaque, hwa=
ddr addr, uint64_t data,
>
>      switch (aspeed_smc_flash_mode(fl)) {
>      case CTRL_USERMODE:
> +        if (aspeed_smc_do_snoop(fl, data, size)) {
> +            break;
> +        }
> +
>          for (i =3D 0; i < size; i++) {
>              ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
>          }
> @@ -634,7 +736,9 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
 {
>
>  static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
>  {
> -    const AspeedSMCState *s =3D fl->controller;
> +    AspeedSMCState *s =3D fl->controller;
> +
> +    s->snoop_index =3D aspeed_smc_is_ce_stop_active(fl) ? SNOOP_OFF : SN=
OOP_START;
>
>      qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>  }
> @@ -670,6 +774,9 @@ static void aspeed_smc_reset(DeviceState *d)
>      if (s->ctrl->segments =3D=3D aspeed_segments_fmc) {
>          s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
>      }
> +
> +    s->snoop_index =3D SNOOP_OFF;
> +    s->snoop_dummies =3D 0;
>  }
>
>  static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
> @@ -1100,10 +1207,12 @@ static void aspeed_smc_realize(DeviceState *dev, =
Error **errp)
>
>  static const VMStateDescription vmstate_aspeed_smc =3D {
>      .name =3D "aspeed.smc",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
> +        VMSTATE_UINT8(snoop_index, AspeedSMCState),
> +        VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.20.1
>
>
