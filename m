Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DBDCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 06:45:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPECt-0003YP-IS; Tue, 19 May 2026 02:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPECX-0003RB-IX
 for qemu-arm@nongnu.org; Tue, 19 May 2026 02:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPECV-0005uD-Gr
 for qemu-arm@nongnu.org; Tue, 19 May 2026 02:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779173109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMy8vCv1+apXPJHbx27hsjeWyMULOd2K4r1D0AR/RlI=;
 b=YKJAE/TbSe43zpVNsIz2QlSNIvaSgCDyn0DmIh5ASSqWnnWjt74Gzp+OJL2hZTOYF075HN
 mlDQhKDk4b6NzDMKGB/97iD/LbiJBrIAp0PTB8my1Ye5FVfMgaOLd0R1/xQlOAZImRLQmC
 rGSqFOsBX7vWBdO/MSHDkeY7lsiDnO0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-RN6dtU5RMsqLAdYW8uLvbA-1; Tue, 19 May 2026 02:45:07 -0400
X-MC-Unique: RN6dtU5RMsqLAdYW8uLvbA-1
X-Mimecast-MFC-AGG-ID: RN6dtU5RMsqLAdYW8uLvbA_1779173106
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44f65835b77so2508713f8f.2
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 23:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779173106; x=1779777906;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMy8vCv1+apXPJHbx27hsjeWyMULOd2K4r1D0AR/RlI=;
 b=N1PfS+rOVY5Iz3xzfwrEWseXfaUxiI+qtiCAAAeoW4z/VxgMCqTv9DizXUM4Rms/Om
 OCj/m1GSuhSeQJwsyfBa2j+qtkCPEV+soMDTKb0dzq1+21wbPt5JZfXkGUjXDrfAdHtJ
 wIZnYAytMyYGjaxPVxBXznaqjs9DFXxZhdPp66sz5dVGQsqZx79dhLYKS/7dNeFFRFu+
 1siXlwUeTnPDcRi5TQO/WfzS5Xr/l7jq5/GYqWreb6FSoiZtwJ7TzDA3KFvKYqRMk1vK
 eiAtv6np/5jpmFU3cgQaZoeZTalV9fJcSe+f3IdIWbnxTOpVSmAWLbTQ+1qFgUl4p4vb
 Cbfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gKpcgSeISxqV4OQveq52DdrGXmoE5qNEmp1dLietL40jwvdSdTl4B/1kawJAMco48yeodpE7sNg==@nongnu.org
X-Gm-Message-State: AOJu0Yyq2YaMFi/XYnraLrHJtdRHIBEaoqhI0qH6Q2axAxPEwRLuFNTG
 ELdE9Tlw26i0DRafH06aYP4vEvp1ZprXSot+r7xDIDsGg4NjcGK64L2IuCj2H8suW3f3pv0OFYr
 sjsnTwLiRGGw0f3Pl6G2fLeqVbJdQWsRtgA9B0q5a9hRD8WsIVvvB1w==
X-Gm-Gg: Acq92OGoYOmsrdyckKb0dM02kQK1TWY3hbq8rkJqSTFy4vtEuNQilDUiEu1j9wHeGNT
 zN04EcJJjBQiA4HGZWcnG5i6/3qk2CuS1I5Q4ZQmX9DyIWcaDKd80RiJsnbOKuDubHTZwQeXVu2
 7/od8mCwmu9zFVziRl0kvibiQPu7Hd8K6rpfsE95fR0PDeLIaqSsfoDu/ArDlIePbmo7kIRrsdO
 jSI+K6YXLVdv/R2OoyuWg6ebD1Y2V2MlJLFaIXQaIM8XGshUXPMV09wAiW7dbo5C/+GJklEHwCk
 HTm7iaWd17gnZoTg6nhStOmE4HYf71FYv/3N5zgslz14/bcdyda3qtIvGq7LQplsV3uwdY14Ygb
 0laBihb+UpsgebfPhZ1xYoC7TIgrJRnbNm/12jZ+ffScTEI3O0SRj0raCd/cdXzpfAIreEQ==
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id
 5b1f17b1804b1-48fe66204e8mr260842535e9.31.1779173106398; 
 Mon, 18 May 2026 23:45:06 -0700 (PDT)
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id
 5b1f17b1804b1-48fe66204e8mr260842105e9.31.1779173105959; 
 Mon, 18 May 2026 23:45:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c834besm323327435e9.3.2026.05.18.23.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 23:45:05 -0700 (PDT)
