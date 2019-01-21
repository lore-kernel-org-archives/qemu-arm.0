Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6457816wrt;
        Mon, 21 Jan 2019 12:33:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN50Rw/ibB/OSAKYmsCJzVFnrvXqjuDpNsUDm5dBC6kSibVUM/TvsVSHlinwHgspKFJKam76
X-Received: by 2002:a1c:c181:: with SMTP id r123mr862472wmf.8.1548102811855;
        Mon, 21 Jan 2019 12:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548102811; cv=none;
        d=google.com; s=arc-20160816;
        b=QsxgYtfgeXKN1mqdmKP0Z9Ssb35pbTFLRCLznz9k2CTzhiE2/y6olrHtcjq3Ynd6nq
         FZ9QzvmbcOAncQWUo/GuSR+F39wsEUgaL6UhQtI9AezsZQbsiQgvvMz8ppNacbVsqSHl
         OXkf1MCcMFEF8MbICpSOzr0bG1E0ySrO7dSNEGeegxokGVzIDkkVFYi4T2mlUEyllAN3
         VW84cDFv1LiIHbjrc11PaKGPL723QHAeXxRbRgzoEqGwYL+XUXTu2jGWFQkVhPUhocu8
         R6cgIW37HQpZVg5pUcCeEyK8XCk2kNzDhZUaAeMmXHrj7zFuyuCQM2U1jSvPxnE6IbLj
         RmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=2lU4x9gs3zK11WNNfGjWhbEQD1+Ex4abUlyXkFlVIsM=;
        b=xwXR8swWXyYKEfAyW2Z83IpWMxXv6eknD2AhaTLpVk3zSX4J8cRy5sUAZ6XRuNIYLY
         iTbyWKvtO7zsPPj2GhL+IJVvQ8BZ8Z06yUGdYKGuGnjuYjvjK6jLrLtlw5VkFBmv91nX
         V0sCMvHpfk1O2Acg3YmzDP2YjhK641uaCX2ZdHEpRSMRq+Vm1Vtb9h9QXcmrIX73WRXq
         hhJ3yn+tLAUqP5Bh7jmZ+cBcOk5a++asY/E0jZuwy122TRhroU46S9ZL1miSbj6rdVa2
         7w66rvOYH6tP0Lq7Ov4hwOEhddiUnCsEjI6g7DOpSGtc37674tYKGCl2HdULSwfX98ve
         YLbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h70si69264301wrh.88.2019.01.21.12.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:33:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glgGA-0002ez-FP
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glgFV-0002d3-LI
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 15:32:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glgFT-0008Jd-NR
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 15:32:49 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1glgFT-0008Ib-90
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 15:32:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id j2so24993423wrw.1
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 12:32:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2lU4x9gs3zK11WNNfGjWhbEQD1+Ex4abUlyXkFlVIsM=;
	b=lymShHLlPhHVzm/lEZPn6IIWmvwIYx7P9bbBtJjDgMJW+qG3OVg5zPg1x2zK2RjGT5
	rDrl1udgxeI8N5bsYNa16ql2/Bj0jZolbRjvcGL7Y+I/vzuUL/qHg6LxoQGhSVZKIg7E
	8Je8dSKwU5dUR81sqe4LV70TZm9R+c3+Uwhdb6Qan/v8x0yNYffQ1rkZKPkyFYrkFXlv
	jnyz4l9sAM54mfjVPghVaJKlYx7q4Yuen2wmT6iNYx5vE4RWtAjBmrvhRrNPjxCKUJSl
	zUmeTM/puhqqYpqln1gbetsLAi7grVuPpQx0fIsH++wy3w+S6WKjH+uXMg1/Fi8QqbSK
	y90Q==
X-Gm-Message-State: AJcUukfAsQqy6DkfkqGppA657LtgMLmEoSOx06u6if+YFqb8iiuCiK6n
	SmtdRZGpWeJ9S86y0bL34p2haA==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr30608227wra.81.1548102766155; 
	Mon, 21 Jan 2019 12:32:46 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	o5sm95657858wmg.25.2019.01.21.12.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 12:32:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6c118ad4-fd2d-2851-f17e-78e00acee1cf@redhat.com>
