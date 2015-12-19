Received: by 10.182.158.201 with SMTP id ww9csp1902551obb;
        Sat, 19 Dec 2015 13:40:25 -0800 (PST)
X-Received: by 10.140.233.67 with SMTP id e64mr16015104qhc.42.1450561225018;
        Sat, 19 Dec 2015 13:40:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si49942qgl.121.2015.12.19.13.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPEm-0001bS-PQ
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:40:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPEQ-0001Fi-Tm
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPEL-0001BO-J1
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:40:02 -0500
Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235]:33221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPEL-0001BJ-B5; Sat, 19 Dec 2015 16:39:57 -0500
Received: by mail-pa0-x235.google.com with SMTP id ur14so78420356pab.0;
	Sat, 19 Dec 2015 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OV1BR4+CsRC1K4pYNeqCjylDh4CR32+r7DF/rLkFqfA=;
	b=vEcfSo1WcfPq2AMvBBL0paKW1mnnaqVhsTU/llxXONCXxFBbwYV2yiYIXgEUhkB8Zt
	awwY0Xkf+wXFaRD5ct9X9b+dALPrZKaYmOfKN8usex7n+c22+iz3LeQeTIqU70rgsFMw
	U196X4B0y99M71XHUMVs+RyV/5ny8xQRdTHFy5WPOdRUeTDVr2HP34WwzTLf4tIvdKn9
	FagLn1q7G9pPX7x6GXg+RnLTt1GAuLo3tlmYO2ZtirYinMURfI2Ze9X5w/PuB+wq/ej0
	744u2uvVr9sMthlEPx3ruseYTtHuJ31rmuOu21rwszmKo6N/s3sly0vjYOh9J184t3Lk
	lfeA==
X-Received: by 10.67.4.42 with SMTP id cb10mr15761192pad.65.1450561196878;
	Sat, 19 Dec 2015 13:39:56 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	o22sm25651597pfi.2.2015.12.19.13.39.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:39:55 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:39:47 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219213947.GF4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-6-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::235
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/10] hw/sd/sdhci.c: Update to use SDBus
	APIs
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
X-TUID: zOlyA0oKLk3J

