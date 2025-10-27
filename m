Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE91CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 10:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDKg8-0001Aa-9v; Mon, 27 Oct 2025 06:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDKfw-000194-Vh
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 06:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDKft-0001e4-DY
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 06:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761561723;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggc9Kl5RED4VqQC3cCXuhQvZwtc/ehSI3z2ToDhGaVk=;
 b=JZKF2ejX2vaFxcFfZKhN58LOCnkFZYcyyfbpn1gV2fAFFSID7s5U2l5E/KS5H5io8CAfBp
 8HV6scd8VkFov//bqGu8Qhj+4mik1vANKKFQiDBJ+IFAuRNjxicX2uppOkLNlWUqZqy8H4
 vF/iqPVVhFrC1VhzxQXphstgwmjmAVg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-0WWBc3sUPUaIrneEvNDZ0Q-1; Mon, 27 Oct 2025 06:42:01 -0400
X-MC-Unique: 0WWBc3sUPUaIrneEvNDZ0Q-1
X-Mimecast-MFC-AGG-ID: 0WWBc3sUPUaIrneEvNDZ0Q_1761561721
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-40fd1b17d2bso2585697f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 03:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761561720; x=1762166520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ggc9Kl5RED4VqQC3cCXuhQvZwtc/ehSI3z2ToDhGaVk=;
 b=aWjPoXVAELZzVdcZTyhqumLNfeQ8Vo5P8iMY1XRmwKlUe4x4ZqBGFafZBOETu7LZcS
 c9liUMA371s9/OgLrsCELgdlvL4Th08i5dihHrD2M3rFojM9jYfrGXAyf2PjhsVgjxBv
 kn5zCCWzD+XtyO4x+RanLjFlYAuOJAop+6qhiKrUDQZETfCL3ROwMqfhuRHhJ3qblUKh
 WrPBcotQggSHUdMgSfyfbMhcoe/At9qkh42b4fQHv/T/GA8ScnVWIVwqPMNISatA37m+
 /GOQDsBjYoJ/CLxKrncsTb6W7nzp1yA09DG26jWHIKxYxVq2z6nES7jB/skKzoEtv2Vf
 cYtg==
X-Gm-Message-State: AOJu0YyPe76tFQk63qoz302Y/PHLSBlpvVmLBvRhsIfTC37cIZPwSdDm
 KzuxByZyFRpK6G9GVL+6BtB8jmakW5htWxPVuMEuHlCNrDn4yVfMzYIqodjj7hQoZOn+RlHFMuI
 GIguZRRby1r7zWfHWHIcXwFb6nqWMtGfOh7iQjR/RBcZYyit3QD67gw==
X-Gm-Gg: ASbGncvA6oz/TNikn4d3AApWVGJADzarLf8yge0kGXmo7GUE7fgigjDIiwyeH/sBr8p
 zPsHFeomDGGC+cNQW98fbsObwWErVkN2zcan215bDVRGbh13JJWi7yYPXDwmusDIMWNJb4pEBIU
 XE/ABNhZRi3bwJie/tuafOS1n1SAwUTJ1FQM3mSJZcR1aaF28zak/kG4/yofguKsmhxLiGO9SYW
 VVuqMzM0DR5rCjhnFSWTwYe7be3LD1gMvOJ32Sru8sTXfITjRsDVxejWatG0iuKu2WOxomd55dR
 Z2UaZo0yUon/bbvICAqUpTskokhUWBuuy3XLkTjMeXHtwKMfjXjN4lcDlq+/2G735Qmyy9VdQaW
 w+UoEs/l50VbcV/+yMbBIalvQWTjWdWkVQRiEElX2mjXTKg==
X-Received: by 2002:a05:6000:2dc6:b0:3ec:d78d:8fcc with SMTP id
 ffacd0b85a97d-42990709209mr8727402f8f.14.1761561720468; 
 Mon, 27 Oct 2025 03:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfvd/sB9b0esZvz/GpS3GBe7DnAoRPrdKfhSzVnKcMCtpxhLjomzc8Fu2Lmbq5E2nLEBIIfQ==
