Received: by 2002:a5d:4c92:0:0:0:0:0 with SMTP id z18csp363662wrs;
        Sun, 10 Mar 2019 14:13:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfZeTVMvwraU8HeGW8FaiARRMTaVhDZLpaUiyvlHLTLItRc+JbSQ1nM5pF7E9/Pl3bA1vU
X-Received: by 2002:a25:9241:: with SMTP id e1mr7873253ybo.135.1552252382671;
        Sun, 10 Mar 2019 14:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552252382; cv=none;
        d=google.com; s=arc-20160816;
        b=NSW0/kDBCiP6tOs71XYUWSBCD0s3Y7k/2DiZ1pWjgKsqaG3D0CX9MR0dBGugbZcQQx
         ra2OJZLavMj0vgqw7aBGBqB+pc+oIHS4eum90Mh6OEDN98Wtsoa5vg8fBMpQaTWS+neB
         uRLsHVd+KuPsMKOW9hf1s9pO3X7gMjOYrOI9lYGFVHxicU/Ai7h2/8pxf4nuomo7mNY9
         Oz08yjWDsPSmoyJ+WiHeFAQ2XMQjSXDvWVSNZsVB5r013Kti6o4t+m/CGNFnB6DUXvgs
         /YW5CYIyv5HqNMFhh+TU5+VxneDHIVi9qJvYxZBLiZaMPTw/8yJWjIt6rMxPg6vmv7jl
         3Rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=rjPyKuaI6swe0OVzLVKIhAn+cJMpHdqkmWfmOp91A5M=;
        b=UEspuIaYLH2+dqPi9zWhAsO0KI8cVIOMsTBV15Xl9WzVbJ5Y0+v1JrE16V4RaIgIvE
         6+RyzOD5wQrvhqZ5oYcomUQjVXEHoYS26c+a8xYITq6eLhFMpQFgHEtu6Q6lklKPGCI1
         ftPQlHBGZRbS7AHCj+ltlpdyqYehw1HRbi5uHz9++vcW/qMq07zqQZ2kku1OR8EiDj2v
         QYXE7CW8ELw8qxrrmmlcGxWE4oOHMYIQMqGP+na5X7Oyg6zPgF82TwNQGKLYQI9Kksaw
         n0QdoIHhbnVehaIlWQPkuRFykBRj9saeb8gEQs2wVOr2H+uvtqDBZARa8HiYfbZ7vCL2
         uTGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y62si2151609ywc.117.2019.03.10.14.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 14:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h35kk-0003Oa-2z
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 17:13:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h35kZ-0003OQ-GI
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h35kX-0002zb-Md
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:12:51 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h35kX-0002z5-FE
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:12:49 -0400
Received: by mail-wm1-f65.google.com with SMTP id y15so2419325wma.0
	for <qemu-arm@nongnu.org>; Sun, 10 Mar 2019 14:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rjPyKuaI6swe0OVzLVKIhAn+cJMpHdqkmWfmOp91A5M=;
	b=pUhPdaWuRr1UxygSDA1r24l/AmojuqvlF5hBGfoByE+u874Lf+zm1GOu5gswq3bM69
	kblOxFL3fRintvyFWaCLV9/D0ldpGQVwLhTconeWpqwDAdnnrqgohoC+0uZVzpVT3n2y
	Z/nZJ22MN/Eo2wy02pnuyfojK98blBEg6M8U/gRSQR6Ex9UaFeNaxtCZE+rDdxsmauv+
	tI4fxtRaDY4R5NlJ4l/faa0zOL4uVtiguHfFPdo/ySFCmP8G5saJX1TL7zlpfAslWR39
	gYD7We9LFQs1B5T4dFrjuZbl1KM5AopEZNNoTRe2oavtHCqhOupzztsN06oPKiRSyGca
	esbg==
X-Gm-Message-State: APjAAAU5xwnfJDFxyAbWp/damGJ4IR9JZixThMDOvozx55reuE35ZzOv
	HDisx/b3isAMvp1TLLRJ9mnvUg==
X-Received: by 2002:a1c:a688:: with SMTP id p130mr16218248wme.53.1552252368190;
	Sun, 10 Mar 2019 14:12:48 -0700 (PDT)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	t202sm26087434wmt.0.2019.03.10.14.12.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 14:12:47 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	pbonzini@redhat.com, qemu-devel@nongnu.org
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
	<1551968334-18982-4-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <16df6c28-aa13-90cf-09b7-c002eb0c4d59@redhat.com>
Date: Sun, 10 Mar 2019 22:12:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551968334-18982-4-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v4 03/29] hw/sd/sdhci: Move PCI-related code
 into a separate file
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b41Fy3x9kjhB

