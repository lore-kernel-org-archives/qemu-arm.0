Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4395C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 21:50:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubR3Y-000495-1M; Mon, 14 Jul 2025 17:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPPT-00053X-Ki
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:04:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPPR-0005YY-E1
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:04:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so14644475e9.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752523460; x=1753128260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Ov3UQtVTAyFtF6M4DX55otx5DbTvkVaXfhcDrxwIpg=;
 b=e9X8g7YsUwTaZAwsYO3X5tRwsgbwlPVNi8wSyqMsZLxhQ0ic+iGlnQ2+JmML1nhBP6
 1YwsxToCz1GlH0aqDI4bOInMgzcMG0Ne+gSMb41ZlXkxOf0J5Y4gYhYnpPH35rPzKBQh
 pe5LqyZYYx+CZpkguVGL/cA8VLEzSNzgN2bJVQbTm/1FMAyFNLgWcHy7bncOGwb8fXSl
 ECAy5cAxBLtYknMhzIRsTqMEFqISXAwdxaJvXqtjocXknQppANC/x2pY9SBoHMV7VW0h
 VhJO3+pR/H31fh0n6//cQ+oBkxEgJ7pBB8B+SLOBeaO+uAW9Y64TaQQInFz0Xn+tFzhK
 hv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752523460; x=1753128260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ov3UQtVTAyFtF6M4DX55otx5DbTvkVaXfhcDrxwIpg=;
 b=bYMTpkpnMeLanL3sI4N7P0Rgsv44kiRMRwD3zP+VVI06A75RMOLhkgv90kvK1qPmWe
 EP2HM2bx00BrXJk9sBsph0ma+4VRc4lH5AQCXLhSJbiSq6pcuTiMKEoM0/7PNjnwiglP
 k0TU8Tb1AqhOUwugYz4m+ONPluTlLzbd/yc1mLLkM9RdmmxiYrOPPP62wv1YBdGJYahF
 5fu5cxhou0dos8Amas0YZ8JNNu1VCUm7OwLcTzB6yHrf0PkYIx8aDcmSymCGL/75/KQw
 OLuNsZY4nlBxXm47UY9ElQ3PqV77sRk46gwjYauitdX670PpGBZ92A7TlguH7k4ZVL6m
 Oyxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpRfcofFwtxwhqeBqAosbx5SgITxbTXJwrPRrMPP9ZMigKW48QpzZqs89E/MAc0rQcWutem81L7w==@nongnu.org
X-Gm-Message-State: AOJu0Yw4ssfPWeMQDqhTNPRw7he3u9cY3OMvKOrc4v6/dIJg5Ptls5nI
 kh9GFJJKiLK/x/vndPyeoEwmVj9abwLhn8vdCCK/Mu8V3F1Hc8r3jIK4XAcMiTeOXSM=
X-Gm-Gg: ASbGnctfGrbub5HcYh7vss4JBjll8wVzzHjeP3asKF/MlSrVfDrBK7x/SeuTej8ex3u
 oOp4MjHV7PAqVdG5V7d+kiKzP5MCWX2wLxt61eEjMdqcdQx4JNfzAGHra0ZHYAYAla7Cx2wy3GW
 Kzf7yYHZGT1KEBxsZbpa3ujDulSW6XwuPyIx+1vCUCdCWidfKbhqD/UY+RBH2qi7efUs0R4Qav7
 W8eL4NZi3xuHGf0pAERGlusQ7wJ2Hi82/hpxOPKF+QoxKBrEdxelQzeSd59KYceqKGyJIFQTUY2
 e9sM3DokxoAv3HNdYYkXmnFUh3pxtZiemVVg5GqbUL4e1rr2iR5aLJ4XJOcq5cWRIzwvH7MfDAN
 EBngem+orCfTeI380de/PX/XN44gY+DjQizpJfBLx7lGLr6FCz0BPZs9VegMGW3vTGw==
X-Google-Smtp-Source: AGHT+IEhxBd1mZcctQBenAvcFqcCDe5oUusEPlzCms2iFoqNa+n4SgSrpwbWdDSb697+VwBP/8GKLg==
X-Received: by 2002:a05:600c:6092:b0:456:e39:ec1a with SMTP id
 5b1f17b1804b1-4560e39eed0mr79645465e9.14.1752523459554; 
 Mon, 14 Jul 2025 13:04:19 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e262c6sm13030549f8f.85.2025.07.14.13.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:04:19 -0700 (PDT)
Message-ID: <7a34c735-3306-4028-bec9-f34b4271a543@linaro.org>
Date: Mon, 14 Jul 2025 22:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hvf: arm: Add permission check in GIC sysreg
 handlers
To: Zenghui Yu <zenghui.yu@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: agraf@csgraf.de, mads@ynddal.dk, peter.maydell@linaro.org
References: <20250714160139.10404-1-zenghui.yu@linux.dev>
 <20250714160139.10404-2-zenghui.yu@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250714160139.10404-2-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 14/7/25 18:01, Zenghui Yu wrote:
> Quoting Peter Maydell:
> 
> " hvf_sysreg_read_cp() and hvf_sysreg_write_cp() do not check the .access
>    field of the ARMCPRegInfo to ensure that they forbid writes to registers
>    that are marked with a .access field that says they're read-only (and
>    ditto reads to write-only registers). "
> 
> Before we add more registers in GIC sysreg handlers, let's get it correct
> by adding the .access checks to hvf_sysreg_read_cp() and
> hvf_sysreg_write_cp(). With that, a sysreg access with invalid permission
> will result in an UNDEFINED exception.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
> 
> I hard-code the @current_el parameter of cp_access_ok() to 1 because
> 
> * we only support EL0 and EL1 in HVF, and

This might change with this work:
https://lore.kernel.org/qemu-devel/20250620172751.94231-1-philmd@linaro.org/
and plan to leverage M3/M4 for EL2 support:
https://developer.apple.com/documentation/hypervisor/hv_vm_config_set_el2_enabled(_:_:)

> * a GIC sysreg access from EL0 would result in an UNDEF exception which is
>    taken to EL1 (without going back to QEMU for emulation).
> 
>   target/arm/hvf/hvf.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0c7396ad6f..1db0b77fb6 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1270,6 +1270,9 @@ static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
>   
>       ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
>       if (ri) {
> +        if (!cp_access_ok(1, ri, true)) {
> +            return false;
> +        }
>           if (ri->accessfn) {
>               if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
>                   return false;
> @@ -1550,6 +1553,9 @@ static bool hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
>       ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
>   
>       if (ri) {
> +        if (!cp_access_ok(1, ri, false)) {
> +            return false;
> +        }
>           if (ri->accessfn) {
>               if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
>                   return false;


