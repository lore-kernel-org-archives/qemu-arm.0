Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp974181njb;
        Fri, 6 Dec 2024 08:28:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfhZcDgOfWkJFvb+YoQ3QEGjLAp33HSKugUDxEwDJS5pr2nDAq/HqtEDg2KU4LbY6LRTSNNnLPwtxF7w==@linaro.org
X-Google-Smtp-Source: AGHT+IG+x8MHW34wabGIYgCkeEI1SxGNlL403ZTMXSXeO9ftTcEKaMUWsTT6/YBp3GelmY4uAGok
X-Received: by 2002:a05:6102:f09:b0:4af:476:f3ca with SMTP id ada2fe7eead31-4afcaa80704mr4706920137.12.1733502487977;
        Fri, 06 Dec 2024 08:28:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502487; cv=none;
        d=google.com; s=arc-20240605;
        b=dq2QmmEXjMhwVekb6QYbdVQSsZ3l6w2HgH1jV3duUMqsEvxX48WOXZJucdSeHf/WhD
         ByLH2zidNysbiJ79Nb3ALc6JDhtwjfFcNmP37VtK2m6RSPCbEWmEx3DAnoLd/w7npe5z
         W0eeXabGG6zWFX/29Up7k2VNga++BTJMv8iZlV7kSJvmm/k1FCVbRBzQjRxwwmNQ3Bmk
         wgGet0r1QZZw6z9A5ASWGgbHOGSIKqD1Ssju5ggbgq1doe7FkNFAMMMderHwNyJ3mGmc
         5J4hkJULM7pZvqO0v/0rMUZQDLq/+/IFhk0SUAqt5tY+1qjZ2bwAKHSH3bxvfh2CW8mW
         1zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KV79Tl1mhUkqeCOeBesvtqo8UORM06eoQYWEfb/+x1E=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=ecRnFM6mulAnpLGf29L3QTIGDp6Ewk9zZ2t+5dN9ImgE2XD4Zu80f49xzYgU8bRVAk
         z0jc8DM4k2yMm7vi5iSw5ML79rgg8cTw4wOhqmcagHLoPehlsktUeVE73/MBnWmoYuR/
         p2T8uU4uvAfCRfuY9fJ2TudsvVwBJunS+iulJ+blN2TwHdamIEhDTPYyXyyij4NTlrkF
         x0HLAWjK6N770KAYx3wUBIF8B1TMZq+MOwtraeBnksY2SwRezhysAKvwWJAlrbwOIXtJ
         rDZ+CbVcMuufqDDtTMaLHzX6x3qfz3YJy4x3LkzIdjokBhI+ydQE/Xm9mvVDrdjYwOIo
         wJhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLy4Vnzj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc690d47si1261957137.301.2024.12.06.08.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:28:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLy4Vnzj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJbBE-0004J3-EL; Fri, 06 Dec 2024 11:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbBC-0004IC-Hp
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:27:46 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbBA-0005Ta-SW
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:27:46 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d0d3dd3097so3694409a12.0
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502463; x=1734107263; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KV79Tl1mhUkqeCOeBesvtqo8UORM06eoQYWEfb/+x1E=;
 b=NLy4VnzjgGkRxoHXX71L5lZTHrCUHjsbZY+j0ohUIoXs2uTlWjeVltOCbnuIFel7vz
 pJ+qbZWUhNlYKZcGsAcyHYDsdNBTwYTBeG5fg3duH059z0MbXeiTPbQCZqJkV2vw3sPZ
 jxYJpdy0ynPuzwNiJjwlAIb0/6D9mAa+JHVSujdeIMS7GeaMfiRDTC2gCInveWPqdsV0
 Ba1AOtG00j5w8S8OIiCWeCh1kaJ8x51SHLJEQMbIFakw8POMLd/PylYckqFPsVxRngtQ
 7cxhNayPeU1xRAQtlZ/dOdqp/PuGWiLamW58sepiFwJWPET+yuEbuR+vDNFgHeMirney
 mE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502463; x=1734107263;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KV79Tl1mhUkqeCOeBesvtqo8UORM06eoQYWEfb/+x1E=;
 b=juTpv0gUyjrjDT6/iADl+IlbHGvxqVcB3y23tSccAxbVUC6EilRVvmccZIFxebxo9J
 2pKX1idMMNG/Wq2TO2fFgsYEUIcpbXvFXuH44TNKb4vdvxyAA1QHKSrRPLkExO8gYbj7
 52xe3m4zsilzJ9k9IlWHpVzf9pUiIZO7qG4wG/cBak8Ei4JBPA0muzgXF+5Kzuxl8dZq
 sQwxeCORktkyzHPDmLBDYLVSk4I9ClOcV3DQng85Sf7YXRY2v5eukfAgLoScr36otHdT
 YG5GXzv0oLnRgnVe6ZLo6ppUjZNcnfQOXePP6MoSMwiEd6cGJT4dVxaVPR+nzj8bZAKp
 zEZw==
X-Gm-Message-State: AOJu0YzGa3gaE9Vh1hezag4J7KuVcZZTMd5rzc/MyYebWiyMkg9CqmXz
 3Z5RsSQneWbWX9PcLguHJQaSz6tMr3xon1vHI6430d4k13kjT5C236PM3uemR5kBMNnTzHs4F1M
 pePdVCaI4UhrYrkA0g2exkZr+lNAEHF19pKK+b933lfkC6tSc
