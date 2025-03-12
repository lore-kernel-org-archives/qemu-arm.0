Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp372319njc;
        Wed, 12 Mar 2025 09:12:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrPaIFLjiVfjnr3IVGek7xS34WP2ZlcUGj/lPaswQ/VMYpB/BITRwkEX5Hs962IfnI8ciLxfupjIlawQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE6Ts1fbEGBM3KuMidwNPGkw+Bhzd0GWLkK/XB04qd+91+oyGvhDmNH/MSFJwSM2HtSI/Up
X-Received: by 2002:ac8:7d16:0:b0:476:949b:8c5e with SMTP id d75a77b69052e-476949b963fmr138168481cf.27.1741795963705;
        Wed, 12 Mar 2025 09:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741795963; cv=none;
        d=google.com; s=arc-20240605;
        b=cLO/gZLKQvYWC8a4NGTY6qKRwr43Qe85pYn2N1Yex3d3orSxZNfmu1L/jDlh5BcLZN
         l+ro4+Wz/UlI/mYI19q0UgoeG/qWAqLpV/lZbp1wjFA+S1ylbkpDvCeUXMXWcylL1D/N
         KwD/D0BqXUqha3bQcBxFyMKw0yuLxgW49DtRO61tastTzT2aTLQbg4EBetatfGuiA/+d
         3cFD5x9sRhkc/dvL2/ySYW8zIbaD5spXd/z0a7lqKblc2o6w4Hs6J4KtrPVggV38yUh6
         oWAEd0upEB1hjv14L2mabZDHD4hEhPtSvd4qiCICGaAAdyWbJFSC/C4kVwr0tLcenGOa
         x2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iNI+Vf2IaG7FEwoAQmbTMxEbb9D+xyxcHf70UzDQj0A=;
        fh=W+vqOVPWuhy94A4Ld/yjHj1Kpq82YBE9zzIKWrz+LEM=;
        b=Rng/pSWq/4oPlpH6YmjGE0OPs+hnI6Gk0kiI05SUolC/oNBMjExVyr5wuXRAWoCfNB
         p2bLQZT7JIAH1InTJbS7Yc8F++NOt20/wb5RBQWaY9lGtfCU/9Yqi6YVSd2eaWjgX7gg
         aoIp3E8ISH9RypG9np4e+m41wDdt4kkjjjJKN8py3NxPFsJuqqLYrPYshIjqFWbgGs7a
         ilwkIWWd7XsN2WkJwFTMkB7K8gZu8QO+zR0m0QDqmCgPVcDfAcG68wfDsR6t5Xc4/LUR
         MzC0Lb/K9KoNeebareVtrbY4AWwf9v6d5b91xyGvC04/B1Ss4/gkzyptacMV7/CX97vz
         7jAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+q0uWHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4766fb298f8si91136661cf.163.2025.03.12.09.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 09:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+q0uWHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsOh6-0005Kg-JY; Wed, 12 Mar 2025 12:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOgp-0005Id-Ke
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOgn-0000Ph-O1
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741795928;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNI+Vf2IaG7FEwoAQmbTMxEbb9D+xyxcHf70UzDQj0A=;
 b=X+q0uWHDSwqbYtR/MsWtDqIOFUdqszXwf6ZMUL7tsiWJenUfN76J6ADGJRUyQSJpIKtQiP
 AuKsgycgiBrOUUw6cl6EpDNrtTHP+JiXU/eZVAB+R/SD42mshtex5G+B8ajKRsrE6t2ZZR
 45eTRpc1ZcNiYchE7vBDKXHssmsloZ0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-yixCI3vkOxKQiEkIAHhi4A-1; Wed, 12 Mar 2025 12:12:07 -0400
X-MC-Unique: yixCI3vkOxKQiEkIAHhi4A-1
X-Mimecast-MFC-AGG-ID: yixCI3vkOxKQiEkIAHhi4A_1741795926
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54767e507so698603485a.1
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 09:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741795926; x=1742400726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iNI+Vf2IaG7FEwoAQmbTMxEbb9D+xyxcHf70UzDQj0A=;
 b=lZ/xrWC/DN+64MXDZDuiLli3zmERcTsa5XiRXiv4nixUNgd1eHO8xOF9XhQqh71DTC
 1FO5cKZ16bUaq+LHeybAM8ypf7CHwPVUYxnx3y4H8PsM0UclGXuEiJN2yYRAWiAG84Bk
 FNh6si8ilIKvoAR3SuL5+NN8XzEekmNCkcTpgu9e+eszUrfq149St5QQXgqDt1a/vTS8
 +X3Mm1v75Cdjoh61qwf8YPeKaMy5IhuRzrNkajFx49PreQ1UG5UrJNxc2bAkmBMdsYzX
 ZiMpbM+8q2cDT1YXKjG9UEZ30JeKqVyaHa5IZ6czkgRVNs2u2+c7zzxzI1qDgEkcuWuC
 L5OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTorWwmz/lReqtKj+ssROVyQj/P9E60NbFTVDSE+qii4+R7tY6MfHIrmcOIQSHtNdeIVoibum1Ng==@nongnu.org
