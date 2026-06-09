Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F947CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 15:24:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWyIx-0007UO-6i; Tue, 09 Jun 2026 11:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyIv-0007Tj-7C
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:23:49 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyIs-0000sx-L4
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:23:48 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bebac79fff8so595240366b.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 08:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781018624; cv=none;
 d=google.com; s=arc-20240605;
 b=IX1xpTVOOxiIVgKMDbSUq12Orp7hflp0x/lh1SBiOm3XPNqhdhpMWZ9nP9nsAtNOFM
 qu1A0bhlc9VoMyU32i2L3oqBLTo2jnzsw3t4hzzEUVrJ95JOjzljCRgXBye87XOcHMLI
 bZMIS/PeNmgyLMIREaf2cxgwsWKJHWFKR0/C5EtbmO9XPX/nP4CiOaP+yS8jJPH+IFuo
 WcExPxij9+ezQUIDwjhACMQHAfB8pH7yrmQfA9MFiQ4lZ2+kpIPewwfHU5b9+89tubAJ
 OqyrtonCaAMIjgc1+K/OrECMoCSVCBepevADPjbNhGG/gP5E5LwZmwKqMXhT7zyWuERv
 g0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aAwC71p9JDl6vtgucmiZ0oUjX0xWUxt4RshNS2NtFY4=;
 fh=t9w7f3PlO9q8qBVSony2fv5Rmc9F4JypMt3Mk98xpDk=;
 b=NQermd69KK7P1mtxYWvXilzgo+slKDCf0V0WbsJpXVGAHS+Ls2IvDHVE932I3mYaNE
 7KS6a/+heUM4j1hcJ5KoX/m2pEyEfEBdhvEO24s6++r/A/vfItl97SM2stfXcNIbX0gu
 mR+Bhn/aNxodSf+bk8HTpuMk0Am0+cvymRifbn8qjc300EnB3eidH5uCfg8jPBguIzRl
 LdvfW8MaEXD8Jfom30qnSJmNwMOnCXdCY4gl/2VhJUZySfLf9Qv48al8cF7boQKkXRoA
 3b8bdbCQSuKkmuReSvTNFmu/RDIZuDK6/xAgb8LVOT21GhW6DqKxBTnKQ75T892ROJ7p
 jEGw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781018624; x=1781623424; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAwC71p9JDl6vtgucmiZ0oUjX0xWUxt4RshNS2NtFY4=;
 b=l2yAYdihHbdCqpHA+3uin9/G1HGqe0Y/7o7ddBxx0XtsOAHt07KCLitRjNCrqGjuQe
 T4rZV9lDIoMU/pG5VoNquGObHh1A85lUq7OE0dBrG+CUyfQoafHCekT4v9W3yBKzWzqv
 fqenVdn3YXJ4pGai46nTmNy9WLKXdmamMBqL8qluAUXrNQGXOSZrKwtVwNi7fTSXHTR/
 iJdOneDd5HX7Yqj6HCgyejQq0onC6tRaa6xhDc3q52FCQ3kM/N6knJ0VIvQ0M3igHom5
 fWux6JIZvwqkUEUldTuxjledsjEexgUUtKNk0ml+o8ClPofnVX7JYUFetf13Qa+DjqGx
 3+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781018624; x=1781623424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aAwC71p9JDl6vtgucmiZ0oUjX0xWUxt4RshNS2NtFY4=;
 b=BT5MQzXOE/c3zH7NKuhSJ/y/ViRqbWWUfFlr6VM4nPu/o6gLiRZLEpZzKScE3Clgf6
 6TLyhIj5nenoBGL2T70xTBkYGI87uKaSLZJZsrNNROK+whVmrebG4t0iou+hOdscexf+
 75qPrNGJkLsMWZ2G2j20UkqMZpgh706us8VFpbL/9B6LaLlM8n2An0ITul2rvWUW5XpZ
 ObqVTrRJsu5PkCuP2pTAH33YJTdgD4h0SzP82x9MfwEo8ML8S7qya95RYKt8KgqwObsm
 wbmV7yKQO1+IdoM3j+0TFvRx6pP3GvrhfAFYn+uj1kgQAdb2brg23t4EssfgHaiIgZW8
 hFwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GX+IbrkqvvhpekFLFUPnAxNGV65s4qX4Qm4qaZvMcB35LypdSC6NCbkA202T7cjE2/f3eBPqXxQ==@nongnu.org
X-Gm-Message-State: AOJu0YywY4lQom5Jaj7oViAw+76jh+8QGzP0xkpRgvJDg5SlrVSaTm4r
 go1qmsZGTO4wGwG29jY4hOrpsAgCivNhC9YJ3qFn1dc1iiyO4OuHgur3Zak92Uv/I6xyW5e8lVY
 8yDNvEm3P5T/PpNaZp9y/yAaVSYGDWr5eshiNLQAnXA==
