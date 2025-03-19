Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3349634njb;
        Tue, 18 Mar 2025 19:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrCiM8CAEwOboTrjqYPThQFmwVR1DFHHLEd90u+zzC/V+wXVO1z2XbCwlOXnu1FWxusN+UZx64CE34qQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGh78/gaC/ynzSve0D5S2d1/+cmrDjye7ouKSTGf0EURVSB6HUXXOOfd57WBu7rR0DZ6QbP
X-Received: by 2002:ad4:5de7:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6eb293b3a70mr17635516d6.20.1742352384072;
        Tue, 18 Mar 2025 19:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742352384; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlAcN9og1uiduWz451MK+EY+l5BHsyqVK5NrJCsEDwCEzVxDIaVig273QHMHQQ6th8
         trgYpm4Eorp3Y81L1dGHiLDqDj33jggj6VkEzn24gd2FCsPNt1vul/B5zZk0pcYeB00V
         AFZSE2mmdYeSGBMA7SouKIJRkiK8bBeMvpgLZaDP2+xt47YNFcekYozEoQunJnwlIzEl
         DkVlOdjeDfKJZj+9tnnLTLfeRmPKFHuRHq/LobHI7vjs4bA0PQNtxsQ/PqfwloKO7t7B
         xWNp/v7s8le6FxAfUKxNL2r3KIa17ZD5F0wge0y+EMCcu+qoZ4jGz7o8xBZmw2fLHv6j
         uZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kbgtbwPmXLQ6f9P5DYfklHc2jBXnpoeusKyUKXzea9I=;
        fh=j+E37C8BUzU+o2fTLqpaAb7B4BAeBDaStOvA7fseu2M=;
        b=RBxm73Au0cvjWtMCzNDU2ptBQD3wMxc0GBoSqirzTA6t5egoAqAuq7krQo3cnk9cqy
         kb9QMlRY5HKUHH/C0HHnOT45q8nkKWoPHljxOA+T5rSjbQGhzR7BXVuJ6tqWiundllUA
         Wi1nmFtrBib2a/msVVrHnWUBCtK/zetObRewtom2xQd5vHtcvWdUlPFLzzNXp7+zUC/v
         ktNdnQEsyTTSuMKEhNQrEWS9PSL2jmP1h5kAOFcGbgf3QkZJ57YgyYPOINQRKkE3Uz/Y
         lO3u7l7rJhd1ZMwgcf9Kjyx4GFJsTtrp+NMo/MRuZq3TN7Cmg2AMuAnpREneEP+QOg26
         bMPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0NFk4Tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade20e2adsi132660566d6.116.2025.03.18.19.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 19:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0NFk4Tw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tujRN-0003Zk-4j; Tue, 18 Mar 2025 22:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tujRF-0003Vv-VG
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 22:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tujRE-00049h-0M
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 22:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742352347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbgtbwPmXLQ6f9P5DYfklHc2jBXnpoeusKyUKXzea9I=;
 b=X0NFk4TwF6GkCuUtvDQYmsiwcqktM2xczSQnjZVezye0B0IRUuyAiUScex+MdLikR/99xm
 TwvGjR1TsM5v7DPQstRp6xSi+Y66d8h9YqXwxaES5BOFtTxDXFbHDET9c1OI18+A38K8EH
 20fzVGctNhrLRwjy6lDg7lB5g+5o6AE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-LDPTe5mEMf2qnbqB87ljxg-1; Tue, 18 Mar 2025 22:45:44 -0400
X-MC-Unique: LDPTe5mEMf2qnbqB87ljxg-1
X-Mimecast-MFC-AGG-ID: LDPTe5mEMf2qnbqB87ljxg_1742352344
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85b4ee2e69bso766050639f.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 19:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742352344; x=1742957144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kbgtbwPmXLQ6f9P5DYfklHc2jBXnpoeusKyUKXzea9I=;
 b=tb/7RO0P7M1QqrLGIEG3gtw3Pyt5HekCCQdLigaqBbiui4qSrJ3OFPa9KbWLWllAnX
 CzCX/BxGB/BpolYB+PEoQZ5Wt1PD3j8tKcy6fBWzJm7jk2KCI1c5Ukn3N+UXIKlqPYSw
 2Lpkgca64ylUPs8G158x1KwJsx54OGMjdUNFdTLdvqfNHAEK/q3EzupvsWuGDPdtLOzQ
 FUqj00YKF8QnHkamvi6Hth+5Yq2dhcX3Ly4XFLCzTeE5cwO4fvKkyub7mEW+P6RVgqKh
 32+/W+ELDkYh9K0+cTcKq1wBmAhHScjGRdT/gjWiily1VVL5w6NA7dMf6/mn/OG6zNRY
 NEjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgv/tj4xFaFrhSSrU/ItjKYLt5L7tEOuo164eVvelVL/GyvgWLRihKPSAysL4QinEvF0M6S7U7Mg==@nongnu.org
