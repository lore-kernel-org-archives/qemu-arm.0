Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4751081ejc;
        Wed, 18 Oct 2023 09:12:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBY7xF9QzEIgs1j2xcmLXnPQrWJnaV3nyWE/rr6QJCn6VH3IaQ6dpbbSgjaHDdAzF3UZNv
X-Received: by 2002:a1f:2f13:0:b0:49a:1a56:945c with SMTP id v19-20020a1f2f13000000b0049a1a56945cmr5688161vkv.13.1697645520288;
        Wed, 18 Oct 2023 09:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697645520; cv=none;
        d=google.com; s=arc-20160816;
        b=FbpS5BVpVso1fZdOmSwPzQtIkVwZTMAbXxH75opULOufFdrNcik+puZzcHm+jY9GaA
         D77caJlGm1zA4c9fmnIpCi/TNCPu2RX4Oe5k90wdW13MtHBrEWWLxqOp8VSW7Np4r2Mk
         SitxJgevm6h75QdDma/YfdxF5eLgidLhmcbP9Q0jjItQUvT5+wCD9K6sC3V6xnNjxtQJ
         8aFKhxEI27n4S1nl3nXdJ3vo3j1tdIVjARdvuEvExVJs/0+8A/+MUcWOIWponmhax+ic
         UPJq0MH5ISaGeOQ0Sb+DkyG0R2ddmAf/X0Hq64iYOGI7lolXngmKaNcGZzxwOnzf3rkc
         v1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q4oig/hzpB5AaAp4b4GPxSl5owH8+Typ4kIPdsGFzIU=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=zZmGzrL2b5Xt0nBu1fFUV+PxxF77A+ak5goo/4yPbp8UGYZMdcBrt1GoxPtSrlpdj0
         l+DWAuEj4/7fLOzA+LJmC/ZENdxJ/3sd7LbxVPh1ble31kQlR0PVcvG5Dp4s7q2nkoIY
         F1J7dcJWGbTl0rKouRoTLb1ZjIDt2LlqVBO012RcV1JwXSxE9Da7WEv3f7KycEJIT0q+
         4Qvjafp0VjhVWmdpVFgG6bTR15+FCHXNBvR4OUhmYso24/xJjq3i+LwCb25wdDM2XMM6
         C3KHS+HTPSmpweuigJPzp9yC/tH5ymDRyNcRWJkTSGS1vAOCI682kHijgDh3wSUVLlN7
         Thww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QrXiByhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i186-20020a1f6dc3000000b0048672a64f5asi448327vkc.105.2023.10.18.09.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QrXiByhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt93D-0006AM-8t; Wed, 18 Oct 2023 12:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt93A-00065I-MX
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt938-0000mH-Ee
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697645133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q4oig/hzpB5AaAp4b4GPxSl5owH8+Typ4kIPdsGFzIU=;
 b=QrXiByhUPzLzc31oBwaxfSmtwnx7syWOeWSns4iO3mSQXxJPBj8onBJHu5w4JRpYvZ1q2z
 h+o40yk44WI8BktOShEqfRm8d7zwHjGZzV9pAchOcwyWzjwEuhBIxUXSzkc3I1vrdC+JFI
 26zYumaPrPMbqv43UfbvAmQHttCozR4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-aVbhGimFOBaJWwnoj0TBkA-1; Wed, 18 Oct 2023 12:05:32 -0400
X-MC-Unique: aVbhGimFOBaJWwnoj0TBkA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41cc25beccaso5801161cf.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 09:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645131; x=1698249931;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4oig/hzpB5AaAp4b4GPxSl5owH8+Typ4kIPdsGFzIU=;
 b=QsaOa70c/x4lKmJmYM/xwhCrj7F3PNm/VhrA5voaM3T4nvJyVSaNbiArSuZuzEQCjK
 lpt8vGGUGsngiAU30T7JbAcsLcEALW1hh7diilVBI135DP8vEUEv8A92iqYKR6J88FMb
 i4xrDn87dFLTTdmx5/c9570O5C/qaLdinFFW9K/zT4difzqDW5Qn9D8VeBXPmOQOIyIQ
 ojj7nvhaXKMP0m9N1YWSiO+smfAKWMB76FkjiETp66Z4/m6jlH5hsJ+QR5uPvRAtaRJm
 4bR05In8sJw3VjDngYCBN0NSeICXQv9+1VBe6gg2RqCA8bsc76+nbxGmgluTxO3CYJ1m
 pgUA==
X-Gm-Message-State: AOJu0YwxAzAUE5HcTXqhYJqAhchjF7DqK2GWqn5Sb/7T58eA7r4DJh2A
 5aq7+MEaSLxFH2eZB8SfKmYpBBDBrJRTN46+Dy3JgXLQ+BrF5xxsBrYmNTzaf8R+WutMzq3CJw8
 MD1bmRsgFjsFa