X-Received: by 2002:a05:6000:2dc6:b0:3ec:d78d:8fcc with SMTP id
 ffacd0b85a97d-42990709209mr8727369f8f.14.1761561719901; 
 Mon, 27 Oct 2025 03:41:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db839sm13904322f8f.34.2025.10.27.03.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 03:41:59 -0700 (PDT)
Message-ID: <c7253b37-23bb-4147-8415-3c05aa7c15e4@redhat.com>
Date: Mon, 27 Oct 2025 11:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/27] hw/arm/smmuv3-accel: Get host SMMUv3 hw info and
 validate
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-15-skolothumtho@nvidia.com>
 <20251001135604.00006776@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251001135604.00006776@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pRK7CFbHyzPNUYZ6niVeAsFovF5On4zn_8ylTD49BGM_1761561721
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 10/1/25 2:56 PM, Jonathan Cameron wrote:
> On Mon, 29 Sep 2025 14:36:30 +0100
> Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>> Just before the device gets attached to the SMMUv3, make sure QEMU SMMUv3
>> features are compatible with the host SMMUv3.
>>
>> Not all fields in the host SMMUv3 IDR registers are meaningful for userspace.
>> Only the following fields can be used:
>>
>>   - IDR0: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN, CD2L, ASID16, TTF
>>   - IDR1: SIDSIZE, SSIDSIZE
>>   - IDR3: BBML, RIL
>>   - IDR5: VAX, GRAN64K, GRAN16K, GRAN4K
>>
>> For now, the check is to make sure the features are in sync to enable
>> basic accelerated SMMUv3 support.
>>
>> One other related change is, move the smmuv3_init_regs() to smmu_realize()
>> so that we do have that early enough for the check mentioned above.
>>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Hi Shameer,
>
> Back to this series...
>
> Various things in the checks in here.
>
> Jonathan
>
>> ---
>>  hw/arm/smmuv3-accel.c | 98 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/smmuv3.c       |  4 +-
>>  2 files changed, 100 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>> index 9ad8595ce2..defeddbd8c 100644
>> --- a/hw/arm/smmuv3-accel.c
>> +++ b/hw/arm/smmuv3-accel.c
>> @@ -39,6 +39,96 @@
>>  #define STE1_MASK     (STE1_ETS | STE1_S1STALLD | STE1_S1CSH | STE1_S1COR | \
>>                         STE1_S1CIR | STE1_S1DSS)
>>  
>> +static bool
>> +smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>> +                                 struct iommu_hw_info_arm_smmuv3 *info,
>> +                                 Error **errp)
>> +{
>> +    uint32_t val;
>> +
>> +    /*
>> +     * QEMU SMMUv3 supports both linear and 2-level stream tables.
>> +     */
> Single line comment would be more consistent with below and looks to be under 80 chars.
>
>> +    val = FIELD_EX32(info->idr[0], IDR0, STLEVEL);
>> +    if (val != FIELD_EX32(s->idr[0], IDR0, STLEVEL)) {
>> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, val);
> This seems a rather odd side effect to have.  Perhaps a comment on why
> in error path it make sense to change s->idr[0]?
also consider s->idr[] are not migrated. I know there is a migration
blocker set in 20/27 though. I would simply return an error here.
>
>> +        error_setg(errp, "Host SUMMUv3 differs in Stream Table format");
>> +        return false;
>> +    }
>> +
>> +    /* QEMU SMMUv3 supports only little-endian translation table walks */
>> +    val = FIELD_EX32(info->idr[0], IDR0, TTENDIAN);
>> +    if (!val && val > FIELD_EX32(s->idr[0], IDR0, TTENDIAN)) {
> This is a weird check.  || maybe?
>
> Otherwise if !val is true, then val is not likely to be greater than anything.
> imply check info idr0 ttendian == s->idr[0] one (=2)?
>
>> +        error_setg(errp, "Host SUMMUv3 doesn't support Little-endian "
>> +                   "translation table");
>> +        return false;
>> +    }
>> +
>> +    /* QEMU SMMUv3 supports only AArch64 translation table format */
>> +    val = FIELD_EX32(info->idr[0], IDR0, TTF);
>> +    if (val < FIELD_EX32(s->idr[0], IDR0, TTF)) {
>> +        error_setg(errp, "Host SUMMUv3 deosn't support Arch64 Translation "
> Spell check the messages. doesn't.
>
>> +                   "table format");
>> +        return false;
>> +    }
>> +
>> +    /* QEMU SMMUv3 supports SIDSIZE 16 */
>> +    val = FIELD_EX32(info->idr[1], IDR1, SIDSIZE);
>> +    if (val < FIELD_EX32(s->idr[1], IDR1, SIDSIZE)) {
> Why not
>     if (FIELD_EX32(info->idr[1], IDR1, SIDSIZE) <
> 	FIELD_EX32(s->idr[1], IDR1, SIDSIZE))
> I.e. why does the local variable make sense in cases where the value is
> only used once.  To me if anything this is slightly easier to read.   You could
> even align the variables so it's obvious it's comparing one field.
>
>     if (FIELD_EX32(info->idr[1], IDR1, SIDSIZE) <
> 	FIELD_EX32(s->idr[1],    IDR1, SIDSIZE))
>   
>> +        error_setg(errp, "Host SUMMUv3 SIDSIZE not compatible");
>> +        return false;
>> +    }
>> +
>> +    /* QEMU SMMUv3 supports Range Invalidation by default */
>> +    val = FIELD_EX32(info->idr[3], IDR3, RIL);
>> +    if (val != FIELD_EX32(s->idr[3], IDR3, RIL)) {
>> +        error_setg(errp, "Host SUMMUv3 deosn't support Range Invalidation");
> doesn't.
as Jonathan suggested you might avoid using the local var here too and below
>
>> +        return false;
>> +    }
>> +
>> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN4K);
>> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN4K)) {
>> +        error_setg(errp, "Host SMMUv3 doesn't support 64K translation granule");
> That doesn't smell like it's checking 64K
>> +        return false;
>> +    }
>> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN16K);
>> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN16K)) {
>> +        error_setg(errp, "Host SMMUv3 doesn't support 16K translation granule");
>> +        return false;
>> +    }
>> +    val = FIELD_EX32(info->idr[5], IDR5, GRAN64K);
>> +    if (val != FIELD_EX32(s->idr[5], IDR5, GRAN64K)) {
>> +        error_setg(errp, "Host SMMUv3 doesn't support 16K translation granule");
> Nor is this one seem likely to be checking 16K. 
>> +        return false;
>> +    }
>> +    return true;
>> +}
>> +
>> +static bool
>> +smmuv3_accel_hw_compatible(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>> +                           Error **errp)
>> +{
>> +    struct iommu_hw_info_arm_smmuv3 info;
>> +    uint32_t data_type;
>> +    uint64_t caps;
>> +
>> +    if (!iommufd_backend_get_device_info(idev->iommufd, idev->devid, &data_type,
>> +                                         &info, sizeof(info), &caps, errp)) {
>> +        return false;
>> +    }
>> +
>> +    if (data_type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
>> +        error_setg(errp, "Wrong data type (%d) for Host SMMUv3 device info",
>> +                     data_type);
> Alignment looks off.
>
>> +        return false;
>> +    }
>> +
>> +    if (!smmuv3_accel_check_hw_compatible(s, &info, errp)) {
>> +        return false;
>> +    }
>> +    return true;
return  smmuv3_accel_check_hw_compatible(s, &info, errp)
>> +}
>> +
>
Eric


