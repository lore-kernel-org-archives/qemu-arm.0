Received: by 10.25.208.211 with SMTP id h202csp174994lfg;
        Wed, 17 Feb 2016 10:02:31 -0800 (PST)
X-Received: by 10.140.102.11 with SMTP id v11mr3639701qge.39.1455732150994;
        Wed, 17 Feb 2016 10:02:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si2359799qkl.83.2016.02.17.10.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Feb 2016 10:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:60251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aW6Qo-0002Sc-Gd
	for alex.bennee@linaro.org; Wed, 17 Feb 2016 13:02:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW6Qk-0002P6-Td
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 13:02:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aW6Qj-00053L-2C
	for qemu-arm@nongnu.org; Wed, 17 Feb 2016 13:02:26 -0500
Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229]:32871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aW6Qi-00053F-Rp; Wed, 17 Feb 2016 13:02:25 -0500
Received: by mail-ob0-x229.google.com with SMTP id jq7so26403149obb.0;
	Wed, 17 Feb 2016 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LnW7D+ieP/e1VV3nwlFnAZX+6Q1pbVHcCQoUY39AAJY=;
	b=oOf9IItQ2DaAGAJGYAw2PAz4t6SnEP5iZTevuulV4gqQcGWPVlwZWrndr3qFt5K9q+
	a9I37tk07YeBw1MbdySrk+020ansGlUdJTqbJifOtfu9qfjeiEzGgqGG+KO5ACN+U3fd
	OGpUi97qHarfpERMMTccz9w7mhRgTDwe9lmJ6/g1/rCnAh4eRet5GE277uwDVGrMn044
	bu/NMCxwcrbYwwFVTjAEiks3THMv8ZzTXDcc4asOnZ6jir5G4uwN4D+uHJHo0pEps1Nk
	j9W+TJTZRM87z0E0J8IWcTdVFlw9VCDiebrdiPZkcbYyEE+OHhNYKM50KO+M8yUiV5HK
	vDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=LnW7D+ieP/e1VV3nwlFnAZX+6Q1pbVHcCQoUY39AAJY=;
	b=fcMu8ezl6IUkXkvQy0XhaR4z0U96DVZ6QIEDT7lrvj8ZTjMF8w9CZ/zppFmC1dV6L7
	ff4zcnUFa0xbalV9N8ymNy8RWYKeQy9s1JKWhLhrtKQIUeFWLHhUcM3KgVEcsrcG8dWV
	MtRtr+BL9PR1R8HopSf8dCearv46cVJbIZt/b4mHX3rjuimsTpNx3EckR6zDKFfiaIPK
	fh6ArjhHqisG0N8cVb2RBUykIbAPDn2DDa/i/QoLinnFoYC79ycBMukL7pODaXN57a3O
	nrq5jQDVZ6gMIQxuWn6ob7TogYpCicOCrkS6LJpQPv0QL/+d+tKcw42086X4ua5GGhgd
	nGtw==
X-Gm-Message-State: AG10YOR91fsvKdwxQSeNuJy9Ek8szOgGAa4SN82gDab1MbkSpi14fbGPX0ImM0kIW/w0+E76mvvsxdwsJTYtZA==
X-Received: by 10.182.86.98 with SMTP id o2mr2300792obz.27.1455732143548; Wed,
	17 Feb 2016 10:02:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 17 Feb 2016 10:01:54 -0800 (PST)
In-Reply-To: <1455646193-13238-6-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
	<1455646193-13238-6-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 17 Feb 2016 10:01:54 -0800
X-Google-Sender-Auth: R1t-jB0bOCXCLYlYFSNejiLmC_4
Message-ID: <CAKmqyKPX9Qg-UZMSJE=O1mNuHCnOF7PW=jvJW80XULPzPUEitg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::229
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 05/10] hw/sd/sdhci.c: Update
	to use SDBus APIs
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
X-TUID: jzqxaviUZXJ7

