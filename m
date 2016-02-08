Received: by 10.25.159.19 with SMTP id i19csp1600867lfe;
        Mon, 8 Feb 2016 15:25:28 -0800 (PST)
X-Received: by 10.140.242.16 with SMTP id n16mr40905374qhc.2.1454973928121;
        Mon, 08 Feb 2016 15:25:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si32885187qkb.94.2016.02.08.15.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 15:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:49814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSvBP-0007Tx-II
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 18:25:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aSvBL-0007Ok-AZ
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:25:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aSvBJ-0006FL-DN
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:25:23 -0500
Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241]:34125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aSvBE-0006Er-R8; Mon, 08 Feb 2016 18:25:16 -0500
Received: by mail-ob0-x241.google.com with SMTP id x5so8899801obg.1;
	Mon, 08 Feb 2016 15:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=UMaC+76rOH+nXfKatH0LaLR0RgFGGNjQGDbHHXvOx9I=;
	b=A639/Rmtt9q4A32s3hJC3tFUnIdO64p8st/ORv+cibt63IWjqYjPV2km6nRbFu4MQv
	s5zIVxOsWhrnZWtPz4cq7UFUVscupCmR/aO2YtfqEtbznzrpdn9N4bFUBpAVZZ9CB0+I
	4luk/oJEFsmrAgKsIIU6sinvT7g5+LfhkGEQwk7rGLFBKHHcbzGaWx57U8xmjZOodyMO
	NrCHaRVQ1t2MiohrTay4bCRBKWIF2uWGK1snC9fZ9mk6Q6pUGZHMaF+01w4UyaJXUIkY
	VHbgDKvLZXaKR2OuJTlKe0+/tKeD3c+5DEW00EpCTw7EPAfwelgDBImkzqb5lpe4cNOm
	0moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=UMaC+76rOH+nXfKatH0LaLR0RgFGGNjQGDbHHXvOx9I=;
	b=mxm3rdFOUma+T+TMlCYMR6LArkDLX6xytmv/5uQGOzsd+ODuiMgw6C/3RN6Sd40xgQ
	37k2G0zKqvf2aFNo4DV+a/JoGYVYtWM1YHSmso+Ol2pIAStdtIAwPkqRB05scjuXqQWs
	pm0P6oaHvSE9VA0hLG74ol1etTNpAB/1f63OuS1jyzYRHiwTBrFkelLYC4URAap26Qy3
	+RebEA3Xv8nxk5XpC82h7DKawCb2QMEt5M6dMXrUGsp4lJHTpJdiGkjMZ9shueDe35c2
	FoDMReT/oGDZz2IXEprD0Q1Bv7XrVLGbaTj6GkHAE7tjnHvT80xXq2di5pIA5yucfHzz
	rdKg==
X-Gm-Message-State: AG10YOR4PkWY+Lk5jRb1vWYG2iQGthwMa3PIy1aU/Hhba78i/4IN6FQDP+xwSnitgVN/qYx1wEbrngWTgNeMBQ==
X-Received: by 10.60.63.81 with SMTP id e17mr27267007oes.21.1454973916201;
	Mon, 08 Feb 2016 15:25:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 8 Feb 2016 15:24:46 -0800 (PST)
In-Reply-To: <1453479402-14870-5-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
	<1453479402-14870-5-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Feb 2016 15:24:46 -0800
X-Google-Sender-Auth: f-VUBljl92NeLowz44CzXbTI-Xw
Message-ID: <CAKmqyKMMphHzbnxRDQHkH-=v5Ap_V3XfarKicF9h-Na5H1MZHQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::241
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/10] hw/sd: Add QOM bus
 which SD cards plug in to
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AQVu0gSyFl61