On Fri, Dec 11, 2015 at 04:37:06PM +0000, Peter Maydell wrote:
> Update the SDHCI code to use the new SDBus APIs.
> 
> This commit introduces the new command line options required
> to connect a disk to sdhci-pci:
> 
>  -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/sdhci.c         | 95 +++++++++++++++++++++++++++++++++++----------------
>  include/hw/sd/sdhci.h |  3 +-
>  2 files changed, 67 insertions(+), 31 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 991c9b5..17e08a2 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -55,6 +55,9 @@
>          } \
>      } while (0)
>  
> +#define TYPE_SDHCI_BUS "sdhci-bus"
> +#define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
> +
>  /* Default SD/MMC host controller features information, which will be
>   * presented in CAPABILITIES register of generic SD host controller at reset.
>   * If not stated otherwise:
> @@ -145,9 +148,9 @@ static void sdhci_raise_insertion_irq(void *opaque)
>      }
>  }
>  
> -static void sdhci_insert_eject_cb(void *opaque, int irq, int level)
> +static void sdhci_set_inserted(DeviceState *dev, bool level)
>  {
> -    SDHCIState *s = (SDHCIState *)opaque;
> +    SDHCIState *s = (SDHCIState *)dev;
>      DPRINT_L1("Card state changed: %s!\n", level ? "insert" : "eject");
>  
>      if ((s->norintsts & SDHC_NIS_REMOVE) && level) {
> @@ -172,9 +175,9 @@ static void sdhci_insert_eject_cb(void *opaque, int irq, int level)
>      }
>  }
>  
> -static void sdhci_card_readonly_cb(void *opaque, int irq, int level)
> +static void sdhci_set_readonly(DeviceState *dev, bool level)
>  {
> -    SDHCIState *s = (SDHCIState *)opaque;
> +    SDHCIState *s = (SDHCIState *)dev;
>  
>      if (level) {
>          s->prnsts &= ~SDHC_WRITE_PROTECT;
> @@ -186,6 +189,8 @@ static void sdhci_card_readonly_cb(void *opaque, int irq, int level)
>  
>  static void sdhci_reset(SDHCIState *s)
>  {
> +    DeviceState *dev = DEVICE(s);
> +
>      timer_del(s->insert_timer);
>      timer_del(s->transfer_timer);
>      /* Set all registers to 0. Capabilities registers are not cleared
> @@ -193,7 +198,10 @@ static void sdhci_reset(SDHCIState *s)
>       * initialization */
>      memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
>  
> -    sd_set_cb(s->card, s->ro_cb, s->eject_cb);
> +    /* Reset other state based on current card insertion/readonly status */
> +    sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
> +    sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
> +
>      s->data_count = 0;
>      s->stopped_state = sdhc_not_stopped;
>  }
> @@ -211,7 +219,7 @@ static void sdhci_send_command(SDHCIState *s)
>      request.cmd = s->cmdreg >> 8;
>      request.arg = s->argument;
>      DPRINT_L1("sending CMD%u ARG[0x%08x]\n", request.cmd, request.arg);
> -    rlen = sd_do_command(s->card, &request, response);
> +    rlen = sdbus_do_command(&s->sdbus, &request, response);
>  
>      if (s->cmdreg & SDHC_CMD_RESPONSE) {
>          if (rlen == 4) {
> @@ -270,7 +278,7 @@ static void sdhci_end_transfer(SDHCIState *s)
>          request.cmd = 0x0C;
>          request.arg = 0;
>          DPRINT_L1("Automatically issue CMD%d %08x\n", request.cmd, request.arg);
> -        sd_do_command(s->card, &request, response);
> +        sdbus_do_command(&s->sdbus, &request, response);
>          /* Auto CMD12 response goes to the upper Response register */
>          s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
>                  (response[2] << 8) | response[3];
> @@ -302,7 +310,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
>      }
>  
>      for (index = 0; index < (s->blksize & 0x0fff); index++) {
> -        s->fifo_buffer[index] = sd_read_data(s->card);
> +        s->fifo_buffer[index] = sdbus_read_data(&s->sdbus);
>      }
>  
>      /* New data now available for READ through Buffer Port Register */
> @@ -395,7 +403,7 @@ static void sdhci_write_block_to_card(SDHCIState *s)
>      }
>  
>      for (index = 0; index < (s->blksize & 0x0fff); index++) {
> -        sd_write_data(s->card, s->fifo_buffer[index]);
> +        sdbus_write_data(&s->sdbus, s->fifo_buffer[index]);
>      }
>  
>      /* Next data can be written through BUFFER DATORT register */
> @@ -477,7 +485,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>          while (s->blkcnt) {
>              if (s->data_count == 0) {
>                  for (n = 0; n < block_size; n++) {
> -                    s->fifo_buffer[n] = sd_read_data(s->card);
> +                    s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>                  }
>              }
>              begin = s->data_count;
> @@ -518,7 +526,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>              s->sdmasysad += s->data_count - begin;
>              if (s->data_count == block_size) {
>                  for (n = 0; n < block_size; n++) {
> -                    sd_write_data(s->card, s->fifo_buffer[n]);
> +                    sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>                  }
>                  s->data_count = 0;
>                  if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -550,7 +558,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
>  
>      if (s->trnmod & SDHC_TRNS_READ) {
>          for (n = 0; n < datacnt; n++) {
> -            s->fifo_buffer[n] = sd_read_data(s->card);
> +            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>          }
>          dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_buffer,
>                           datacnt);
> @@ -558,7 +566,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
>          dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buffer,
>                          datacnt);
>          for (n = 0; n < datacnt; n++) {
> -            sd_write_data(s->card, s->fifo_buffer[n]);
> +            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>          }
>      }
>  
> @@ -662,7 +670,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                  while (length) {
>                      if (s->data_count == 0) {
>                          for (n = 0; n < block_size; n++) {
> -                            s->fifo_buffer[n] = sd_read_data(s->card);
> +                            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>                          }
>                      }
>                      begin = s->data_count;
> @@ -703,7 +711,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      dscr.addr += s->data_count - begin;
>                      if (s->data_count == block_size) {
>                          for (n = 0; n < block_size; n++) {
> -                            sd_write_data(s->card, s->fifo_buffer[n]);
> +                            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>                          }
>                          s->data_count = 0;
>                          if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -817,7 +825,7 @@ static void sdhci_data_transfer(void *opaque)
>              break;
>          }
>      } else {
> -        if ((s->trnmod & SDHC_TRNS_READ) && sd_data_ready(s->card)) {
> +        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus)) {
>              s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
>                      SDHC_DAT_LINE_ACTIVE;
>              sdhci_read_block_from_card(s);
> @@ -1154,15 +1162,10 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
>      }
>  }
>  
> -static void sdhci_initfn(SDHCIState *s, BlockBackend *blk)
> +static void sdhci_initfn(SDHCIState *s)
>  {
> -    s->card = sd_init(blk, false);
> -    if (s->card == NULL) {
> -        exit(1);
> -    }
> -    s->eject_cb = qemu_allocate_irq(sdhci_insert_eject_cb, s, 0);
> -    s->ro_cb = qemu_allocate_irq(sdhci_card_readonly_cb, s, 0);
> -    sd_set_cb(s->card, s->ro_cb, s->eject_cb);
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
> +                        TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
>  
>      s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
>      s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
> @@ -1232,7 +1235,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
>      SDHCIState *s = PCI_SDHCI(dev);
>      dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
>      dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
> -    sdhci_initfn(s, s->blk);
> +    sdhci_initfn(s);
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
>      s->irq = pci_allocate_irq(dev);
> @@ -1279,11 +1282,8 @@ static Property sdhci_sysbus_properties[] = {
>  static void sdhci_sysbus_init(Object *obj)
>  {
>      SDHCIState *s = SYSBUS_SDHCI(obj);
> -    DriveInfo *di;
>  
> -    /* FIXME use a qdev drive property instead of drive_get_next() */
> -    di = drive_get_next(IF_SD);
> -    sdhci_initfn(s, di ? blk_by_legacy_dinfo(di) : NULL);
> +    sdhci_initfn(s);
>  }
>  
>  static void sdhci_sysbus_finalize(Object *obj)
> @@ -1296,6 +1296,26 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>  {
>      SDHCIState *s = SYSBUS_SDHCI(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    DriveInfo *di;
> +    BlockBackend *blk;
> +    DeviceState *carddev;
> +
> +    /* Create and plug in the sd card.
> +     * FIXME: this should be done by the users of this device so we
> +     * do not use drive_get_next() here.
> +     */
> +    di = drive_get_next(IF_SD);
> +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
> +    qdev_prop_set_drive(carddev, "drive", blk, errp);
> +    if (*errp) {

It is generally valid for an errp to be NULL. I think we should use a
local even if we know the caller will not pass NULL.

Regards,
Peter

> +        return;
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "realized", errp);
> +    if (*errp) {
> +        return;
> +    }
>  
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
> @@ -1303,6 +1323,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>      memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
>              SDHC_REGISTERS_MAP_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
> +
>  }
>  
>  static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
> @@ -1325,10 +1346,26 @@ static const TypeInfo sdhci_sysbus_info = {
>      .class_init = sdhci_sysbus_class_init,
>  };
>  
> +static void sdhci_bus_class_init(ObjectClass *klass, void *data)
> +{
> +    SDBusClass *sbc = SD_BUS_CLASS(klass);
> +
> +    sbc->set_inserted = sdhci_set_inserted;
> +    sbc->set_readonly = sdhci_set_readonly;
> +}
> +
> +static const TypeInfo sdhci_bus_info = {
> +    .name = TYPE_SDHCI_BUS,
> +    .parent = TYPE_SD_BUS,
> +    .instance_size = sizeof(SDBus),
> +    .class_init = sdhci_bus_class_init,
> +};
> +
>  static void sdhci_register_types(void)
>  {
>      type_register_static(&sdhci_pci_info);
>      type_register_static(&sdhci_sysbus_info);
> +    type_register_static(&sdhci_bus_info);
>  }
>  
>  type_init(sdhci_register_types)
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index e78d938..4816516 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -37,9 +37,8 @@ typedef struct SDHCIState {
>          PCIDevice pcidev;
>          SysBusDevice busdev;
>      };
> -    SDState *card;
> +    SDBus sdbus;
>      MemoryRegion iomem;
> -    BlockBackend *blk;
>  
>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>      QEMUTimer *transfer_timer;
> -- 
> 1.9.1
> 
