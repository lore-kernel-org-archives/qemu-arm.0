Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D1FCA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWip-0006O3-4T; Tue, 29 Sep 2026 08:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBWii-0006Lq-75
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBWig-0002bx-4t
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790684039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0p9GsPyqfCLG6Q3eZpXp3Aciwh0Q5G37w2jNJDtV/CM=;
 b=VYA00W7GbLGEh71YllxW8rdrHuDjd+XuzaNNIKkrQ6nuYtWAdjTx0HA86CKuVEgNxwQMeT
 pKWb/ON48TWidU0sylGIlOgZFepIueW34CAxRXzjULLB1iFhrpf0/SFdhiT6DN+tmiaC4+
 oa5kU3j/b70igk/XtHAd3+pBAQPH/aA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-wn7yjEeuOQyLU9HXl7t__A-1; Tue, 29 Sep 2026 08:13:58 -0400
X-MC-Unique: wn7yjEeuOQyLU9HXl7t__A-1
X-Mimecast-MFC-AGG-ID: wn7yjEeuOQyLU9HXl7t__A_1790684037
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49ccfad90f1so33377085e9.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684037; x=1791288837;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0p9GsPyqfCLG6Q3eZpXp3Aciwh0Q5G37w2jNJDtV/CM=;
 b=SGHoC3YjdamEg5j0+ta8R7KWPonLtlztzy8UVCIc14inJHkhdgXAtKvH+Tt/ejK1Hi
 NhRtjss+gdrFNTeYjbiFhqzeNqs9YNubjBWweBeqk9VjS4c7FOJ6ZG6nGu+GV85vTLnX
 qS8HfDwKk4+aU1ulA7smQRB+rGU0Vr7NbkK2TYUiRIfgqzyfilI/JbWlp2ceOidnuxU4
 Mkb2KHZAMdfP6s2EKAUoMZRsz5j4l4+UaZBserCR4C52kF6qh2TeeGRaxgM/IjmknCN5
 0+w8wMJykinMniUpuyZ7SqZeSEyLMWtU2TaXsIR/GNmbhCawgRkEyl8BqSn4E3TZ9lpN
 cWEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzF9MVZIzzmbSnSW/zBYCG5RMF/C/ViR2A3ciCa7UTiKhJK655vtcKV1QlTsZUdBsRhn+ikzMmGCA==@nongnu.org
X-Gm-Message-State: AFuF++lx/IaH72P+giw9y1coIImUbrKzcjB49AixkZDKIj9lo8shXZUU
 wtv0MP4bcgPG084VE/SSX8ccR1d63N8eQEeZiPL684f68zoHSBM8osLQ8pw4c4ilI8a76KZrKn2
 rcXar0WNiMmHiWmShPyC1VuysukUSHMjr+Vu1ukNiXCdkv0uN096Wbw==
X-Gm-Gg: AYBFou3uRTDvKWWamMhWU6LyCusC5SDPL8J3JRM0YsdnHlO8R/6q9ogEmtbCTb7sIzw
 G4Cqp+SdYG5nxtq84m9N51eNFjQERRIKONJBh1p8ak2IPcsMDWjtuluUny2k+Tr/7dbQbgtYRfe
 gz4wbJBXWqQs4PchKNUPpslctu/nTqpZhbFcMuCrmcWcJYOpeu1KpEDCL6K7snQPbO+M1lrjwS0
 qS5ssRs4tLKJD9yvGRvI8VdHkioMLdsT7ho2maUkYtGKXFzAVNM6YMaCRnYPCN6EJBA8chvLpI8
 XsyjOYfZy4qvWZelbDX7Uj+vHNI9424fBOPUcsad4ANHdTReJmt0ZhzvwGIazyjuffjGcCLxTUe
 tTDssHmH9Jj5x8Q/5hETqcCKdfhBE38smVSsomtLtwipb5tJe
X-Received: by 2002:a05:600c:c094:b0:49f:f997:7ed7 with SMTP id
 5b1f17b1804b1-49ff997807amr116111695e9.11.1790684036801; 
 Tue, 29 Sep 2026 05:13:56 -0700 (PDT)
X-Received: by 2002:a05:600c:c094:b0:49f:f997:7ed7 with SMTP id
 5b1f17b1804b1-49ff997807amr116111335e9.11.1790684036397; 
 Tue, 29 Sep 2026 05:13:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00c10c656sm111735875e9.2.2026.09.29.05.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:13:55 -0700 (PDT)
Message-ID: <1ce67e00-1037-4de0-84c5-8248fd4d4e97@redhat.com>
Date: Tue, 29 Sep 2026 14:13:53 +0200
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
 <7C929003-175E-450D-885B-CAB243B89645@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7C929003-175E-450D-885B-CAB243B89645@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7myxBNbJYItpRyB43ygjkfd3OFXcyqbEnuGuC8507w_1790684037
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.341,
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

Hi Khushit,

On 9/28/26 2:53 PM, Khushit Shah wrote:
> Hi Eric,
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Since legacy composite options (such as SVE, virtualization, ...)
>> and new SYSREG props coexist, add some basic consistency checks.
>>
>> Those checks are performed both in kvm_arch_init_vcpu() before
>> applying the SYSREG props at the end of the initialization chain.
> Where else?
nowhere, I shall remove the 'both'
>
>> Some ID reg fields corresponding to legacy composite option scope
>> are not writable. In that case we just check that the field has
>> not become writable.
> I don’t understand where the above happens in code.
Everywhere you have:

