Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp672326njb;
        Tue, 4 Feb 2025 21:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsd4ppkW23Pb8DbdoXL5T2lOVXk5JH13rdytqhWGXubj8nlS8ZBotBiNbBCUnTowqxL4srtHokYK07WA==@linaro.org
X-Google-Smtp-Source: AGHT+IGE5ObEWSufiao7MQTJURIRM9QLv4w9t5LXyJhlwVEutyubdf6KjopniA6tUsbJ5FioqukP
X-Received: by 2002:a05:6214:5091:b0:6d8:8742:137c with SMTP id 6a1803df08f44-6e42fbc3c57mr17591716d6.24.1738732140294;
        Tue, 04 Feb 2025 21:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738732140; cv=none;
        d=google.com; s=arc-20240605;
        b=KvpKI04FlwX310fz+tCL5msVpe2AsdZGi7y4fn3z7sHH8c5D6plxe9dprSem3gLPYZ
         hVPrk7bcQzwOLoYVyCNS/g/GN2M2Nkwyf75xO1t2T7X9pExj74hu0UF62hLoFd4v9aIo
         EaqBO7d8mPsGe4t77TS5j0XrTssCirLpEJ6Cfm4Z/Bl9zcIjrEu74qINRaihqZ04OK0J
         C1/vpHwu7REGEXzMHnL3lnuAadDa9tzJ1l0snI3SJvoGSvck6HKc28tcvP9UGvTeLqHY
         7B3nr5BZxvqIeLa1PxmuJswr99YdYGaVCJ36jY69Yjih1mnLQm7D/YTWA7BWgufxW6+3
         IrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lYWuJH78uIjdeN05kZXHZ/y58aB8vgywJCx5R5RlS1U=;
        fh=/QNISICCe9m0p2r4JoH5hrLkxlsvBt0Bd3Y4DhRrYOU=;
        b=Q50uRPwgmbFtWhuO8QzEdblSxsskdMtCwgg5Yr2DrpDMtnyhOa2CdY72X/35Zd4Fxx
         d9Ck16KDPqnQlEIyPQlUgXvc0Cps+BF8WV6FuVB2R9g5+8wfWP9w4mljp/BCPg298Hpy
         SpMhYkTwKGxxa6+CjfvIKgjCaJA3JFtqPXB/MG2Dv8ng/NegntBACIF1G78cls0cEC+7
         y7gf3jd7E3drdDFaxype6YQV4wrTypGxdfqF+rDBASVtNp3Z9udBIPXAOj0pcvd99aba
         Tdoio++Q/cRTkfkQIwPpB1Jws6TL1K+6iBLUbRE+c7R/SaVFcijuzPdZHlZBbcqU3igH
         WVDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yp0yqLNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e432e08ba3si2727566d6.93.2025.02.04.21.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 21:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yp0yqLNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfXeS-0007nL-Dj; Wed, 05 Feb 2025 00:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tfXeM-0007mr-Q7
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 00:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tfXeL-00075Y-4p
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 00:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738732111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYWuJH78uIjdeN05kZXHZ/y58aB8vgywJCx5R5RlS1U=;
 b=Yp0yqLNBsftXteFW6l9aRm5ZgK9ilzlE6QAXcvF2t/oc7cyMY2UkPzbnWJDK/ImDNdNJwv
 X6qiw+ce2D3XwbSD7w8DjPlbdCyRo0lAQBwSntkm3zMHhKLPOGV6BG0XXWPy4O7daBayTy
 t7aPGySd6PL+C7spFfuwC/+AvVSRlLY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-icMsntSsOCGk9KaC7j6vBQ-1; Wed, 05 Feb 2025 00:08:28 -0500
X-MC-Unique: icMsntSsOCGk9KaC7j6vBQ-1
X-Mimecast-MFC-AGG-ID: icMsntSsOCGk9KaC7j6vBQ
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2f550d28f7dso11888229a91.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 21:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738732108; x=1739336908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYWuJH78uIjdeN05kZXHZ/y58aB8vgywJCx5R5RlS1U=;
 b=Czl18OefoURHdKqXcIyVxANUDCnOIPMBGX1ddf3aMlXEnC2yX6wcb3SQ9qXGAoyarJ
 sAJmaMqe0MqsQ9d4EX1bHs8xPbboRPWPES4TrUet29pRhO6v6jKOEs7SGWuwE+Mi2w/P
 2n32vgJXbBU94GigyI5BnbNRIEZZbYGdIUv+35LOY46XM03CZtDOlIV2pna/lmD4UUqR
 dVN2VBj61zQwmmdQ/ibLxnF5YxaTh29gkgCwh3ddQ/bh+fEAo7Xa+ad3VMlFE4QZwQHI
 o1hhf60glbjGOmDl5hS/ybX3A253WqJs/Doi/MW7rrXV6hrekv3IlL1as6FDDcyhhCTD
 P3kw==
X-Gm-Message-State: AOJu0YwifchSvobnDz5tS/TFA24XWWYSqpynkEXQ1oD5noXoT3pthPBx
 zDySSYZ1pZSEgCeedPtQ6BxNNWwHNChTvkHrWT+a+pFKthb7GyP2z1h6VcNTqg7tGUd3MQswxbX
 XaGLcKQ5jSyIYtW+5McXg5mqnFdexORdS5BIxOYC76/NnWKOKYQ==
