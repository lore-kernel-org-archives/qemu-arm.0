Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E775CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 11:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB9rR-0005Dx-HC; Mon, 28 Sep 2026 07:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xB9rL-0005DQ-Vx
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xB9rI-0003VS-8V
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790596162;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWF37bj0FfdWjtg4WnDCuH4W9hlkjUX94zQ5tlDaGAY=;
 b=IrJfPBgI8bPswD3mu3gZJZBF1LSX6BUsS+hbQIQ9Is5jhaSt0D7LbhsUk2GXVBufwVBvuF
 tSIep0nTm46qjpYrTdSo3v4367Y57uAGlbYh7dnAc/aZ9Gc99w20h4hOHcDAZE5u4iPGOw
 Di3tVBswj84B1+k6vRA55eSExIOaWmo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-jflNdl2DPaO8Jbc3kt9ekA-1; Mon, 28 Sep 2026 07:49:18 -0400
X-MC-Unique: jflNdl2DPaO8Jbc3kt9ekA-1
X-Mimecast-MFC-AGG-ID: jflNdl2DPaO8Jbc3kt9ekA_1790596158
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4887b0303b0so1627415f8f.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 04:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790596157; x=1791200957;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zWF37bj0FfdWjtg4WnDCuH4W9hlkjUX94zQ5tlDaGAY=;
 b=1gEL28Z+79QYnMxxJo9dv7r0azODLQbHHe4/impUjAss3gQ96zRoCGVILcO0Oh923O
 pYAsWWy9Te9vh+z92FhG5Qw+G7Mxvt0kxbgcstezAMxtLd3DG6Bk1FHGSJ7TclpJkZco
 SphJws3Rrj2eA4wYGqFqDHB58lvfpFp0bn0q9sy7LquMMwAY5VrdbUaAfG/yR7tSYSPN
 1I8ov8nnBiBl29Sez1q9bVS+hHTQNZKQigyYUt+a2JfsW10ODNwaEnPzDdISrTLyn8Q3
 TBf7ow8mMMWCEr0T1C/ECyE8H5J7HgolamcpE3FJJ1s1P25TyFd5osUcMFSCm+UCVABv
 K6qQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDDThNu5CXNCuinw1/9HsB00Cugluz8XqbC7RrVe+Dw15ixWrDmySxai197rnfPUHfXdK57IjX7Q==@nongnu.org
X-Gm-Message-State: AFq9FYK6plGyfMqpTZAh/7UodQr0l2A3I3PgijnsN+E/07UJI0Fpkgu1
 aqmGYv9LnjZ7CIqInlqgmkDSQ6mr3NHx2ItDksjzYu0QQzwaJNqu8jrPvZs4pYhUq2bPI7FsZ6l
 geGQf8fjwvW80NjDav73BwCmmoGcImnQlQdrDVoY5nPfPzojypdz76A==
X-Gm-Gg: AYBFou1azu4U338wbL+v9MNvteRjijpNeUUsKl4CDSHA1CASRH6f7oWV3vtH2TTHUgc
 flvIfjH8CHgG32IIe2VQZx+utuFVQSM7uuaTKyQebHx6xRzsa2bQZQHaE/u9qHHpV2zONKI5mI/
 LW5+zca2pIJ+QhpCxca3055o3OjvTLn8Tw9/V239AraFfdqyswUQkIgjzQwQI15vmFWsdrC517d
 vN/4bGtVNCp/PsL7zWn1uc57Vlna2X+P0KdrIZXeJ6DdVzoiYQq6r/jE7a+YI+tmLLKUVTJwjlC
 2ykxDdZTmbcWtie+A2d7WoIg6KDQkiRVLTPsEUv3dUIUB7G5nntY3rA7EvbZZlHsup/xXxqG3KG
 SBPmlKS92ryVF7zi9uRQ5QYUVypfmcpnALytocRgodZlk09YZ
X-Received: by 2002:a5d:59c5:0:b0:487:faa:b1e0 with SMTP id
 ffacd0b85a97d-4887170dd86mr25423387f8f.12.1790596157544; 
 Mon, 28 Sep 2026 04:49:17 -0700 (PDT)
X-Received: by 2002:a5d:59c5:0:b0:487:faa:b1e0 with SMTP id
 ffacd0b85a97d-4887170dd86mr25423321f8f.12.1790596157054; 
 Mon, 28 Sep 2026 04:49:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-489bd7b1df0sm6535553f8f.31.2026.09.28.04.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 04:49:16 -0700 (PDT)
Message-ID: <810074ff-60af-4b36-9a7b-9b5ce4117eb4@redhat.com>
Date: Mon, 28 Sep 2026 13:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] target/arm/kvm: Implement SYSREG property setter
 and getter
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
 <20260916144721.751810-15-eric.auger@redhat.com>
 <ABBAB5A1-BD41-4D5C-9D09-DD1D7C50D0FB@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ABBAB5A1-BD41-4D5C-9D09-DD1D7C50D0FB@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dlokHamelk4Z-SGZSKGGsDg9iEXk2abMgpAhaIjxM-4_1790596158
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/28/26 11:28 AM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> When the setter is called, the final vcpu is not created yet.
>> Applying the override on vcpu.isar initialized with the max scratch
>> vcpu would not be correct because the final vcpu may have some features
>> turned off (for instance virtualization) while the scratch vcpu
>> features it. So we need to postpone the actual override until the
>> final vcpu has been initialized.
>>
>> In terms of input value validation what can be done now is checking
>> against field length and arch enum value if any.
>>
>> If this succeeds, the field value is added in the hash table to be
>> written later on once the final vcpu has been created
>>
>> With regards to the getter, if the sysreg prop was set, we return the
>> set value, otherwise, we return the value in cpu->isar.idregs[].
>>
> Hi Eric,
>
> Please mention that the cpreg override happens in later commits.
sure
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com <mailto:khushit.shah@nutanix.com>>
May I ask why?

