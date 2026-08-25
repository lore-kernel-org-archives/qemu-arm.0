Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1418C61DB6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 08:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wymfx-0001Fu-HC; Tue, 25 Aug 2026 04:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wymfw-0001FZ-Hb
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wymfu-0007k2-JX
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787647109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmYe6ReltsW958CJHrYQJeGwQjVqTQhkicFnpiM0+p4=;
 b=cZ8r7bZGP147JrKY81xJvaCODllcbxDVCZ9j/9na/SK7Kp40eKVya6xQMmzBhuBvMfjFe8
 aQSdQ6SGmPNqanw+44hDe0kclHIH06aBk4qJypQFowklUBDXv+aI7hcdCES2xmipSV+KIY
 P75jnySWJFYIudN6/M17nff8OCkC5mY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-4hnvp6EjPNu1_FBhydlXew-1; Tue, 25 Aug 2026 04:38:26 -0400
X-MC-Unique: 4hnvp6EjPNu1_FBhydlXew-1
X-Mimecast-MFC-AGG-ID: 4hnvp6EjPNu1_FBhydlXew_1787647105
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-69abf97d53aso4492778a12.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 01:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787647105; x=1788251905;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZmYe6ReltsW958CJHrYQJeGwQjVqTQhkicFnpiM0+p4=;
 b=lj4fMYgk1dDApdFoMOwUuG2ah6d29GNU2e6ogpUhjrSAz95oRSJVi8m49JAFInp5wp
 JePCtawCh6OZ98jgVjXZx0AqmjgUma9JLHyPrez4i+FLBzL5GlgWbiIqMLYRD/iOAc50
 /ENEUEe8rxtvr/GB8JDadihyH7EOphLlrSENCiQng2+NfAW6HOak8Rgy+flnkuYnD/TG
 vBM84sHWR5lH+t4cjdq8mPkBgxLPeLSLAVLcUl62f1fZtmG9eN5BRPIw/B3YMylO0z6O
 V89jxYcOLGz+whjNd8ypiyA4cHNZgoGvRUItyXlatC3XViN8m22ZAE6kPdRZC5OIfINi
 RbUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoeECSaAfYrU6xJ/k7f90bA3mIYVEpCqmKvsQiqLzIcUdxec5G+PW/o6PEKwO0d6D+ztRPP40aHgQ==@nongnu.org
X-Gm-Message-State: AFuF++mk/drFgqmQcLedvAk8xeKGNyc+HhA7ZjR4M1KKi9pEWJcfpHnQ
 mX3g61dTuoskWkj6iTHkg+UnlP7jcOVzhvya96s3RwtIFdaqeNv22BlUn2+swkz7hTg+ZYtUhFe
 Tl2xqsckR2O2hMYIi2GnEdxSiz4RR9z7N6gijUGUcvUovZf7sqnZQkg==
X-Gm-Gg: AR+sD11P/5PHLxOEuRkfLK3HxAKAVmDXcDyUnVjD8EIjqgZCows0VzW7BcKSS9QgILY
 Uy9V7Z+ldqqTDI86goc5YQbwgOjj0SdIpmyB9m4+WtiDYVqS8CVYIMpuw4LXswP3nJBkRbdJ+iM
 s1BtUbxuSV2UHXyaBz6NDbqYBul7FsUQY3UVDg8yKE+CDNLHEa80vos6bxVUwfReYi8VxBePvsq
 Lc2PXvGGGDgCKRvTNfthtffdT96iGwWKt7BxHTDjaVkWQfUIJseD9sov4ahylZzrGCOPJ+NWB3K
 2JpnFMkNpP4yuGjc4C5kjYRVvR/NhYz9laWDwkHJQpgFWF4Lr+u8DUZQKma8HGUInESMYQjKK3e
 1jjKgIUVO6FcLVedrC2271GAMSJPDnG2xH/EMA7mPQpvdZzRU
X-Received: by 2002:a05:6402:20da:b0:6a3:ff14:ebc9 with SMTP id
 4fb4d7f45d1cf-6a42f1bcdd1mr30814517a12.11.1787647105050; 
 Tue, 25 Aug 2026 01:38:25 -0700 (PDT)
X-Received: by 2002:a05:6402:20da:b0:6a3:ff14:ebc9 with SMTP id
 4fb4d7f45d1cf-6a42f1bcdd1mr30814485a12.11.1787647104559; 
 Tue, 25 Aug 2026 01:38:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e2da49bsm14423841a12.29.2026.08.25.01.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:38:23 -0700 (PDT)
Message-ID: <cae6f5c2-edb2-4811-a915-cbd93bbd903b@redhat.com>
Date: Tue, 25 Aug 2026 10:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 18/18] arm-qmp-cmds: introspection for ID register
 props
To: Markus Armbruster <armbru@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, shaju.abraham@nutanix.com,
 khushit.shah@nutanix.com, yangjinqian1@huawei.com, cohuck@redhat.com,
 richard.henderson@linaro.org, sebott@redhat.com, skolothumtho@nvidia.com,
 philmd@oss.qualcomm.com, maz@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
