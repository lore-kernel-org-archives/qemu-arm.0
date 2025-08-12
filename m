Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A07CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulrj9-0001KU-P4; Tue, 12 Aug 2025 12:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulrj8-0001Jy-8H
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 12:19:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulrj0-000219-TW
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 12:19:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so3207896f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755015580; x=1755620380; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XduhtC4mf3UpdROZVTGZ92qN7S93b3AqUP+vrowiOug=;
 b=r8SRitvDUfJsMw5w+a0XtQrZoDB1EVqSRRiqRlSznZNFin1zWNfkYgnFgLCCWavdI6
 FJvpAAYfebeLXRw0nXKfCUfCIvyAfMabDqukN7/mW41dnqVktAOix6BVFQZ9mJjBAmd6
 8J0t0FO+bUushnWITbKhwjsxq/5ZXe3MF+bsSn0VanFXFpm+8n5hZHwT4cdvIUOswixd
 EdE46ujfxHFmwqOc6IbTnAtYYjy+TxOWil7K6Ka6jTc7bmX60sLEEXbHmNJSDlSyOI4y
 fFNVn2rOP51j1WEZ4yLNmB/vplk22kcA+c8uqjKge9J1Jd16/OnEcf0IdQx0rxE9vnqj
 VZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755015580; x=1755620380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XduhtC4mf3UpdROZVTGZ92qN7S93b3AqUP+vrowiOug=;
 b=pvokCSUxajf37WJCEA4nD7z9Qzmc1D8ilL3fYdlJYuX6BEYxJ7AZvxEYtxEF2ONNTV
 o0jmerod1LNKtU6cMOPzh0Slc2GUglg1Iv1XoCztNrb+BDDI70zOlt5ZRXY9PcUN0Odh
 8aZbUKf/yj0itG08iUIsA2b2BAkYU+TaLAi5WJqfj6mZ2HTg6RlJV5XFxBGag5GAUDEy
 2f540eXOkLQVttzIN99G5dhdJ12ZIIvONz3F32RoqctDsrIyxuRuuBI+vSZiiZtjdDb2
 GhsZrHe1SxXVmCEzeK4De4WcNoo01GR/ae8fdqbWCGuBS0/DOD0vg/k846xDb+eoPwwT
 f+HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBLCp9pZNfiTWlbNm+Ty8/BOCF2Yq3luHNfaAzGQxU5BmbjWwo2Qq6fwHvrhS21MmfHupY0iLmsw==@nongnu.org
X-Gm-Message-State: AOJu0Yz7FsIKcRwBvgZ50ayukk0ScOOWKETg6HDG4gfcVWgNdfvto7la
 T3ppBZGLs1yACngqf9Qtq3RTG2f1hgdu4RZC5xPD/LZ7YIIOrVXY+CRCIF0mx5J5yT4=
X-Gm-Gg: ASbGncsiqlCkMiOGEsHw+puMs/ugLN3PtIwXLmIpmnVEb0dT+jViY7xfvYK6+5XVNtr
 Mj76/ylHKk1iSoaNj0AFf8Bz9YWPxUnr+gMyYVSuJ3Pa+wZXuvJ6GxYLMmIG2rH8RAwnpljb5PY
 K/3YGj6k9hTWdRLfhT0GEKfMVHHEMERWdXk3ExGuQDRh13jL7+BAA4d6WJyR8ljPz39jJrWeris
 Hh9a15XI/LN6LEFQt/Uk5AV42Z+2COsbGdauNmRJllMJW7l8ivw/I4fCC5+fq1ddH1D5a67+Cra
 Pvp+Xkg4hS0p76n7MaiU4BVktXyUBzqhTPk0ES5/9nSkoOz/uw4hwox7ymjDS7povRPdC2858iO
 lwSYLURMN1A8J6eRdJpbh3yFEn0gKJJM7cB/pgBWv5dr1qYyio3/p2gN+p9b3aG2MLQ==
X-Google-Smtp-Source: AGHT+IHzvP23vZI4Qax+tpr7HGCRaDC94Gr2q9jcYvyWJDVIgcxUMYMTioJGmMSKP9TwtUYIgru5lg==
X-Received: by 2002:a05:6000:2903:b0:3b7:8a49:eee9 with SMTP id
 ffacd0b85a97d-3b91724be13mr37415f8f.8.1755015580227; 
 Tue, 12 Aug 2025 09:19:40 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c51e2sm43505336f8f.32.2025.08.12.09.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 09:19:39 -0700 (PDT)
Message-ID: <dc02b065-c51c-4b9a-a6e4-74f0719d780d@linaro.org>
Date: Tue, 12 Aug 2025 18:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] hw/intc: Add hvf vGIC interrupt controller
 support
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Igor Mammedov <imammedo@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20250808070137.48716-1-mohamed@unpredictable.fr>
 <20250808070137.48716-5-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250808070137.48716-5-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 8/8/25 09:01, Mohamed Mediouni wrote:
> This opens up the door to nested virtualisation support.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/intc/arm_gicv3_hvf.c | 723 ++++++++++++++++++++++++++++++++++++++++
>   hw/intc/meson.build     |   1 +
>   2 files changed, 724 insertions(+)
>   create mode 100644 hw/intc/arm_gicv3_hvf.c


