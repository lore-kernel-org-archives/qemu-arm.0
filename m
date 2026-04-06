Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D9FB5164
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 21:30:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9rVs-0005rG-5T; Mon, 06 Apr 2026 17:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9rVp-0005qY-35
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 17:29:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9rVn-0007uk-DE
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 17:29:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-35c1d101355so1713336a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775510973; x=1776115773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1+ZA3mJ+dkxZDGbfQcl9W2KXROsAbfmH/9I+QFUjReA=;
 b=OlKJTc8UszJ5RwvdLMUgQ4iSdlVewSZ6ion/S9R5UwqVqenGPowqt+guJrbluOKuS/
 cveFWkgwihtpj4bF7tvPGT357SWb+15rNSiaviA0/fqkL+FePRPu4sT2hCD7PVGQoRIX
 AJ2JI/jdSiLlkamJVs9/Gc+I7dNxJqPksuip0RURyr48qUNobvjtF2m6Yrtlf7u1MfYg
 Lw82T/PMmqVuroaaBRl4s7qnVOV7DichWlwOs3iEWAFILJQMeI0spczZVQWI1sXDF/Ya
 wUZwuyer68BBPNZZwstMC4G9sN5KWO5euSjIR/Aamrb0UNye4GZrzw32N2bv6tbNkpC+
 7vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775510973; x=1776115773;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+ZA3mJ+dkxZDGbfQcl9W2KXROsAbfmH/9I+QFUjReA=;
 b=Zj/OXqu4kOchWWk0qS4vIirjOPl5HnyTeasThufQPvzbBRvwpAEhG6HkNc0773GObG
 4I4ih0eCccggE8DDkZxjER0dK+EseIlWF8d9ng1ECpgvxtd/N7o0PvVGDxkykWKV61RU
 eJvn+/5F8hjynyPLGlwCLfbVez3qvyRa7dnS3AxPKBU06r7HGgqEuJO+Fj+quSmz8rJm
 vwsmN9vMWNZ3GKkHDRsi9XsyOYgpqr0yhVJh1FE2kIggEHI6IZF89a5VsWZqfgP7RQQT
 GNVK/mDvMCc0IvRPLfXmgK5rMC451/haaXht/QHmrmxJJkVTpIwnA1re2QjKvtvNugqk
 MAeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPRMbgC2fJ6sE9sYaXnbRt4vf89jRn87N+5OIJoR5Xm4YSDgzswDFjOwS0N8Ntp1OXuxb2cBgNCw==@nongnu.org
X-Gm-Message-State: AOJu0YwnM+IAemyvyCcaCo4ZYd2zv2q/uj48G5kDrxUQL4t6U/15ak5J
 7LuHGJ3WGoYMtPJ1x/hj+OjLi3hG7PlsBqnLC5/DH29cQU90qzAi87sx6EjGOUQ3kxM=
X-Gm-Gg: AeBDiesN3zCj3lIya4vqZnPrGQoUDm0goAhGXZF6cWrWVnFhx+Yt9K0Y34UMVvxUWyT
 jdxpgIjjfZTDlqNfJjFjUbQWp53Z4ITB3771SmgNpKB3+sIIrKlfH7qVN1Mq6v++aQOIr3i5ZTQ
 BIjZIUrbl3Ux5dYbFimUVJpkXGCuKQ9svpd21eHvihDBzzMoWrDWkQWJuBQs27L7e5/eGNLjoQQ
 EbV+gDN77wK0L0kHdwHlfKAyDM8p6EABjef+K9GGtIauLgTDMhr2WZYa0BT/+GRtUjckjmhtLQJ
 2RGDRQ4b3FtkyPn9/nPdaCSEFiiK7N+rI+toeVRrDKvVuKdS2EcWKDqHU+4/BDQH8yN1qrw9eYc
 2s+saSboXg+4VCiEVtldxtVcX08NAZ4wpa2/W/YRgaJA5hkEBGFSnhuh8s3fVD5orYTGZZqTBnQ
 x8UeiY5hSGOym1966K6uSFoa5RIgi6zbIkjXTBTEm+jc9CKbfhYu5Ll6qrhdqZEr+tdIzDqni24
 ddQ7w==
X-Received: by 2002:a17:90b:4a08:b0:35b:9896:cbcd with SMTP id
 98e67ed59e1d1-35de69b03f4mr13310777a91.27.1775510973287; 
 Mon, 06 Apr 2026 14:29:33 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35de4fce05fsm5266086a91.0.2026.04.06.14.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 14:29:32 -0700 (PDT)
Message-ID: <6fc3e58d-16b9-4a09-9889-3b739f78f106@linaro.org>
Date: Tue, 7 Apr 2026 07:29:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] tcg/translator: add parameter to translator_loop
 for current addr type
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-14-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 4/7/26 04:26, Pierrick Bouvier wrote:
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -121,13 +121,15 @@ bool translator_use_goto_tb(DisasContextBase *db, vaddr dest)
>   
>   void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
>                        vaddr pc, void *host_pc, const TranslatorOps *ops,
> -                     DisasContextBase *db)
> +                     DisasContextBase *db, TCGType addr_type)
>   {
>       uint32_t cflags = tb_cflags(tb);
>       TCGOp *icount_start_insn;
>       TCGOp *first_insn_start = NULL;
>       bool plugin_enabled;
>   
> +    tcg_ctx->addr_type = addr_type;

You should be removing the corresponding line from tb_gen_code.

> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index 4d22d7d5a45..24c556bffc0 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -2953,5 +2953,6 @@ void alpha_translate_code(CPUState *cpu, TranslationBlock *tb,
>                             int *max_insns, vaddr pc, void *host_pc)
>   {
>       DisasContext dc;
> -    translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base);
> +    translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base,
> +                    tcg_default_addr_type());
>   }

Use TCG_TYPE_VA to match TCGv_va for the compilation unit.
That's even future-proof for arm32 when TCG_ADDRESS_BITS changes in the next patch.


r~

