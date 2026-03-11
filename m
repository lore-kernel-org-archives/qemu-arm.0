Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E771125857
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 17:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0NAX-0006e2-Ta; Wed, 11 Mar 2026 13:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0NAT-0006bY-E2
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0NAP-0004ou-Qu
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773249376;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WByVIk+xMliZtz4etRtbPilfKSwSED/8LPhpopBLvMc=;
 b=NOwmkhLwa/cHt4bZMJEK6AWSqh+LHav5enX6NdcmQN2TfEm4YoJJtqP38TI9IHIf0XMefs
 btvvsL1uteh0li0hv8LPwCLGbnADgdJgZ3gwgHB7g4p/7SpQ4+HgVWZKX36jQ3RjTW6jTt
 swokuj3aDKzArNWckJspzJQTxHD0QdU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-qHwW3oy6MG2BvvXWVvNVlQ-1; Wed, 11 Mar 2026 13:16:15 -0400
X-MC-Unique: qHwW3oy6MG2BvvXWVvNVlQ-1
X-Mimecast-MFC-AGG-ID: qHwW3oy6MG2BvvXWVvNVlQ_1773249375
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89a17ec1eecso5862896d6.3
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 10:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773249375; x=1773854175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WByVIk+xMliZtz4etRtbPilfKSwSED/8LPhpopBLvMc=;
 b=CgDgtZ2o13wyvoJsFJ/xHEqApymuoM3mUo9MRG15oN5YiWrq4kx02fthQfTvxqb9Ip
 3IdohINllS5Dup+4jQdKU+FOc/nx4zy6wb/EhuhhOdrtkSq6s0DXdvPc0Y/qMMNkL7KL
 /2evfGQ/94CxJysRDDh3SQ6d4JYJF/EBaQGGrHiJGdh+3+Yo3QkmavzmMZDOburSEv3t
 L9OOUW/rKMJtWqX535eA1A8xr+TGAXlKdrx3P+2YIZDtMtKzOsAePGmc+Zv8Fjp/8lQI
 kbgk4uFUFyiAQHsQjEfjQZdZWFrEPdO78D1H9EFNi4AKQJC910+wa+eXw7LOz8IL6TSW
 u91A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZGBslErSEo5krQamKRXZE1wXoM1Plic58DjwFiEVrpin+oUL1gtXmgWZls5BaTMW6hFewcTyHeg==@nongnu.org
X-Gm-Message-State: AOJu0YxXPPDTG4sywUDHaw2S0/pdXE8FvkUfRVKkLmizFOz+mTw7/C18
 ZIvHrPdqalbPpflHJckEUoMg9e6gyswXCoSeovsj1261QhzZiG0SQbGbpNzcz1xNDB4B41BVO0J
 p2OhA8EMZb9eRXI/j3q9Mdvoyv54oBGIynEGeRDD9mHh7eDKoydyouw==
X-Gm-Gg: ATEYQzzATkwWsu58gHw8ndjVVFL0hGitKGIq+NPXTZi/c2igEo/zlNg+pJZMJAOWymg
 5VU9C7bjHlvV61PvZzWzLuEGYME131UxWBXtZLj2AJWjMtjhZZSK87SzuIbutQSePACAnr/ZaCq
 cCHC8bpNyYybqroojJVU/WN/A8WWFg5tNyIQgksDx3zqOmKnpxF2aU2LlV+pQhZa2GM7+F5vNDm
 gT/A5c6JYdLHLTGNJY8bkCc2mDn8WWZr3aL6auBvAfYoP6Sig89Mts6H1+buhX0vlWZI1XaY3VZ
 0UQrgjc8/kh/JKJcMLA8C3TYde0q7p+6dShRYt4fEH57crHswgpe1gW0dKy5iUyYQMIbR2LLxLi
 XYl5tQJ1pr09/8VA4nTcIYJWpj0iUZPRuDirs1oQkVk4VAF4rQp9PxMAFukELiXu6kFU1JA==
