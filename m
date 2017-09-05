Received: by 10.223.172.38 with SMTP id v35csp1441221wrc;
        Tue, 5 Sep 2017 06:45:05 -0700 (PDT)
X-Received: by 10.55.160.140 with SMTP id j134mr5088773qke.274.1504619105534;
        Tue, 05 Sep 2017 06:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504619105; cv=none;
        d=google.com; s=arc-20160816;
        b=y5OLfuCo6/IO87AMdVOZ/2e7Z0Jtv+AhJurwAsWNXtKN9A50ODmSJ/cc4bLoD1Mht3
         fvZBFhfTW5Z8sb9oM6gdKcU0YyCVh5gOtzAz9U/bAZW0/AV1URLuc/JO3LjSzCNYLtO4
         omBjJP1AKAJZvheGYd/rQCiAvZNaYfX0EP5ll2eiGmqyRyVp8Mrg1RIE37UN4fyVHOTa
         z6s57UwR7OeKR2QHHfB9LX9apqfPfLmBqa1AuITECnpzApxhBqeUwZ0R1myueFHDnJbE
         puH664bZRjSyh0zx3zOh+jQZ/SEKNAk5LBi61mnPz4wMx/y0V6DmYTUka14EHBWAb9k1
         lpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=3RprVe9JoM5qE4JrrAZ3A2PG+Wwne1ll4mqZ0QMsbnU=;
        b=01hPeBxMbNlCRqCabIpNpQSvDEvmlG+y5jkfxqfNqTnQHuxEfA60nGmEWWgKgf+U9R
         pG+ksYuD7wJj2hv9RvqcCj3A80/aDhXps862w9JUrRcqKediqSjvA/LURVDkNkyB3tSk
         5viYxGDreqR31YqCEVR+LlA7ccMXIMrD5D7/yFWaXbMqUSvlt3WXQ+zjQpZWteaW4g/Z
         qTE8mY+Yt9yYjMygphTpZ1XbrRR4WIn3jvj1tO+/zWZnOQADei+ecubrZEgyhiytl4TV
         dCtewFhFdwOEzhmpqt194bGZzXEcTlzRytbrhfthqLgjaeLd/hobFWidJ0PNq0VZr1t1
         wyNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YB4U9+9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s89si462777qks.258.2017.09.05.06.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YB4U9+9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpEA3-0002pj-8j
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:45:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpE9v-0002dl-RG
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpE9r-0000OD-60
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:44:55 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpE9r-0000O2-0M; Tue, 05 Sep 2017 09:44:51 -0400
Received: by mail-qt0-x242.google.com with SMTP id 12so2206675qtn.5;
	Tue, 05 Sep 2017 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3RprVe9JoM5qE4JrrAZ3A2PG+Wwne1ll4mqZ0QMsbnU=;
	b=YB4U9+9eJZJYxh1HF0vMxDc0o5p74zcVj2A3JdKKU80zYs6G9z3QVagHWIeT3VfeZu
	rv//mMwX5bJDTBqRsspmh76yy/AwnUSRoHNgOKGtTeOAyaT+3noanVAl3DCoOA0LIuRl
	BBq4zL9O8xXzD81qafWj25nfp+WUCBa4ph+brRKO3W1Kmr6qSIBDf5G449t43xXn7Mhq
	IcKKxvW26iTIPW96HpxJIhZD4v4ViIjWD0KjYLGNrBlA4BHYKNBNFstuNuWRQbCx6+QN
	jyhMZvozV8l67hO2NQXvl3tr4L8iYCS/NygeLFNdxxmtH23S8dg/bvnJkfOc1yK4RLW5
	BaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3RprVe9JoM5qE4JrrAZ3A2PG+Wwne1ll4mqZ0QMsbnU=;
	b=mYbTHlC4YByqs1f/8gFNvzlPdfahd5VFXM2NCdrp1eO1zFMa9vOoOln56a5HmQyHwO
	Os9WlIhGqsV1AcI9uu5h0vChQfozvGH6xsUectBX5hmv6MzxfUuLL4ouDoB9RY8UbRvD
	FsAHrAEnU5dWivSHIy+xhLawMGhH/jyTqUcW0JOgefL9pOayLS8AMHK1gMXNGu30YAiQ
	9hvUIA/SIloaefwbNV6JAOl0BVuajDFJzUS4+ZRR+ZW0sU5iVz1iQZE5LyWxIurmoIG3
	DVZm7A0imSt8plc2/0Su5BknB23bjLpnCDvenWhX7t13QydF8DgZyANI3Nku3JIzwQDp
	ZDbA==
X-Gm-Message-State: AHPjjUjKLXuea9h2vdOMEYg9c+PEejtnLlw2Bw8MvTDTB5/A/uY089pP
	P3+hdbr45isMnpfMdtyrTQ==
X-Google-Smtp-Source: ADKCNb7isWhYguCxi8s1pdCkTRbMF3igGdWlXV9yc/b5UNTKh8KCBTZLBcfwWCvjM9MV45749bwD9A==
X-Received: by 10.237.62.129 with SMTP id n1mr5605593qtf.39.1504619089857;
	Tue, 05 Sep 2017 06:44:49 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	i124sm380739qkf.84.2017.09.05.06.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 06:44:49 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170905131149.10669-1-famz@redhat.com>
	<20170905131149.10669-4-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a628d888-f1e8-2d7f-034c-095c29818ae4@amsat.org>
Date: Tue, 5 Sep 2017 10:44:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170905131149.10669-4-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH v6 3/6] gicv3: Convert to DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 46d6Z31sEl6p

Hi Fam,

On 09/05/2017 10:11 AM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 1f8991b8a6..39903d5eab 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -120,17 +120,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>       qemu_add_vm_change_state_handler(vm_change_state_handler, s);
>   }
>   
> -static void kvm_arm_its_init(Object *obj)
> -{
> -    GICv3ITSState *s = KVM_ARM_ITS(obj);
> -
> -    object_property_add_link(obj, "parent-gicv3",
> -                             "kvm-arm-gicv3", (Object **)&s->gicv3,
> -                             object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
> -}
> -
>   /**
>    * kvm_arm_its_pre_save - handles the saving of ITS registers.
>    * ITS tables are flushed into guest RAM separately and earlier,
> @@ -205,12 +194,19 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>                         GITS_CTLR, &s->ctlr, true, &error_abort);
>   }
>   
> +static Property kvm_arm_its_props[] = {
> +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",

moving TYPE_KVM_ARM_GICV3 to kvm_arm.h and using it here:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                     GICv3State *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
>   
>       dc->realize = kvm_arm_its_realize;
> +    dc->props   = kvm_arm_its_props;
>       icc->send_msi = kvm_its_send_msi;
>       icc->pre_save = kvm_arm_its_pre_save;
>       icc->post_load = kvm_arm_its_post_load;
> @@ -220,7 +216,6 @@ static const TypeInfo kvm_arm_its_info = {
>       .name = TYPE_KVM_ARM_ITS,
>       .parent = TYPE_ARM_GICV3_ITS_COMMON,
>       .instance_size = sizeof(GICv3ITSState),
> -    .instance_init = kvm_arm_its_init,
>       .class_init = kvm_arm_its_class_init,
>   };
>   
> 
