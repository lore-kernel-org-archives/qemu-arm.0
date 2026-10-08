Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2ABCA600D
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 16:37:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEr6r-0001al-Rc; Thu, 08 Oct 2026 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xEr6q-0001aE-6K
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 12:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xEr6n-0007a6-Nt
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 12:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791477400;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/UUmooO/7bIYSg6OS8d5DYV7eO6vqCdLpJnZY418WI=;
 b=cvuogL3ATCkSLWIa+905v9diX6DAEa/gtPFzv/Wv960UDOVDG+cFK3SLpHMovEC1hZzHnH
 sddxx0F/ooFNbv8lRQUYFeop7AQEEmrMLSSM5/+D60jEFw+18nbIM/rx+kkEB/XTc5hBEu
 0CA7iYrQ/MnKJ4/S2rW3794NhZ4EzVE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-hVtlrKihOyKyFbhi2-K56Q-1; Thu, 08 Oct 2026 12:36:39 -0400
X-MC-Unique: hVtlrKihOyKyFbhi2-K56Q-1
X-Mimecast-MFC-AGG-ID: hVtlrKihOyKyFbhi2-K56Q_1791477398
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49e6b5c5f44so80927895e9.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 09:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791477398; x=1792082198;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z/UUmooO/7bIYSg6OS8d5DYV7eO6vqCdLpJnZY418WI=;
 b=DlmXkoH7pZDm12RKoQlLEhn49shchg6p8NiYTmJLiRug5tncNuHdUJ/BFAYitP8fLo
 VFvvayoCxzC86OLKtD2dTQ3Dj7ijb1Y/VA0Cx2FzCzzKTx5JJ4phzDAjKL1s8fk+kbMY
 X2kvxniBCpR3vQ/GamwXZAYU0MFWxB2o4TTkh/Aw7QD167TXta24ahIIq/V3Kgwkkhl7
 mG3ah15UaLmKIE/qnl4jR+cdQrpUEfqJ4qHHMCDSWZXzUlPrNeUVsPdjtNDhuMYqqfoz
 evHrQUBuvmlRaweP5f3XsQkJlIs4AKxWrsjHhHmQOgmmOsv9yws5NUxJNbzqMocSLDgk
 OGug==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzqBiYK9RS+jBy7AfDrCsv5iujak4/fmLkwi4QPryK7AwuDConAP2njOQqnvGrHro7oZfJebgRbg==@nongnu.org
X-Gm-Message-State: AFuF++krUHqaibdx81qp2R2tJI5sjv/pLtiNZ3p4yDdCx5eusvqhTJeF
 Nc6RodgIuRNVK26Eb68IYwlM271pYuyA4aqaL7cFx2jK61rLcKR1kBliSSouXNMQxO6psOeYzZM
 EJ7C6cE7vMZxcoDeyVHTCSajN9LZbxod9ogUGp6SeJ4MFMabvKICgjA==
X-Gm-Gg: AYBFou1uo3Br+I5ZFLz1xeIy+E0LCq0WlS2u0Za2kFL9IQi4M+ZAYiHIn9R0+ADNWzp
 jETtBmoXXAe/zaDLGxvykUeNi0Du0AYyjVpTkJ1CWfljug+f4IPE/gl5WwuJPjYsVb+GRcIV+TL
 jLIyfw8hhpiiGZphVIJOcnCK0a0rtnZ1TRQH5BBbNaTzbIyp5Ex+0/Bzv2Lrx/wo7rh2IspbSul
 LH/R5JbpeBeOLxHeoeqy3iOGaTkDALvTBHvyE3VmcZ6D/gx74y+KIYF+w9elXil0NUhWNWGAtim
 nScb3vLrFZ7op5RvJCGVXgLJSRSUyN0SNf4rcTKmhwp7KNFaTi9AyIUdKntVjhhGA5IpZ8Dan6G
 a8jSr2NpP/httvu29UdpdemA9Z1iyhNLE9Bk0x8kWpYY58a3U
X-Received: by 2002:a05:600c:34cd:b0:4a1:7c7d:8881 with SMTP id
 5b1f17b1804b1-4a180311361mr114214895e9.13.1791477397771; 
 Thu, 08 Oct 2026 09:36:37 -0700 (PDT)
