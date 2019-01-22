Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7086607wrt;
        Tue, 22 Jan 2019 03:03:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5g4wG64XedbQq99DZEe3NooUfkQAK1Q1bQ046O8G5WNC0yl6+9QGut1IJ6OJmqIIzSAjXX
X-Received: by 2002:a1c:9ed7:: with SMTP id h206mr3106463wme.28.1548154995271;
        Tue, 22 Jan 2019 03:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548154995; cv=none;
        d=google.com; s=arc-20160816;
        b=vRMi/yBvWcAQcOH5cnsgBnqfkh2jlQxmvC/13lzkGCSREKYARA6yE5QkT6iYzw4eNS
         15g+cKnpqNHx1pdZn8cfp3ix92/d4QHJpHBFWa8knNhPh07PIAc3Eco2YQKSwnlkQddu
         HijoNVVJj8TackaZvq1Yu3BOy5OyaqKhzPrFI3hGilIIwkbCI2VHFuOyFhCWvUfn6RZA
         c4trRlAWNh+lqxEwz4XbHNqFo1zjDnEkoeqebpt2OPpDXiqgsyoHbJWCY1CT9o/KFfsV
         US+AGBZ7NDJBgd9PSHX75jwokqG+oxbM+SFYHS49A7jSanu//5P8PS2UUN2aotuPyTiu
         s3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=JdJB/rsqwaPrz0eiQRNSUOPd2Auvo6ECHZ0LVz7lRUM=;
        b=NmjMqveHQnysW9vqS9irUBX8+FmRghndbkYVcpjdZ8wvRRdz7J3nBVjtl9UxE9pJFN
         rWgUxqvH8575oRzdzA9EBQhRyIHJs4wuTxjzLQdeZbaJljs/W3FXcjMM7ds9rW5UlT3i
         gdX2kKbayTbiGs4tpVIGnFuGVX6UHysJuQyiVNaiy1HrpPEUV+ZW18JRMExHRFDacB7a
         3TjeJYpZMf6bxRGa6+Re0YYX6IPXdHUz60yMezPVUxnDaJk7ZVvv9R1WBsvqCSIUQIun
         z3HF8azGrIYJeV9x0OLRAQL4bfZUc8fIw41DwXnUcm7noKDWZzgC76Cg5xxP+KPqI654
         mTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si30391506wri.445.2019.01.22.03.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 03:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gltpq-0005Xq-91
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 06:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltpR-0005T7-OX
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:02:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltpK-0007uS-EB
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:02:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gltpH-0007qM-LI
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:02:40 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so26798713wrt.7
	for <qemu-arm@nongnu.org>; Tue, 22 Jan 2019 03:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JdJB/rsqwaPrz0eiQRNSUOPd2Auvo6ECHZ0LVz7lRUM=;
	b=SgzwkB/4uuYux/EM0nWpm2zUg0VOZV9mQXEK/3sdogVcI1Qet3tRcfQyOY0MAwbT2q
	v/Ef18faeaYGrt+/rS7WtX3oxfFyJio+kBkUNvbSVyuev4Yy8xLwpm4v+SrIRW8n1yw2
	GNec34ZVjMcFrcow69F6Wah88ujDVRvz9Za8slavA4YffewHRA1biFUGI7MuUsQ6IPVY
	EaNtZjy9AMCIyowG7nZFquYrL04DVJwfdGenHdPPorn4LY9EqC0ile3iEL26yv1yY3Fr
	MA/Arps2Q6b3OmzXnFXCd9PS+g953/6i467IjQr1haTDFXHR7gRlkznbdgRmIK1VqWy9
	S1Mw==
X-Gm-Message-State: AJcUukeXnJ0ZQXJsOWsR/6rt0+S9KIZJNecgro7N83y9z2NE4df3+LTE
	rsNO6CHfrWQttYCPcRu3i0oipw==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr31407563wrt.43.1548154952836; 
	Tue, 22 Jan 2019 03:02:32 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	t5sm35949503wmg.43.2019.01.22.03.02.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 03:02:32 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <92433775-b221-74cb-991a-c718b68cd7a6@redhat.com>
Date: Tue, 22 Jan 2019 12:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/23] hw/arm/iotkit: Rename
 'iotkit' local variables and functions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/czC3JtwXKT

