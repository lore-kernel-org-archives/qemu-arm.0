Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA25BEB2700
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:19:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpuCy-0007Ee-Tt; Tue, 10 Feb 2026 15:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpuCx-0007Dt-4Q
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:19:39 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpuCv-0000Sa-AW
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:19:38 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2aad1bb5058so13829825ad.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754776; x=1771359576; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8A0p8XkZmyMhYbKZktWyakNNU+WLUQpbvCNmbLPKmY=;
 b=BGeZR1xvWFviYmmAtmjGZGgkcvNcmXGOpGJS8HTzgREEsGJrOKpGZMJ1aB6JLpLuVJ
 eORnop6KX6mFiTYujRSjVJ98mXpAJBeTtsmmRbE3E5Zxr68KuX6pqVP07eam5i0rUvp6
 86IXqqJgHfXrcPoMpAFY2KRi6texEsH9LTTSVmqTCTZV1BYW3HCmFVcDjs8XxBvKtTlr
 Ldhea0iB9ARK+mN/9toqor6g9HEblBFQAIXuOUOGAnoUz+F5BJzgkSoRZ3wChHh2hCxB
 Gm+kZcm0qpszszUhRcSC8HYyBSE52ePtPiX7LNgPTtkHzza8gr0EeJswzdhIfx4GAU8Z
 NJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754776; x=1771359576;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S8A0p8XkZmyMhYbKZktWyakNNU+WLUQpbvCNmbLPKmY=;
 b=AC2cPHTeHMpY172UYTQMQoYki4QFNXlcPNzj4Q0ucTRfNIGJC5oeABPBj6x2x8ZSM5
 I0uzivUfhPhmgjRO3E028+F5GogvcI5xLomvphyC8SjteQ05kjmBR/obwdV/R3iHqpCK
 +OLP5kVgNjmo1q4jmIjjlPdpKuEFRcmon1Ik3/9fmM7/3F1kP7yDs/Z3FJ+DnYp9LPsI
 3MGxeHl0NIhGSTGJ6CDBwfZihQB20Xnt5sdA1yiASKB8XQ6Fboy46sM3csBolcUOeuKR
 0OScZ1+tZf2/rSsOhuWJn4HZcN4UNIlJk391KJgM/0BASbMWf1dJtObnoyGo8Uecp1RR
 rp1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW940ZcqmSsZb8sJ+Y2+CPRLE4zw4OyjrvjMgma+d87YbSVie82rXDu6JhVzJIUxPrG4T7I8SwibQ==@nongnu.org
X-Gm-Message-State: AOJu0YwsS2n4maSdzsazM39mwwPuhkTt4J+d4fkLmOzzFCBiAY7nDZ5o
 JRxhgqY3/8gBryJSyclkDDlH+ZSBQ7TG3AfuqublIlW8ut+mj35uEk1rmdMVDfdT37k=
X-Gm-Gg: AZuq6aIeCqVAo0l4W57hjh5RC8a+ecEBpv+jontCnrKYOXFECkbLDBDiVwbt3k/CEiW
 zm/laufH5px1h+SDXci4ulPsWe4wBhK8FKo8hUrjguIjeelnXsE3+kLbCuef+8Ci7qmLIKz0Tgx
 sqbOCHiTJIQ+I0DMiP575AyklJ+mVhdkdGwbtkiBOGupZ5JIzvz5Y/kTmtTWdbjRuWNU265k4vz
 bVXa7A9Mj26aTlkI83yQ5zrjIqR1RaAFFd6wEMUPuTd2yqqBU0u7kx3q2XWMZIC0T/rmR3kBlt/
 KlR6xzMF5R8rgA0II2bBpDIHHhQKgObAwWXxJReCLTxVHNkSgcYV1eauV3+LNXG5SXy6K43o/Xs
 nHV8tBXM7/TqBeFwrvbGnWIHKOf3RWJvODevcvpPFCbvIvtc4fy3PXhiomOZdMxUEMhxVI43qNf
 Ei1DhowDRCR5kJElLUu0IKw+fpuzFtpqBQCFNJndBUJ6mziILFHSD0Uu2BXaqbUIKKjFXKe2vrS
 3K1Hq0=
