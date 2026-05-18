Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CDBCD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 15:09:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOzbA-0000jo-Cx; Mon, 18 May 2026 11:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wOzb4-0000iK-53
 for qemu-arm@nongnu.org; Mon, 18 May 2026 11:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wOzb1-0007O3-Iu
 for qemu-arm@nongnu.org; Mon, 18 May 2026 11:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779116970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1JvOnfTGOD96u+W+NkuJW/FjAdVjJMQO4iS9YCao4Q=;
 b=Ec6f9R0AW6tz2jb/d6MqbeJR8lfIUK08vTqQ40NytNvAtRjO3Zs/OdayVwMHJYwntEyn8V
 URTxzBkLsf5xsDU8eQJgnkWsfu1tcoWoYTcHHzMIMv+EtBfPNrkPko2kFxaJtWKHRS2E3r
 TG/WSfCzhLLxNQrkjWLanm9Yg9pg614=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-qGwEhPBMOJGICB5TYFZ_wA-1; Mon, 18 May 2026 11:09:27 -0400
X-MC-Unique: qGwEhPBMOJGICB5TYFZ_wA-1
X-Mimecast-MFC-AGG-ID: qGwEhPBMOJGICB5TYFZ_wA_1779116966
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45e55c44ac1so1936066f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 08:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779116966; x=1779721766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1JvOnfTGOD96u+W+NkuJW/FjAdVjJMQO4iS9YCao4Q=;
 b=QRIkF9vplaLicNt56eJE0a182lZ5JqATOnZoxygTqi7ErTxo+6krVCWDYx0KMtebDt
 Quo6cuRl9BWidYXTXSQbmMofe+Pq/mVg+8pe7NC2T+HF+iXQJ5VBSfdJOGE93Yq8todL
 NWWdayFUSpljqtcRCaHQv/MHc6HVQ26ghQGYX8J2J2PbZSJ99ySnVteiGV5x7nNPn8fM
 5l24yPllPKKTtsMqoNG4WbiIgRxQbiGT8SqC3tJVWB5015BzwzRBqjZDAklJ+D5oEQAb
 +2TQlM8w+424hvJRYaPoI/omkVH/UnoCQPDZBAYCptSe/HYVpN7Eg9S9mdbhBXIKQnjq
 i5CA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Pr/SD9ZN2II3w2IfdBHKO2TsUSKgmCWYHSnFA1JumIlQ5NM5ozEQEQDfCVfGfFXWzLOaMnN1HMg==@nongnu.org
X-Gm-Message-State: AOJu0YyJq2PHCqzo3TKm3X32z4lGGKl9/VYvRTvaNxSRswKDupFsvvD9
 vgtrnUC0/3stGTKCPww2N4i8hx3UGAMb0Kh7bEK4PKluAiFAUPPZZh+sWlln0l5PvflpMfaMVC0
 3lms5kptkXaz31XnouABvzieaVQWxk015fxSON5ZHdGpS9qaV/Uo0DQ==
X-Gm-Gg: Acq92OFa8vs7pDJ+II4uXahjWhThH7Y1d0cvDxy9OYkxzxAAwLGN3Fsfyc2AGBkQEz9
 6Tw17dE2Zq+MGg56mUzr7b5pRRCg5CW5BMtdG/lDG/myHK+Wb1odfqFcnLvS5gROBrIJFqQ/P5v
 yNd9rBDsT/84lBK0cxzBcPvE9ljzn0xGLurAfUYV5Qah0YssTjiLAMjTLqv3a+7SWSXXXkKFXWJ
 r70aQNQr4FFeH5kWfjRpqrjE4fTnlPvJT5aGYC78EIrPQrtth+bG9mdgwo+InHiP1f9X8sN9FN8
 ERAbOlqCIXUXGxyVEzVhsMkVrHuOysddbBHWxV0aqUcbbdgfNlt0w7sZx1MYzSYD4WIgvoV3Hdx
 ilwdJRzfeozGP5VC2P2scp4wkd7z5a7luZ4WOssjVLKMThc0Z1FzRoxUbFzYtN5vx7s/jdA==
X-Received: by 2002:a05:6000:24c5:b0:45a:cea8:e4b2 with SMTP id
 ffacd0b85a97d-45e5c5ebcdfmr24017214f8f.29.1779116966113; 
 Mon, 18 May 2026 08:09:26 -0700 (PDT)
