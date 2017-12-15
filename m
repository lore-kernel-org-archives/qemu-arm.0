Received: by 10.223.159.74 with SMTP id f10csp6986148wrg;
        Thu, 14 Dec 2017 17:02:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBos0m8XOoK0tFCDWxKwnadtSJeT10kopg9QaHI8vbcZtV3AYXbFdtsZtFZq3Q9KsPQG1zbsk
X-Received: by 10.37.51.130 with SMTP id z124mr1355050ybz.6.1513299768843;
        Thu, 14 Dec 2017 17:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513299768; cv=none;
        d=google.com; s=arc-20160816;
        b=zoydHZu072dF9A/DNYj6ozgyZXmjCUdVZhz1bqMqlOepabbWB8cQFmiyWoCsM7uF44
         F8ZoYHIhXljsfdjyg8e7hSNexOYsn4nusPGG8MEiOX4JVdzA5kKQ9fNT1baiZ1qU5V5A
         xYzaUznwC2NphuLqKrnp/LWdaRvMiFS/D/tYkkW4JgFLgXeeL78TBx5FJ4gzRZFgr7Tw
         i2EgXmjcVKjxn+s+JRZDwdbPXtIrr/RNeNOGu9JZPC41Hg8ktwv+oJpVSN+QNckSpGzQ
         wrRldPY31dKSZ0kj1RpnEcGiwm1dCPTk2Rm627dBCzlZ7WCndDnwzcbvBr9OJ1BDmdYi
         1cJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OeTatRfwYm/P7cRDpCkTDymJf1gRqVxicQwf6D+s6Oc=;
        b=vrwuYtMOmMxQFwLBeMTGE7kmUeDAm6x/wWK08EqvKgH3X3STf9fLZI10woMPCbKHl4
         OGeZyDCuD0EQFB/3c8IICHFsX8maXKEGrd7SPG5h7sVrcIgW+5ocr2eO+BSXR9Rcjp/a
         NfzdB6Ggxy1LwWTVynJE5ZuGhs1ybJGPGzIqX2A+7GIHqI0MQjI4hsA7DfTVWM022j2A
         7FuF08XN08q6FpXIY8iHR/ZnIEx0jAEpUdCiWuViDOzSm11M2T2TLQsJirJLUh0LBRY6
         MYXL83ByZFCdH+aqYlpSI1HZ2ya9gS5+WcaOjxfSTsssbEvJWlkbdGHedjVL+B7B4aFl
         F7uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KFzL5oAr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si1049510ybd.791.2017.12.14.17.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 17:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KFzL5oAr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePeOm-0005uB-A6
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 20:02:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePeOd-0005tw-05
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 20:02:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePeOb-0002CF-Dw
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 20:02:39 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:41381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePeOb-0002BU-3z; Thu, 14 Dec 2017 20:02:37 -0500
Received: by mail-wm0-x242.google.com with SMTP id g75so14680037wme.0;
	Thu, 14 Dec 2017 17:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=OeTatRfwYm/P7cRDpCkTDymJf1gRqVxicQwf6D+s6Oc=;
	b=KFzL5oArGl2pTxB+feHOMmYtQscW4GH6ifxAoltE3k716P6iaMy/V0RNvPLozKuXRJ
	VYTqm+d9RU6CvcjgMlTw1yuKmWHKfqLzBibmrSq+kmIgmhGPXYKsZB5xug3/xFxOdh+T
	cVICAE1eFC+WMoXlEhYxOf94szPwpVoqcMgnyLUjYYy/On0l60+eEvSRgS9s4hu4I7AE
	EMG4f0RUaUzJvH7JS7qofr3v3InI5Dlckts+CtUVPBVj7ykkKcMP/yIb5Eas6a6u5oxZ
	tSeazny+1X6EM/nQD21e4RNag+CWYK19gnyDQ8ErVq5sDuxk5ozFH6IYHgQlVSH6cdJX
	PdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=OeTatRfwYm/P7cRDpCkTDymJf1gRqVxicQwf6D+s6Oc=;
	b=TVxTcb3ZKzM+i3fnzwgkbzwSNjiCJ1y97EapgOcYuGELOsYupjX4OmYpr6mj61ZXGQ
	9CDOAnnBFogvKF6tZALW7EmCTSEzuIlsSH17KOTnJnHS7Asb3fPdqxL6UHDcXVyCqQ03
	3kAXryrrDkQiE9DsxJwABbaLlJEpukTkU0jRp0zZvpTmdsmhipja/0O5QdUGbuyozRGD
	8gu/sN1YCfihc6HiIsfVd4QP4AJ2KFdIpNaOZiI4o8wpggN/sfqt8nmKkWwIEtg8uSoy
	Xez//tfmUC0RgdG4EzMA1nAKwLS05KF4ild0IY1B3YF4mC95uwH2h7g2BTBNIycfzF1I
	UTaA==
