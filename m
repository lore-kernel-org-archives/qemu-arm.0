Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA80CC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed,  6 Aug 2025 11:10:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujc2I-00060n-IN; Wed, 06 Aug 2025 07:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujc2H-0005zj-AM
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 07:10:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujc2E-0004rv-V2
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 07:10:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so4574930f8f.3
 for <qemu-arm@nongnu.org>; Wed, 06 Aug 2025 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754478617; x=1755083417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FaUV9WtCruzm1PZMeMIoKA/+XprDd/r1ebYWtGj0Bmw=;
 b=AY+tuTP4HaQyub1/C4p1yC86Uo7ku4sdC0+kOux9549ghh720WoEeOOfCT41Q7BxEO
 IbFrfa7MCvEIoIaeFhc3F4Y/AWKwlpPC3XNtGIE7xtcX//PWUaz9Rj0Tj9WBsDe5ohJp
 0n8H7QkfEnxyn21inb91DZ5sbz124KdMPB1AtlYGw2bcH6Tx42K3CJVZJ+t9FqxehRi1
 78qTSj5Ji0XhGxn5wlMwrDzoGXX747DgcPQQ9njfa37AEbZxOemKlijKXFDDC8vmAxgV
 TIRyxCJDD9qgIXkRCmwLPTdeGr81dsdiwzXOp+KAwtwctECau7pBEge/ZM/6n/LjY/xT
 DU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754478617; x=1755083417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FaUV9WtCruzm1PZMeMIoKA/+XprDd/r1ebYWtGj0Bmw=;
 b=SrgTcUNvVjzGTBVKJ2n8EsVw0Kmr+KTsVKvOswl8ej+oZM9NnOg6lfV2160b00EZ/X
 vtn1rpZ6LH4JZr7z6hrFrlZ5jONrS+p9ue0PxG2v+RmVZP3gHwVAVcAglZc6Iw4W1oYp
 HtxeEt3u9gsZzDF/YP8ecVfqm/tilnpHf4M0JSDt+ezBgwqKV6M0bLOiJ13VkFe14QqL
 Zsc2YwQPFrOCac7/Idj54woBAhCgyfYLS3cuS7c4mTThkcENMRF6Vu5RHJkatZj64MVy
 Lq6bofja5HBxtcZvACPlhp0QzGUZQHWvkjGVSWPegMOqdt0OYsmjzVneccpj71aQEYTK
 A7Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkqDe6W0kbgyl4eFh2fuyh4SuaGYIEZgGtGZwhfrOaVEYO9eIHYoCD5qQaOISAEwa6rpBWhaeEdw==@nongnu.org
X-Gm-Message-State: AOJu0YxjmVtMDDX/WVzAHN2PXQZUwhE2sSl8DBIHm20T+NxJIFX6LA1f
 khk/QIONNR2/beCJ8AkFDyDzZ0qwUSB8a+LDURzvb0RIUGaoPWwMxpkte022LxuHoPA=
X-Gm-Gg: ASbGnctYwO6AFyicZLsHHrvf3P4Yc2x7Iu46kF0cp3ffL7ykVGo+IrmLPlpBmUuh+/h
 yuvQZB2tcXpgszgdLpUTy41zbTG2SE+q01uS2Ihhj73wWYQZSWds7OQhfqNbnTZ57fg+F/wXHkh
 hGsbWnT/pk4LjdYofipuTY2RDOWVAoprJ1twqj//7xotnN5rus83WENgBCgRTVM564k53PDGG02
 5FAGnUiJ+FRhsPQA7AyPJbGHB/jMsRxeh6VnttdAu11B5Dz58nEOgPTgMtBuXm1cHFlf3fm1WfM
 DoeyFReZf9bDokRxjvlp6pYMGcdHg4GaWyxknHcHbqIVhdFmgFwAcuMs72rNMFsyz9CrvwOjNWh
 r5Kn69XxzHej8dMSNDUa5yo8xe6j45vTLvklffNLf0608hbDzrs3cThM7jdtWUScNZg==
X-Google-Smtp-Source: AGHT+IFHzWF0sfB6N6vK97/zqKubI0KkeI+eb7HWqhDn3/OWNK/1HNqqSdtqCgYKMIQ2xuCtxx0j4Q==
X-Received: by 2002:a5d:64c3:0:b0:3b4:9721:2b31 with SMTP id
 ffacd0b85a97d-3b8f48de428mr1968891f8f.5.1754478616579; 
 Wed, 06 Aug 2025 04:10:16 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5852e28sm43789195e9.9.2025.08.06.04.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 04:10:16 -0700 (PDT)
Message-ID: <e467a9aa-56a0-4761-adfc-923d13af655d@linaro.org>
Date: Wed, 6 Aug 2025 13:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] hvf: sync registers used at EL2
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Igor Mammedov
 <imammedo@redhat.com>, qemu-arm@nongnu.org, Alexander Graf
 <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cameron Esfahani <dirty@apple.com>
References: <20250728134114.77545-1-mohamed@unpredictable.fr>
 <20250728134114.77545-11-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250728134114.77545-11-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/7/25 15:41, Mohamed Mediouni wrote:
