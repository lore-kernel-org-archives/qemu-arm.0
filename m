Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2250024njb;
        Tue, 30 Jul 2024 02:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDG7iOMls1fpq5QNqpYzNm3yeqYhnvqJCpJt1SAnqotgY8+vkin8Ic8J0B6G6AjPgHYOzgNgb7r0yjgz7FPAnfchHgyFx8
X-Google-Smtp-Source: AGHT+IErMXri49FjehRPBvciWKiTy6AhPn3v4YOHyqTW1yoD3f5cOlIDsmxntEC4WJzCubBptQBz
X-Received: by 2002:a05:6358:2915:b0:199:2942:1b32 with SMTP id e5c5f4694b2df-1adc06b1e7dmr1342829055d.8.1722331860210;
        Tue, 30 Jul 2024 02:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722331860; cv=none;
        d=google.com; s=arc-20160816;
        b=ucGdp7tsZhFMBhdn0wkVhg71YAb7/JNLdOtTyRi4ScW3BCPJjhtFFZNtpuh/dKx1RA
         SwKCytHVcBdtQbMFBRZM/RYc0f/OmNpnL/MOPNFnjSjFLnv4orKLLqR6GL6Oax0BmeVy
         rKme3O7/MGaR2fmO4B3xz4oJh0dFnz2JEedZDMNzEtfdHhwoX4+m4gEadIYi3BcicIhg
         eG+N5jJrJNoc/GWbmCRfJ36DnHvz8aSF2XI7o52fouBCzHeF+6FBUPyvC/34V7CQpMhD
         ibCE8u+xkPoCmgYLduEfWhKCmbSvBkqNIUGFCYksaFSfbDEthAj6nm9OKLzwe5roLhwS
         Zafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uNsh7c3255rTpF65wyORY+h4ndviNnkJbAViEsxA+Y8=;
        fh=fHg0aJkky26KjsZEYL1ZKsw02Lec4pFzdkgJc+nKs7w=;
        b=R5MdU8XlJ10HBDOHvy6miW8l2FfDPriCIlL2QpK+3yGIycwMnSwVJPWAHHVpl/rnoj
         WJpwXQjgmECkmcpGvoXwFzVBx3V+JGBF4yNYkMvCyRYgizIZyqIU11TrX/OhSlO72+4I
         rT7FoLFEo2Ta3QtlYSRtYycRPjEy70ZxyPZDNNYh4CrehifxBwlaDlGrZ1MLhSRRHmbV
         kcNfQHy+b2pBi4gQVQMmudwZcsQu0vJRt4nvEjMMf9V3Q/L4jxrdivwTMJpU7lN3Wa2s
         vwbko6vsl1K/y5hHiZNkNxVfS8N36usyhl4RDbspGKu3O//NywARAeLxISpkLDpITz6t
         FphQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oivESpYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb2bc20si124137966d6.614.2024.07.30.02.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oivESpYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYjBh-00042a-IV; Tue, 30 Jul 2024 05:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYjBf-00041Y-JE
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:30:31 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYjBd-0007GA-Vt
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:30:31 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ef2cce8c08so49400291fa.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722331827; x=1722936627; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uNsh7c3255rTpF65wyORY+h4ndviNnkJbAViEsxA+Y8=;
 b=oivESpYB5HHXJu2Zq/Y6rkDvFFWl7UjLayoXy4A1bTfj/5q+mn9qiUw+szSJK0w4fS
 +GIxUDsz+G1uovQh0ULoRDOdR00hDdF8oXpyy4LAv4mc4d9GdHJt/HpfdfcjDClyvCDh
 QsTBw4nHK8W/TCJrPCrSUIZL5/3eT9xQ4CBees5zZMDcaUCgbOTYnkSzy2Pb0BXvZ8JH
 Q2vij/gk7P2edjwhrx8dNOeTozhe9YU0RdleUAGpGYsApG+87pHaad2icb8YWWC38GhM
 HhHlKG9mJ3vh4j2Z7harXcu9a1y3AUwyuSdi+7/Jc8X02W8GGIlfabwN8n2Nx9TnM5GP
 HCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722331827; x=1722936627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNsh7c3255rTpF65wyORY+h4ndviNnkJbAViEsxA+Y8=;
 b=DOYQm+36fkjpC9Us/2QnXE0BjrVHnUbN+N2Q4yBbZWGacrvfytVEeJQ+uGtquTo0do
 8+Odj1r952UCThSOb6i4R+Md9LQwMGTODI9cZ0f39Tr8bQ8EoKxqXVZ/LLpAkf0Ag9x6
 vHghF1LpNL6dntJJuL/zkQsTjayBY5ZH+3lQYoc2BjzRskIVIyvg+nmnJHvRMKSb6HJo
 gZmkgUfX8KPEAQ2AfrwAGxKXxFtAw8Thnd0sI0nuwBr66XysXOZ9W38xAObeTeb1hE3G
 OXALEQqj4x1ZmwMdZ0Jf7LYF7c9SheLVQqmL0en+BFygmVQkjRQl8RTQbRC1ByjbkYcV
 mrSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQFg04DKT1XALVWgDo2U3+BzbvNHhcUIgNUyQak25xzrVYSZBXWKgUNS9rGzvIFDP9y1R/0LVxuP73wJJADKkNI7W4
