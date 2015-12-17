Received: by 10.182.158.201 with SMTP id ww9csp665385obb;
        Thu, 17 Dec 2015 13:46:24 -0800 (PST)
X-Received: by 10.141.3.9 with SMTP id f9mr98415qhd.98.1450388784838;
        Thu, 17 Dec 2015 13:46:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f189si13128842qhe.127.2015.12.17.13.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 13:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9gNU-0006vL-Fu
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 16:46:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9gNS-0006sy-Rp
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 16:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9gNR-0008WR-Jm
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 16:46:22 -0500
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:34988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9gNP-0008W9-1m; Thu, 17 Dec 2015 16:46:19 -0500
Received: by mail-ob0-x22a.google.com with SMTP id 18so66890501obc.2;
	Thu, 17 Dec 2015 13:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=rtzFvbToDexDns5tdc4qoxosJspG5vzf0XhqlwMFZIE=;
	b=akw/HCODmq7vpADyfuQawL1/4fQGyfe3nZ3w0xeHd2WnRXW5bdN8ne067smFW0kqpj
	1edGSxOACC4za9BHu+2mTSYFCMCnIpMllfSnjFx8GOlY/IqEijw5HdgA52tFk73cVs21
	LtEMMOikbfzrPtkm/rp5aGTHlvMtoXMebeseSvZTMCT2Nb7Lr01JWuURpCnhZzor6/xQ
	ImKvXI4aNbUAVVrmfEgRIef5OaTvdEVtqeDTQV2Kzm08upMZoy+hzWVE+DR6K3h5gyV/
	nzX3AU8yugigN5y2DY7dTu1CFgmLe8cdYbYOfR1T4YWlzWhM6oGIKElIABTom2Pax1N+
	KFkg==
X-Received: by 10.182.231.136 with SMTP id tg8mr16001obc.27.1450388778437;
	Thu, 17 Dec 2015 13:46:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 17 Dec 2015 13:45:48 -0800 (PST)
In-Reply-To: <1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 17 Dec 2015 13:45:48 -0800
X-Google-Sender-Auth: Ki_prCa5R7qaix4yROpctGC3EwA
Message-ID: <CAKmqyKOYNfapty-are1iEetrw-1v_Jz_+w69iF5FX9+ZtiDFoA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22a
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/10] hw/sd/sd.c: QOMify
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
X-TUID: 9H5svBNoN1FF

On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Turn the SD card into a QOM device.
> This conversion only changes the device itself; the various
> functions which are effectively methods on the device are not
> touched at this point.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/sd.c         | 99 ++++++++++++++++++++++++++++++++++++++++++------------
>  include/hw/sd/sd.h |  3 ++
>  2 files changed, 80 insertions(+), 22 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1a9935c..7c79217 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -33,6 +33,8 @@
>  #include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
>  #include "qemu/bitmap.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/error-report.h"
>
>  //#define DEBUG_SD 1
>
> @@ -77,6 +79,8 @@ enum SDCardStates {
>  };
>
>  struct SDState {
> +    DeviceState parent_obj;
> +
>      uint32_t mode;    /* current card mode, one of SDCardModes */
>      int32_t state;    /* current card state, one of SDCardStates */
>      uint32_t ocr;
> @@ -472,34 +476,26 @@ static const VMStateDescription sd_vmstate = {
>      }
>  };
>
> -/* We do not model the chip select pin, so allow the board to select
> -   whether card should be in SSI or MMC/SD mode.  It is also up to the
> -   board to ensure that ssi transfers only occur when the chip select
> -   is asserted.  */
> +/* Legacy initialization function for use by non-qdevified callers */
>  SDState *sd_init(BlockBackend *blk, bool is_spi)
>  {
> -    SDState *sd;
> +    DeviceState *dev;
> +    Error *err = NULL;
>
> -    if (blk && blk_is_read_only(blk)) {
> -        fprintf(stderr, "sd_init: Cannot use read-only drive\n");
> +    dev = qdev_create(NULL, TYPE_SD);
> +    qdev_prop_set_drive(dev, "drive", blk, &err);
> +    if (err) {
> +        error_report("sd_init failed: %s", error_get_pretty(err));
>          return NULL;
>      }
> -
> -    sd = (SDState *) g_malloc0(sizeof(SDState));
> -    sd->buf = blk_blockalign(blk, 512);
> -    sd->spi = is_spi;
> -    sd->enable = true;
> -    sd->blk = blk;
> -    sd_reset(sd);
> -    if (sd->blk) {
> -        /* Attach dev if not already attached.  (This call ignores an
> -         * error return code if sd->blk is already attached.) */
> -        /* FIXME ignoring blk_attach_dev() failure is dangerously brittle */
> -        blk_attach_dev(sd->blk, sd);

This functionality is removed with this patch. If the block is not
already attached won't this cause errors?

> -        blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
> +    qdev_prop_set_bit(dev, "spi", is_spi);
> +    object_property_set_bool(OBJECT(dev), true, "realized", &err);
> +    if (err) {
> +        error_report("sd_init failed: %s", error_get_pretty(err));
> +        return NULL;
>      }
> -    vmstate_register(NULL, -1, &sd_vmstate, sd);
> -    return sd;
> +
> +    return SD(dev);
>  }
>
>  void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
> @@ -1765,3 +1761,62 @@ void sd_enable(SDState *sd, bool enable)
>  {
>      sd->enable = enable;
>  }
> +
> +static void sd_instance_init(Object *obj)
> +{
> +    SDState *sd = SD(obj);
> +
> +    sd->enable = true;
> +}
> +
> +static void sd_realize(DeviceState *dev, Error ** errp)

You have one too many spaces here.

Thanks,

Alistair

> +{
> +    SDState *sd = SD(dev);
> +
> +    if (sd->blk && blk_is_read_only(sd->blk)) {
> +        error_setg(errp, "Cannot use read-only drive as SD card");
> +        return;
> +    }
> +
> +    sd->buf = blk_blockalign(sd->blk, 512);
> +
> +    if (sd->blk) {
> +        blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
> +    }
> +
> +    sd_reset(sd);
> +}
> +
> +static Property sd_properties[] = {
> +    DEFINE_PROP_DRIVE("drive", SDState, blk),
> +    /* We do not model the chip select pin, so allow the board to select
> +     * whether card should be in SSI or MMC/SD mode.  It is also up to the
> +     * board to ensure that ssi transfers only occur when the chip select
> +     * is asserted.  */
> +    DEFINE_PROP_BOOL("spi", SDState, spi, false),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void sd_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = sd_realize;
> +    dc->props = sd_properties;
> +    dc->vmsd = &sd_vmstate;
> +}
> +
> +static const TypeInfo sd_info = {
> +    .name = TYPE_SD,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(SDState),
> +    .class_init = sd_class_init,
> +    .instance_init = sd_instance_init,
> +};
> +
> +static void sd_register_types(void)
> +{
> +    type_register_static(&sd_info);
> +}
> +
> +type_init(sd_register_types)
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 79adb5b..6997dfc 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -68,6 +68,9 @@ typedef struct {
>
>  typedef struct SDState SDState;
>
> +#define TYPE_SD "sd"
> +#define SD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD)
> +
>  SDState *sd_init(BlockBackend *bs, bool is_spi);
>  int sd_do_command(SDState *sd, SDRequest *req,
>                    uint8_t *response);
> --
> 1.9.1
>
>
