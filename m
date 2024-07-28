Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1266623njb;
        Sun, 28 Jul 2024 02:50:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQENIaOUYb8U7m6eG5U4lRjQGNQ1hquDMTR57uGjZrBWWFHSkqKfsurGJ9wgKXvGPxpg8amrdUgDbZ/dE7uJViJf/CUJO2
X-Google-Smtp-Source: AGHT+IH64pi8TlD+zVEav5C8u2jwOisyC26fFTyH2YnZk75VTQVDhti5UNVTHFh9Ftvw4sp9F5+s
X-Received: by 2002:a05:620a:40c4:b0:79c:ad5:cd7d with SMTP id af79cd13be357-7a1e56a028bmr780630385a.23.1722160222026;
        Sun, 28 Jul 2024 02:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722160222; cv=none;
        d=google.com; s=arc-20160816;
        b=tZmukAiksEsAoQnV4JQ7n4B0a5gB9RxvneYONJji///DM2dAp/o01NKeBuNf9ArhNj
         BNH1IPXmJ/UTWxHNwTs9oF+mhNBenFtwCrgQ62m0UfRtB/9V0xjXQVIACGpznWwwkntV
         IPWzq7KD0kfDS5k+ce2RyVdbe5j+Ybo/LF6ioINzXMkETuJy5o23T5+Ivuym7gKGIeFO
         BRnX0J+d7y8UhOqqh68eec7NHxqDk0x9R1f8WDGPkogjoY0b5qyV3D+DQCWiCxbnq5At
         8evmBRigpxbLvMB5HPeKu7D5rq2Tax1DaeiGf71DhCbkbFu4yWQHTERITFUVtpUkuVjt
         KqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :mime-version:date:dkim-signature:message-id;
        bh=FV66fwS+I4nSvzxDaz1yXL3LUYK8u57ljy/vF/sBvJw=;
        fh=63Y26dMQFkrlJ9D1/44Z33sIgNsOF+5+U1CNyQzssag=;
        b=BkVbmwBMslA1DQIfTnan0p43HUQWRXZxObGlQtkBaEwcs+kFL5huXHU6WwI6Oof3j7
         8OLQPsGEy2Evgh0fjZUKxgHEoEHR8BULkzHQlNj+CQkMkv9Q2BA6BuMB7jhOQhSv8zdl
         QO9GehTgapLMbg2MGiHyKScUJRs+h+obtISOQaxDyWeh2lqYbugQNsBy2omzMlP8+PAM
         1u12k2cK0J2fRo57lRC9G1UF7vd3A4876jqRoNn9KNFxkQQRFzCF4vYDAzsA53xXDqJH
         uPJG+DXvkA0LAsXu3vuV1xdy1+vItuk0oPY1aH6B+qcZelaInd6H8nL77/eNjx46jKbx
         5n2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=I7HKi9St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe853e06esi79615381cf.784.2024.07.28.02.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jul 2024 02:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=I7HKi9St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sY0Xd-0006mt-UL; Sun, 28 Jul 2024 05:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1sY0Xc-0006gw-80
 for qemu-arm@nongnu.org; Sun, 28 Jul 2024 05:50:12 -0400
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1sY0XZ-0005HZ-IK
 for qemu-arm@nongnu.org; Sun, 28 Jul 2024 05:50:11 -0400
Message-ID: <5191e86e-8e1b-4ecd-b4ac-e71a2204f25d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722160205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FV66fwS+I4nSvzxDaz1yXL3LUYK8u57ljy/vF/sBvJw=;
 b=I7HKi9St8l532dteJFwPftoQTmhz6VwaDqkrpXdo5ujnhY8Z63mKj3doEOpcN38w7VP5Pm
 2lWpLy1OxEYjU00eTeoZF7g25jj1AFC2y0plExpHUS/YCpl8Uwt0jeoNTVFVEuibAGeHLA
 Qfm7yCJt19X5AXM3Urpy2MPVNltX5I4=
Date: Sun, 28 Jul 2024 17:49:50 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20210916155404.86958-5-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b0;
 envelope-from=zenghui.yu@linux.dev; helo=out-176.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ex2SnWjsDrbR

Hi Alexander,

On 2021/9/16 23:53, Alexander Graf wrote:

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

It seems that this happens before
arm_gicv3_common_realize()/gicv3_set_gicv3state() so we always get a
*NULL* env->gicv3state.

Noticed by starting a guest with '-machine gic-version=3' but the guest
visible ID_AA64PFR0_EL1.GIC is 0.

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

Thanks,
Zenghui