On 1/21/19 7:51 PM, Peter Maydell wrote:
> Rename various internal uses of 'iotkit' in hw/arm/iotkit.c to
> 'armsse', for consistency. The remaining occurences are:
>  * related to the devices TYPE_IOTKIT_SYSCTL, TYPE_IOTKIT_SYSINFO,
>    etc, which this refactor is not touching
>  * references that apply specifically to the IoTKit (like
>    the lack of a private CPU region)
>  * the vmstate, which keeps its old "iotkit" name for
>    migration compatibility reasons
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/iotkit.c | 68 ++++++++++++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index d5b172933c3..7ff14fd5aef 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -56,7 +56,7 @@ static void nsccfg_handler(void *opaque, int n, int level)
>      s->nsccfg = level;
>  }
>  
> -static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
> +static void armsse_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
>  {
>      /* Each of the 4 AHB and 4 APB PPCs that might be present in a
>       * system using the ARMSSE has a collection of control lines which
> @@ -65,22 +65,22 @@ static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
>       * code using the ARMSSE can wire them up to the PPCs.
>       */
>      SplitIRQ *splitter = &s->ppc_irq_splitter[ppcnum];
> -    DeviceState *iotkitdev = DEVICE(s);
> +    DeviceState *armssedev = DEVICE(s);
>      DeviceState *dev_secctl = DEVICE(&s->secctl);
>      DeviceState *dev_splitter = DEVICE(splitter);
>      char *name;
>  
>      name = g_strdup_printf("%s_nonsec", ppcname);
> -    qdev_pass_gpios(dev_secctl, iotkitdev, name);
> +    qdev_pass_gpios(dev_secctl, armssedev, name);
>      g_free(name);
>      name = g_strdup_printf("%s_ap", ppcname);
> -    qdev_pass_gpios(dev_secctl, iotkitdev, name);
> +    qdev_pass_gpios(dev_secctl, armssedev, name);
>      g_free(name);
>      name = g_strdup_printf("%s_irq_enable", ppcname);
> -    qdev_pass_gpios(dev_secctl, iotkitdev, name);
> +    qdev_pass_gpios(dev_secctl, armssedev, name);
>      g_free(name);
>      name = g_strdup_printf("%s_irq_clear", ppcname);
> -    qdev_pass_gpios(dev_secctl, iotkitdev, name);
> +    qdev_pass_gpios(dev_secctl, armssedev, name);
>      g_free(name);
>  
>      /* irq_status is a little more tricky, because we need to
> @@ -96,15 +96,15 @@ static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
>      qdev_connect_gpio_out(dev_splitter, 1,
>                            qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), ppcnum));
>      s->irq_status_in[ppcnum] = qdev_get_gpio_in(dev_splitter, 0);
> -    qdev_init_gpio_in_named_with_opaque(iotkitdev, irq_status_forwarder,
> +    qdev_init_gpio_in_named_with_opaque(armssedev, irq_status_forwarder,
>                                          s->irq_status_in[ppcnum], name, 1);
>      g_free(name);
>  }
>  
> -static void iotkit_forward_sec_resp_cfg(ARMSSE *s)
> +static void armsse_forward_sec_resp_cfg(ARMSSE *s)
>  {
>      /* Forward the 3rd output from the splitter device as a
> -     * named GPIO output of the iotkit object.
> +     * named GPIO output of the armsse object.
>       */
>      DeviceState *dev = DEVICE(s);
>      DeviceState *dev_splitter = DEVICE(&s->sec_resp_splitter);
> @@ -115,12 +115,12 @@ static void iotkit_forward_sec_resp_cfg(ARMSSE *s)
>      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
>  }
>  
> -static void iotkit_init(Object *obj)
> +static void armsse_init(Object *obj)
>  {
>      ARMSSE *s = ARMSSE(obj);
>      int i;
>  
> -    memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
> +    memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
>  
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
>                            TYPE_ARMV7M);
> @@ -160,9 +160,9 @@ static void iotkit_init(Object *obj)
>                            sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
>      sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
>                            sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
> -    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl,
> +    sysbus_init_child_obj(obj, "armsse-sysctl", &s->sysctl,
>                            sizeof(s->sysctl), TYPE_IOTKIT_SYSCTL);
> -    sysbus_init_child_obj(obj, "iotkit-sysinfo", &s->sysinfo,
> +    sysbus_init_child_obj(obj, "armsse-sysinfo", &s->sysinfo,
>                            sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
>      object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
>                              sizeof(s->nmi_orgate), TYPE_OR_IRQ,
> @@ -183,20 +183,20 @@ static void iotkit_init(Object *obj)
>      }
>  }
>  
> -static void iotkit_exp_irq(void *opaque, int n, int level)
> +static void armsse_exp_irq(void *opaque, int n, int level)
>  {
>      ARMSSE *s = ARMSSE(opaque);
>  
>      qemu_set_irq(s->exp_irqs[n], level);
>  }
>  
> -static void iotkit_mpcexp_status(void *opaque, int n, int level)
> +static void armsse_mpcexp_status(void *opaque, int n, int level)
>  {
>      ARMSSE *s = ARMSSE(opaque);
>      qemu_set_irq(s->mpcexp_status_in[n], level);
>  }
>  
> -static void iotkit_realize(DeviceState *dev, Error **errp)
> +static void armsse_realize(DeviceState *dev, Error **errp)
>  {
>      ARMSSE *s = ARMSSE(dev);
>      int i;
> @@ -287,7 +287,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < s->exp_numirq; i++) {
>          s->exp_irqs[i] = qdev_get_gpio_in(DEVICE(&s->armv7m), i + 32);
>      }
> -    qdev_init_gpio_in_named(dev, iotkit_exp_irq, "EXP_IRQ", s->exp_numirq);
> +    qdev_init_gpio_in_named(dev, armsse_exp_irq, "EXP_IRQ", s->exp_numirq);
>  
>      /* Set up the big aliases first */
>      make_alias(s, &s->alias1, "alias 1", 0x10000000, 0x10000000, 0x00000000);
> @@ -336,7 +336,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                                  qdev_get_gpio_in(dev_splitter, 0));
>  
>      /* This RAM lives behind the Memory Protection Controller */
> -    memory_region_init_ram(&s->sram0, NULL, "iotkit.sram0", 0x00008000, &err);
> +    memory_region_init_ram(&s->sram0, NULL, "armsse.sram0", 0x00008000, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
> @@ -608,14 +608,14 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < IOTS_NUM_AHB_EXP_PPC; i++) {
>          char *ppcname = g_strdup_printf("ahb_ppcexp%d", i);
>  
> -        iotkit_forward_ppc(s, ppcname, i);
> +        armsse_forward_ppc(s, ppcname, i);
>          g_free(ppcname);
>      }
>  
>      for (i = 0; i < IOTS_NUM_APB_EXP_PPC; i++) {
>          char *ppcname = g_strdup_printf("apb_ppcexp%d", i);
>  
> -        iotkit_forward_ppc(s, ppcname, i + IOTS_NUM_AHB_EXP_PPC);
> +        armsse_forward_ppc(s, ppcname, i + IOTS_NUM_AHB_EXP_PPC);
>          g_free(ppcname);
>      }
>  
> @@ -672,10 +672,10 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      /* Create GPIO inputs which will pass the line state for our
>       * mpcexp_irq inputs to the correct splitter devices.
>       */
> -    qdev_init_gpio_in_named(dev, iotkit_mpcexp_status, "mpcexp_status",
> +    qdev_init_gpio_in_named(dev, armsse_mpcexp_status, "mpcexp_status",
>                              IOTS_NUM_EXP_MPC);
>  
> -    iotkit_forward_sec_resp_cfg(s);
> +    armsse_forward_sec_resp_cfg(s);
>  
>      /* Forward the MSC related signals */
>      qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
> @@ -695,7 +695,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
>  }
>  
> -static void iotkit_idau_check(IDAUInterface *ii, uint32_t address,
> +static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
>                                int *iregion, bool *exempt, bool *ns, bool *nsc)
>  {
>      /*
> @@ -713,7 +713,7 @@ static void iotkit_idau_check(IDAUInterface *ii, uint32_t address,
>      *iregion = region;
>  }
>  
> -static const VMStateDescription iotkit_vmstate = {
> +static const VMStateDescription armsse_vmstate = {
>      .name = "iotkit",
>      .version_id = 1,
>      .minimum_version_id = 1,
> @@ -723,7 +723,7 @@ static const VMStateDescription iotkit_vmstate = {
>      }
>  };
>  
> -static Property iotkit_properties[] = {
> +static Property armsse_properties[] = {
>      DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> @@ -731,24 +731,24 @@ static Property iotkit_properties[] = {
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -static void iotkit_reset(DeviceState *dev)
> +static void armsse_reset(DeviceState *dev)
>  {
>      ARMSSE *s = ARMSSE(dev);
>  
>      s->nsccfg = 0;
>  }
>  
> -static void iotkit_class_init(ObjectClass *klass, void *data)
> +static void armsse_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(klass);
>      ARMSSEClass *asc = ARMSSE_CLASS(klass);
>  
> -    dc->realize = iotkit_realize;
> -    dc->vmsd = &iotkit_vmstate;
> -    dc->props = iotkit_properties;
> -    dc->reset = iotkit_reset;
> -    iic->check = iotkit_idau_check;
> +    dc->realize = armsse_realize;
> +    dc->vmsd = &armsse_vmstate;
> +    dc->props = armsse_properties;
> +    dc->reset = armsse_reset;
> +    iic->check = armsse_idau_check;
>      asc->info = data;
>  }
>  
> @@ -756,7 +756,7 @@ static const TypeInfo armsse_info = {
>      .name = TYPE_ARMSSE,
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(ARMSSE),
> -    .instance_init = iotkit_init,
> +    .instance_init = armsse_init,
>      .abstract = true,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_IDAU_INTERFACE },
> @@ -774,7 +774,7 @@ static void armsse_register_types(void)
>          TypeInfo ti = {
>              .name = armsse_variants[i].name,
>              .parent = TYPE_ARMSSE,
> -            .class_init = iotkit_class_init,
> +            .class_init = armsse_class_init,
>              .class_data = (void *)&armsse_variants[i],
>          };
>          type_register(&ti);
> 
