Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F6C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 06:09:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ue6Bb-0001Mk-KI; Tue, 22 Jul 2025 02:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue6BY-0001Jq-3U
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 02:09:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue6BW-0006ce-1R
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 02:09:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4181096f8f.3
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753164544; x=1753769344; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHi5AoTZKxgE1b905lgbLvWxvaelygagiP7bhh1leBo=;
 b=GonkqLLtsiXASdgvpCKKfD9YDTxgfO+BqPJ5Ku565aVEztns5ySn/HKxocGBbDG6Rq
 UNInXxcyMxOfXonT3vA1AJLEBMJV+QQOMXTi3o0WyfSkAbiWPhJBcSeDkbHuO4Kv1GQK
 G2Cb3DpINKlKVQSEEclwsCeWrXq8JzMESti3cR+JUitrde0t9FPj7qsCgb+XX/ncKxsn
 s7s6SxGST7hq0r6EX038B2991uTqtseKK6O30sbXTqsIgfwadPXjxDiF1juBfekM7HYZ
 9iIVFUy1RtfMcxs3zo4brKjsCJnIhpQXm81Gk20UeH9MB/3cqXO6YiRrtY/oFUA6BnRU
 s/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753164544; x=1753769344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rHi5AoTZKxgE1b905lgbLvWxvaelygagiP7bhh1leBo=;
 b=Vu3NVW9sIEdTAxlHtH3p/1ToF9sHRfkSIX3VhW9gX4ClcAKlbTLL1nf5hisHgWtazW
 x+tkxiLJ8adBCSVl3nHMqC4jNEVXI6MApuLVX8dz5doJCM0VLCA85tOmtQobEnAMbHG1
 fcUaB6YqM4ZpZScYYHa0iKcaVrdRMq0OpIjp9AjFDaAObPPBq9xVhDPxxlhMLtplzMzM
 sIpVH//usoSErJHcqxPx/PEK2rLGn6CxxPLW4TLBR/3pJG+D9ErTOdl5zACnK7KkaP9e
 R3Njh1YYMwY7tdG311LAOL1TyFFkyPbdafiYoOwN97sf9eFARrI/lRCwpJqMNIHdbbLb
 /XQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo+2+E99QUsY8wbWdVoay7rvKmsnOV8fv0H2Htm8ZI3sDT4pa4qfD8cCAr9qIwes8i7YXLUlMaaQ==@nongnu.org
X-Gm-Message-State: AOJu0YyZceCIR4Sj3CHQzfOexbedSIXhKdMIUE/OwFJ5pjdswFmefEjK
 sgQZxD9MiLaaamAmnB13oPhMGPBiJFH9WphW06zRYHPAS4/zHiRQ55NxndoSbS8/xBE=
X-Gm-Gg: ASbGncuVie+YPEUDCyab2YWAZ+D2JR2S32Hjm+B/qtvNhtxUkL1O9vTwltwXtrT0MxO
 WBL3sZPcNUf+LP0Rua067uLfFEbV84QRE22gnPEndSEDARjN69vQcZX7URL4+5v7KL5tLH/KiA+
 HFNRvAWSbPVV0wdGF3VYghmHEzQRYaW7JFTMzK6kYqZThCcYRxPq9qDuxQSuIzzF3eUvzpUvGvx
 YDRXg76NmiT3G2wD5MX0JsiXTiBoF+Vw95hA0dZJAesAOf0wigvgYj64RFcs9OZG+dSxaFeGJxo
 YhHY+9S1pyQ+qk///8GpKwgojDhSF2MLQC7b8zSvUWtvIzyYmZs5HM4lqyRzJ5/FdZezaobg7s3
 vETtl8MiBefeesVCUqxqsegs4y37Rm7dgAfQGrLZwDC5T24uk0XrgZguDNE8JtRoVKsevklI=
X-Google-Smtp-Source: AGHT+IGWfSkPQGSRXrP/753q1NjFbpWSvPS62sJhnMx8803vuTwAbqImOPH/SbPolgjITygjpH7PEQ==
X-Received: by 2002:a5d:59c5:0:b0:3a4:e502:81e1 with SMTP id
 ffacd0b85a97d-3b60e5181dbmr16014708f8f.52.1753164544026; 
 Mon, 21 Jul 2025 23:09:04 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76455e57asm1043751f8f.21.2025.07.21.23.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 23:09:03 -0700 (PDT)
Message-ID: <3aa0c603-7acd-4802-9a32-80e183ef01eb@linaro.org>
Date: Tue, 22 Jul 2025 08:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Fix big-endian handling of SVE gdb remote
 debugging
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
 <20250721211952.2239714-3-vacha.bhavsar@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250721211952.2239714-3-vacha.bhavsar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 21/7/25 23:19, Vacha Bhavsar wrote:
> This patch adds big endian support for SVE GDB remote
> debugging. It replaces the use of pointer dereferencing with the use of
> ldq_p() as explained in the first part of this patch series. Additionally,
> the order in which the buffer content is loaded into the CPU struct is
> switched depending on target endianness to ensure the most significant bits
> are always in second element.
> 
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> ---
>   target/arm/gdbstub64.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 8b7f15b920..cd61d946bb 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -200,10 +200,18 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)

Alex,

Why is there a disconnection with gdb_register_coprocessor() and
"gdbstub/helpers.h" APIs? The former is older? Should we unify
using the latter API with GByteArray?

>       case 0 ... 31:
>       {
>           int vq, len = 0;
> -        uint64_t *p = (uint64_t *) buf;
>           for (vq = 0; vq < cpu->sve_max_vq; vq++) {
> -            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
> -            env->vfp.zregs[reg].d[vq * 2] = *p++;
> +            if (target_big_endian()){
> +                env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
> +                buf += 8;
> +                env->vfp.zregs[reg].d[vq * 2] = ldq_p(buf);
> +            }
> +            else{
> +                env->vfp.zregs[reg].d[vq * 2] = ldq_p(buf);
> +                buf += 8;
> +                env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
> +            }
> +            buf += 8;
>               len += 16;
>           }
>           return len;
> @@ -218,9 +226,9 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
>       {
>           int preg = reg - 34;
>           int vq, len = 0;
> -        uint64_t *p = (uint64_t *) buf;
>           for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
> -            env->vfp.pregs[preg].p[vq / 4] = *p++;
> +            env->vfp.pregs[preg].p[vq/4] = ldq_p(buf);
> +            buf += 8;
>               len += 8;
>           }
>           return len;


