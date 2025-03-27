Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3832581njc;
        Thu, 27 Mar 2025 01:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE8MjBQG6Kqi4SztWe+EEDJAC7tuA9mHJijvqrbE7XHFOkMV6+j46LiFBNCIajhb1Bm6XAi+gnUjj/zg==@linaro.org
X-Google-Smtp-Source: AGHT+IE1c60oN0mlIIE2CG5EkTfqATFnxNpUsB/MPa0xftj1OOfL2qYMPhYsi0QvyGIA+pZ4cRyp
X-Received: by 2002:a67:e7c2:0:b0:4bd:39c7:804d with SMTP id ada2fe7eead31-4c586c813f5mr2052298137.0.1743062494533;
        Thu, 27 Mar 2025 01:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743062494; cv=none;
        d=google.com; s=arc-20240605;
        b=IqPioFHzPi0aFiPa9VtFwXUh5uoAZkx5qAl+fTEXBIHIZL9Hxg7m/YmPheyDE85LmO
         Zejijk4pDUiLCsVHn5cQAah2M9anR/cdURUbDrceZLD4WxD2rOkFo/b8r6mlnFiEGHkK
         2fAveZyAak7RiMVXhFVLPVjZb/fdBNDE/y7JOd96Lk9vCFtTq2glm6fqDi7ec82m2w8I
         5EhlQszME6OEAJ1x0D8GuuVRUKcrxFnJ4ajajqlfVBb/H3yO/BnFoIzhNG306q7DMd4e
         TVJxTW7QzVBR+Rro6RRFdursTjYAA/8u5fI24SWyxha6CEanDBgkOtYD20n1rVNba9LF
         8LZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LxfaTQSdvHZjS7LjY13E1smQ5Ve382WxRDisOF5oFTI=;
        fh=EAQAkMlMuluk2jU3SSA/OCuRBY8ibEJS4NYCmidJWLo=;
        b=e6RQsxhoAqT0eKN8AeQcGyM881JxHv7Dgi1b8M+vdGhVoK5CyJe487t2BpG8v5fOLJ
         SinNnNMpoWzqynZPdqpOg93QA+qDTcSDpDKRzw0a71oxS1BOMS2+TjZ+lY89H2E5J7Ce
         0ANL5e9hFw54ZLMSw3n/zP1jFMqvpGKNYlAz1v+odlyYaDqGVUsLj7swLW924SqB+nj8
         mCt2Gek00aTBwFs+ZXVYc78KJ6FGW5GxSY3XoDyP0r3gRQ/lHYdLys05GHKm7TTCKDt3
         V9bH9Mv9gQfzXx6p18LZpx8t7NyiHb3VNVdAcxFeAmH1Fq9IbA32e9Gs1dxAX/X+zbUZ
         VkpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9aV84Iy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c50c03400dsi3180858137.485.2025.03.27.01.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 01:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9aV84Iy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txiAd-0005Ed-I5; Thu, 27 Mar 2025 04:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txiAZ-0005DU-H1
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 04:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txiAX-0004rT-63
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 04:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743062451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxfaTQSdvHZjS7LjY13E1smQ5Ve382WxRDisOF5oFTI=;
 b=L9aV84Iy0wHe8U8xAMXS6ahv1qRyaUDAL0vAw0Ou4ZElIKwUmh3ZWVg3jz5a+whyH5ogYt
 XUBg8GKfFZI0t+6sCX8Ryh4r+PNyK9tY4VlKnXNvX4/6bVLWQy+e3ZJbe/gVc5nOGiqO88
 gGL+PUCH1yUsUrLaYK+clymSFCaE5dw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-Xnu3CNSSMzmxAFr7kpX2oA-1; Thu, 27 Mar 2025 04:00:50 -0400
