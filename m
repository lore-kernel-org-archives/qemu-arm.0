Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4FCA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByKy-000514-7I; Wed, 30 Sep 2026 13:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xByKw-00050Y-O3
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xByKu-0000Oi-Q9
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790790199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SiFzGMFKKl+ozvaauMYdUK2l9xfAclZr0fBl6EjIlYQ=;
 b=ZHfKEXyPeqq/qt+YHH/zRH9D3HrfrklcZXqWCqp1HdyHT1/lQBd5ATxVmdMmaEX5ImGL27
 JSYB98RLd5NrJnmr4/7wERT+wLiYD+OKDrjO4HBthJlL4+Zvsz58K9bnpOgyrf+5n4+Ajf
 SZye8ikjgZT3w2QCL7pQOyPmJ3o8hWY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-6WmX1QCsMLm4-wt-LupbKw-1; Wed, 30 Sep 2026 13:43:16 -0400
X-MC-Unique: 6WmX1QCsMLm4-wt-LupbKw-1
X-Mimecast-MFC-AGG-ID: 6WmX1QCsMLm4-wt-LupbKw_1790790195
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-47f2de3ba47so4297048f8f.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790195; x=1791394995;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SiFzGMFKKl+ozvaauMYdUK2l9xfAclZr0fBl6EjIlYQ=;
 b=V3gem3cjMVgN2DhQH4uHwYo0bqJfzmKypVru+pqMDBJG0VkhcC/yVinw5xrrGqz36U
 LXEMmvZnpMuYZ6yOwGn1w57yirFBkVunLMGX6PE5oBccNIKYIIC0L4Y6Buz0Tklf7tWJ
 05VkNsOyTYmA3mBHuqBBZoq7OMw+i3YrkDt9JBudsyp6G7nOwMPHMwYKkCPay5HwlOIz
 GoF39N/EOGU85sGCgEO+7lX+wqoJstp0YDs2lkvf/4czXO5uXriiw4gPWanj4SJ85weW
 XelwHrz8BTeVy3P3KjTdORPY1+09K1KkPIrGvZfvSLcVb5jmQMW0HJS++9Bxa0FhPrzE
 wMXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwveRLRt4DcnB58sxNPWTESUjQynrT1JaA73O8X7xRk1jXidczTVBqFmlVDPTfL8/PK7XPMQl29yA==@nongnu.org
X-Gm-Message-State: AFq9FYLNuNMCuXlT5HsBiR+8fr7GXq0qFY9vIp0f8D71DZmvxDo8v7W6
 ffN2yP762qsI47sML7qUbjB5avlqhfnxGeiQDshQpDcHa6VzkxkHbHWJOkWpaAwpLFrbIU/3MVg
 pZQwIIjgp4zvq72UuvRPpvq2TA2dlAiyWQ/LoObb4otbMsI0O5gzX5w==
X-Gm-Gg: AYBFou1Qa/z21aGfmiM0i0e+dXiT0vP8mTBnHRQwx2lG7MSM7Z6X3WCSWZIp0DhNf1S
 VyWvxNfDLKAdBZag5+Q1jCSBsEADE7GfD8T5EWxCOPxcI+AOUGZelxh3jRZygXzRzkZJrfXanWv
 KZ1+NFoA+SRIutnl3zE3htOmxnP99dcKmZ04e9La40uQz5QvsWUG831m59jopW3LOEr226DHY+V
 6EdRS3VyuPIiAsvRIFDp5RUQoz/uyNajB5rjhUFLRXGysTgpDRCexfthXF6j5xquf2/fLW9vGi/
 E9tPijw2SKNO5tJTr9eCVyxNlhxgOhj6lFvBRdheJB6GzSas+GfgZdoTI6+RWl5slc3J8lYFgaS
 E7vF83aGOPApb7b/cgJ+v9LKhELjlP1GAfZAzLcVcRcDcOgXZ
X-Received: by 2002:a05:6000:4029:b0:488:5d44:6680 with SMTP id
 ffacd0b85a97d-48b025083c4mr4389598f8f.36.1790790195194; 
 Wed, 30 Sep 2026 10:43:15 -0700 (PDT)
X-Received: by 2002:a05:6000:4029:b0:488:5d44:6680 with SMTP id
 ffacd0b85a97d-48b025083c4mr4389553f8f.36.1790790194789; 
 Wed, 30 Sep 2026 10:43:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06a2d12fsm526748f8f.31.2026.09.30.10.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 10:43:14 -0700 (PDT)
