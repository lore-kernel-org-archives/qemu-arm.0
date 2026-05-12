Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC591CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 15:12:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMomn-0004yi-UX; Tue, 12 May 2026 11:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMomm-0004yI-OL
 for qemu-arm@nongnu.org; Tue, 12 May 2026 11:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMomj-00066H-Sq
 for qemu-arm@nongnu.org; Tue, 12 May 2026 11:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778598756;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHAgB6HV5/4LAPiF6vh00PMIU5wdo+azoQixOlaMg7A=;
 b=jABvI57+5Wg0SU57ndO8J3kyi2isPN260D66nXUqWe0Vto+5H0RyjRGXHwL9IRZIHF9TqU
 FUR/LSApqKW3xMZvQDOfnZhZKzBs1eIs7Mo6gLXQwdYGsNBX7D7626p2v3kjcu3AFYwvMK
 pee3ENz4v0e5z9rp2em+vzWdOyZHu7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-Dvg5m6zvMD-QSksSu72PUw-1; Tue, 12 May 2026 11:12:35 -0400
X-MC-Unique: Dvg5m6zvMD-QSksSu72PUw-1
X-Mimecast-MFC-AGG-ID: Dvg5m6zvMD-QSksSu72PUw_1778598754
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48fc8dd6be2so299205e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 08:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778598754; x=1779203554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHAgB6HV5/4LAPiF6vh00PMIU5wdo+azoQixOlaMg7A=;
 b=gmax1dLwmV6TUd7w+6KILIU49WGX6McZrXVTouDuki03jzc04mp/MjQ/r4vksLpUAK
 EtpOZaDGvZFyDZr5mX0IGZ6LiBZMYA0Uy5VYKEnKy/U6nlGoErxlo+iAagLzwYApal13
 t/oD/n3vdHgy2BdeLH5XRoRpUedD0wtYLUMgAtCLcTkd1zaRFwjCfWDDUvk+H1gI6QfP
 ATDAsOYmD/K3xZOhCuCC7KH3uoU27PG3NxOAbVxayOBg+lLr3GMlqFyaZJEdmyLuY+Yx
 tRz3w5LuLL5kxn5MUcIb/qYMjwn0TS/6CpUqPMl1jE4RcugDzEgd2FPyEBR7QSfq5hjB
 p+Bw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/kzDjkErr2BxsZFQuLF2sCcxJgNnoZdOYIIKDXTK9zhi9B6AFr8hJlMNd2Cv0ubITjFd7hzPlBWQ==@nongnu.org
X-Gm-Message-State: AOJu0YweNZIt5ceu5xZGe0RcBtCBp8KVnynh2dCe1JyBW2+ga47gcnYf
 UdpoJjWcSAULrlW0EhdXaqIhGEAQr5qQHWQargPY7r1ej9GaVKr+edLTcwNFhiNCi4sn/YaU8Ht
 cPf70mihHuvBtMtjv05+eebLjiuYbB8CGXqKvza4LSvt06yhIE83Hng==
X-Gm-Gg: Acq92OHO3adzCTk5+avOqLRIJux6/dMEy9Li7NrAPcpcUElNaKx6xYppD730SRj/nS1
 HO4PwRfb3YdVoDL1WL9NnaGP1KSUm5WMZnEB4luqfE+dxFfVYSEM7JEtHKT1UGBUQYsTtICVGm3
 FjlB5vX3SwUNTHPudHmjCIQXVKjttwD9f810VA2KdGixg4qSeGpMG+v7eY/gcOmm0UVEh3PHqv1
 s45r2y+kBIOgN2yKtdsgCJtIF8kQp4XBvGRdEQXZyseQvLoyyHx3ok0KVAzZOAriasioKKdIq5d
 xqSxh6KjDpolXLquwkIaNHwO0FD0HhUFWw3o44z6YZftE/DLiHztGmu6zGBDFzONjIL9Oj5L7Nv
 WzmxO+bAAezk6cRTBRinEKU/KXGtAauecZZJLnbIAiWBFj/lk/IjXCuwS652Ub+gcvgLrcA==
X-Received: by 2002:a05:600c:8214:b0:48a:6268:18a9 with SMTP id
 5b1f17b1804b1-48e706b262amr240043235e9.13.1778598753991; 
 Tue, 12 May 2026 08:12:33 -0700 (PDT)
X-Received: by 2002:a05:600c:8214:b0:48a:6268:18a9 with SMTP id
 5b1f17b1804b1-48e706b262amr240042675e9.13.1778598753531; 
 Tue, 12 May 2026 08:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491f8d4c3sm33029374f8f.34.2026.05.12.08.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:12:33 -0700 (PDT)
Message-ID: <7678a671-db5e-43dc-b38f-1376bb0459e9@redhat.com>
Date: Tue, 12 May 2026 17:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] target/arm/kvm: Introduce
 kvm_get_writable_id_regs
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
 <20260503073541.790215-9-eric.auger@redhat.com>
 <CH3PR12MB75488AAC8601BD74D6095FA6AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75488AAC8601BD74D6095FA6AB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KjhX011t70ha2xhc2Jy8aBzGvC7e4kGTIJTsel_TUo4_1778598754
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



