Received: by 10.182.158.201 with SMTP id ww9csp1903478obb;
        Sat, 19 Dec 2015 13:43:33 -0800 (PST)
X-Received: by 10.140.144.205 with SMTP id 196mr15783953qhq.38.1450561413497;
        Sat, 19 Dec 2015 13:43:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s105si22894624qgs.72.2015.12.19.13.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPHp-0004KZ-8D
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:43:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPHU-00042a-CP
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:43:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPHP-00021g-8g
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:43:12 -0500
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:35684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPHP-00021c-0o; Sat, 19 Dec 2015 16:43:07 -0500
Received: by mail-pa0-x22b.google.com with SMTP id jx14so49748694pad.2;
	Sat, 19 Dec 2015 13:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=leQEU5nPznGz7iuYp3j4fopw/myWcxaeypKsifJ5Tnk=;
	b=z5+o117EgwMdWh4qlehaOv4CKY/V3OeYVVzWewxhTB00moKQmUzgD4cSDlzFartWr/
	rHexSbVGcHO7SIYdMtigPo+gN3o5eJIhmqqVUI6Jz/TNpIj9mDawIpKiaxv8AS5lQvkd
	fARLCmHxugdj2ZdkksoOExtWZ6X7X4GOw014AKvqgHpJ6y+zOjfu0fl1JOZzz3IKoQSi
	Vmj14mzNfpvBBfqo7SQlEZ5Ft5El1FPjVHheNg4/zaft/4XGOY8m1vJpFudw9qzSW1QM
	5lH4zHtFy7otqoMd+8mFkJq7Iv1heFUCAa8J5vzhCBc68leQ2n/J6DA1s1fmDVN6vfQZ
	YGsg==
X-Received: by 10.66.237.102 with SMTP id vb6mr15673453pac.133.1450561386369; 
	Sat, 19 Dec 2015 13:43:06 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	q193sm10427010pfq.28.2015.12.19.13.43.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:43:05 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:42:57 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219214257.GI4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 08/10] hw/sd/pxa2xx_mmci: Update to use new
	SDBus APIs
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
X-TUID: nKsmiJIYxlZZ

