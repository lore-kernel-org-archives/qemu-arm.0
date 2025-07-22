Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2262EC83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 06:06:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ue689-0006vv-20; Tue, 22 Jul 2025 02:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue683-0006tc-E9
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 02:05:32 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue681-0004HA-JG
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 02:05:31 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so30359935e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753164327; x=1753769127; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VukedWE3pKkNRi71uDKIyCcwPl05rQvRwWCGyjroZSY=;
 b=dg5tJknCjXpEgyO/WiXAwMxdzyoFbl9wuUr6ZvkgWnoNhSc+os11xQ1YlFuFBU08D8
 fmlrI1L6HmeahUjCBTVCC8xoJWrZHf8qACEhrZRP0ZTYbqe2jQmm+AbGzlX+MJmgmfeT
 7dvgtQnWZ9EKqBuCUUiCC6GJY9a++CFCplHIxbJAahhZ2GtFZtH9lhryExkfdvqYu9Ri
 UK/QDexnRFEGdl68Uni4+0ZPQYGESVOQC7IVERC9pvRKUzHkvkjw+GErxq05xwggL/gX
 GgQWAjHSkpzLQGfvfL/lk22s+oLdeWHwTj4Ha1p+qUdLQY0ENdYjyw76aQcVt81ehNYl
 NEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753164327; x=1753769127;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VukedWE3pKkNRi71uDKIyCcwPl05rQvRwWCGyjroZSY=;
 b=P3CszyMbfQC/MzzeQuZ5A/e3uSSLrm87Ew/SprnPzs8FQHVoFk235x2SNJAz2G/qzO
 QOL/Ac3o+AqKuLSAUVmv9pgZkQGNadTVTz1XcGojlhZS/al+hOXvtW/LbdTb+zbRAeul
 1ISF+fKziS4i7kVXZD44NIT0eKe/5ubrLrJQwWeyvzar58uo2GuMg4ZcRHUQpbnioXCS
 YAm4+MAOfa7HWhxpoAht42CN2WsWJJc4g4SZdEpJU4tkXUf3kMAw9O2UdwFT5HqjmU4d
 WN748Kywm2YGGHccNdD74smwCHNVpaX0cOk+JtgrZWhK1H9bnUN0uPHcM3yyLe81YAlT
 sC4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURgBmOAdotJLxfnU/1uaAS7IT9TryUL/UE0PAiBOT66m4vYwMrcaUPU0ECtwfyVzUOTnPEzBkbEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz9hIZczPw2HuqM50k7EoEtTbcXohFZWnjlZK7XF45MTItiLC8M
 DldwFpDaAivIlncE6ANJDBxCfR17cr520wjDGfOVzlPelESw7QbCU5c7F3YVfePkXrA=
X-Gm-Gg: ASbGncvWr2HongIfufqUv8L6FSvhysXG91h3S2fY2KoJzAsrf1mch579JZeXuswMfXM
 Rb/BP2wheay2o01n3fwuKxIvDHM1wWhFSE6IEi/dxP0aBsgGxH4pt9Ejg+x0rY4Zy8d1/BAcAW9
 4NjVspjxCKd9sB4j5Un29ispIAyL2KvN0S+FNolsVXcwx0qocZ3MBg2EGoQdp5VGVmQuuYLk3Yo
 pGb+o/uhSynWnZGmifAlzg4DK3OwvYiEnBgBK0EOis4QiahpR/y7nMId68cmc0VFgFblj1JLTV5
 yAy8/5JPXcvgOGrjK/ZGhMEqmqovArc5tZU/a9PRzv1P6/G4vfm/NWbvoZfOG0PVz40XkchlFpr
 05FfprUhwrkWd9ZEdOJhZuv/sDd9+ArivlzNcZsboVVKuItAAdUnHwRYobKVwbj3LVCiq59o=
X-Google-Smtp-Source: AGHT+IEC2z9J4WLof/rzqlY+tjwz/MpDAPa2x/YFrRzSxWYSrF6cjra0+KBNGunrvO9UE6vbgFSNKA==
X-Received: by 2002:a05:600c:45d0:b0:456:11db:2f1e with SMTP id
 5b1f17b1804b1-4563b8b3559mr150345335e9.15.1753164326644; 
 Mon, 21 Jul 2025 23:05:26 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25643sm12103300f8f.16.2025.07.21.23.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 23:05:26 -0700 (PDT)
Message-ID: <9eeee985-0df8-4e88-8ebc-00e20399fe95@linaro.org>
Date: Tue, 22 Jul 2025 08:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Fix big-endian handling of NEON gdb
 remote debugging
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
 <20250721211952.2239714-2-vacha.bhavsar@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250721211952.2239714-2-vacha.bhavsar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Hi,

On 21/7/25 23:19, Vacha Bhavsar wrote:
> This patch adds big endian support for NEON GDB remote
> debugging. It replaces the use of ldq_le_p() with the use of ldq_p() as
> explained in the first part of this patch series. Additionally, the order in
> which the buffer content is loaded into the CPU struct is switched depending
> on target endianness to ensure the most significant bits are always in second
> element.

This patch description is what will be committed in the git history.

What do you mean by "as explained in the first part of this patch
series"? This is already the first patch of the series. The "series"
notion will be lost in the git history, so we don't understand what
you meant / referred to.

Anyway, maybe the description can be simplified as:

"Check target endianness and always store the most significant bits
  in the second element."

> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> ---
>   target/arm/gdbstub64.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 64ee9b3b56..8b7f15b920 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -115,8 +115,16 @@ int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
>           /* 128 bit FP register */
>           {
>               uint64_t *q = aa64_vfp_qreg(env, reg);
> -            q[0] = ldq_le_p(buf);
> -            q[1] = ldq_le_p(buf + 8);
> +
> +            if (target_big_endian()){
> +                q[1] = ldq_p(buf);
> +                q[0] = ldq_p(buf + 8);
> +            }
> +            else{

Per our docs/devel/style.rst:

                } else {

> +                q[0] = ldq_p(buf);
> +                q[1] = ldq_p(buf + 8);
> +            }
> +
>               return 16;
>           }
>       case 32:


