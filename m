Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4700691wrh;
        Wed, 8 May 2019 04:14:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv4mzfE/kyOK+v2ve0NHRiiNIzxBx4jJNrTyslsT694ZrdbwRWzIgU6fxOr4CagCagPQoa
X-Received: by 2002:a1c:f702:: with SMTP id v2mr2792174wmh.0.1557314072694;
        Wed, 08 May 2019 04:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314072; cv=none;
        d=google.com; s=arc-20160816;
        b=xbtoRxs/7VG4cdV8BUTtDJUugYa3+dRcu2PwdWCBkia+4QL5DvOmjzv7t1xOxkrD0X
         2n+P7AlnR1MdgzkX14E1KVYgXu1HwunCUOPjidmgahBCZWgT6kQtr24cAbIa9TdcsR82
         rfr2vxREErjKBTuxYmoXxZ4M+X8SedQtc2ogzIksYaXEKS5vlfQIrp0BI7YS+s0UwvS8
         p3oCWBOTcEjgH2BHVZuyc4hQq/r8zhGPtPTy5TnlqAuymGEy4An1iwCEpR7RQRP1eOEQ
         pWOaPA2vprGkI29HWx2+VUN3QL9DE1tcxdCcEQ15BaZB7/lDnC16wwRodRbwtkfd85RK
         SXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gi2t/D+HFQZhqVZHaJbMYThMZKmupvT3IdYeQtCc4Uk=;
        b=NW9vEkv2ApqWBkOXbFRtomBZnbtO5nQJ2fHgXFH3uvgFIiIk/bZOU6HAHRiueGrby4
         Drq/IF3royaBNmdXihan8TjL7u2o1mSL+s4Z2huzB27hxCyXaxhJWWX5LspJ1GX83N27
         uDSW9khXd17Byo9U+lKjMA6UFaa0b5Ov5JM9CItMi+Cd0t7vtpYXLbVp/0L+jAB4KkPF
         U6d0pLa2vzxIZs/T1faM0jEFH/SUQulEGR2QuwxUfAFAIQD/ZNoqoRuC+wjv8VZ7SP8n
         No01LhnJmXECfVPAU/+sWtE6qhBQ+lztH+d/52lOl+AX6Or10Sf7NBz9nR3mVil6Ajtg
         OWgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si1332494wmh.187.2019.05.08.04.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKWt-0003oc-M1
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKWJ-0003Wt-LF
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKWI-0001AI-2h
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:13:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKWH-00019M-Qn
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:13:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id y197so2745641wmd.0
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gi2t/D+HFQZhqVZHaJbMYThMZKmupvT3IdYeQtCc4Uk=;
	b=syJ3HPxC7PmhfWRGapN8lcqPIo2sLfm/ij9umbNhZkCGTWsgRrCf5VKotS6LxWLMpj
	79AGX/sEW9nf5/Zgl7hbfVXLxF+riwHHDsqjgYutXYCdEoh4uAgY0TiFbU2EkpCCCNrI
	VSG2yxqhGXYCf20iKsdgfVAjI8NDGCRlTXpo81gR3xbMrzcCD14C6n9j8D8t76XFXgWd
	zUCuMjqdPQWA5t15M0hrvfaf07u5XGp55BIV3vRgiUeRKfDS7MXNKfRiLgSzUYkuxUhl
	0ya2RNd256eOp7hTY7u2H6m/pG7Os65rPcXwQ1ZIGmj2D60Q7jGKXoj+f3kmC4WOCryf
	BoEA==
X-Gm-Message-State: APjAAAVJ21NIOdf2iXGvjyAdG84mmWDP43i+rxiTICDk5salfIhif9mR
	5Fs0R9nQE/P1PTt8zCh4ZZoSlQ==
X-Received: by 2002:a1c:f909:: with SMTP id x9mr2765196wmh.18.1557314032646;
	Wed, 08 May 2019 04:13:52 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	p18sm25405249wrp.38.2019.05.08.04.13.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:13:52 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-8-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <075c122b-ffcf-9dda-4f1f-dae23bde4191@redhat.com>
Date: Wed, 8 May 2019 13:13:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 07/16] hw/arm/aspeed: Use
 object_initialize_child for correct ref. counting
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
X-TUID: 9fxDmhDtwLp+

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
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Described new use of &error_abort (Markus)
>  - Added Cédric S-o-b (he sent the same 'hw/arm/aspeed_soc.c' patch)
>  - Added Joel R-b of Cédric patch
> ---
>  hw/arm/aspeed.c     |  6 +++---
>  hw/arm/aspeed_soc.c | 50 ++++++++++++++++++---------------------------
>  2 files changed, 23 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c23ebd9925..f700b7e4fe0 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -159,9 +159,9 @@ static void aspeed_board_init(MachineState *machine,
>      ram_addr_t max_ram_size;
>  
>      bmc = g_new0(AspeedBoardState, 1);
> -    object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
> +                            (sizeof(bmc->soc)), cfg->soc_name, &error_abort,
> +                            NULL);
>  
>      sc = ASPEED_SOC_GET_CLASS(&bmc->soc);
>  
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a27233d4876..faff42b84ad 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -106,12 +106,11 @@ static void aspeed_soc_init(Object *obj)
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      int i;
>  
> -    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", OBJECT(&s->cpu), sizeof(s->cpu),
> +                            sc->info->cpu_type, &error_abort, NULL);
>  
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
> -    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
> +                          TYPE_ASPEED_SCU);
>      qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
>                           sc->info->silicon_rev);
>      object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
> @@ -121,36 +120,29 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                "hw-prot-key", &error_abort);
>  
> -    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
> -    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
> +                          TYPE_ASPEED_VIC);
>  
> -    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
> -    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), NULL);
> +    sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
> +                          sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
>      object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
>                                     OBJECT(&s->scu), &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
>  
> -    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> -    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
> +                          TYPE_ASPEED_I2C);
>  
> -    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
> -    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
> +                          sc->info->fmc_typename);
>      object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
>                                &error_abort);
>  
>      for (i = 0; i < sc->info->spis_num; i++) {
> -        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> -                          sc->info->spi_typename[i]);
> -        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NULL);
> -        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
> +                              sizeof(s->spi[i]), sc->info->spi_typename[i]);
>      }
>  
> -    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
> -    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
> +                          TYPE_ASPEED_SDMC);
>      qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
>                           sc->info->silicon_rev);
>      object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
> @@ -159,16 +151,14 @@ static void aspeed_soc_init(Object *obj)
>                                "max-ram-size", &error_abort);
>  
>      for (i = 0; i < sc->info->wdts_num; i++) {
> -        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
> -        object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NULL);
> -        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
> +                              sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
>          qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
>                                      sc->info->silicon_rev);
>      }
>  
> -    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
> -    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
> +                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