On Fri, Jan 22, 2016 at 8:16 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Add a QOM bus for SD cards to plug in to.
>
> Note that since sd_enable() is used only by one board and there
> only as part of a broken implementation, we do not provide it in
> the SDBus API (but instead add a warning comment about the old
> function). Whoever converts OMAP and the nseries boards to QOM
> will need to either implement the card switch properly or move
> the enable hack into the OMAP MMC controller model.
>
> In the SDBus API, the old-style use of sd_set_cb to register some
> qemu_irqs for notification of card insertion and write-protect
> toggling is replaced with methods in the SDBusClass which the
> card calls on status changes and methods in the SDClass which
> the controller can call to find out the current status. The
> query methods will allow us to remove the abuse of the 'register
> irqs' API by controllers in their reset methods to trigger
> the card to tell them about the current status again.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

This patch doesn't compile and neither does anything after this. I get
the following errors:

In file included from hw/sd/sd.c:35:0:
/work/alistai/master-qemu/include/hw/sd/sd.h:81:5: error: unknown type
name =E2=80=98DeviceClass=E2=80=99
     DeviceClass parent_class;
     ^
/work/alistai/master-qemu/include/hw/sd/sd.h:99:14: error: field
=E2=80=98qbus=E2=80=99 has incomplete type
     BusState qbus;
              ^
/work/alistai/master-qemu/include/hw/sd/sd.h:104:14: error: field
=E2=80=98parent_class=E2=80=99 has incomplete type
     BusClass parent_class;
              ^
/work/alistai/master-qemu/rules.mak:57: recipe for target 'hw/sd/sd.o' fail=
ed
make: *** [hw/sd/sd.o] Error 1
make: *** Waiting for unfinished jobs....

With this configuration:

./configure --target-list=3D"arm-softmmu,aarch64-softmmu,aarch64-linux-user=
,microblazeel-softmmu,microblazeel-linux-user"
--enable-fdt --disable-werror --enable-sdl

Thanks,

Alistair

