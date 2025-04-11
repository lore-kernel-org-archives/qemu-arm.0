Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp350682njc;
        Fri, 11 Apr 2025 03:50:55 -0700 (PDT)
X-Received: by 2002:a05:600c:a009:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43f3a9ab087mr15046505e9.26.1744368655052;
        Fri, 11 Apr 2025 03:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744368655; cv=none;
        d=google.com; s=arc-20240605;
        b=SfZ0TIC3Hps7r3/Q61z38p/Hv/tVcLIxeumDZmR/sSI+GfDUzew8IbIv9LHsb3l5UO
         FpBUTEBVS5RthisBbT2tZD69nUvkYOyixEuJbuyaaoah25er7uAGvLmcjxAMucOAtsta
         ivuL2Edclmuqju/p1C1aXaQyAWFEVsT/aZSsJIS2cwhpfiozR4d5ktAYPMclpGp1tltb
         koBZUlXfFl9mlIoPcds/vw8NLNvwO6GCbuy/kb/HbXtV2V+j/XyvxrRhw1fQn++5prYJ
         3Gd4+RI7ptxbb3Ag4Wc20r+I4PMIsEwWqPRiDzvEJ07AzmqjVcQZwzdH0IE4QGTGI3V1
         GB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Iq9jjUjxQMvcNPRONFjv6Xn7v+b6NtpERTGuJsmABkI=;
        fh=RDkVV6McDzl5AGSWeQEYfMLoxwMSy8uHCupVGoJ0Z7Y=;
        b=hUqWP4TMC+iAcTa67RQxIODcRpvSN1T82kDl8Vewj29MsOdCyPhR5ScqbGxroRYSJb
         izIL3r74u6Q38i9+Kn8BehE0d6hxJQF0UjK1zt//x/w0B2xM6OP74iltfTBbYjoCC8Fx
         AAnGp0w54VlCwX9ghWrXkXK7YYstAHcp4i6p/9ETR25ZGtgLG9hD4kdqUM8ekkc6HyQQ
         uW5pbyWW6kr/SxpOqWVP3pp6/7NO3KHNLoVh7VRttvdcGcDEac3RQ4WYWQlz8vA/nrsi
         iCEpbEf2PYHAiZ6FbwGjAHc+Z3D85qfVdaLFbZoQH09wxLlnoK7w/rf5cUjkJBx31Seh
         ZvLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPL7z7GH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2358fbdcsor22756225e9.7.2025.04.11.03.50.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Apr 2025 03:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPL7z7GH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744368654; x=1744973454; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iq9jjUjxQMvcNPRONFjv6Xn7v+b6NtpERTGuJsmABkI=;
        b=jPL7z7GHUxTPhWBQ9x7VoQAfO05KS2xRhsbXQAPUP5HgXGkh+ih/5iJGOtaw0IkEuR
         bxGVM4WxhWzX/9j/8+0xVBzHlMYb6LP/bs9JQqRu/aVa10BoE059drrZ2y1PPUJpiEHc
         FYZTCYKLULV6HY2zf+z24fq7MC5JRmaaMd6NhpupbyXxsc1ezzk3z4uEZGS4vwUT7mSG
         qJdzDwqk+rUP44gj6lVlLZ9dDxIFqx22gx3/oT52/XFLldvh+JDA/RWG3xPN+G604V4q
         +ukdO/nTaz0Z7NeLF4fddk2bnPTlOe6PepFXkKkwuED37VQLUZogUNi2q1kcgW5rSPex
         vYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368654; x=1744973454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iq9jjUjxQMvcNPRONFjv6Xn7v+b6NtpERTGuJsmABkI=;
        b=CHCjW9me3E3ZzhyzMvZdjknjyXCvM+VAVq+CE0pfLD6pBiG2/cF39iaVMVWqfIVcXa
         rlOSU1a9VqaN1oLzJFneA3DmeEs9ZDYv5vfMtCa6/QqwqXFH+Vmd5ylqxvzUimAxm5Ui
         PU43OrwaohAkx9vzt921NQLtug3EFyNPZGvioW8ELx/7B2MWQwQFKOFD3P1lMmIb5WCb
         3zGUGqbgV3sprgGNp2FojyDD4C5L9LpfNrwt9G90hUKGvVaS8mQrdu/NvnqG9MNToEyr
         gZpqiHAgFNLXAqQNdnxYaYh6MIGf5+ltU39FgEgp5cQXbXaY0lO9oGcvPcxlKQWTfmZB
         sYXg==
