Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp3300741njh;
        Tue, 3 Jun 2025 02:50:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCDhJTgPoeLubBP7b6TRCs9DDlQkdUWZ+jnlX032x1FDgQlOIYaKRxFUHCT7Z0854ZsPpeE3AXti0GeA==@linaro.org
X-Google-Smtp-Source: AGHT+IEsTXEIUSPcUcKMlCOdmKaxrM5kDFxz3TUzYexIzeuQ19hR7zrlZXsolcNuJh17J/Y/L6cv
X-Received: by 2002:a05:620a:4103:b0:7c7:a736:b698 with SMTP id af79cd13be357-7d0eaccc359mr1849990585a.40.1748944252925;
        Tue, 03 Jun 2025 02:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748944252; cv=none;
        d=google.com; s=arc-20240605;
        b=Onk+ZLHoQlXo2tnVjs6AsSmu0YvPe614j5J/g6gKSIRktrJUS7m/bNthfMgLJ5Nl3w
         idkUTiOIj6GzUNd0Ip0X1ik4/YjLIdP4i0tfZNIzqzCKzr4mD+2+Egqawb/juBDjP9sC
         biecbgfYwjtcWd5Nm4se5iOcerYxdmSYhqL83psA7Xegs2BCf8SGIWPo7NdLFD6W4CxU
         Be9r2YVCmAKxPDHcdrJL7AQ38hCCbNQ8AFHcBsUMgK3jh1rfsarUjsr67I6Fio9Lr4eQ
         ++akmSvWhmq0cPNE09YsyjJmgbUw+pl1tjNpKv+0r983aWTyUbILMKshK9uegl5J1BfH
         +kBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mv58T/W6RsypO84fxS5nOpnQQLugeAy7hvEtVnn7U8M=;
        fh=XlmNSU9PxGWyH7nBq1MynnSNVEQuwrHjCq4mEY+J144=;
        b=eEu198gCHsmI3IX64nvBZtxfyWqdrCovzp/qTiFyolmZA0aCJWtKrja2i432ZyApC5
         2dsD9FId7+KzKRaZsUE0McHcJCk27zjXiY/0GZwANpMhLPqjlueFAySqRDEP+ygKbROP
         7jTtpijjgBmeBL0vOw92kud0RDUjurISQM4g4maS/E3Vkr+XdFFN/Y1nQskyFBrxNOyf
         OsTcAkDvPCMhR1H0DiVpIcW434zeb6PuhHPd45FIYT1Wp1Qn4zA01Uj7ph4E30YYxs5A
         lGTByAzYvXfz5TVpT/2gIp/Xz+t0CHDAgkm5Xw9GhvP6+ajMmLv7ptNsSa6KpYgosRtR
         ZAuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fc/Fi4X5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1e23a9si1207025985a.220.2025.06.03.02.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jun 2025 02:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fc/Fi4X5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMOHz-0008EI-Ch; Tue, 03 Jun 2025 05:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uMOHw-0008Du-3x
 for qemu-arm@nongnu.org; Tue, 03 Jun 2025 05:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uMOHt-0002EO-Ua
 for qemu-arm@nongnu.org; Tue, 03 Jun 2025 05:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748944226;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mv58T/W6RsypO84fxS5nOpnQQLugeAy7hvEtVnn7U8M=;
 b=Fc/Fi4X5nO94gCGENJBQPmJ2d7exFJIsjz/uHFfuTTpXS3X+7tpRHQZof4UI9Vj4W2iyyL
 pDENBcQER2BkBcvAwqqIN7d6vmLSPdYQmXQlZALIL7kyW7WA55TDDeMBj6gIrCcAtsv6Vv
 OatyGJshHWvmciC0yOnpwDbA28GNH6w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-iTwUsujvPEiO1foSEIIj3Q-1; Tue, 03 Jun 2025 05:50:25 -0400