On 3/7/19 3:18 PM, Thomas Huth wrote:
> Some machines have an SDHCI device, but no PCI. To be able to
> compile hw/sd/sdhci.c without CONFIG_PCI, we must not call functions
> like pci_get_address_space() and pci_allocate_irq() there. Thus
> move the PCI-related code into a separate file.
> 
> This is required for the new Kconfig-like build system, e.g. it is
> needed if a user wants to compile a QEMU binary with just one machine
> that has SDHCI, but no PCI, like the ARM "raspi" machines for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/sd/Kconfig          |  6 +++-
>  hw/sd/Makefile.objs    |  1 +
>  hw/sd/sdhci-internal.h | 34 ++++++++++++++++++
>  hw/sd/sdhci-pci.c      | 87 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/sd/sdhci.c          | 98 +++-----------------------------------------------
>  5 files changed, 132 insertions(+), 94 deletions(-)
>  create mode 100644 hw/sd/sdhci-pci.c
> 
> diff --git a/hw/sd/Kconfig b/hw/sd/Kconfig
> index 864f535..c5e1e55 100644
> --- a/hw/sd/Kconfig
> +++ b/hw/sd/Kconfig
> @@ -12,6 +12,10 @@ config SD
>  
>  config SDHCI
>      bool
> +    select SD

