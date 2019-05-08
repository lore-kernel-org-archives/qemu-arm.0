Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4702074wrh;
        Wed, 8 May 2019 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxX2igXO0Oh+jwuU1u6MF1Cu7N+AGOfnMA9wlfW6OcvhrCwdJ8YRXkqTT0Wotfw3f6r0DlH
X-Received: by 2002:a1c:2109:: with SMTP id h9mr2718809wmh.68.1557314155678;
        Wed, 08 May 2019 04:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314155; cv=none;
        d=google.com; s=arc-20160816;
        b=gUGSfVYLCBzOlYGX7O3aCIvrmUG3BGXPYZoFAR/RtnjAa17So66i/2CzH0DCNd1XgE
         K1/4Sc7ST/V3NoCtsIBAdGEDL1bQIjk9pMt87NvsmEwbSP2Hz43pKFOcn3t7lj4iH02T
         YBTIlj/gIvxrP5QeETRfPMz69eSLKz2lONypZrCQp7TUX5qmrA8S9aTP205taCWefwNB
         pAePUENbmk68gj7ooI6wDRIGcqJDaMv8TXuzWToQe9EczhSbPmyQJ5QOVBbK+ov98Try
         II3N2nJhWG+hpe6X3hs+5KYpDsw0u7L0EB6mULudzR1z7Urp+AR4ldNwIISeGIz3DOgJ
         vC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=floSQeC0a0Gg9HZ3FRFtBn81cP5dNsI/WH2eLaqFb9g=;
        b=iZNkQUcsAeM4cC0KS7u4qpa5EBxUpT004U8PvHgH74fzPHYorZaA35LvrvWvTLE7xS
         /x3FmhVWhg06KWwRolrbr7o1koMPNLq/r0yxEjVZfBfVQJVuFgjQ0Es34MY7jT3EQ6Ic
         lG7x5WFzLg6i9jCfOEQRv3eqpB+YL37jzH5DitUzDoaanhrZ0+9hu9QRPxGu2ov8e5se
         4WF6Vzrrrr9jUAFFezk4xs/Pj4QW7cWMhcDFyngrB0d1U/YnrD4XDef0KQ2IQYdtx2iI
         ioQWNgwmgNUsuT57nSnNek4DCtj3Zqn7QnbJloJJpg4FNIqv2xilY/MuQc06XcbwpdEI
         55cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si6574552wrr.318.2019.05.08.04.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKYE-0004dq-Lj
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:15:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKY0-0004bd-9l
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKXy-0002OK-Df
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:15:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKXw-0002Kr-M5
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:15:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id b203so1594204wmb.4
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=floSQeC0a0Gg9HZ3FRFtBn81cP5dNsI/WH2eLaqFb9g=;
	b=azDnTcNhnXas7TrK0YaiXPv/X0KKGdlw21tG83Az0bXpKUFHP0Qvj3MHIQf85dhbZz
	ldp9HjRN02lLEilYY5O3j9eMCi7qcAd015BMOJAseI/1DOed+0WJwAVAVsDS1cb4sX9C
	bWEuokwld7VGa3rqRL8sItBf+z0w1n6F8sw6llomEqyan+kH8b8rXQVkmoWpzWBz+OEN
	ngs+XGpI2z8IpI3hBh9Hxcuk+OUVmhMEtgQN3aBVzgHNxpm+TBzNSXJ2o3a0Es8ApBJR
	QxL/kRe6tJ+dRexxiB7I9z70I1qG1IRrVCDyFoL7P+wp9Ya4+biIUY0vG+4j1EJtk958
	1cUQ==
X-Gm-Message-State: APjAAAW6S1ffdm80ULT5DsKbV+sSYicQxbK8fhEY9qUUK3PtQph3tzXl
	bOcAKXIJh9e1zXq02M6JL/TIAQ==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr2748925wmi.75.1557314133956;
	Wed, 08 May 2019 04:15:33 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	j190sm3560280wmb.19.2019.05.08.04.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:15:33 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-9-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e58c6ac3-97f7-b590-0e29-36a2b1e6e336@redhat.com>
