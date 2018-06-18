Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4092026wrq;
        Mon, 18 Jun 2018 09:05:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJl/ReK1oAGBCVTya3zeft0MaM+gjKrBSn6CYY9MMaszrMWisZzTjJsSbrA1bdQwDWnHCnm
X-Received: by 2002:a0c:c981:: with SMTP id b1-v6mr11145428qvk.170.1529337933627;
        Mon, 18 Jun 2018 09:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529337933; cv=none;
        d=google.com; s=arc-20160816;
        b=0xah3tAwhkQCbCK8mIfRF7Tl4qLPFF2b4mgAkKTJZfJz68iL/ZOpuYiYwH5vqOhVfI
         N0vvZwY/S9gkQyQCbZJSBbdtI6clbjkioqwLfQOk50L9KZMLAhL1CShWZA6s/hmjNIS1
         QTBV5lsJxvOtIYOzrucYNxwZ24ZshQW5TrLOxUEqBeZUuw0DZZoBjz0O4EYKlp1FUd9O
         FAqz4S6F0vcu6qyLJ9aYi8qHU2hMvSqU4ROmU5jX3KKtMDugC0etNBHeQSXjkY9h5VLe
         Ji0nshQ/tkjvCTwSFNBcMz4Pwdi8D3FxAe7xubDLZTIhDsmhiPjkR38GsF4T/WFfD2oI
         pDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=NN7t3Vy+baZEVc2S5VW13R2ECsvnMa8PFc8pBBo+nOI=;
        b=GP9d1rPsW+2mXiq1PYe0yXfCiT7gwSX2iW/+ao5p/Z5HXn5tnU5AEit45OQP80m/+2
         x/o63LzDmcrv16MtVy9vToBY2CPC0vXEl8pCfT4pYXfr24YxrRMVCvuB4q5Jgk7ZHzCc
         7TUHBr3qLoRGVVDVrQwG93CujaXEWKffHqhbl0j7qKPCqbd/my855WVdVMKE7K3h2k3u
         qBORc8HYS3T2B2UlKc/Tm3DydSdFtlyf4TBTlG29zIeSi20OvU2uEQ5UwBS8LZay2NzM
         qg/5rSxpySn8/D/MAJdax4rcX9ANuxOmtzyiUhWhXyS85BvDwxISQ6IUBOxyaXNofY5F
         4mpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34-v6si4838647qvp.83.2018.06.18.09.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 09:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUwer-0003gM-4a
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 12:05:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fUwbm-0001QR-BZ
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 12:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fUwbj-00057p-6R
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 12:02:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44520 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fUwbi-00056k-S0; Mon, 18 Jun 2018 12:02:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53399401EF0D;
	Mon, 18 Jun 2018 16:02:17 +0000 (UTC)
Received: from [10.36.116.92] (ovpn-116-92.ams2.redhat.com [10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 420447C5B;
	Mon, 18 Jun 2018 16:02:12 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-7-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9d6c5256-289c-6e64-c141-d5ff2f9f121c@redhat.com>
Date: Mon, 18 Jun 2018 18:02:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 18 Jun 2018 16:02:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 18 Jun 2018 16:02:17 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] hw/arm/bcm2836: Create
 proper bcm2837 device
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
Cc: patches@linaro.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0yaJsWsE/QB2

On 13.03.2018 16:34, Peter Maydell wrote:
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
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/bcm2836.h | 19 +++++++++++++++++++
>  hw/arm/bcm2836.c         | 37 ++++++++++++++++++++++++++++++++-----
>  hw/arm/raspi.c           |  3 ++-
>  3 files changed, 53 insertions(+), 6 deletions(-)

 Hi Peter,

if I've bisected it right, this patch introduced a new way to crash QEMU:

$ aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest \
    -nographic
QEMU 2.11.50 monitor - type 'help' for more information
(qemu) device_add bcm2837
Device 'bcm2837' can not be hotplugged on this machine
(qemu) device_add corgi-ssp
Segmentation fault (core dumped)

Not sure why this is happening, though, I can't see anything obvious
wrong with your patch.

 Thomas



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