X-Received: by 2002:a05:6214:29c8:b0:89a:16ad:46aa with SMTP id
 6a1803df08f44-89a669c5076mr45858816d6.9.1773249374646; 
 Wed, 11 Mar 2026 10:16:14 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:89a:16ad:46aa with SMTP id
 6a1803df08f44-89a669c5076mr45858356d6.9.1773249374100; 
 Wed, 11 Mar 2026 10:16:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a6947c4b8sm13195636d6.20.2026.03.11.10.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 10:16:13 -0700 (PDT)
Message-ID: <fd34b7a2-65ac-486f-bc17-23dd4f96a3df@redhat.com>
Date: Wed, 11 Mar 2026 18:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] hw/arm/smmuv3-accel: Introduce _AUTO support for
 ATS
To: Nathan Chen <nathanc@nvidia.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Yi Liu <yi.l.liu@intel.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <20260309192119.870186-3-nathanc@nvidia.com> <87pl5cnp06.fsf@pond.sub.org>
 <98e7dd71-6669-4a82-bec8-f1dae2d861c3@redhat.com>
 <0bdcf7d7-136e-42f4-9fa9-d31f6ae6e19f@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0bdcf7d7-136e-42f4-9fa9-d31f6ae6e19f@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W4vVF6QJifJpAg6cnh_OGZZguiYamN5t-4en4BRAEPk_1773249375
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 3/11/26 6:08 PM, Nathan Chen wrote:
>
>
> On 3/11/2026 8:31 AM, Eric Auger wrote:
>> On 3/10/26 8:05 AM, Markus Armbruster wrote:
>>> Nathan Chen<nathanc@nvidia.com> writes:
>>>
>>>> From: Nathan Chen<nathanc@nvidia.com>
>>>>
>>>> Allow accelerated SMMUv3 Address Translation Services support property
>>>> to be derived from host IOMMU capabilities. Derive host values using
>>>> IOMMU_GET_HW_INFO, retrieving ATS capability from IDR0.
>>>>
>>>> Set the default value of ATS to auto. The default for ATS support used
>>>> to be set to off, but we change it to match what the host IOMMU
>>>> properties report.
>>>>
>>>> Add a "ats-enabled" read-only property for smmuv3 to address an
>>>> expected bool for the "ats" property in iort_smmuv3_devices().
>>>>
>>>> Signed-off-by: Nathan Chen<nathanc@nvidia.com>
>>>> ---
>>>>   hw/arm/smmuv3-accel.c    | 25 +++++++++++++++++++++++--
>>>>   hw/arm/smmuv3.c          | 12 ++++++++++--
>>>>   hw/arm/virt-acpi-build.c |  2 +-
>>>>   include/hw/arm/smmuv3.h  |  2 +-
>>>>   4 files changed, 35 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>>> index 617629bacd..8fec335557 100644
>>>> --- a/hw/arm/smmuv3-accel.c
>>>> +++ b/hw/arm/smmuv3-accel.c
>>>> @@ -52,6 +52,12 @@ static void
>>>> smmuv3_accel_auto_finalise(SMMUv3State *s, PCIDevice *pdev,
>>>>           return;
>>>>       }
>>>>   +    /* Update ATS if auto from info */
>>>> +    if (s->ats == ON_OFF_AUTO_AUTO) {
>>>> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS,
>>>> +                               FIELD_EX32(info->idr[0], IDR0, ATS));
>>>> +    }
>>>> +
>>>>       accel->auto_finalised = true;
>>>>   }
>>>>   @@ -124,6 +130,13 @@ smmuv3_accel_check_hw_compatible(SMMUv3State
>>>> *s,
>>>>                      smmuv3_oas_bits(FIELD_EX32(s->idr[5], IDR5,
>>>> OAS)));
>>>>           return false;
>>>>       }
>>>> +    /* Check ATS value opted is compatible with Host SMMUv3 */
>>>> +    if (FIELD_EX32(info->idr[0], IDR0, ATS) <
>>>> +                FIELD_EX32(s->idr[0], IDR0, ATS)) {
>>>> +        error_setg(errp, "Host SMMUv3 doesn't support Address
>>>> Translation"
>>>> +                   " Services");
>>>> +        return false;
>>>> +    }
>>>>         /* QEMU SMMUv3 supports GRAN4K/GRAN16K/GRAN64K translation
>>>> granules */
>>>>       if (FIELD_EX32(info->idr[5], IDR5, GRAN4K) !=
>>>> @@ -844,8 +857,12 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>>>>       /* By default QEMU SMMUv3 has RIL. Update IDR3 if user has
>>>> disabled it */
>>>>       s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, s->ril);
>>>>   -    /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-in by
>>>> property */
>>>> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
>>>> +    /* Only override ATS if user explicitly set ON or OFF */
>>>> +    if (s->ats == ON_OFF_AUTO_ON) {
>>>> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 1);
>>>> +    } else if (s->ats == ON_OFF_AUTO_OFF) {
>>>> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 0);
>>>> +    }
>>>>         /* Advertise 48-bit OAS in IDR5 when requested (default is
>>>> 44 bits). */
>>>>       if (s->oas == SMMU_OAS_48BIT) {
>>>> @@ -923,4 +940,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>>>>       s->s_accel = g_new0(SMMUv3AccelState, 1);
>>>>       bs->iommu_ops = &smmuv3_accel_ops;
>>>>       smmuv3_accel_as_init(s);
>>>> +
>>>> +    if (s->ats == ON_OFF_AUTO_AUTO) {
>>>> +        s->s_accel->auto_mode = true;
>>>> +    }
>>>>   }
>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>> index 068108e49b..197ba7c77b 100644
>>>> --- a/hw/arm/smmuv3.c
>>>> +++ b/hw/arm/smmuv3.c
>>>> @@ -317,6 +317,12 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>>>>       smmuv3_accel_idr_override(s);
>>>>   }
>>>>   +static bool get_ats_enabled(Object *obj, Error **errp)
>>>> +{
>>>> +    SMMUv3State *s = ARM_SMMUV3(obj);
>>>> +    return FIELD_EX32(s->idr[0], IDR0, ATS);
>>>> +}
>>>> +
>>>>   static void smmuv3_reset(SMMUv3State *s)
>>>>   {
>>>>       s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>>>> @@ -1971,7 +1977,7 @@ static bool
>>>> smmu_validate_property(SMMUv3State *s, Error **errp)
>>>>               error_setg(errp, "ril can only be disabled if
>>>> accel=on");
>>>>               return false;
>>>>           }
>>>> -        if (s->ats) {
>>>> +        if (s->ats == ON_OFF_AUTO_ON) {
>>>>               error_setg(errp, "ats can only be enabled if accel=on");
>>>>               return false;
>>>>           }
>>>> @@ -2128,7 +2134,7 @@ static const Property smmuv3_properties[] = {
>>>>       DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>>>>       /* RIL can be turned off for accel cases */
>>>>       DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
>>>> -    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>>>> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats,
>>>> ON_OFF_AUTO_AUTO),
>>> Is property "ats" accessible via QMP or JSON command line?  If yes,
>>> this
>>> is an incompatible change: JSON values false and true no longer work.
>> So what do you recommend to extend the property values. I guess we had
>> some existing scenarios happening in the past. What is the best way to
>> proceed?
>
> Is it a requirement to ensure boolean values are still supported when
> switching to OnOffAuto? I found that the x86-iommu intremap property
> had a change from DEFINE_PROP_BOOL to DEFINE_PROP_ON_OFF_AUTO [0].
>
> Should I add a custom property setter that accepts both boolean and
> on/off/auto for backward compatibility, or is following the intremap
> precedent acceptable? I'm happy to implement either approach.
>
> [0]
> https://github.com/qemu/qemu/commit/a924b3d8df55a395891fd5ed341d0deb135d9aa6 

Maybe we also need to emphasize that libvirt integration is still under
work (and waiting for that conversion to happen at qemu level). So do we
really care about keeping the compat wrt QMP and JSON. 
Thanks

Eric
>
> Thanks,
> Nathan
>