X-Received: by 2002:a05:600c:34cd:b0:4a1:7c7d:8881 with SMTP id
 5b1f17b1804b1-4a180311361mr114214105e9.13.1791477397310; 
 Thu, 08 Oct 2026 09:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18acf3a39sm1279535e9.4.2026.10.08.09.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 09:36:36 -0700 (PDT)
Message-ID: <5f053971-13a0-4130-ab57-eaf85bcef3a8@redhat.com>
Date: Thu, 8 Oct 2026 18:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/26] target/arm/kvm: Add consistency checking for
 SYSREG props
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260916144721.751810-1-eric.auger@redhat.com>
 <20260916144721.751810-18-eric.auger@redhat.com>
 <CECAE32E-9A75-4D8D-827D-9F25D026F364@nutanix.com>
 <dc5aecf7-db4f-4b16-92fd-432d663ff900@redhat.com>
 <A5B31865-5901-45F3-B782-274DA54E8615@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <A5B31865-5901-45F3-B782-274DA54E8615@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zJ3DqMRtYcSvX4dPGRu_r5fCkURaX9ZKBxrYeZRT8lc_1791477398
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 10/8/26 11:36 AM, Khushit Shah wrote:
>
>> On 8 Oct 2026, at 1:18 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Hi Khushit,
>>
>> On 9/30/26 9:34 AM, Khushit Shah wrote:
>>>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>>>
>>>> !-------------------------------------------------------------------|
>>>> CAUTION: External Email
>>>>
>>>> |-------------------------------------------------------------------!
>>>>
>>>> Since legacy composite options (such as SVE, virtualization, ...)
>>>> and new SYSREG props coexist, add some basic consistency checks.
>>>>
>>>> Those checks are performed both in kvm_arch_init_vcpu() before
>>>> applying the SYSREG props at the end of the initialization chain.
>>>>
>>>> Some ID reg fields corresponding to legacy composite option scope
>>>> are not writable. In that case we just check that the field has
>>>> not become writable.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Hi Eric,
>>>
>>> Gave this another look. I suggest moving this to kvm_arm_expose_idreg_properties().
>>> What I suggest specifically is:
>>> - Have a list of ID register fields which conflicts with legacy props.
>> this depends on the definition of "conflict". For instance does 
>>
>> PMUVer conflicts with has_pmu?
>>
> Yes, PMUVer = 0 is inconsistent with has_pmu=true 
>
>> Nevertheless your suggested approach could work for props below which in case they show up would trigger
>>        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>                   propname);
> I was thinking of not exposing these props because we know it conflicts. So instead of checking the set props in kvm_arm_vcpu_validate_sysreg, we never expose conflicts in kvm_arm_expose_idreg_properties
>
> I am suggesting this way because for named CPU models, we will have to handle this conflicts differently.

I am afraid this a bit aggressive as a defensive approach. I like the
idea for fields that are not yet writable. We can easily switch to a
skiplist on property generation. For others for which some valid
combinations exist I would keep the existing check. But let's see how it
goes with named vcpu models. If it appears this extra complexity is not
needed we can simplify that if needed.

Thanks

