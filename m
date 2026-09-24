Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A0FC98311
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 09:42:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9fxq-0008GQ-73; Thu, 24 Sep 2026 05:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9fxo-0008Fu-Qt
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 05:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9fxk-00043M-Tt
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 05:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790242915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUnFtIzaTf/W1+7mk3QNRlcTqxPDEzgQeLhztARvzBE=;
 b=fhFmNJVFJH82wQSoTGqcwt1wAL7F9ubnifSrBElCKmP07X055xzF5e+5QL+cIpBNOt3h3h
 NKSobyYy9hCusYAL92gkSWZvbz3Bf7wcyzCwIiFqRTbxeiNVEmMAZNhiCto+oRhUTiAJZU
 tB05d1JfZnc4xAx4siL3rvjEiMoAOb8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-yoiuoOv4Om2iNZE3H3HpZw-1; Thu, 24 Sep 2026 05:41:52 -0400
X-MC-Unique: yoiuoOv4Om2iNZE3H3HpZw-1
X-Mimecast-MFC-AGG-ID: yoiuoOv4Om2iNZE3H3HpZw_1790242911
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49e745d5dabso18503825e9.0
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 02:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790242911; x=1790847711;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tUnFtIzaTf/W1+7mk3QNRlcTqxPDEzgQeLhztARvzBE=;
 b=1P97NiI7USx6ScB7uizfUs3AKq1QzxDoHpyc57gHfFlrRleOkVFBVNcpjlmBAMg7ev
 twzLYGCg9IDuUd/nlKk5Xh5e4vU99EES717cW+EZcW04QBe+A0Otg9nHHRx4brdKSXle
 atJX3zXjtT5mMQ/AtcjU4oRZpyoxyO820Zyf8xX2elhr5IavpKUk3l20gXmW/6/oQJyg
 ntKNDIEe4WLzspueZxBas0fwhnXrixmZ8zP/ORBp00snpEOi2H23MQ9yzpCLdB2e4lM/
 uAShxdi96S/ivCeY2H58J36q3/uFGMUrjYb/YMnjTTIlI75CxOhc1mqaX3TZOYN7nZfS
 7crA==
X-Forwarded-Encrypted: i=1;
 AKwUvByXGTVdH+8HdBZ2qllEMrD3dvVUQmzdFz491QiqGYaNwoFzSl859mAyuRjGQ5oR/+wkO68qapEhIA==@nongnu.org
X-Gm-Message-State: AFuF++mRrGLgc7DIYQ7ux9s7fzeGXA6MWA2jMFSPyqppGsH5CM8GRHCO
 /9J9kbQXINkJoD8bhaLQPM5azj9BwneNh1RkMIpn2YDUksKMpAJj76MSOP2ZxM3j/+GQU5H8f8p
 YdAV0njFjifl+V7xCBuB6mLYurf8paHv5v3vHF5LPAB4lgb7v1kgo+g==
X-Gm-Gg: AYBFou0Qt8t7A2ztTNRzd9OXHQK2QaRBSw4P+TOgacPaJjSc0Gqr1W6VCNteqyQ8R27
 zk34oDZMhR2of4lNwDnCyAv3vMoyPOGQnIAxEr/dOyrXDf75aaBrBnB8YD6b4QU84Hvii/G7zjA
 8xifppFPQ6lK642D18um+ha+4xI4Y7NMbi3qfDyzS2ihS88U5tgCkS9p4WvzOpU66N1EbA1hLz0
 IJcT+MKlykAvlKY/5Ek88u3EPX7CY24MAc2h4H0BU+sorreJv8NpMcz+uzXy2r0rRGruwiDEpaI
 UNRU+KrKdleEiGgFH+Or2KYPwO4jtIis+tfFzZ9MMQi75i2B347/FSmeSG8/cHMs1CDkONPcDfK
 xZvGGaym/9Nhlvm5jVycX6OT2MoNWDyZdUp+rv22uqYZm8LkF
