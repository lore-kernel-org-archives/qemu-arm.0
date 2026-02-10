Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB814EB2700
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 21:58:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpvk7-0005Ix-En; Tue, 10 Feb 2026 16:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vpvk5-0005I5-Qg
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 16:57:57 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vpvk0-00057i-1n
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 16:57:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4362c635319so1229890f8f.2
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770760670; x=1771365470; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wt4+TnDTB63oHepv/tSNeYmovpwWT8cqJplYnzyRS4A=;
 b=liutYWSGdfkpOS+Ne9um4/9DiZSYxogdHW8yZH/fgPJ25wRXCI0p7i/JQlxoyLTk4F
 pdIn3WzdisVKVEqPEoadASXVFBcRD9w+RPC8IpfXp3p3PD49wbCCO+atbgvn1z04savf
 Ea9Lz5BUZsQrF6tHvGFm63EjS3UfUMGg/bgr3ifFumA6rTHqIKcDLbFyjmLw6OEevvX0
 ngBtExybllbpiE9TV1At5I51o2aeYdFAI30UimwNOz4SDBlyLgHxkw0iG0EEyqoJeIBe
 VUqk2C0W7XBxRo8cAU/vuGawPeUsEnxvzNVSwFL/EiRiXoEzuJdVgaFtKtk0sMj94cfV
 HUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770760670; x=1771365470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wt4+TnDTB63oHepv/tSNeYmovpwWT8cqJplYnzyRS4A=;
 b=I6qg/tfDOCooRukXPTTKYvSEs2EOpTq7xPC6OzmKQJ2Oo75+XvFTPbIhyUbHIwMg4T
 GD9qDpuTzbRAljWNTwxts8zY64VC8G8MpPdqaN8u50H4WOiM0dNFYXh/0rs9CTgGk4Oz
 jymzqjmR216y9dkxGLCbEFvfE3wxvFHf6R7gY4Tj7e/aKaOmCxysKPX3OpFZepi0zeig
 g8MqGcuC2WoUwDdjMy7zFnQjM2VLRGuDYsbmo56+5ZPFAy9oBnV6vVPpm0v/ALrJhOUk
 cnkFYLRyPuyVDCrRYa4wHgQ0lHA/ifJhUEbn9xXfra6ZNCViLrU0A/mNnskPzRxvkjI6
 6CdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOedLnBaPaHVIbl98yEhaJEc42c4sxb7rXL3lB3hrS9ZrAtgvVQhPu8oPkNn7L+PounskMTXALUA==@nongnu.org
X-Gm-Message-State: AOJu0Yymj5F1ZF/a4vGmx+KZ0phMZkUt8Ve6ZmHdjRFjM8aBbGlfTSc+
 D2e/4Why3LuTGRNfaS+ZilBUo4D1fR4lLXiLe34Bz3YEcLTKcwstJaJUH3XG4TrbOuE=
X-Gm-Gg: AZuq6aIRaQJBMXLC6KQFw+HrcxYaPAdprs0IdU8MkNBJszhZubeCYLCoGeHSZLMP/ZW
 ITTDki88xGcZxbhu+YjvdbfNBkz8hWfNkP2x+l5wASxK1wJGR4unab6gatFQsmhrE7tp+kggeaq
 OyUkEcyR3tZbnEIC7yVmcihmFUQUnyJ6bmKcRd3vkLOe0dPE/wufeP55z3auO21PjIpJ8rYFEu8
 uRTDkqhQYK+iSbwfixdW12Kvh8+4YG+dznxYprBhxMSejaObwE0IwSjCnmQRwwMkH08XjwZQ+9L
 MZpbqjPg5XFs3s3K9AiWgWeTi5LiURd1ILjx0mM3QvoRAxl9fPkyHF37TA8i9M+HEzXtrTAn13r
 quPZc8mkxfqiGpg/SRbx2TIGKPOu/IgOCxAzdLrcfw7JPPIb7EemzjrSYyWrbK0Wj+mY54VCMJL
 St3//l1HYWNE5ocNgQtyrQ6Zc/oifI/+ofRPNCdV6AmXl/DiK+cUjo3yvE2vQUuI9hPQ==