X-MC-Unique: Xnu3CNSSMzmxAFr7kpX2oA-1
X-Mimecast-MFC-AGG-ID: Xnu3CNSSMzmxAFr7kpX2oA_1743062448
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39149cbc77dso496142f8f.3
 for <qemu-arm@nongnu.org>; Thu, 27 Mar 2025 01:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743062447; x=1743667247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LxfaTQSdvHZjS7LjY13E1smQ5Ve382WxRDisOF5oFTI=;
 b=nZDJJKUvw2iUiUZCcEk2xRAqMifaNeQv1Oo6MJOes5MuMlgHYHC2QxOLRPLfQgp9jJ
 U8JOvDOAhazO/RTLMJNzF4vH4G976Rl0+LwbiASv4MTG01jYpP0w1qAklEAXOnL8GvBk
 ldDtT3Bh02BuIW9QzC+jJZKwGb0VgtGBPenzHvvYfsupZ33Z0OcCgbLdpBB2zg0eXpzH
 YaqVCLj/v7qz1zpV85UU90KvOGst1cLQjwDmw8zfOiZx50CypmQiAe8CKxPh+Mh/o8NX
 10ciC9JN5pwylBfRB8KGAU5ap5Dkqg8pW4DxNjYKz0d82XkAsDED/x3odt9pA01pulBr
 d/sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWynizAdhLgVN55EPqmrL2meQi4vElODFIgtZQuJ/rla3C71jDVxmMYHEdHRaBep3Mm8Jv2NhGQDw==@nongnu.org
X-Gm-Message-State: AOJu0Yydg+eMUUa6YUlYFH3SDG5nmLRFAsxPi3yT5eF6pU21r5iNUNg9
 6I67xXXjRZAW6gNngb3B9jmN+I8jRA9DfVYujCi5VJuB+FhicEw3flhgv87lPBUk7jsgN0TIIyA
 afnNoFEj8O3jerk1j8Q/Z5K5wnktcNG+h5aIaOARcGD4QPg04TwP21f3Ylw==
X-Gm-Gg: ASbGncvAcdyJUOZ0wHCdkCvHTa72jGcY2uNiGP0+oy0LR7pg7kxGsJXNVjKyTid85MQ
 p8d4ChmJpWfq2GNCo2EsTtES19GnnFsaaXmIUFxoHwKDvxTpmDhGDOla336uqPMyPeaKyvugCVZ
 7cxbzkL0u7Wn/pK+18bBDw/ONLL/0Z7URdH7gycw+iP1zKkK9luBSJGZCkRl3J0MMImcVRxk2Jn
 jSPfjbDvkWozNU7zu78k3sC4jumhCnnGo2J9LQG9Eooyxoy3gYtOji022cmMr9Sk2z8u9GTyK5V
 bvLPY5l2wWr0bP/cALFQNwQLV7IbYznSf3AsldvPBYs1tURtFsWlWEzYtTQG5s0=
X-Received: by 2002:a5d:6c6e:0:b0:390:d73a:4848 with SMTP id
 ffacd0b85a97d-39ad17890d7mr1679277f8f.47.1743062447587; 
 Thu, 27 Mar 2025 01:00:47 -0700 (PDT)
X-Received: by 2002:a5d:6c6e:0:b0:390:d73a:4848 with SMTP id
 ffacd0b85a97d-39ad17890d7mr1679225f8f.47.1743062447108; 
 Thu, 27 Mar 2025 01:00:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39acb5d0c33sm5861863f8f.26.2025.03.27.01.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:00:46 -0700 (PDT)
Message-ID: <deb9fd73-fc27-4eec-83dd-71f3f6908aa4@redhat.com>
Date: Thu, 27 Mar 2025 09:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
 <e23b4803-02d1-4850-8b6e-ad398a66a31c@redhat.com>
 <Z+RSeDAuUFtryi4E@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z+RSeDAuUFtryi4E@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Imfh1_La9YPxyumCXNXps2EinK-nvR-WHAV1DWhRhS4_1743062448
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: j1ZR4/nYU072