On Fri, Dec 11, 2015 at 04:37:09PM +0000, Peter Maydell wrote:
> Now the PXA2xx MMCI device is QOMified itself, we can
> update it to use the SDBus APIs to talk to the SD card.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/pxa2xx_mmci.c | 80 +++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 66 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index b6bb390..a30be2b 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -16,10 +16,14 @@
>  #include "hw/sd/sd.h"
>  #include "hw/qdev.h"
>  #include "hw/qdev-properties.h"
> +#include "qemu/error-report.h"
>  
>  #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
>  #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
>  
> +#define TYPE_PXA2XX_MMCI_BUS "pxa2xx-mmci-bus"
> +#define PXA2XX_MMCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
> +
>  typedef struct PXA2xxMMCIState {
>      SysBusDevice parent_obj;
>  
> @@ -27,9 +31,11 @@ typedef struct PXA2xxMMCIState {
>      qemu_irq irq;
>      qemu_irq rx_dma;
>      qemu_irq tx_dma;
> +    qemu_irq inserted;
> +    qemu_irq readonly;
>  
>      BlockBackend *blk;
> -    SDState *card;
> +    SDBus sdbus;
>  
>      uint32_t status;
>      uint32_t clkrt;
> @@ -129,7 +135,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
>  
>      if (s->cmdat & CMDAT_WR_RD) {
>          while (s->bytesleft && s->tx_len) {
> -            sd_write_data(s->card, s->tx_fifo[s->tx_start ++]);
> +            sdbus_write_data(&s->sdbus, s->tx_fifo[s->tx_start++]);
>              s->tx_start &= 0x1f;
>              s->tx_len --;
>              s->bytesleft --;
> @@ -139,7 +145,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
>      } else
>          while (s->bytesleft && s->rx_len < 32) {
>              s->rx_fifo[(s->rx_start + (s->rx_len ++)) & 0x1f] =
> -                sd_read_data(s->card);
> +                sdbus_read_data(&s->sdbus);
>              s->bytesleft --;
>              s->intreq |= INT_RXFIFO_REQ;
>          }
> @@ -173,7 +179,7 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
>      request.arg = s->arg;
>      request.crc = 0;	/* FIXME */
>  
> -    rsplen = sd_do_command(s->card, &request, response);
> +    rsplen = sdbus_do_command(&s->sdbus, &request, response);
>      s->intreq |= INT_END_CMD;
>  
>      memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
> @@ -482,32 +488,59 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>                  BlockBackend *blk, qemu_irq irq,
>                  qemu_irq rx_dma, qemu_irq tx_dma)
>  {
> -    DeviceState *dev;
> +    DeviceState *dev, *carddev;
>      SysBusDevice *sbd;
>      PXA2xxMMCIState *s;
> +    Error *err = NULL;
>  
>      dev = qdev_create(NULL, TYPE_PXA2XX_MMCI);
>      s = PXA2XX_MMCI(dev);
> -    /* Reach into the device and initialize the SD card. This is
> -     * unclean but will vanish when we update to SDBus APIs.
> -     */
> -    s->card = sd_init(s->blk, false);
> -    if (s->card == NULL) {
> -        exit(1);
> -    }
> -    qdev_init_nofail(dev);
>      sbd = SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(sbd, 0, base);
>      sysbus_connect_irq(sbd, 0, irq);
>      sysbus_connect_irq(sbd, 1, rx_dma);
>      sysbus_connect_irq(sbd, 2, tx_dma);
> +
> +    /* Create and plug in the sd card */
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &err);
> +    if (err) {
> +        error_report("failed to init SD card: %s", error_get_pretty(err));
> +        return NULL;
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_report("failed to init SD card: %s", error_get_pretty(err));
> +        return NULL;
> +    }
> +
>      return s;
>  }
>  
> +static void pxa2xx_mmci_set_inserted(DeviceState *dev, bool inserted)
> +{
> +    PXA2xxMMCIState *s = PXA2XX_MMCI(dev);
> +
> +    qemu_set_irq(s->inserted, inserted);
> +}
> +
> +static void pxa2xx_mmci_set_readonly(DeviceState *dev, bool readonly)
> +{
> +    PXA2xxMMCIState *s = PXA2XX_MMCI(dev);
> +
> +    qemu_set_irq(s->readonly, readonly);
> +}
> +
>  void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
>                            qemu_irq coverswitch)
>  {
> -    sd_set_cb(s->card, readonly, coverswitch);
> +    DeviceState *dev = DEVICE(s);
> +
> +    s->readonly = readonly;
> +    s->inserted = coverswitch;
> +
> +    pxa2xx_mmci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
> +    pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));

Looking at the machine models, _mmci_handlers is only called at
machine init time. So this should not be needed. devices should be
triggering an initial call of _set_readonly that reliably propagates
back up.

If we do need these two lines they should be in the reset handler.

Regards,
Peter

>  }
>  
>  static void pxa2xx_mmci_instance_init(Object *obj)
> @@ -524,6 +557,17 @@ static void pxa2xx_mmci_instance_init(Object *obj)
>  
>      register_savevm(NULL, "pxa2xx_mmci", 0, 0,
>                      pxa2xx_mmci_save, pxa2xx_mmci_load, s);
> +
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
> +                        TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
> +}
> +
> +static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
> +{
> +    SDBusClass *sbc = SD_BUS_CLASS(klass);
> +
> +    sbc->set_inserted = pxa2xx_mmci_set_inserted;
> +    sbc->set_readonly = pxa2xx_mmci_set_readonly;
>  }
>  
>  static const TypeInfo pxa2xx_mmci_info = {
> @@ -533,9 +577,17 @@ static const TypeInfo pxa2xx_mmci_info = {
>      .instance_init = pxa2xx_mmci_instance_init,
>  };
>  
> +static const TypeInfo pxa2xx_mmci_bus_info = {
> +    .name = TYPE_PXA2XX_MMCI_BUS,
> +    .parent = TYPE_SD_BUS,
> +    .instance_size = sizeof(SDBus),
> +    .class_init = pxa2xx_mmci_bus_class_init,
> +};
> +
>  static void pxa2xx_mmci_register_types(void)
>  {
>      type_register_static(&pxa2xx_mmci_info);
> +    type_register_static(&pxa2xx_mmci_bus_info);
>  }
>  
>  type_init(pxa2xx_mmci_register_types)
> -- 
> 1.9.1
> 