> ---
>  hw/sd/Makefile.objs |   2 +-
>  hw/sd/core.c        | 146 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/sd/sd.c          |  46 +++++++++++++++--
>  include/hw/sd/sd.h  |  62 ++++++++++++++++++++++
>  4 files changed, 251 insertions(+), 5 deletions(-)
>  create mode 100644 hw/sd/core.c
>
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index f1aed83..31c8330 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -1,6 +1,6 @@
>  common-obj-$(CONFIG_PL181) +=3D pl181.o
>  common-obj-$(CONFIG_SSI_SD) +=3D ssi-sd.o
> -common-obj-$(CONFIG_SD) +=3D sd.o
> +common-obj-$(CONFIG_SD) +=3D sd.o core.o
>  common-obj-$(CONFIG_SDHCI) +=3D sdhci.o
>
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-memcard.o
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> new file mode 100644
> index 0000000..14c2bdf
> --- /dev/null
> +++ b/hw/sd/core.c
> @@ -0,0 +1,146 @@
> +/*
> + * SD card bus interface code.
> + *
> + * Copyright (c) 2015 Linaro Limited
> + *
> + * Author:
> + *  Peter Maydell <peter.maydell@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +#include "sysemu/block-backend.h"
> +#include "hw/sd/sd.h"
> +
> +static SDState *get_card(SDBus *sdbus)
> +{
> +    /* We only ever have one child on the bus so just return it */
> +    BusChild *kid =3D QTAILQ_FIRST(&sdbus->qbus.children);
> +
> +    if (!kid) {
> +        return NULL;
> +    }
> +    return SD_CARD(kid->child);
> +}
> +
> +int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        return sc->do_command(card, req, response);
> +    }
> +
> +    return 0;
> +}
> +
> +void sdbus_write_data(SDBus *sdbus, uint8_t value)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        sc->write_data(card, value);
> +    }
> +}
> +
> +uint8_t sdbus_read_data(SDBus *sdbus)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        return sc->read_data(card);
> +    }
> +
> +    return 0;
> +}
> +
> +bool sdbus_data_ready(SDBus *sdbus)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        return sc->data_ready(card);
> +    }
> +
> +    return false;
> +}
> +
> +bool sdbus_get_inserted(SDBus *sdbus)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        return sc->get_inserted(card);
> +    }
> +
> +    return false;
> +}
> +
> +bool sdbus_get_readonly(SDBus *sdbus)
> +{
> +    SDState *card =3D get_card(sdbus);
> +
> +    if (card) {
> +        SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
> +
> +        return sc->get_readonly(card);
> +    }
> +
> +    return false;
> +}
> +
> +void sdbus_set_inserted(SDBus *sdbus, bool inserted)
> +{
> +    SDBusClass *sbc =3D SD_BUS_GET_CLASS(sdbus);
> +    BusState *qbus =3D BUS(sdbus);
> +
> +    if (sbc->set_inserted) {
> +        sbc->set_inserted(qbus->parent, inserted);
> +    }
> +}
> +
> +void sdbus_set_readonly(SDBus *sdbus, bool readonly)
> +{
> +    SDBusClass *sbc =3D SD_BUS_GET_CLASS(sdbus);
> +    BusState *qbus =3D BUS(sdbus);
> +
> +    if (sbc->set_readonly) {
> +        sbc->set_readonly(qbus->parent, readonly);
> +    }
> +}
> +
> +static const TypeInfo sd_bus_info =3D {
> +    .name =3D TYPE_SD_BUS,
> +    .parent =3D TYPE_BUS,
> +    .instance_size =3D sizeof(SDBus),
> +    .class_size =3D sizeof(SDBusClass),
> +};
> +
> +static void sd_bus_register_types(void)
> +{
> +    type_register_static(&sd_bus_info);
> +}
> +
> +type_init(sd_bus_register_types)
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index b62f7f5..1016aa5 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -430,14 +430,41 @@ static void sd_reset(DeviceState *dev)
>      sd->expecting_acmd =3D false;
>  }
>
> +static bool sd_get_inserted(SDState *sd)
> +{
> +    return blk_is_inserted(sd->blk);
> +}
> +
> +static bool sd_get_readonly(SDState *sd)
> +{
> +    return sd->wp_switch;
> +}
> +
>  static void sd_cardchange(void *opaque, bool load)
>  {
>      SDState *sd =3D opaque;
> +    DeviceState *dev =3D DEVICE(sd);
> +    SDBus *sdbus =3D SD_BUS(qdev_get_parent_bus(dev));
> +    bool inserted =3D sd_get_inserted(sd);
> +    bool readonly =3D sd_get_readonly(sd);
>
> -    qemu_set_irq(sd->inserted_cb, blk_is_inserted(sd->blk));
> -    if (blk_is_inserted(sd->blk)) {
> -        sd_reset(DEVICE(sd));
> -        qemu_set_irq(sd->readonly_cb, sd->wp_switch);
> +    if (inserted) {
> +        sd_reset(dev);
> +    }
> +
> +    /* The IRQ notification is for legacy non-QOM SD controller devices;
> +     * QOMified controllers use the SDBus APIs.
> +     */
> +    if (sdbus) {
> +        sdbus_set_inserted(sdbus, inserted);
> +        if (inserted) {
> +            sdbus_set_readonly(sdbus, readonly);
> +        }
> +    } else {
> +        qemu_set_irq(sd->inserted_cb, inserted);
> +        if (inserted) {
> +            qemu_set_irq(sd->readonly_cb, readonly);
> +        }
>      }
>  }
>
> @@ -1799,17 +1826,28 @@ static Property sd_properties[] =3D {
>  static void sd_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    SDCardClass *sc =3D SD_CARD_CLASS(klass);
>
>      dc->realize =3D sd_realize;
>      dc->props =3D sd_properties;
>      dc->vmsd =3D &sd_vmstate;
>      dc->reset =3D sd_reset;
> +    dc->bus_type =3D TYPE_SD_BUS;
> +
> +    sc->do_command =3D sd_do_command;
> +    sc->write_data =3D sd_write_data;
> +    sc->read_data =3D sd_read_data;
> +    sc->data_ready =3D sd_data_ready;
> +    sc->enable =3D sd_enable;
> +    sc->get_inserted =3D sd_get_inserted;
> +    sc->get_readonly =3D sd_get_readonly;
>  }
>
>  static const TypeInfo sd_info =3D {
>      .name =3D TYPE_SD_CARD,
>      .parent =3D TYPE_DEVICE,
>      .instance_size =3D sizeof(SDState),
> +    .class_size =3D sizeof(SDCardClass),
>      .class_init =3D sd_class_init,
>      .instance_init =3D sd_instance_init,
>  };
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 404d589..d5d273a 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -67,10 +67,51 @@ typedef struct {
>  } SDRequest;
>
>  typedef struct SDState SDState;
> +typedef struct SDBus SDBus;
>
>  #define TYPE_SD_CARD "sd-card"
>  #define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
> +#define SD_CARD_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
> +#define SD_CARD_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
>
> +typedef struct {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/
> +
> +    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
> +    void (*write_data)(SDState *sd, uint8_t value);
> +    uint8_t (*read_data)(SDState *sd);
> +    bool (*data_ready)(SDState *sd);
> +    void (*enable)(SDState *sd, bool enable);
> +    bool (*get_inserted)(SDState *sd);
> +    bool (*get_readonly)(SDState *sd);
> +} SDCardClass;
> +
> +#define TYPE_SD_BUS "sd-bus"
> +#define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
> +#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE=
_SD_BUS)
> +#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_S=
D_BUS)
> +
> +struct SDBus {
> +    BusState qbus;
> +};
> +
> +typedef struct {
> +    /*< private >*/
> +    BusClass parent_class;
> +    /*< public >*/
> +
> +    /* These methods are called by the SD device to notify the controlle=
r
> +     * when the card insertion or readonly status changes
> +     */
> +    void (*set_inserted)(DeviceState *dev, bool inserted);
> +    void (*set_readonly)(DeviceState *dev, bool readonly);
> +} SDBusClass;
> +
> +/* Legacy functions to be used only by non-qdevified callers */
>  SDState *sd_init(BlockBackend *bs, bool is_spi);
>  int sd_do_command(SDState *sd, SDRequest *req,
>                    uint8_t *response);
> @@ -78,6 +119,27 @@ void sd_write_data(SDState *sd, uint8_t value);
>  uint8_t sd_read_data(SDState *sd);
>  void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
>  bool sd_data_ready(SDState *sd);
> +/* sd_enable should not be used -- it is only used on the nseries boards=
,
> + * where it is part of a broken implementation of the MMC card slot swit=
ch
> + * (there should be two card slots which are multiplexed to a single MMC
> + * controller, but instead we model it with one card and controller and
> + * disable the card when the second slot is selected, so it looks like t=
he
> + * second slot is always empty).
> + */
>  void sd_enable(SDState *sd, bool enable);
>
> +/* Functions to be used by qdevified callers (working via
> + * an SDBus rather than directly with SDState)
> + */
> +int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
> +void sdbus_write_data(SDBus *sd, uint8_t value);
> +uint8_t sdbus_read_data(SDBus *sd);
> +bool sdbus_data_ready(SDBus *sd);
> +bool sdbus_get_inserted(SDBus *sd);
> +bool sdbus_get_readonly(SDBus *sd);
> +
> +/* Functions to be used by SD devices to report back to qdevified contro=
llers */
> +void sdbus_set_inserted(SDBus *sd, bool inserted);
> +void sdbus_set_readonly(SDBus *sd, bool inserted);
> +
>  #endif /* __hw_sd_h */
> --
> 1.9.1
>
>