Date: Wed, 8 May 2019 13:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 08/16] hw/arm: Use
 object_initialize_child for correct reference counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rgBrRzugqvRf

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> This patch was generated using the following Coccinelle script
> (with a bit of manual fix-up for overly long lines):
> 
>  @use_object_initialize_child@
>  expression parent_obj;
>  expression child_ptr;
>  expression child_name;
>  expression child_type;
>  expression child_size;
>  expression errp;
>  @@
>  (
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_size,
>  +                           child_type, &error_abort, NULL);
>      ... when != parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr), NULL);
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  |
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_size,
>  +                            child_type, errp, NULL);
>      ... when != parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr), errp);
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  )
> 
>  @use_sysbus_init_child_obj@
>  expression parent_obj;
>  expression dev;
>  expression child_ptr;
>  expression child_name;
>  expression child_type;
>  expression child_size;
>  expression errp;
>  @@
>  (
>  -   object_initialize_child(parent_obj, child_name, child_ptr, child_size,
>  -                           child_type, errp, NULL);
>  +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
>  +                         child_type);
>      ...
>  -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
>  |
>  -   object_initialize_child(parent_obj, child_name, child_ptr, child_size,
>  -                           child_type, errp, NULL);
>  +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
>  +                         child_type);
>  -   dev = DEVICE(child_ptr);
>  -   qdev_set_parent_bus(dev, sysbus_get_default());
>  )
> 
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
> This choice also matches when using sysbus_init_child_obj(),
> since its code is:
> 
>   void sysbus_init_child_obj(Object *parent,
>                              const char *childname, void *child,
>                              size_t childsize, const char *childtype)
>   {
>       object_initialize_child(parent, childname, child, childsize,
>                               childtype, &error_abort, NULL);
> 
>       qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
>   }
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2:
>  - Tweaked cocci to improve digic_init (Thomas)
>  - Described new use of &error_abort (Markus)
> ---
>  hw/arm/digic.c       | 17 ++++++-----------
>  hw/arm/imx25_pdk.c   |  5 ++---
>  hw/arm/kzm.c         |  5 ++---
>  hw/arm/raspi.c       |  7 +++----
>  hw/arm/sabrelite.c   |  5 ++---
>  hw/arm/xlnx-zcu102.c |  5 ++---
>  hw/arm/xlnx-zynqmp.c |  8 ++++----
>  7 files changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 726abb9b485..6ef26c6bac3 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -32,27 +32,22 @@
>  static void digic_init(Object *obj)
>  {
>      DigicState *s = DIGIC(obj);
> -    DeviceState *dev;
>      int i;
>  
> -    object_initialize(&s->cpu, sizeof(s->cpu), "arm946-" TYPE_ARM_CPU);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL);
>  
>      for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
>  #define DIGIC_TIMER_NAME_MLEN    11
>          char name[DIGIC_TIMER_NAME_MLEN];
>  
> -        object_initialize(&s->timer[i], sizeof(s->timer[i]), TYPE_DIGIC_TIMER);
> -        dev = DEVICE(&s->timer[i]);
> -        qdev_set_parent_bus(dev, sysbus_get_default());
>          snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
> -        object_property_add_child(obj, name, OBJECT(&s->timer[i]), NULL);
> +        sysbus_init_child_obj(obj, name, &s->timer[i], sizeof(s->timer[i]),
> +                              TYPE_DIGIC_TIMER);
>      }
>  
> -    object_initialize(&s->uart, sizeof(s->uart), TYPE_DIGIC_UART);
> -    dev = DEVICE(&s->uart);
> -    qdev_set_parent_bus(dev, sysbus_get_default());
> -    object_property_add_child(obj, "uart", OBJECT(&s->uart), NULL);
> +    sysbus_init_child_obj(obj, "uart", &s->uart, sizeof(s->uart),
> +                          TYPE_DIGIC_UART);
>  }
>  
>  static void digic_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 9f3ee147390..eef1b184b0d 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -72,9 +72,8 @@ static void imx25_pdk_init(MachineState *machine)
>      unsigned int alias_offset;
>      int i;
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX25);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> +                            TYPE_FSL_IMX25, &error_abort, NULL);
>  
>      object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
>  
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index 139934c4ecf..44cba8782bf 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -71,9 +71,8 @@ static void kzm_init(MachineState *machine)
>      unsigned int alias_offset;
>      unsigned int i;
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX31);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> +                            TYPE_FSL_IMX31, &error_abort, NULL);
>  
>      object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
>  
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c28dc1..0a6244096cc 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -175,10 +175,9 @@ static void raspi_init(MachineState *machine, int version)
>      BusState *bus;
>      DeviceState *carddev;
>  
> -    object_initialize(&s->soc, sizeof(s->soc),
> -                      version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> +                            version == 3 ? TYPE_BCM2837 : TYPE_BCM2836,
> +                            &error_abort, NULL);
>  
>      /* Allocate and map RAM */
>      memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index ee140e5d9eb..f1b00de2294 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -55,9 +55,8 @@ static void sabrelite_init(MachineState *machine)
>          exit(1);
>      }
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX6);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> +                            TYPE_FSL_IMX6, &error_abort, NULL);
>  
>      object_property_set_bool(OBJECT(&s->soc), true, "realized", &err);
>      if (err != NULL) {
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index b6bc6a93b89..c802f26fbdf 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -91,9 +91,8 @@ static void xlnx_zcu102_init(MachineState *machine)
>      memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
>                                           ram_size);
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> +                            TYPE_XLNX_ZYNQMP, &error_abort, NULL);
>  
>      object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
>                           "ddr-ram", &error_abort);
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 4f8bc41d9d4..6e991903022 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -191,10 +191,10 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>      for (i = 0; i < num_rpus; i++) {
>          char *name;
>  
> -        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                          "cortex-r5f-" TYPE_ARM_CPU);
> -        object_property_add_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
> -                                  OBJECT(&s->rpu_cpu[i]), &error_abort);
> +        object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
> +                                &s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> +                                "cortex-r5f-" TYPE_ARM_CPU, &error_abort,
> +                                NULL);
>  
>          name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
>          if (strcmp(name, boot_cpu)) {
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
