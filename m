Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5850CFF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:24:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABXM-0000AP-Pf; Tue, 07 Apr 2026 14:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wABU2-0003uc-CE
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 14:49:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wA0Pr-0002KS-Ov
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 03:00:05 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-35d8e548a05so5120425a91.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775545202; x=1776150002; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zwz1OAcoIYEiS3L7Ec1+/nQRcD+yZ1KoYfuQkZO5SoQ=;
 b=zs2+003IGRbbHnF4usqBGnDZchnX3O1+t4avA1PwOaKzbc6lPfsmN+meqMsX/QG9be
 +ZJ3yMkDol0SgL0HQuRqy8k1hyLrL+PirO2UXa5Ypw2i6vDcuqEW+IsP6GbybKNZegkL
 tsnqyyU41bdR7LjIgG9Gqeaj5HhLJ//O1t8eRbb2nMTBdbJQtYiJ6H+FvHYeOUJYivAi
 eN7vk7zzu/KPIWVtnW6vWDAgMdiHshAOrgPIMldvbnE5IxmbnNw1xf1nLNl/N6iS8j3q
 Du4+/tt67vZV0LwLWS9tG8miNSlC+KLbA3DhFDu25/mnAa8K4PyG9cKZVvBYndDQ6U2/
 Kyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775545202; x=1776150002;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwz1OAcoIYEiS3L7Ec1+/nQRcD+yZ1KoYfuQkZO5SoQ=;
 b=W4Vk47Gd3msOCGO9qJ69mBpOCzSyox0AddaYeE+n+YY+8bcECyON8P7tKwJT0+Hdo8
 fn4Imez9fVO9C+bf2QdGP99v5/IRic4pEBrhaC1jl/FcC7W98kVJqMaBR1ULz0Kw7ZiV
 bpDtf20XcPB8gocF3kEfef1wsoyyKybfMWC9FHHpdWMEfxwhH48rRvDyu6aNNxf6ilSZ
 pmLvu8tzSiuwAoReJY+bG6/uJnK47E/IOp8MOdXhzkYaXM27G1It3+21PkbdyYwxOrml
 QhU5Daa/U56piKOGy/jm5LF3b6Yrqo/5uplT50q/ez5tcJojmGEsCx8V/M8kf9XQcu35
 EcRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQBF8mnOVj7jJORN3FhmAC4K5EDI1jRbikFW3iq4fEfJZjQ/eeGL9Dbxm+eK8TapwGeDa2iMW4Bw==@nongnu.org
X-Gm-Message-State: AOJu0YyTAB0HAKWPkJVC3H4cZ/cOCpvfqOPOhEpi1q4Gs7nDDY39dYwO
 SiK+Z7s7juDQityf4jfU6XTcPuCyE/h3nHPmbLUfk5xPFV6khqsYgQr6uegntaFw6Ks=
X-Gm-Gg: AeBDieu0rHOnoEKKlyl4TyYw07Q/TwAF2zA7hBwwBXmzm+mriwvOv8JiWmdWg3c545H
 wusN3bLbiV2zeOBYikOozVbI1xIGnS7GwQ5BOI/KLoqLAqb4XCwfBeA3DK5PtPT8dXR2suZM+T/
 8Mz1bwlDNHE/4mHLsqd8io0RrmeVUK8h7GaTEeufvb/LE3nd8uMKbQdA1BSwZcCHyCgAY8fuVAy
 ybl9VYiJ0dUyTj5XJ1ympeDhBxBEPFwr89kNR2coRW85jUZSn8iuhYZUfGUVeDpXiqykBIfdcN8
 PiVAxqG/d6BWrGq4WsFbJHnvmtIvptsmdTX/epy0/ITR1sW9Bg8M/X0dg2o5uOuNwQJOrbbfOji
 Ely7rJ/Pb/SNB+zcXXqyHBprVMjgqPIDmJW5KhxuP+hCoyVNJQmo1WkdbuZeBDOXQztDJz0jLWz
 eA0UdoQ0e+ve53ZJ46wxQOYIh65HJCYZrvlcvudnNpQ9phIt8sOxYToZDwmkkZOvQcaSw=
X-Received: by 2002:a17:90b:39c4:b0:35d:a2d3:5c2e with SMTP id
 98e67ed59e1d1-35de6956185mr16071351a91.20.1775545201729; 
 Tue, 07 Apr 2026 00:00:01 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe623754sm21036713a91.6.2026.04.06.23.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 00:00:01 -0700 (PDT)
Message-ID: <4c80af84-a0d8-4f1d-9fa8-4c3b38a5559e@linaro.org>
Date: Tue, 7 Apr 2026 16:59:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 18/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-19-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260407022748.57629-19-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 4/7/26 12:27, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c           |  6 +-----
>   target/arm/tcg/translate.c | 11 +++++------
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ccc47c8a9ad..b62de8addff 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -828,15 +828,11 @@ static void arm_disas_set_info(const CPUState *cpu, disassemble_info *info)
>       }
>   
>       info->endian = BFD_ENDIAN_LITTLE;
> -    if (bswap_code(sctlr_b)) {
> -        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
> -    }
>       info->flags &= ~INSN_ARM_BE32;
> -#ifndef CONFIG_USER_ONLY
>       if (sctlr_b) {
> +        info->endian |= BFD_ENDIAN_BIG;
>           info->flags |= INSN_ARM_BE32;
>       }
> -#endif
>   }
>   
>   static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)

With $subject, this should be split to its own patch.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 1fbe41ec643..5b6a80930af 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -6283,14 +6283,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>   static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
>                                 target_ulong addr, bool sctlr_b)
>   {
> -#ifndef CONFIG_USER_ONLY
> -    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
> -       within each word.  Undo that now.  */
> +    MemOp end = MO_LE;
>       if (sctlr_b) {
> +        /* In BE32 mode, adjacent Thumb instructions are swapped. */
>           addr ^= 2;
> +        end = MO_BE;
>       }
> -#endif
> -    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
> +    return translator_lduw_end(env, s, addr, end);
>   }
>   
>   static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
> @@ -6531,7 +6530,7 @@ static void arm_post_translate_insn(DisasContext *dc)
>   static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
>                                target_ulong addr, bool sctlr_b)
>   {
> -    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
> +    return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
>   }
>   
>   static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)