X-Gm-Message-State: AKGB3mIlb36+m8kkyncbXNPmP9TFakBQf1oLq/pWcRG8gUwrBulOIaYK
	aVTChLH5kI0bvUJE3GMH4X1IEnqiZcZCtyKacTV/f9k7
X-Received: by 10.28.227.136 with SMTP id a130mr3856737wmh.104.1513299755906; 
	Thu, 14 Dec 2017 17:02:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 17:02:05 -0800 (PST)
In-Reply-To: <20171213204436.5379-5-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
	<20171213204436.5379-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 17:02:05 -0800
X-Google-Sender-Auth: ikyZEKuC4cHiWbytL1sIHerUFdU
Message-ID: <CAKmqyKMSVEtRjqmutKz1Bwb3W9xOcYnMbM0RADWeYzBzB3vj+g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/11] sdbus: add
 sdbus_create_bus() to replace qbus_create_inplace()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FXz/VScugEBZ

On Wed, Dec 13, 2017 at 12:44 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> A "bus-name" property can be use to change the default SDHCI "sd-bus" nam=
e.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/sd/sd.h           |  1 +
>  include/hw/sd/sdhci.h        |  3 ++-
>  hw/arm/bcm2835_peripherals.c |  2 +-
>  hw/sd/core.c                 |  5 +++++
>  hw/sd/sdhci.c                | 36 ++++++++++++++++++++----------------
>  5 files changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index f6994e61f2..dc9d697c12 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -51,6 +51,7 @@ struct SDBus {
>  };
>
>  /* Functions to be used by qdevified callers */
> +SDBus *sdbus_create_bus(DeviceState *parent, const char *name);
>  int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
>  void sdbus_write_data(SDBus *sd, uint8_t value);
>  uint8_t sdbus_read_data(SDBus *sd);
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index e6644e6e7d..579e0ea644 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -39,7 +39,8 @@ typedef struct SDHCIState {
>      };
>
>      /*< public >*/
> -    SDBus sdbus;
> +    char *bus_name;
> +    SDBus *sdbus;
>      MemoryRegion iomem;
>      MemoryRegion *dma_mr;
>      AddressSpace dma_as;
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 7f30f19c4c..60a0eec4d1 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -310,7 +310,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>
>      /* GPIO */
>      object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
> -                                   OBJECT(&s->sdhci.sdbus), &error_abort=
);
> +                                   OBJECT(s->sdhci.sdbus), &error_abort)=
;
>      object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
>                                     OBJECT(&s->sdhost.sdbus), &error_abor=
t);
>      object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index eda595973b..021a8d7258 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -187,3 +187,8 @@ static void sd_bus_register_types(void)
>  }
>
>  type_init(sd_bus_register_types)
> +
> +SDBus *sdbus_create_bus(DeviceState *parent, const char *name)
> +{
> +    return SD_BUS(qbus_create(TYPE_SD_BUS, parent, name));
> +}
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 5f8064c59b..40596f6ebe 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -186,8 +186,8 @@ static void sdhci_reset(SDHCIState *s)
>      memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdm=
asysad);
>
>      /* Reset other state based on current card insertion/readonly status=
 */