X-Received: by 2002:a05:6000:2304:b0:436:b87:ce5c with SMTP id
 ffacd0b85a97d-43629237819mr24903389f8f.20.1770760670367; 
 Tue, 10 Feb 2026 13:57:50 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d746a3sm3250f8f.17.2026.02.10.13.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 13:57:49 -0800 (PST)
Message-ID: <e76a6e53-6b8a-42fe-991f-93b9c19c8466@linaro.org>
Date: Tue, 10 Feb 2026 22:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] include/tcg/tcg-op.h: eradicate
 TARGET_INSN_START_EXTRA_WORDS
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
 <20260210201540.1405424-13-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260210201540.1405424-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 10/2/26 21:15, Pierrick Bouvier wrote:
> This commit removes TARGET_INSN_START_EXTRA_WORDS and force all arch to
> call the same version of tcg_gen_insn_start, with additional 0 arguments
> if needed. Since all arch have a single call site (in translate.c), this
> is as good documentation as having a single define.
> 
> The notable exception is target/arm, which has two different translate
> files for 32/64 bits. Since it's the only one, we accept to have two
> call sites for this.
> 
> As well, we update parameter type to use uint64_t instead of
> target_ulong, so it can be called from common code.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/tcg/tcg-op-common.h      |  8 ++++++++
>   include/tcg/tcg-op.h             | 29 -----------------------------
>   target/alpha/cpu-param.h         |  2 --
>   target/arm/cpu-param.h           |  7 -------
>   target/avr/cpu-param.h           |  2 --
>   target/hexagon/cpu-param.h       |  2 --
>   target/hppa/cpu-param.h          |  2 --
>   target/i386/cpu-param.h          |  2 --
>   target/loongarch/cpu-param.h     |  2 --
>   target/m68k/cpu-param.h          |  2 --
>   target/microblaze/cpu-param.h    |  2 --
>   target/mips/cpu-param.h          |  2 --
>   target/or1k/cpu-param.h          |  2 --
>   target/ppc/cpu-param.h           |  2 --
>   target/riscv/cpu-param.h         |  7 -------
>   target/rx/cpu-param.h            |  2 --
>   target/s390x/cpu-param.h         |  2 --
>   target/sh4/cpu-param.h           |  2 --
>   target/sparc/cpu-param.h         |  2 --
>   target/tricore/cpu-param.h       |  2 --
>   target/xtensa/cpu-param.h        |  2 --
>   target/alpha/translate.c         |  4 ++--
>   target/avr/translate.c           |  2 +-
>   target/hexagon/translate.c       |  2 +-
>   target/i386/tcg/translate.c      |  2 +-
>   target/loongarch/tcg/translate.c |  2 +-
>   target/m68k/translate.c          |  2 +-
>   target/microblaze/translate.c    |  2 +-
>   target/or1k/translate.c          |  2 +-
>   target/ppc/translate.c           |  2 +-
>   target/rx/translate.c            |  2 +-
>   target/sh4/translate.c           |  4 ++--
>   target/sparc/translate.c         |  2 +-
>   target/tricore/translate.c       |  2 +-
>   target/xtensa/translate.c        |  2 +-
>   35 files changed, 24 insertions(+), 93 deletions(-)


> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index bb8d2ed86cf..5e3707d3fdf 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -1159,7 +1159,7 @@ static void xtensa_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
>   
>   static void xtensa_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>   {
> -    tcg_gen_insn_start(dcbase->pc_next);
> +    tcg_gen_insn_start(dcbase->pc_next, 0, 0);

If documentation is a concern, we could define INSN_START_DUMMY = 0 and 
use it here.

>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