X-Received: by 2002:a05:600c:354a:b0:49f:bd3c:bc1d with SMTP id
 5b1f17b1804b1-49fe66fd425mr28305595e9.24.1790242911508; 
 Thu, 24 Sep 2026 02:41:51 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:49f:bd3c:bc1d with SMTP id
 5b1f17b1804b1-49fe66fd425mr28305175e9.24.1790242911011; 
 Thu, 24 Sep 2026 02:41:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877970fsm13591184f8f.24.2026.09.24.02.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 02:41:50 -0700 (PDT)
Message-ID: <53e272e9-8612-4a65-a460-6c0d8e1057fb@redhat.com>
Date: Thu, 24 Sep 2026 11:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 07/25] target/arm/kvm: process ID register
 writeback per field
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-8-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-8-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rSRxiKkTcrIKbVnHeWjJ0HVhQH2hBMM7mQyOYQjviI4_1790242911
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



On 9/21/26 2:32 PM, Khushit Shah wrote:
> Now that all ID register fields are exposed as properties, refactor
> kvm_arm_writable_idregs_to_cpreg_list() as
> kvm_arm_write_idregs_to_cpreg_list() and process each field
> individually. kvm_arm_writable_idregs_to_cpreg_list() assumed that
this does not exist anymore in v9. this later implementation should ease
the handling