> When starting up the VM at EL2, more sysregs are available. Sync the state of those.
> 
> In addition, sync the state of the EL1 physical timer when the vGIC is used, even
> if running at EL1. However, no OS running at EL1 is expected to use those registers.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 7699669e73..a1e928ddfa 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -406,6 +406,8 @@ static const struct hvf_reg_match hvf_fpreg_match[] = {
>   struct hvf_sreg_match {
>       int reg;
>       uint32_t key;
> +    bool vgic;
> +    bool el2;
>       uint32_t cp_idx;
>   };
>   
> @@ -551,6 +553,41 @@ static struct hvf_sreg_match hvf_sreg_match[] = {
>       { HV_SYS_REG_CNTV_CTL_EL0, HVF_SYSREG(14, 3, 3, 3, 1) },
>       { HV_SYS_REG_CNTV_CVAL_EL0, HVF_SYSREG(14, 3, 3, 3, 2) },
>       { HV_SYS_REG_SP_EL1, HVF_SYSREG(4, 1, 3, 4, 0) },
> +    /* vGIC */
> +    { HV_SYS_REG_CNTP_CTL_EL0, HVF_SYSREG(14, 2, 3, 3, 1), true },
> +    { HV_SYS_REG_CNTP_CVAL_EL0, HVF_SYSREG(14, 2, 3, 3, 2), true },
> +#ifdef SYNC_NO_RAW_REGS
> +    { HV_SYS_REG_CNTP_TVAL_EL0, HVF_SYSREG(14, 2, 3, 3, 0), true},
> +#endif
> +    /* vGIC + EL2 */
> +    { HV_SYS_REG_CNTHCTL_EL2, HVF_SYSREG(14, 1, 3, 4, 0), true, true },
> +    { HV_SYS_REG_CNTHP_CVAL_EL2, HVF_SYSREG(14, 2, 3, 4, 2), true, true },
> +    { HV_SYS_REG_CNTHP_CTL_EL2, HVF_SYSREG(14, 2, 3, 4, 1), true, true },
> +#ifdef SYNC_NO_RAW_REGS
> +    { HV_SYS_REG_CNTHP_TVAL_EL2, HVF_SYSREG(14, 2, 3, 4, 0), true, true },
> +#endif
> +    { HV_SYS_REG_CNTVOFF_EL2, HVF_SYSREG(14, 0, 3, 4, 3), true, true },
> +    /* EL2 */
> +    { HV_SYS_REG_CPTR_EL2, HVF_SYSREG(1, 1, 3, 4, 2), .el2 = true },
> +    { HV_SYS_REG_ELR_EL2, HVF_SYSREG(4, 0, 3, 4, 1), .el2 = true },
> +    { HV_SYS_REG_ESR_EL2, HVF_SYSREG(5, 2, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_FAR_EL2, HVF_SYSREG(6, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_HCR_EL2, HVF_SYSREG(1, 1, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_HPFAR_EL2, HVF_SYSREG(6, 0, 3, 4, 4), .el2 = true },
> +    { HV_SYS_REG_MAIR_EL2, HVF_SYSREG(10, 2, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_MDCR_EL2, HVF_SYSREG(1, 1, 3, 4, 1), .el2 = true },
> +    { HV_SYS_REG_SCTLR_EL2, HVF_SYSREG(1, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_SPSR_EL2, HVF_SYSREG(4, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_SP_EL2, HVF_SYSREG(4, 1, 3, 6, 0), .el2 = true},
> +    { HV_SYS_REG_TCR_EL2, HVF_SYSREG(2, 0, 3, 4, 2), .el2 = true },
> +    { HV_SYS_REG_TPIDR_EL2, HVF_SYSREG(13, 0, 3, 4, 2), .el2 = true },
> +    { HV_SYS_REG_TTBR0_EL2, HVF_SYSREG(2, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_TTBR1_EL2, HVF_SYSREG(2, 0, 3, 4, 1), .el2 = true },
> +    { HV_SYS_REG_VBAR_EL2, HVF_SYSREG(12, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_VMPIDR_EL2, HVF_SYSREG(0, 0, 3, 4, 5), .el2 = true },
> +    { HV_SYS_REG_VPIDR_EL2, HVF_SYSREG(0, 0, 3, 4, 0), .el2 = true },
> +    { HV_SYS_REG_VTCR_EL2, HVF_SYSREG(2, 1, 3, 4, 2), .el2 = true },
> +    { HV_SYS_REG_VTTBR_EL2, HVF_SYSREG(2, 1, 3, 4, 0), .el2 = true },
>   };
>   
>   int hvf_get_registers(CPUState *cpu)
> @@ -594,6 +631,14 @@ int hvf_get_registers(CPUState *cpu)
>               continue;
>           }
>   
> +        if (hvf_sreg_match[i].vgic && !hvf_irqchip_in_kernel()) {
> +            continue;
> +        }
> +
> +        if (hvf_sreg_match[i].el2 && !hvf_arm_el2_enabled()) {

FYI this triggers an assertion when testing with my split-accel series
where we emulate EL2. Not your series issue, I need to distinct between
EL2 enabled by HW or SW.

> +            continue;
> +        }
> +
>           if (cpu->accel->guest_debug_enabled) {
>               /* Handle debug registers */
>               switch (hvf_sreg_match[i].reg) {
> @@ -731,6 +776,14 @@ int hvf_put_registers(CPUState *cpu)
>               continue;
>           }
>   
> +        if (hvf_sreg_match[i].vgic && !hvf_irqchip_in_kernel()) {
> +            continue;
> +        }
> +
> +        if (hvf_sreg_match[i].el2 && !hvf_arm_el2_enabled()) {
> +            continue;
> +        }
> +
>           if (cpu->accel->guest_debug_enabled) {
>               /* Handle debug registers */
>               switch (hvf_sreg_match[i].reg) {