X-Gm-Message-State: AOJu0YzbxOsupDhKP23VDyECmc3KOJ8AG59e7eFJSOrtQ6pw/j9nlmSc
 EzcAfFsWYGF94OuWVniY4vJZxyLQ/gjzEgPQgWBFfQe+7rx6muJBRnLxd5JGlajrGhfVrkotve/
 m6+yYqW9etFBTrWScY1eQNpLqUgA5v3ZdecV3nI3vfDmHmJ13TQ==
X-Gm-Gg: ASbGncuxLQ1PpU5S1ASNpovenaECznbnNCRMdkovBomMZSQ9vwyrMPoZ1M6ihzC3O4q
 Av3N+w3xKvxvuCQnI0hLljYkBfyT8W28afm88TljCRFylHTkFN3LnVaSWlnAQsnarhQoXaRX2Fc
 9vc3PzYryqrVlblxyXdxawR/og21+XG2HjVq/Dmdjxd73a81kFxAI+bioZnD09N71vL0l5Idaa4
 Gj3e/0jK/7YRR1MTYJIiyeB/8hyfg9BcTWLNdCC1SMQp1CIkMe1aPsKwbWaCFBr3LVZG1DeqM3G
 KoZcPu3dpZQYtkm3
X-Received: by 2002:a05:6602:3a0a:b0:85b:3e32:9afb with SMTP id
 ca18e2360f4ac-85e138a678emr154259939f.14.1742352343671; 
 Tue, 18 Mar 2025 19:45:43 -0700 (PDT)
X-Received: by 2002:a05:6602:3a0a:b0:85b:3e32:9afb with SMTP id
 ca18e2360f4ac-85e138a678emr154257939f.14.1742352343293; 
 Tue, 18 Mar 2025 19:45:43 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85db8777bf0sm293160339f.13.2025.03.18.19.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 19:45:42 -0700 (PDT)
Message-ID: <ee0025f3-7523-4fd3-8099-7a1dd1e7451b@redhat.com>
Date: Tue, 18 Mar 2025 22:45:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 16/20] hw/arm/smmuv3-accel: Read host SMMUv3 device
 info
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-17-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250311141045.66620-17-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6SBD9uf43UakZvIJtzrS_nfj_madgC6KoobNba0yNiw_1742352344
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OC+Cfj9G1QS4

Shameer,

Hey,


