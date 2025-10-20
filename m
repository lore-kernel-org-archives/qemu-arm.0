Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CD6CCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:01:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqRo-0008EK-IQ; Mon, 20 Oct 2025 10:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqRe-00088p-W2
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:01:10 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqRb-00060f-Sc
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:01:06 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7815092cd0bso44013807b3.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760968860; x=1761573660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P3wd36Shxgxe9blQXOHxYRpdz75/BpPqk627GopzNUA=;
 b=Siqu9k1Vqjsh3xZvqBHMu5gtaaY3H237n1wnc5oPKTMwqJxuV61ADWfNJSDVCPyhkK
 FIh0DbtX5yq8+s7NtGNT1bLkqXjLaUJQHxP9R0D+Kew+gbs4csxa/sh/KwUYeacSgAQX
 jyf20tOJHrwMe8zxEZSFndS0fiSzEdv2e56HTeVZ4iOk9kkO8gdTB5zS1dVr/LY+00Kz
 k0XbFPrGfjBt0r06rgkrVbOyGmkgO74kiTU8XDmrOvycazemuyJAiO2Wdyy9irXFpr9h
 bfakgJc33ZLxUYPEyJKugglaHUxLY/vTlIYUUzmKNfKGY/RMV4YqbQQBUG3S1fselK18
 ZOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760968860; x=1761573660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P3wd36Shxgxe9blQXOHxYRpdz75/BpPqk627GopzNUA=;
 b=Le/5VQFNMeZPY2sTfeQNUjdbi+TbHoMekg7/YifRTj9Rizz5Rog5SaI1z3/zcsbRp1
 qRGWW0i6S4JCQWeE7d0VGYiUqGjKo6YRIdyLczCdult/uXZCvWQI7xdrCBg+GT/9WnQM
 LyX3ZVKnF6r++PlEUmK8B4anFD6nkWW7++aTM2P0jCXFhobFnZfXJ0HiMqlB7S2veme/
 Q/4dRnGlYX2XiXkp1C5AZiu0GTVob7ikE1bhqbEFlbD6h/86I0/t/V5JB3D82zzIxgKG
 ERwY3kTfTlCI7vmaOfdv5FRspQRcXgN3fCq31xJfB8ZOjeE/tWgUKWkr6sWJSKfm2/dw
 nv9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWENCaLPJ9myosNWyOvOaHL0och2FzTadAuKy6uyv0Aze8gAiByECh9jbQXMT0LcB6edWCI9xu3zQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNogTLoTJ3RGVrR08K1RTfWxoSKwut/o9nXoafktRLbaIMi3Ob
 qHoKaWxj5881AhV2FYZMukzzX3MsGEvdrXPz3YnninQ60UywhPIIcju3H9UkoCKdhJTKs6SwrCw
 21xmtBxUv3hBXwrPDQsdDMR50EOERlRT6NTWlHzyznw==
X-Gm-Gg: ASbGncvF99Nd85zCoEp6xm4SzXmP2LLl0hRqAW0Dtnmo/5nxphXGQnB5FuD3lO7aMsY
 YfCCS75cMYGbvvQwkbg1myqnHbaAPsJ1w8snWjFlr2MZSjkwC80+FtVBd5YV642jEj4INsrajFJ
 218naH5KxIpBik/QeSnuodaoN5yiZe9TCNguFn8CBcT/qXEQwqvt9Za2CUVwlOed70fsBuafeJk
 OwP5QwoI9IglJ5M0R5bkudDO/7NqJtxjD97zSSS9ojR1IjH6EVlakShuycqwg==
X-Google-Smtp-Source: AGHT+IGVBnFKrYgi9RkzyS75ncWeNASH3ZXNO2YpafsvqsIijCPaDQGZuuXrFZu0bJcpzWES/A7MULL8uzpqtdOhoGQ=
X-Received: by 2002:a05:690c:4c10:b0:784:933d:40a0 with SMTP id
 00721157ae682-784933d4d71mr72998847b3.31.1760968859865; Mon, 20 Oct 2025
 07:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-23-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:00:48 +0100