Message-ID: <aca67e8c-7599-45aa-a6c7-542c0461ad19@redhat.com>
Date: Wed, 30 Sep 2026 19:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 21/26] target/arm/kvm: add helper to test SYSREG props
 against a scratch vcpu
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
 <20260916144721.751810-22-eric.auger@redhat.com>
 <E471D5C1-D254-4DC9-BD22-E02660DE144F@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <E471D5C1-D254-4DC9-BD22-E02660DE144F@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q7kQKmlNwyaxqvfGJSaFGEgYfSc9DunGvSIqqWvI0R0_1790790195
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.341,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 9/28/26 3:34 PM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Add kvm_idreg_write_scratch_vcpu helper that will be used
>> by qmp_query_cpu_model_expansion code to test SYSREG settings
>> against a scratch vcpu. Indeed when the expansion code is called
>> the actual vcpu has not been initialized so we use a scratch vcpu.
>> This latter has been initialized with features taken from
>> legacy compositive options (EL2, SVE, ...). So the trial is
>> very close to the final setup.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/kvm_arm.h    |  4 ++++
>> target/arm/kvm-stub.c   |  7 ++++++
>> target/arm/kvm.c        | 51 +++++++++++++++++++++++++++++++++++++++++
>> target/arm/trace-events |  1 +
>> 4 files changed, 63 insertions(+)
>>
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 2b3474cc36..bace69efed 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -14,6 +14,7 @@
>> #include "qapi/qapi-types-misc-arm.h"
>> #include "system/kvm.h"
>> #include "target/arm/cpu-qom.h"
>> +#include "cpu-idregs.h"
>>
>> #define KVM_ARM_VGIC_V2   (1 << 0)
>> #define KVM_ARM_VGIC_V3   (1 << 1)
>> @@ -250,4 +251,7 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
>>  */
>> char *kvm_print_register_name(uint64_t regidx);
>>
>> +bool kvm_idreg_write_scratch_vcpu(ARMCPU *cpu, int cpufd,
>> +                                  ARM64SysRegField *field, uint64_t newfv,
>> +                                  Error **errp);
>> #endif
>> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
>> index 88cbe8d85c..8e6fae0a4d 100644
>> --- a/target/arm/kvm-stub.c
>> +++ b/target/arm/kvm-stub.c
>> @@ -119,3 +119,10 @@ char *kvm_print_register_name(uint64_t regidx)
>> {
>>     g_assert_not_reached();
>> }
>> +
>> +bool kvm_idreg_write_scratch_vcpu(ARMCPU *cpu, int cpufd,
>> +                                  ARM64SysRegField *field, uint64_t newfv,
>> +                                  Error **errp)
>> +{
>> +    g_assert_not_reached();
>> +}
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 537673177a..f7ca0e0250 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -447,6 +447,57 @@ static bool kvm_arm_vcpu_validate_sysreg(ARMCPU *cpu, ARM64SysRegField *field,
>> #define KEY_TO_REG_IDX(key)     ((uint32_t)(((uint64_t)(key)) >> 8))
>> #define KEY_TO_SHIFT(key)       ((uint8_t)(((uint64_t)(key)) & 0xFF))
>>
>> +bool kvm_idreg_write_scratch_vcpu(ARMCPU *cpu, int cpufd,
>> +                                  ARM64SysRegField *field, uint64_t newfv,
>> +                                  Error **errp)
>> +{
>> +    uint64_t mask, old_reg_val, new_reg_val, oldfv;
>> +    struct kvm_one_reg reg;
>> +    int lower = field->shift;
>> +    int length = field->length;
>> +    int index = field->index;
>> +    uint64_t kidx;
>> +    int ret;
>> +
>> +    mask = MAKE_64BIT_MASK(lower, length);
>> +
>> +    if (!kvm_arm_vcpu_validate_sysreg(cpu, field, newfv, errp)) {
>> +        return false;
>> +    };
>> +
>> +    kidx = idregs_sysreg_to_kvm_reg(id_register_sysreg[index]);
>> +    ret = read_sys_reg64(cpufd, &old_reg_val, kidx);
>> +    if (ret) {
>> +        error_setg(errp, "failed to read the scratch vcpu value for field %s %m",
>> +                   field->name);
>> +        return false;
>> +    }
>> +    oldfv = (old_reg_val & mask) >> lower;
>> +
>> +    new_reg_val = old_reg_val & ~mask;
>> +    new_reg_val |= newfv << lower;
>> +
>> +    reg.id = kidx;
>> +    reg.addr = (uintptr_t)&new_reg_val;
>> +    ret = ioctl(cpufd, KVM_SET_ONE_REG, &reg);
>> +    if (ret) {
>> +        error_setg(errp, "failed to apply new value 0x%"PRIx64" for field %s "
>> +                   "(previous is 0x%"PRIx64"): %m", newfv, field->name, oldfv);
>> +        return false;
>> +    } else {
>> +        uint64_t check_val, actualfv;
>> +
>> +        ret = read_sys_reg64(cpufd, &check_val, kidx);
>> +        if (ret) {
>> +            error_setg(errp, "failed to read the new reg value: %m");
>> +            return false;
>> +        }
>> +        actualfv = (check_val & mask) >> lower;
>> +        trace_kvm_idreg_write_scratch_vcpu(field->name, oldfv, newfv, actualfv);
>> +    }
>> +    return true;
>> +}
>> +
> Hi Eric,
>
> This looks similar to kvm_arm_apply_sysreg_props(), we maybe be able to abstract out kvm_arm_apply_sysreg_prop(),
> which can then be used by both these functions.

done in v10

Thanks!

Eric
>
>> static void set_sysreg_prop(Object *obj, Visitor *v,
>>                             const char *name, void *opaque,
>>                             Error **errp)
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index 2a9cc67035..7a3f499a0e 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -21,6 +21,7 @@ set_sysreg_prop(const char *name, uint64_t old, uint64_t mask, uint64_t field_va
>> apply_sysreg_prop(const char *reg_name, const char *field_name, uint64_t old, uint64_t current, uint64_t mask, uint64_t field_value, uint64_t new) "%s.%s old=0x%"PRIx64" current=0x%"PRIx64" mask=0x%"PRIx64" new field value=0x%"PRIx64" new=0x%"PRIx64
>> nb_sysreg_props(const char *name, int count) "%s: %d SYSREG properties"
>> unexpected_writable_reserved_field(const char *reg_name, const char *field_name, int lower, int upper) "Unexpected writable reserved field: %s.%s [%d,%d], skip it ..."
>> +kvm_idreg_write_scratch_vcpu(const char *name, uint64_t oldfv, uint64_t newfv, uint64_t actualfv) "successful dry-run for %s old=0x%"PRIx64" new=0x%"PRIx64" actual=0x%"PRIx64
>>
>> # cpu.c
>> arm_cpu_reset(uint64_t mp_aff) "cpu %" PRIu64
>> -- 
>> 2.53.0
>>