> +static void hvf_gicv3_put_cpu(CPUState *cpu_state, run_on_cpu_data arg)
> +{
> +    uint32_t reg;
> +    uint64_t reg64;
> +    int i, num_pri_bits;
> +
> +    /* Redistributor state */
> +    GICv3CPUState *c = arg.host_ptr;
> +    hv_vcpu_t vcpu = c->cpu->accel->fd;
> +
> +    reg = c->gicr_waker;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_IGROUPR0, reg);
> +
> +    reg = c->gicr_igroupr0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_IGROUPR0, reg);
> +
> +    reg = ~0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ICENABLER0, reg);
> +    reg = c->gicr_ienabler0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ISENABLER0, reg);
> +
> +    /* Restore config before pending so we treat level/edge correctly */
> +    reg = half_shuffle32(c->edge_trigger >> 16) << 1;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ICFGR1, reg);
> +
> +    reg = ~0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ICPENDR0, reg);
> +    reg = c->gicr_ipendr0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ISPENDR0, reg);
> +
> +    reg = ~0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ICACTIVER0, reg);
> +    reg = c->gicr_iactiver0;
> +    hv_gic_set_redistributor_reg(vcpu, HV_GIC_REDISTRIBUTOR_REG_GICR_ISACTIVER0, reg);
> +
> +    for (i = 0; i < GIC_INTERNAL; i += 4) {
> +        reg = c->gicr_ipriorityr[i] |
> +            (c->gicr_ipriorityr[i + 1] << 8) |
> +            (c->gicr_ipriorityr[i + 2] << 16) |
> +            (c->gicr_ipriorityr[i + 3] << 24);
> +        hv_gic_set_redistributor_reg(vcpu,
> +            HV_GIC_REDISTRIBUTOR_REG_GICR_IPRIORITYR0 + i, reg);
> +    }
> +
> +    /* CPU interface state */
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_SRE_EL1, c->icc_sre_el1);
> +
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_CTLR_EL1,
> +                    c->icc_ctlr_el1[GICV3_NS]);
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_IGRPEN0_EL1,
> +                    c->icc_igrpen[GICV3_G0]);
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_IGRPEN1_EL1,
> +                    c->icc_igrpen[GICV3_G1NS]);
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_PMR_EL1, c->icc_pmr_el1);
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_BPR0_EL1, c->icc_bpr[GICV3_G0]);
> +    hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_BPR1_EL1, c->icc_bpr[GICV3_G1NS]);
> +
> +    num_pri_bits = ((c->icc_ctlr_el1[GICV3_NS] &
> +                    ICC_CTLR_EL1_PRIBITS_MASK) >>
> +                    ICC_CTLR_EL1_PRIBITS_SHIFT) + 1;
> +
> +    switch (num_pri_bits) {
> +    case 7:
> +           reg64 = c->icc_apr[GICV3_G0][3];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP0R0_EL1 + 3, reg64);
> +        reg64 = c->icc_apr[GICV3_G0][2];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP0R0_EL1 + 2, reg64);
> +        /* fall through */
> +    case 6:
> +        reg64 = c->icc_apr[GICV3_G0][1];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP0R0_EL1 + 1, reg64);
> +        /* fall through */
> +    default:
> +        reg64 = c->icc_apr[GICV3_G0][0];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP0R0_EL1, reg64);
> +    }
> +
> +    switch (num_pri_bits) {
> +    case 7:
> +        reg64 = c->icc_apr[GICV3_G1NS][3];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP1R0_EL1 + 3, reg64);
> +        reg64 = c->icc_apr[GICV3_G1NS][2];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP1R0_EL1 + 2, reg64);
> +        /* fall through */
> +    case 6:
> +        reg64 = c->icc_apr[GICV3_G1NS][1];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP1R0_EL1 + 1, reg64);
> +        /* fall through */
> +    default:
> +        reg64 = c->icc_apr[GICV3_G1NS][0];
> +        hv_gic_set_icc_reg(vcpu, HV_GIC_ICC_REG_AP1R0_EL1, reg64);
> +    }
> +
> +    /* Registers beyond this point are with nested virt only */
> +    if (!c->gic->maint_irq) {
> +        return;

FYI Michael reported a bug produced by this similar pattern:
https://lore.kernel.org/qemu-devel/3458e5b7-b53e-4057-baea-03a729452255@tls.msk.ru/

and Peter said on IRC "in a long realize function that's a bit 
bug-prone. I think I would vote for factoring it out so you could write 
if (mch->has_smm_ranges) { set_up_smm_ranges(); }".

Maybe we can extract the rest as hvf_gicv3_put_cpu_nested(),
hvf_gicv3_nested_put_cpu() -- or better name --?

> +    }
> +
> +    hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_VMCR_EL2, c->ich_vmcr_el2);
> +    hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_HCR_EL2, c->ich_hcr_el2);
> +
> +    for (int i = 0; i < GICV3_LR_MAX; i++) {
> +        hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_LR0_EL2, c->ich_lr_el2[i]);
> +    }
> +
> +    num_pri_bits = c->vpribits;
> +
> +    switch (num_pri_bits) {
> +    case 7:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP0R0_EL2 + 3,
> +                         c->ich_apr[GICV3_G0][3]);
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP0R0_EL2 + 2,
> +                         c->ich_apr[GICV3_G0][2]);
> +      /* fall through */
> +    case 6:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP0R0_EL2 + 1,
> +                         c->ich_apr[GICV3_G0][1]);
> +      /* fall through */
> +    default:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP0R0_EL2,
> +                         c->ich_apr[GICV3_G0][0]);
> +    }
> +
> +    switch (num_pri_bits) {
> +    case 7:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP1R0_EL2 + 3,
> +                         c->ich_apr[GICV3_G1NS][3]);
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP1R0_EL2 + 2,
> +                         c->ich_apr[GICV3_G1NS][2]);
> +      /* fall through */
> +    case 6:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP1R0_EL2 + 1,
> +                         c->ich_apr[GICV3_G1NS][1]);
> +      /* fall through */
> +    default:
> +      hv_gic_set_ich_reg(vcpu, HV_GIC_ICH_REG_AP1R0_EL2,
> +                         c->ich_apr[GICV3_G1NS][0]);
> +    }
> +}

