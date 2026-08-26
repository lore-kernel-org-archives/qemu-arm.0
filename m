Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F87C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 06:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz7T9-0005fL-Mi; Wed, 26 Aug 2026 02:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wz7T7-0005ep-GA
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 02:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wz7T5-00008p-HX
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 02:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787727038;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emv//XrvYholXANOqMWwHQIYAyRIppZnX63sxgczXdU=;
 b=IXCEHnz8pyjVt97t0zSKLn6oxMX6AdproU9G4toA1+O4NjCnR9NEKCFcuqw8tIN3Zw5yvg
 lnqMuWG0BP8TFMzuYfvFZDtBydVW9mkJfSEDDbhVelKPBQHXvNT/SWKhWVOGnDWMD7BGH8
 yPxCzlOPPShKE5bx5ZfqZ9JHGAxjT9Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-sfe-mzXJMCmZyb5AxVF6PQ-1; Wed, 26 Aug 2026 02:50:37 -0400
X-MC-Unique: sfe-mzXJMCmZyb5AxVF6PQ-1
X-Mimecast-MFC-AGG-ID: sfe-mzXJMCmZyb5AxVF6PQ_1787727036
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c251a48d473so38927466b.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 23:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787727036; x=1788331836;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=emv//XrvYholXANOqMWwHQIYAyRIppZnX63sxgczXdU=;
 b=aF0hB+J+E7uCv0kZZfxTg2FIqewfEMex/X4XqKhQ3BwRZV1wBcdCRpEt4D6hB7kX2I
 DmTrNg58//DmbBJOeBdmUl7QQM2tjOTL58X+oVQVm0rBKbpV1U9Ma23bGeL7qoNhF8Ze
 5vC8/2mqXLVYb4baK64kUseFP0ZVshhpbw/8obrVMAKd9rJRhj+/6rEBrrKWtmxCwpCe
 V4V3qBZ3CIygewcN5JaekghgtchLV2PHTB3Ifg4u8YY2N9cYc0XEpbEpgh5eGz9g3+GM
 nBVo/zplpgFAbQIv/CSr7WmMwsnmo32zr8EQlSBQ3WZ2Ag/61RxA9JkAUu7vJqBaBB9R
 p+gA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrbXpzFPpOgAeWkuWssI8daVcNhkj/tsB5nVjFuY5YQQBC13hmqvSax0muDqXD8KstjOPQrQnfbog==@nongnu.org
X-Gm-Message-State: AFuF++mup2nWLJSs7BQNBiyml5Y7NGSMBipKjTx4egVuC7QjYlLNXqEy
 GFg7T884hOKf/6j+0GjHvZwyg+T8EuQLUA9Spc88fwrin70wxurDd1BOjN18EOmgkdqWlyrs9ja
 jDcFglFcrtbTSQB+fxf6J8F0EqJi5c3VLLQ8ECE49Xt0UNslEXcCv3Q==
X-Gm-Gg: AR+sD12dXIukf7tE5LqGBbmHrPGnVcsYfdX+UkBosqUOYDCx67kJk6c0axHM1MHz6q+
 CHl5Xr0bI3hQ5oYLFJyDal7h4I2FdXkj75kMd9HkXjFMoYXDJGwMpMcaqvtHuM5MW7ykO708Jwu
 YBZloJwgBnimESzsZL+Cbnsa7HHye8m+mmGt73xfZ77ez/27xg46VoC4Hre3pc5sBf8uIKyxMT7
 xg3sug2/52i+y93fDCbGRwyiBDE5Cn1Lb66LKBJABbU4xINiwp6TSpKguJAlmnPV1jp55BYlO1b
 wepNV0qvStFTjSC3MUBQtQrZzCK1dcwC0ovjM+37ujYSP1pFJ/TuHZrox8Gwq77wgZTZsw5Taz7
 S7eGrzt0BD6dZ7lurF7cNrgX5kLrMWetcHqkTwe1/WEUjIDTR
X-Received: by 2002:a17:907:94cd:b0:c20:d90b:2ccf with SMTP id
 a640c23a62f3a-c250bb7d9ecmr522280066b.7.1787727036265; 
 Tue, 25 Aug 2026 23:50:36 -0700 (PDT)
X-Received: by 2002:a17:907:94cd:b0:c20:d90b:2ccf with SMTP id
 a640c23a62f3a-c250bb7d9ecmr522172866b.7.1787727024169; 
 Tue, 25 Aug 2026 23:50:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9e96bdsm249263366b.55.2026.08.25.23.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 23:50:23 -0700 (PDT)
