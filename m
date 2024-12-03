Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3709530njk;
        Tue, 3 Dec 2024 06:06:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV49Hfvt3HU6gl2Kyb0HxzsKHLTaDRmB/NItrzv8QE4K17J1oWvohlqoTmrXzvbBViFS9VYed/qwAlSmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHp1RVit8HKSFrrqo1b0Pa3bqQi8IXrYTv4NAX7AJtRsifp1g3x8g+ordohIdjV8wtrtwl7
X-Received: by 2002:a05:622a:15c6:b0:466:b122:513e with SMTP id d75a77b69052e-46717c30fc4mr5706841cf.12.1733234807095;
        Tue, 03 Dec 2024 06:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733234807; cv=none;
        d=google.com; s=arc-20240605;
        b=F4MaVb1WrnVrdJd0QZ91ASBaFG2JlyahJwjKO1EI8hO0K8Fqu+Jk7d46mKm0Z/dYhZ
         XU8XgGyOmKnFek/kC+O0wxzpm//MOsQKmctjrVRm/yDWCIJ33frTTWlseETTEU0lJsju
         zBizYTeUbQQW9PJf4n3451OCjN+fFe4rQgbz9l5aM7ec8+MTIVvkNtZs0RP9gA3Lm56W
         lLw7+WV+d7Ee5iV/RM3sMXFIeTyzqWz2f9rYdJGTFhT1XZ6wEfd4+dLpG113wcp/g1dV
         7nFaVChSC/k1A3G69P1QbE6BMgnaclbSaamqa6y2BUGojVkfrwKwCRI+AC8DcnGE2Gc9
         Gddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J72XsEq6Vvpiq4g9h+RfkaNdrqHWq3b771Pk0AeaAtc=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=DtZ897oqELNdYnT3Mm/cv/1wV2oZE8gcRvHnKAzuqIkXW/XVY/Sx9+UESacvwvJhQ9
         ZVnvoBmQ5DW3hCE62EEYBXSMSB6MM7WlMhCHYm2E5399PTiRsNFYfI4+UU6p95GGH5KT
         83D/B2CkhO6YJRM8DOqEnWlMtKpxyxgmVkDULiLo0GDiVKoWv9qDH5BA4tOz33gomFLI
         HJoHuoSMdQ2jUyA0cB33fKHqt/NeH4QUVEe03VBhzVsj+ef1f6fOoOSHTc4mU4Nr1vEq
         PIbb1NS/acOuFUmS2Zf4rVsnsQcty2MeCIiktADt5PXOwa/OpRde24CQ2TKHyaTLh7+m
         vrJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCxOpLSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156cd1d7e2si4922700e0c.97.2024.12.03.06.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 06:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCxOpLSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tITX9-0007bZ-Su; Tue, 03 Dec 2024 09:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tITX3-0007aI-C0
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 09:05:41 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tITX1-0004fx-Ki
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 09:05:40 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cec9609303so6611143a12.1
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2024 06:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234735; x=1733839535; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J72XsEq6Vvpiq4g9h+RfkaNdrqHWq3b771Pk0AeaAtc=;
 b=KCxOpLSnEeYy8awQ+HlgkUmEprrXBoOmoxq7Ml27wVJNknx1xxPd0oe913vavOJfAw
 +Y1aKRQl6cMdgSAcX4DUXdYYNBi5nA610/Fyn8AAByjpa79f9L/LEKu8Cc8I4BqWsbd/
 epGb3HtVcZtMCdjIMGkldz3Q5srznwviIOmD9y9KDij6rN7LwySxZROtVlHG/JafkSdF
 0n5UhkK9fO5kBLmDTbsIMHkdf1+obPOLICQMV6M69hSYTdI5Abhtkfk48Ey+U3qxtTOA
 jEJSprwOgA1Ye6CdkbsCnvJlOll6CiriaktHIcjwbomutfCY4VeQeVXtjxrAq2qk7aw8
 nMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234735; x=1733839535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J72XsEq6Vvpiq4g9h+RfkaNdrqHWq3b771Pk0AeaAtc=;
 b=OV47BVivmu31j3elmk9z126TW3ZFt5pQrofzB0/xzebt6V7sCBDyTGiloVMVaGQ1uZ
 GAqNoZe30QNAOzXQAk4rGCtdVZ1TBrrxMRmyFHCevWoesmhiKG5nab8Yi4lTmyIGB2mw
 rcDKaP82LKWx8eiP5GrDMh9sMNhOWyOaJuFo6S85rT445KmH6ITWZJB99j0DGpr9okxU
 RnMRAEm2JVIwGUzXOV8hpVemHtiH5NA0w0elf7Sy3plb2AHVOZRdDJjibeYL3no9Ee/z
 TZaTdSw/gqjumU92ro//8tocXQ2nhTVuHgqswFtehoDHfKa9tQ29dUC7lXdT1jEgkzup
 dk3Q==