X-MC-Unique: iTwUsujvPEiO1foSEIIj3Q-1
X-Mimecast-MFC-AGG-ID: iTwUsujvPEiO1foSEIIj3Q_1748944224
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso20416475e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Jun 2025 02:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748944224; x=1749549024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mv58T/W6RsypO84fxS5nOpnQQLugeAy7hvEtVnn7U8M=;
 b=HNseEkpVk0jaWocVpah7Vnxn7mX9KAP4Y0hANKaoJMEn3INcqDDe3eZ75pIepyMZwp
 TELTVXqMjjEMwS9vtvhwgwe21gdDNaep3jzirNVm8FOH0UOnLwMql94r438pFIQ/eJ++
 QWK2ztk9PqI4VE1aCiBo/Xl9fC/6jpOcaAQzwER+Y6ti6GPWQ+zFyACRMOmYd5Xu3Dne
 klAdjL4rumB2s9gndfbkG0qZxOTMKKiOYc2DYVMO/MuZEoBIEk66CkaaD+Nwra8QCh1P
 +TT6js83Tq/aTDx1U0GWejv5gVC5k55L+Bl9L0ZLgGRaAl9gqHN3bzr0DMHAP/sUzuHs
 kgdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUfwm7uDxf3XDtqmuAJU2xC5l7+zD5JJa3KDly9dwgfMZVrOdhwHK7APkUzccEzQ1Elwzgv9fBQA==@nongnu.org
X-Gm-Message-State: AOJu0Yz9dAgbhmKIm3fNxxQZvWtr6NSsXY3z3qebOrtIkga9gchAkigQ
 jN6wJrzpC06cGOYCMTyAAMDVpMBN1CS/y171gvk25z98uto0nZ/pYCrnmefkJyWdJywAbZzLPwM
 Ufxc4fgnY5IZHBcbKaTakJz4pB/8mRIqo+2zDmsb0+Pw1gjaH9bvfWA==
X-Gm-Gg: ASbGncuqanPXKDB4aHmDTuA90wuQOifvjS5T3SWoURojww2FLq/jEsyww4Ft+wzRzx3
 3iTyKIDNsvKPdZw1ipuSrz032+sGClndbQ1HiINIsXFy+o8Ou7YWeo/PqyiMqNpsMAVnV5aD4cP
 fJyuSAaFKeICmyJF/V0kZFGg+pAtPe6VsSidKM3s7Ovs8Xg1Cjkij8zTfn+o1hwtlmfT95i5JNv
 s9ifULkPdc3XWyyBjJMPB30tS/ziDokNTVCYz/LhcBZ5M5cqVlqMlK6S22cAfKoKg+nSffQR06+
 DK5uXEmf2ERrjdNvhNByqaHzrI04Gxx6uoywvORo4ymbggzx6aouqodqtMI=
X-Received: by 2002:a05:600c:6488:b0:442:f4a3:9338 with SMTP id
 5b1f17b1804b1-4511ee1215emr95955595e9.21.1748944223761; 
 Tue, 03 Jun 2025 02:50:23 -0700 (PDT)
X-Received: by 2002:a05:600c:6488:b0:442:f4a3:9338 with SMTP id
 5b1f17b1804b1-4511ee1215emr95955345e9.21.1748944223420; 
 Tue, 03 Jun 2025 02:50:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb0467sm155256605e9.19.2025.06.03.02.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 02:50:22 -0700 (PDT)
Message-ID: <ba4ac9e4-f8ca-4885-b2ab-6acdca51175b@redhat.com>
Date: Tue, 3 Jun 2025 11:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt: Check bypass iommu is not set for iommu-map
 DT property
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, ddutile@redhat.com,
 linuxarm@huawei.com
References: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bgYFJ5rKff6vDJShwXi8R3AowOlFMp_z312mr4sf2cA_1748944224
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I4XQk2KFmalw

Hi Shameer,

On 6/2/25 1:46 PM, Shameer Kolothum wrote:
> default_bus_bypass_iommu tells us whether the bypass_iommu is set
> for the default PCIe root bus. Make sure we check that before adding
> the "iommu-map" DT property.
>
> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/virt.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a6cd085a3..99fde5836c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1487,9 +1487,12 @@ static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>      qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
>      g_free(node);
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
>  }
>  
>  static void create_pcie(VirtMachineState *vms)
> @@ -1612,8 +1615,10 @@ static void create_pcie(VirtMachineState *vms)
>          switch (vms->iommu) {
>          case VIRT_IOMMU_SMMUV3:
>              create_smmu(vms, vms->bus);
> -            qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
> -                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            if (!vms->default_bus_bypass_iommu) {
> +                qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
> +                                       0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            }
>              break;
>          default:
>              g_assert_not_reached();

