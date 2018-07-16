Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1194979wru;
        Mon, 16 Jul 2018 00:16:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfjIscYPxqHP4sBnw50mEPhkBpFAj36dVkYCALoV5GFTLOEhe0g9HOnz7JBaRbh73rDlLr4
X-Received: by 2002:a37:9986:: with SMTP id b128-v6mr13018645qke.288.1531725419836;
        Mon, 16 Jul 2018 00:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531725419; cv=none;
        d=google.com; s=arc-20160816;
        b=UeCvdOJE4RRASLKf6phOWo75miFrWfFrQksUYwHZkpXrZJvxZuFaInTjXixXeqzMpn
         p5oo/0zh72tzl7Bn2EWMPsh+lCQSCMwrrD/hKDujgRXz/Vmf5klE5IRln7r7c8GI7YT9
         4HE6ZmmkIBrqYtxPJ10IsM4JAVKrQEb/C2CxDag+ipGU0bkksre2f9JCGBxziUMHG1p2
         RxDik3NmL1LfMEq0TFkjDzYGLFrYZ1KKkvaR+gaXDDEnAKkScvfPj/914/Q9wTZXoVmr
         HMe+oT/JKrtLcACGN1XGscB8RpssRzts2OjDtnz/zgbC1M0VEuOHECxgHuhIMxOeej9v
         omtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=cCcdpihbZLyNdxCWrO6JKB3sb7SkHf2QSgkkWlcToVE=;
        b=KFtmVwAF4rLS4nb17s9jwyso90LOm8NYd/YOzMUQfDsGneHJo+JU1gtpvV5YoONpWD
         srCbwgIhCgP2AmZeJsTvADoTuFIJu1S8pr9DZZikPKUbKQaFT47TRZQDnTFvPLPdfkPx
         OoPrRSEMZKTe3DcVyCuZ/dbTz9DNdT+a6F+hIVB83zzrvln/pNQ3GuxZixXoIKShHNiQ
         ytoEWsndrDikpa6mpTFexx742JetdmCHUHfsYf4DSfqw7GjsLKbxs97QHtB6sFmFnlGB
         uFo4JjcQxCVZjsq6uUwFoqPdHhoeAoGdGI+ImDHvBSoY04J+1EZ83mbJPIvsTEkKXHBn
         TqZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22-v6si1841220qtk.261.2018.07.16.00.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 00:16:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fexkh-0004Rc-96
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 03:16:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fexkX-0004OS-1y
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 03:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fexkT-0001iI-1f
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 03:16:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51722 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fexkS-0001i5-R4; Mon, 16 Jul 2018 03:16:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5318A77885;
	Mon, 16 Jul 2018 07:16:44 +0000 (UTC)
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 654CA2026D65;
	Mon, 16 Jul 2018 07:16:42 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-2-git-send-email-thuth@redhat.com>
	<20180713225718.GP914@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <73868f86-eb59-568f-24e4-7fc16e6cb426@redhat.com>
Date: Mon, 16 Jul 2018 09:16:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713225718.GP914@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 07:16:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 07:16:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/16] qom/object: Add a new
 function object_initialize_child()
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
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /PcA2p3ZX8K/

On 14.07.2018 00:57, Eduardo Habkost wrote:
> On Fri, Jul 13, 2018 at 10:27:29AM +0200, Thomas Huth wrote:
>> A lot of code is using the object_initialize() function followed by a call
>> to object_property_add_child() to add the newly initialized object as a child
>> of the current object. Both functions increase the reference counter of the
>> new object, but many spots that call these two functions then forget to drop
>> one of the superfluous references. So the newly created object is often not
>> cleaned up correctly when the parent is destroyed. In the worst case, this
>> can cause crashes, e.g. because device objects are not correctly removed from
>> their parent_bus.
>>
>> Since this is a common pattern between many code spots, let's introdcue a
>> new function that takes care of calling all three required initialization
>> functions, first object_initialize(), then object_property_add_child() and
>> finally object_unref().
>>
>> And while we're at object.h, also fix some copy-n-paste errors in the
>> comments there ("to store the area" --> "to store the error").
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Potential candidates for using the new function, found using the
> following Coccinelle patch:
> 
> @@
> expression child, size, type, parent, errp, propname;
> @@
> -object_initialize(child, size, type);
> -object_property_add_child(
> +object_initialize_child(
>                            parent, propname, 
> -                          OBJECT(child),
> +                          child, size, type,
>                            errp);
> 
> Some of them (very few) already call object_unref() and need to
> be fixed manually.
> 
> Most of the remaining ~50 object_initialize() callers are also
> candidates, even if they don't call object_property_add_child()
> today.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index bb9d33848d..e5923f85af 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -189,8 +189,8 @@ static void aspeed_board_init(MachineState *machine,
>      DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
>  
>      bmc = g_new0(AspeedBoardState, 1);
> -    object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
> +    object_initialize_child(OBJECT(machine), "soc",
> +                              &bmc->soc, (sizeof(bmc->soc)), cfg->soc_name,
>                                &error_abort);
>  
>      sc = ASPEED_SOC_GET_CLASS(&bmc->soc);
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index e68911af0f..994262756f 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -106,11 +106,11 @@ static void aspeed_soc_init(Object *obj)
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      int i;
>  
> -    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu",  &s->cpu, sizeof(s->cpu),
> +                            sc->info->cpu_type, NULL);
>  
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
> -    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
> +    object_initialize_child(obj, "scu",  &s->scu, sizeof(s->scu),
> +                            TYPE_ASPEED_SCU, NULL);
>      qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
>      qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",

Thanks, that's definitely something we should do for 3.1! But for 3.0, I
think we better only focus on the ones that cause reproducible problem.

And the spots that also use qdev_set_parent_bus(...,
sysbus_get_default()) should use sysbus_init_child_obj() instead.

 Thomas