X-Gm-Message-State: AOJu0YxwnYnTi8p6DoRGqgzFg0V1U/7OrBLFsDI77hnUo+Q1QlJOiVuB
 LnqUpGTwz2i+ykjbm6jyhb0h18DeJj7/t7HBA4UZEZ9VaxOZuo9jD5pkSamVUzjkTV/sTOndHE2
 ORqa0A+OU86B5nIzZUk7K09e9UzHDBYARorBj6A==
X-Gm-Gg: ASbGnctsrxk/KeemgDSO8oaBRa8Yf4D76VniJrUHVdNJ8o3vcJMORhbwkqbusJtaCPU
 VmvFcciMCkQI31ozidgpfD8/R/9LR55U/
X-Received: by 2002:a05:6402:4405:b0:5d0:f088:c675 with SMTP id
 4fb4d7f45d1cf-5d10cb7ca92mr1819247a12.21.1733234734706; Tue, 03 Dec 2024
 06:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-29-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 14:05:23 +0000
Message-ID: <CAFEAcA9Aww0m_TPdbL53DPPnWqA=BU1TzjGLvQi-EokKyzkdfQ@mail.gmail.com>
Subject: Re: [PATCH 28/67] target/arm: Convert BFCVT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: Lx+Nd0XWi0Ps

On Sun, 1 Dec 2024 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 24 ++++++------------------
>  target/arm/tcg/a64.decode      |  3 +++
>  2 files changed, 9 insertions(+), 18 deletions(-)
>
> @@ -8661,21 +8664,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
>          break;
>
>      case 0x6:
> -        switch (type) {
> -        case 1: /* BFCVT */

Here we decode BFCVT when the 'ftype' field (bits [23:22]) is 0b01...

> -            if (!dc_isar_feature(aa64_bf16, s)) {
> -                goto do_unallocated;
> -            }
> -            if (!fp_access_check(s)) {
> -                return;
> -            }
> -            handle_fp_1src_single(s, opcode, rd, rn);
> -            break;
> -        default:
> -            goto do_unallocated;
> -        }
> -        break;
> -
>      default:
>      do_unallocated:
>          unallocated_encoding(s);
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index fbfdf96eb3..476989c1b4 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -45,6 +45,7 @@
>  &qrrrr_e        q rd rn rm ra esz
>
>  @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
> +@rr_s           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=2
>  @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
>  @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
>  @rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
> @@ -1337,6 +1338,8 @@ FRINTA_s        00011110 .. 1 001100 10000 ..... .....      @rr_hsd
>  FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
>  FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
>
> +BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s

...but this decode pattern has them as 0b10.


--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1338,7 +1338,7 @@ FRINTA_s        00011110 .. 1 001100 10000 .....
.....      @rr_hsd
 FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
 FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd

-BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s
+BFCVT_s         00011110 01 1 000110 10000 ..... .....      @rr_s

 # Floating-point Immediate

should fix this.

thanks
-- PMM
