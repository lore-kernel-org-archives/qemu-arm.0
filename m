Received: by 10.28.91.67 with SMTP id p64csp1292793wmb;
        Tue, 13 Mar 2018 16:38:46 -0700 (PDT)
X-Google-Smtp-Source: AG47ELva9RhqOBQTjyeod8iAIlRgh8uhssi8ybL/tho+5zDANIeA4kj36dkNFl+FZI0w2jWo5TqT
X-Received: by 10.55.46.130 with SMTP id u124mr3938531qkh.61.1520984326005;
        Tue, 13 Mar 2018 16:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984325; cv=none;
        d=google.com; s=arc-20160816;
        b=FvnH21/lIvX/ZYZgEW4PRjWOX+n4LVqrMwPZUMR05Jnu6ZFKRvTDxhu8rxAZsTHqI1
         qLZN1WecBwccmC4BP3avsIYXy6wMuC1NP799nAN//ZdPky8o9k5b103+G+t7No2/fKb3
         pCz8Q5sGz/KgL107CTW43SISYdB/oi6d6Z2rNl4rxk8ktWBA+na4ieK9a8ScEJtBje6I
         kdIZIVPzXbF9FzXFemJRz1JAdOmRGtxbAvUAkuh5Y4963ts2g/kbLj101n84xqYqmU15
         q35puoYnaPteLRP3qWb+b2erQmU2Mdl5IjY45LvwZVYKK1haIgrLNooHdfa2PWQk8Jgy
         f2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=RInQLjRd2be//vO7OoFY5u9jtw//9xO+5lc/41/ZmqM=;
        b=bpZ20tXfF4ZIxw9dSumfCShmDNMQzePTj8y8pkL1vjUXqQ1+j0hYMwxbhneFr5QnTU
         EZKkkPmweupJRQoj6IyrBQLroCMlBpp+UKeX8hOekRRJ+NFGK3/al1Z0xHNA+9a713Ov
         uKLpYvkYqOnjzUIQOr6LbDgKNYlPhzc6IEoo9NaZBCnuFkHFTQ1OAx+mf2hyr5pnus63
         /s6V9sBtlTjBai/UKJfgHmizrVQ8TqvnE4gMqF6405eun7kP0j48uxmL4nAWKsdQhJN6
         y/pfTcLU8cc77wMalyD4DsPjyLlDR9oFMRVZKcd2KBwAnmiUUV6JCkX4/WMv7m7fLLHl
         85Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thEkri0w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si1387619qtt.479.2018.03.13.16.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thEkri0w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtVF-0007YM-CZ
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:38:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evstw-0008Eg-ER
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 19:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsts-0002oc-EN
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 19:00:12 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:51181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evsts-0002oG-49; Tue, 13 Mar 2018 19:00:08 -0400
Received: by mail-wm0-x242.google.com with SMTP id w128so905567wmw.0;
	Tue, 13 Mar 2018 16:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RInQLjRd2be//vO7OoFY5u9jtw//9xO+5lc/41/ZmqM=;
	b=thEkri0wrR6ampQOQunwe0xjEJyR3cNkUtBKjKvWI57Tij/TgGtkKJtiobHU0QQNvK
	x87TVVGiGDGXZYEi6DFcKWoBa+omOrTNaz3zwx+CqlsXW0d8Ui11efFSXebMEhZO7Bs/
	pd0Pl5f1MMC1fpvkyzekL0hLXMMz3BdnsiXkU10Kz9Yl/uMMYyH2mqNf20ViXMuSRwHO
	E21FE2auxJEXMwpqxVIq4GFwv9hPiq8lL1zzQMYtoyqbAL62uPw3G09R1+6NcG/6cZiC
	Pu/uXLH0jq/jqhX5axXjZ6wI3j/BUGXM8K0FuD+H09rce7r1N0Mp+znimzJ0ZfmAxQMh
	xzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RInQLjRd2be//vO7OoFY5u9jtw//9xO+5lc/41/ZmqM=;
	b=UaB/lOnl+MfrnAAI+pNlW3C/qeXIbq/fi/gy0ag6K0SYR8Z2KqdwHhfTfV8CVdAbwB
	Jo753dfgatVa4HngIG5HE23YRnyJqIi7VjJpDzw9HeVUPLYiXeZ3PLalg3pjY/9mwTmK
	cEKcJY/o08bO4L3dNs/WoNV0lQ+s9qpVpgYmM+5snVaecWT32BUZ6Sxu5zQvwcYWzrn0
	oepmOqGsWxxr1enkjJc9bd3mRqDE2AlH/RA4wM+q0rcXARn/BVMbgoYgwc4Rp6bu8ak6
	UQiG12UpLbjK+o6xOpHyeqh+pDXkGe9ZkYv2ELayE8v4TJ2Fk+ufnO8ClsdjQYR8wp4Q
	7UJA==