Eric
> only writable fields were exposed as SYSREG_ properties.
>
> Copy only fields advertised as writable by KVM instead of replacing the
> whole register. For registers absent from the KVM cpreg list, compare
> the requested value against the host value captured during probing.
>
> Return an error when a non-writable field differs from the host value,
> failing vCPU init.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/cpu-idregs.c | 13 +++++++
>  target/arm/cpu-idregs.h |  2 ++
>  target/arm/kvm.c        | 79 +++++++++++++++++++++++++++++++++--------
>  target/arm/trace-events |  2 +-
>  4 files changed, 80 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/cpu-idregs.c b/target/arm/cpu-idregs.c
> index 199d593153..d58b8ed063 100644
> --- a/target/arm/cpu-idregs.c
> +++ b/target/arm/cpu-idregs.c
> @@ -7,6 +7,7 @@
>   *  SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> @@ -94,3 +95,15 @@ ARM64SysReg arm64_id_regs[NUM_ID_IDX] = {
>  #include "cpu-idregs.h.inc"
>  };
>  
> +uint64_t arm_get_field_mask(const ARM64SysRegField *field)
> +{
> +    return MAKE_64BIT_MASK(field->shift, field->length);
> +}
> +
> +bool arm_field_is_writable(const ARM64SysRegField *field)
> +{
> +    uint64_t field_mask = arm_get_field_mask(field);
> +
> +    return (arm64_id_regs[field->index].writable_mask & field_mask)
> +           == field_mask;
> +}
> diff --git a/target/arm/cpu-idregs.h b/target/arm/cpu-idregs.h
> index 98c7a7518f..aab1a79db1 100644
> --- a/target/arm/cpu-idregs.h
> +++ b/target/arm/cpu-idregs.h
> @@ -33,4 +33,6 @@ typedef struct ARM64SysReg {
>   */
>  extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
>  
> +uint64_t arm_get_field_mask(const ARM64SysRegField *field);
> +bool arm_field_is_writable(const ARM64SysRegField *field);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 07df6626d4..2d94b3a884 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1006,6 +1006,16 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
>      return &cpu->cpreg_values[res - cpu->cpreg_indexes];
>  }
>  
> +/* Like kvm_arm_get_cpreg_ptr, but returns NULL if the register is not found. */
> +static uint64_t *kvm_arm_find_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
> +{
> +    uint64_t *res;
> +    res = bsearch(&regidx, cpu->cpreg_indexes, cpu->cpreg_array_len,
> +                  sizeof(uint64_t), compare_u64);
> +
> +    return res ? &cpu->cpreg_values[res - cpu->cpreg_indexes] : NULL;
> +}
> +
>  /**
>   * kvm_arm_reg_syncs_via_cpreg_list:
>   * @regidx: KVM register index
> @@ -1308,31 +1318,67 @@ bool kvm_arm_cpu_post_load(ARMCPU *cpu)
>  }
>  
>  /*
> - * Copy writable ID regs from isar.idregs[] to cpreg_list
> - * in case their value differs from the original init cpreg value
> + * Copy writable ID reg fields from isar.idregs[] into the KVM cpreg list,
> + * so the subsequent write_list_to_kvmstate() pushes them to KVM.
> + * Only writable fields are copied.
> + * Returns -1 if any vCPU's ID reg value differs from the host value and the
> + * field is not writable.
>   */
> -static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
> +static int kvm_arm_write_idregs_to_cpreg_list(ARMCPU *cpu)
>  {
>      for (int i = 0; i < NUM_ID_IDX; i++) {
>          ARM64SysReg *sysregdesc = &arm64_id_regs[i];
>          ARMSysRegs sysreg = id_register_sysreg[i];
> -        uint64_t previous, new;
> +        uint64_t writable_mask = sysregdesc->writable_mask;
> +        uint64_t desired = cpu->isar.idregs[i];
> +        uint64_t previous, updated;
>          uint64_t *cpreg;
>  
> -        if (!sysregdesc->writable_mask) {
> +        cpreg = kvm_arm_find_cpreg_ptr(cpu, idregs_sysreg_to_kvm_reg(sysreg));
> +        /*
> +         * Registers such as DCZID_EL0 are not exposed through the cpreg
> +         * list and are therefore not writable. Use the host value
> +         * snapshotted at probe time as the reference to check the vCPU ID
> +         * regs have the same value.
> +         */
> +        previous = cpreg ? *cpreg : arm_host_cpu_features.isar.idregs[i];
> +
> +        if (previous == desired) {
>              continue;
>          }
>  
> -        cpreg = kvm_arm_get_cpreg_ptr(cpu, idregs_sysreg_to_kvm_reg(sysreg));
> -        previous = *cpreg;
> -        new = cpu->isar.idregs[i];
> +        for (int j = 0; j < sysregdesc->fields_count; j++) {
> +            const ARM64SysRegField *field = &sysregdesc->fields[j];
> +            uint64_t field_mask = arm_get_field_mask(field);
> +            uint64_t prev_val = previous & field_mask;
> +            uint64_t new_val = desired & field_mask;
> +
> +            if (prev_val == new_val) {
> +                continue;
> +            }
> +
> +            if (!arm_field_is_writable(field)) {
> +                error_report("%s.%s is not writable: host=0x%" PRIx64
> +                             ", requested=0x%" PRIx64,
> +                             sysregdesc->name, field->name,
> +                             prev_val >> field->shift, new_val >> field->shift);
> +                return -1;
> +            }
> +        }
> +
> +        if (!cpreg || !writable_mask) {
> +            continue;
> +        }
>  
> -        if (previous != new) {
> -            *cpreg = new;
> -            trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
> -                                                        previous, new);
> -         }
> +        updated = (previous & ~writable_mask) | (desired & writable_mask);
> +        if (updated != previous) {
> +            *cpreg = updated;
> +            trace_kvm_arm_write_idregs_to_cpreg_list(sysregdesc->name,
> +                                                        previous, updated);
> +        }
>      }
> +
> +    return 0;
>  }
>  
>  void kvm_arm_reset_vcpu(ARMCPU *cpu)
> @@ -2293,8 +2339,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (ret) {
>          return ret;
>      }
> -    /* overwrite writable ID regs with their updated property values */
> -    kvm_arm_writable_idregs_to_cpreg_list(cpu);
> +    /* overwrite ID reg fields with their updated property values */
> +    ret = kvm_arm_write_idregs_to_cpreg_list(cpu);
> +    if (ret) {
> +        return ret;
> +    }
>      ret = write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE);
>      if (!ret) {
>          return -1;
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 2bb7766f7f..7b54e34ad9 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -15,7 +15,7 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>  get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
>  get_host_cpu_idreg_not_found(const char *name) "host %s register not readable from KVM"
> -kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
> +kvm_arm_write_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
>  kvm_idreg_write_scratch_vcpu(const char *name, uint64_t oldfv, uint64_t newfv, uint64_t actualfv) "successful dry-run for %s old=0x%"PRIx64" new=0x%"PRIx64" actual=0x%"PRIx64
>  
>  # cpu64.c


