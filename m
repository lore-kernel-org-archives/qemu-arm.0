Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53832CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:08:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jp5-0004OA-H7; Thu, 25 Sep 2025 07:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jp0-0004Kp-GC
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:07:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jok-0003g0-Ps
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:07:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so3390265e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758798434; x=1759403234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EGJ+v7EjpOgKcmwagB2CC23aehgXIDcz1dCQpIYApz8=;
 b=T7YCYox9Tw0FB2g9B8LbhDX0dseTXkuitscEFjHsKoiu4SGgeBetxxAdNulF/Hs5/j
 zoQOuIjDMp08yQjs4Rnyy10LntQsk4TpHbimJGTXa5Zupm/ngQuJA46HgWgKklybpXTw
 Mg3UUywqIy1HFugmcDnXHuk+JGQl4y/pgNjOKg3mNkhiipx92Bh1TXyZHKaZN7Xj+O/W
 7NAh3rrIipFZ3AweEFl+TpLMhHodvbQYoALHwTx2+/JawTcnUKFOt21Xc0wjm3w5+MLO
 v5aXy5LrkLeMbIrIQZ4upz9q9VcCO8LBHE59PcbjAfB6GIE7Pa7Q6t2EQmF3NbfZSXfP
 qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758798434; x=1759403234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGJ+v7EjpOgKcmwagB2CC23aehgXIDcz1dCQpIYApz8=;
 b=JSfR7BT0bhmyB0mUARQH6ExA0j3UJiMpAdGr9hURtsOwp7TO1HB4MDMNxzxxrmnGWg
 oDCh/i+EkbBPIsBc+Kfnh6KyU/luW+DbkTlgnk8VU87vpK1ixDrwK4MVBR30Up+CeXOx
 HTmx9FVOaJCVe9yA5OMJXTq2WrEKTH+ldREdPxsG4gfrBU5eB/niL41Up8C+BS5ivv4u
 nZfz9muh0GJ78FUIHVb0Smwl4l+ri9b59zKwead1D4HFIsDcGZnlOLu+BgupSqEHwZLi
 w8D4gy4uBHOmWuN7tOi2/n7O9Eae3e5XtNwtCKaamHrKkwP/kgdLlUeOqygUkOl2GmOZ
 94Cw==
X-Gm-Message-State: AOJu0YxrDOKW2rnLweVrw+01xjpMTU1Rwuz2BH8ny6CIvr+m7Vlvc7aK
 Hgd0//5aD59xbcc9gfhEP83uQWsJ4cNaBPL43/G4/fbdKU7U4LslzFewQTTvDPo0PDA=
X-Gm-Gg: ASbGncsEEx6q/c1DMgUsbI2MzQ4ul7ZZWzhqzVRgMFlLBPMA3w/CQTwBc0toiwBIrYH
 hJL+zxe9XRNBFGBHAdc/JvbeJyTPza7AKjxFR1biyX0fD9I5TvYZAUCmdZQIral2Q9Sj5uhx3ze
 BSTGmmBRsaRdHjBMp2vC4eO0z7iFLJB8tVDvyk0YLliFFUSuhP+2fFawlfwLtsU9OjgSo9blD1E
 59FwJ2K3eBxr+Mlu+m/NlI1Pk3MsQClJuJK9EUNWYW8xXvlOcNa3tRn11yyJSzNWDqmkxBXKNgu
 xrKapZ5YpsP3+xteU0S8p7MvZk7A3GgLPUygmGyaOimXt+SvDmDBWNeS4/TtMVBcRUOd/8rsiKK
 Tp9LpbUtrWOixTDi4fuFDC3dyDOct6cQilyG5oVG8SBDu0DqVIyr/EWQKcQp5aEdZt0W3nuYwMJ
 uM
X-Google-Smtp-Source: AGHT+IEy2H9kXSltcze/jFKG+7ojduFoorQ8Zfv5OhlPeToFvUsv5t5FyDqI/IJLIZGlUOcuNMHUFg==
X-Received: by 2002:a05:600c:35c1:b0:45f:bef7:670b with SMTP id
 5b1f17b1804b1-46e329afecamr33037025e9.3.1758798434373; 
 Thu, 25 Sep 2025 04:07:14 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb21esm2622452f8f.7.2025.09.25.04.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:07:13 -0700 (PDT)
