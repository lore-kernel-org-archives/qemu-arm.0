Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4697064wrh;
        Wed, 8 May 2019 04:10:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZ+OHve9j4DXcV4tm1dg17xXJYZo25BLIyaLgXvvJYnziBqAE74SrNyxK4ujWdJT++cR0e
X-Received: by 2002:a7b:c649:: with SMTP id q9mr2625492wmk.2.1557313839118;
        Wed, 08 May 2019 04:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557313839; cv=none;
        d=google.com; s=arc-20160816;
        b=bdnmSi4nDqI36sDGxm3CK5K0v+nx5zh6JW5Qh7KEtBHMMc9colmdnN6TZrNJvQfup4
         xTaJTUmJyqX7pBM++LPqT0+ibUAcwlVrT1o+6EWWju2quQEIfoOYmCSvW+gMWWqMruEm
         YEtVCS+zNryd5rTzvQzLVlz7Ka/xz5Pz/AOcj50MTYfKatBItOF4CBS5uasj8q3YCoDQ
         g9UP9wakS/5d9bm2Sd2SLW/UcxhfxKYb9eqnm8zdw1TmTF1xWlf75ovyVMyk4y5ygUay
         I05/hY2T7Xd1b/j0sWSFjwu3D3PwY+hw5ay2mT2F8NFHuUP5BkL4yFJJYGaZtKP74D4R
         EUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=kfVn3PcHbJJyc67HYE+LAqAbpidfU5TEawPfmSHoBB4=;
        b=H9v0xjyt5QkGrIP4/VUsEFb3u2tEy6Hk+7SwpRkHW1qKGEQbr4bH48rDPeUdNAtjTU
         6IK5EG7nR2MtOpWgjZfV5ULdtEAc3HKghvmLU08TZF029ySAvM3iZU/pekKie21rjcEE
         V1YbkglYNra6wmJmJcao1vlsK9KnaA2Y3yHjOEzQCD34HhiQmNDj2EyRBm0eVqFj3C8M
         6H28B68j93P48hB7K6N54oFVhJVYUVBySVn7tr1doYkp0AOmNJlJW6Sl0YF09CP/vNXx
         jmf58F+DFQn9k0ZAY1dA4fKeNs5I1KlGbtdBWIDbCPPi/bw5jiDh/ElBa598GwuXjmZ8
         KMuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si1345715wmb.25.2019.05.08.04.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKT8-0000jA-33
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:10:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKSb-0000UK-F0
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:10:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKSX-0007ja-4u
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:10:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKSU-0007h0-Km
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id w12so13193697wrp.2
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kfVn3PcHbJJyc67HYE+LAqAbpidfU5TEawPfmSHoBB4=;
	b=QjHt7A87p3YMBQhUcCq4+ICW+OHH85BiByWklPxMH8TUunyhGOGcKugzO3XH/nN/8f
	oET5h9YPtEedL+skezMv1dV/qMyDrMgctFc4m5z411QgpdL/qhwT6U3mYhqOhj8x6ZIS
	WfgCHCv4IdEOG/zHCEycNW7IKRSUUeTRIhjB/TXURIIyfks0Xb3XWO7ktpW9sVKYDRUt
	f1snRYHc3yczl9YMGGBAxK8PCvdhAxM+sTZ25u4fi+7wNMKfYQsFFk3CXTvAigLVuxmJ
	4o65/xey3P28i3bVpab/pCiUUp2njC+WG5/9Dq3/ghSvK0VFqkgkbGLC+zvUli7Oq3M4
	/GuQ==
X-Gm-Message-State: APjAAAXfpEaQEe8ZFL/uTCGELoAStVYM6tuxlmrSnAx+nhNhKfmmitIE
	B7RYJXb8uQPFMie/xBbnQnXi6vhO7FFKzg==
X-Received: by 2002:adf:e845:: with SMTP id d5mr3647661wrn.154.1557313795010; 
	Wed, 08 May 2019 04:09:55 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id a4sm2520109wmf.45.2019.05.08.04.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:09:54 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fa64aca9-b72e-6f0d-d7f3-f9e68b2487b7@redhat.com>
Date: Wed, 8 May 2019 13:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 06/16] hw/arm/bcm2835: Use
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
X-TUID: DpKcG0ka0mNd

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
>  hw/arm/bcm2835_peripherals.c | 53 ++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 2931a82a25a..0fb54c7964e 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -41,44 +41,36 @@ static void bcm2835_peripherals_init(Object *obj)
>                         MBOX_CHAN_COUNT << MBOX_AS_CHAN_SHIFT);
>  
>      /* Interrupt Controller */
> -    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
> -    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
>  
>      /* UART0 */
> -    object_initialize(&s->uart0, sizeof(s->uart0), TYPE_PL011);
> -    object_property_add_child(obj, "uart0", OBJECT(&s->uart0), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->uart0), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
> +                          TYPE_PL011);
>  
>      /* AUX / UART1 */
> -    object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
> -    object_property_add_child(obj, "aux", OBJECT(&s->aux), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->aux), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "aux", &s->aux, sizeof(s->aux),
> +                          TYPE_BCM2835_AUX);
>  
>      /* Mailboxes */
> -    object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
> -    object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "mbox", &s->mboxes, sizeof(s->mboxes),
> +                          TYPE_BCM2835_MBOX);
>  
>      object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
>                                     OBJECT(&s->mbox_mr), &error_abort);
>  
>      /* Framebuffer */
> -    object_initialize(&s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
> -    object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
> +    sysbus_init_child_obj(obj, "fb", &s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
>      object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size",
>                                &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
>  
>      object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abort);
>  
>      /* Property channel */
> -    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
> -    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
> +    sysbus_init_child_obj(obj, "property", &s->property, sizeof(s->property),
> +                          TYPE_BCM2835_PROPERTY);
>      object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
>                                "board-rev", &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
>  
>      object_property_add_const_link(OBJECT(&s->property), "fb",
>                                     OBJECT(&s->fb), &error_abort);
> @@ -86,32 +78,27 @@ static void bcm2835_peripherals_init(Object *obj)
>                                     OBJECT(&s->gpu_bus_mr), &error_abort);
>  
>      /* Random Number Generator */
> -    object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
> -    object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "rng", &s->rng, sizeof(s->rng),
> +                          TYPE_BCM2835_RNG);
>  
>      /* Extended Mass Media Controller */
> -    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
> -    object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "sdhci", &s->sdhci, sizeof(s->sdhci),
> +                          TYPE_SYSBUS_SDHCI);
>  
>      /* SDHOST */
> -    object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHOST);
> -    object_property_add_child(obj, "sdhost", OBJECT(&s->sdhost), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "sdhost", &s->sdhost, sizeof(s->sdhost),
> +                          TYPE_BCM2835_SDHOST);
>  
>      /* DMA Channels */
> -    object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
> -    object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->dma), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "dma", &s->dma, sizeof(s->dma),
> +                          TYPE_BCM2835_DMA);
>  
>      object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abort);
>  
>      /* GPIO */
> -    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
> -    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
> +                          TYPE_BCM2835_GPIO);
>  
>      object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
>                                     OBJECT(&s->sdhci.sdbus), &error_abort);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
