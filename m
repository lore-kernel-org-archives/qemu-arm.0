Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3484470njc;
        Wed, 26 Mar 2025 10:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFBk/L8MooHzlNPMoHdSU8O0/Qopa0x4hjriskA30eXCqfuGqppCPaRHlHYXCM4zak8hw6JoWQvYiPAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHjGIy8MR0blKQRlGWtbn9fLROO6Ur9DoBCS8oxA5CtlcOFvfjwCqH7iwifm77+yT9Vmysg
X-Received: by 2002:a05:622a:259b:b0:476:af18:239d with SMTP id d75a77b69052e-4776e21c081mr8280311cf.51.1743011004151;
        Wed, 26 Mar 2025 10:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743011004; cv=none;
        d=google.com; s=arc-20240605;
        b=EQllJ6aopYajvmacMfMy/HO1bXF+APhVyjWA9gCyQiRyTAgAz8hMyE1qF5NvvKsJ0u
         oVuCrnXuIPrUvoxePc/qphxYCFQ6jaHZYWDKhmWDhrwWk5qMM5NOUUnTkH8bV5eyL5ew
         ehYMDFI2WtTp8Qq4YAd8Y+cbZ8jRGV1RGkNt6OxvmWqz0S2e64M+IKPy+a04wziTJTbF
         3ajgo0HnTXLvE7pkBkQ++fr81GNWbg2XiOzIV4oUSqFpvQqJjv+4J41DwxaLObhdrwil
         FLiemACmkgAoLHQy2JN2h5oiW7A7uTkssBIwcCRVAx7ZE7fVXvyYam09ElsGZ+zbJWq1
         W0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jTJ0C7Goe9kJnjrceh72nLA7Q8PYNzitscojKrqHVDg=;
        fh=KufzrQdO9SlXbJnJr4Q4i9pd+Cj0/RAEgAJwYesJ1jg=;
        b=PF8Ed1PZsP2LKdvcBMjAVE5/hvLMBDK8gCQ3WXeof7XjGgdkz/QHrLB8VLQKUNsD7z
         2ebG/+hWbgglz4bnGbveJHJUIM3mBfSK6p9GiUJX5uHy31BzkfcDrnEqpFxRs/xxGz1H
         ohJoutUF/LvbADsFmEMz5bO4kzncJYmMqVt0a6QyjZf4jLgqFuS0Xg7A0vkdiPCPBPfL
         YWwhlq0nM/N9zCaLeubA68/N8sQ0xWabmWTByKVB+K7/VkLKauKZAsNy3QLkEWTH+Uy/
         MRTKxSfXWTZ2uvdYwsFx9cKtlLg/BJ12PQZ/gVpzjD5SkQT6DFjJ0TGHmbJudIJVlJw7
         Xzgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QBH/remi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d63b0a2si119780201cf.566.2025.03.26.10.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 10:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QBH/remi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txUkr-0000UE-3A; Wed, 26 Mar 2025 13:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txUjq-000710-76
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 13:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txUjm-0005Zu-7a
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 13:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743010821;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTJ0C7Goe9kJnjrceh72nLA7Q8PYNzitscojKrqHVDg=;
 b=QBH/remiyETZAXMsy/K6zJDtAW61V6JO+pN6/VGzmIrUoUi09IZzhIPkdnPAPBrqIKDfk6
 K0Hun6nNYitq7mc9fdSnJWsbvkMIZVldXo9Il3DpVthvBweNJmLnExVS2NqcGr2g3/YiUC
 USsfMKT0SlklI2mMY20Ej5oNPqUW0O4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-6diHIRcGPeCYXqrH243eqQ-1; Wed, 26 Mar 2025 13:40:14 -0400
X-MC-Unique: 6diHIRcGPeCYXqrH243eqQ-1
X-Mimecast-MFC-AGG-ID: 6diHIRcGPeCYXqrH243eqQ_1743010813
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso740985e9.0
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 10:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743010813; x=1743615613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTJ0C7Goe9kJnjrceh72nLA7Q8PYNzitscojKrqHVDg=;
 b=Pmy2IHA3wKq0WY8UrPwUcaEDsj3iQDJ4cnir0O9f4oRveHYjJd/yIJ+z63ojT3LkjH
 JGMTRsWcNxROEOnaBIdAYsVFdEGXFKPWzqD54JrQSP3ru3ZHbukf4tHh432Q0BWw4bx1
 Txeg/gNM/TmiyZwPNBazEQR1XqbxHJxuLsO4bS8NYLuasu2kKOgCQ2vOF11HtnpQv7WX
 4TM7Tl0AMm1wq/ChHjG8TjnnaJd6Vonf6uftdKpEaHspk8Otcw8084nNhIhaqowVAyqI
 QtDmVxatyJiKWM+5jGfT4Ibv1C3UFwbfzJ1gsgIOIt69q7KnK/4nHGfG4mGk7ua5y84w
 W0vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvCvt8UGjOogk9dztNOmG7h4Y/MZ5if9Q7WqrzJN4Rs6bHCqT60wF3rgZ+k/g4gJ66F2hnpQghxg==@nongnu.org
