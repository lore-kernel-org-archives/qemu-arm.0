Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4709797wrh;
        Wed, 8 May 2019 04:24:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyopbyo6+vcxrH7tW5uI+ltvp5n9HZFffxoh3pKAGjZbamHkiVHz18LKbzUrUVvHA1ayIpF
X-Received: by 2002:a7b:cf17:: with SMTP id l23mr2739946wmg.51.1557314679556;
        Wed, 08 May 2019 04:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314679; cv=none;
        d=google.com; s=arc-20160816;
        b=Xkf+q4LzJFny+2zPQL6iZJzddYpLe18GuZTtXtXuelTgsyXhEazsSMXpTWuuQa+UxI
         87dspWLnO0RZCQxLPjCJqDYoXyxNQ0Q+HeGCT1kCAZG4f58zsaDvxkW2bYXJQOaKCSVE
         C1h2nog0fVKZ5GLOas4DfmQF3OehQeGmw/yCvDN7nCWdjCGTuiDS6IabQ4lGRuODuTxI
         Mf1i5eKp1cJzc6XcdsOiKMpkdeD0RVgC30W4s/Yd9aiQkUh+Emfvu/08D/pPJvmyyOMb
         1G0ahFhRph1M6qp44j8nTTnsjDSjK8xUkv5kg/7DREWCHyaAuaWthzFcUAXdS9Xbs8yK
         33Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=oiEVdit+cpH2GuKWB0ff/Ty4GRLoY1rtT38uhw2uAB4=;
        b=myIDvFHi53ZktAswp2PpSd3RTVN5oqOK+GfNduPlz4nN2OubUdkkiVyhoJdCtUsEsc
         bMWcDMjiYOGLX1PeRUKHLbamWQWbw2x8lJrsfBTpGy/t64FCUKtOk29uiXvWUvTB2Omx
         WTlXZnzi6P2FEqWFzp7SomabQM/QCAtmdaIh5KfCmbNym7Fy934PbX0JCQJOdN+eAX/n
         kWndGq6tG+sHVKT8ApdaU9P//OaKv1ugpLOP7EF2NxbHM1GWXgqVldJNj+ACcr5Z0Yf6
         9SIR8DQOaJtTm2y0sqrzWoifaszRQ36m2f4m3aqbhx6Zs0sfX8I96hGu21Nt/az/Dg2y
         LxZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si981573wmg.195.2019.05.08.04.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKgg-0003cP-GY
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:24:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKd3-0000kZ-MK
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKd2-00079h-JU
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:20:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKd2-000795-Ch
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:20:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id o4so26705157wra.3
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oiEVdit+cpH2GuKWB0ff/Ty4GRLoY1rtT38uhw2uAB4=;
	b=ScDTPemlmM9ahsDWwMn97XgjJYEYW+dsW0chaB36AzYvFE7wqfLloCfpy/h1gAzh26
	X7eSE86MfFDNc5qwy2DuMvrmLui4+3sNWmyLlhDyecYPjRCtvUllzAtnFVYgFYvipr7/
	822jjDIj7B0pFROeB6eAmDYWvH7MAwaieLSJXYRDruiKDh9mCGa51lwNeQaUX1hVqv4z
	rIVHFM2x0v4pjC8dBYXGZIrTvnFlW/o3zzOVRk05mtscTivW92+8SyPrJLvof+0GfX6b
	m7vfDK0Z0Omjd9TrDJ+pK/7qGwSBAYDHNyZtbD3nMsfJQSKA1E/SX6v4elV/wUh/2kPK
	NT8w==
X-Gm-Message-State: APjAAAURzyE6Fhkcbq6UmtYvQY/vf0ZFsm/txX9Yuw4pXvz/oAgQ22gj
	FhjWq7eJ60aINPNQdNtk7VAEEg==
X-Received: by 2002:adf:f70a:: with SMTP id r10mr26000670wrp.96.1557314451276; 
	Wed, 08 May 2019 04:20:51 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	h16sm33014229wrb.31.2019.05.08.04.20.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:20:50 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-17-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b08740c8-96fc-e336-78cd-66d595d6be98@redhat.com>
Date: Wed, 8 May 2019 13:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-17-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 16/16] hw/intc/nvic: Use
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
X-TUID: it74V1RgdyEf

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
> We let NVIC adopt the SysTick timer.
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
>  hw/intc/armv7m_nvic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index fff6e694e60..2334fe51426 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2568,9 +2568,9 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>           * as we didn't know then if the CPU had the security extensions;
>           * so we have to do it here.
>           */
> -        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_S]),
> -                          TYPE_SYSTICK);
> -        qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]), sysbus_get_default());
> +        sysbus_init_child_obj(OBJECT(dev), "systick-reg-s",
> +                              &s->systick[M_REG_S],
> +                              sizeof(s->systick[M_REG_S]), TYPE_SYSTICK);
>  
>          object_property_set_bool(OBJECT(&s->systick[M_REG_S]), true,
>                                   "realized", &err);
> 

Nice, the M_REG_NS is already using sysbus_init_child_obj. :)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo
