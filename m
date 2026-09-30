Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CB4CA5FC5
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 15:08:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBvvA-0000pq-OF; Wed, 30 Sep 2026 11:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBvuv-0000mG-HI
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 11:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBvut-0000B6-JZ
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 11:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790780896;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ns+huMlBjpBINTzATYtJG6y2085LhnRydQuWQ6U4h1s=;
 b=NPXvbOheyZuwEOxnbmK9GXgDbpf0dI13D1fGzQJhDB4qAXG7W7R4JPCul2gmVkfyISAKBw
 YxMqMt865+k+iBx1XrsIVQ63T7AsN0VLeaTNiIRNkF8c0s6r1EexUrocqCGLgFLIdK7TDh
 nQgJS72pw62JZyzgQ/+vapf1li/9Vlc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-qmf1Ck9rNrSswSbzZRr7Rw-1; Wed, 30 Sep 2026 11:08:15 -0400
X-MC-Unique: qmf1Ck9rNrSswSbzZRr7Rw-1
X-Mimecast-MFC-AGG-ID: qmf1Ck9rNrSswSbzZRr7Rw_1790780894
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48afe67dfc2so685053f8f.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 08:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790780894; x=1791385694;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ns+huMlBjpBINTzATYtJG6y2085LhnRydQuWQ6U4h1s=;
 b=MmpBRsbmVfZsfr6SPk7KQyW8DKWASJ0MJCbQy3AUp44zWsitvOkHOI/mNiI4gEcBO6
 dJnxZ0FT6MhJr6p/gRookQmg8Tf+ovrd0tPWk+VqSFma+ZaEf9uoph2pxOL+msBW6g/i
 WVbBx6CcfeClpdG+fNYsCFKliCcQPT3QQn4Cp/NXXLvVU5XshA/6CftEa8jLTJwf6WHQ
 uWPA7chpo+57tYAct8LMUNze6WAPVW3rQ3xYGZ//4NTUxsNgwppkXgwyNtgMc+Lc4/fz
 SRdeCdL6KkMzCgiQnmb0u+BPLMey1ZPmH/LuB4Km8+Z32/rDXYIB6x3kM1RQ/gQ8OIed
 gk1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6IjWYzN7OIsCzJHOcdzccicQ4m2mBaEzLH7NT4eiMZ9yYVmw99t33Oopw4HT4H8xdpGxHUjp0yQ==@nongnu.org
X-Gm-Message-State: AFuF++m9sHNrX/ZKnOEo7NbuytODWQtkWfgNXJfvpKJQB+nN/b21MUhZ
 JRStJGFBO+10IEdwepkF9VHeVOBF13P2HgfYEeVk+eP8puaJkeU53hh73q6AQApfMM/fy8CgY47
 DVeK6vmdbU6DlY6aadsBTvXMweFaRoJQVZs/t6QinuSRZOVZp9OEvSg==
X-Gm-Gg: AYBFou0I5OAaz8yZPYldr1G0LuTVpcognJAOMolrTkimNYZOBNw4UTMxH0PPz0PnKiy
 TuqqUf62+5+lQCXuV1gNAxyO8iacOmyRaQETEXkJvW4XbFfDvh8odD9HfOvXBC+8VZAwpC0DeA0
 M9LqEF4CN4woM8Voltie1ePADBCHaVr9PiLfwNopDKs6arKk0c+V4NYdG8k3xejVgjwe64LQuty
 UVvODDHeiutSMa8er0R8VpxIXDO0N0iwj+k7jRqVBM+D80Ltw/PpPWjp0gNadIUl7d2ajkYxNqe
 dxD7pcgugSOVY9stSL3cz7ppgSRtWNP7/OwRlUgWTuij+7DRdKjgyP6djBMDs5ZvB3XsxYw2erv
 fH0hJozxikLAbzRGXH1H93J9+MFRtJfg/SnI/5HMKum6YQfjn
X-Received: by 2002:a05:600d:82c4:b0:49c:e37e:4389 with SMTP id
 5b1f17b1804b1-4a01b188e38mr32968655e9.4.1790780893420; 
 Wed, 30 Sep 2026 08:08:13 -0700 (PDT)
X-Received: by 2002:a05:600d:82c4:b0:49c:e37e:4389 with SMTP id
 5b1f17b1804b1-4a01b188e38mr32967005e9.4.1790780892124; 
 Wed, 30 Sep 2026 08:08:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd6cd2bsm10750735e9.4.2026.09.30.08.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 08:08:11 -0700 (PDT)
Message-ID: <bd747536-c8eb-4c21-a859-ac1f2a28794f@redhat.com>
Date: Wed, 30 Sep 2026 17:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/26] target/arm/kvm: Apply SYSREG props to the final
 vcpu
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
 <20260916144721.751810-17-eric.auger@redhat.com>
 <8F110441-6D38-4134-9196-76AFA021250F@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8F110441-6D38-4134-9196-76AFA021250F@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tin2NyBGuZR5z243oHFU2tmwlinTa2ir7CMu2TSwmI0_1790780894
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

On 9/28/26 12:44 PM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> SYSREG prop settings were recorded in a hashtable but they
>> are not yet injected on guest. Iterate over all set fields and
>> apply the new value through KVM_SET_ONE_REG. The new field
>> value overrides the current observable vcpu register value.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> With this, I suppose, what named models will do is directly write to
> ID register state, As it also defines state which affects vCPU init flags also.
That's not what I had in mind. I thought you would apply the SYSREG
settings at the same time. As mentionned, I don't think those settings
are meant to substitute to legacy composite options that affect vcpu
init settings.
Besides the principle of this preparatory series is that the props for
writable ID reg fields are meant to be fully reusable for named vcpu
models. Only props for non writable fields should be specific to named
vcpu models as they do not make sense on host/max vcpu model