X-Gm-Message-State: AElRT7F63fnZ6OEQya3k3UzbzghksjFCRfVC+6S5QOKI/qZS4yhFFRxh
	7H8H5pbc8mOEgeIkKuymxzM=
X-Received: by 10.28.217.205 with SMTP id q196mr2133299wmg.149.1520982006948; 
	Tue, 13 Mar 2018 16:00:06 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	g38sm1605726wra.77.2018.03.13.16.00.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:00:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a16c5078-cae8-f9ca-c6bf-ab60937c0dc3@amsat.org>
Date: Wed, 14 Mar 2018 00:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH 6/9] hw/arm/bcm2836: Create proper bcm2837
 device
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VX3TeSgAE4L3

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> The bcm2837 is pretty similar to the bcm2836, but it does have
> some differences. Notably, the MPIDR affinity aff1 values it
> sets for the CPUs are 0x0, rather than the 0xf that the bcm2836
> uses, and if this is wrong Linux will not boot.
> 
> Rather than trying to have one device with properties that
> configure it differently for the two cases, create two
> separate QOM devices for the two SoCs. We use the same approach
> as hw/arm/aspeed_soc.c and share code and have a data table
> that might differ per-SoC. For the moment the two types don't
> actually have different behaviour.

:)

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/bcm2836.h | 19 +++++++++++++++++++
>  hw/arm/bcm2836.c         | 37 ++++++++++++++++++++++++++++++++-----
>  hw/arm/raspi.c           |  3 ++-
>  3 files changed, 53 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 9a10a76631..93248399ba 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -20,6 +20,13 @@
>  
>  #define BCM283X_NCPUS 4
>  
> +/* These type names are for specific SoCs; other than instantiating
> + * them, code using these devices should always handle them via the
> + * BCM283x base class, so they have no BCM2836(obj) etc macros.
> + */
> +#define TYPE_BCM2836 "bcm2836"
> +#define TYPE_BCM2837 "bcm2837"
> +
>  typedef struct BCM283XState {
>      /*< private >*/
>      DeviceState parent_obj;
> @@ -33,4 +40,16 @@ typedef struct BCM283XState {
>      BCM2835PeripheralState peripherals;
>  } BCM283XState;
>  
> +typedef struct BCM283XInfo BCM283XInfo;
> +
> +typedef struct BCM283XClass {
> +    DeviceClass parent_class;
> +    const BCM283XInfo *info;
> +} BCM283XClass;
> +
> +#define BCM283X_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
> +#define BCM283X_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
> +
>  #endif /* BCM2836_H */
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 1d1908654b..07d2705f96 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -23,6 +23,19 @@
>  /* "QA7" (Pi2) interrupt controller and mailboxes etc. */
>  #define BCM2836_CONTROL_BASE    0x40000000
>  
> +struct BCM283XInfo {
> +    const char *name;
> +};
> +
> +static const BCM283XInfo bcm283x_socs[] = {
> +    {
> +        .name = TYPE_BCM2836,
> +    },
> +    {
> +        .name = TYPE_BCM2837,
> +    },
> +};
> +
>  static void bcm2836_init(Object *obj)
>  {
>      BCM283XState *s = BCM283X(obj);
> @@ -156,25 +169,39 @@ static Property bcm2836_props[] = {
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -static void bcm2836_class_init(ObjectClass *oc, void *data)
> +static void bcm283x_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> +    BCM283XClass *bc = BCM283X_CLASS(oc);
>  
> -    dc->props = bcm2836_props;
> +    bc->info = data;
>      dc->realize = bcm2836_realize;
> +    dc->props = bcm2836_props;
>  }
>  
> -static const TypeInfo bcm2836_type_info = {
> +static const TypeInfo bcm283x_type_info = {
>      .name = TYPE_BCM283X,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(BCM283XState),
>      .instance_init = bcm2836_init,
> -    .class_init = bcm2836_class_init,
> +    .class_size = sizeof(BCM283XClass),
> +    .abstract = true,
>  };
>  
>  static void bcm2836_register_types(void)
>  {
> -    type_register_static(&bcm2836_type_info);
> +    int i;
> +
> +    type_register_static(&bcm283x_type_info);
> +    for (i = 0; i < ARRAY_SIZE(bcm283x_socs); i++) {
> +        TypeInfo ti = {
> +            .name = bcm283x_socs[i].name,
> +            .parent = TYPE_BCM283X,
> +            .class_init = bcm283x_class_init,
> +            .class_data = (void *) &bcm283x_socs[i],
> +        };
> +        type_register(&ti);
> +    }
>  }
>  
>  type_init(bcm2836_register_types)
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 58c6e80a17..f588720138 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -136,7 +136,8 @@ static void raspi_init(MachineState *machine, int version)
>      BusState *bus;
>      DeviceState *carddev;
>  
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM283X);
> +    object_initialize(&s->soc, sizeof(s->soc),
> +                      version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
>                                &error_abort);
>  
> 
