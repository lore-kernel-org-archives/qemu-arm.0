Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB912CA600A
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 07:52:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEivh-0003I8-VW; Thu, 08 Oct 2026 03:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xEivg-0003He-Iw
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 03:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xEive-0000Uq-Ms
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 03:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791445957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py7x+AATRs+M7CC5CAtcFn0GVg+kSB4pWlgQwH92zJU=;
 b=dWTWRe/d84JEgoJmXlbtCHjurgPKG4DGMiF6ki6Rb2vm+PdQ3NLXnYcjaoL78D8H3vI+U+
 tJe8fqKURpoXmlxHPNMLl/vp9l0UkN6v1goqdwzYFusiiPBA8Q0L/phs8HV9WdZN1KcutM
 0HuVRyr3M4accGuj6R25S5Cmjskb/zo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-kwAKtaDnNSW3AlSF2Ct-3Q-1; Thu, 8 Oct 2026 07:52:36 +0000
X-MC-Unique: kwAKtaDnNSW3AlSF2Ct-3Q-1
X-Mimecast-MFC-AGG-ID: kwAKtaDnNSW3AlSF2Ct-3Q_1791445955
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-486f9d150c3so2788349f8f.3
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791445955; x=1792050755;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Py7x+AATRs+M7CC5CAtcFn0GVg+kSB4pWlgQwH92zJU=;
 b=sDY5ilbo7ahd8kaIlkwhz1oqxunY1eisOw/pPWSvYLGHz55LKuGXc1yqWfJLE1WzoA
 f/ti13727t3pRiSfDgvIBNpZ87DEjlRar/2QiFZyV4F98r+82DS41K9HxTBfrYWllmYd
 5pPwyY62sYeAtgPcgHBcB4XkJpIUMUTIo3K/LcfKUqn6EYSloeoB9Ezu65z0TxZH43+U
 kr+tQOLYJnmQAt+sMzLULOifBN4Kvd7x+fobBZgqBw8yv8YyZ7u8sl9LMnycZwHiiyTT
 GjXvJ2WhRHEWVfmJhd73OaIj9Ie1drJWt1ERFSaAAavZHIBjN+AwfYcj9oY3uPXDuj2j
 xQ8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzwDluL+jpxGCzpTS1HjpPJUUuSjKWcypU5iOfNMMNDECUlHuFjipkOnXjFozaW7jn5GU3hsXi9Og==@nongnu.org
X-Gm-Message-State: AFq9FYLOYQ44cSuSgvYgtubiFHgColkmuR6zeINfDVjOFunqGWZRS4lc
 tremyMCa9QI32mUIKr7HO0u8AWWXg654w7BrO44z6t1GzK80Q/0VzzlZ8GeznDlgdgPq0F7yBtu
 DFUWP0OVBL44abhkOS2Z3z6MJCQJsbmp5vtGQJxcw+OfjlKMNcQRafA==
X-Gm-Gg: AYBFou3xhRn98QlDNyjBTimoqM+bcOzdOluFNIExcvjNWyomuhzDaFBw40fDRQ2NgUa
 eF1+CCD++/Ody7NddhQyyMyQMJLDgrxKpA1Cg7zE/xXnxofNyUdrcRCACRGeG8OBoF7kVczpSAg
 sCcdfMKDj3OPqJqlFn7pZmOlQqYmubiLp9sIp/wXzDHYRf/NLNbZZAnGlK+UTv9mhkTA9NpEESq
 ao2zVHNJo+WaU0oG1Uc79GuclNGxuMiAUm1nTNYRYM7cVs0VLLeSkLsUrcvNPRfWrYPH++rzsmG
 c4YiRBsmBja8yIY0W4mozVwUAdmE4VPjDoODEV95uJzV7niobACVLnILMRTjxexPuh8/sZb17oI
 5oGPiy2qGFq8TpD47Sup/4X3RspetLE1zGSnTKS7l/+/xaiuU
X-Received: by 2002:a05:6000:4818:b0:487:27f6:a4d3 with SMTP id
 ffacd0b85a97d-48c72884e65mr7905400f8f.35.1791445955209; 
 Thu, 08 Oct 2026 00:52:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4818:b0:487:27f6:a4d3 with SMTP id
 ffacd0b85a97d-48c72884e65mr7905271f8f.35.1791445952791; 
 Thu, 08 Oct 2026 00:52:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c724b660fsm9300871f8f.18.2026.10.08.00.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 00:52:32 -0700 (PDT)
Message-ID: <df13670e-1502-4947-8a76-600dd045708b@redhat.com>
Date: Thu, 8 Oct 2026 09:52:30 +0200
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
 <5AC3258F-1F6E-491E-8B38-633C52199904@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5AC3258F-1F6E-491E-8B38-633C52199904@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KXB1LQ0oj0Fe_Hc7HZKNlPbjrOf0fjDCuqc6V7ebwzE_1791445955
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
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



On 9/30/26 9:54 AM, Khushit Shah wrote:
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
>> +
>> +        kvm_reg.id = kvm_idx;
>> +        kvm_reg.addr = (uintptr_t)&idregs[reg_idx];
>> +
>> +        ret = ioctl(cs->kvm_fd, KVM_SET_ONE_REG, &kvm_reg);
>> +        if (ret) {
>> +            error_setg(errp, "failed to apply new value 0x%"PRIx64" for field %s.%s "
>> +                       "(previous is 0x%"PRIx64"): %m", idregs[reg_idx],
>> +                       reg->name, field->name, oldfv);
>> +            return ret;
>> +        }
> Hi Eric,
>
> The above is the only KVM-related code here. Can we split this into
>     1. Apply SYSREG_ props callback which resides in cpu64.c?
>     2. The previous writeback to cpregs function that writes back ID registers to KVM?

the problem is the previous method was copying all the idregs that
changed back to cpregs. But those idregs were populated from the "max"
vcpu which in some cases led to inconsistency with the final vcpu
setting. The setter now registers the new field value in a hash table.
Maybe we can just rely on an arch callback to apply them on the guest

Thanks

Eric
>
> The reason being the SYSREG_ props otherwise do not work with any other accelerator.
> We are already trying to make the SYSREG_ getter/setter accel-agnostic.
>
> The above method still has the nicety that -cpu host without any SYSREG_ prop should
> behave the same as previous :)
>
> Side note:
> While we don’t target TCG support currently, I tried your v8 + named models on TCG
> (quick hack; ~20 LOC), and SYSREG_ props/named models works almost out of the box
> there (very minimal testing), which was cool.
>
> Thanks,
> Khushit
>
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


