Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEECFB44BB
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGAlW-0002MF-Ds; Fri, 24 Apr 2026 03:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAlQ-0002Lb-MZ
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:15:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAlJ-0000Ki-Qr
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:15:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so68880165e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777014940; x=1777619740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aO+pVKRE5JjEtTa4KGnF+otF0zYfiNqJ2NW6e07bi7s=;
 b=Cbh3i52pqpgEEWJXF/M9vlXJkZ7p7XEu48RMTjLb7TbsqdlFq8HKev3FymoTTLYy73
 OCe8yQAG6+WDRgs9UYHyFP7H4W5rcnaPryoGz9jxV0pnIWblbNEYGT6K02QuFnEj8Zmb
 3Ohdr/bwwGwhIfIEhtYdSQd0TLN/DahGDu2SQbK3acZH/Ppdg1h8dhjtR3yffoZHVq4B
 tRIcTaOkvprTPnx6Xe3XYxb5tPOu4AP35Z8J5AwgqhyiMct08kanIqOusNREa9vIgOnw
 iIpfkYApQ6P3f0vWykrcSFfk2IdcWeyDLhw5SVHQLJcTVIbBtgYyrXUuZgR3I/wbK4Pa
 C4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777014940; x=1777619740;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aO+pVKRE5JjEtTa4KGnF+otF0zYfiNqJ2NW6e07bi7s=;
 b=Qni+cYfkLCiBnCN6NOYfOs8iXzkknSaEKsihO0FKIRadsNLQvtTAHZ1nm/bW4bO7p1
 v2m7a16G89Fyi5wvrryOiq/XXDBXg0CR2WTjY/p1t9EjFWoj1nx87yFpXbgJj7xEJHI5
 XIXAnIU4ICk4JwPPKldL5gCL9XwUs/agEUeF1zTkpOljm24br+ggOCHLImwqiy9BoKB4
 gK6oL1IvGjZVdheIDesxP9PbjApO7lYddY5b3Rfs+0glIlCgqI2pYUc2P1B12CptRnVx
 tAPVf6/O/ptEahNHUtW8+1ZLlOcaQD9ga3/CElUMK11fRStExRUrwHEvPVO44FIDQ3Yd
 PMmA==
X-Forwarded-Encrypted: i=1;
 AFNElJ887fwMj5sAp1Gsi28LFqydv6QjqktwFmOEi7UH6YykRH8SxhMYz0JALg+Zr9fmq4+Ex3iV68qSzA==@nongnu.org
X-Gm-Message-State: AOJu0YxOPJyhRnbmNHz6ahQQ0N5YSD7pCU+J3JgOe0D0OOwvqR30L0Nq
 rLzTmUDZsr7DCSEGUi/dLnKKEsSx0X0gp/erps0OXXun6J2yrtfIogspRP5iSE4uUZA=
X-Gm-Gg: AeBDievCIKfqus9cXO5keZ1tpk1DqBgu9ZUhZDLlfQOCI59CoeD7LJ4+8H99CaNMa6T
 8npzdm2xIqH6Km+BrF6dbSlIGdLvyEKSVodtagKZhccAM+sWzjyGnw1PY6Sx+djE84ZMcSIyzmi
 VAdGSy09gT4C3L/heeCG7G9e5IAJbCpFqs423YKU3Rlgn7kyvfN+Y4m/ehx+bEUqkbki7QrbynT
 VFglDpqsTwt51tllyyy+DPLegnPddr7ub7WxkL06mS+ilpV0+0nYAEZzMcpTUpPr5F+c70E5i5a
 qQVYqgj6F/FQUw43XamjCdLPfTJumrxtZlL/C022B56Aa4XwtIbXLdOpdquU0kEegWSxZ8FT3I6
 mom6clX0oOUHd5+egcSK3Q+yury5Ng3Mdn8xHF76Nrq0H0tDSlvX2n62sq2utStwLqG5xstn4uF
 7dKJw8ynj4QLFAPFMNGyqAL7LQ/GmoqkEi160RF/urq0WqR4twCCjdMZcq5FiK1cqyi/Wz81Xzd
 6oipr/XpVJiCRxek+JaUeUXyPVE6Yanj/eTu6YWlZKGxq3XcWrKz9nR2F7z/KueGthjkJwN
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id
 5b1f17b1804b1-488fb739cd9mr361725705e9.1.1777014940030; 
 Fri, 24 Apr 2026 00:15:40 -0700 (PDT)
Received: from meli-email.org (athedsl-338307.home.otenet.gr. [85.72.177.33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1cfbf2sm590660555e9.15.2026.04.24.00.15.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:15:39 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:15:26 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: Re: [PATCH v20 07/15] hvf: gate ARM_FEATURE_PMU register emulation
 when using the Apple vGIC
User-Agent: meli/0.8.13
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-8-mohamed@unpredictable.fr>
In-Reply-To: <20260316130642.13246-8-mohamed@unpredictable.fr>
Message-ID: <tdzli2.3nqzzsd8i5ktn@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
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

On Mon, 16 Mar 2026 15:06, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>From Apple documentation:
>
>> When EL2 is disabled, PMU register accesses trigger "Trapped MSR, MRS, or
>> System Instruction" exceptions. When this happens, hv_vcpu_run() returns, and the
>>  hv_vcpu_exit_t object contains the information about this exception.
>
>> When EL2 is enabled, the handling of PMU register accesses is determined by the PMUVer
>> field of ID_AA64DFR0_EL1 register.
>> If the PMUVer field value is zero or is invalid, PMU register accesses generate "Undefined"
>> exceptions, which are sent to the guest.
>> If the PMUVer field value is non-zero and valid, PMU register accesses are emulated by the framework.
>> The ID_AA64DFR0_EL1 register can be modified via hv_vcpu_set_sys_reg API.
>
>However, despite what that documentation says this is actually gated on using the Apple vGIC
>instead of nested virtualisation per se. Apple introduced both at the same time.
>
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> target/arm/hvf/hvf.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>index 04c4106a3e..c971aa8cce 100644
>--- a/target/arm/hvf/hvf.c
>+++ b/target/arm/hvf/hvf.c
>@@ -1601,7 +1601,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
>     ARMCPU *arm_cpu = ARM_CPU(cpu);
>     CPUARMState *env = &arm_cpu->env;
> 
>-    if (arm_feature(env, ARM_FEATURE_PMU)) {
>+    if (!hvf_irqchip_in_kernel() && arm_feature(env, ARM_FEATURE_PMU)) {
>         switch (reg) {
>         case SYSREG_PMCR_EL0:
>             *val = env->cp15.c9_pmcr;
>@@ -1862,7 +1862,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>                            SYSREG_OP2(reg),
>                            val);
> 
>-    if (arm_feature(env, ARM_FEATURE_PMU)) {
>+    if (!hvf_irqchip_in_kernel() && arm_feature(env, ARM_FEATURE_PMU)) {
>         switch (reg) {
>         case SYSREG_PMCCNTR_EL0:
>             pmu_op_start(env);
>-- 
>2.50.1 (Apple Git-155)
>
>

