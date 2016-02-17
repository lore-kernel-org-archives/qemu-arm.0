Received: by 10.25.208.211 with SMTP id h202csp163657lfg;
        Wed, 17 Feb 2016 09:36:19 -0800 (PST)
X-Received: by 10.55.80.135 with SMTP id e129mr1303700qkb.65.1455730579335;
        Wed, 17 Feb 2016 09:36:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o124si2234270qho.101.2016.02.17.09.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Feb 2016 09:36:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:60059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aW61S-0007b3-Q2
	for alex.bennee@linaro.org; Wed, 17 Feb 2016 12:36:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW60D-0006My-Mh
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 12:35:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW60C-0007Wf-Ft
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 12:35:01 -0500
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:32912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aW60C-0007WZ-9C; Wed, 17 Feb 2016 12:35:00 -0500
Received: by mail-ob0-x236.google.com with SMTP id jq7so25140151obb.0;
	Wed, 17 Feb 2016 09:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=I0h3Fh9OPv9nkBuwDG8zdoy9IVUZ6VvNOziPztAixDw=;
	b=sGF6ERXNDDiYcNtw6btzapjbWL+OGJV7G3vzUbt32e0qdcrvhu46a94B4DEDJdRZF4
	cBL0cwvjhDrfsHucUWR576Ae0h5orwP6ckWvVCSMSWxLLj+hA2WT/1O/G0stu16lDuhi
	llI6keluydiz/bC7H/bEYq2G8hzcnkYO79LBzT4a7HZxRFTDmNL291/2QjTEQagdTffo
	NPgvgZ2+WvHgHC5JSCbSIv2Fo36Cfa+80hVgd5JQ5JGqj7S1n486Erj97KKclRyDr+OT
	1XShV8AuoxHhct6muqxi7Q5N8T2e6i45ufWaFZTBxzb3K/oLiPjxHSc2Xdaw52eLIls7
	XDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=I0h3Fh9OPv9nkBuwDG8zdoy9IVUZ6VvNOziPztAixDw=;
	b=TfC/ZUP63MjrSv5WDLfYQH4Y1TCDWzEOIAm5uQVek7e7unYVkye5p4rmUyiChkWjMQ
	GOZFk3uhBYoY8vShpe6f6dSw3hD+eS6nZvQ+dKVve/fRDrYUbLwVxoRxGFV0xa9b3R8L
	0eIlYs3yNL3rfTl2hkFeSbLIM/q6Hb8ayd54q83/xglbggXq/7QmcS489UXc8rbFvbIo
	zOHk14yiEC0irPlgeAYbjg7uB0jovexwr7ZMdq6YZqA25e4DGC+7IC7/hiqYW407a2M4
	g4LGEaWqqP4NZ1mC5GtEqdKRgFturMvf6gx37b0TMqC1FL4/GV3qhuh1AStFFmJixkUu
	xIrw==
X-Gm-Message-State: AG10YOSFmet75TCWoVsoPYAHqzV6MyYMN7SJJ9wJw8uUPnvjyWh9T3HEcXB3mhQA+lka2r8kIzWE84kPTuWazQ==
X-Received: by 10.202.104.169 with SMTP id o41mr2149841oik.57.1455730499816;
	Wed, 17 Feb 2016 09:34:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 17 Feb 2016 09:34:30 -0800 (PST)
In-Reply-To: <1455646193-13238-3-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
	<1455646193-13238-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 17 Feb 2016 09:34:30 -0800
X-Google-Sender-Auth: z5SQ57GO4nQOgZRK36QfZOT1z84
Message-ID: <CAKmqyKP5jVitj-ooiS8YG76Ow=h1=DeW_67=-fOetNNDNeaRYQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::236
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 02/10] hw/sd/sd.c: QOMify
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
X-TUID: MaK/0gcLMMr5

On Tue, Feb 16, 2016 at 10:09 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> Turn the SD card into a QOM device.
> This conversion only changes the device itself; the various
> functions which are effectively methods on the device are not
> touched at this point.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/sd/sd.c         | 99 ++++++++++++++++++++++++++++++++++++++++++------------
>  include/hw/sd/sd.h |  3 ++
>  2 files changed, 80 insertions(+), 22 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index dd614b0..1681728 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -34,6 +34,8 @@
>  #include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
>  #include "qemu/bitmap.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/error-report.h"
>
>  //#define DEBUG_SD 1
>
> @@ -78,6 +80,8 @@ enum SDCardStates {
>  };
>
>  struct SDState {
> +    DeviceState parent_obj;
> +
>      uint32_t mode;    /* current card mode, one of SDCardModes */
>      int32_t state;    /* current card state, one of SDCardStates */
>      uint32_t ocr;
> @@ -473,34 +477,26 @@ static const VMStateDescription sd_vmstate = {
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
> +    dev = qdev_create(NULL, TYPE_SD_CARD);
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
> +    return SD_CARD(dev);
>  }
>
>  void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
> @@ -1769,3 +1765,62 @@ void sd_enable(SDState *sd, bool enable)
>  {
>      sd->enable = enable;
>  }
> +
> +static void sd_instance_init(Object *obj)
> +{
> +    SDState *sd = SD_CARD(obj);
> +
> +    sd->enable = true;
> +}
> +
> +static void sd_realize(DeviceState *dev, Error **errp)
> +{
> +    SDState *sd = SD_CARD(dev);
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
> +    .name = TYPE_SD_CARD,
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
> index 79adb5b..404d589 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -68,6 +68,9 @@ typedef struct {
>
>  typedef struct SDState SDState;
>
> +#define TYPE_SD_CARD "sd-card"
> +#define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
> +
>  SDState *sd_init(BlockBackend *bs, bool is_spi);
>  int sd_do_command(SDState *sd, SDRequest *req,
>                    uint8_t *response);
> --
> 1.9.1
>
>
