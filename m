Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp258670ejb;
        Thu, 30 Nov 2023 06:17:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjbdwFDGFpguDlg+slCs3k1ZgRyyfXuMuYyU7fXFYbyE8n7WqFMd6BX6hR6VFRY+HMVlhZ
X-Received: by 2002:a1f:c582:0:b0:4ab:da7a:c573 with SMTP id v124-20020a1fc582000000b004abda7ac573mr16585714vkf.8.1701353872437;
        Thu, 30 Nov 2023 06:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701353872; cv=none;
        d=google.com; s=arc-20160816;
        b=MiGCzSP6VcewlvyqTfRKv0ZudtezfDq8D5gyzoeOa3/hAFpoxdqebLNuy/H+PWpsoY
         2sS07gDNIWfeYvqc6EiYQX2oIgXJcpm7tkDfZNwYXT/fYisbQOTVXU5lv50NY6H+UjnL
         9jNjbm37joG9vXckgN/yvFKBhGcQ/1zfzy0dvEdJyWRJpZuXytxUfzi8jLfmLGrEjyGQ
         RaalVWpvB7mC2sfo37y9zH9+1n6hH1aXTrgwP9kpb/62UzUJOzyzXXEwKEI2LACiX92e
         kWljCzga6jfAN5gaB/AhTydmsEMvKJkPuqPpRmiAIkfAMt4QLWjBrtaMNQ+a5ab2Uq2s
         gm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iE0L2PBpD7A8D7EdmmkrkVJlqT3HME9PzZ68CZ71OeY=;
        fh=J8KwvaKtpwczpnD84kmf0av2Mbyb1RVhd3GkiZrBUw0=;
        b=EJ52ZSQGbnkhb4d/0LA8LNJzuCqJaaQO5PJRNJjdOwhWYAueAvdtU62Z/iAB4csJKk
         gh7XeSKaBZV0u1fG+xRHovcXcftouuYDTEBN0+RDAZnIwE0pPS8vgsCZ5qJ4fS1QHoGW
         jV0KvTUN55rGRhR1PegPGrcEo/dsF/GVAdf59dL5ML4Ri/buQXkHDXtPoRNaXIHTXCH0
         VUXhHWsxwlCxBKplGVLJMlvITILNnYdkkvnh89NowVLAetwCRtI/DatjkrlbzFY7Sj+L
         NuhdfggaWdO6CMK2C87+W7PO3m22nHbdNCMjddEnbGHZWd/++k+jwQxrUpwEEKJWfgQb
         8SKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxY94e1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a056122068200b004b292ad9b8esi157374vkq.283.2023.11.30.06.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxY94e1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hrH-00013Q-Of; Thu, 30 Nov 2023 09:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hrF-00013A-R4
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:17:37 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hrD-0006nv-Lr
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:17:37 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bc4fe8158so1490954e87.0
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 06:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701353854; x=1701958654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iE0L2PBpD7A8D7EdmmkrkVJlqT3HME9PzZ68CZ71OeY=;
 b=QxY94e1e+ZDdV4P09xi8MYhYdMR4oMlkZYwcM47hklItV39zg6BoeA+4pbDnoiA/9m
 Ijiw9wKlGOcDpFuSN0EJqFNshQpm73/979vTvnVquhLHVLK63QTRofLS8119vyclbIzW
 obB5rLd8qqGrHLole6Y/HxppfY5K4yTSH/w17YQyJ6GGXtR9KzX13YkSmBHtoTGajSGA
 f43oEecisHbSRNQ3sDUwSBH3jYSwjBKVvsJRsYQYkUyMNmB+7u7JatFcMjne18C+cgce
 kpY9feosSdO3gy5seD+6qBHGpR41pUt4/3eMb/tT1WKX1x9kSsZRoRluudTNqS5fWJNC
 Yv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353854; x=1701958654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iE0L2PBpD7A8D7EdmmkrkVJlqT3HME9PzZ68CZ71OeY=;
 b=WmaQmv3vUxbWHeG7WSn7p3u13c+u+jO89meF0VhcXfQLXtr64UyvY9Q+JDP5oSrkKO
 BWkne0+4cF+/9DjEB8iT0oDKrK6g5dglX1q7+9L/vy0bY7uDIbK0/oAtl5NjHnP2//72
 0jim5s2OJm9zgOuz2+mB80zzu1idRdB5W7vIJwHIUqCq08m1tvbO5SWGBCOhDMG64Tg1
 kGMd9c84yGq1mtNM0MPwc9wHI1EXnvoIVm8t8+EVEpBbMCVJw4gleCtlaBmZUzoIaxca
 iVZ9KZJg4oQHNusLctadwHL3LDTQtVTaz7TTldOdsqYKlh688fCIKy5Ybxub4HQO7DhA
 jqzg==