X-Gm-Features: AS18NWA0eFd7_3KMEizLYLWpA4TQbbTTmZGogc3gJG24ycD77pyvYK6CU-9HPHs
Message-ID: <CAFEAcA-dV4_WtGuU9020xpCFJ=EP_3wGPU+hs8cq914JNCT3Ow@mail.gmail.com>
Subject: Re: [PATCH v2 22/37] target/arm: Consolidate definitions of TTBR[01]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 14 Oct 2025 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a function define_ttbr_register which handles the 3
> distinct cases for TTBR[01] registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +static void define_ttbr_registers(ARMCPU *cpu)
> +{
> +    /*
> +     * For v8:
> +     * The aarch64 regs are primary, since they might be 128-bit.
> +     * The aarch32 64-bit non-secure regs are secondary to aa64 el1.
> +     * The aarch32 64-bit httbr is secondary to aa64 el2.
> +     * The aarch32 64-bit secure ttbr0 is secondary to aa64 el3.
> +     * The aarch32 64-bit secure ttbr1 is primary.
> +     *
> +     * For v7:
> +     * The aarch32 64-bit s+ns regs are primary.
> +     *
> +     * The aarch32 32-bit regs are secondary to one of the above,
> +     * and we also don't expose them to gdb.
> +     */
> +    static const ARMCPRegInfo ttbrv8_reginfo[] = {
> +        { .name = "TTBR0_EL1", .state = ARM_CP_STATE_AA64,
> +          .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
> +          .access = PL1_RW, .accessfn = access_tvm_trvm,
> +          .fgt = FGT_TTBR0_EL1,
> +          .nv2_redirect_offset = 0x200 | NV2_REDIR_NV1,
> +          .vhe_redir_to_el2 = ENCODE_AA64_CP_REG(3, 4, 2, 0, 0),
> +          .vhe_redir_to_el01 = ENCODE_AA64_CP_REG(3, 5, 2, 0, 0),
> +          .writefn = vmsa_ttbr_write, .raw_writefn = raw_write,
> +          .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[1]) },
> +        { .name = "TTBR1_EL1", .state = ARM_CP_STATE_AA64,
> +          .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
> +          .access = PL1_RW, .accessfn = access_tvm_trvm,
> +          .fgt = FGT_TTBR1_EL1,
> +          .nv2_redirect_offset = 0x210 | NV2_REDIR_NV1,
> +          .vhe_redir_to_el2 = ENCODE_AA64_CP_REG(3, 4, 2, 0, 1),
> +          .vhe_redir_to_el01 = ENCODE_AA64_CP_REG(3, 5, 2, 0, 1),
> +          .writefn = vmsa_ttbr_write, .raw_writefn = raw_write,
> +          .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[1]) },
> +        { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
> +          .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
> +          .access = PL2_RW, .resetvalue = 0,
> +          .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
> +          .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
> +        { .name = "TTBR0_EL3", .state = ARM_CP_STATE_AA64,
> +          .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 0,
> +          .access = PL3_RW, .resetvalue = 0,
> +          .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
> +    };
> +
> +    static ARMCPRegInfo ttbr64_reginfo[] = {
> +        [0 ... 3] = {
> +            .cp = 15, .crm = 2, .type = ARM_CP_64BIT,

I think I would prefer it if we listed the full encoding
fields in each array element, rather than factoring out the
common parts like this. I think it's easier to read and
confirm what register encoding is being dealt with when
it's all on one line in the standard order rather than split
up into multiple lines.

> +            .access = PL1_RW, .accessfn = access_tvm_trvm,

This applies the accessfn to the HTTBR, which is harmless
because the accessfn doesn't trap unless at EL1, but also
means we'll do an unnecessary function call out to C code
for every access to it.

> +            .writefn = vmsa_ttbr_write, .raw_writefn = raw_write
> +        },
> +        [0 ... 1].opc1 = 0,
> +        [0].name = "TTBR0",
> +        [0].secure = ARM_CP_SECSTATE_NS,
> +        [0].fieldoffset = offsetof(CPUARMState, cp15.ttbr0_ns),
> +        [1].name = "TTBR0_S",
> +        [1].secure = ARM_CP_SECSTATE_S,
> +        [1].fieldoffset = offsetof(CPUARMState, cp15.ttbr0_s),
> +
> +        [2 ... 3].opc1 = 1,
> +        [2].name = "TTBR1",
> +        [2].secure = ARM_CP_SECSTATE_NS,
> +        [2].fieldoffset = offsetof(CPUARMState, cp15.ttbr1_ns),
> +        [3].name = "TTBR1_S",
> +        [3].secure = ARM_CP_SECSTATE_S,
> +        [3].fieldoffset = offsetof(CPUARMState, cp15.ttbr1_s),
> +
> +        [4] = {
> +            .name = "HTTBR", .cp = 15, .crm = 2, .opc1 = 4,
> +            .access = PL2_RW, .type = ARM_CP_64BIT,
> +            .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2])
> +        },
> +    };
> +
> +    static ARMCPRegInfo ttbr32_reginfo[] = {
> +        { .name = "TTBR0", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
> +          .access = PL1_RW, .accessfn = access_tvm_trvm,
> +          .writefn = vmsa_ttbr_write, .raw_writefn = raw_write,
> +          .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
> +                                 offsetof(CPUARMState, cp15.ttbr0_ns) } },
> +        { .name = "TTBR1", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
> +          .access = PL1_RW, .accessfn = access_tvm_trvm,
> +          .writefn = vmsa_ttbr_write, .raw_writefn = raw_write,
> +          .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
> +                                 offsetof(CPUARMState, cp15.ttbr1_ns) } },
> +    };
> +
> +    CPUARMState *env = &cpu->env;
> +
> +    /* With only VMSA, define a 32-bit reg that filters bits from write. */

What do you mean by "filters bits from write" here ?

> +    if (!arm_feature(env, ARM_FEATURE_LPAE)) {
> +        define_arm_cp_regs(cpu, ttbr32_reginfo);
> +        return;
> +    }
> +
> +    /* With LPAE, the 32-bit regs are aliases of 64-bit regs. */
> +    for (int i = 0; i < ARRAY_SIZE(ttbr32_reginfo); ++i) {
> +        ttbr32_reginfo[i].type = ARM_CP_ALIAS | ARM_CP_NO_GDB;
> +    }
> +    define_arm_cp_regs(cpu, ttbr32_reginfo);
> +
> +    if (arm_feature(env, ARM_FEATURE_V8)) {
> +        define_arm_cp_regs(cpu, ttbrv8_reginfo);
> +
> +        ttbr64_reginfo[0].type |= ARM_CP_ALIAS;
> +        ttbr64_reginfo[1].type |= ARM_CP_ALIAS;
> +        ttbr64_reginfo[2].type |= ARM_CP_ALIAS;
> +        /* Index 3, TTBR1_S, is not an alias. */
> +        ttbr64_reginfo[4].type |= ARM_CP_ALIAS;
> +    }
> +
> +    define_arm_cp_regs(cpu, ttbr64_reginfo);
> +}

thanks
-- PMM