X-Gm-Gg: ASbGncvijuJJZr8vi6eghC8kdRObUni8+ynZgaakRk2KQ0ZJPXnd44mLxxCKUvvul7r
 8+TRK+ne9twnp5Fak3IuE0sr9hM3wSNlQ
X-Received: by 2002:a05:6402:210a:b0:5d0:9081:792f with SMTP id
 4fb4d7f45d1cf-5d3be699fc8mr3831768a12.16.1733502463043; Fri, 06 Dec 2024
 08:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-59-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:27:32 +0000
Message-ID: <CAFEAcA84p8+7bMtiAiRug3E9OXfe9n-ornGwuk5P3-M4EEy5ZQ@mail.gmail.com>
Subject: Re: [PATCH 58/67] target/arm: Convert [US]CVTF (vector, fixed-point)
 scalar to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fm5kfsq1c2Ml

On Sun, 1 Dec 2024 at 15:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove disas_simd_scalar_shift_imm as these were the
> last insns decoded by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 47 ----------------------------------
>  target/arm/tcg/a64.decode      |  8 ++++++
>  2 files changed, 8 insertions(+), 47 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 9808b976fd..ea178f85c2 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -9543,52 +9543,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
>      gen_restore_rmode(tcg_rmode, tcg_fpstatus);
>  }
>
> -/* AdvSIMD scalar shift by immediate
> - *  31 30  29 28         23 22  19 18  16 15    11  10 9    5 4    0
> - * +-----+---+-------------+------+------+--------+---+------+------+
> - * | 0 1 | U | 1 1 1 1 1 0 | immh | immb | opcode | 1 |  Rn  |  Rd  |
> - * +-----+---+-------------+------+------+--------+---+------+------+
> - *
> - * This is the scalar version so it works on a fixed sized registers
> - */
> -static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
> -{
> -    int rd = extract32(insn, 0, 5);
> -    int rn = extract32(insn, 5, 5);
> -    int opcode = extract32(insn, 11, 5);
> -    int immb = extract32(insn, 16, 3);
> -    int immh = extract32(insn, 19, 4);
> -    bool is_u = extract32(insn, 29, 1);
> -
> -    if (immh == 0) {
> -        unallocated_encoding(s);
> -        return;
> -    }
> -
> -    switch (opcode) {
> -    case 0x1c: /* SCVTF, UCVTF */
> -        handle_simd_shift_intfp_conv(s, true, false, is_u, immh, immb,
> -                                     opcode, rn, rd);
> -        break;
> -    default:
> -    case 0x00: /* SSHR / USHR */
> -    case 0x02: /* SSRA / USRA */
> -    case 0x04: /* SRSHR / URSHR */
> -    case 0x06: /* SRSRA / URSRA */
> -    case 0x08: /* SRI */
> -    case 0x0a: /* SHL / SLI */
> -    case 0x0c: /* SQSHLU */
> -    case 0x0e: /* SQSHL, UQSHL */
> -    case 0x10: /* SQSHRUN */
> -    case 0x11: /* SQRSHRUN */
> -    case 0x12: /* SQSHRN, UQSHRN */
> -    case 0x13: /* SQRSHRN, UQRSHRN */
> -    case 0x1f: /* FCVTZS, FCVTZU */
> -        unallocated_encoding(s);
> -        break;
> -    }
> -}
> -
>  static void handle_2misc_64(DisasContext *s, int opcode, bool u,
>                              TCGv_i64 tcg_rd, TCGv_i64 tcg_rn,
>                              TCGv_i32 tcg_rmode, TCGv_ptr tcg_fpstatus)
> @@ -10489,7 +10443,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
>      { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
>      { 0x0f000400, 0x9f800400, disas_simd_shift_imm },
>      { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
> -    { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
>      { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
>      { 0x00000000, 0x00000000, NULL }
>  };
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 707715f433..197555555e 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -1699,6 +1699,14 @@ FCVTAU_f        0111 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
>  @fcvt_fixed_d   .... .... . 1 ...... ...... rn:5 rd:5       \
>                  &fcvt sf=0 esz=3 shift=%fcvt_f_sh_d
>
> +SCVTF_f         0101 1111 0 ....... 111001 ..... .....      @fcvt_fixed_h
> +SCVTF_f         0101 1111 0 ....... 111001 ..... .....      @fcvt_fixed_s
> +SCVTF_f         0101 1111 0 ....... 111001 ..... .....      @fcvt_fixed_d
> +
> +UCVTF_f         0111 1111 0 ....... 111001 ..... .....      @fcvt_fixed_h
> +UCVTF_f         0111 1111 0 ....... 111001 ..... .....      @fcvt_fixed_s
> +UCVTF_f         0111 1111 0 ....... 111001 ..... .....      @fcvt_fixed_d
> +
>  FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_h
>  FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_s
>  FCVTZS_f        0101 1111 0 ....... 111111 ..... .....      @fcvt_fixed_d

Aren't we missing the new trans functions for these insns ?

thanks
-- PMM