X-Gm-Message-State: AOJu0YwYSfvI9nh4Pp20VmdbWQxoK4LZlkisKXriSJetCxio8UVP7mrK
 03+hudZhAC1OlFthdNw2nkfLXx1mh1vvXkPPKN0zaz96l+Sh+rM5RnpqF/LBC6UMgRjgcF1AtLJ
 4nGvNlDCNRD40hMXNFPSX8tmcUVVJZ6dUhXdT1CxT/zPIXl/+Kw==
X-Gm-Gg: ASbGnctW/Szkb1ung9gnpuQN0tJy012efw7Xoh/LLxw41tt+RO5ByMnyudf5iu4UmVb
 JHyVjByXAeiG4I8jkDt3MLUUUvGsArXbEy+w1JZRCClVolMrWwmElzrnUc+e+l4h75BdPDpTaLp
 vMj8hVkmTj/rsjG+vY+KI9nZMrD3Gk5VjI8kWMnPqF16foO/92smjIZHdMAG2Xv9E6QX+Ayqx1P
 zj7mUQVFdvUSsbC9MEIwQoUBBC0dY2MNCq2yLoQclerdi0AOKXjN9on/DWmvrpgdLA2c5BsFMxI
 Y8jcfA3dyC5e4zYHwh1518hmgK/POWWEydNpwKpbGww4KE1LAHCD9Jr9HPmCDnI=
X-Received: by 2002:a05:620a:260a:b0:7c5:5cc4:ca5a with SMTP id
 af79cd13be357-7c55cc4cc68mr1528320885a.4.1741795926516; 
 Wed, 12 Mar 2025 09:12:06 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:7c5:5cc4:ca5a with SMTP id
 af79cd13be357-7c55cc4cc68mr1528316885a.4.1741795926207; 
 Wed, 12 Mar 2025 09:12:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c55f112215sm285720085a.109.2025.03.12.09.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 09:12:05 -0700 (PDT)
Message-ID: <0ac24089-9a5e-48e8-bcdd-60e63aa3f34f@redhat.com>
Date: Wed, 12 Mar 2025 17:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/20] hw/arm/smmu-common: Factor out common helper
 functions and export
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-7-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-7-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CjBiiQvz4B-FNa2iLkVIICqO60-87cXP4JhyNw09Hi0_1741795926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: D01ZOMQDkJPL




On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> Subsequent patches for smmuv3-accel will make use of this
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c         | 48 ++++++++++++++++++++++--------------
>  include/hw/arm/smmu-common.h |  6 +++++
>  2 files changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index f5caf1665c..83c0693f5a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -826,12 +826,28 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
>      return NULL;
>  }
>  
> -static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
> +void smmu_init_sdev(SMMUState *s, SMMUDevice *sdev,
> +                    PCIBus *bus, int devfn)
>  {
> -    SMMUState *s = opaque;
> -    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
> -    SMMUDevice *sdev;
>      static unsigned int index;
> +    char *name = g_strdup_printf("%s-%d-%d", s->mrtypename, devfn, index++);
> +
> +    sdev->smmu = s;
> +    sdev->bus = bus;
> +    sdev->devfn = devfn;
> +
> +    memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
> +                             s->mrtypename,
> +                             OBJECT(s), name, UINT64_MAX);
> +    address_space_init(&sdev->as,
> +                       MEMORY_REGION(&sdev->iommu), name);
> +    trace_smmu_add_mr(name);
> +    g_free(name);
> +}
> +
> +SMMUPciBus *smmu_get_sbus(SMMUState *s, PCIBus *bus)
> +{
> +    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
>  
>      if (!sbus) {
>          sbus = g_malloc0(sizeof(SMMUPciBus) +
> @@ -840,23 +856,19 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>          g_hash_table_insert(s->smmu_pcibus_by_busptr, bus, sbus);
>      }
>  
> +    return sbus;
> +}
> +
> +static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
> +{
> +    SMMUDevice *sdev;
> +    SMMUState *s = opaque;
> +    SMMUPciBus *sbus = smmu_get_sbus(s, bus);
> +
>      sdev = sbus->pbdev[devfn];
>      if (!sdev) {
> -        char *name = g_strdup_printf("%s-%d-%d", s->mrtypename, devfn, index++);
> -
>          sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
> -
> -        sdev->smmu = s;
> -        sdev->bus = bus;
> -        sdev->devfn = devfn;
> -
> -        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
> -                                 s->mrtypename,
> -                                 OBJECT(s), name, UINT64_MAX);
> -        address_space_init(&sdev->as,
> -                           MEMORY_REGION(&sdev->iommu), name);
> -        trace_smmu_add_mr(name);
> -        g_free(name);
> +        smmu_init_sdev(s, sdev, bus, devfn);
>      }
>  
>      return &sdev->as;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index b5c63cfd5d..80ff2ef6aa 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -178,6 +178,12 @@ OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
>  /* Return the SMMUPciBus handle associated to a PCI bus number */
>  SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
>  
> +/* Return the SMMUPciBus handle associated to a PCI bus */
> +SMMUPciBus *smmu_get_sbus(SMMUState *s, PCIBus *bus);
> +
> +/* Initialize SMMUDevice handle associated to a SMMUPCIBus */
> +void smmu_init_sdev(SMMUState *s, SMMUDevice *sdev, PCIBus *bus, int devfn);
> +
>  /* Return the stream ID of an SMMU device */
>  static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  {

