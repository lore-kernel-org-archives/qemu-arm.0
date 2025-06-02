Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp3026415njh;
        Mon, 2 Jun 2025 14:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYpk9zeJ7r7af09H/cqrzTkleTcJoy67Dh/nbE1TmJSBzBwxW0Vw68FUFj26bUaWoW6PUgC8fW9zA2iA==@linaro.org
X-Google-Smtp-Source: AGHT+IGN+IEKzLLiLrzfn+MRvB3zUCRBLCwGjfO+jgyL61ipMqzkwVd185aLan/35ygr//N5q83K
X-Received: by 2002:a05:620a:240f:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d0a1fa820amr2091908485a.14.1748898390441;
        Mon, 02 Jun 2025 14:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748898390; cv=none;
        d=google.com; s=arc-20240605;
        b=cnJcT0Y+5tlVuYiZGO46LI/7b3X+HRkkdEfMBTgN+boXMpyWg0wpwnVfKDGkktRYe+
         bgQmnuHuRoWeOJD/Gmkqu60Z6Db2eBCPi8EKk75co1RaO20T3v5Ldc5RRbKnyjB1wOkh
         boV1vsRt0xRozKA0xjvSr2Szwhz9PskOlx8YhgbDnsMQeFwBQKnqnHqBEVfuDOz7frb9
         EjGslPRiwDska51gnMB5rISH9EiYGnXjbmll/UxpaLgB29QfClT99mUR5Kf73EGbY0Gw
         3gAr3LidJeATfleN19B5NwHQKXql2W93cc++kyX9vf6LASu6iWX/CYeZNvb0eddxGoFd
         MjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TPAOzMw4ShRFf2PjoWUiz74Bhb/cLQB/tGLlUw7Kpr8=;
        fh=EUEQeQcUuIvl+SrKfRFHYwuxlvYlIH8HQ6SK2sFaDv0=;
        b=bElDQFpz354fMiCEVXVooIvawAohi+RUEd8ztPZQnL/vRCyybIBJWc8nNNdNjgX1LV
         nzeERqf29uUoazgXkHckP19cVnxQ68YnqQcubuTf+gtHg5js3Qqn6cww2cXKaq32HBkg
         Fc7lo6WjqAWjjXtPNGEiYjeunwEIvmn+FYw2BsMNuiVFQxxt+Gz992Z6chQDc+AFFEUJ
         Ih4c6D/W44V2EcdyraG8NyeB1AVl5VlkOVcdedxOjkYZ0bU4XaMEu+1wrHS2gG+0jxnr
         gePViQWxRMq6/JdiXbv9uzI3LN6N8pNYsfhz78C0G95mxDIUvIBFh8tu9HBRXXJoFuG1
         7hYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K+Vv2C/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1e04a8si1080812185a.211.2025.06.02.14.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 14:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K+Vv2C/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMCMD-0007uk-DC; Mon, 02 Jun 2025 17:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uMCMB-0007u4-Sk
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 17:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uMCMA-0003qE-By
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 17:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748898364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPAOzMw4ShRFf2PjoWUiz74Bhb/cLQB/tGLlUw7Kpr8=;
 b=K+Vv2C/gv/nqN1bVZa/fZvN6rgg0lqG9upJqbIxX3dNpL7jZtGAOTlWTGLVUr3ItT6X/N6
 y3W42hWh7exMxqO2oDoFx4BJJJ0Ljl8dYnnSpvHWciOOLGDcIem1yocHNr97s12+yX4FHa
 /RdCx1mgonxe9V02jrdR9BfgpvxKdZ4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-orXol2XRM8WyniH1nbENGA-1; Mon, 02 Jun 2025 17:06:03 -0400