On 3/11/25 10:10 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Read the underlying SMMUv3 device info and set corresponding IDR
> bits. We need at least one cold-plugged vfio-pci dev associated
> with the smmuv3-accel instance to do this now.  Hence fail if it
> is not available.
> 
> ToDo: The above requirement will be relaxed in future when we add
> support in the kernel.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/smmuv3-accel.c         | 104 ++++++++++++++++++++++++++++++++++
>   hw/arm/trace-events           |   1 +
>   include/hw/arm/smmuv3-accel.h |   2 +
>   3 files changed, 107 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 09be838d22..fb08e1d66b 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -15,6 +15,96 @@
>   
>   #include "smmuv3-internal.h"
>   
> +static int
> +smmuv3_accel_dev_get_info(SMMUv3AccelDevice *accel_dev, uint32_t *data_type,
> +                          uint32_t data_len, void *data)
> +{
> +    uint64_t caps;
> +
> +    if (!accel_dev || !accel_dev->idev) {
> +        return -ENOENT;
> +    }
> +
> +    return !iommufd_backend_get_device_info(accel_dev->idev->iommufd,
> +                                            accel_dev->idev->devid,
> +                                            data_type, data,
> +                                            data_len, &caps, NULL);
> +}
> +
> +static void smmuv3_accel_init_regs(SMMUv3AccelState *s_accel)
> +{
> +    SMMUv3State *s = ARM_SMMUV3(s_accel);
> +    SMMUv3AccelDevice *accel_dev;
> +    uint32_t data_type;
> +    uint32_t val;
> +    int ret;
> +
> +    if (!s_accel->viommu || QLIST_EMPTY(&s_accel->viommu->device_list)) {
> +        error_report("At least one cold-plugged vfio-pci is required for smmuv3-accel!");
> +        exit(1);
> +    }
> +
> +    accel_dev = QLIST_FIRST(&s_accel->viommu->device_list);
> +    if (accel_dev->info.idr[0]) {
> +        info_report("reusing the previous hw_info");
> +        goto out;
> +    }
> +
> +    ret = smmuv3_accel_dev_get_info(accel_dev, &data_type,
> +                                    sizeof(accel_dev->info), &accel_dev->info);
> +    if (ret) {
> +        error_report("failed to get SMMU device info");
> +        return;
> +    }
> +
> +    if (data_type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +        error_report("Wrong data type (%d)!", data_type);
> +        return;
> +    }
> +
> +out:
> +    trace_smmuv3_accel_get_device_info(accel_dev->info.idr[0],
> +                                       accel_dev->info.idr[1],
> +                                       accel_dev->info.idr[3],
> +                                       accel_dev->info.idr[5]);
> +
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, BTM);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, BTM, val);
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, ATS);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, val);
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, ASID16);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, val);
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, TERM_MODEL);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TERM_MODEL, val);
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, STALL_MODEL);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, val);
> +    val = FIELD_EX32(accel_dev->info.idr[0], IDR0, STLEVEL);
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, val);
> +
> +    val = FIELD_EX32(accel_dev->info.idr[1], IDR1, SIDSIZE);
> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SIDSIZE, val);
> +    val = FIELD_EX32(accel_dev->info.idr[1], IDR1, SSIDSIZE);
> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE, val);
> +
> +    val = FIELD_EX32(accel_dev->info.idr[3], IDR3, HAD);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, val);
> +    val = FIELD_EX32(accel_dev->info.idr[3], IDR3, RIL);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, val);
> +    val = FIELD_EX32(accel_dev->info.idr[3], IDR3, BBML);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, val);
> +
> +    val = FIELD_EX32(accel_dev->info.idr[5], IDR5, GRAN4K);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, val);
> +    val = FIELD_EX32(accel_dev->info.idr[5], IDR5, GRAN16K);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, val);
> +    val = FIELD_EX32(accel_dev->info.idr[5], IDR5, GRAN64K);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, val);
> +    val = FIELD_EX32(accel_dev->info.idr[5], IDR5, OAS);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, val);
> +
> +    /* FIXME check iidr and aidr registrs too */
> +}
> +
>   static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *s, SMMUPciBus *sbus,
>                                                   PCIBus *bus, int devfn)
>   {
> @@ -484,11 +574,25 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>       bs->unset_iommu_device = smmuv3_accel_unset_iommu_device;
>   }
>   
> +static void smmuv3_accel_reset_hold(Object *obj, ResetType type)
> +{
> +    SMMUv3AccelState *s = ARM_SMMUV3_ACCEL(obj);
> +    SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_GET_CLASS(s);
> +
> +    if (c->parent_phases.hold) {
> +        c->parent_phases.hold(obj, type);
> +    }
> +    smmuv3_accel_init_regs(s);
> +}
reset has to be moved from hold to exit phase....
Eric recently posted a fix for this issue in upstream.

... and if accel was just a feature of the common smmuv3 support, this reset wouldn't be needed...

> +
>   static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>       SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_CLASS(klass);
>   
> +    resettable_class_set_parent_phases(rc, NULL, smmuv3_accel_reset_hold, NULL,
> +                                       &c->parent_phases);
>       device_class_set_parent_realize(dc, smmu_accel_realize,
>                                       &c->parent_realize);
>       dc->hotpluggable = false;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index cd2eac31c2..c7a7e58291 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -62,6 +62,7 @@ smmu_reset_exit(void) ""
>   smmuv3_accel_set_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x)"
>   smmuv3_accel_unset_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x"
>   smmuv3_accel_install_nested_ste(uint32_t sid, uint64_t ste_1, uint64_t ste_0) "sid=%d ste=%"PRIx64":%"PRIx64
> +smmuv3_accel_get_device_info(uint32_t idr0, uint32_t idr1, uint32_t idr3, uint32_t idr5) "idr0=0x%x idr1=0x%x idr3=0x%x idr5=0x%x"
>   
>   # strongarm.c
>   strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index 58e68534c0..9e30d7d351 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -52,6 +52,7 @@ typedef struct SMMUv3AccelDevice {
>       SMMUViommu *viommu;
>       SMMUVdev   *vdev;
>       AddressSpace as_sysmem;
> +    struct iommu_hw_info_arm_smmuv3 info;
>       QLIST_ENTRY(SMMUv3AccelDevice) next;
>   } SMMUv3AccelDevice;
>   
> @@ -68,6 +69,7 @@ struct SMMUv3AccelClass {
>       /*< public >*/
>   
>       DeviceRealize parent_realize;
> +    ResettablePhases parent_phases;
>   };
>   
>   #endif /* HW_ARM_SMMUV3_ACCEL_H */

In general, I would move this common code stuff at the front of the patch series... just gathering registers, capabilities, etc.

- Don

