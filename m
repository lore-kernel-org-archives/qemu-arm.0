Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3323189njc;
        Wed, 18 Jun 2025 10:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNJvzVWDpIDEW7kj2p0PJnJ5u5E/7PaUxFzXjXpRjgI9MjTDPC19CyHWisf+FJZI0gLV13ijeJsKIgkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFRVr6UieOwy61oZwJtBpb4p4rwLBls7CY0PaA8JZDFL9aeKntaTxkqeEkRtSV2Sy+5Rgo
X-Received: by 2002:ac8:7f06:0:b0:4a5:aa42:49e9 with SMTP id d75a77b69052e-4a73c5754c2mr216035211cf.9.1750266013059;
        Wed, 18 Jun 2025 10:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750266013; cv=none;
        d=google.com; s=arc-20240605;
        b=P0ARQCZJuYUP454boJCC0+/aOknE+Pr5Z7MwZQmc6sqvo5/CQd2nsMbKurpFY5Q/Tw
         6Otxbz1uc1HQ00ZL2OIqDA1EaUh7p2a5QV1xryvPDBK+5OnSyd6dm+U702S8uzJ9H4mP
         blGHWB/66lq5AWbLqwHdEksEKUXNSBw6qYkxjFUpB9m8gcSW/GxB4TWnhxwupPXnOmDj
         vP49U3lrg9EvO5ILHnqEvU93h2dqsjH/eEgRWwHgRM6PIeEIr2dwCYxtCOby/EzyY1E2
         ZPHh+lYZDuG9Rzx4RJOxeMsqTjCCddfpXoX8/EIz7dJloXb3QQPs+scCVTv0nnx3GGU9
         oXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uzisyutyk+ywazoiQJehVSACU64Y35jwqVM47Qx80GU=;
        fh=RoAcVtG2ZtbV89oA2dLeIVLDF1WKhCLwBfnKdq2bQig=;
        b=km4JutrDBn4mvLzAFvCU63/25CqkdCBgZraR/A9Klxq8s5IoDCGT/0cwvrWxfFpEUi
         hne+RN+iHRiBALXCAfrwYh8xujX5wxfWolCRWWOj8bwl9XKslEbZbLgRfHJbHvzDQFSp
         zWpMYhULp9teaHkMSS1G2qURMeQkWQc3jz9kaHmf0AdnLo3qKw9OjW/FdGCG/ROrHaxk
         AyGckubIW1sVG8bMc03+rAPE8m3shnYsylc6bm4wbSz08NofQ49S3TNknW/2i6jXwtww
         RhQebpmzfcqIEOUJASae8X1GGRQ7oPf/DL12qjPr6yz1fYoaAnHyp7kudO0Pcfh5OW/+
         kHpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNzN5ozd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b99f6si158266281cf.86.2025.06.18.10.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 10:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNzN5ozd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRw8w-0003AO-Ki; Wed, 18 Jun 2025 13:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRw8t-0003A5-VA
 for qemu-arm@nongnu.org; Wed, 18 Jun 2025 13:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRw8r-0000cP-Dy
 for qemu-arm@nongnu.org; Wed, 18 Jun 2025 13:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750266003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzisyutyk+ywazoiQJehVSACU64Y35jwqVM47Qx80GU=;
 b=RNzN5ozd4k4lT+TpWpm5MV5JU3DwgZDONY+fWa07+TKC4kyHcM3u6a0RpfSQgDc84eIRQM
 MXKp40RqYOuj3cwrdULdMcOQPtZpl6xuPGgCAaZqwQU6XlLJQ+MjBxezDYQY/yXe0Wv06B
 6cYS0tfPxrcZZQ7LLGMWBKAe5oORur4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-yWH-iIhbNoSp53TgZHD_tw-1; Wed, 18 Jun 2025 12:59:59 -0400
X-MC-Unique: yWH-iIhbNoSp53TgZHD_tw-1
X-Mimecast-MFC-AGG-ID: yWH-iIhbNoSp53TgZHD_tw_1750265998
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-453080e4741so57802265e9.0
 for <qemu-arm@nongnu.org>; Wed, 18 Jun 2025 09:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750265998; x=1750870798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzisyutyk+ywazoiQJehVSACU64Y35jwqVM47Qx80GU=;
 b=cCc+7fn5n6AktRdM4F5RSrPIQTRA92EnW0wO2zzWIJeFB16FFO1dn6SzAm5/vNEgO1
 mKptj3o1/o2NG5LJMtiH9o016Xq+dSPhIjGFCwQtTDVzYbEHc4kH5QQu3Fhnq6rb416m
 +WUoC7a3J4xXwec6QEj9vZ4lU/xioKHGlKjhZ0Q9Wt8YW3GjZHsU1BMbAyJ/Q7eNw579
 UAA4vtjHJwtgdJ6CcAfaz1twhQ3ex71cfIG+BOgpu6sNwX0LYXw1AJyEj0zO3q3Ke5UF
 qBUlbMZYuEo4adRRERg8wdIq6HnAvA5WnBu/V3BRwCnkUSGreAKKYj3PDOPSJ6dLLq+o
 1jqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb1WxWDgmW1aq6Camvq8PkhVO8xILUmIYTMFRXVypKrfe3Xc49ou6DbkgkdUwBEozHu4O7+Q6TTw==@nongnu.org
