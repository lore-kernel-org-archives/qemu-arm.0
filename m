Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7085152wrt;
        Tue, 22 Jan 2019 03:01:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5TJWRlKWj9YlCUan3i/ALW2g2v6hDiMVpOUrTeq99a/gUdhhLV0jLSBsynYKcLbfhusiya
X-Received: by 2002:a5d:528e:: with SMTP id c14mr32042916wrv.236.1548154918729;
        Tue, 22 Jan 2019 03:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548154918; cv=none;
        d=google.com; s=arc-20160816;
        b=0CI0YvnLFg7MBFWyE4yKQQzUE1ibPSXWWR7TW++Zkpyg9neH3nqpX6ctVXcAbC4T7V
         rNFQI4GQtAPkm9DUkh8zUOrvJV36Kw/n5IgpOZuhxtE8zi1/aOHS6Xt5HEB40aIor0Cf
         96LMg5svRCttpnSpSVAuY8D+5t9Eo3Q5tNGDFUwDgxECK1KAZCUMleXYhf3CBri4pPa3
         ySH80DsjRveS90UHeMRTuWo5EfWpQh7XnzJ5bSTDMSeLnb0l432WAc2F61sb0qDZcdxZ
         4I3TSdh8FVdDkB/ohP8IEEc7F07YPGnP6ErTCuSi6gufeRj4L/Jv/uBgwN3cd1x3GClf
         Mxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=qc3OnSPpbCO6/jYaQe15dOzBHjvEOeqCCZd+0BR4zyc=;
        b=wio8h86ungkuUTr8HIj3SCIjI59mEEy1qSINVIfB6pNKjkra07UWWGJ3JCyFNUUIpx
         0B7zpLMICLjc6TbW36Va2ywO7GtmzhHjqo1WydEPQHoagQYUOvCwwwLvqqkwomBi1tBr
         bgNAkj7cDJW3LrILOMqTNHnvNd95COLOudSvh6AZUPbHCDo0un+DMuc4T252Dgx4dkzw
         KtWqUTGHJUDJAasELJHrFewFc19T8Q6myigPyPpCBayd2oFg/q8Z6aXCQCxnrl96UU5d
         O3/Qjkn3oLjugj5TOLeBn3wQt1auwLjYLL6EAfK6lUFgr2a8p22bdWLemy7ga90RcySZ
         /m+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si32619976wme.181.2019.01.22.03.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 03:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gltob-0004vv-Nj
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 06:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltoM-0004v5-BD
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltoK-0007Eg-9l
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:01:42 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gltoI-000765-JN
	for qemu-arm@nongnu.org; Tue, 22 Jan 2019 06:01:40 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so26755523wrs.8
	for <qemu-arm@nongnu.org>; Tue, 22 Jan 2019 03:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qc3OnSPpbCO6/jYaQe15dOzBHjvEOeqCCZd+0BR4zyc=;
	b=b88cA5VwsUaeEIdZeXN1YM5/BUBecHIC28Asc07Xr/4McDDIQAsvYbi+YPFPIvpctg
	kwjULjNNITfgEINAgNWB/WPUd1XRJnQvT3Hl1kvJ3hQjlcLfK/QuxbX7i7QSG/2EsLQO
	ur721xoU/FfFL0+x+1yFTVoB2wgN6rSktSdI3ZAPIcAohj/7in6NO6qf+1QTIDFKVYp3
	xPgbg065hpn8ca7mFl6b4hLQjWIYDphaHU6+VRFJ57/A2Zww+p5c6YuwEPh6k9rHZ4AV
	z5ixTAtVU/Mm06loULrTei6+sWsDLgTTexWHuRlynebzKhfEdRBDbNf2VPDmpHXtTiSr
	et7g==
X-Gm-Message-State: AJcUukdpLJ+MtpfQXgliPuTIFkFuF+ouTKqNvCdrAEVS+HgjNe5pa7P4
	YYAGd8ncg65P0zXSeX+yRsym1Q==
X-Received: by 2002:adf:e08c:: with SMTP id c12mr30988258wri.199.1548154876952;
	Tue, 22 Jan 2019 03:01:16 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	a187sm49824750wmf.33.2019.01.22.03.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 03:01:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <60356aab-3e21-bf0a-3829-d643e5e7fa56@redhat.com>
