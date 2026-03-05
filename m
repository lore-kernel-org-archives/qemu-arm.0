Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474D8F3D338
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:12:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyCFf-0006Uv-1X; Thu, 05 Mar 2026 12:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCFL-0006JH-6X
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:12:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCFJ-00057v-E3
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:12:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48378136adcso50205995e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730739; x=1773335539; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yh0cwudrIwPmvaWJ2oJ7YlHyhKk2UdElu9Gw84AKPQk=;
 b=Id0JPj/xkhGujgHtgfTAT5f7FHZkb65iqDv8tHUkif/fgCZHgmrTmPeUfRDKw1JWtU
 tdfZMUI34GrazG7kKkMW5Us6qh0dG5aOzPokq1hgT7E9XhnSQuotqj+tGztfDlGdU6/Z
 6pDH7ZePLkL+oT2qyrdD9E1WopB9atxAigHqqw8u7oGoECibQPpnPJq0l32ODXH9n4CJ
 T/2R3yVcnYyUiYfflfsjJupU5VOhFCbDa99DawrYyqCHLX2fnDAjXBOZgwyOV3m5IPav
 kI8B2ReDwO/fl7gGJXIX0WpESd2hCyvXABo2LA+spw3SAqYpjh8D3fUPMO/eM1YY1a6t
 hebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730739; x=1773335539;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yh0cwudrIwPmvaWJ2oJ7YlHyhKk2UdElu9Gw84AKPQk=;
 b=Uf9P4ik55D+nvoQewOnamuuLUs/DW4UM9vsRiL6zQDKJj//zXEUFkbZS9Yc4TFArX0
 eGPvUFOJwtS1PT2rHrcaUHMpdRiCYvT3Mp87kkPnV90RM11Jdy8dyefr+12dO4ZKr8MJ
 fs8nC++Xi1ZJNYf1xlhhb5SOcZ8B0KB2bCJYsA//13YnW4gEo6CENfZGEL2yWG71iH4c
 GJDgWH3UGNcSG+4MPNuS6bdnvKcJ56HtZXFsxEwKby9h0VgF6SbUhHjCGIObOHhvZoC+
 ZHNTP/Dw3eMMvSoCgkghMcBODXvvzgHXcNhCSfAZo/Yin+B3f/F7zbWKYmvlSuBiBKk7
 0zKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNNkJMCrzVijjbvVkUrLzVndi3yyri7lAvxbgTMDuqsgA/z5Zk8WsU7BHI/E/l+mDARB+5TkAtCw==@nongnu.org
X-Gm-Message-State: AOJu0Yw3g+E1eMAAVqvZT95qxpzwMrhxD5MoyTbHhOlw6ImZBRbXtE4J
 8YnlyoxDFIYECxV6vad/aodtDfd2T8bzlf0pRQui1VfCBQpt0ZXNkf/BT4d11plfTtM=
X-Gm-Gg: ATEYQzy8z6i/4dPjD+mmFuWZ7i/HkNSl5LTGeTGn9+oEeJ9vbiPLs+4S9h2XqBCkEXg
 7+qn1egcGevsLcYUU61BgYX38/pg6DnTDqnUtNfyk4Ms/AeFvUb2wp7ylK1RuqIA5Bg8PvG3Hwb
 2/mo2DF26qi3BCOh4xjUtMsQdjbJfXn6sMtPG8z4N989SpF+wE2Uk/mMMUuw1huzc994EzeB1B/
 8yG2t6aVQvb6YJkDmvq4dM8O7W8s3Kya7GT1jZD2+Eb9ZdJIxndkZn8bzQZMU6b2ehZajgvY+gL
 TaCwp1/gWHo4kSWJlbSMv/ulqqDfzNedNGkfpcH+6phck/2hq/uY5RIkrSZeSQANM0zlm+aE6IZ
 Vsq3r+44mYhNkpyTBtQ18Uc/m4i1ci2vJt+C3YHySaqnvvE1iAM1GzCxNE8Pd6aKOlVbQFAL2Nx
 mHJzCy7gGExE7e14RM54Q8vGZ60OxvkqxVTvpJ7UgdnwIIdmaOwx7aS3m7uvrqfjB9xg==
X-Received: by 2002:a05:600c:6291:b0:47e:e20e:bbb0 with SMTP id
 5b1f17b1804b1-48519837bbdmr96375175e9.6.1772730738513; 
 Thu, 05 Mar 2026 09:12:18 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b1b97927sm38007618f8f.28.2026.03.05.09.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:12:18 -0800 (PST)
Message-ID: <1c974eed-8291-4000-bf8d-cdc991b23f6a@linaro.org>
Date: Thu, 5 Mar 2026 18:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/12] hvf: sync registers used at EL2
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-11-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-11-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> When starting up the VM at EL2, more sysregs are available. Sync the state of those.
> 
> In addition, sync the state of the EL1 physical timer when the vGIC is used, even
> if running at EL1. However, no OS running at EL1 is expected to use those registers.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c        | 37 ++++++++++++++++++++++++++----
>   target/arm/hvf/sysreg.c.inc | 45 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 4 deletions(-)


> +#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  {HVF_ID},
> +#define DEF_SYSREG_EL2(HVF_ID, op0, op1, crn, crm, op2)  {HVF_ID, .el2 = true},
> +#define DEF_SYSREG_VGIC(HVF_ID, op0, op1, crn, crm, op2)  {HVF_ID, .vgic = true},
> +#define DEF_SYSREG_VGIC_EL2(HVF_ID, op0, op1, crn, crm, op2)  {HVF_ID, true, true},
> +
> +struct hvf_sreg {
> +    hv_sys_reg_t sreg;
> +    bool vgic;
> +    bool el2;
> +};
>   
> -#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  HVF_ID,
> -
> -static const hv_sys_reg_t hvf_sreg_list[] = {
> +static struct hvf_sreg hvf_sreg_list[] = {
>   #include "sysreg.c.inc"
>   };
>   
> @@ -1052,11 +1073,19 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>   
>       /* Populate cp list for all known sysregs */
>       for (i = 0; i < sregs_match_len; i++) {
> -        hv_sys_reg_t hvf_id = hvf_sreg_list[i];
> +        hv_sys_reg_t hvf_id = hvf_sreg_list[i].sreg;
>           uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
>           uint32_t key = kvm_to_cpreg_id(kvm_id);
>           const ARMCPRegInfo *ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>   
> +        if (hvf_sreg_list[i].vgic && !hvf_irqchip_in_kernel()) {
> +            continue;
> +        }
> +
> +        if (hvf_sreg_list[i].el2 && !hvf_nested_virt_enabled()) {
> +            continue;
> +        }
Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


