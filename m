Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8810F9973
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYQB-00058T-36; Wed, 08 Apr 2026 15:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY0B-00052P-I5
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:51:47 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAEAC-0001yp-BP
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:40:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so13193675e9.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775598046; x=1776202846; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FfqLbAzrcuCJ93PVeTNHQ0kvpELMYTpCmudcwnw4dX4=;
 b=v7OXIpzMcJIGdGpEcKIZ1YqxMd6q5soy9FQ/YakuvbaBkcYJY6/ELgEKgHVuuZeaMe
 yebo1ianIuKeZGXVcxNfl3hv3IUJ+b9Yks0Jp2Ef6mCx8gg255c7DllXT7XT0dJeTHQf
 WfMZnXMBTgyRtcF+Zyph5TVhv3AXgFMs0Vxd+bOdijKjHseAkFv/yTtzbgOObhPET3oZ
 oNuFmUMN/zJy+AQT0ihVysLEOl6/tqJbMb8yYgQgV7/lT9ornkheR5BMog2K4zXDyM9m
 d6u1P2b3oySz3jEww1KWLQgoJVS8MB8nO4q0bX27DsDcPPIq9rmStDdfjYSK/zNuihox
 xB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775598046; x=1776202846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfqLbAzrcuCJ93PVeTNHQ0kvpELMYTpCmudcwnw4dX4=;
 b=b7b1kepdqwTJAudo2a0P/qtjo0HWT6JbgKOYtSPR9oMGuVUVrmdUVnydRilaTIdDMz
 oN0t4titsE4x3acjuxhBRQG20QUY11AUSYFuqSXHwsKtVvFSQVA4S0dZ29h9O4IkDzxn
 iur0yYYutPPEuVn7wRlREhX2ZXf9G6M6ToqlKPJz98bJak4bS0TGnJ8E/kCwdh9wKtxZ
 Q2F97yLNJsETOr3FuqUMC8kb8S/oumz9AULVEeAA6dEYCGL3H7R00TFUMIkFRtakt0R5
 6P4PGd3p1FQWI0HNTtay9wAgtUv/SWsMBroAr9rjBZqlDGOSXcJ4AEqLxCq3ZK7KBRqJ
 F3jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVty8OBWyUnFS7hIrMVderAJCyrpra5SvRX68KYTxIY8WyBofQxY318oVD9vxZH1B0qo8ld1W4k1g==@nongnu.org
X-Gm-Message-State: AOJu0YxB5d8sx0mUrN5LP7VBeXo+Tl8FSOuTKA9Guu0lrEVtnu6zN9Hf
 10faOEmo9a0TARM+tBPjBzSxWHcuC6qxEE2k+5bOyZnAwyPE/nR3sII8Hz0aYyb1/kE=
X-Gm-Gg: AeBDiespT1mwqqiMBxNeV558+5K9C4opoq6rYSQj2JJqP50hVIpFxUcAyV3HuvzJ8tg
 JAnwJsim1G8kihAT3vjcExN7yaib7YN4KgXzglqG/Lh2A9iE41Qy9N1vX57Y5GYZDWA3CoQGzb3
 KCfr+7GMB6wUV2ldsnN1z7fnEsno3mdBP2yyXPlhlHylRJuY8HwBJt89vzAXKxcfm6v8UAHncmN
 pXHvnjF10k7CtH+ZdMyht+85t7OxpQZjMHR/uZWSSF7QiNWPSNdDh9PHn7InseJdW5RHnsaB2cO
 3uGJNq8L7+2H7Vm6ZYfRMaVeB9iinPwq6Y+PqDXxnty8Rzuun8cEgo1d+L7OK1BqeYENvOSBkEY
 9SOBwa5HC+5IixGrMfXLXuGKbCwHhx/XLsDDkglA/9LfGQBy+ypud7B+8KPLQDxG+Bg7Vjko7IT
 lAMZ0CVVgWrjS/aSJzilvezk9lC2mwh9ejjsu0pzoLEtv0PcoHGGq4LSrTeORYCIxEoA==
X-Received: by 2002:a05:600c:8b2b:b0:485:3a86:6392 with SMTP id
 5b1f17b1804b1-4889979a89amr250421585e9.20.1775598046294; 
 Tue, 07 Apr 2026 14:40:46 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e829c43sm560061675e9.5.2026.04.07.14.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:40:45 -0700 (PDT)
Message-ID: <3718ca35-2035-4e62-847f-71c546ad194a@linaro.org>
Date: Tue, 7 Apr 2026 23:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/21] tcg/translator: add parameter to
 translator_loop for current addr type
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-15-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> With TCG_ADDRESS_BITS mechanism, it's now possible to specify which
> variant every source file is written for. Compared to before, it means
> that addr_type will now vary per tb translation, where it was constant
> for a given target previously.
> 
> Thus, we add new a parameter to translator_loop().
> This will allow us to convert targets one by one.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/translator.h        | 4 +++-
>   accel/tcg/translate-all.c        | 1 -
>   accel/tcg/translator.c           | 4 +++-
>   target/alpha/translate.c         | 3 ++-
>   target/arm/tcg/translate-a64.c   | 3 ++-
>   target/arm/tcg/translate.c       | 2 +-
>   target/avr/translate.c           | 3 ++-
>   target/hexagon/translate.c       | 3 ++-
>   target/hppa/translate.c          | 3 ++-
>   target/i386/tcg/translate.c      | 3 ++-
>   target/loongarch/tcg/translate.c | 3 ++-
>   target/m68k/translate.c          | 3 ++-
>   target/microblaze/translate.c    | 3 ++-
>   target/mips/tcg/translate.c      | 3 ++-
>   target/or1k/translate.c          | 3 ++-
>   target/ppc/translate.c           | 3 ++-
>   target/riscv/translate.c         | 3 ++-
>   target/rx/translate.c            | 3 ++-
>   target/s390x/tcg/translate.c     | 3 ++-
>   target/sh4/translate.c           | 3 ++-
>   target/sparc/translate.c         | 3 ++-
>   target/tricore/translate.c       | 3 ++-
>   target/xtensa/translate.c        | 3 ++-
>   23 files changed, 45 insertions(+), 23 deletions(-)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 8d343627bd9..c1d31e06b53 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -20,6 +20,7 @@
>   
>   #include "exec/memop.h"
>   #include "exec/vaddr.h"
> +#include "tcg/tcg.h"
>   
>   /**
>    * DisasJumpType:
> @@ -132,6 +133,7 @@ typedef struct TranslatorOps {
>    * @host_pc: host physical program counter address
>    * @ops: Target-specific operations.
>    * @db: Disassembly context.
> + * @addr_type: TCG Type for addresses (TCGv_va).

"TCGv_va" confuses me here, do you mean TCG_TYPE_VA?

What about:

   "@addr_type: #TCG_TYPE_VA for TCGv_va address expansion."

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