Besides we need to be cautious about the fact that people who has signed
off the patches cannot review them ...
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/cpu.h |  2 ++
>> target/arm/cpu.c |  5 ++--
>> target/arm/kvm.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++--
>> 3 files changed, 68 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index e3f931dba2..9bbd42dd2b 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -952,6 +952,8 @@ struct ArchCPU {
>>     uint64_t *cpreg_vmstate_values;
>>     int32_t cpreg_vmstate_array_len;
>>
>> +    GHashTable *sysreg_props;
>> +
>>     DynamicGDBFeatureInfo dyn_sysreg_feature;
>>     DynamicGDBFeatureInfo dyn_svereg_feature;
>>     DynamicGDBFeatureInfo dyn_smereg_feature;
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 77aa78f00e..917f709cb4 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1236,8 +1236,8 @@ static void arm_cpu_initfn(Object *obj)
>> {
>>     ARMCPU *cpu = ARM_CPU(obj);
>>
>> -    cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
>> -                                         NULL, g_free);
>> +    cpu->cp_regs = g_hash_table_new(g_direct_hash, g_direct_equal);
>> +    cpu->sysreg_props = g_hash_table_new(g_direct_hash, g_direct_equal);
>>
>>     QLIST_INIT(&cpu->pre_el_change_hooks);
>>     QLIST_INIT(&cpu->el_change_hooks);
>> @@ -1725,6 +1725,7 @@ static void arm_cpu_finalizefn(Object *obj)
>>     ARMCPRegMigTolerance *t, *n;
>>
>>     g_hash_table_destroy(cpu->cp_regs);
>> +    g_hash_table_destroy(cpu->sysreg_props);
>>
>>     QLIST_FOREACH_SAFE(hook, &cpu->pre_el_change_hooks, node, next) {
>>         QLIST_REMOVE(hook, node);
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 341542279d..cdc3779321 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -340,18 +340,79 @@ static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
>>     return NULL;
>> }
>>
>> +#define MAKE_IDREG_KEY(reg_idx, field_shift) \
>> +    (((uint64_t)(reg_idx) << 8) | ((uint64_t)(field_shift) & 0xFF))
>> +
> Maybe, IDREG_FIELD_KEY()?
Yes

Eric
>
> Warm Regards,
> Khushit
>> static void set_sysreg_prop(Object *obj, Visitor *v,
>>                             const char *name, void *opaque,
>>                             Error **errp)
>> {
>> -    error_setg(errp, "%s setter not yet implemented", name);
>> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    int index = field->index;
>> +    int lower = field->shift;
>> +    int length = field->length;
>> +    uint64_t key, value;
>> +
>> +    if (!visit_type_uint64(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (length < 64 && value > ((1 << length) - 1)) {
>> +        error_setg(errp,
>> +                   "idreg %s set value (0x%lx) exceeds length of field (%d)!",
>> +                   name, value, length);
>> +        return;
>> +    }
>> +
>> +    if (field->arch_vals) {
>> +        /* this field has some enum values */
>> +        for (int i = 0; i < field->arch_vals_count; i++) {
>> +            if (value == field->arch_vals[i]) {
>> +                goto valid;
>> +            }
>> +        }
>> +        error_setg(errp,
>> +                   "idreg %s set value (0x%lx) does not match any "
>> +                   "arch valid enum value", name, value);
>> +        return;
>> +    }
>> +
>> +valid:
>> +
>> +    key = MAKE_IDREG_KEY(index, lower);
>> +    g_hash_table_insert(cpu->sysreg_props, GUINT_TO_POINTER(key),
>> +                       GUINT_TO_POINTER(value));
>> }
>>
>> static void get_sysreg_prop(Object *obj, Visitor *v,
>>                             const char *name, void *opaque,
>>                             Error **errp)
>> {
>> -    error_setg(errp, "%s getter not yet implemented", name);
>> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    int index = field->index;
>> +    int lower = field->shift;
>> +    int length = field->length;
>> +    gpointer value_ptr;
>> +    uint64_t value;
>> +    uint64_t key = MAKE_IDREG_KEY(index, lower);
>> +    gboolean exists;
>> +
>> +    exists = g_hash_table_lookup_extended(cpu->sysreg_props,
>> +                                          GUINT_TO_POINTER(key), NULL,
>> +                                          &value_ptr);
>> +    if (exists) {
>> +        value = GPOINTER_TO_UINT(value_ptr);
>> +    } else {
>> +        uint64_t mask = MAKE_64BIT_MASK(lower, length);
>> +        uint64_t *idregs = cpu->isar.idregs;
>> +
>> +        value = (idregs[index] & mask) >> lower;
>> +    }
>> +
>> +    visit_type_uint64(v, name, &value, errp);
>> +    trace_get_sysreg_prop(name, value);
>> }
>>
>> /*
>> -- 
>> 2.53.0
>>