X-MC-Unique: orXol2XRM8WyniH1nbENGA-1
X-Mimecast-MFC-AGG-ID: orXol2XRM8WyniH1nbENGA_1748898363
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d09ed509aaso698193785a.3
 for <qemu-arm@nongnu.org>; Mon, 02 Jun 2025 14:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748898363; x=1749503163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPAOzMw4ShRFf2PjoWUiz74Bhb/cLQB/tGLlUw7Kpr8=;
 b=hi+nGN0jSbH616WPyJAM6fyZqBOmcaL9hfigfIbvwOZ4CIWNyX9onCu6CrQpFKZhB/
 ySg06eReSAMBy9gUfloi2ceocyMGev1XG3w+uyTDse+u0aNcprvE/dW1eDIF91czNZkb
 ZF3m5jdSlUW+yubiewHS9SJyPmHjqvqfRZwIel8MV43DooRP0Ez7JqSFSFgdm+NvmC3u
 +8vTRfzTjeEwiGJJ72FCfFdhqJs01fDvtutQdb0/BJk3iWMzUbzMfLx7bOXBaLdA5XyJ
 ZZ6CX30OCwxZEP0K8frKM1dnDfHYRX5mTGAFoQhOqtiz59r2aaYRg3ci+eyM+X9/fU7M
 oO8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/9EvbkXsNWQVCaU7JjokjX0ekwouGn6C+89lEOuKoSGJ92//A5QHKk+V2E3GSVtrR9x98c9/B2A==@nongnu.org
X-Gm-Message-State: AOJu0Ywi3MiwiFLdbr7TgOcAXcto1Z9ZslHtVLghsMvi8XteISWvFgz3
 Pcr9r6iRe8XYmlzP1ZG/nT09T1oao3hzRr4vbVfaOGsQzr8Sh9pxdWt3Qk2JQDZmiMOPhFXWSWU
 2jDqlFv5hQx2cznGfck5Ol77gmAk2bxTwf89lJXESuFfRuUHPX9+eCQ==
X-Gm-Gg: ASbGncs91KWPkAu5FDfe6d7hYVFWVqwkkeoF6vipJWhsJ4lASqwDRI85ARy+W2LDe2X
 Qu8EMcOzJeT8Wb2i0bYJIMVA9XgnVawuHjtEKbGBn49cdqEkhE58W7UM7T8FGmAOepXucfs+Y8W
 NqfN43vltkCjukJ7jvAz0rOq7ZQ8dannHjU2V7MC8Yd/SjXh5KCHdib8vdPp2NMj+LuyLW0/EcV
 dma5cw3jej6+aLRNCtta0rhjnIAr4an4YumybklgsPaROZ/xGKOpuuLIxAYrlxThmTfsVugsyaT
 2Pbs6unBIuK/
X-Received: by 2002:a05:620a:1a26:b0:7c5:a29e:3477 with SMTP id
 af79cd13be357-7d0a20343e0mr2405041185a.53.1748898362576; 
 Mon, 02 Jun 2025 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a26:b0:7c5:a29e:3477 with SMTP id
 af79cd13be357-7d0a20343e0mr2405037985a.53.1748898362300; 
 Mon, 02 Jun 2025 14:06:02 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a1bb27fsm689205185a.116.2025.06.02.14.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 14:06:01 -0700 (PDT)
Message-ID: <30b4030e-fb0b-4254-9b43-8f89fe66bfe0@redhat.com>
Date: Mon, 2 Jun 2025 17:05:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt: Check bypass iommu is not set for iommu-map
 DT property
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, nicolinc@nvidia.com,
 linuxarm@huawei.com
References: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RThbFVg49PWVdUANtU-46eXLX3UMneRynIYDbpIDscg_1748898363
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.015,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fhE6u9CMaOxg



On 6/2/25 7:46 AM, Shameer Kolothum wrote:
> default_bus_bypass_iommu tells us whether the bypass_iommu is set
> for the default PCIe root bus. Make sure we check that before adding
> the "iommu-map" DT property.
> 
> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/virt.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a6cd085a3..99fde5836c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1487,9 +1487,12 @@ static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>       qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
>       g_free(node);
>   
> -    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
> -                           0x0, vms->iommu_phandle, 0x0, bdf,
> -                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
> +    if (!vms->default_bus_bypass_iommu) {
> +        qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
> +                               0x0, vms->iommu_phandle, 0x0, bdf,
> +                               bdf + 1, vms->iommu_phandle, bdf + 1,
> +                               0xffff - bdf);
> +    }
>   }
>   
>   static void create_pcie(VirtMachineState *vms)
> @@ -1612,8 +1615,10 @@ static void create_pcie(VirtMachineState *vms)
>           switch (vms->iommu) {
>           case VIRT_IOMMU_SMMUV3:
>               create_smmu(vms, vms->bus);
> -            qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
> -                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            if (!vms->default_bus_bypass_iommu) {
> +                qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
> +                                       0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            }
>               break;
>           default:
>               g_assert_not_reached();

Reviewed-by: Donald Dutile <ddutile@redhat.com>

