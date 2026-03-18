Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2856FCD0C4
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Mar 2026 13:39:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2r6a-0005oz-Ju; Wed, 18 Mar 2026 09:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w2r6Y-0005oU-DA
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 09:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w2r6S-0004r4-HK
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 09:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773841105;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHy74zBcUtTjGuG/fZ3x8LvEm/fw1yoO28Qai5WOdaM=;
 b=TROxiBrt/l8Ld1isINZxi/+DUf6aM2Sgx2qr2C4oTCkWXM0GP045wv68vtoaChJ0/SVU5A
 7nifVNTSWUxNkA+/RD8Df5cCK3vON7vGe5FIW0bQjv1cSg5km/IWkQurjj8wUNzDcXsyLp
 tmhi4Un2Ol9PpOJp4VfO3BcZrLLUuCg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-c-seOBzaOJK8hFAG6wvsIw-1; Wed, 18 Mar 2026 09:38:21 -0400
X-MC-Unique: c-seOBzaOJK8hFAG6wvsIw-1
X-Mimecast-MFC-AGG-ID: c-seOBzaOJK8hFAG6wvsIw_1773841101
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43b53023d60so180070f8f.2
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773841100; x=1774445900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHy74zBcUtTjGuG/fZ3x8LvEm/fw1yoO28Qai5WOdaM=;
 b=FB0l+wOwriJ5zu9xxDfE7ki60vIXHmSLYkoxSilh7gukS1c28cL4bkwCQWE16YFLJg
 RL42njnclqzXRjpaPdf6p/fkWEOsmFFKGxv9hAhHcwtNfxBU/bLtVYsCWb/Ald9zKvWZ
 CglnN5GiaBO7GwFLxVXhiZb/DqL8WMpgK/oPOvfQ6QzfKceO3yU4eovlO+lIOOJarzV+
 W8UISgYAMqnXGxJSS3kdMhI4PVoX4wVZAsOVXZoN/K82Qq7xPVl2ineC/h3t++jjPocH
 XwVA1MZZ3yTyA8hgVxtQs6+rE/lHGQyfip2sHBNKYNkqRLVoaVpXkiOyD+6BowESGL8v
 llKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNR3SzFDnLYCFu3nEB9cJoK1Y0kk06JpDN1PHYg9E09SC0XzVb1yQI31LuZ6vVf/qgKF+qW2k3dA==@nongnu.org
X-Gm-Message-State: AOJu0Yw4I2iD28rYtcOSdX5DkFr/QZ8pLn20XYtM8C0sNtksLtJPa5z8
 /UDcR8ogPFVMpYDLxYCoyJIuCT3sMXnOGkRQZUVAFshc25jE5mRGPVyqlamI11qWZR3FTLVsbm6
 cY7TT77cHqJ3rtt7BGXUe3bVjSL54pvcFJJsLZ3lGbwANXpn0Asr5ag==
X-Gm-Gg: ATEYQzy5Fg2McqYz/7vU+lMqvVCY9t0yxhJCCG5k2JwV44PchK9C6r3X4fv/cls2y/z
 0zAkfGnbpiHOk3eDo17fzT7uJ/u2Z/nHUTnH6XAojkekJenrIqgZHFLw74nTio1UlUme4kIiLkZ
 Ydq7yGIkqRq5bQcipDvKZNYK+O43airxiVFA+T6tlqNH9J/amwZwUER2h5+9LVbl/FL3PfH3o11
 SNb2NkKokKQG/DatZW4zMDE2MZn+S5SPSdWXn9+nSY7y6/82UnB2osbik/M2AIXDz6wzxDsRlql
 m8x1PMVTDj0HLuq7nll5cogRi5ACn/b3unp4qjIrjuxKwSAccTwdpfJhy7MALvoD858eIjmTzOM
 tU+eCpseKeFy25TsaPuuXeOL97I8B09IsBEGSuDKaGWUU9JVF/usVTAI25tU+s8k7jgxMnw==
X-Received: by 2002:a05:6000:40ce:b0:439:beee:43b5 with SMTP id
 ffacd0b85a97d-43b5279c886mr5735851f8f.3.1773841100501; 
 Wed, 18 Mar 2026 06:38:20 -0700 (PDT)
X-Received: by 2002:a05:6000:40ce:b0:439:beee:43b5 with SMTP id
 ffacd0b85a97d-43b5279c886mr5735812f8f.3.1773841099961; 
 Wed, 18 Mar 2026 06:38:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518986fcsm7433751f8f.26.2026.03.18.06.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 06:38:19 -0700 (PDT)
