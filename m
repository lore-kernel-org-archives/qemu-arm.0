Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4703257wrh;
        Wed, 8 May 2019 04:17:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4EYAxkSIOf5ZYLzC7XSoZ/qIZdYd2X/Xtho60vyalOjNrIDO4fbwiF0Bz4/T720zm6PXv
X-Received: by 2002:a1c:c004:: with SMTP id q4mr2471180wmf.131.1557314227675;
        Wed, 08 May 2019 04:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314227; cv=none;
        d=google.com; s=arc-20160816;
        b=DVrQ2Y9qvS3qq4pI8qRCoOiiSYBuns28VvtGKsHpHeVNr5ua/zHIV3QbAGWybJ1Mtv
         Waq8RncGX8KAjkTRI7RYi1w+ffsHL5xHrjbuwrIyFimKiGXgezftWHAHGim0S3gfuAH8
         TEmkPG9G97AfSuktnTO19qoKO5UfR5fmPheVpfsYTX3iZmJg5VTm9Bws0IXLHsaF5CVf
         WciQaniyuEKTIqenqcK2RctoSm9iOrZ+pOmXsCzRZdo1fnXYuT6ZLbufeRlagxpEfwvK
         VUzz9h4cUt/79EH6RDZr3VTItNfVX9MRsuikcjbOH/xEuOCFYUKlIimZlaxhUVXQT/r7
         8MiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Eq7qSLyleWrNCHx4P4SRi3MKHGejKq3JrAmj3Wbb+Ss=;
        b=qjFgpyTHbskOANSQdvZ2rcWdLjOXWbH7/MpLKCWHDbJw0DHt30IKQuDk+EI8aftMZJ
         uRQLlBRkXlGr5lhb4JnRm65050uP6wgaBWc/U5QyYCQxW5EFp1gbZfgwNd+ERyxUr7BK
         tt7aEHWCibRTgxO8Ypx8Law9IYVp6oybLiNG6vCcYtJefQG4OA2ker0tXhHlTliYC5MO
         3AigyQWvLiZC24LXtDH2WamnUBXrUltA8woE9oZ2k+TDTham4mnU0fe84VP1xZXEyQ8W
         FwepHX58AR6YbC9mbUuI+Ms5cx6lxSMCmXIO7TszCrxZUoeSiGGKlTZkisiZb3eBcRRx
         r9UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x185si1347611wmb.73.2019.05.08.04.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKZO-00067t-KQ
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:17:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYc-0005im-Ut
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYb-0002je-Ea
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKYb-0002j8-7F
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:16:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id f2so2749206wmj.3
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Eq7qSLyleWrNCHx4P4SRi3MKHGejKq3JrAmj3Wbb+Ss=;
	b=C43LIyhDLYVyasUC58H+qkfrvEnqGxZROlINGyCSKO9yh4Q9BSEg99k6t6ZEfIul7K
	QRSJVQXM7hOI8yg5Kyj0zd4DFiNESErpSduMZ0/HQgBI4dFw6xUpAVIIAxcSudh/BNkA
	ejlk/FKBSM+wmIjA/a65iCx29aRuYkrKSDiawU3ZPWud4jOxp+EwkQcqA/1BnuPkIhYV
	WqN6fLNJ6/p12xMcEt5uucPexkZurFW3/nPzQFP03xySDEqY/CEOm9hQsbWOYDePTsoO
	Z2ikLT3Vq7uNJ//zAzsX5YF1EsoX8dJfMZJ+y9RBOyaWnmqvjvg8nLFxNRpruBKeRLwG
	N5wg==
X-Gm-Message-State: APjAAAUw2AIwXlKTbePXMMwXNLk6bqWVQRxwSQYuInNYhIpAyq7BNfZT
	1kY1FOvb504NrcqKutqxPYRKSw==
X-Received: by 2002:a05:600c:2291:: with SMTP id
	17mr2584957wmf.132.1557314176242; 
	Wed, 08 May 2019 04:16:16 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	o6sm35170410wrh.55.2019.05.08.04.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:16:15 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-11-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f56c85c7-4045-ce26-4a44-8e6bc28a71e2@redhat.com>
Date: Wed, 8 May 2019 13:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/16] hw/mips: Use
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
X-TUID: Ui3PluLl9yDB

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
> This patch was generated using the following Coccinelle script:
> 
>  @use_sysbus_init_child_obj_missing_parent@
>  expression child_ptr;
>  expression child_type;
>  expression child_size;
>  @@
>  -   object_initialize(child_ptr, child_size, child_type);
>      ...
>  -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
>  +                         child_size, child_type);
> 
> We let the Malta/Boston machines adopt the CPS child, and similarly
> the CPS adopts the ITU/CPC/GIC/GCR children.
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
>  hw/mips/boston.c     |  4 ++--
>  hw/mips/cps.c        | 20 ++++++++------------
>  hw/mips/mips_malta.c |  4 ++--
>  3 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index cb3ea85fdc1..1ffccc8da92 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -455,8 +455,8 @@ static void boston_mach_init(MachineState *machine)
>  
>      is_64b = cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
>  
> -    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> -    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(machine), "cps", OBJECT(&s->cps),
> +                          sizeof(s->cps), TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), machine->cpu_type, "cpu-type",
>                              &err);
>      object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index fc97f59af4c..649b35a76c5 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -94,9 +94,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>  
>      /* Inter-Thread Communication Unit */
>      if (itu_present) {
> -        object_initialize(&s->itu, sizeof(s->itu), TYPE_MIPS_ITU);
> -        qdev_set_parent_bus(DEVICE(&s->itu), sysbus_get_default());
> -
> +        sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu),
> +                              TYPE_MIPS_ITU);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &err);
>          object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-present",
> @@ -115,9 +114,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* Cluster Power Controller */
> -    object_initialize(&s->cpc, sizeof(s->cpc), TYPE_MIPS_CPC);
> -    qdev_set_parent_bus(DEVICE(&s->cpc), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
> +                          TYPE_MIPS_CPC);
>      object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err);
>      object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
> @@ -130,9 +128,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>                              sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpc), 0));
>  
>      /* Global Interrupt Controller */
> -    object_initialize(&s->gic, sizeof(s->gic), TYPE_MIPS_GIC);
> -    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "gic", &s->gic, sizeof(s->gic),
> +                          TYPE_MIPS_GIC);
>      object_property_set_int(OBJECT(&s->gic), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->gic), 128, "num-irq", &err);
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
> @@ -147,9 +144,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      /* Global Configuration Registers */
>      gcr_base = env->CP0_CMGCRBase << 4;
>  
> -    object_initialize(&s->gcr, sizeof(s->gcr), TYPE_MIPS_GCR);
> -    qdev_set_parent_bus(DEVICE(&s->gcr), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "gcr", &s->gcr, sizeof(s->gcr),
> +                          TYPE_MIPS_GCR);
>      object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
>      object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 04f2117d71e..aff8464f2ac 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1151,8 +1151,8 @@ static void create_cps(MaltaState *s, const char *cpu_type,
>  {
>      Error *err = NULL;
>  
> -    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> -    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps), sizeof(s->cps),
> +                          TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), cpu_type, "cpu-type", &err);
>      object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
>      object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
