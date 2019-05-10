Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp231633wrg;
        Fri, 10 May 2019 13:23:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHbfb4PYkLnUILJaIq0jSIRDI8j3oV0XkojAdDQiPUOs6O8E8bdZXi+1AXDFu92z45STkH
X-Received: by 2002:a50:982f:: with SMTP id g44mr13685804edb.278.1557519784413;
        Fri, 10 May 2019 13:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557519784; cv=none;
        d=google.com; s=arc-20160816;
        b=0dFobMQvZlrnnV50tFjNGnthkgRVL4LeZqyCHm2dqneerstxzdX+79W/KX/inVmMd2
         WyFuXB9XZUfNh13VQK6NhKbOL25oN1AvgYH30BOGx6kXh1SLaQYzTyykcnn8JwqCFZm4
         hGWvXXyKA/FVXuRHqcu580KWCn3XNIqXpNS1gI89UvTcNDDvBXUdVg93jMmgCWD4rEW8
         +B/Xhnvabx2da2uxyZo3rOlC6Yb9idDAmVEKPETyG0y1Cz0rXvRaQdpyrwOT8KsToyOc
         1ROz1PePbfAmVGSFGtHerc+hNpXx+zxXs2KPTODW8p+/e7Du/dHNbYEHzyYvri+5xjj1
         3N8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=dG+5XkjYpfb31n9hDGIgexMD8T01cWAi4HgH6rmltFg=;
        b=lOamlkgs0egAb72X9fnFKZMvKYRl4+t1yuvh3nWU3v9gVO7GXJ+P+k7JlH00CkbxKU
         76fJg8JwH/kYH1QQWWRgy84dHvLf4wrS7jw/EutrOMZLrzkCjOmhrIF7Q9A1R4M4JV0/
         MxeWB/w+9lpye5KHomCxTGURwEHTD5wBlb+ltdh+k0iRN1YsuwBDfBuUBiM5fhz6vCdu
         vPtKsRmWgEE7ByI/rJtyp5bDhYDY+8nL7lLF2ph12F//2WIMxAX7IdRyUUY3d5aUlHl1
         GniSZFdu+d/oPaslAKykCrBZdvJ/78MVZ5j6e6Qm/TAJ3C5zqYgH7zKnnboGYVU3DC4O
         VYmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hTUNia0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si1150552edh.128.2019.05.10.13.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 13:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hTUNia0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:49473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPC2p-0004q4-DP
	for alex.bennee@linaro.org; Fri, 10 May 2019 16:23:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPC2X-0004ou-Gf
	for qemu-arm@nongnu.org; Fri, 10 May 2019 16:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPC2U-0002Db-Lr
	for qemu-arm@nongnu.org; Fri, 10 May 2019 16:22:44 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:42146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hPC2Q-0001vD-7U; Fri, 10 May 2019 16:22:38 -0400
Received: by mail-lf1-x141.google.com with SMTP id w23so5009593lfc.9;
	Fri, 10 May 2019 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dG+5XkjYpfb31n9hDGIgexMD8T01cWAi4HgH6rmltFg=;
	b=hTUNia0DyFa9Mzgppxdw3wd9VxM9XFmeXnTMH5XttnariS+eZ737S034QlZxGbC+SN
	RH0vYgWRQeenA751UrG/aLsqgYyGpjpf7R6X/IwOJ/V5QBglRR7kP1mJCUMIvQ3UdNP9
	veb8cCD0NgafeD758q2i7IK0RnM6uoIm93nuElenn5O2PWiJaEBjaehIL8ge6o2Ls9ps
	y/UmQF9P4tFNv7aL+zfOHHrb2Zcl/P2adi1H3vEvqwCnK2z6R+k5z9Z69c0pc/H+pGI2
	ASqaIuwrWqMiu1TZ9/eZIZhEjPBQFLfh2ykW540oFcMIxKBpJC4BGvKDx7054EQWAfs9
	IMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dG+5XkjYpfb31n9hDGIgexMD8T01cWAi4HgH6rmltFg=;
	b=fyNhuQXZK9U0PsYakwYk90lz/h45TjfthM6G9w5N3VCf+ItWnHcgiPxog9TgrwHNNg
	TBmZiqzOTTUOLNqh6cFlzqYdbILkdnbbN89iucNJNrvGgdKuFmQ+7knw0R0rRsLCXq0T
	xyVDMIQhHC7YSoncy6G+bkY9YloTStQArPHkerJU94oZEhmomYNrkwy45JAICkhgbXvJ
	YsLwNo1BObiF/+Il+ac73utB/PMAgfoYnC+4NOV0aAS7nzSpxjGM5ynTU/5HpP9NKLeA
	Tfb5ESuYGVNwm3AeOnhTPOvECKN8Gt0ijSBcvjgIvY3nztVzEXwKcKdtJ0sWsRHCRr74
	AchA==
X-Gm-Message-State: APjAAAXly2VMBy+Ek7ouZizmDFiUZHi5uLK4g1nhDa0UI0wCE8xwB9Hz
	tZSsEHTlWuFoZSNx7ObqzRsirSYCc5c4kcGpfxA=
X-Received: by 2002:a05:6512:309:: with SMTP id
	t9mr6967971lfp.103.1557519756228; 
	Fri, 10 May 2019 13:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-7-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 May 2019 13:20:28 -0700
Message-ID: <CAKmqyKNYHOiHX-Eh6EYm4ZYYhSQAMLqwkHiUs1pwDYFZY0Kfcw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Paul Burton <pburton@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEJKcdBBLGIg

On Tue, May 7, 2019 at 9:36 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
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
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                           child_type, &error_abort, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  |
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                            child_type, errp, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
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
>  -   object_initialize_child(parent_obj, child_name, child_ptr, child_siz=
e,
>  -                           child_type, errp, NULL);
>  +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
>  +                         child_type);
>      ...
>  -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
>  |
>  -   object_initialize_child(parent_obj, child_name, child_ptr, child_siz=
e,
>  -                           child_type, errp, NULL);
>  +   sysbus_init_child_obj(parent_obj, child_name, child_ptr, child_size,
>  +                         child_type);
>  -   dev =3D DEVICE(child_ptr);
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
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> +    sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835=
_IC);
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
> +    sysbus_init_child_obj(obj, "fb", &s->fb, sizeof(s->fb), TYPE_BCM2835=
_FB);
>      object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-=
size",
>                                &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
>
>      object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abort)=
;
>
>      /* Property channel */
> -    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PR=
OPERTY);
> -    object_property_add_child(obj, "property", OBJECT(&s->property), NUL=
L);
> +    sysbus_init_child_obj(obj, "property", &s->property, sizeof(s->prope=
rty),
> +                          TYPE_BCM2835_PROPERTY);
>      object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
>                                "board-rev", &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
>
>      object_property_add_const_link(OBJECT(&s->property), "fb",
>                                     OBJECT(&s->fb), &error_abort);
> @@ -86,32 +78,27 @@ static void bcm2835_peripherals_init(Object *obj)
>                                     OBJECT(&s->gpu_bus_mr), &error_abort)=
;
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
> -    object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHOST=
);
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
>                                     OBJECT(&s->gpu_bus_mr), &error_abort)=
;
>
>      /* GPIO */
> -    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
> -    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
> +                          TYPE_BCM2835_GPIO);
>
>      object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
>                                     OBJECT(&s->sdhci.sdbus), &error_abort=
);
> --
> 2.20.1
>
>