X-Gm-Message-State: AOJu0YzJEdCZkrNq12Lpdn6J4NXzA1TRG2GTBA5f7O25cmG61r5l/B4b
 X7//7NLOlSS6lvoBwddlQSrFl2/Mifv+ZBPVR6WnkBMDXfgb8D7dPD49kR+gDdng///k32bSB9p
 Sh1mPUzHwiEU9q2xtpQ9Srvu8UBdL+6RlJqUuSw==
X-Received: by 2002:a2e:a176:0:b0:2f0:1d51:a8fa with SMTP id
 38308e7fff4ca-2f12ee5bb0fmr70569201fa.30.1722331826805; Tue, 30 Jul 2024
 02:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240730013922.540523-1-richard.henderson@linaro.org>
In-Reply-To: <20240730013922.540523-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2024 10:30:15 +0100
Message-ID: <CAFEAcA-yuy54nnuoa_B32UpKPtfhRmo9sd1N7eYKSz4O0PC7qg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix BTI versus CF_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1muAVACKQbNG

On Tue, 30 Jul 2024 at 03:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With pcrel, we cannot check the guarded page bit at translation
> time, as different mappings of the same physical page may or may
> not have the GP bit set.
>
> Instead, add a couple of helpers to check the page at runtime,
> after all other filters that might obviate the need for the check.
>
> The set_btype_for_br call must be moved after the gen_a64_set_pc
> call to ensure the current pc can still be computed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.h    |  3 ++
>  target/arm/tcg/translate.h     |  2 --
>  target/arm/tcg/helper-a64.c    | 38 ++++++++++++++++++++
>  target/arm/tcg/translate-a64.c | 64 ++++++++--------------------------
>  4 files changed, 55 insertions(+), 52 deletions(-)
>
> diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
> index 371388f61b..481007bf39 100644
> --- a/target/arm/tcg/helper-a64.h
> +++ b/target/arm/tcg/helper-a64.h
> @@ -133,6 +133,9 @@ DEF_HELPER_4(cpyfp, void, env, i32, i32, i32)
>  DEF_HELPER_4(cpyfm, void, env, i32, i32, i32)
>  DEF_HELPER_4(cpyfe, void, env, i32, i32, i32)
>
> +DEF_HELPER_FLAGS_1(guarded_page_check, TCG_CALL_NO_WG, void, env)
> +DEF_HELPER_FLAGS_2(guarded_page_br, TCG_CALL_NO_RWG, void, env, tl)
> +
>  DEF_HELPER_FLAGS_5(gvec_fdiv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_fdiv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_fdiv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
> index a8672c857c..01c217f4a4 100644
> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -163,8 +163,6 @@ typedef struct DisasContext {
>      uint8_t dcz_blocksize;
>      /* A copy of cpu->gm_blocksize. */
>      uint8_t gm_blocksize;
> -    /* True if this page is guarded.  */
> -    bool guarded_page;
>      /* True if the current insn_start has been updated. */
>      bool insn_start_updated;
>      /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> index c60d2a7ec9..424fe927b4 100644
> --- a/target/arm/tcg/helper-a64.c
> +++ b/target/arm/tcg/helper-a64.c
> @@ -1877,3 +1877,41 @@ void HELPER(cpyfe)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
>  {
>      do_cpye(env, syndrome, wdesc, rdesc, false, GETPC());
>  }
> +
> +static bool is_guarded_page(CPUARMState *env, target_ulong addr)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return page_get_flags(addr) & PAGE_BTI;
> +#else
> +    CPUTLBEntryFull *full;
> +    void *host;
> +    int mmu_idx = cpu_mmu_index(env_cpu(env), true);
> +    int flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
> +                                  false, &host, &full, 0);
> +
> +    assert(!(flags & TLB_INVALID_MASK));

Is there a race condition here where some other vCPU
knocks this entry out of the TLB between the point when
we started executing the TB and when we made this helper
function call ?

> +    return full->extra.arm.guarded;
> +#endif
> +}

thanks
-- PMM