+        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
+                   propname);

I modified the commit description with:

Some ID reg fields corresponding to legacy composite option scope
are not (yet) writable (EL3, MTE, SVE, ...). As such they are not
supposed to be exposed through SYSREG properties. However in the
hypothesis they would become writable, and thus would be exposed
and attempted to be set, we need to reject any setting because no
consistency check is implemented yet.



>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/kvm.c | 105 +++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 105 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index ddf320d0e6..f52c03745e 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -340,6 +340,107 @@ static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
>>     return NULL;
>> }
>>
>> +
>> +/**
>> + * kvm_arm_vcpu_validate_sysreg:
>> + *
>> + * Validate a SYSREG field value is consistent with legacy composite options
>> + * Some checks are not implemented because the corresponding sysreg field
>> + * is not currently writable. In that case we make sure the field has not
>> + * become writable, which would mean the user had the capability to set the
>> + * corresponding property.
>> + *
>> + * return true if consistent. false if it is not, along with an error handle
>> + */
>> +static bool kvm_arm_vcpu_validate_sysreg(ARMCPU *cpu, ARM64SysRegField *field,
>> +                                         uint64_t value, Error **errp)
>> +{
>> +    const char *fieldname = field->name;
>> +    ARM64SysReg *sysregdesc = &arm64_id_regs[field->index];
>> +    const char *regname = sysregdesc->name;
>> +    g_autofree char *propname = g_strdup_printf("SYSREG_%s_%s", regname, fieldname);
> I don’t see a reason to build property name here.

a field is fully discriminated by the reg name string/index + the field name string/index. So I imagined I could use the prop name directly which has both. Now I can also remove "SYSREG_" if this was you prefer?


>> +
>> +    /* virtualization */
>> +    if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL2")) {
>> +        /* consistency with machine virtualization property */
>> +        if (cpu->has_el2 && value == 0) {
>> +            error_setg(errp,
>> +                "Inconsistent -machine virtualization=on and "
>> +                "%s=0", propname);
>> +            return false;
>> +        } else if (!cpu->has_el2 && value > 0) {
>> +            error_setg(errp,
>> +                "Inconsistent -machine virtualization=off and "
>> +                "%s > 0", propname);
>> +            return false;
>> +        }
>> +    /* secure */
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL3") && value > 0) {
>> +        /* consistency with machine secure property */
>> +        error_setg(errp, "%s is set but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    /* MTE */
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR1_EL1_MTE")) {
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    /* SVE */
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_SVE")) {
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ZFR0_EL1_SVEver")) {
>> +        if (cpu_isar_feature(aa64_sve, cpu) && value == 0) {
>> +            error_setg(errp, "sve is set but %s is set to 0", propname);
>> +            return false;
> This is actually an valid configuration.
OK I removed that

Thanks!

Eric
>
>> +        } else if (!cpu_isar_feature(aa64_sve, cpu) && value > 0) {
>> +            error_setg(errp, "sve is not set but %s is greater than 0",
>> +                       propname);
>> +            return false;
>> +        }
>> +    /* PAUTH */
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_APA")) {
>> +        /* PAUTH QARMA5 address authentification */
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_API")) {
>> +        /* PAUTH Impl Defined address authentification */
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_GPA")) {
>> +        /* QARMA5 generic code authentification */
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64ISAR1_EL1_GPI")) {
>> +        /* QARMA5 generic code authentification */
>> +        error_setg(errp, "%s is now exposed but qemu is not ready to support it",
>> +                   propname);
>> +        return false;
>> +    /* PMU */
>> +    } else if (!strcmp(propname, "SYSREG_ID_AA64DFR0_EL1_PMUVer")) {
>> +        if (cpu->has_pmu && value == 0) {
>> +            error_setg(errp, "%s is 0 whereas pmu is set", propname);
>> +            return false;
>> +        } else if (!cpu->has_pmu && value) {
>> +            error_setg(errp, "%s is non null whereas pmu is unset", propname);
>> +            return false;
>> +        }
>> +    /* aarch64 false */
>> +    } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>> +        if ((!strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL0") ||
>> +             !strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL1") ||
>> +             !strcmp(propname, "SYSREG_ID_AA64PFR0_EL1_EL2")) && value < 2)
>> +            error_setg(errp, "%s is < 2 while aarch64 is set to off",
>> +                       propname);
>> +            return false;
> return should be covered in braces.
>
> Warm Regards,
> Khushit
>> +    }
>> +    return true;
>> +}
>> +
>> #define MAKE_IDREG_KEY(reg_idx, field_shift) \
>>     (((uint64_t)(reg_idx) << 8) | ((uint64_t)(field_shift) & 0xFF))
>>
>> @@ -2241,6 +2342,10 @@ static int kvm_arm_apply_sysreg_props(ARMCPU *cpu, Error **errp)
>>         uint64_t oldfv;
>>         int ret;
>>
>> +        if (!kvm_arm_vcpu_validate_sysreg(cpu, field, value, errp)) {
>> +            return -1;
>> +        }
>> +
>>         mask = MAKE_64BIT_MASK(lower, length);
>>         value = value << lower;
>>
>> -- 
>> 2.53.0
>>