On 5/7/26 12:07 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 May 2026 08:33
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> cohuck@redhat.com; sebott@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v4 08/17] target/arm/kvm: Introduce
>> kvm_get_writable_id_regs
>>
>> External email: Use caution opening links or attachments
>>
>>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Add an helper to retrieve the writable id reg bitmask. The
>> status of the query is stored in the CPU struct so that an
>> an error, if any, can be reported on vcpu realize().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu.h     | 26 ++++++++++++++++++++++++++
>>  target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
>>  target/arm/kvm_arm.h |  3 +++
>>  3 files changed, 61 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index be14a47c35..2aa22360d2 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -866,6 +866,26 @@ typedef struct {
>>      uint32_t map, init, supported;
>>  } ARMVQMap;
>>
>> +typedef enum ARMIdRegsState {
>> +    WRITABLE_ID_REGS_UNKNOWN,
>> +    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
>> +    WRITABLE_ID_REGS_FAILED,
>> +    WRITABLE_ID_REGS_AVAIL,
>> +} ARMIdRegsState;
>> +
>> +/*
>> + * The following structures are for the purpose of mapping the output of
>> + * KVM_ARM_GET_REG_WRITABLE_MASKS that also may cover id registers
>> we do
>> + * not support in QEMU
>> + * ID registers in op0==3, op1=={0,1,3}, crn=0, crm=={0-7}, op2=={0-7},
>> + * as used by the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl call.
>> + */
>> +#define NR_ID_REG_MASKS (3 * 8 * 8)
> Probably can re-use KVM_ARM_FEATURE_ID_RANGE_SIZE here.
> Looks like used for the same purpose in:
> tools/testing/selftests/kvm/arm64/set_id_regs.c

removed. The writable_map array is now dynamically allocated in
kvm_arch_init_vcpu()

Thanks

Eric
>
> Thanks,
> Shameer
>> +
>> +typedef struct IdRegMap {
>> +    uint64_t regs[NR_ID_REG_MASKS]; /* writable masks for registers */
>> +} IdRegMap;
>> +
>>  /* REG is ID_XXX */
>>  #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>>      ({                                                                  \
>> @@ -1054,6 +1074,12 @@ struct ArchCPU {
>>       */
>>      bool host_cpu_probe_failed;
>>
>> +    /*
>> +     * state of writable id regs query used to report an error, if any,
>> +     * on vcpu model realize
>> +     */
>> +    ARMIdRegsState writable_id_regs_status;
>> +
>>      /* QOM property to indicate we should use the back-compat CNTFRQ
>> default */
>>      bool backcompat_cntfrq;
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index d4a68874b8..f06a60804d 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -51,6 +51,7 @@ const KVMCapabilityInfo
>> kvm_arch_required_capabilities[] = {
>>  static bool cap_has_mp_state;
>>  static bool cap_has_inject_serror_esr;
>>  static bool cap_has_inject_ext_dabt;
>> +static int cap_writable_id_regs;
>>
>>  /**
>>   * ARMHostCPUFeatures: information about the host CPU (identified
>> @@ -499,6 +500,37 @@ void
>> kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>>      env->features = arm_host_cpu_features.features;
>>  }
>>
>> +int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
>> +{
>> +    struct reg_mask_range range = {
>> +        .range = 0, /* up to now only a single range is supported */
>> +        .addr = (uint64_t)idregmap,
>> +    };
>> +    int ret;
>> +
>> +    if (!kvm_enabled()) {
>> +        cpu->writable_id_regs_status =
>> WRITABLE_ID_REGS_NOT_DISCOVERABLE;
>> +        return -ENOSYS;
>> +    }
>> +
>> +    cap_writable_id_regs =
>> +        kvm_check_extension(kvm_state,
>> KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
>> +
>> +    if (!cap_writable_id_regs ||
>> +        !(cap_writable_id_regs & (1 << KVM_ARM_FEATURE_ID_RANGE))) {
>> +        cpu->writable_id_regs_status =
>> WRITABLE_ID_REGS_NOT_DISCOVERABLE;
>> +        return -ENOSYS;
>> +    }
>> +
>> +    ret = kvm_vm_ioctl(kvm_state, KVM_ARM_GET_REG_WRITABLE_MASKS,
>> &range);
>> +    if (ret) {
>> +        cpu->writable_id_regs_status = WRITABLE_ID_REGS_FAILED;
>> +        return ret;
>> +     }
>> +    cpu->writable_id_regs_status = WRITABLE_ID_REGS_AVAIL;
>> +    return ret;
>> +}
>> +
>>  static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
>>  {
>>      return !ARM_CPU(obj)->kvm_adjvtime;
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index e7c40fb003..b22a56fc17 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -240,4 +240,7 @@ void arm_gic_cap_kvm_probe(GICCapability *v2,
>> GICCapability *v3);
>>   */
>>  char *kvm_print_register_name(uint64_t regidx);
>>
>> +typedef struct IdRegMap IdRegMap;
>> +int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap);
>> +
>>  #endif
>> --
>> 2.53.0