Hmm this should be SDBUS. I'll clean that up later.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +
> +config SDHCI_PCI
> +    bool
>      default y if PCI_DEVICES
>      depends on PCI
> -    select SD
> +    select SDHCI
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index a99d9fb..0665727 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL181) += pl181.o
>  common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
>  common-obj-$(CONFIG_SD) += sd.o core.o sdmmc-internal.o
>  common-obj-$(CONFIG_SDHCI) += sdhci.o
> +common-obj-$(CONFIG_SDHCI_PCI) += sdhci-pci.o
>  
>  obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
>  obj-$(CONFIG_OMAP) += omap_mmc.o
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 19665fd..3414140 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -304,4 +304,38 @@ extern const VMStateDescription sdhci_vmstate;
>  
>  #define ESDHC_PRNSTS_SDSTB              (1 << 3)
>  
> +/*
> + * Default SD/MMC host controller features information, which will be
> + * presented in CAPABILITIES register of generic SD host controller at reset.
> + *
> + * support:
> + * - 3.3v and 1.8v voltages
> + * - SDMA/ADMA1/ADMA2
> + * - high-speed
> + * max host controller R/W buffers size: 512B
> + * max clock frequency for SDclock: 52 MHz
> + * timeout clock frequency: 52 MHz
> + *
> + * does not support:
> + * - 3.0v voltage
> + * - 64-bit system bus
> + * - suspend/resume
> + */
> +#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
> +
> +#define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
> +    DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
> +    DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
> +    \
> +    /* Capabilities registers provide information on supported
> +     * features of this specific host controller implementation */ \
> +    DEFINE_PROP_UINT64("capareg", _state, capareg, SDHC_CAPAB_REG_DEFAULT), \
> +    DEFINE_PROP_UINT64("maxcurr", _state, maxcurr, 0)
> +
> +void sdhci_initfn(SDHCIState *s);
> +void sdhci_uninitfn(SDHCIState *s);
> +void sdhci_common_realize(SDHCIState *s, Error **errp);
> +void sdhci_common_unrealize(SDHCIState *s, Error **errp);
> +void sdhci_common_class_init(ObjectClass *klass, void *data);
> +
>  #endif
> diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
> new file mode 100644
> index 0000000..f884661
> --- /dev/null
> +++ b/hw/sd/sdhci-pci.c
> @@ -0,0 +1,87 @@
> +/*
> + * SDHCI device on PCI
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + * See the GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/hw.h"
> +#include "hw/sd/sdhci.h"
> +#include "sdhci-internal.h"
> +
> +static Property sdhci_pci_properties[] = {
> +    DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
> +{
> +    SDHCIState *s = PCI_SDHCI(dev);
> +    Error *local_err = NULL;
> +
> +    sdhci_initfn(s);
> +    sdhci_common_realize(s, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
> +    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
> +    s->irq = pci_allocate_irq(dev);
> +    s->dma_as = pci_get_address_space(dev);
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
> +}
> +
> +static void sdhci_pci_exit(PCIDevice *dev)
> +{
> +    SDHCIState *s = PCI_SDHCI(dev);
> +
> +    sdhci_common_unrealize(s, &error_abort);
> +    sdhci_uninitfn(s);
> +}
> +
> +static void sdhci_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    k->realize = sdhci_pci_realize;
> +    k->exit = sdhci_pci_exit;
> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
> +    k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
> +    k->class_id = PCI_CLASS_SYSTEM_SDHCI;
> +    dc->props = sdhci_pci_properties;
> +
> +    sdhci_common_class_init(klass, data);
> +}
> +
> +static const TypeInfo sdhci_pci_info = {
> +    .name = TYPE_PCI_SDHCI,
> +    .parent = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(SDHCIState),
> +    .class_init = sdhci_pci_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void sdhci_pci_register_type(void)
> +{
> +    type_register_static(&sdhci_pci_info);
> +}
> +
> +type_init(sdhci_pci_register_type)
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 83f1574..17ad546 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -40,24 +40,6 @@
>  
>  #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
>  
> -/* Default SD/MMC host controller features information, which will be
> - * presented in CAPABILITIES register of generic SD host controller at reset.
> - *
> - * support:
> - * - 3.3v and 1.8v voltages
> - * - SDMA/ADMA1/ADMA2
> - * - high-speed
> - * max host controller R/W buffers size: 512B
> - * max clock frequency for SDclock: 52 MHz
> - * timeout clock frequency: 52 MHz
> - *
> - * does not support:
> - * - 3.0v voltage
> - * - 64-bit system bus
> - * - suspend/resume
> - */
> -#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
> -
>  static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
>  {
>      return 1 << (9 + FIELD_EX32(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH));
> @@ -1328,16 +1310,7 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
>  
>  /* --- qdev common --- */
>  
> -#define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
> -    DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
> -    DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
> -    \
> -    /* Capabilities registers provide information on supported
> -     * features of this specific host controller implementation */ \
> -    DEFINE_PROP_UINT64("capareg", _state, capareg, SDHC_CAPAB_REG_DEFAULT), \
> -    DEFINE_PROP_UINT64("maxcurr", _state, maxcurr, 0)
> -
> -static void sdhci_initfn(SDHCIState *s)
> +void sdhci_initfn(SDHCIState *s)
>  {
>      qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
>                          TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
> @@ -1348,7 +1321,7 @@ static void sdhci_initfn(SDHCIState *s)
>      s->io_ops = &sdhci_mmio_ops;
>  }
>  
> -static void sdhci_uninitfn(SDHCIState *s)
> +void sdhci_uninitfn(SDHCIState *s)
>  {
>      timer_del(s->insert_timer);
>      timer_free(s->insert_timer);
> @@ -1359,7 +1332,7 @@ static void sdhci_uninitfn(SDHCIState *s)
>      s->fifo_buffer = NULL;
>  }
>  
> -static void sdhci_common_realize(SDHCIState *s, Error **errp)
> +void sdhci_common_realize(SDHCIState *s, Error **errp)
>  {
>      Error *local_err = NULL;
>  
> @@ -1375,7 +1348,7 @@ static void sdhci_common_realize(SDHCIState *s, Error **errp)
>                            SDHC_REGISTERS_MAP_SIZE);
>  }
>  
> -static void sdhci_common_unrealize(SDHCIState *s, Error **errp)
> +void sdhci_common_unrealize(SDHCIState *s, Error **errp)
>  {
>      /* This function is expected to be called only once for each class:
>       * - SysBus:    via DeviceClass->unrealize(),
> @@ -1445,7 +1418,7 @@ const VMStateDescription sdhci_vmstate = {
>      },
>  };
>  
> -static void sdhci_common_class_init(ObjectClass *klass, void *data)
> +void sdhci_common_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> @@ -1454,66 +1427,6 @@ static void sdhci_common_class_init(ObjectClass *klass, void *data)
>      dc->reset = sdhci_poweron_reset;
>  }
>  
> -/* --- qdev PCI --- */
> -
> -static Property sdhci_pci_properties[] = {
> -    DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
> -{
> -    SDHCIState *s = PCI_SDHCI(dev);
> -    Error *local_err = NULL;
> -
> -    sdhci_initfn(s);
> -    sdhci_common_realize(s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
> -    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
> -    s->irq = pci_allocate_irq(dev);
> -    s->dma_as = pci_get_address_space(dev);
> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
> -}
> -
> -static void sdhci_pci_exit(PCIDevice *dev)
> -{
> -    SDHCIState *s = PCI_SDHCI(dev);
> -
> -    sdhci_common_unrealize(s, &error_abort);
> -    sdhci_uninitfn(s);
> -}
> -
> -static void sdhci_pci_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -
> -    k->realize = sdhci_pci_realize;
> -    k->exit = sdhci_pci_exit;
> -    k->vendor_id = PCI_VENDOR_ID_REDHAT;
> -    k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
> -    k->class_id = PCI_CLASS_SYSTEM_SDHCI;
> -    dc->props = sdhci_pci_properties;
> -
> -    sdhci_common_class_init(klass, data);
> -}
> -
> -static const TypeInfo sdhci_pci_info = {
> -    .name = TYPE_PCI_SDHCI,
> -    .parent = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(SDHCIState),
> -    .class_init = sdhci_pci_class_init,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -        { },
> -    },
> -};
> -
>  /* --- qdev SysBus --- */
>  
>  static Property sdhci_sysbus_properties[] = {
> @@ -1846,7 +1759,6 @@ static const TypeInfo imx_usdhc_info = {
>  
>  static void sdhci_register_types(void)
>  {
> -    type_register_static(&sdhci_pci_info);
>      type_register_static(&sdhci_sysbus_info);
>      type_register_static(&sdhci_bus_info);
>      type_register_static(&imx_usdhc_info);
> 