Message-ID: <07a65f67-0ac5-425a-af3f-e4e38a1a6500@redhat.com>
Date: Wed, 26 Aug 2026 08:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 18/18] arm-qmp-cmds: introspection for ID register
 props
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
References: <20260726153221.24773-1-eric.auger@redhat.com>
 <20260726153221.24773-19-eric.auger@redhat.com>
 <C950721B-25A3-477F-ABF0-56491A2C968F@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <C950721B-25A3-477F-ABF0-56491A2C968F@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lvEzxWxIXz4SXLSl_xZoNqAfl7W357pNBklkF4RHoD4_1787727036
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

On 8/24/26 1:59 PM, Khushit Shah wrote:
>
>> On 26 Jul 2026, at 8:59 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Implement the capability to query available ID register values by
>> adding SYSREG_* options and values to the cpu model expansion for the
>> host model, if available.
>>
>> Excerpt:
>> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
>> {"return": {"model": {"name": "host", "props": {"SYSREG_ID_AA64PFR0_EL1_EL3": 1,
>> "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0, "SYSREG_CTR_EL0_L1Ip": 3,
>> "SYSREG_MIDR_EL1_PartNum": 3407, "SYSREG_CTR_EL0_DminLine": 4,
>> "SYSREG_ID_AA64MMFR0_EL1_PARange": 5, "SYSREG_ID_AA64MMFR1_EL1_ECBHB": 0
>> ../..
>>
>> This allows the upper stack to detect available writable ID regs and
>> the "host passthrough model" values.
>>
>> It also allows to test some ID reg field values:
>> (QEMU) query-cpu-model-expansion type=full model={"name":"host","props":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x13}}
>> {"error": {"class": "GenericError", "desc": "idreg SYSREG_ID_AA64ISAR0_EL1_DP set value (0x13) exceeds length of field (4)!"}}
>>
>> (QEMU) query-cpu-model-expansion type=full model={"name":"host","props":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x2}}
>> {"error": {"class": "GenericError", "desc": "idreg SYSREG_ID_AA64ISAR0_EL1_DP set value (0x2) does not match any arch valid enum value!”}}
> My reasoning here is: User never asked to run the CPU model/configuration. The QMP command is supposed to
> return the final prop values which QEMU will set/request from KVM.
>
> Like on x86, the query-cpu-model-expansion type=full model={“host”: “props”: {“amx-tile": true}} does not return
> with error even if host does not have AMX.
>
> But, maybe we can append CpuModelInfo or CpuModelExpansionInfo with optional ‘usable’ boolean. This even
> fills an existing gap, as, query-cpu-definitions cannot take property values.

Refering to docs/system/arm/cpu-features.rst it looks a normal case the
command fails in case settings cannot apply:

See 

(3) Let's try to disable ``aarch64``, which enables the AArch32 CPU
feature::

      (QEMU) query-cpu-model-expansion type=full
model={"name":"max","props":{"aarch64":false}}
      {"error": {
       "class": "GenericError", "desc":
       "'aarch64' feature cannot be disabled unless KVM is enabled and
32-bit EL1 is supported"
      }}

So my understanding is query-cpu-model-expansion is well suited to
settings dry-run

Thanks

Eric

> Warm Regards,
> Khushit
>> The following checks are performed:
>> - the value does not exceed the field size
>> - if the field is associated to enum values, the set value must be one
>>  of those enum values
>> - the value is applied against a scratch vcpu making sure the setting is
>>  not rejected for this host
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - add the write capability
>> ---
>> target/arm/arm-qmp-cmds.c | 98 +++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 98 insertions(+)
>>
>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>> index 83ec95c290..41fefadcea 100644
>> --- a/target/arm/arm-qmp-cmds.c
>> +++ b/target/arm/arm-qmp-cmds.c
>> @@ -21,6 +21,7 @@
>>  */
>>
>> #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> #include "qemu/target-info.h"
>> #include "hw/core/boards.h"
>> #include "kvm_arm.h"
>> @@ -30,7 +31,10 @@
>> #include "qapi/qapi-commands-machine.h"
>> #include "qapi/qapi-commands-misc-arm.h"
>> #include "qobject/qdict.h"
>> +#include "qobject/qnum.h"
>> #include "qom/qom-qobject.h"
>> +#include <linux/kvm.h>
>> +#include "system/kvm.h"
>> #include "cpu.h"
>>
>> static GICCapability *gic_cap_new(int version)
>> @@ -84,11 +88,14 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>                                                      Error **errp)
>> {
>>     CpuModelExpansionInfo *expansion_info;
>> +    ObjectPropertyIterator iter;
>>     const QDict *qdict_in;
>> +    ObjectProperty *idregprop;
>>     QDict *qdict_out;
>>     ObjectClass *oc;
>>     Object *obj;
>>     const char *name;
>> +    int fdarray[3];
>>     int i;
>>
>>     if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
>> @@ -133,6 +140,38 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>
>>     obj = object_new(object_class_get_name(oc));
>>
>> +    if (kvm_enabled()) {
>> +        bool pmuv3_supported = kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
>> +        bool sve_supported = kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>> +        struct kvm_vcpu_init init = { .target = -1, };
>> +        bool el2_supported = kvm_arm_el2_supported();
>> +        bool pauth_supported;
>> +        int ret;
>> +
>> +        pauth_supported = kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
>> +                          kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC);
>> +
>> +        if (sve_supported) {
>> +            init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
>> +        }
>> +        if (el2_supported) {
>> +            init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
>> +        }
>> +        if (pauth_supported) {
>> +            init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
>> +                             1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>> +        }
>> +        if (pmuv3_supported) {
>> +            init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>> +        }
>> +
>> +        ret = kvm_arm_create_scratch_host_vcpu(fdarray, &init);
>> +        if (!ret) {
>> +            error_setg(errp, "failing creating a scratch vcpu");
>> +            return NULL;
>> +        }
>> +    }
>> +
>>     if (model->props) {
>>         Visitor *visitor;
>>         Error *err = NULL;
>> @@ -145,6 +184,49 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>         }
>>
>>         qdict_in = qobject_to(QDict, model->props);
>> +
>> +        for (const QDictEntry *entry = qdict_first(qdict_in);
>> +                 entry != NULL; entry = qdict_next(qdict_in, entry)) {
>> +            const char *key = qdict_entry_key(entry);
>> +            QObject *val_obj = qdict_entry_value(entry);
>> +            ObjectProperty *prop;
>> +            Visitor *v;
>> +            bool success;
>> +            uint64_t val;
>> +
>> +            prop = object_property_find(obj, key);
>> +            if (!prop) {
>> +                error_setg(errp, "%s does not exist!", key);
>> +                return NULL;
>> +            }
>> +
>> +            if (!g_str_has_prefix(key, "SYSREG_")) {
>> +                continue;
>> +            }
>> +
>> +            /* consume the prop to avoid unexpected parameter */
>> +            if (!visit_type_uint64(visitor, key, &val, errp)) {
>> +                return NULL;
>> +            }
>> +
>> +            v = qobject_input_visitor_new(val_obj);
>> +
>> +            if (!object_property_set(obj, key, v, &err)) {
>> +                error_propagate(errp, err);
>> +                visit_free(v);
>> +                return NULL;
>> +            }
>> +
>> +            success = kvm_idreg_write_scratch_vcpu(fdarray[2], v, key,
>> +                                                   prop->opaque, &err);
>> +            if (!success) {
>> +                error_propagate(errp, err);
>> +                visit_free(v);
>> +                return NULL;
>> +            }
>> +            visit_free(v);
>> +        }
>> +
>>         i = 0;
>>         while ((name = cpu_model_advertised_features[i++]) != NULL) {
>>             if (qdict_get(qdict_in, name)) {
>> @@ -160,6 +242,10 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>         if (!err) {
>>             arm_cpu_finalize_features(ARM_CPU(obj), &err);
>>         }
>> +
>> +        if (kvm_enabled()) {
>> +            kvm_arm_destroy_scratch_host_vcpu(fdarray);
>> +        }
>>         visit_end_struct(visitor, NULL);
>>         visit_free(visitor);
>>         if (err) {
>> @@ -190,6 +276,18 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>         }
>>     }
>>
>> +    object_property_iter_init(&iter, obj);
>> +
>> +    while ((idregprop = object_property_iter_next(&iter))) {
>> +        QObject *value;
>> +
>> +        if (!g_str_has_prefix(idregprop->name, "SYSREG_")) {
>> +            continue;
>> +        }
>> +        value = object_property_get_qobject(obj, idregprop->name, &error_abort);
>> +        qdict_put_obj(qdict_out, idregprop->name, value);
>> +    }
>> +
>>     if (!qdict_size(qdict_out)) {
>>         qobject_unref(qdict_out);
>>     } else {
>> -- 
>> 2.53.0
>>