Message-ID: <4e056a04-56e2-43ea-ba62-a2953efff080@redhat.com>
Date: Tue, 19 May 2026 08:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/17] arm/kvm: write back modified ID regs to KVM
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>, yangjinqian1@huawei.com
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <20260503073541.790215-12-eric.auger@redhat.com>
 <IA0PR12MB75555B2C69AC473011333C72AB3D2@IA0PR12MB7555.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <IA0PR12MB75555B2C69AC473011333C72AB3D2@IA0PR12MB7555.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P8uFb-ZBI9_KHqNjEMuCuv6Q539PUoXmnxnx8smxdvY_1779173106
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



On 5/8/26 3:03 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
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
>> Subject: [PATCH v4 11/17] arm/kvm: write back modified ID regs to KVM
>>
>> External email: Use caution opening links or attachments
>>
>>
>> We want to give a chance to override the value of host ID regs.
>> In a previous patch we made sure all their values could be fetched
>> through kvm_get_one_reg() calls before their modification. After
>> their potential modification we need to make sure we write back
>> the values through kvm_set_one_reg() calls.
>>
>> Make sure the cpreg_list is modified with updated values and
>> transfer those values back to kvm.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/kvm.c        | 59
>> ++++++++++++++++++++++++++++++++++++++++-
>>  target/arm/trace-events |  1 +
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 1a9b91bf8a..ca9a7d9439 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -275,6 +275,21 @@ static uint32_t kvm_arm_sve_get_vls(int fd)
>>      return vls[0] & MAKE_64BIT_MASK(0, ARM_MAX_VQ);
>>  }
>>
>> +static int kvm_feature_idx_to_idregs_idx(int kidx)
>> +{
>> +    int op1, crm, op2;
>> +    ARMSysRegs sysreg;
>> +
>> +    op1 = kidx / 64;
>> +    if (op1 == 2) {
>> +        op1 = 3;
>> +    }
>> +    crm = (kidx % 64) / 8;
>> +    op2 = kidx % 8;
>> +    sysreg = ENCODE_ID_REG(3, op1, 0, crm, op2);
>> +    return get_sysreg_idx(sysreg);
>> +}
>> +
>>  static int idregs_idx_to_kvm_feature_idx(ARMIDRegisterIdx idx)
>>  {
>>      ARMSysRegs sysreg = id_register_sysreg[idx];
>> @@ -1197,6 +1212,39 @@ bool kvm_arm_cpu_post_load(ARMCPU *cpu)
>>      return true;
>>  }
>>
>> +static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
>> +{
>> +    if (!cpu->writable_map) {
>> +        return;
>> +    }
>> +    for (int i = 0; i < NR_ID_REG_MASKS; i++) {
>> +        uint64_t writable_mask = cpu->writable_map->regs[i];
>> +        uint64_t *cpreg;
>> +
>> +        if (writable_mask) {
>> +            uint64_t previous, new;
>> +            int idx = kvm_feature_idx_to_idregs_idx(i);
>> +            ARM64SysReg *sysregdesc;
>> +            uint32_t sysreg;
>> +
>> +            if (idx == -1) {
>> +                /* sysreg writable, but we don't know it */
>> +                continue;
>> +            }
>> +            sysregdesc = &arm64_id_regs[idx];
>> +            sysreg = sysregdesc->sysreg;
>> +            cpreg = kvm_arm_get_cpreg_ptr(cpu,
>> idregs_sysreg_to_kvm_reg(sysreg));
>> +            previous = *cpreg;
>> +            new = cpu->isar.idregs[idx];
>> +            if (previous != new) {
>> +                *cpreg = new;
>> +                trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
>> +                                                            previous, new);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>  void kvm_arm_reset_vcpu(ARMCPU *cpu)
>>  {
>>      int ret;
>> @@ -2148,7 +2196,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      }
>>      cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>
>> -    return kvm_arm_init_cpreg_list(cpu);
>> +    ret = kvm_arm_init_cpreg_list(cpu);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +    /* overwrite writable ID regs with their updated property values */
>> +    kvm_arm_writable_idregs_to_cpreg_list(cpu);
>> +
>> +    write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE);
> KVM may hide registers based on ID register fields when features
> are disabled. Updating writable ID registers after KVM_GET_REG_LIST
> can result in a mismatched register list and failures when setting
> registers.
>
> This was reported on v3:
> https://lore.kernel.org/qemu-devel/ae3f4d26-7a1a-418c-b303-2ed1d9ced4ba@huawei.com/

Effectively I failed to address Jinqian's comment. This should be fixed
in next respin

Thanks to both of you!

Eric
>
> Is this fixed someway in this series? I am not sure. I have faced the
> same issue on NV platforms as well.
>
> Thanks,
> Shameer
>