X-Gm-Message-State: AOJu0Yxn+JVXzMXcDoQh9dBMLqsaHPYlm2UVIOVDRXizV4/QL4RrZI9p
 tJ3zfsLHLlyS4MislmguIgJMe1VwTvTNS9uAbM0xWKHt2rER5WnbHlwmqjM+PyJmnBXiMHog7NZ
 t4kWB10+Qgk+yRKhrn0RsiJ9qH2DnAUXaMdN50gubQKoEOVWPW7IzTw==
X-Gm-Gg: ASbGncs+MWGMLDboXFW7gGmKTxffbRpQYJ8mo0O6BeBQyqKzOmxsSY8iQYB+32auZow
 jAcneNF2LoYwhQcWd8731g/3nmgKA9Zr2by/SscoklDRvmvb5B5pMsoi2NfzK4m9I0WSNF5A001
 e0q7pwxe70Oap5YP3GLkGcY5p6kJQ7slGUiPCKExfIAzlKpa78i2h3XBPaPNjWJdichDj+/2unl
 sv8NtBo6uO/U09PLCYAbk+bvm4bLAKDR7rC5o4t83hxrRVNwOa4pCDMlqF6RTg0HgVD4ymCedl7
 Y5VjiOcP4i0afXPz/K5xRCao6Wt6noZlTAEf6mNoblnOCGOBvgMJ/J7yiBOyROqkKxYeLg==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id
 5b1f17b1804b1-4533cc69257mr157913795e9.3.1750265998171; 
 Wed, 18 Jun 2025 09:59:58 -0700 (PDT)
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id
 5b1f17b1804b1-4533cc69257mr157913605e9.3.1750265997739; 
 Wed, 18 Jun 2025 09:59:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b3c0d3sm17460155f8f.79.2025.06.18.09.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 09:59:56 -0700 (PDT)
Message-ID: <327b5515-467c-4666-86d6-fb2a99925a8c@redhat.com>
Date: Wed, 18 Jun 2025 18:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Linuxarm <linuxarm@huawei.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
 <20250617175247.00007d43@huawei.com>
 <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <49d4c4b73e9a44a783332ddfe9a2fbdf@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TBCuVDwwWdUCC5vvhuuVRRswvFdp8bf-Y--PJBlr2rg_1750265998
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.895,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ErMayn8GAsco

Hi Shameer, Jonathan,

On 6/18/25 10:35 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Sent: Tuesday, June 17, 2025 5:53 PM
>> To: Eric Auger <eric.auger@redhat.com>
>> Cc: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
>> <linuxarm@huawei.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
>> nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
>> imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
>> smostafa@google.com; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe
>> Root Complex association
>>
>> On Tue, 17 Jun 2025 09:49:54 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> On 6/16/25 12:20 PM, Jonathan Cameron wrote:
>>>> On Fri, 13 Jun 2025 15:44:43 +0100
>>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>>
>>>>> Although this change does not affect functionality at present, it is
>>>> Patch title says PCIe.  This check is vs PCI host bridge.
>>>>
>>>> No idea which one you wanted, but if it is PCIe needs to be
>>>> TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
>>>> I think.
>>> I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb
>>>
>>> pci-bridge/pci_expander_bridge.c:    .parent        =
>> TYPE_PCI_HOST_BRIDGE,
sorry but I still fail to understand why we can't just check against

TYPE_PCI_HOST_BRIDGE for making sure the SMMU is attached to PXB or GPEX. What does it fail to check? Why shall we care about PCI vs PCIe?

Thanks

Eric

>>
>> Hmm. That's awkward and I'd forgotten that wrinkle.
>> Need a stronger test but which one?  The PXB root bus has a parent of
>> TYPE_PCIE_BUS.  Maybe we can check that?
> Ok. How about we do something like below?
>
>
> @@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev,
> Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
>      SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
> +    PCIBus *pci_bus = s->primary_bus;
>      Error *local_err = NULL;
>
>      sbc->parent_realize(dev, &local_err);
> @@ -937,10 +939,31 @@ static void smmu_base_realize(DeviceState *dev,
> Error **errp)
>                                       g_free, g_free);
>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>
> -    if (s->primary_bus) {
> -        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> -    } else {
> +    if (!pci_bus) {
>          error_setg(errp, "SMMU is not attached to any PCI bus!");
> +        return;
> +    }
> +
> +    /*
> +     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
> +     * root complexes to be associated with SMMU.
> +     */
> +    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
> +        object_dynamic_cast(OBJECT(pci_bus)->parent, TYPE_PCI_HOST_BRIDGE)) {
> +        /*
> +         * For pxb-pcie, parent_dev will be set. Make sure it is
> +         * pxb-pcie indeed.
> +         */
> +        if (pci_bus->parent_dev) {
> +            if (!object_dynamic_cast(OBJECT(pci_bus), "pxb-pcie-bus")) {
> +                error_setg(errp, "SMMU is not attached to pxb-pcie bus!");
> +                return;
> +            }
> +        }
> +        pci_setup_iommu(pci_bus, &smmu_ops, s);
> +    } else {
> +       error_setg(errp, "SMMU should be attached to a default PCIe
> root complex"
> +                  "(pcie.0) or a pxb-pcie based root complex");
>      }
>  }
>
> Please let me know if this is good enough or not.
>
> Thanks,
> Shameer
>