>
>> ---
>> target/arm/kvm.c        | 65 +++++++++++++++++++++++++++++++++++++++++
>> target/arm/trace-events |  1 +
>> 2 files changed, 66 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 3ec2618cc1..ddf320d0e6 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -343,6 +343,9 @@ static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
>> #define MAKE_IDREG_KEY(reg_idx, field_shift) \
>>     (((uint64_t)(reg_idx) << 8) | ((uint64_t)(field_shift) & 0xFF))
>>
>> +#define KEY_TO_REG_IDX(key)     ((uint32_t)(((uint64_t)(key)) >> 8))
>> +#define KEY_TO_SHIFT(key)       ((uint8_t)(((uint64_t)(key)) & 0xFF))
>> +
>> static void set_sysreg_prop(Object *obj, Visitor *v,
>>                             const char *name, void *opaque,
>>                             Error **errp)
>> @@ -2215,6 +2218,63 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp)
>>     return 0;
>> }
>>
>> +static int kvm_arm_apply_sysreg_props(ARMCPU *cpu, Error **errp)
>> +{
>> +    uint64_t *idregs = cpu->isar.idregs;
>> +    gpointer key_ptr, value_ptr;
>> +    CPUState *cs = CPU(cpu);
>> +    GHashTableIter iter;
>> +
>> +    g_hash_table_iter_init(&iter, cpu->sysreg_props);
>> +
>> +    while (g_hash_table_iter_next(&iter, &key_ptr, &value_ptr)) {
>> +        uint64_t key = (uint64_t)key_ptr;
>> +        uint64_t value = (uint64_t)value_ptr;
>> +        uint32_t reg_idx = KEY_TO_REG_IDX(key);
>> +        uint8_t lower    = KEY_TO_SHIFT(key);
>> +        ARM64SysReg *reg = &arm64_id_regs[reg_idx];
>> +        struct kvm_one_reg kvm_reg;
>> +        uint64_t current, old, mask;
>> +        uint64_t kvm_idx;
>> +        ARM64SysRegField *field = get_field(lower, reg);
>> +        int length = field->length;
>> +        uint64_t oldfv;
>> +        int ret;
>> +
>> +        mask = MAKE_64BIT_MASK(lower, length);
>> +        value = value << lower;
>> +
>> +        old = idregs[reg_idx];
>> +
>> +        kvm_idx = idregs_sysreg_to_kvm_reg(id_register_sysreg[reg_idx]);
>> +        ret = read_sys_reg64(cs->kvm_fd, &current, kvm_idx);
>> +        if (ret) {
>> +            error_setg(errp, "failed to read the current value of %s",
>> +                       reg->name);
>> +            return ret;
>> +        }
>> +        oldfv = (current & mask) >> lower;
>> +
>> +        idregs[reg_idx] = current & ~mask;
>> +        idregs[reg_idx] |= value;
>> +        kvm_reg.id = kvm_idx;
>> +        kvm_reg.addr = (uintptr_t)&idregs[reg_idx];
>> +
> We can ignore this if value == old value
sure, modified
>
>> +        ret = ioctl(cs->kvm_fd, KVM_SET_ONE_REG, &kvm_reg);
>> +        if (ret) {
>> +            error_setg(errp, "failed to apply new value 0x%"PRIx64" for field %s.%s "
>> +                       "(previous is 0x%"PRIx64"): %m", idregs[reg_idx],
>> +                       reg->name, field->name, oldfv);
>> +            return ret;
>> +        }
>> +
>> +        trace_apply_sysreg_prop(reg->name, field->name, old, current,
>> +                                mask, value, idregs[reg_idx]);
>> +    }
>> +    return 0;
>> +}
>> +
>> int kvm_arch_init_vcpu(CPUState *cs, Error **errp)
>> {
>>     int ret;
>> @@ -2315,6 +2375,11 @@ int kvm_arch_init_vcpu(CPUState *cs, Error **errp)
>>     }
>>     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>
>> +    ret = kvm_arm_apply_sysreg_props(cpu, errp);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
> This should also happen on vCPU reset.
On which path is it needed? on qmp system_reset I can see that the
former values applied with SYSREG settings are kept.

Thanks

Eric
>
> Overall, I like this approach as if the user does not provide any property overrides, it should behave the same as older builds.
>
> Warm Regards,
> Khushit
>>     return kvm_arm_init_cpreg_list(cpu);
>> }
>>
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index d72ad6b671..b4d2b45a7d 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -18,6 +18,7 @@ kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint6
>> decode_idreg_writemap(const char* name, int lower, int upper, char *prop_name) "%s [%d:%d] is writable (prop %s)"
>> get_sysreg_prop(const char *name, uint64_t value) "%s 0x%"PRIx64
>> set_sysreg_prop(const char *name, uint64_t old, uint64_t mask, uint64_t field_value, uint64_t new) "%s old reg value=0x%"PRIx64" mask=0x%"PRIx64" new field value=0x%"PRIx64" new reg value=0x%"PRIx64
>> +apply_sysreg_prop(const char *reg_name, const char *field_name, uint64_t old, uint64_t current, uint64_t mask, uint64_t field_value, uint64_t new) "%s.%s old=0x%"PRIx64" current=0x%"PRIx64" mask=0x%"PRIx64" new field value=0x%"PRIx64" new=0x%"PRIx64
>> nb_sysreg_props(const char *name, int count) "%s: %d SYSREG properties"
>>
>> # cpu.c
>> -- 
>> 2.53.0
>>