Date: Tue, 22 Jan 2019 12:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/23] hw/arm/iotkit: Refactor
 into abstract base class and subclass
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
X-TUID: 439XCGpJQOKR

On 1/21/19 7:51 PM, Peter Maydell wrote:
> The Arm SSE-200 Subsystem for Embedded is a revised and
> extended version of the older IoTKit SoC. Prepare for
> adding a model of it by refactoring the IoTKit code into
> an abstract base class which contains the functionality,
> driven by a class data block specific to each subclass.
> (This is the same approach used by the existing bcm283x
> SoC family implementation.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h | 22 +++++++++++++++++-----
>  hw/arm/iotkit.c         | 34 +++++++++++++++++++++++++++++-----
>  2 files changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 9701738ec75..521d1f73757 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -74,15 +74,15 @@
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
>  
> -#define TYPE_ARMSSE "iotkit"
> +#define TYPE_ARMSSE "arm-sse"
>  #define ARMSSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARMSSE)
>  
>  /*
> - * For the moment TYPE_IOTKIT is a synonym for TYPE_ARMSSE (and the
> - * latter's underlying name is left as "iotkit"); in a later
> - * commit it will become a subclass of TYPE_ARMSSE.
> + * These type names are for specific IoTKit subsystems; other than
> + * instantiating them, code using these devices should always handle
> + * them via the ARMSSE base class, so they have no IOTKIT() etc macros.
>   */
> -#define TYPE_IOTKIT TYPE_ARMSSE
> +#define TYPE_IOTKIT "iotkit"
>  
>  /* We have an IRQ splitter and an OR gate input for each external PPC
>   * and the 2 internal PPCs
> @@ -143,4 +143,16 @@ typedef struct ARMSSE {
>      uint32_t mainclk_frq;
>  } ARMSSE;
>  
> +typedef struct ARMSSEInfo ARMSSEInfo;
> +
> +typedef struct ARMSSEClass {
> +    DeviceClass parent_class;
> +    const ARMSSEInfo *info;
> +} ARMSSEClass;
> +
> +#define ARMSSE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(ARMSSEClass, (klass), TYPE_ARMSSE)
> +#define ARMSSE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(ARMSSEClass, (obj), TYPE_ARMSSE)
> +
>  #endif
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 9360053184e..d5b172933c3 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -18,6 +18,16 @@
>  #include "hw/arm/iotkit.h"
>  #include "hw/arm/arm.h"
>  
> +struct ARMSSEInfo {
> +    const char *name;
> +};
> +
> +static const ARMSSEInfo armsse_variants[] = {
> +    {
> +        .name = TYPE_IOTKIT,
> +    },
> +};
> +
>  /* Clock frequency in HZ of the 32KHz "slow clock" */
>  #define S32KCLK (32 * 1000)
>  
> @@ -732,29 +742,43 @@ static void iotkit_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(klass);
> +    ARMSSEClass *asc = ARMSSE_CLASS(klass);
>  
>      dc->realize = iotkit_realize;
>      dc->vmsd = &iotkit_vmstate;
>      dc->props = iotkit_properties;
>      dc->reset = iotkit_reset;
>      iic->check = iotkit_idau_check;
> +    asc->info = data;
>  }
>  
> -static const TypeInfo iotkit_info = {
> +static const TypeInfo armsse_info = {
>      .name = TYPE_ARMSSE,
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(ARMSSE),
>      .instance_init = iotkit_init,
> -    .class_init = iotkit_class_init,
> +    .abstract = true,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_IDAU_INTERFACE },
>          { }
>      }
>  };
>  
> -static void iotkit_register_types(void)
> +static void armsse_register_types(void)
>  {
> -    type_register_static(&iotkit_info);
> +    int i;
> +
> +    type_register_static(&armsse_info);
> +
> +    for (i = 0; i < ARRAY_SIZE(armsse_variants); i++) {
> +        TypeInfo ti = {
> +            .name = armsse_variants[i].name,
> +            .parent = TYPE_ARMSSE,
> +            .class_init = iotkit_class_init,
> +            .class_data = (void *)&armsse_variants[i],
> +        };
> +        type_register(&ti);
> +    }
>  }
>  
> -type_init(iotkit_register_types);
> +type_init(armsse_register_types);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