X-Gm-Gg: ASbGncsNiXUtusnJ1mxPL+lBL7f3Ut7p6LUS6fC2AuU00MnKE0hQsaAUo2gquGeRjD/
 BPQqf33EzeYwRjiUcLKIDCk0FbXYklUxMj6qi8S4S1tTQOtNif3imDA+CLXPN9Dp8XPLgM3kS+y
 +y94itgDjH+sc2cs21xuFHSgxDMYMeIpvmFzGI9CAHDphpZ5LUu9FLBSwTL+ZxLmGLLbPxdfEyu
 1tKVFUfd9FIKL0DbxcW/BMzvexzZycMFEW6AUjO3jm2HDRFqqE+PS+s7yUKqJO3JQWqIxMxiTY0
 YjCptQ==
X-Received: by 2002:a05:6a00:28cc:b0:725:f1b1:cbc5 with SMTP id
 d2e1a72fcca58-730350f96demr2999433b3a.3.1738732107816; 
 Tue, 04 Feb 2025 21:08:27 -0800 (PST)
X-Received: by 2002:a05:6a00:28cc:b0:725:f1b1:cbc5 with SMTP id
 d2e1a72fcca58-730350f96demr2999400b3a.3.1738732107463; 
 Tue, 04 Feb 2025 21:08:27 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe631c1f3sm11533598b3a.35.2025.02.04.21.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 21:08:26 -0800 (PST)
Message-ID: <04b9198a-9b50-4ad5-8495-8ed4c44aa9eb@redhat.com>
Date: Wed, 5 Feb 2025 15:08:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/virt: Support larger highmem MMIO regions
To: "Matthew R. Ochs" <mochs@nvidia.com>, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, nathanc@nvidia.com
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, ddutile@redhat.com,
 eric.auger@redhat.com, nicolinc@nvidia.com, ankita@nvidia.com
References: <20250205041918.2340237-1-mochs@nvidia.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250205041918.2340237-1-mochs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3fYBjycMFtitbUoKyURWVy2uFHsiFf_Cua8o-XqcOxQ_1738732108
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: exIIKRUOKU77

On 2/5/25 2:19 PM, Matthew R. Ochs wrote:
> The MMIO region size required to support virtualized environments with
> large PCI BAR regions can exceed the hardcoded limit configured in QEMU.
> For example, a VM with multiple NVIDIA Grace-Hopper GPUs passed through
> requires more MMIO memory than the amount provided by VIRT_HIGH_PCIE_MMIO
> (currently 512GB). Instead of updating VIRT_HIGH_PCIE_MMIO, introduce a
> new parameter, highmem-mmio-size, that specifies the MMIO size required
> to support the VM configuration.
> 
> Example usage with 1TB MMIO region size:
> 	-machine virt,gic-version=3,highmem-mmio-size=1T
> 
> Signed-off-by: Matthew R. Ochs <mochs@nvidia.com>
> ---
> v2: - Add unit suffix to example in commit message
>      - Use existing "high memory region" terminology
>      - Resolve minor braces nit
> 
>   docs/system/arm/virt.rst |  4 ++++
>   hw/arm/virt.c            | 38 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 

With the following nitpick addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index e67e7f0f7c50..f96cf4da2a78 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -138,6 +138,10 @@ highmem-mmio
>     Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
>     The default is ``on``.
>   
> +highmem-mmio-size
> +  Set the high memory region size for PCI MMIO. Must be a power-of-2 and
> +  greater than the default size.
> +

The description doesn't match with the code changes because it's acceptable
when the specified size is equal to the default one. I think the description
needs to be improved for this.

>   gic-version
>     Specify the version of the Generic Interrupt Controller (GIC) to provide.
>     Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 49eb0355ef0c..d8d62df43f04 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2773,6 +2773,36 @@ static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
>       vms->highmem_mmio = value;
>   }
>   
> +static void virt_get_highmem_mmio_size(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    uint64_t size = extended_memmap[VIRT_HIGH_PCIE_MMIO].size;
> +
> +    visit_type_size(v, name, &size, errp);
> +}
> +
> +static void virt_set_highmem_mmio_size(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    uint64_t size;
> +
> +    if (!visit_type_size(v, name, &size, errp)) {
> +        return;
> +    }
> +
> +    if (!is_power_of_2(size)) {
> +        error_setg(errp, "highmem_mmio_size is not a power-of-2");
> +        return;
> +    }
> +
> +    if (size < extended_memmap[VIRT_HIGH_PCIE_MMIO].size) {
> +        error_setg(errp, "highmem_mmio_size is less than the default (%lu)",
> +                   extended_memmap[VIRT_HIGH_PCIE_MMIO].size);
> +        return;
> +    }
> +

It's acceptable when the specified size is equal to the default one, slightly
conflicting with the description in docs/system/arm/virt.rst


> +    extended_memmap[VIRT_HIGH_PCIE_MMIO].size = size;
> +}
>   
>   static bool virt_get_its(Object *obj, Error **errp)
>   {
> @@ -3446,6 +3476,14 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                             "Set on/off to enable/disable high "
>                                             "memory region for PCI MMIO");
>   
> +    object_class_property_add(oc, "highmem-mmio-size", "size",
> +                                   virt_get_highmem_mmio_size,
> +                                   virt_set_highmem_mmio_size,
> +                                   NULL, NULL);
> +    object_class_property_set_description(oc, "highmem-mmio-size",
> +                                          "Set the high memory region size "
> +                                          "for PCI MMIO");
> +
>       object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>                                     virt_set_gic_version);
>       object_class_property_set_description(oc, "gic-version",

Thanks,
Gavin