On Tue, Feb 16, 2016 at 10:09 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> Update the SDHCI code to use the new SDBus APIs.
>
> This commit introduces the new command line options required
> to connect a disk to sdhci-pci:
>
>  -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/sd/sdhci.c         | 97 ++++++++++++++++++++++++++++++++++++---------------
>  include/hw/sd/sdhci.h |  3 +-
>  2 files changed, 69 insertions(+), 31 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 3d1eb85..396dd10 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -55,6 +55,9 @@
>          } \
>      } while (0)
>
> +#define TYPE_SDHCI_BUS "sdhci-bus"
> +#define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
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
> @@ -194,8 +199,11 @@ static void sdhci_reset(SDHCIState *s)
>      memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
>
>      if (!s->noeject_quirk) {
> -        sd_set_cb(s->card, s->ro_cb, s->eject_cb);
> +        /* Reset other state based on current card insertion/readonly status */
> +        sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
> +        sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
>      }
> +
>      s->data_count = 0;
>      s->stopped_state = sdhc_not_stopped;
>  }
> @@ -213,7 +221,7 @@ static void sdhci_send_command(SDHCIState *s)
>      request.cmd = s->cmdreg >> 8;
>      request.arg = s->argument;
>      DPRINT_L1("sending CMD%u ARG[0x%08x]\n", request.cmd, request.arg);
> -    rlen = sd_do_command(s->card, &request, response);
> +    rlen = sdbus_do_command(&s->sdbus, &request, response);
>
>      if (s->cmdreg & SDHC_CMD_RESPONSE) {
>          if (rlen == 4) {
> @@ -269,7 +277,7 @@ static void sdhci_end_transfer(SDHCIState *s)
>          request.cmd = 0x0C;
>          request.arg = 0;
>          DPRINT_L1("Automatically issue CMD%d %08x\n", request.cmd, request.arg);
> -        sd_do_command(s->card, &request, response);
> +        sdbus_do_command(&s->sdbus, &request, response);
>          /* Auto CMD12 response goes to the upper Response register */
>          s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
>                  (response[2] << 8) | response[3];
> @@ -301,7 +309,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
>      }
>
>      for (index = 0; index < (s->blksize & 0x0fff); index++) {
> -        s->fifo_buffer[index] = sd_read_data(s->card);
> +        s->fifo_buffer[index] = sdbus_read_data(&s->sdbus);
>      }
>
>      /* New data now available for READ through Buffer Port Register */
> @@ -394,7 +402,7 @@ static void sdhci_write_block_to_card(SDHCIState *s)
>      }
>
>      for (index = 0; index < (s->blksize & 0x0fff); index++) {
> -        sd_write_data(s->card, s->fifo_buffer[index]);
> +        sdbus_write_data(&s->sdbus, s->fifo_buffer[index]);
>      }
>
>      /* Next data can be written through BUFFER DATORT register */
> @@ -476,7 +484,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>          while (s->blkcnt) {
>              if (s->data_count == 0) {
>                  for (n = 0; n < block_size; n++) {
> -                    s->fifo_buffer[n] = sd_read_data(s->card);
> +                    s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>                  }
>              }
>              begin = s->data_count;
> @@ -517,7 +525,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>              s->sdmasysad += s->data_count - begin;
>              if (s->data_count == block_size) {
>                  for (n = 0; n < block_size; n++) {
> -                    sd_write_data(s->card, s->fifo_buffer[n]);
> +                    sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>                  }
>                  s->data_count = 0;
>                  if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -549,7 +557,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
>
>      if (s->trnmod & SDHC_TRNS_READ) {
>          for (n = 0; n < datacnt; n++) {
> -            s->fifo_buffer[n] = sd_read_data(s->card);
> +            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>          }
>          dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_buffer,
>                           datacnt);
> @@ -557,7 +565,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
>          dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buffer,
>                          datacnt);
>          for (n = 0; n < datacnt; n++) {
> -            sd_write_data(s->card, s->fifo_buffer[n]);
> +            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>          }
>      }
>
> @@ -661,7 +669,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                  while (length) {
>                      if (s->data_count == 0) {
>                          for (n = 0; n < block_size; n++) {
> -                            s->fifo_buffer[n] = sd_read_data(s->card);
> +                            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
>                          }
>                      }
>                      begin = s->data_count;
> @@ -702,7 +710,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      dscr.addr += s->data_count - begin;
>                      if (s->data_count == block_size) {
>                          for (n = 0; n < block_size; n++) {
> -                            sd_write_data(s->card, s->fifo_buffer[n]);
> +                            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
>                          }
>                          s->data_count = 0;
>                          if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -816,7 +824,7 @@ static void sdhci_data_transfer(void *opaque)
>              break;
>          }
>      } else {
> -        if ((s->trnmod & SDHC_TRNS_READ) && sd_data_ready(s->card)) {
> +        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus)) {
>              s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
>                      SDHC_DAT_LINE_ACTIVE;
>              sdhci_read_block_from_card(s);
> @@ -1153,15 +1161,10 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
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
> @@ -1231,7 +1234,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
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
> @@ -1296,6 +1296,29 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>  {
>      SDHCIState *s = SYSBUS_SDHCI(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    DriveInfo *di;
> +    BlockBackend *blk;
> +    DeviceState *carddev;
> +    Error *err = NULL;
> +
> +    /* Create and plug in the sd card.
> +     * FIXME: this should be done by the users of this device so we
> +     * do not use drive_get_next() here.
> +     */
> +    di = drive_get_next(IF_SD);
> +    blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +
> +    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
> +    qdev_prop_set_drive(carddev, "drive", blk, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
> @@ -1325,10 +1348,26 @@ static const TypeInfo sdhci_sysbus_info = {
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
> index ffd1f80..607a83e 100644
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
>