> -    sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
> -    sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
> +    sdhci_set_inserted(dev, sdbus_get_inserted(s->sdbus));
> +    sdhci_set_readonly(dev, sdbus_get_readonly(s->sdbus));
>
>      s->data_count =3D 0;
>      s->stopped_state =3D sdhc_not_stopped;
> @@ -223,7 +223,7 @@ static void sdhci_send_command(SDHCIState *s)
>      request.arg =3D s->argument;
>
>      trace_sdhci_send_command(request.cmd, request.arg);
> -    rlen =3D sdbus_do_command(&s->sdbus, &request, response);
> +    rlen =3D sdbus_do_command(s->sdbus, &request, response);
>
>      if (s->cmdreg & SDHC_CMD_RESPONSE) {
>          if (rlen =3D=3D 4) {
> @@ -278,7 +278,7 @@ static void sdhci_end_transfer(SDHCIState *s)
>          request.cmd =3D 0x0C;
>          request.arg =3D 0;
>          trace_sdhci_end_transfer(request.cmd, request.arg);
> -        sdbus_do_command(&s->sdbus, &request, response);
> +        sdbus_do_command(s->sdbus, &request, response);
>          /* Auto CMD12 response goes to the upper Response register */
>          s->rspreg[3] =3D (response[0] << 24) | (response[1] << 16) |
>                  (response[2] << 8) | response[3];
> @@ -310,7 +310,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
>      }
>
>      for (index =3D 0; index < (s->blksize & 0x0fff); index++) {
> -        s->fifo_buffer[index] =3D sdbus_read_data(&s->sdbus);
> +        s->fifo_buffer[index] =3D sdbus_read_data(s->sdbus);
>      }
>
>      /* New data now available for READ through Buffer Port Register */
> @@ -402,7 +402,7 @@ static void sdhci_write_block_to_card(SDHCIState *s)
>      }
>
>      for (index =3D 0; index < (s->blksize & 0x0fff); index++) {
> -        sdbus_write_data(&s->sdbus, s->fifo_buffer[index]);
> +        sdbus_write_data(s->sdbus, s->fifo_buffer[index]);
>      }
>
>      /* Next data can be written through BUFFER DATORT register */
> @@ -488,7 +488,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCISta=
te *s)
>          while (s->blkcnt) {
>              if (s->data_count =3D=3D 0) {
>                  for (n =3D 0; n < block_size; n++) {
> -                    s->fifo_buffer[n] =3D sdbus_read_data(&s->sdbus);
> +                    s->fifo_buffer[n] =3D sdbus_read_data(s->sdbus);
>                  }
>              }
>              begin =3D s->data_count;
> @@ -529,7 +529,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCISta=
te *s)
>              s->sdmasysad +=3D s->data_count - begin;
>              if (s->data_count =3D=3D block_size) {
>                  for (n =3D 0; n < block_size; n++) {
> -                    sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
> +                    sdbus_write_data(s->sdbus, s->fifo_buffer[n]);
>                  }
>                  s->data_count =3D 0;
>                  if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -560,7 +560,7 @@ static void sdhci_sdma_transfer_single_block(SDHCISta=
te *s)
>
>      if (s->trnmod & SDHC_TRNS_READ) {
>          for (n =3D 0; n < datacnt; n++) {
> -            s->fifo_buffer[n] =3D sdbus_read_data(&s->sdbus);
> +            s->fifo_buffer[n] =3D sdbus_read_data(s->sdbus);
>          }
>          dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_bu=
ffer,
>                           datacnt);
> @@ -568,7 +568,7 @@ static void sdhci_sdma_transfer_single_block(SDHCISta=
te *s)
>          dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buf=
fer,
>                          datacnt);
>          for (n =3D 0; n < datacnt; n++) {
> -            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
> +            sdbus_write_data(s->sdbus, s->fifo_buffer[n]);
>          }
>      }
>      s->blkcnt--;
> @@ -659,7 +659,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                  while (length) {
>                      if (s->data_count =3D=3D 0) {
>                          for (n =3D 0; n < block_size; n++) {
> -                            s->fifo_buffer[n] =3D sdbus_read_data(&s->sd=
bus);
> +                            s->fifo_buffer[n] =3D sdbus_read_data(s->sdb=
us);
>                          }
>                      }
>                      begin =3D s->data_count;
> @@ -700,7 +700,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      dscr.addr +=3D s->data_count - begin;
>                      if (s->data_count =3D=3D block_size) {
>                          for (n =3D 0; n < block_size; n++) {
> -                            sdbus_write_data(&s->sdbus, s->fifo_buffer[n=
]);
> +                            sdbus_write_data(s->sdbus, s->fifo_buffer[n]=
);
>                          }
>                          s->data_count =3D 0;
>                          if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
> @@ -807,7 +807,7 @@ static void sdhci_data_transfer(void *opaque)
>              break;
>          }
>      } else {
> -        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus))=
 {
> +        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(s->sdbus)) =
{
>              s->prnsts |=3D SDHC_DOING_READ | SDHC_DATA_INHIBIT |
>                      SDHC_DAT_LINE_ACTIVE;
>              sdhci_read_block_from_card(s);
> @@ -1156,15 +1156,14 @@ static inline unsigned int sdhci_get_fifolen(SDHC=
IState *s)
>
>  static void sdhci_initfn(SDHCIState *s)
>  {
> -    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
> -                        TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");

Isn't "sd-bus" here the name? Can't you just move this line to realize
and pass the string in there?

Alistair

> -
>      s->insert_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_ins=
ertion_irq, s);
>      s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_tr=
ansfer, s);
>  }
>
>  static void sdhci_realizefn(SDHCIState *s, Error **errp)
>  {
> +    const char *name =3D s->bus_name ? s->bus_name : "sd-bus";
> +
>      sdhci_init_capareg(s, errp);
>
>      s->buf_maxsz =3D sdhci_get_fifolen(s);
> @@ -1177,10 +1176,14 @@ static void sdhci_realizefn(SDHCIState *s, Error =
**errp)
>      address_space_init(&s->dma_as,
>                         s->dma_mr ? s->dma_mr : get_system_memory(),
>                         "sdhci-dma");
> +
> +    s->sdbus =3D sdbus_create_bus(DEVICE(s), name);
>  }
>
>  static void sdhci_unrealizefn(SDHCIState *s, Error **errp)
>  {
> +    g_free(s->sdbus);
> +
>      if (s->dma_mr) {
>          address_space_destroy(&s->dma_as);
>          object_unparent(OBJECT(&s->dma_mr));
> @@ -1269,6 +1272,7 @@ static Property sdhci_properties[] =3D {
>                       false),
>      DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_STRING("sd-bus-name", SDHCIState, bus_name),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.15.1
>
>
