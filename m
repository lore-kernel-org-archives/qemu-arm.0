Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3491474qtb;
        Tue, 1 Jul 2025 21:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW5dFfpALdEdWiX63bn7L0dXKfjmxxeT0twpy2NyHl/K3fwJytZlQ1Yri5icPAN6f1VhzeeoJB/ISa2JA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTTYE2Neei11RzS9S84RuPAvH9zb+qB30X1r7MJd3WQiHd/TJQNSwKaAA0/1F2tjsedbzQ
X-Received: by 2002:a05:6871:cd07:b0:28c:8476:dd76 with SMTP id 586e51a60fabf-2f5a8b594c2mr1247799fac.29.1751428920980;
        Tue, 01 Jul 2025 21:02:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1751428920; cv=pass;
        d=google.com; s=arc-20240605;
        b=JUdT9wvekgB/xj51MJEzZLOOWnv1S38U+Ez7xgoSGNDpcRJ5b2a7/Sl+LpMW/QqtqN
         d6+LyLQPQ7tQleFgainHI3D1iyd849v/TkqbYotgiGeoPYEPCNRUgcWFhpTwGarOekuJ
         nB1hSof/vAmTr2XofsSpJGeAjBo2AfpPR8uuzPCkFBrfO3+mD8dOurKmSiPurJXU/jC2
         ey4MOMR5BchQwQNArtXHfzpdwgervTPqnaVDKmBvEVyTa39a6qem7dPUkoIEx2kmKSFx
         8k9KjUOnhmrtQWgA9OUVkksAO5Xamm2hEzfDxhWGnBq5iYdAbBkfPSb+wEnO5G/xkfTs
         gTgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:list-unsubscribe:list-subscribe:list-id
         :precedence:date:message-id;
        bh=MGvQpavFWD5hejJrkl9MZSgyh+Qheg/FEp6nnteCp8w=;
        fh=IXYHF3F2CV+P9EGmwSd7/8sfs8dIR1ySGMkDHaXFKUY=;
        b=eyZzmqoteBZlcIZCsTn5gRIH91khbXAAWVVgpJZMI0kE3Due6kUUYKbM0gRAcP9i52
         8roAnzfVoH3ZMLT5kQCVC2cAOQc3RqBc3V0xl19A8BtvB2XpSFnTBxBYG2TDN4UQq5GB
         pGf91+csDqT9b6JtarNx/OEzgcwSy4Sd+l86nzKPns3P4UfjC48PfwjuaOm7o76+rtya
         EaGDIHy8GtrZUwdKu5VZf0vESO9y/I6OrrZ1Wg+nW+sLNye0g+CU4JfwElrjJtRATsdj
         qd9IAc3t2pAMR5L43HvUAgzy9Qvk35aXjsNxOH61VtD9kSiQhAsRe2FqYgW6mVqso4SI
         KHdw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 586e51a60fabf-2efd5076bbbsi8756816fac.279.2025.07.01.21.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-22930-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F8E3B6F09
	for <alex.bennee@linaro.org>; Wed,  2 Jul 2025 04:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D2F13635E;
	Wed,  2 Jul 2025 04:01:58 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0818D184
	for <kvmarm@lists.linux.dev>; Wed,  2 Jul 2025 04:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428918; cv=none; b=ZZH3GGwoELbaefNx5U5wRnWfX4sbq/YfcAaVmn8/djdZkY2PaUlTjM8meFxcrPy6+tNHlPjhjmRuSuLebsf5M8IMleRuJOQqp9Tz7kS8cirocWnH5bQRFCT+cVNpxiTu3502LGCy8jV0uAWzYPjfT25PmtfGlLtAQQY1fI7IpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428918; c=relaxed/simple;
	bh=CcpPp5pw635DYlx/P7hWy6YsZ4cf/X1zVQAdS4x/iBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EU0roL/ChZDzdHgcIJPS9BghW6Iy6CqD5kr+JivM2jfJU6Vw/J8A6sowjP3Mr2G5cG5oE9wyXVd4axNLLLHZbkznqZqRpn7EGjTu06BTn92FZXWAJaWzXR/9FQ7pkuS+kfjbUt2bXEShFj/mWzMahgZlUryWMY5rQ4MGM+P+dd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bX5k90cbgz1R8Bn;
	Wed,  2 Jul 2025 11:59:13 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 06DE4140278;
	Wed,  2 Jul 2025 12:01:44 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 2 Jul 2025 12:01:42 +0800