X-Gm-Message-State: AOJu0YxnlMV1m3oQBLmuBRrkS5ycaSQF/w6+g8zvT+pyHkWQyivhVbtx
 rs+ap3/f4Lj99H2ts/jLY2mA9Q==
X-Received: by 2002:a05:6512:3087:b0:50b:c9e7:2941 with SMTP id
 z7-20020a056512308700b0050bc9e72941mr2397950lfd.29.1701353853684; 
 Thu, 30 Nov 2023 06:17:33 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 l21-20020a170906231500b00a0b6541b592sm722657eja.88.2023.11.30.06.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 06:17:33 -0800 (PST)
Message-ID: <0ae7ffb0-a0af-4afc-ad29-384daff52484@linaro.org>
Date: Thu, 30 Nov 2023 15:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20210916155404.86958-5-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UmiNMNDEPBC9

Hi,

On 16/9/21 17:53, Alexander Graf wrote:
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
> 
> This patch adds all necessary architecture specific code to get basic VMs
> working, including save/restore.
> 
> Known limitations:
> 
>    - WFI handling is missing (follows in later patch)
>    - No watchpoint/breakpoint support
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


> ---
>   MAINTAINERS                 |   5 +
>   accel/hvf/hvf-accel-ops.c   |   9 +
>   include/sysemu/hvf_int.h    |  10 +-
>   meson.build                 |   1 +
>   target/arm/hvf/hvf.c        | 794 ++++++++++++++++++++++++++++++++++++
>   target/arm/hvf/trace-events |  10 +
>   target/i386/hvf/hvf.c       |   5 +
>   7 files changed, 833 insertions(+), 1 deletion(-)
>   create mode 100644 target/arm/hvf/hvf.c
>   create mode 100644 target/arm/hvf/trace-events


> +int hvf_arch_init_vcpu(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
> +    uint32_t sregs_cnt = 0;
> +    uint64_t pfr;
> +    hv_return_t ret;
> +    int i;
> +
> +    env->aarch64 = 1;
> +    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
> +
> +    /* Allocate enough space for our sysreg sync */
> +    arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
> +                                     sregs_match_len);
> +    arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
> +                                    sregs_match_len);
> +    arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
> +                                             arm_cpu->cpreg_vmstate_indexes,
> +                                             sregs_match_len);
> +    arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
> +                                            arm_cpu->cpreg_vmstate_values,
> +                                            sregs_match_len);
> +
> +    memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_t));
> +
> +    /* Populate cp list for all known sysregs */
> +    for (i = 0; i < sregs_match_len; i++) {
> +        const ARMCPRegInfo *ri;
> +        uint32_t key = hvf_sreg_match[i].key;
> +
> +        ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> +        if (ri) {
> +            assert(!(ri->type & ARM_CP_NO_RAW));
> +            hvf_sreg_match[i].cp_idx = sregs_cnt;
> +            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);

So this hash ...:

     /*
      * Convert a truncated 32 bit hashtable key into the full
      * 64 bit KVM register ID.
      */
     static uint64_t cpreg_to_kvm_id(uint32_t cpregid)
     {
         uint64_t kvmid;

         if (cpregid & CP_REG_AA64_MASK) {
             kvmid = cpregid & ~CP_REG_AA64_MASK;
             kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
         } else {
             kvmid = cpregid & ~(1 << 15);
             if (cpregid & (1 << 15)) {
                 kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
             } else {
                 kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
             }
         }
         return kvmid;
     }

... just happens to work the same way for HVF?

> +        } else {
> +            hvf_sreg_match[i].cp_idx = -1;
> +        }
> +    }
> +    arm_cpu->cpreg_array_len = sregs_cnt;
> +    arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
> +
> +    assert(write_cpustate_to_list(arm_cpu, false));
> +
> +    /* Set CP_NO_RAW system registers on init */
> +    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MIDR_EL1,
> +                              arm_cpu->midr);
> +    assert_hvf_ok(ret);
> +
> +    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MPIDR_EL1,
> +                              arm_cpu->mp_affinity);
> +    assert_hvf_ok(ret);
> +
> +    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
> +    assert_hvf_ok(ret);
> +    pfr |= env->gicv3state ? (1 << 24) : 0;
> +    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
> +    assert_hvf_ok(ret);
> +
> +    /* We're limited to underlying hardware caps, override internal versions */
> +    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
> +                              &arm_cpu->isar.id_aa64mmfr0);
> +    assert_hvf_ok(ret);
> +
> +    return 0;
> +}

