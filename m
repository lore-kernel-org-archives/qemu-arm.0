Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3613409njk;
        Tue, 3 Dec 2024 03:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvbBdrT0PNFOj9GOONMlpO7C2vEhNjS1su/hX1wp0aFVOhXlJXLs/lnLZR2nraw+yDqC/AZ1GmCS9cFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJl15FeesqmryBU1PxaLQXbxTwcpDDvJfQApEkybKRrcfLisZrq6rqzfyzLAf/vTdVuEp3
X-Received: by 2002:a05:622a:1aa0:b0:458:2182:b07a with SMTP id d75a77b69052e-4670c1411a1mr28770481cf.18.1733226638510;
        Tue, 03 Dec 2024 03:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733226638; cv=none;
        d=google.com; s=arc-20240605;
        b=acy0H2W3+vX9a2JpjsX97q1HTMdN1ZyymEilPUjp+Zgx/0O54c0Q+l6Xga2CDZr82r
         KPl7wTfhNX5QwvpD839YwermtsEOqGbX5MCB0H4a+OeUEvQUr6nq6Nltm5D/sisNjzaP
         CIJjCCZWtjhEWV0FC+lZSSue2ygSmrliORnTbLHOa/72gXUSGgXuxYnCrXqFFN+BSIVe
         bHTtq1OuNtXdGlCvNRZHc5CaJtm+UlDhMdMij5/bjne3pQSAfVv+JzR13GsXW9YgSXxC
         ep7M1PoOAVyrYAJ/HVgSKhdiUeQQ2Vcr3T2BbQ3zQJiQKwg9ur9dmrT0KPXoZ0fSjwvZ
         6sTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a0U68q73lW+pS6rFsjZzAewbIGZOTioH4eI5YcSNmaM=;
        fh=XrrbCWWUR7Ny9lhlBvGXXrpCDLkGhv3MCUj5BgBPsmI=;
        b=T9PtqeLsbm6WEnN94UxceGmMhJKiNqC1qXg1VUub5RDX06KNGlV599aCwnYO2db8av
         fIYuvMVvfNeM3k/3qhu07qzuPTco2OFVPaNspWpj5cabu/Z85bJh5osXNx+PlV3rVlAM
         NzzxMzUfydsLdnQISwIpSFkRV/csMGAZJ1wKvsYB0V4z8Kj9aiT73977kAgdC4X9h7Hd
         IAZ45Tu62lB7d9GYJL+RVPhle0IuhIp/oSokEiu+VeMp7YLqKzmnlE0R5h//9j8cF8al
         yDDAkthjG9ZtjGHR8V42JEU/zLYFgC5I3nGMOjBsjFl26geGcTyiJryRaHFHQFeNKgZq
         rEVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWRIRoOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4223921si163672691cf.417.2024.12.03.03.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 03:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWRIRoOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIRPz-0002ub-Ln; Tue, 03 Dec 2024 06:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tIRPu-0002qP-Vj
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:50:11 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tIRPs-0002O9-M1
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:50:10 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d0c098c870so6279715a12.1
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733226604; x=1733831404; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a0U68q73lW+pS6rFsjZzAewbIGZOTioH4eI5YcSNmaM=;
 b=NWRIRoOb2E9Fd+vM6I9dudlbZt6Cac3+rOe7AqH0+cwPSqQ/27QdhvB6lLFUZbhVqx
 Ou7umnCfcUL0l8uCvNtaX1tr6HSKdxTS5nT9VjcJyK4IiCSax514qPtWEenDmvAA83Yy
 3GA8zIKZdbwbCuDdq0WO3UVkeRU9r3AIYrkx9GA3Rzm3hlgSJOapL9DBMFGJiJ66qNtF
 3piaPqXGBLW/mV4ZjNuQ05uRB09ikdq1XwcQZOPj1xVuW0MSL8z2/Dky/RwwWC4fUq5E
 z8IyAFg4Zy777C/v4iV+9LiV0gU4RqC46MPPeMbWD+3jJuIu1QZvOcoR/Xb9x7cdYiBg
 Axew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733226604; x=1733831404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0U68q73lW+pS6rFsjZzAewbIGZOTioH4eI5YcSNmaM=;
 b=NpVXxenTDaMiFslUmBQSEKSIAurOw8SOLS4ZZv/xyY7hydxDzp6MbZfWTkA3Mv7sfY
 ZJaXPMeGREvm7TKSKzNADUWepjqdiJezFr9eLEyN60QcJb352+KACIOTWET7fyi60TDP
 rbthTrFxe+6KPBftQlyeeorABAtovcmVrKSi71D4I8W7ke/BAIZfwGabpz5t+BebSQss
 GQ4QbQLlj3Ez1HQ7iDwJNkm98FCvOKJSiC2krla6ekpEMTAeGn08JbB4R/FMcre5HgGu
 xMS8kGuiMbTgT5zi9XNTBUHcYk5Kkn6fKL2EBNq+yo5YTvXQjfoLPtzvtiBvTQQlj45i
 4F8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgW0GEZ5XMT5tN6+UtprhzJOzKhR/NIaHjcGaJYQLszQwNXfhHvH0JzlzF2v1PoZBfRvJfC2bvDw==@nongnu.org