References: <20260726153221.24773-1-eric.auger@redhat.com>
 <20260726153221.24773-19-eric.auger@redhat.com> <878q613tae.fsf@pond.sub.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <878q613tae.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LFHzJ4Q4V8BDXMMKmy4fALccd-7pUGYdzlU6jNaAYSg_1787647105
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Markus,

On 8/20/26 1:50 PM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Implement the capability to query available ID register values by
>> adding SYSREG_* options and values to the cpu model expansion for the
>> host model, if available.
>>
>> Excerpt:
>> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> Is this qmp-shell?
yes it is. Is that a problem?
>
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
>> {"error": {"class": "GenericError", "desc": "idreg SYSREG_ID_AA64ISAR0_EL1_DP set value (0x2) does not match any arch valid enum value!"}}
> The examples use CPU "host".  Inconvenient for me, because I run into
> "The CPU type 'host' requires KVM" when I try to play with them myself.
> If you don't actually need "host" here, consider using something that
> works more widely, just to help reviewers.
It only applies to the host model, that's the reason. Extending this to
TCG models is theorerically feasible but would induce huge changes
without much benefits I think. With TCG you already have named vcpu
models you can migrate as is. The purpose of this series is to allow
tweaking the host passthrough model to allow migration between
differents hosts.

>
>> The following checks are performed:
>> - the value does not exceed the field size
>> - if the field is associated to enum values, the set value must be one
>>   of those enum values
>> - the value is applied against a scratch vcpu making sure the setting is
>>   not rejected for this host
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - add the write capability
>> ---
>>  target/arm/arm-qmp-cmds.c | 98 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>
>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>> index 83ec95c290..41fefadcea 100644
>> --- a/target/arm/arm-qmp-cmds.c
>> +++ b/target/arm/arm-qmp-cmds.c
>> @@ -21,6 +21,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>  #include "qemu/target-info.h"
>>  #include "hw/core/boards.h"
>>  #include "kvm_arm.h"
>> @@ -30,7 +31,10 @@
>>  #include "qapi/qapi-commands-machine.h"
>>  #include "qapi/qapi-commands-misc-arm.h"
>>  #include "qobject/qdict.h"
>> +#include "qobject/qnum.h"
>>  #include "qom/qom-qobject.h"
>> +#include <linux/kvm.h>
>> +#include "system/kvm.h"
>>  #include "cpu.h"
>>  
>>  static GICCapability *gic_cap_new(int version)
>> @@ -84,11 +88,14 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>                                                       Error **errp)
>>  {
>>      CpuModelExpansionInfo *expansion_info;
>> +    ObjectPropertyIterator iter;
>>      const QDict *qdict_in;
>> +    ObjectProperty *idregprop;
>>      QDict *qdict_out;
>>      ObjectClass *oc;
>>      Object *obj;
>>      const char *name;
>> +    int fdarray[3];
>>      int i;
>>  
>>      if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
>> @@ -133,6 +140,38 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>  
>>      obj = object_new(object_class_get_name(oc));
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
> This error message feels off.  I'd use something like "can't create
> FOO".  Still bad, because it provides no clue on why.  What are the
> possible failure modes?
OK. There are quite a lot of possible failures which are handled in
kvm_arm_create_scratch_host_vcpu()
opening of /dev/kvm, KVM_CREATE_VM, KVM_CREATE_VCPU,
KVM_ARM_PREFERRED_TARGET, KVM_ARM_VCPU_INIT.
In next version I will add an Error handle to
kvm_arm_create_scratch_host_vcpu() so that precise error message gets
returned.
>
>> +            return NULL;
>> +        }
>> +    }
>> +
>>      if (model->props) {
>>          Visitor *visitor;
>>          Error *err = NULL;
>> @@ -145,6 +184,49 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>          }
>>  
>>          qdict_in = qobject_to(QDict, model->props);
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
> Scratch the !
>
> From error_setg()'s contract:
>
>  * The resulting message should be a single phrase, with no newline or
>  * trailing punctuation.
>
> Is this error reachable?  How?
I removed this, also because it changes the default error returned when
a propertu does not exist and regresses one qtest.
>
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
> Pass @errp to object_property_set() and drop the error_propagate()?
yes
>
>> +                visit_free(v);
>> +                return NULL;
>> +            }
>> +
>> +            success = kvm_idreg_write_scratch_vcpu(fdarray[2], v, key,
>> +                                                   prop->opaque, &err);
>> +            if (!success) {
>> +                error_propagate(errp, err);
> Likewise?
yes
>
>> +                visit_free(v);
>> +                return NULL;
>> +            }
>> +            visit_free(v);
>> +        }
>> +
>>          i = 0;
>>          while ((name = cpu_model_advertised_features[i++]) != NULL) {
>>              if (qdict_get(qdict_in, name)) {
>> @@ -160,6 +242,10 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>          if (!err) {
>>              arm_cpu_finalize_features(ARM_CPU(obj), &err);
>>          }
>> +
>> +        if (kvm_enabled()) {
>> +            kvm_arm_destroy_scratch_host_vcpu(fdarray);
>> +        }
>>          visit_end_struct(visitor, NULL);
>>          visit_free(visitor);
>>          if (err) {
>> @@ -190,6 +276,18 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>          }
>>      }
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
>>      if (!qdict_size(qdict_out)) {
>>          qobject_unref(qdict_out);
>>      } else {
Thanks

Eric


