Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp329300ejb;
        Thu, 19 Oct 2023 00:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeK3ql26EY+jhG5a5ZFU9fblvxkyhy84WcOoL3OeUZQkfAnHyAz8/Hns7Ssipze8dNBUXX
X-Received: by 2002:a05:620a:4095:b0:775:9a54:a02b with SMTP id f21-20020a05620a409500b007759a54a02bmr1553422qko.64.1697700449785;
        Thu, 19 Oct 2023 00:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697700449; cv=none;
        d=google.com; s=arc-20160816;
        b=lZiOKU+j7KWgk9VRszWQmCv9Ktm/fQWk5Pzvc2JeeMW3MI3UiuRYKsgAXnRwtO6Q9i
         bamKIktzBV6SKWER1q60xnqr2gwYMFGaHTK6IS2KQ7KPHuS9yPwZYGcZovNCcFlagvJw
         +SvHErEligYOWjZOX+OKxEZUEB9YBhvHtgVnKTbtRH2xZ+GhgKAGNsgl++tEhkc0PNKh
         r6IRNjLIY8x+LrQAiH4hphtMwakoXr5kRUOUxBTxQFXe5oUF5uBvgBQnALA+AEI92TuY
         n4Dhi1g7V2ht23vgEcSImWeHcOqwR+TtdDCISAyzdmy6Ix94eWD3P4e/bc2nuz/GG2TD
         Mp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=OWfRhRyUDz8WlzkAqPLq6kMafxlxQnn3cQn33xjPW04=;
        fh=/Gu37Vr91t9MFY1Ts9oDksSE8ZDQNteBQkb4V4psqfw=;
        b=0/jEG/am5yfXHmNHsabolUafffTPGDn6A5sQhgLBHFfZ2wzxz3q2GerY7qFh7oNI8N
         tneL/ZR144Mko3Wh6gw9oH80TZWMNZOHOemJxB4G9mcPjCfQ8iKSbXxnZ/pqB9TRyAaq
         UUYv5T+P4E+hhJfiIuF55yuoHlg09+GKsc8WjDqNJVkJolHiL35lqvxk+y8iSZqMG44q
         eBoJMnvqUWA4o21OVmNIqBKjU4bj9iNgeuY9xpjeWkbN7IYpH6bZq3EoTCCCi+fBvCxV
         Skuq9YV+hXeBcHUIy0lJWG2kblQQ/348NIBMxVemk6UonFwt36vvabtUMLZkyWF2wk/L
         Xtqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GByP6s2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05620a450b00b007775b775bddsi1179648qkp.703.2023.10.19.00.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GByP6s2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNR0-00076y-7L; Thu, 19 Oct 2023 03:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNQy-000762-5m
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNQw-0008Py-MF
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697700425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OWfRhRyUDz8WlzkAqPLq6kMafxlxQnn3cQn33xjPW04=;
 b=GByP6s2xj7em6Vt/PCYp8mzmCjnQc1pCWXE0MGuS8GYxc+ShmdqNxB5RhbSy7Ht+13lk8E
 TyyhZcC/pp2IozmIwHE+Yt/QvDdc7nONxoTwbMN9NY1Ip9h3864yt2mBNIkYg2vxEtBYLF
 j7ZURHFznnWecaq4oIUobIn/lTE8GDo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-YuDSXMUROLCjk2jsN8yWPw-1; Thu, 19 Oct 2023 03:26:59 -0400
X-MC-Unique: YuDSXMUROLCjk2jsN8yWPw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7788f0f099fso259283785a.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697700419; x=1698305219;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWfRhRyUDz8WlzkAqPLq6kMafxlxQnn3cQn33xjPW04=;
 b=IcKSJBgfYU66j1VYMhV3PvLG5X8phLpj4QsFHctYpiq76hUV2XqGV6by9htu2Jl2aG
 kXRDbCFqosKkJ2fDiaCpS+vpwyyRhwqxxkCQVJF/uw0U1Ec+c9DO6aqY4PpERx/q2QpM
 V4Eq3h4oZ5Ib0cPBxOWsdVp/2LtLYA7+Jszes2SWVgwj5EnG5R3Z0R6XYjleGBuKGVlY
 pof/WsKYQ/ANsSRkPs+JYeuvmEpWcH1hCwgyf8uf/889e2V0+FaBL/NqqAjJIQGqmQKx
 nEWiVrJmUlJVwNoCi8sJTopE+YZzgIp2/IDqywG3WlXB0XQrcO8kLGm8y/mg1rfIN5XF
 HGAA==
