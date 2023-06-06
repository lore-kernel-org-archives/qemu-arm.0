Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3540324ejb;
        Tue, 6 Jun 2023 07:47:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79jvJ8odth2EdeWAdlnhLa/ND0vE/dUbCMM23V+ICes+K7DGnTd/D0n0V2wruKp/dBtWpu
X-Received: by 2002:a05:620a:1b81:b0:75b:23a1:3629 with SMTP id dv1-20020a05620a1b8100b0075b23a13629mr1912957qkb.58.1686062852914;
        Tue, 06 Jun 2023 07:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062852; cv=none;
        d=google.com; s=arc-20160816;
        b=X7/cfdPuJ7Pyz8PvlNRzAX6wiU4i0Vvaf7gRMsj+XG/FEKJNtfocBYKqG+9W0z6n/Z
         3n/+dYK2tkRa6o9m4c62CGMAP1asbIXbccCWxwnT2hIgdeFglL07j5ovdYxjAOAFJtaV
         1ne+AdvVWcHa+OV2taBqTPbXrEZZhnTkY7BuYfpJZWiIx/EYU0DkT9sX4r1rxCsJuLq5
         63e22NZBBRb44FC3+dXxeDc0KPQGLElP1qJCZOe42c18WbxD42l3ga3nTNggITz3B0d+
         OfFJBxCsGRcmQ+DUkluGC8W7wLx5mA3LMIqTdtGnNMtvh4Ts/ZpywX+zlSrpnZeExt0Z
         FFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L37G/UpRFPDvK/5tOtKP8t2IzAdWmUCIXxNGGLU2uko=;
        b=MPeH2dNvByTYomUEqwRUUFhWDQdUgUyJPZD9sS7dHOn6eY0hQBFSZ1tJ1QfHBPaXDB
         FLwLECTaN8+MA+TOTcxikeclocQipi9ItSdYgMy1AhpyiS53rJ5EXDMK282/neGwgM9Y
         IS9/JjJB3T82248pc/ZrtLhWKEmbb+83SVSpPzoJE8eH5WUkHYA38cuqKv9XZbroR1E4
         qcVk/obuMSfaUxTI69WMQ2W8+mUCyT2KFMVYsmtPVd5jvoMs2yZhCOYuZV1EEhnCwGe9
         KTem7zK4E8pA5Ij+4+yNvbaBoHk4yOu5jDhs8igVjKZ6ayP92AOJlaptVF9sZypLS61x
         A61Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T8vfjlV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q25-20020ae9e419000000b007594108539esi5959130qkc.125.2023.06.06.07.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T8vfjlV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Xy0-0002Ok-WB; Tue, 06 Jun 2023 10:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xxu-0002NQ-J7
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:47:18 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xxr-0004Zi-4c
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:47:16 -0400
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-33b36a9fdf8so24737695ab.2
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062831; x=1688654831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L37G/UpRFPDvK/5tOtKP8t2IzAdWmUCIXxNGGLU2uko=;
 b=T8vfjlV7OfKpPU2lmzALcSf3LInmDZEaYNKC3Brd2nwa/JH+0VJ+0wKrmgk2k/ZScN
 dW0o0oYsJxS3jOrunIG6I2JxSg3OE50zvYCM8NY/mBnxaQb/7Z1j24//G1ugfDDybuU/
 d5u39peMcgOniEzyreSxd+9hbtZB8SV7WDQD/CUSUPQHTWYePdUo4C64r0NRexTIEm0p
 ck0hdZD3wXVKXxTYfVug5/9fgcjFPM35pUoS+24C8YrkA5gFAEs1kkO9zcyJEfiTNTm5
 rMkY07AlDgza+gtYuXDVGmRUVxf0CkC4m49DrZ9E/rwwVNTTNyo2cxpHyg3yepw/ptvK
 ylYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062831; x=1688654831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L37G/UpRFPDvK/5tOtKP8t2IzAdWmUCIXxNGGLU2uko=;
 b=kz9c9cZSBF2Ad37p7SIpZ+Ek3TK+apUJ3rswNSSC3pvkal39Wdm4YPvT3ShjxyY79I
 fySGwBxQsFYpJ7ptNci+NJTMXMUi2j/K5PA99EYLna8s6lHdkR4pm7J7IRAgkW5vmGG9
 RfYNnQz3NYCCX1Gm/tI52mwX+gUVX4Fb1Vo380x/Ql+0haKA9cATL+8huapUnyUTOBnX
 ItQFBiMIldCDpwYavpTViSd/3tJPQHGAS0qXWVJf7boJiktxME7K6alsQFH7gjyTkUbb
 vQjoXtE8k92Z0R/68jxep9fjaZwG7STiCgVPXSPVw5ibf7SZwxrlM/U0H4SSZSENpTK2
 v7/Q==
X-Gm-Message-State: AC+VfDzgMzQKW5JDaBZo3xI6bS0o3UK8R9J1ihQaykFgOEzG4ThfIVQY
 uEkbT+PkQXP+XAiL3BUITuAnHg==
X-Received: by 2002:a05:6e02:810:b0:33b:1da8:a7d0 with SMTP id
 u16-20020a056e02081000b0033b1da8a7d0mr3252043ilm.29.1686062831137; 
 Tue, 06 Jun 2023 07:47:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a635102000000b0053efc8ac7e9sm1880657pgb.29.2023.06.06.07.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:47:10 -0700 (PDT)
Message-ID: <690f0d7a-20e3-100e-e8b2-3228583c9bdc@linaro.org>
Date: Tue, 6 Jun 2023 07:47:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 2/9] target/i386: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4OqVtkIwFqYg

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we *might* have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 5cf14311a6..750253e679 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -6915,7 +6915,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>       dc->popl_esp_hack = 0;
>       /* select memory access functions */
>       dc->mem_index = 0;
> -#ifdef CONFIG_SOFTMMU
> +#ifndef CONFIG_USER_ONLY
>       dc->mem_index = cpu_mmu_index(env, false);
>   #endif
>       dc->cpuid_features = env->features[FEAT_1_EDX];

Alternately, remove the ifdef entirely.  The code is well-defined for user-only.


r~