X-Gm-Message-State: AOJu0YwQvB+01h4Uf6cY7OQJ/60en9dH2kDJmeAK3YjziAdv+V7+e9P9
	aNgM4nLv9l27v9deJBILAB0yNRurqziUuMFEltWN9/G4kIXsSoxUwWyN6IjR2hbvCw==
X-Gm-Gg: ASbGncvpCGs1s0FwIzmf3eWhh9ltf61xzONM4AnII7LgFU2K2e/WWx6zM/O7aKhRBRg
	dSMkAcbP1PdrtLA9Sq0xH7AWSKfJKMO3cv1J75QziCBUvghuGY/G+tr5vz32ZtqcKtZ6halj1N0
	zEkaXpAQAT/Cvr75B0XKjj1XpIL59V16UKvB8lwoyyTTCCyU02JlqdNKiVVHvNu0Z7vxtIwaehK
	7k/63cn6FhRElbgrD0ABQp5paQmXn2L3pvXNBOyn0rUaLV6HfPLuATENxWdYzvAmebbJMMrbsu4
	7UcWlUEYvRR4uuTVhgOtST5upE87rftBnlxvEe8WU2NgiEcufHrYSJZLG8uxsiw340soBDj2vRu
	UIKMF91HC
X-Google-Smtp-Source: AGHT+IEUzs9XR5D4XrEtui0VIUsz9arF4D9KrXvZlIBODeRZ6oSGMKZn1EOxR1kNn5qyfs2yYmKQQA==
X-Received: by 2002:a05:600c:384b:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43f3a9b1564mr23993035e9.31.1744368654276;
        Fri, 11 Apr 2025 03:50:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977fc8sm1620631f8f.48.2025.04.11.03.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:50:53 -0700 (PDT)
Message-ID: <264d9113-16ce-4c05-a468-78e1f9921df6@linaro.org>
Date: Fri, 11 Apr 2025 12:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] tcg: Add a TCG backend for WebAssembly
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XRP4dQQ4MXa4

Hi Kohei,

On 7/4/25 16:45, Kohei Tokunaga wrote:
> A TB consists of a wasmTBHeader followed by the data listed below. The
> wasmTBHeader contains pointers for each element:
> 
> - TCI code
> - Wasm code
> - Array of function indices imported into the Wasm instance
> - Counter tracking the number of TB executions
> - Pointer to the Wasm instance information
> 
> The Wasm backend (tcg/wasm32.c) and Wasm instances running on the same
> thread share information, such as CPUArchState, through a wasmContext
> structure. The Wasm backend defines tcg_qemu_tb_exec as a common entry point
> for TBs, similar to the TCI backend. tcg_qemu_tb_exec runs TBs on a forked
> TCI interpreter by default, while compiles and executes frequently executed
> TBs as Wasm.
> 
> The code generator (tcg/wasm32) receives TCG IR and generates both Wasm and
> TCI instructions. Since Wasm cannot directly jump to specific addresses,
> labels are implemented using Wasm control flow instructions. As shown in the
> pseudo-code below, a TB wraps instructions in a large loop, where codes are
> placed within if blocks separated by labels. Branching is handled by
> breaking from the current block and entering the target block.
> 
> loop
>    if
>      ... code after label1
>    end
>    if
>      ... code after label2
>    end
>    ...
> end
> 
> Additionally, the Wasm backend differs from other backends in several ways:
> 
> - goto_tb and goto_ptr return control to tcg_qemu_tb_exec which runs the
>    target TB
> - Helper function pointers are stored in an array in TB and imported into
>    the Wasm instance on execution
> - Wasm TBs lack prologue and epilogue. TBs are executed via tcg_qemu_tb_exec
> 
> Browsers cause out of memory error if too many Wasm instances are
> created. To prevent this, the Wasm backend tracks active instances using an
> array. When instantiating a new instance risks exceeding the limit, the
> backend removes older instances to avoid browser errors. These removed
> instances are re-instantiated when needed.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/accel/tcg/getpc.h        |    2 +-
>   include/tcg/helper-info.h        |    4 +-
>   include/tcg/tcg.h                |    2 +-
>   meson.build                      |    2 +
>   tcg/meson.build                  |    5 +
>   tcg/tcg.c                        |   26 +-
>   tcg/wasm32.c                     | 1260 +++++++++
>   tcg/wasm32.h                     |   39 +
>   tcg/wasm32/tcg-target-con-set.h  |   18 +
>   tcg/wasm32/tcg-target-con-str.h  |    8 +
>   tcg/wasm32/tcg-target-has.h      |  102 +
>   tcg/wasm32/tcg-target-mo.h       |   12 +
>   tcg/wasm32/tcg-target-opc.h.inc  |    4 +
>   tcg/wasm32/tcg-target-reg-bits.h |   12 +
>   tcg/wasm32/tcg-target.c.inc      | 4484 ++++++++++++++++++++++++++++++
>   tcg/wasm32/tcg-target.h          |   65 +
>   16 files changed, 6035 insertions(+), 10 deletions(-)
>   create mode 100644 tcg/wasm32.c
>   create mode 100644 tcg/wasm32.h
>   create mode 100644 tcg/wasm32/tcg-target-con-set.h
>   create mode 100644 tcg/wasm32/tcg-target-con-str.h
>   create mode 100644 tcg/wasm32/tcg-target-has.h
>   create mode 100644 tcg/wasm32/tcg-target-mo.h
>   create mode 100644 tcg/wasm32/tcg-target-opc.h.inc
>   create mode 100644 tcg/wasm32/tcg-target-reg-bits.h
>   create mode 100644 tcg/wasm32/tcg-target.c.inc
>   create mode 100644 tcg/wasm32/tcg-target.h


> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index dfd48b8264..154a4dafa7 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -136,6 +136,10 @@ static void tcg_out_goto_tb(TCGContext *s, int which);
>   static void tcg_out_op(TCGContext *s, TCGOpcode opc, TCGType type,
>                          const TCGArg args[TCG_MAX_OP_ARGS],
>                          const int const_args[TCG_MAX_OP_ARGS]);
> +#if defined(EMSCRIPTEN)

Maybe we can let this independently of EMSCRIPTEN, to reduce #ifdef'ry.

> +static void tcg_out_label_cb(TCGContext *s, TCGLabel *l);
> +static int tcg_out_tb_end(TCGContext *s);
> +#endif
>   #if TCG_TARGET_MAYBE_vec
>   static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
>                               TCGReg dst, TCGReg src);
> @@ -251,7 +255,7 @@ TCGv_env tcg_env;
>   const void *tcg_code_gen_epilogue;
>   uintptr_t tcg_splitwx_diff;
>   
> -#ifndef CONFIG_TCG_INTERPRETER
> +#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)

s/&&/||/ otherwise breaks TCI? (various cases)

>   tcg_prologue_fn *tcg_qemu_tb_exec;
>   #endif
>   
> @@ -358,6 +362,9 @@ static void tcg_out_label(TCGContext *s, TCGLabel *l)
>       tcg_debug_assert(!l->has_value);
>       l->has_value = 1;
>       l->u.value_ptr = tcg_splitwx_to_rx(s->code_ptr);
> +#if defined(EMSCRIPTEN)
> +    tcg_out_label_cb(s, l);
> +#endif
>   }
>   
>   TCGLabel *gen_new_label(void)
> @@ -1139,7 +1146,7 @@ static TCGHelperInfo info_helper_st128_mmu = {
>                 | dh_typemask(ptr, 5)  /* uintptr_t ra */
>   };
>   
> -#ifdef CONFIG_TCG_INTERPRETER
> +#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
>   static ffi_type *typecode_to_ffi(int argmask)
>   {
>       /*
> @@ -1593,7 +1600,7 @@ void tcg_prologue_init(void)
>       s->code_buf = s->code_gen_ptr;
>       s->data_gen_ptr = NULL;
>   
> -#ifndef CONFIG_TCG_INTERPRETER
> +#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
>       tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(s->code_ptr);
>   #endif
>   
> @@ -1649,11 +1656,11 @@ void tcg_prologue_init(void)
>           }
>       }
>   
> -#ifndef CONFIG_TCG_INTERPRETER
> +#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
>       /*
>        * Assert that goto_ptr is implemented completely, setting an epilogue.
> -     * For tci, we use NULL as the signal to return from the interpreter,
> -     * so skip this check.
> +     * For tci and wasm backend, we use NULL as the signal to return from the
> +     * interpreter, so skip this check.
>        */
>       tcg_debug_assert(tcg_code_gen_epilogue != NULL);
>   #endif
> @@ -6505,6 +6512,13 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
>                           tcg_ptr_byte_diff(s->code_ptr, s->code_buf));
>   #endif
>   
> +#if defined(EMSCRIPTEN)
> +    i = tcg_out_tb_end(s);
> +    if (i < 0) {
> +        return i;
> +    }
> +#endif
> +
>       return tcg_current_code_size(s);
>   }

Out of curiosity, have you tried to run a big-endian guest?
