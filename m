Received: by 10.182.158.201 with SMTP id ww9csp1901480obb;
        Sat, 19 Dec 2015 13:36:38 -0800 (PST)
X-Received: by 10.140.222.79 with SMTP id s76mr15675070qhb.21.1450560998174;
        Sat, 19 Dec 2015 13:36:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si22789437qhy.119.2015.12.19.13.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:36:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPB7-000746-S0
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:36:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPAo-0006mJ-7X
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:36:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPAj-0000jB-2u
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:36:18 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:35921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPAi-0000j7-Qv; Sat, 19 Dec 2015 16:36:13 -0500
Received: by mail-pa0-x22a.google.com with SMTP id q3so58142352pav.3;
	Sat, 19 Dec 2015 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OHvhQQPReF6up86t+rVrYQW0U+Cgxw6KHK7QV3LIW7g=;
	b=KPmNO7a2t3N0+dIFHxq95vNoVzI3HTp27LlgDzCeq17mfiinw2Fr2Wrxxm21+Nc9AR
	5vhEBlDj6X3STgW1/dY7MwG2pWxXbz6chEalZnVYdUhed9xxNqgei2wDkMkC4iP5Hs6W
	gY9bZ0SviC7Qo45n0csWPm5G7BiKHik2qUYJSL1l9DXQCIHIq9M0X0y8alvvieoTOeQG
	Pnu8se1121VPq66qemE5WXdRjHo3AGS9Rte1nq/52xKxo9xZE6Zx8LX+MchcOc/aPAHX
	Cnoff+9ySQcqohGu91zEkfTBFWVxzO7W2uZJlQNR0+mqbThuL2peRcp3qOXItLZtkp/+
	Z/aQ==
X-Received: by 10.67.4.42 with SMTP id cb10mr15746549pad.65.1450560972224;
	Sat, 19 Dec 2015 13:36:12 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155])
	by smtp.gmail.com with ESMTPSA id 2sm25636325pfl.56.2015.12.19.13.36.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:36:11 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:36:03 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219213603.GC4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 02/10] hw/sd/sd.c: QOMify
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aJ/mpcL65l+p

On Fri, Dec 11, 2015 at 04:37:03PM +0000, Peter Maydell wrote:
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

Can we get "card" in there? I think unqualified SD should be usable to refer
to the bus standard.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +#define SD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD)
> +
>  SDState *sd_init(BlockBackend *bs, bool is_spi);
>  int sd_do_command(SDState *sd, SDRequest *req,
>                    uint8_t *response);
> -- 
> 1.9.1
> 