Date: Mon, 21 Jan 2019 21:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH 04/23] hw/arm/iotkit: Rename IoTKit to
 ARMSSE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IQ5AURZpHjNS

On 1/21/19 7:50 PM, Peter Maydell wrote:
> The Arm IoTKit was effectively the forerunner of a series of
> subsystems for embedded SoCs, named the SSE-050, SSE-100 and SSE-200:
> https://developer.arm.com/products/system-design/subsystems
> These are generally quite similar, though later iterations have
> extra devices that earlier ones do not.
> 
> We want to add a model of the SSE-200, which means refactoring the
> IoTKit code into an abstract base class and subclasses (using the
> same design that the bcm283x SoC and Aspeed SoC family
> implementations do). As a first step, rename the IoTKit struct and
> QOM macros to ARMSSE, which is what we're going to name the base
> class. We temporarily retain TYPE_IOTKIT to avoid changing the
> code that instantiates a TYPE_IOTKIT device here and then changing
> it back again when it is re-introduced as a subclass.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/hw/arm/iotkit.h | 22 ++++++++++-----
>  hw/arm/iotkit.c         | 59 +++++++++++++++++++++--------------------
>  hw/arm/mps2-tz.c        |  2 +-
>  3 files changed, 47 insertions(+), 36 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 3a8ee639085..9701738ec75 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -1,5 +1,5 @@
>  /*
> - * ARM IoT Kit
> + * ARM SSE (Subsystems for Embedded): IoTKit
>   *
>   * Copyright (c) 2018 Linaro Limited
>   * Written by Peter Maydell
> @@ -9,7 +9,10 @@
>   * (at your option) any later version.
>   */
>  
> -/* This is a model of the Arm IoT Kit which is documented in
> +/*
> + * This is a model of the Arm "Subsystems for Embedded" family of
> + * hardware, which include the IoT Kit and the SSE-050, SSE-100 and
> + * SSE-200. Currently we model only the Arm IoT Kit which is documented in
>   * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
>   * It contains:
>   *  a Cortex-M33
> @@ -71,8 +74,15 @@
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
>  
> -#define TYPE_IOTKIT "iotkit"
> -#define IOTKIT(obj) OBJECT_CHECK(IoTKit, (obj), TYPE_IOTKIT)
> +#define TYPE_ARMSSE "iotkit"
> +#define ARMSSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARMSSE)
> +
> +/*
> + * For the moment TYPE_IOTKIT is a synonym for TYPE_ARMSSE (and the
> + * latter's underlying name is left as "iotkit"); in a later
> + * commit it will become a subclass of TYPE_ARMSSE.
> + */
> +#define TYPE_IOTKIT TYPE_ARMSSE
>  
>  /* We have an IRQ splitter and an OR gate input for each external PPC
>   * and the 2 internal PPCs
> @@ -80,7 +90,7 @@
>  #define NUM_EXTERNAL_PPCS (IOTS_NUM_AHB_EXP_PPC + IOTS_NUM_APB_EXP_PPC)
>  #define NUM_PPCS (NUM_EXTERNAL_PPCS + 2)
>  
> -typedef struct IoTKit {
> +typedef struct ARMSSE {
>      /*< private >*/
>      SysBusDevice parent_obj;
>  
> @@ -131,6 +141,6 @@ typedef struct IoTKit {
>      MemoryRegion *board_memory;
>      uint32_t exp_numirq;
>      uint32_t mainclk_frq;
> -} IoTKit;
> +} ARMSSE;
>  
>  #endif
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 8742200fb42..9360053184e 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -1,5 +1,5 @@
>  /*
> - * Arm IoT Kit
> + * Arm SSE (Subsystems for Embedded): IoTKit
>   *
>   * Copyright (c) 2018 Linaro Limited
>   * Written by Peter Maydell
> @@ -24,7 +24,7 @@
>  /* Create an alias region of @size bytes starting at @base
>   * which mirrors the memory starting at @orig.
>   */
> -static void make_alias(IoTKit *s, MemoryRegion *mr, const char *name,
> +static void make_alias(ARMSSE *s, MemoryRegion *mr, const char *name,
>                         hwaddr base, hwaddr size, hwaddr orig)
>  {
>      memory_region_init_alias(mr, NULL, name, &s->container, orig, size);
> @@ -41,18 +41,18 @@ static void irq_status_forwarder(void *opaque, int n, int level)
>  
>  static void nsccfg_handler(void *opaque, int n, int level)
>  {
> -    IoTKit *s = IOTKIT(opaque);
> +    ARMSSE *s = ARMSSE(opaque);
>  
>      s->nsccfg = level;
>  }
>  
> -static void iotkit_forward_ppc(IoTKit *s, const char *ppcname, int ppcnum)
> +static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
>  {
>      /* Each of the 4 AHB and 4 APB PPCs that might be present in a
> -     * system using the IoTKit has a collection of control lines which
> +     * system using the ARMSSE has a collection of control lines which
>       * are provided by the security controller and which we want to
> -     * expose as control lines on the IoTKit device itself, so the
> -     * code using the IoTKit can wire them up to the PPCs.
> +     * expose as control lines on the ARMSSE device itself, so the
> +     * code using the ARMSSE can wire them up to the PPCs.
>       */
>      SplitIRQ *splitter = &s->ppc_irq_splitter[ppcnum];
>      DeviceState *iotkitdev = DEVICE(s);
> @@ -91,7 +91,7 @@ static void iotkit_forward_ppc(IoTKit *s, const char *ppcname, int ppcnum)
>      g_free(name);
>  }
>  
> -static void iotkit_forward_sec_resp_cfg(IoTKit *s)
> +static void iotkit_forward_sec_resp_cfg(ARMSSE *s)
>  {
>      /* Forward the 3rd output from the splitter device as a
>       * named GPIO output of the iotkit object.
> @@ -107,7 +107,7 @@ static void iotkit_forward_sec_resp_cfg(IoTKit *s)
>  
>  static void iotkit_init(Object *obj)
>  {
> -    IoTKit *s = IOTKIT(obj);
> +    ARMSSE *s = ARMSSE(obj);
>      int i;
>  
>      memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
> @@ -175,20 +175,20 @@ static void iotkit_init(Object *obj)
>  
>  static void iotkit_exp_irq(void *opaque, int n, int level)
>  {
> -    IoTKit *s = IOTKIT(opaque);
> +    ARMSSE *s = ARMSSE(opaque);
>  
>      qemu_set_irq(s->exp_irqs[n], level);
>  }
>  
>  static void iotkit_mpcexp_status(void *opaque, int n, int level)
>  {
> -    IoTKit *s = IOTKIT(opaque);
> +    ARMSSE *s = ARMSSE(opaque);
>      qemu_set_irq(s->mpcexp_status_in[n], level);
>  }
>  
>  static void iotkit_realize(DeviceState *dev, Error **errp)
>  {
> -    IoTKit *s = IOTKIT(dev);
> +    ARMSSE *s = ARMSSE(dev);
>      int i;
>      MemoryRegion *mr;
>      Error *err = NULL;
> @@ -215,9 +215,9 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>       * devices exist in both address spaces but with hard-wired security
>       * permissions that will cause the CPU to fault for non-secure accesses.
>       *
> -     * The IoTKit has an IDAU (Implementation Defined Access Unit),
> +     * The ARMSSE has an IDAU (Implementation Defined Access Unit),
>       * which specifies hard-wired security permissions for different
> -     * areas of the physical address space. For the IoTKit IDAU, the
> +     * areas of the physical address space. For the ARMSSE IDAU, the
>       * top 4 bits of the physical address are the IDAU region ID, and
>       * if bit 28 (ie the lowest bit of the ID) is 0 then this is an NS
>       * region, otherwise it is an S region.
> @@ -239,7 +239,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>       * 0x20000000..0x2007ffff  32KB FPGA block RAM
>       * 0x30000000..0x3fffffff  alias of 0x20000000..0x2fffffff
>       * 0x40000000..0x4000ffff  base peripheral region 1
> -     * 0x40010000..0x4001ffff  CPU peripherals (none for IoTKit)
> +     * 0x40010000..0x4001ffff  CPU peripherals (none for ARMSSE)
>       * 0x40020000..0x4002ffff  system control element peripherals
>       * 0x40080000..0x400fffff  base peripheral region 2
>       * 0x50000000..0x5fffffff  alias of 0x40000000..0x4fffffff
> @@ -306,8 +306,8 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      qdev_connect_gpio_out_named(dev_secctl, "nsc_cfg", 0, s->nsc_cfg_in);
>  
>      /* The sec_resp_cfg output from the security controller must be split into
> -     * multiple lines, one for each of the PPCs within the IoTKit and one
> -     * that will be an output from the IoTKit to the system.
> +     * multiple lines, one for each of the PPCs within the ARMSSE and one
> +     * that will be an output from the ARMSSE to the system.
>       */
>      object_property_set_int(OBJECT(&s->sec_resp_splitter), 3,
>                              "num-lines", &err);
> @@ -475,7 +475,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>  
>      /* 0x40010000 .. 0x4001ffff: private CPU region: unused in IoTKit */
>  
> -    /* 0x40020000 .. 0x4002ffff : IoTKit system control peripheral region */
> +    /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
>      /* Devices behind APB PPC1:
>       *   0x4002f000: S32K timer
>       */
> @@ -558,7 +558,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                         qdev_get_gpio_in(DEVICE(&s->nmi_orgate), 0));
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->s32kwatchdog), 0, 0x5002e000);
>  
> -    /* 0x40080000 .. 0x4008ffff : IoTKit second Base peripheral region */
> +    /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
>  
>      qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
>      object_property_set_bool(OBJECT(&s->nswatchdog), true, "realized", &err);
> @@ -678,7 +678,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>       * Expose our container region to the board model; this corresponds
>       * to the AHB Slave Expansion ports which allow bus master devices
>       * (eg DMA controllers) in the board model to make transactions into
> -     * devices in the IoTKit.
> +     * devices in the ARMSSE.
>       */
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
>  
> @@ -688,11 +688,12 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>  static void iotkit_idau_check(IDAUInterface *ii, uint32_t address,
>                                int *iregion, bool *exempt, bool *ns, bool *nsc)
>  {
> -    /* For IoTKit systems the IDAU responses are simple logical functions
> +    /*
> +     * For ARMSSE systems the IDAU responses are simple logical functions
>       * of the address bits. The NSC attribute is guest-adjustable via the
>       * NSCCFG register in the security controller.
>       */
> -    IoTKit *s = IOTKIT(ii);
> +    ARMSSE *s = ARMSSE(ii);
>      int region = extract32(address, 28, 4);
>  
>      *ns = !(region & 1);
> @@ -707,22 +708,22 @@ static const VMStateDescription iotkit_vmstate = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(nsccfg, IoTKit),
> +        VMSTATE_UINT32(nsccfg, ARMSSE),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>  
>  static Property iotkit_properties[] = {
> -    DEFINE_PROP_LINK("memory", IoTKit, board_memory, TYPE_MEMORY_REGION,
> +    DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
> -    DEFINE_PROP_UINT32("EXP_NUMIRQ", IoTKit, exp_numirq, 64),
> -    DEFINE_PROP_UINT32("MAINCLK", IoTKit, mainclk_frq, 0),
> +    DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> +    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
>  static void iotkit_reset(DeviceState *dev)
>  {
> -    IoTKit *s = IOTKIT(dev);
> +    ARMSSE *s = ARMSSE(dev);
>  
>      s->nsccfg = 0;
>  }
> @@ -740,9 +741,9 @@ static void iotkit_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo iotkit_info = {
> -    .name = TYPE_IOTKIT,
> +    .name = TYPE_ARMSSE,
>      .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(IoTKit),
> +    .instance_size = sizeof(ARMSSE),
>      .instance_init = iotkit_init,
>      .class_init = iotkit_class_init,
>      .interfaces = (InterfaceInfo[]) {
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 82b1d020a58..5824335b4fb 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -66,7 +66,7 @@ typedef struct {
>  typedef struct {
>      MachineState parent;
>  
> -    IoTKit iotkit;
> +    ARMSSE iotkit;
>      MemoryRegion psram;
>      MemoryRegion ssram[3];
>      MemoryRegion ssram1_m;
> 