X-Received: by 2002:a17:902:db07:b0:2a5:8c1c:7451 with SMTP id
 d9443c01a7336-2a9519f5b02mr181168565ad.58.1770754775772; 
 Tue, 10 Feb 2026 12:19:35 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab017c0461sm52081175ad.27.2026.02.10.12.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 12:19:35 -0800 (PST)
Message-ID: <93f8f250-7899-4528-b277-1ddd469c192c@linaro.org>
Date: Tue, 10 Feb 2026 12:19:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] target/arm: single-binary
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

On 2/10/26 12:15 PM, Pierrick Bouvier wrote:
> This series continues cleaning target/arm, especially tcg folder.
> 
> For now, it contains some cleanups in headers, and it splits helpers per
> category, thus removing several usage of TARGET_AARCH64.
> First version was simply splitting 32 vs 64-bit helpers, and Richard asked
> to split per sub category.
> 
> v3
> --
> 
> - translate.h: missing vaddr replacement
> - move tcg_use_softmmu to tcg/tcg-internal.h to avoid duplicating compilation
>    units between system and user builds.
> - eradicate TARGET_INSN_START_EXTRA_WORDS by calling tcg_gen_insn_start with
>    additional 0 parameters if needed.
> 
> v2
> --
> 
> - add missing kvm_enabled() in arm-qmp-cmds.c
> - didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
>    it in next version.
> - restricted scope of series to helper headers, so we can validate things one
>    step at a time. Series will keep on growing once all patches are reviewed.
> - translate.h: use vaddr where appropriate, as asked by Richard.
> 
> Pierrick Bouvier (12):
>    target/arm: extract helper-mve.h from helper.h
>    target/arm: extract helper-a64.h from helper.h
>    target/arm: extract helper-sve.h from helper.h
>    target/arm: extract helper-sme.h from helper.h
>    tcg: move tcg_use_softmmu to tcg/tcg-internal.h
>    target/arm: move exec/helper-* plumbery to helper.h
>    target/arm/tcg/psci.c: make compilation unit common
>    target/arm/tcg/cpu-v7m.c: make compilation unit common
>    target/arm/tcg/vec_helper.c: make compilation unit common
>    target/arm/tcg/translate.h: replace target_ulong with vaddr
>    target/arm/tcg/translate.h: replace target_long with int64_t
>    include/tcg/tcg-op.h: eradicate TARGET_INSN_START_EXTRA_WORDS
> 
>   include/tcg/tcg-op-common.h                   |   8 +
>   include/tcg/tcg-op.h                          |  29 ---
>   include/tcg/tcg.h                             |   6 -
>   target/alpha/cpu-param.h                      |   2 -
>   target/arm/cpu-param.h                        |   7 -
>   target/arm/helper-a64.h                       |  14 ++
>   target/arm/helper-mve.h                       |  14 ++
>   target/arm/helper-sme.h                       |  14 ++
>   target/arm/helper-sve.h                       |  14 ++
>   target/arm/helper.h                           |  17 +-
>   .../tcg/{helper-a64.h => helper-a64-defs.h}   |   0
>   target/arm/tcg/{helper.h => helper-defs.h}    |   0
>   .../tcg/{helper-mve.h => helper-mve-defs.h}   |   0
>   .../tcg/{helper-sme.h => helper-sme-defs.h}   |   0
>   .../tcg/{helper-sve.h => helper-sve-defs.h}   |   0
>   target/arm/tcg/translate-a32.h                |   2 +-
>   target/arm/tcg/translate.h                    |  22 +-
>   target/arm/tcg/vec_internal.h                 |  49 ++++
>   target/avr/cpu-param.h                        |   2 -
>   target/hexagon/cpu-param.h                    |   2 -
>   target/hppa/cpu-param.h                       |   2 -
>   target/i386/cpu-param.h                       |   2 -
>   target/loongarch/cpu-param.h                  |   2 -
>   target/m68k/cpu-param.h                       |   2 -
>   target/microblaze/cpu-param.h                 |   2 -
>   target/mips/cpu-param.h                       |   2 -
>   target/or1k/cpu-param.h                       |   2 -
>   target/ppc/cpu-param.h                        |   2 -
>   target/riscv/cpu-param.h                      |   7 -
>   target/rx/cpu-param.h                         |   2 -
>   target/s390x/cpu-param.h                      |   2 -
>   target/sh4/cpu-param.h                        |   2 -
>   target/sparc/cpu-param.h                      |   2 -
>   target/tricore/cpu-param.h                    |   2 -
>   target/xtensa/cpu-param.h                     |   2 -
>   tcg/tcg-internal.h                            |   6 +
>   target/alpha/translate.c                      |   4 +-
>   target/arm/debug_helper.c                     |   4 +-
>   target/arm/helper.c                           |   5 +-
>   target/arm/tcg/arith_helper.c                 |   4 +-
>   target/arm/tcg/crypto_helper.c                |   4 +-
>   target/arm/tcg/gengvec64.c                    |   3 +-
>   target/arm/tcg/helper-a64.c                   |   6 +-
>   target/arm/tcg/hflags.c                       |   4 +-
>   target/arm/tcg/m_helper.c                     |   2 +-
>   target/arm/tcg/mte_helper.c                   |   3 +-
>   target/arm/tcg/mve_helper.c                   |   6 +-
>   target/arm/tcg/neon_helper.c                  |   4 +-
>   target/arm/tcg/op_helper.c                    |   2 +-
>   target/arm/tcg/pauth_helper.c                 |   3 +-
>   target/arm/tcg/psci.c                         |   4 +-
>   target/arm/tcg/sme_helper.c                   |   5 +-
>   target/arm/tcg/sve_helper.c                   |   6 +-
>   target/arm/tcg/tlb_helper.c                   |   4 +-
>   target/arm/tcg/translate-a64.c                |   3 +
>   target/arm/tcg/translate-mve.c                |   1 +
>   target/arm/tcg/translate-sme.c                |   3 +
>   target/arm/tcg/translate-sve.c                |   3 +
>   target/arm/tcg/translate.c                    |  25 +-
>   target/arm/tcg/vec_helper.c                   | 224 ++----------------
>   target/arm/tcg/vec_helper64.c                 | 142 +++++++++++
>   target/arm/tcg/vfp_helper.c                   |   4 +-
>   target/avr/translate.c                        |   2 +-
>   target/hexagon/translate.c                    |   2 +-
>   target/i386/tcg/translate.c                   |   2 +-
>   target/loongarch/tcg/translate.c              |   2 +-
>   target/m68k/translate.c                       |   2 +-
>   target/microblaze/translate.c                 |   2 +-
>   target/or1k/translate.c                       |   2 +-
>   target/ppc/translate.c                        |   2 +-
>   target/rx/translate.c                         |   2 +-
>   target/sh4/translate.c                        |   4 +-
>   target/sparc/translate.c                      |   2 +-
>   target/tricore/translate.c                    |   2 +-
>   target/xtensa/translate.c                     |   2 +-
>   tcg/tcg.c                                     |   4 -
>   target/arm/tcg/meson.build                    |  11 +-
>   77 files changed, 383 insertions(+), 381 deletions(-)
>   create mode 100644 target/arm/helper-a64.h
>   create mode 100644 target/arm/helper-mve.h
>   create mode 100644 target/arm/helper-sme.h
>   create mode 100644 target/arm/helper-sve.h
>   rename target/arm/tcg/{helper-a64.h => helper-a64-defs.h} (100%)
>   rename target/arm/tcg/{helper.h => helper-defs.h} (100%)
>   rename target/arm/tcg/{helper-mve.h => helper-mve-defs.h} (100%)
>   rename target/arm/tcg/{helper-sme.h => helper-sme-defs.h} (100%)
>   rename target/arm/tcg/{helper-sve.h => helper-sve-defs.h} (100%)
>   create mode 100644 target/arm/tcg/vec_helper64.c
> 

Patches 1-11 are reviewed and ready to be pulled.

Regards,
Pierrick