X-Received: by 2002:a05:6000:24c5:b0:45a:cea8:e4b2 with SMTP id
 ffacd0b85a97d-45e5c5ebcdfmr24017149f8f.29.1779116965640; 
 Mon, 18 May 2026 08:09:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3ac86sm37568717f8f.14.2026.05.18.08.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:09:25 -0700 (PDT)
Message-ID: <28d28760-d1d7-47e6-8651-7c651390fc54@redhat.com>
Date: Mon, 18 May 2026 17:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] target/arm/kvm: Introduce
 kvm_arm_expose_idreg_properties
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <20260503073541.790215-13-eric.auger@redhat.com>
 <CH3PR12MB75488E874766B26AC78AB399AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75488E874766B26AC78AB399AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _7bNhIoz_O8fovdle-BanPgHrLFMKTuo1LEddIJh8bE_1779116966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 5/7/26 9:10 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 May 2026 08:34
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> cohuck@redhat.com; sebott@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v4 12/17] target/arm/kvm: Introduce
>> kvm_arm_expose_idreg_properties
>>
>> External email: Use caution opening links or attachments
>>
>>
>> This helper decode the ID reg writable mask, matches it against
>> ID reg fields defined in target/arm/cpu-sysreg-properties.c and
>> for each writable named field, generates a uint64 property.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  target/arm/kvm.c        | 134
>> ++++++++++++++++++++++++++++++++++++++++
>>  target/arm/kvm_arm.h    |  10 +++
>>  target/arm/trace-events |   4 ++
>>  3 files changed, 148 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index ca9a7d9439..d9bf1ec039 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -344,6 +344,140 @@ static int get_host_cpu_idregs(ARMCPU *cpu, int
>> fd, ARMHostCPUFeatures *ahcf)
>>      return err;
>>  }
>>
>> +static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
>> +{
>> +    GList *l;
>> +
>> +    for (l = reg->fields; l; l = l->next) {
>> +        ARM64SysRegField *field = (ARM64SysRegField *)l->data;
>> +
>> +        if (i >= field->lower && i <= field->upper) {
>> +            return field;
>> +        }
>> +    }
>> +    return NULL;
>> +}
>> +
>> +static void set_sysreg_prop(Object *obj, Visitor *v,
>> +                            const char *name, void *opaque,
>> +                            Error **errp)
>> +{
>> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    uint64_t *idregs = cpu->isar.idregs;
>> +    uint64_t old, value, mask;
>> +    int lower = field->lower;
>> +    int upper = field->upper;
>> +    int length = upper - lower + 1;
>> +    int index = field->index;
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
>> +    mask = MAKE_64BIT_MASK(lower, length);
>> +    value = value << lower;
>> +    old = idregs[index];
>> +    idregs[index] = old & ~mask;
>> +    idregs[index] |= value;
>> +    trace_set_sysreg_prop(name, old, mask, value, idregs[index]);
>> +}
>> +
>> +static void get_sysreg_prop(Object *obj, Visitor *v,
>> +                            const char *name, void *opaque,
>> +                            Error **errp)
>> +{
>> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    uint64_t *idregs = cpu->isar.idregs;
>> +    uint64_t value, mask;
>> +    int lower = field->lower;
>> +    int upper = field->upper;
>> +    int length = upper - lower + 1;
>> +    int index = field->index;
>> +
>> +    mask = MAKE_64BIT_MASK(lower, length);
>> +    value = (idregs[index] & mask) >> lower;
>> +    visit_type_uint64(v, name, &value, errp);
>> +    trace_get_sysreg_prop(name, value);
>> +}
>> +
>> +/*
>> + * decode_idreg_writemap: Generate props for writable fields
>> + *
>> + * @obj: CPU object
>> + * @index: index of the sysreg
>> + * @map: writable map for the sysreg
>> + * @reg: description of the sysreg
>> + */
>> +static int
>> +decode_idreg_writemap(Object *obj, int index, uint64_t map, ARM64SysReg
>> *reg)
>> +{
>> +    int i = ctz64(map);
>> +    int nb_sysreg_props = 0;
>> +
>> +    while (map) {
>> +        ARM64SysRegField *field = get_field(i, reg);
>> +        int lower, upper;
>> +        uint64_t mask;
>> +        char *prop_name;
>> +
>> +        if (!field) {
>> +            warn_report("%s bit %d of %s is writable but no named field "
>> +                        "in target/arm/cpu-sysreg-properties.c",
>> +                        __func__, i, reg->name);
>> +            warn_report("%s is target/arm/cpu-sysreg-properties.c up to date?",
>> __func__);
>> +            map =  map & ~BIT_ULL(i);
>> +            i = ctz64(map);
>> +            continue;
>> +        }
>> +        lower = field->lower;
>> +        upper = field->upper;
>> +        prop_name = g_strdup_printf("SYSREG_%s_%s", reg->name, field-
>>> name);
>> +        trace_decode_idreg_writemap(field->name, lower, upper, prop_name);
>> +        object_property_add(obj, prop_name, "uint64",
>> +                            get_sysreg_prop, set_sysreg_prop, NULL, field);
>> +        nb_sysreg_props++;
> g_free(prop_name) ? Or may be use g_autofree.
using a macro now, instead of avoid dynamic alloc.
>            
>
>> +
>> +        mask = MAKE_64BIT_MASK(lower, upper - lower + 1);
>> +        map = map & ~mask;
>> +        i = ctz64(map);
>> +    }
>> +    trace_nb_sysreg_props(reg->name, nb_sysreg_props);
>> +    return 0;
>> +}
>> +
>> +/* analyze the writable mask and generate properties for writable fields */
>> +void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg
>> *regs)
>> +{
>> +    int i, idx;
>> +    IdRegMap *map = cpu->writable_map;
> I think better we check writable_map before proceeding.
sure

Thanks

Eric
>
> Thanks,
> Shameer
>
>> +    Object *obj = OBJECT(cpu);
>> +
>> +    for (i = 0; i < NR_ID_REG_MASKS; i++) {
>> +        uint64_t mask = map->regs[i];
>> +
>> +        if (mask) {
>> +            /* reg @i has some writable fields, decode them */
>> +            idx = kvm_feature_idx_to_idregs_idx(i);
>> +            if (idx < 0) {
>> +                /* no matching reg? */
>> +                warn_report("%s: reg %d writable, but not in list of idregs?",
>> +                            __func__, i);
>> +            } else {
>> +                decode_idreg_writemap(obj, i, mask, &regs[idx]);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>  static bool
>>  kvm_arm_get_host_cpu_features(ARMCPU *cpu, ARMHostCPUFeatures
>> *ahcf,
>>                                bool get_all_writable_id_regs)
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 91a7d5cc4b..a3034f264b 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -146,6 +146,16 @@ void
>> kvm_arm_set_cpu_features_from_host(ARMCPU *cpu,
>>   */
>>  void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
>>
>> +typedef struct ARM64SysReg ARM64SysReg;
>> +/**
>> + * kvm_arm_expose_idreg_properties:
>> + * @cpu: The CPU object to generate the properties for
>> + * @reg: registers from the host
>> + *
>> + * analyze the writable mask and generate properties for writable fields
>> + */
>> +void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg
>> *regs);
>> +
>>  /**
>>   * kvm_arm_steal_time_finalize:
>>   * @cpu: ARMCPU for which to finalize kvm-steal-time
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index c25d2a1191..d72ad6b671 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -15,6 +15,10 @@ arm_gt_update_irq(int timer, int irqstate)
>> "gt_update_irq: timer %d irqstate %d"
>>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova =
>> 0x%"PRIx64" is translated into 0x%"PRIx64
>>  get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host
>> value for %s is 0x%"PRIx64
>>  kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t
>> previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
>> +decode_idreg_writemap(const char* name, int lower, int upper, char
>> *prop_name) "%s [%d:%d] is writable (prop %s)"
>> +get_sysreg_prop(const char *name, uint64_t value) "%s 0x%"PRIx64
>> +set_sysreg_prop(const char *name, uint64_t old, uint64_t mask, uint64_t
>> field_value, uint64_t new) "%s old reg value=0x%"PRIx64" mask=0x%"PRIx64"
>> new field value=0x%"PRIx64" new reg value=0x%"PRIx64
>> +nb_sysreg_props(const char *name, int count) "%s: %d SYSREG properties"
>>
>>  # cpu.c
>>  arm_cpu_reset(uint64_t mp_aff) "cpu %" PRIu64
>> --
>> 2.53.0