X-Gm-Message-State: AOJu0YyoX+BAY9oyG+PzalIx+fUg9xDOtqvGW+NVXsrcyQIYJaeLPrLt
 jbfKc4tcpif6bI/dl+KNGJhfGNDYIMopqeT7X2hsDodniV+u71aXWJt1MTPhEOLO/PkSgjBkjmi
 knVCxipjMiMbV
X-Received: by 2002:a05:620a:2d81:b0:775:6695:b10f with SMTP id
 tr1-20020a05620a2d8100b007756695b10fmr1302752qkn.56.1697700418827; 
 Thu, 19 Oct 2023 00:26:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2d81:b0:775:6695:b10f with SMTP id
 tr1-20020a05620a2d8100b007756695b10fmr1302722qkn.56.1697700418572; 
 Thu, 19 Oct 2023 00:26:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 e25-20020a05620a209900b007742ad3047asm555818qka.54.2023.10.19.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:26:58 -0700 (PDT)
Message-ID: <a00df2c8-6108-45f9-ab35-722f989f2057@redhat.com>
Date: Thu, 19 Oct 2023 09:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] hw/pci-host/bonito: Do not use SysBus API to map
 local MMIO region
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20231019071611.98885-1-philmd@linaro.org>
 <20231019071611.98885-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231019071611.98885-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kweugqTs/z2p

On 19/10/2023 09.16, Philippe Mathieu-Daudé wrote:
> There is no point in exposing an internal MMIO region via
> SysBus and directly mapping it in the very same device.
> 
> Just map it without using the SysBus API.
> 
> Transformation done using the following coccinelle script:
> 
>    @@
>    expression sbdev;
>    expression index;
>    expression addr;
>    expression subregion;
>    @@
>    -    sysbus_init_mmio(sbdev, subregion);
>         ... when != sbdev
>    -    sysbus_mmio_map(sbdev, index, addr);
>    +    memory_region_add_subregion(get_system_memory(), addr, subregion);
> 
> and manually adding the local 'host_mem' variable to
> avoid multiple calls to get_system_memory().

Thanks for updating it!

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index ee6cb85e97..96bd028671 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -654,10 +654,10 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
>   static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIBonitoState *s = PCI_BONITO(dev);
> -    SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
>       PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
>       BonitoState *bs = s->pcihost;
>       MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
> +    MemoryRegion *host_mem = get_system_memory();
>   
>       /*
>        * Bonito North Bridge, built on FPGA,
> @@ -668,48 +668,48 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>       /* set the north bridge register mapping */
>       memory_region_init_io(&s->iomem, OBJECT(s), &bonito_ops, s,
>                             "north-bridge-register", BONITO_INTERNAL_REG_SIZE);
> -    sysbus_init_mmio(sysbus, &s->iomem);
> -    sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
> +    memory_region_add_subregion(host_mem, BONITO_INTERNAL_REG_BASE,
> +                                &s->iomem);
>   
>       /* set the north bridge pci configure  mapping */
>       memory_region_init_io(&phb->conf_mem, OBJECT(s), &bonito_pciconf_ops, s,
>                             "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
> -    sysbus_init_mmio(sysbus, &phb->conf_mem);
> -    sysbus_mmio_map(sysbus, 1, BONITO_PCICONFIG_BASE);
> +    memory_region_add_subregion(host_mem, BONITO_PCICONFIG_BASE,
> +                                &phb->conf_mem);
>   
>       /* set the south bridge pci configure  mapping */
>       memory_region_init_io(&phb->data_mem, OBJECT(s), &bonito_spciconf_ops, s,
>                             "south-bridge-pci-config", BONITO_SPCICONFIG_SIZE);
> -    sysbus_init_mmio(sysbus, &phb->data_mem);
> -    sysbus_mmio_map(sysbus, 2, BONITO_SPCICONFIG_BASE);
> +    memory_region_add_subregion(host_mem, BONITO_SPCICONFIG_BASE,
> +                                &phb->data_mem);
>   
>       create_unimplemented_device("bonito", BONITO_REG_BASE, BONITO_REG_SIZE);
>   
>       memory_region_init_io(&s->iomem_ldma, OBJECT(s), &bonito_ldma_ops, s,
>                             "ldma", 0x100);
> -    sysbus_init_mmio(sysbus, &s->iomem_ldma);
> -    sysbus_mmio_map(sysbus, 3, 0x1fe00200);
> +    memory_region_add_subregion(host_mem, 0x1fe00200,
> +                                &s->iomem_ldma);
>   
>       /* PCI copier */
>       memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
>                             "cop", 0x100);
> -    sysbus_init_mmio(sysbus, &s->iomem_cop);
> -    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
> +    memory_region_add_subregion(host_mem, 0x1fe00300,
> +                                &s->iomem_cop);

At least the above two hunks look like they could now fit into one line?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>

