Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F627103E2E8
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 22:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0S3I-0006My-QO; Wed, 11 Mar 2026 18:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0S3G-0006MC-HY
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 18:29:14 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0S3E-0007ve-Tx
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 18:29:14 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-8cd78a4ce8dso41333485a.3
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773268152; x=1773872952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DdxfVqvcQUbqSK7nWN42MCG3eGRfjdJ5IfyBB4fJnpo=;
 b=HmqeCbls3ePXc8JvgLPzrbisqangS71I8oOi0MCLGDM/o8QKrQ+wpl/SMG1xzQUxVf
 Dk3dPggP4pz4wsfnWT3rBgHgDBERwKo+pFthk/BnUWN/nsQ3oBZaD/ghyJIcI/WngXUX
 BMnlzGl7BW5OqSVPWGW6dt9LpVAbjBMfg4JzqSLNBkWmbvzKNOhkRbAeeZbu/L2VV+Jc
 ASSCebKBIk2j6YVOD/sBlmYCjfCC/ZrIzjsYR6py66JAlSG5T9kV2L60glOklcg7JKoW
 ysKUGvSBhYhir7k2mBZMU+l2Xf58kMsy1mTfsttsS6CZOMWtqffQsMJh6liSaCrBgaTx
 kcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773268152; x=1773872952;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DdxfVqvcQUbqSK7nWN42MCG3eGRfjdJ5IfyBB4fJnpo=;
 b=fjzBDbjCy1IAcjP6+0froWFzfcVOVDBbyTd7WLAfb76JNKtmUP1Wuga7kucHh1Amk0
 ius513wvB7hwgWd3CUWS+rUCFPW4IWVuPG4IT3taM9chzYGmvXNyz5W8EJb9cp4aH7G3
 DtJi0XYm89+XrbTN53Q1vPcUssf381h4leB/b6u9s0OZ3jOdBhGXAQDDL6ukL2MhZUJ/
 SJTdlWGO9pxxhcyCg5cYOM0Qdiy/CfBjF74lboO0bSczI8KQrMwWUF8AejT1kV75ve7C
 gkSMAL4pO0KmHB7absy/9WglY2QJ4Cpj2nl+gha2p5lG3gjJUHszbeU4ZaxgGh843d1a
 haNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs3HtwP00JRw2fLdY9zAIkXvGx6GkX2LX4vAEM6BWiG+y1/zKup8LE2zULLsGJhcqF/sILYhyXBg==@nongnu.org
X-Gm-Message-State: AOJu0YygW6+ayO1a9CiP2/6xNDYtNvhfeztAXTUVM0ia1kRm79iSL0W0
 7UmASsEhuu0Pc6IOy+/+VX73b/HkXYtHAVEgbTglsZPxGM0I1AmYHX1IN/bSbyoLzCw=
X-Gm-Gg: ATEYQzwtCzmtFZTBKA7cgMDQzaeM2jz0JRbiyxrJzkCzq6C8Tz4D/j8LKurkWmYVXMT
 hvb4eGFPfkZae23v9gaYPmlyLwPy8xDiTBuB+P4LKjTqUDfhc3GxNdtfsxLVm+198DRow4ECf99
 bUJxznqbFICyvAbCj7H3XDa3cuqDjJ8mOi7SM1Z1OwmW1pyOZII5clNLcOC/u6C8rABs9xvGs3J
 9+ytTaTxSWKYvNSgiPP5bzHkNhATRhFeLxzFzmHFe0TiIXSeNFtYlh1dqPiS7Xe/ikkKVKVOVRh
 zRM7IM2MShI9p+PvmRdzeYLmnF3aZXJ/1sYFlUNtZO9fFDxtOmoQvEQx6+DbCQXTLHVyHDtCU/c
 ZF1KdAb3EVjZ8x6dTAcAbWmaIYn4Vw62wxnw2BzC/mPc4Qc1qlheyAi+REvZnq8op1sZiCxBFJg
 TSQKit3LqNiYI3VpO4m3iKGf/K+j3xvi3Ubi3NDgkCJcLUJtQT98rCw01zCOL1AKOOID8V
X-Received: by 2002:a05:620a:1928:b0:8ca:2e37:ad07 with SMTP id
 af79cd13be357-8cda1936a84mr568586785a.8.1773268151568; 
 Wed, 11 Mar 2026 15:29:11 -0700 (PDT)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cda1fbcd2esm226929985a.5.2026.03.11.15.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 15:29:11 -0700 (PDT)
Message-ID: <e7a2aa40-400b-444f-8c22-fc6895e376e3@linaro.org>
Date: Wed, 11 Mar 2026 15:29:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add ARM64 support for MSHV accelerator
Content-Language: en-US
To: "Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>,
 qemu-devel@nongnu.org