Message-ID: <63a29a08-67ea-449f-954b-f62abbc39346@linaro.org>
Date: Thu, 25 Sep 2025 13:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/36] target/arm: Add key parameter to
 add_cpreg_to_hashtable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 16/9/25 16:22, Richard Henderson wrote:
> Hoist the computation of key into the caller, where
> state is a known constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 39 +++++++++++++++++++--------------------
>   1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4a109a113d..a5195e296d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7424,26 +7424,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>   static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
>                                      CPState state, CPSecureState secstate,
>                                      int cp, int crm, int opc1, int opc2,
> -                                   const char *name)
> +                                   const char *name, uint32_t key)
>   {
>       CPUARMState *env = &cpu->env;
> -    uint32_t key;
>       ARMCPRegInfo *r2;
> -    bool is64 = r->type & ARM_CP_64BIT;
>       bool ns = secstate & ARM_CP_SECSTATE_NS;
>       size_t name_len;
>   
> -    switch (state) {
> -    case ARM_CP_STATE_AA32:
> -        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
> -        break;
> -    case ARM_CP_STATE_AA64:
> -        key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
>       /* Overriding of an existing definition must be explicitly requested. */
>       if (!(r->type & ARM_CP_OVERRIDE)) {
>           const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
> @@ -7548,22 +7535,28 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
>        * (same for secure and non-secure world) or banked.
>        */
>       char *name;
> +    bool is64 = r->type & ARM_CP_64BIT;
> +    uint32_t key = ENCODE_CP_REG(cp, is64, 0, r->crn, crm, opc1, opc2);
>   
>       assert(!(r->type & ARM_CP_ADD_TLBI_NXS)); /* aa64 only */
>   
>       switch (r->secure) {
> -    case ARM_CP_SECSTATE_S:
>       case ARM_CP_SECSTATE_NS:
> +        key |= CP_REG_AA32_NS_MASK;
> +        /* fall through */
> +    case ARM_CP_SECSTATE_S:
>           add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, r->secure,
> -                               cp, crm, opc1, opc2, r->name);
> +                               cp, crm, opc1, opc2, r->name, key);
>           break;
>       case ARM_CP_SECSTATE_BOTH:
>           name = g_strdup_printf("%s_S", r->name);
>           add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_S,
> -                               cp, crm, opc1, opc2, name);
> +                               cp, crm, opc1, opc2, name, key);
>           g_free(name);
> +
> +        key |= CP_REG_AA32_NS_MASK;
>           add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_NS,
> -                               cp, crm, opc1, opc2, r->name);
> +                               cp, crm, opc1, opc2, r->name, key);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -7573,6 +7566,8 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
>   static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, const ARMCPRegInfo *r,
>                                           int crm, int opc1, int opc2)
>   {
> +    uint32_t key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
> +
>       if ((r->type & ARM_CP_ADD_TLBI_NXS) &&
>           cpu_isar_feature(aa64_xs, cpu)) {
>           /*
> @@ -7587,18 +7582,22 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, const ARMCPRegInfo *r,
>            */
>           ARMCPRegInfo nxs_ri = *r;
>           g_autofree char *name = g_strdup_printf("%sNXS", r->name);
> +        uint32_t nxs_key;
>   
>           assert(nxs_ri.crn < 0xf);
>           nxs_ri.crn++;
> +        nxs_key = key + (1 << CP_REG_ARM64_SYSREG_CRN_SHIFT);

This is new but not mentioned. While the CRN bit is know to be 0,
we usually use '|' to set a bit, not '+'. Preferably using '|':

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           if (nxs_ri.fgt) {
>               nxs_ri.fgt |= R_FGT_NXS_MASK;
>           }
> +
>           add_cpreg_to_hashtable(cpu, &nxs_ri, ARM_CP_STATE_AA64,
> -                               ARM_CP_SECSTATE_NS, 0, crm, opc1, opc2, name);
> +                               ARM_CP_SECSTATE_NS, 0, crm, opc1, opc2,
> +                               name, nxs_key);
>       }
>   
>       add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA64, ARM_CP_SECSTATE_NS,
> -                           0, crm, opc1, opc2, r->name);
> +                           0, crm, opc1, opc2, r->name, key);
>   }
>   
>   void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)