Message-ID: <ae3f4d26-7a1a-418c-b303-2ed1d9ced4ba@huawei.com>
Date: Wed, 2 Jul 2025 12:01:41 +0800
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm/kvm: write back modified ID regs to KVM
To: Cornelia Huck <cohuck@redhat.com>, <eric.auger.pro@gmail.com>,
	<eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<kvmarm@lists.linux.dev>, <peter.maydell@linaro.org>,
	<richard.henderson@linaro.org>, <alex.bennee@linaro.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <sebott@redhat.com>,
	<shameerali.kolothum.thodi@huawei.com>, <armbru@redhat.com>,
	<berrange@redhat.com>, <abologna@redhat.com>, <jdenemar@redhat.com>, Zhou
 Wang <wangzhou1@hisilicon.com>, liuyonglong <liuyonglong@huawei.com>
CC: <agraf@csgraf.de>, <shahuang@redhat.com>, <mark.rutland@arm.com>,
	<philmd@linaro.org>, <pbonzini@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-8-cohuck@redhat.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <20250414163849.321857-8-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-TUID: 0VfLTw1tvKHW


On 2025/4/15 0:38, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> We want to give a chance to override the value of host ID regs.
> In a previous patch we made sure all their values could be fetched
> through kvm_get_one_reg() calls before their modification. After
> their potential modification we need to make sure we write back
> the values through kvm_set_one_reg() calls.
>
> Make sure the cpreg_list is modified with updated values and
> transfer those values back to kvm.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c        | 44 ++++++++++++++++++++++++++++++++++++++++-
>   target/arm/trace-events |  1 +
>   2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b07d5f16db50..9e4cca1705c8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1083,6 +1083,39 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
>       }
>   }
>   
> +static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
> +{
> +    if (!cpu->writable_map) {
> +        return;
> +    }
> +    for (int i = 0; i < NR_ID_REGS; i++) {
> +        uint64_t writable_mask = cpu->writable_map->regs[i];
> +        uint64_t *cpreg;
> +
> +        if (writable_mask) {
> +            uint64_t previous, new;
> +            int idx = kvm_idx_to_idregs_idx(i);
> +            ARM64SysReg *sysregdesc;
> +            uint32_t sysreg;
> +
> +            if (idx == -1) {
> +                /* sysreg writable, but we don't know it */
> +                continue;
> +            }
> +            sysregdesc = &arm64_id_regs[idx];
> +            sysreg = sysregdesc->sysreg;
> +            cpreg = kvm_arm_get_cpreg_ptr(cpu, idregs_sysreg_to_kvm_reg(sysreg));
> +            previous = *cpreg;
> +            new = cpu->isar.idregs[idx];
> +            if (previous != new) {
> +                *cpreg = new;
> +                trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
> +                                                            previous, new);
> +            }
> +        }
> +    }
> +}
> +
>   void kvm_arm_reset_vcpu(ARMCPU *cpu)
>   {
>       int ret;
> @@ -2050,7 +2083,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>       }
>       cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>   
> -    return kvm_arm_init_cpreg_list(cpu);
> +    ret = kvm_arm_init_cpreg_list(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +    /* overwrite writable ID regs with their updated property values */
> +    kvm_arm_writable_idregs_to_cpreg_list(cpu);
> +
> +    write_list_to_kvmstate(cpu, 3);
> +
> +    return 0;
>   }

Hi,

When I was testing this series, I found a problem. On the host, 
SYSREG_ID_AA64MMFR3_EL1_TCRX=0x1,
I configured it to 0x0 in qemu, and qemu cannot start.
The ID_AA64MMFR3_EL1 TCRX field controls whether the TCR2_EL1 and 
TCR2_EL2 registers are used.
In the kernel, when TCRX is 0, TCR2_EL1 is invisible to the guest, and 
when it is 1, it is visible. When we
configure this field segment to 0, the configuration is not yet written 
to KVM, but the cpreg list is initialized,
adding TCR2_EL1 to the cpreg list. Therefore, after writing the 
QEMU-configured registers to KVM, the
cpreg list needs to be updated again.

@@ -2227,7 +2229,7 @@ int kvm_arch_init_vcpu(CPUState *cs)

      write_list_to_kvmstate(cpu, 3);

-    return 0;
+    return kvm_arm_init_cpreg_list(cpu);
  }

The above modification can solve the problem, but it may not be the best 
way.

Thanks,
Jinqian


>   
>   int kvm_arch_destroy_vcpu(CPUState *cs)
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 17e52c0705f2..955149ee1ac4 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -14,3 +14,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>   # kvm.c
>   kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>   get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
> +kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