Message-ID: <de9279e9-3404-45b6-8df6-fbda6488bfbe@redhat.com>
Date: Wed, 18 Mar 2026 14:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] hw/arm/smmuv3-accel: Change ATS property to
 OnOffAuto
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nathan Chen <nathanc@nvidia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Matt Ochs <mochs@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20260317183755.3721625-1-nathanc@nvidia.com>
 <20260317183755.3721625-3-nathanc@nvidia.com>
 <CH3PR12MB7548D2B0E4C731983EFC8EFBAB4EA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548D2B0E4C731983EFC8EFBAB4EA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LnHeAUA8yxAvuPprA5Zp4fwo3HKZxE34ceMNwSEzUZc_1773841101
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/18/26 10:31 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nathan Chen <nathanc@nvidia.com>
>> Sent: 17 March 2026 18:38
>> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: Eric Auger <eric.auger@redhat.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Shannon Zhao <shannon.zhaosl@gmail.com>;
>> Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
>> <imammedo@redhat.com>; Ani Sinha <anisinha@redhat.com>; Paolo Bonzini
>> <pbonzini@redhat.com>; Daniel P . Berrangé <berrange@redhat.com>; Eric
>> Blake <eblake@redhat.com>; Markus Armbruster <armbru@redhat.com>;
>> Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>; Nathan Chen
>> <nathanc@nvidia.com>
>> Subject: [PATCH v3 2/8] hw/arm/smmuv3-accel: Change ATS property to
>> OnOffAuto
>>
>> From: Nathan Chen <nathanc@nvidia.com>
>>
>> Change accel SMMUv3 ATS property from bool to OnOffAuto. The 'auto'
>> value is not implemented, as this commit is meant to set the property
>> to the correct type and avoid breaking JSON/QMP when the auto mode is
>> introduced. A future patch will implement resolution of the 'auto'
>> value to match the host SMMUv3 ATS support.
>>
>> Fixes: f7f5013a55a3 ("hw/arm/smmuv3-accel: Add support for ATS")
>> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
>> ---
>>  hw/arm/smmuv3-accel.c    |  6 ++++--
>>  hw/arm/smmuv3.c          | 14 ++++++++++++--
>>  hw/arm/virt-acpi-build.c |  2 +-
>>  include/hw/arm/smmuv3.h  |  4 +++-
>>  4 files changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>> index 2bb142c47f..621ac531a5 100644
>> --- a/hw/arm/smmuv3-accel.c
>> +++ b/hw/arm/smmuv3-accel.c
>> @@ -826,8 +826,10 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>>      /* By default QEMU SMMUv3 has RIL. Update IDR3 if user has disabled it */
>>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, s->ril);
>>
>> -    /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-in by property */
>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
>> +    /* Only override ATS if user explicitly set ON */
>> +    if (s->ats == ON_OFF_AUTO_ON) {
>> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 1);
>> +    }
> Nit: I think we can keep the original comment.
>
>>      /* Advertise 48-bit OAS in IDR5 when requested (default is 44 bits). */
>>      if (s->oas == SMMU_OAS_48BIT) {
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 068108e49b..3dead0bcd3 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -317,6 +317,11 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>>      smmuv3_accel_idr_override(s);
>>  }
>>
>> +bool smmuv3_ats_enabled(SMMUv3State *s)
>> +{
>> +    return FIELD_EX32(s->idr[0], IDR0, ATS);
>> +}
>> +
>>  static void smmuv3_reset(SMMUv3State *s)
>>  {
>>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>> @@ -1971,7 +1976,7 @@ static bool
>> smmu_validate_property(SMMUv3State *s, Error **errp)
>>              error_setg(errp, "ril can only be disabled if accel=on");
>>              return false;
>>          }
>> -        if (s->ats) {
>> +        if (s->ats == ON_OFF_AUTO_ON) {
>>              error_setg(errp, "ats can only be enabled if accel=on");
>>              return false;
>>          }
>> @@ -1993,6 +1998,11 @@ static bool
>> smmu_validate_property(SMMUv3State *s, Error **errp)
>>          return false;
>>      }
>>
>> +    if (s->ats == ON_OFF_AUTO_AUTO) {
>> +        error_setg(errp, "ats cannot be set to auto");
>> +        return false;
>> +    }
>  Nit: Is "ats auto mode not supported" better? 
>
> Also, should we do this before the if (!s->accel)  check above?
> Otherwise, I think it will carry on for non-accel smmuv3 cases like,
>
> -device arm-smmuv3,primary-bus=pcie.1,accel=off,ats=auto
>
> I think this applies to other properties in this series as well.
>
>>      if (s->oas != SMMU_OAS_44BIT && s->oas != SMMU_OAS_48BIT) {
>>          error_setg(errp, "OAS can only be set to 44 or 48 bits");
>>          return false;
>> @@ -2128,7 +2138,7 @@ static const Property smmuv3_properties[] = {
>>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>>      /* RIL can be turned off for accel cases */
>>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>> -    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats,
>> ON_OFF_AUTO_OFF),
> I think we should update the description in object_class_property_set_description
> to mention auto not supported.

I agree with Shameer wrt all above comments

Eric
>
> Thanks,
> Shameer
>
>>      DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
>>      DEFINE_PROP_UINT8("ssidsize", SMMUv3State, ssidsize, 0),
>>  };
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 719d2f994e..591cfc993c 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -402,7 +402,7 @@ static int iort_smmuv3_devices(Object *obj, void
>> *opaque)
>>
>>      bus = PCI_BUS(object_property_get_link(obj, "primary-bus",
>> &error_abort));
>>      sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
>> -    sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
>> +    sdev.ats = smmuv3_ats_enabled(ARM_SMMUV3(obj));
>>      pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>>      sbdev = SYS_BUS_DEVICE(obj);
>>      sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
>> index 26b2fc42fd..ce51a5b9b4 100644
>> --- a/include/hw/arm/smmuv3.h
>> +++ b/include/hw/arm/smmuv3.h
>> @@ -70,7 +70,7 @@ struct SMMUv3State {
>>      uint64_t msi_gpa;
>>      Error *migration_blocker;
>>      bool ril;
>> -    bool ats;
>> +    OnOffAuto ats;
>>      uint8_t oas;
>>      uint8_t ssidsize;
>>  };
>> @@ -91,6 +91,8 @@ struct SMMUv3Class {
>>      ResettablePhases parent_phases;
>>  };
>>
>> +bool smmuv3_ats_enabled(struct SMMUv3State *s);
>> +
>>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
>>  OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
>>
>> --
>> 2.43.0