X-Gm-Message-State: AOJu0Yw5QkMLt27YgAwNl5DDv7MjQNZ40aMZkbXAXvXGhOHSYMxyXwHg
 4NVfdFlIRYg4PIt7HY+Gyn2Rr2mgt/mcM3+rADLGCqDbYeHWu8GyQbcVSi939Nvi1cCxr7I2jZK
 W9a1skZr2w8sgYgxymYr6jMMV9SHAzeCY8Y/edYyty2KMVSbZfg==
X-Gm-Gg: ASbGncsOxIAU66yuDZ+VjnOlKSahMDRR/r/VvqA4RflVqGCfbXEQn3y3ROJZqurtsNf
 L5vIY2qBBJf07MrVtahHRoUwcZfSLR+UndK4/F2kC6vj4zeWiRM+3tzbS35hlEFxv+JfQ+I/Fi1
 RBUTsobzmz+0UFxPQ/RGv6OUNnhW8KLqd94y3wa408i1Mt7BDjyl+ZMzA6gNRhNqzIEOFMS6R+O
 4pnvqfgxQraHpzCFDL3j7/pYJc9dh7XBSEZ1VSv59x5QUO1wAKEQ7rWQZ7VD3jkrm0n/BQb1d8B
 zJNCB87RlwbKD07qJmhokWvt8dGaHskecHqSQcQK8CUKwAaxsgHM+a2Pm1R7EpQ=
X-Received: by 2002:a05:600c:3483:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-43d84fba8d5mr4381965e9.13.1743010812799; 
 Wed, 26 Mar 2025 10:40:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3483:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-43d84fba8d5mr4381585e9.13.1743010812307; 
 Wed, 26 Mar 2025 10:40:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314b9e9sm8886385e9.37.2025.03.26.10.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 10:40:11 -0700 (PDT)
Message-ID: <4a6103cd-a007-4cb2-bd3b-1bc39c0ecd9e@redhat.com>
Date: Wed, 26 Mar 2025 18:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 18/20] hw/arm/smmu-common: Bypass emulated IOTLB
 for a accel SMMUv3
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-19-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-19-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dcw11wyEV-C3m30RSuG_jT3sMssXpaFswMjYw8Qz-jo_1743010813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EHmRm4YE/jf6



On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> If a vSMMU is configured as a accelerated one, HW IOTLB will be used
> and all cache invalidation should be done to the HW IOTLB too, v.s.
> the emulated iotlb. In this case, an iommu notifier isn't registered,
> as the devices behind a SMMUv3-accel would stay in the system address
> space for stage-2 mappings.
>
> However, the KVM code still requests an iommu address space to translate
> an MSI doorbell gIOVA via get_msi_address_space() and translate().
In case we you flat MSI mapping, can't we get rid about that problematic?

Sorry but I don't really understand the problematic here. Please can
elaborate?

Thanks

Eric
>
> Since a SMMUv3-accel doesn't register an iommu notifier to flush emulated
> iotlb, bypass the emulated IOTLB and always walk through the guest-level
> IO page table.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 9fd455baa0..fd10df8866 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -77,6 +77,17 @@ static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
>      uint8_t level = 4 - (inputsize - 4) / stride;
>      SMMUTLBEntry *entry = NULL;
>  
> +    /*
> +     * Stage-1 translation with a accel SMMU in general uses HW IOTLB. However,
> +     * KVM still requests for an iommu address space for an MSI fixup by looking
> +     * up stage-1 page table. Make sure we don't go through the emulated pathway
> +     * so that the emulated iotlb will not need any invalidation.
> +     */
> +
> +    if (bs->accel) {
> +        return NULL;
> +    }
> +
>      while (level <= 3) {
>          uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
>          uint64_t mask = subpage_size - 1;
> @@ -142,6 +153,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>      SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
>      uint8_t tg = (new->granule - 10) / 2;
>  
> +    /*
> +     * Stage-1 translation with a accel SMMU in general uses HW IOTLB. However,
> +     * KVM still requests for an iommu address space for an MSI fixup by looking
> +     * up stage-1 page table. Make sure we don't go through the emulated pathway
> +     * so that the emulated iotlb will not need any invalidation.
> +     */
> +    if (bs->accel) {
> +        return;
> +    }
> +
>      if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
>          smmu_iotlb_inv_all(bs);
>      }