X-Gm-Message-State: AOJu0YxoMLvYpoB/xmG9KzuOVMe52qLJAVsi6TpNySeqEC+zx9c+ghMx
 GHL081WLLbGNryWDGZorkb2F8RtbnKuPHY+Z6Dg0T3IBySm34cNXdNCFcPEBKMawFXhwVHoBd1S
 dGpWXfqYUao2Psp6EPlEw0m7tE6EoPoeiESoKqw==
X-Gm-Gg: ASbGnctCaqLiI86jc4pEoW2Lr7pY6bN0Y00UufagEDRAtqGssccUzX99eRXztoEEyA6
 Oc7VK0AU4uh+EnTESbfuQO4uNplaIpkwm
X-Received: by 2002:a05:6402:4409:b0:5d0:b1c4:7081 with SMTP id
 4fb4d7f45d1cf-5d10c22f097mr2426610a12.4.1733226603063; Tue, 03 Dec 2024
 03:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-43-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 11:49:52 +0000
Message-ID: <CAFEAcA8CbQXg7D22SCyqT0oJAPZ1g7_yWJENZX3wKBOmp4r58Q@mail.gmail.com>
Subject: Re: [PATCH 42/67] target/arm: Convert handle_rev to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5PGfg07PBKV3

On Sun, 1 Dec 2024 at 15:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes REV16, REV32, REV64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -10070,10 +10003,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>      TCGv_ptr tcg_fpstatus;
>
>      switch (opcode) {
> -    case 0x0: /* REV64, REV32 */
> -    case 0x1: /* REV16 */
> -        handle_rev(s, opcode, u, is_q, size, rn, rd);
> -        return;
>      case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
>      case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
>          if (size == 3) {
> @@ -10276,6 +10205,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>          break;
>      }
>      default:
> +    case 0x0: /* REV64 */
> +    case 0x1: /* REV16, REV32 */

REV32 is case 0x0, not 0x1, per the comments deleted above.

>      case 0x3: /* SUQADD, USQADD */
>      case 0x4: /* CLS, CLZ */
>      case 0x5: /* CNT, NOT, RBIT */
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 4f8231d07a..2531809096 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -73,6 +73,7 @@
>
>  @qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
>  @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
> +@qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
>  @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
>
>  @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
> @@ -1657,3 +1658,7 @@ CMGE0_v         0.10 1110 ..1 00000 10001 0 ..... .....     @qrr_e
>  CMEQ0_v         0.00 1110 ..1 00000 10011 0 ..... .....     @qrr_e
>  CMLE0_v         0.10 1110 ..1 00000 10011 0 ..... .....     @qrr_e
>  CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
> +
> +REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
> +REV32_v         0.10 1110 0.1 00000 00011 0 ..... .....     @qrr_bh
> +REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e

This doesn't look quite right -- in the decode table in C4.1.96.21,
2-reg misc REV32 is opcode 00000, like REV64, not 00001 like REV16.

--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1660,5 +1660,5 @@ CMLE0_v         0.10 1110 ..1 00000 10011 0
..... .....     @qrr_e
 CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e

 REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
-REV32_v         0.10 1110 0.1 00000 00011 0 ..... .....     @qrr_bh
+REV32_v         0.10 1110 0.1 00000 00001 0 ..... .....     @qrr_bh
 REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e

should I think be the right fixup.

thanks
-- PMM