Cc: Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aastha Rawat <aastharawat@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20260311-mshv_accel_arm64_supp-v1-0-c31699b7bc1f@anirudhrb.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260311-mshv_accel_arm64_supp-v1-0-c31699b7bc1f@anirudhrb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qk1-x735.google.com
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

Hi Anirudh,

On 3/11/26 8:15 AM, Anirudh Rayabharam (Microsoft) wrote:
> This series adds ARM64 guest support to the MSHV (Microsoft Hypervisor)
> accelerator, enabling QEMU to run aarch64 VMs on Microsoft's hypervisor
> using the mshv Linux kernel module.
> 
> The first few patches refactor the existing x86 MSHV code to separate
> arch-specific pieces from common infrastructure: moving MSR handling to
> target/i386, extracting shared register hypercall helpers, provisioning
> host CPU features, and introducing arch-specific init hooks.
> 
> The remaining patches add the ARM64 backend:
>   - vCPU state get/set using hypervisor register hypercalls
>   - -cpu host support by querying ID registers from the hypervisor
>   - vCPU run loop with MMIO emulation via ESR_EL2 syndrome decoding
>   - In-kernel vGICv3 backed by HVCALL_ASSERT_VIRTUAL_INTERRUPT
>   - Interrupt control structure adjustments for arm64
> 
> With this series, a standard aarch64 virt machine can be launched with:
>    qemu-system-aarch64 -accel mshv -cpu host -M virt ...
> 
> Caveats:
> - Currently only direct kernel is supported. We're still debugging edk2
>    firmware boot.
> - Live migration is not yet supported.
> 
> ---
> Aastha Rawat (7):
>        accel/mshv: move msr.c to target/i386
>        accel/mshv: extract common CPU register helpers
>        meson, target/arm/mshv: Enable arm64 build & add initial MSHV support
>        target/arm/mshv: implement vcpu state operations for ARM64
>        target/arm/mshv: implement -cpu host for MSHV
>        accel/mshv: Add access_vp_regs synthetic proc features
>        target/arm: cpu: Mark MSHV supporting PSCI 1.3
> 
> Anirudh Rayabharam (Microsoft) (6):
>        accel/mshv: provision guests with the same features as host
>        accel/mshv: add arch-specific accelerator init hook
>        target/arm/mshv: add vCPU run loop
>        include/hw/hyperv: adjust hv_interrupt_control structure for arm64
>        hw/intc,target/arm/mshv: add MSHV vGICv3 implementation
>        MAINTAINERS: updates for MSHV arm64 code
> 
> Magnus Kulke (1):
>        accel/mshv: implement cpu_thread_is_idle() hook
> 
>   MAINTAINERS                        |   8 +
>   accel/mshv/irq.c                   |   2 +
>   accel/mshv/meson.build             |   4 +-
>   accel/mshv/mshv-all.c              |  73 +++-
>   accel/mshv/mshv-cpu-common.c       | 151 +++++++++
>   hw/arm/virt.c                      |  11 +-
>   hw/intc/arm_gicv3_common.c         |   3 +
>   hw/intc/arm_gicv3_mshv.c           | 180 ++++++++++
>   hw/intc/meson.build                |   1 +
>   include/hw/hyperv/hvgdk_mini.h     | 130 ++++++++
>   include/hw/hyperv/hvhdk.h          |  97 +++++-
>   include/hw/hyperv/hvhdk_mini.h     |   6 +
>   include/hw/intc/arm_gicv3_common.h |   1 +
>   include/system/hw_accel.h          |   3 +-
>   include/system/mshv.h              |   2 +
>   include/system/mshv_int.h          |   5 +
>   meson.build                        |   7 +-
>   target/arm/cpu.c                   |   7 +-
>   target/arm/cpu64.c                 |  24 +-
>   target/arm/meson.build             |   1 +
>   target/arm/mshv/meson.build        |   7 +
>   target/arm/mshv/mshv-all.c         | 665 +++++++++++++++++++++++++++++++++++++
>   target/arm/mshv_arm.h              |  18 +
>   target/i386/mshv/meson.build       |   2 +
>   target/i386/mshv/mshv-all.c        |  85 +++++
>   target/i386/mshv/mshv-cpu.c        | 170 +---------
>   {accel => target/i386}/mshv/msr.c  |   0
>   27 files changed, 1465 insertions(+), 198 deletions(-)
> ---
> base-commit: 1fd5ff9d76d23ab23a68419cbc76d5ee33e8b455
> change-id: 20260311-mshv_accel_arm64_supp-e86b0082aee4
> 
> Best regards,

I have a question about MSHV itself.

Is it possible to get access to it through a Windows install, or a 
custom binary or disk image, or is it not redistributed and available 
only through Azure instances?

Regards,
Pierrick