X-Received: by 2002:a05:622a:282:b0:403:fcd9:963 with SMTP id
 z2-20020a05622a028200b00403fcd90963mr6155484qtw.67.1697645131444; 
 Wed, 18 Oct 2023 09:05:31 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:403:fcd9:963 with SMTP id
 z2-20020a05622a028200b00403fcd90963mr6155434qtw.67.1697645131124; 
 Wed, 18 Oct 2023 09:05:31 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 h19-20020ac85053000000b004198f248e8dsm52393qtm.76.2023.10.18.09.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:05:23 -0700 (PDT)
Message-ID: <6020a0cd-19a8-4cf7-a99d-781854464887@redhat.com>
Date: Wed, 18 Oct 2023 18:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] hw/pci-host/bonito: Do not use SysBus API to map
 local MMIO region
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231018141151.87466-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QdRZZabN78CI

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> There is no point in exposing an internal MMIO region via
> SysBus and directly mapping it in the very same device.
> 
> Just map it without using the SysBus API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 29 ++++++++++++++---------------
>   1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index ee6cb85e97..3b803bcad3 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -654,7 +654,6 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
>   static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIBonitoState *s = PCI_BONITO(dev);
> -    SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
>       PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
>       BonitoState *bs = s->pcihost;
>       MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
> @@ -668,48 +667,48 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>       /* set the north bridge register mapping */
>       memory_region_init_io(&s->iomem, OBJECT(s), &bonito_ops, s,
>                             "north-bridge-register", BONITO_INTERNAL_REG_SIZE);
> -    sysbus_init_mmio(sysbus, &s->iomem);
> -    sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
> +    memory_region_add_subregion(get_system_memory(), BONITO_INTERNAL_REG_BASE,
> +                                &s->iomem);
>   
>       /* set the north bridge pci configure  mapping */
>       memory_region_init_io(&phb->conf_mem, OBJECT(s), &bonito_pciconf_ops, s,
>                             "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
> -    sysbus_init_mmio(sysbus, &phb->conf_mem);
> -    sysbus_mmio_map(sysbus, 1, BONITO_PCICONFIG_BASE);
> +    memory_region_add_subregion(get_system_memory(), BONITO_PCICONFIG_BASE,
> +                                &phb->conf_mem);
>   
>       /* set the south bridge pci configure  mapping */
>       memory_region_init_io(&phb->data_mem, OBJECT(s), &bonito_spciconf_ops, s,
>                             "south-bridge-pci-config", BONITO_SPCICONFIG_SIZE);
> -    sysbus_init_mmio(sysbus, &phb->data_mem);
> -    sysbus_mmio_map(sysbus, 2, BONITO_SPCICONFIG_BASE);
> +    memory_region_add_subregion(get_system_memory(), BONITO_SPCICONFIG_BASE,
> +                                &phb->data_mem);
>   
>       create_unimplemented_device("bonito", BONITO_REG_BASE, BONITO_REG_SIZE);
>   
>       memory_region_init_io(&s->iomem_ldma, OBJECT(s), &bonito_ldma_ops, s,
>                             "ldma", 0x100);
> -    sysbus_init_mmio(sysbus, &s->iomem_ldma);
> -    sysbus_mmio_map(sysbus, 3, 0x1fe00200);
> +    memory_region_add_subregion(get_system_memory(), 0x1fe00200,
> +                                &s->iomem_ldma);
>   
>       /* PCI copier */
>       memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
>                             "cop", 0x100);
> -    sysbus_init_mmio(sysbus, &s->iomem_cop);
> -    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
> +    memory_region_add_subregion(get_system_memory(), 0x1fe00300,
> +                                &s->iomem_cop);
>   
>       create_unimplemented_device("ROMCS", BONITO_FLASH_BASE, 60 * MiB);
>   
>       /* Map PCI IO Space  0x1fd0 0000 - 0x1fd1 0000 */
>       memory_region_init_alias(&s->bonito_pciio, OBJECT(s), "isa_mmio",
>                                get_system_io(), 0, BONITO_PCIIO_SIZE);
> -    sysbus_init_mmio(sysbus, &s->bonito_pciio);
> -    sysbus_mmio_map(sysbus, 5, BONITO_PCIIO_BASE);
> +    memory_region_add_subregion(get_system_memory(), BONITO_PCIIO_BASE,
> +                                &s->bonito_pciio);
>   
>       /* add pci local io mapping */
>   
>       memory_region_init_alias(&s->bonito_localio, OBJECT(s), "IOCS[0]",
>                                get_system_io(), 0, 256 * KiB);
> -    sysbus_init_mmio(sysbus, &s->bonito_localio);
> -    sysbus_mmio_map(sysbus, 6, BONITO_DEV_BASE);
> +    memory_region_add_subregion(get_system_memory(), BONITO_DEV_BASE,
> +                                &s->bonito_localio);
>       create_unimplemented_device("IOCS[1]", BONITO_DEV_BASE + 1 * 256 * KiB,
>                                   256 * KiB);
>       create_unimplemented_device("IOCS[2]", BONITO_DEV_BASE + 2 * 256 * KiB,

Would it make sense to cache the return value of get_system_memory() in a 
local variable instead of calling it again and again ...?

  Thomas