Eric
>
>
> I hope this makes sense.
>
>
> Thanks,
> Khushit
>
>> Thanks
>>
>> Eric
>>
>>> - in kvm_arm_expose_idreg_properties() (the new field based approach) never expose fields
>>>  which are part of the above list.
>>>
>>> This way the same consistency logic you have will carry over to named models by just adding different
>>> setters for the above field.
>>>
>>> What are your thoughts on this?
>>>
>>> Thanks,
>>> Khushit
>>>> — 
>>>> target/arm/kvm.c | 105 +++++++++++++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 105 insertions(+)
>>>>
>>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>>> index ddf320d0e6..f52c03745e 100644
>>>> --- a/target/arm/kvm.c
>>>> +++ b/target/arm/kvm.c
>>>> @@ -340,6 +340,107 @@ static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
>>>>    return NULL;
>>>> }
>>>>
>>>> +
>>>> +/**
>>>> + * kvm_arm_vcpu_validate_sysreg:
>>>> + *
>>>> + * Validate a SYSREG field value is consistent with legacy composite options
>>>> + * Some checks are not implemented because the corresponding sysreg field
>>>> + * is not currently writable. In that case we make sure the field has not
>>>> + * become writable, which would mean the user had the capability to set the
>>>> + * corresponding property.
>>>> + *
>>>> + * return true if consistent. false if it is not, along with an error handle
>>>> + */
>>>> +static bool kvm_arm_vcpu_validate_sysreg(ARMCPU *cpu, ARM64SysRegField *field,
>>>> +                                         uint64_t value, Error **errp)
>>>> +{
>>>> +    const char *fieldname = field->name;
>>>> +    ARM64SysReg *sysregdesc = &arm64_id_regs[field->index];
>>>> +    const char *regname = sysregdesc->name;
>>>> +    g_autofree char *propname = g_strdup_printf("SYSREG_%s_%s", regname, fieldname);
>>>> +
>>>> +    /* virtualization */
>>>> +    if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL2")) {
>>>> +        /* consistency with machine virtualization property */
>>>> +        if (cpu->has_el2 && value == 0) {
>>>> +            error_setg(errp,
>>>> +                "Inconsistent -machine virtualization=on and "
>>>> +                "%s=0", propname);
>>>> +            return false;
>>>> +        } else if (!cpu->has_el2 && value > 0) {
>>>> +            error_setg(errp,
>>>> +                "Inconsistent -machine virtualization=off and "
>>>> +                "%s > 0", propname);
>>>> +            return false;
>>>> +        }
>>>> +    /* secure */
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL3") && value > 0) {
>>>> +        /* consistency with machine secure property */
>>>> +        error_setg(errp, "%s is set but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    /* MTE */
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR1_EL1_MTE")) {
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    /* SVE */
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_SVE")) {
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ZFR0_EL1_SVEver")) {
>>>> +        if (cpu_isar_feature(aa64_sve, cpu) && value == 0) {
>>>> +            error_setg(errp, "sve is set but %s is set to 0", propname);
>>>> +            return false;
>>>> +        } else if (!cpu_isar_feature(aa64_sve, cpu) && value > 0) {
>>>> +            error_setg(errp, "sve is not set but %s is greater than 0",
>>>> +                       propname);
>>>> +            return false;
>>>> +        }
>>>> +    /* PAUTH */
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_APA")) {
>>>> +        /* PAUTH QARMA5 address authentification */
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_API")) {
>>>> +        /* PAUTH Impl Defined address authentification */
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_GPA")) {
>>>> +        /* QARMA5 generic code authentification */
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_GPI")) {
>>>> +        /* QARMA5 generic code authentification */
>>>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>>>> +                   propname);
>>>> +        return false;
>>>> +    /* PMU */
>>>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64DFR0_EL1_PMUVer")) {
>>>> +        if (cpu->has_pmu && value == 0) {
>>>> +            error_setg(errp, "%s is 0 whereas pmu is set", propname);
>>>> +            return false;
>>>> +        } else if (!cpu->has_pmu && value) {
>>>> +            error_setg(errp, "%s is non null whereas pmu is unset", propname);
>>>> +            return false;
>>>> +        }
>>>> +    /* aarch64 false */
>>>> +    } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>>>> +        if ((!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL0") ||
>>>> +             !strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL1") ||
>>>> +             !strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL2")) && value < 2)
>>>> +            error_setg(errp, "%s is < 2 while aarch64 is set to off",
>>>> +                       propname);
>>>> +            return false;
>>>> +    }
>>>> +    return true;
>>>> +}
>>>> +
>>>> #define MAKE_IDREG_KEY(reg_idx, field_shift) \
>>>>    (((uint64_t)(reg_idx) << 8) | ((uint64_t)(field_shift) & 0xFF))
>>>>
>>>> @@ -2241,6 +2342,10 @@ static int kvm_arm_apply_sysreg_props(ARMCPU *cpu, Error **errp)
>>>>        uint64_t oldfv;
>>>>        int ret;
>>>>
>>>> +        if (!kvm_arm_vcpu_validate_sysreg(cpu, field, value, errp)) {
>>>> +            return -1;
>>>> +        }
>>>> +
>>>>        mask = MAKE_64BIT_MASK(lower, length);
>>>>        value = value << lower;
>>>>
>>>> -- 
>>>> 2.53.0
>


