Received: by 10.182.158.201 with SMTP id ww9csp1903090obb;
        Sat, 19 Dec 2015 13:42:16 -0800 (PST)
X-Received: by 10.55.80.194 with SMTP id e185mr14515417qkb.68.1450561336009;
        Sat, 19 Dec 2015 13:42:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y188si22815981qhc.72.2015.12.19.13.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPGZ-0003PC-Lg
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:42:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPGF-000356-A7
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPGA-0001oo-62
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:41:55 -0500
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:35091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPG9-0001ok-UW; Sat, 19 Dec 2015 16:41:50 -0500
Received: by mail-pf0-x22c.google.com with SMTP id v86so67230086pfa.2;
	Sat, 19 Dec 2015 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q8OZ3lf116MH3x5Gh6DyTK1vdkkKVEdPUSV1UikoAZ4=;
	b=t3uEgYRTHkD75gDMiJIlLKcnJ1JkNKowHjA4uWFtwUamzOPtlr1lojgKTjmcpPttvc
	B0XTuihjMyJDu7nmH71IEMZ6sY6phifToMRj7RrIvCdo1vM+8kN90SvreG7PpVxmQxq2
	Jiuh/U5EDOADTjzZU9KgqXhHvaEvofqVpcf93Ty0txyEGP7KHMMgAR518s0ayeF37EpD
	DThN7AatFFKiiJG1buo1iO9TroKlndVmSbWGughgj6SFaCWZM6sZBYyrkYD0pu7CSSzs
	9tpFwMOEHQTI3yEjQP7T4xSUN1OaFxScAKkU/fItt4Y/AswBexK5f7yLqEY4CWxjmscA
	c5Xg==
X-Received: by 10.98.42.75 with SMTP id q72mr16030413pfq.10.1450561309357;
	Sat, 19 Dec 2015 13:41:49 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	q8sm28238125pap.45.2015.12.19.13.41.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:41:48 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:41:40 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219214140.GH4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 07/10] hw/sd/pxa2xx_mmci: convert to
	SysBusDevice object
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
X-TUID: 29bQT8il6rFb

On Fri, Dec 11, 2015 at 04:37:08PM +0000, Peter Maydell wrote:
> Convert the pxa2xx_mmci device to be a sysbus device.
> 
> In this commit we only change the device itself, and leave
> the interface to the SD card using the old non-SDBus APIs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/pxa2xx_mmci.c | 73 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index b217080..b6bb390 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -11,16 +11,24 @@
>   */
>  
>  #include "hw/hw.h"
> +#include "hw/sysbus.h"
>  #include "hw/arm/pxa.h"
>  #include "hw/sd/sd.h"
>  #include "hw/qdev.h"
> +#include "hw/qdev-properties.h"
> +
> +#define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
> +#define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
> +
> +typedef struct PXA2xxMMCIState {
> +    SysBusDevice parent_obj;
>  
> -struct PXA2xxMMCIState {
>      MemoryRegion iomem;
>      qemu_irq irq;
>      qemu_irq rx_dma;
>      qemu_irq tx_dma;
>  
> +    BlockBackend *blk;
>      SDState *card;
>  
>      uint32_t status;
> @@ -48,7 +56,7 @@ struct PXA2xxMMCIState {
>      int resp_len;
>  
>      int cmdreq;
> -};
> +} PXA2xxMMCIState;
>  
>  #define MMC_STRPCL	0x00	/* MMC Clock Start/Stop register */
>  #define MMC_STAT	0x04	/* MMC Status register */
> @@ -474,31 +482,60 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>                  BlockBackend *blk, qemu_irq irq,
>                  qemu_irq rx_dma, qemu_irq tx_dma)
>  {
> +    DeviceState *dev;
> +    SysBusDevice *sbd;
>      PXA2xxMMCIState *s;
>  
> -    s = (PXA2xxMMCIState *) g_malloc0(sizeof(PXA2xxMMCIState));
> -    s->irq = irq;
> -    s->rx_dma = rx_dma;
> -    s->tx_dma = tx_dma;
> -
> -    memory_region_init_io(&s->iomem, NULL, &pxa2xx_mmci_ops, s,
> -                          "pxa2xx-mmci", 0x00100000);
> -    memory_region_add_subregion(sysmem, base, &s->iomem);
> -
> -    /* Instantiate the actual storage */
> -    s->card = sd_init(blk, false);
> +    dev = qdev_create(NULL, TYPE_PXA2XX_MMCI);
> +    s = PXA2XX_MMCI(dev);
> +    /* Reach into the device and initialize the SD card. This is
> +     * unclean but will vanish when we update to SDBus APIs.
> +     */
> +    s->card = sd_init(s->blk, false);
>      if (s->card == NULL) {
>          exit(1);
>      }
> -
> -    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
> -                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
> -
> +    qdev_init_nofail(dev);
> +    sbd = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(sbd, 0, base);
> +    sysbus_connect_irq(sbd, 0, irq);
> +    sysbus_connect_irq(sbd, 1, rx_dma);
> +    sysbus_connect_irq(sbd, 2, tx_dma);

This looks like heterogenous GPIOs so should be separate named GPIO
sets. Looking at the machine model, the irq goes to the "pic" but the
DMA signals go to a different IP. I would leave the IRQ as the one and
only sysbus IRQ, but implement the two DMAs as named GPIOs.

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

>      return s;
>  }
>  
>  void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
> -                qemu_irq coverswitch)
> +                          qemu_irq coverswitch)
>  {
>      sd_set_cb(s->card, readonly, coverswitch);
>  }
> +
> +static void pxa2xx_mmci_instance_init(Object *obj)
> +{
> +    PXA2xxMMCIState *s = PXA2XX_MMCI(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &pxa2xx_mmci_ops, s,
> +                          "pxa2xx-mmci", 0x00100000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +    sysbus_init_irq(sbd, &s->rx_dma);
> +    sysbus_init_irq(sbd, &s->tx_dma);
> +
> +    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
> +                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
> +}
> +
> +static const TypeInfo pxa2xx_mmci_info = {
> +    .name = TYPE_PXA2XX_MMCI,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(PXA2xxMMCIState),
> +    .instance_init = pxa2xx_mmci_instance_init,
> +};
> +
> +static void pxa2xx_mmci_register_types(void)
> +{
> +    type_register_static(&pxa2xx_mmci_info);
> +}
> +
> +type_init(pxa2xx_mmci_register_types)
> -- 
> 1.9.1
> 
