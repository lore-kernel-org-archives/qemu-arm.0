Received: by 10.25.21.96 with SMTP id l93csp670752lfi;
        Thu, 23 Jun 2016 11:57:22 -0700 (PDT)
X-Received: by 10.237.47.1 with SMTP id l1mr119232qtd.38.1466708242563;
        Thu, 23 Jun 2016 11:57:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si1521126qkf.72.2016.06.23.11.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9oX-0003S9-UP
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9oT-0003RQ-UY
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9oS-0006Nl-Lm
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:57:17 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9oS-0006NU-GH
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:57:16 -0400
Received: by mail-vk0-x233.google.com with SMTP id j2so119736877vkg.2
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tnh7VJu5GIOdH5xyDTys+Q8j3h6Mtk4/Q/K14TP5rME=;
	b=Im7Hae+vqkgJnvJTSv4A0xQ3seJlwiPnk9Ir3Sl0rAMm5gtBhTAO0vfP1sQ4hOnr3L
	LkfZF4e8gPcRagaIzuBsm/uVypZQs0V3mjiuNbP/SV+Kf/iCeGzlFhrMrCiFEEK0g7HO
	RTvcaeM9jhcE4IpQu4gxD7UTGzqLXPQMhZlyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tnh7VJu5GIOdH5xyDTys+Q8j3h6Mtk4/Q/K14TP5rME=;
	b=ekxaAjng2bhmzDFMUDeEy7eTwWfR1o8fSDt3yjnI2ZomCO1U8DMGasTOE7ONYijhIr
	64eogXtQ3JfgtsZVryqjlsjZh9AS++a1EXUL7bz1Bcc1PR5KmXtmXlS4KgYOZ4xmbjYc
	q34ayUinIXL+nNzKAqdlPPeCmIWeq3AG1TwZWOUbLFRItITqsjIGgfrlqBttK1k/uKYh
	hgESfVUX/g7v+rX7M0K3e0JBmzyItzW84x0vK7kusGtaG8Abgw+qJw8woiA83W68RXJ4
	BT3kWFlU3gYfFYifoHx5qf+4DgmaSYPeH6VvIGXy2Qv3wtK3Hdw/E8QPmU9/X1dRqaTD
	JQ9g==
X-Gm-Message-State: ALyK8tJzOPAOOtf1e2ZsywUJCS415l7h1hDp0l4/ZsUvkfw/cCFkQKRVNAUqRWMlS0QBTkkdV8pIuSfAZgkNjBYG
X-Received: by 10.176.69.138 with SMTP id u10mr16498812uau.24.1466708234718;
	Thu, 23 Jun 2016 11:57:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 11:56:55 -0700 (PDT)
In-Reply-To: <1466699607-30406-4-git-send-email-clg@kaod.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-4-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 19:56:55 +0100
Message-ID: <CAFEAcA9F517Zs1eRjnHTDZb1a7RTX5rGq1YMB-mvtak=hopN=A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [PATCH v3 3/5] ast2400: add SPI flash slave object
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ee/exqftb8iA

On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Each SPI flash slave can operate in two modes: Command and User. When
> in User mode, accesses to the memory segment of the slaves are
> translated in SPI transfers. When in Command mode, the HW generates
> the SPI commands automatically and the memory segment is accessed as
> if doing a MMIO. Other SPI controllers call that mode linear
> addressing mode.
>
> This object is a model proposal for a SPI flash module, gathering SPI
> slave properties and a MemoryRegion handling the memory accesses.
> Only the User mode is supported for now but we are preparing ground
> for the Command mode.
>
> The framework below is sufficient to support Linux which only uses
> User Mode.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c         | 97 +++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/ssi/aspeed_smc.h | 16 ++++++++
>  2 files changed, 113 insertions(+)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6b52123a67bb..d97c077565c3 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -112,6 +112,21 @@ static bool aspeed_smc_is_ce_stop_active(AspeedSMCSt=
ate *s, int cs)
>      return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
>  }
>
> +static inline int aspeed_smc_flash_mode(AspeedSMCState *s, int cs)
> +{
> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
> +}
> +
> +static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
> +{
> +    return (aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_USERMODE);

You don't need these brackets.

> +}
> +
> +static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
> +{
> +    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
> +}
> +
>  static void aspeed_smc_update_cs(AspeedSMCState *s)
>  {
>      int i;
> @@ -296,3 +311,85 @@ static void aspeed_smc_register_types(void)
>  }
>
>  type_init(aspeed_smc_register_types)
> +
> +static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
> +{
> +    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
> +    AspeedSMCState *s =3D fl->controller;
> +    uint64_t ret =3D 0;
> +    int i;
> +
> +    if (aspeed_smc_is_usermode(s, fl->id)) {
> +        for (i =3D 0; i < size; i++) {
> +            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> +        }
> +    } else {
> +        error_report("%s: flash not in usermode", __func__);

This should probably be a LOG_UNIMP or LOG_GUEST_ERROR qemu_log
message. (Similarly below.)

> +        ret =3D -1;
> +    }
> +
> +    return ret;
> +}
> +
> +static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
> +                           unsigned size)
> +{
> +    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
> +    AspeedSMCState *s =3D fl->controller;
> +    int i;
> +
> +    if (!aspeed_smc_is_writable(s, fl->id)) {
> +        error_report("%s: flash is not writable", __func__);
> +        return;
> +    }
> +
> +    if (!aspeed_smc_is_usermode(s, fl->id)) {
> +        error_report("%s: flash not in usermode", __func__);
> +        return;
> +    }
> +
> +    for (i =3D 0; i < size; i++) {
> +        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_smc_flash_ops =3D {
> +    .read =3D aspeed_smc_flash_read,
> +    .write =3D aspeed_smc_flash_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static const VMStateDescription vmstate_aspeed_smc_flash =3D {
> +    .name =3D "aspeed.smc_flash",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8(id, AspeedSMCFlashState),

I can see where we read this, but not where we write it.
If it's read only, it doesn't need to be migrated. If it's
writeable, the device needs a reset function to reset it.
("currently r/o but will become r/w when later functionality
is added, and don't want to make a migration break later" is
ok, but we should be consistent about whether we treat it as
r/w for reset and migration purposes.)

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->vmsd =3D &vmstate_aspeed_smc_flash;
> +}
> +
> +static const TypeInfo aspeed_smc_flash_info =3D {
> +    .name           =3D TYPE_ASPEED_SMC_FLASH,
> +    .parent         =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size  =3D sizeof(AspeedSMCState),
> +    .class_init     =3D aspeed_smc_flash_class_init,
> +};
> +
> +static void aspeed_smc_flash_register_types(void)
> +{
> +    type_register_static(&aspeed_smc_flash_info);
> +}
> +
> +type_init(aspeed_smc_flash_register_types)
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 2d3e9f6b46d5..abd0005b01c2 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -27,6 +27,22 @@
>
>  #include "hw/ssi/ssi.h"
>
> +struct AspeedSMCState;
> +
> +typedef struct AspeedSMCFlashState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    uint8_t id;
> +    size_t size;
> +    struct AspeedSMCState *controller;
> +    DeviceState *flash;
> +} AspeedSMCFlashState;
> +
> +#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
> +#define ASPEED_SMC_FLASH(obj) \
> +    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
> +
>  typedef struct AspeedSMCController {
>      const char *name;
>      uint8_t r_conf;

thanks
-- PMM