X-Gm-Gg: Acq92OECqJygd1/EVIp+MRGZS9xNDeCtYgYPw2v6eklHFbcInU5+UN8Oi/0BBoXsqQN
 VoEuQ7Jt7dPeD5bIzutcwwdZAIMX4q0gVN2UZ2OfQBkfxjCXuyeUviACxa8Rer0xRVK9Euj0njK
 1ijq2k+UxtegVXCtdMBnMLSXlg4LqgK9P/9KRYjewKv5IqEpaI7Qx/khIt0ogZMXEti5ZqoQQ1A
 fBnJ1FX83Pui1ZeGL0R7f9DR+0qkY+MTRcL5tma/BV9HcMpYQ5nwnIYAHeRXE9wXYq9+e/jaMiv
 YLdyQTVQkIxBa66CDWvssjZKLRgIUrnbm2zzqbvvvMpVmxEisYDrO9m7QI0NiGPhiEAouI89ik7
 S0pbnXn7RGBOU
X-Received: by 2002:a17:907:6d11:b0:bdc:8c6b:4842 with SMTP id
 a640c23a62f3a-bf3735f6139mr994072466b.30.1781018624059; Tue, 09 Jun 2026
 08:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-4-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 16:23:31 +0100
X-Gm-Features: AVVi8CeIKB9j4TwtH_mHqsu1mvo5DHcldBXGHtbpfZ6tkqpRXSMR1bp1JU86waU
Message-ID: <CAFEAcA_jORCuOnt4oh_JB7ZdqmZeo2yjYwssoT+-3D8K8P1DEQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/45] target/arm: Use FloatParts64 in f16_dotadd
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Wed, 3 Jun 2026 at 04:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use softfloat-parts.h so that we can more naturally
> perform the required operations witha single rounding step.
> This happens to also simplify the NaN detection step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20260517002550.321291-11-richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
> index 376fbd48d4..7ef6f5d71b 100644
> --- a/target/arm/tcg/sme_helper.c
> +++ b/target/arm/tcg/sme_helper.c
> @@ -27,6 +27,7 @@
>  #include "accel/tcg/helper-retaddr.h"
>  #include "qemu/int128.h"
>  #include "fpu/softfloat.h"
> +#include "fpu/softfloat-parts.h"
>  #include "vec_internal.h"
>  #include "sve_ldst_internal.h"
>      } else {
> -        float64 e1r =3D float16_to_float64(h1r, true, s_f16);
> -        float64 e1c =3D float16_to_float64(h1c, true, s_f16);
> -        float64 e2r =3D float16_to_float64(h2r, true, s_f16);
> -        float64 e2c =3D float16_to_float64(h2c, true, s_f16);
> -        float64 t64;
> -
>          /*
>           * The ARM pseudocode function FPDot performs both multiplies
> -         * and the add with a single rounding operation.  Emulate this
> -         * by performing the first multiply in round-to-odd, then doing
> -         * the second multiply as fused multiply-add, and rounding to
> -         * float32 all in one step.
> +         * and the add with a single rounding operation.
>           */
> -        t64 =3D float64_mul(e1r, e2r, s_odd);
> -        t64 =3D float64r32_muladd(e1c, e2c, t64, 0, s_std);
> +        FloatParts64 tmp =3D parts64_mul(&p1r, &p2r, s_std);
> +        tmp =3D parts64_muladd(&p1c, &p2c, &tmp, 0, s_std);

This change results in our incorrectly reporting an input-denormal-used
exception when FPCR.AH=3D1 and some of the halfprec inputs are denormal.
(For AH=3D1 we are supposed to set IDC for input-denormal-used only for
single and double precision inputs, not for halfprec. We achieve that by
having vfp_get_fpsr_from_host() mask out the input_denormal_used flag
from FPST_STD_F16.)

I think this worked previously because we did a float_to_float
conversion using the f16 status (float_to_float consumes an
input denormal, which we don't report because we use the f16
status), and any f16 denormal is not a denormal in f64 and
so the 64-bit ops never see an input denormal, so using s_std
wasn't a problem ? (Also, for the operation using s_odd that
is a copy of an fp_status so any exception flags set there
never get copied back to the live version. Presumably we
relied on it never being able to generate an exception?)


I think it might be right to use s_f16 instead of s_std in
these three operations:


@@ -1277,10 +1277,10 @@ static float32 f16_dotadd(float32 sum,
uint32_t e1, uint32_t e2,
          * The ARM pseudocode function FPDot performs both multiplies
          * and the add with a single rounding operation.
          */
-        FloatParts64 tmp =3D parts64_mul(&p1r, &p2r, s_std);
-        tmp =3D parts64_muladd(&p1c, &p2c, &tmp, 0, s_std);
+        FloatParts64 tmp =3D parts64_mul(&p1r, &p2r, s_f16);
+        tmp =3D parts64_muladd(&p1c, &p2c, &tmp, 0, s_f16);

-        t32 =3D float32_round_pack_canonical(&tmp, s_std);
+        t32 =3D float32_round_pack_canonical(&tmp, s_f16);
     }

     /* The final accumulation step is not fused. */

I think it doesn't matter whether we use s_std or s_f16
in the final round-and-pack step, because the only differences
between the F16 and normal fpstatus are to do with input
denormals (separate flush-to-zero control, and different
denormal-consumed reporting), and that happens in the
"unpack" and "do operation" steps; nothing cares in "pack".
I went with s_f16 because we usually do the whole
"unpack; operation; pack" sequence with a single fp status.

thanks
-- PMM