On 3/26/25 8:16 PM, Nicolin Chen wrote:
> On Wed, Mar 26, 2025 at 02:38:04PM +0100, Eric Auger wrote:
>>> +/* Update batch->ncmds to the number of execute cmds */
>>> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch)
>>> +{
>>> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(bs);
>>> +    uint32_t total = batch->ncmds;
>>> +    IOMMUFDViommu *viommu_core;
>>> +    int ret;
>>> +
>>> +    if (!bs->accel) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (!s_accel->viommu) {
>>> +        return 0;
>>> +    }
>>> +    viommu_core = &s_accel->viommu->core;
>>> +    ret = iommufd_backend_invalidate_cache(viommu_core->iommufd,
>>> +                                           viommu_core->viommu_id,
>>> +                                           IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
>>> +                                           sizeof(Cmd), &batch->ncmds,
>>> +                                           batch->cmds);
>>> +    if (total != batch->ncmds) {
>>> +        error_report("%s failed: ret=%d, total=%d, done=%d",
>>> +                      __func__, ret, total, batch->ncmds);
>> some commands may have been executed (batch->ncmds !=0). Is the
>> batch_cmds array updated accordingly? In the kernel doc I don't see any
>> mention of that.
> The uAPI kdoc of ioctl(IOMMU_HWPT_INVALIDATE) mentions:
>  * @entry_num: Input the number of cache invalidation requests in the array.
>  *             Output the number of requests successfully handled by kernel.
I was rather talking about the array of cmd itself but I guess it is
left unchanged.  don't know if we are supposed to retry sending failed
cmds or not.
>
>> Do you need to report a cmd_error as we do for some
>> other cmds?
> Yes, we do. And we did (in this patch)? cons would be updated:
> +    if (batch->ncmds && (dev_cache != batch->dev_cache)) {
> +        ret = smmuv3_accel_issue_cmd_batch(bs, batch);
> +        if (ret) {
> +            *cons = batch->cons[batch->ncmds];
> +            return ret;
cons is updated but error is not logged in this patch.
> +        }
> +    }
>
>>> +        return ret;
>>> +    }
>>> +
>>> +    batch->ncmds = 0;
>>> +    batch->dev_cache = false;
>>> +    return ret;
>>> +}
>>> +
>>> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
>> I was confused by the name. The helper adds a single Cmd to the batch,
>> right? so batch_cmd would better suited.
> Yea, it could be "smmuv3_accel_batch_cmd".
>
>>> +                            SMMUCommandBatch *batch, Cmd *cmd,
>>> +                            uint32_t *cons, bool dev_cache)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (!bs->accel) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (sdev) {
>>> +        SMMUv3AccelDevice *accel_dev;
>>> +        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
>>> +        if (!accel_dev->s1_hwpt) {
>> can it happen? in the positive can you add some comment to describe in
>> which condition?
> I recall this is for device cache specifically (i.e. CGFI_CD[_ALL]
> and ATC_INV) that I had in smmuv3_cmdq_consume(). Perhaps it gets
> here because Shameer separated the accel code from the non-accel
> smmuv3 file.
>
> This condition is to check if the device is attached to an accel
> HWPT, particularly to exclude commands being issued for emulated
> devices. Surely, if a device isn't attached to an accel stage-1
> HWPT any more, we probably shouldn't forward the commands to the
> kernel? Though I start to suspect that we might need a lock for
> accel_dev->s1_hwpt?
Yes worth to dig in and add a comment

Thanks

Eric
>
>>> +/**
>>> + * SMMUCommandBatch - batch of invalidation commands for smmuv3-accel
>>> + * @cmds: Pointer to list of commands
>>> + * @cons: Pointer to list of CONS corresponding to the commands
>>> + * @ncmds: Total ncmds in the batch
>> number of commands
> OK.
>
>>> + * @dev_cache: Issue to a device cache
>> indicate whether the invalidation command batch targets device cache?
> Maybe "invalidation command batch targeting device cache or TLB".
>
> Thanks
> Nicolin
>

