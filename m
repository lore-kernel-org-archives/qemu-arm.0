Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15EBCD8CAA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 10:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWu3h-0007oC-Ic; Tue, 09 Jun 2026 06:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWu3Z-0007lF-LE
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 06:51:41 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWu3X-0000lH-Hl
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 06:51:41 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6607048fa62so5330448d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 03:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002298; cv=none;
 d=google.com; s=arc-20240605;
 b=Zc7sZteK3PMCT887D7ufJLJjAwLXR305ZeebhWGjSvP1FN5kuq6gGxA6k4HL8krexn
 4+gJZQtTOgM/tcw5YJigMlM5ak7e1p2LUkQamMKP58br8iiqxH6pREgyDcqszl92Pu61
 950aQPV3YsWFgHJP+NAlk+/SYXhXJCh66MSG6t7Wd240aPG7S4Q9DoLgMJx7Mcgr0Xad
 ziOuZpme6QNfX9x0XETuZiIWgjy5x3TJYWXs1Bf1SORQy0AyQLo05KRtwH16/PCxLAB1
 qN0ZP0hyUCE8LxbEinXqX4je5R6mvykPuVvELU3BdZ2ybpuO9bW5k/6vlq2AgmyNHMy+
 Ithw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WiZyWl3UNuvsRsJvmXehW74+HCKdcWPr+4Zi9gv4GnY=;
 fh=JM9i3lUQfGcBKKEAjbRSWm5DpPsc1WwtGrvxFPCj18w=;
 b=V0i/sciMpSXXrrrT3OzhEDcQvbbyzO9+IaUDPiSyTkvIwfo9uUdilZVscvLrIBFXiq
 shMzzhW0IogYE0+Fx/InXZenY3fCQV+/XFhHFWFWecSgamK+ezBVg8uzaYemK+O/iL2q
 1QBQLRGNqcvLm0V+ZqqjPFctozdx4hF3tLWkQqTLs9DJydaDnkMCb66m9b6MVidErH3L
 jqvqspgxNXIXbN9tPHcUzJB9ycqDXwyP/98EOzhJZ6dACe30jgBkDTJPBQrGatFYKabF
 kEBgaE+ySatzUDpSvakUjh09rHalxl3GH8/ecG7gyGBS5H1KOFE3xosTZVNAQui8dRhD
 Eshg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781002298; x=1781607098; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WiZyWl3UNuvsRsJvmXehW74+HCKdcWPr+4Zi9gv4GnY=;
 b=o2wyeBta9FmVc/GiSkd1C3LuXW32mV7k7OOP5M1WYiq208GF14VVEBxNFvT4dEPuwE
 AanVo/0ph3pjBaImQ8MeRUm2HXxnzRv+DnumsRdas0S1sxquVNpTn5KjkyC0lHI/HrT6
 dez62M59p/uQghsyB+8rGbEEn940wbFdUn1dPVVs8GzWLp3Ig0llX6CflepAe9PQ32rU
 5NM8SHIHqK0L15CdUvVG1QHvtEYzSNkRXEnWMm3moFUP3PbE2Eq9bL1xSuWl7h5Yo4Cn
 s6OL2RLPw1wvFys5ZcrYf0jG7IvfZiFMXms9DlLDbiGlLr4T39mFbKPUYaBNO94DO+Xq
 9vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781002298; x=1781607098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WiZyWl3UNuvsRsJvmXehW74+HCKdcWPr+4Zi9gv4GnY=;
 b=DPv1L5mv6F902Cq4W1swzt743h9Wd9DTxdpD+CR5qspAjBx3y9q6sroMp7AX2ntDUv
 DEf9ITRFZKet9ndo9bL81wWMSNum933G93eKFZ/Az1nMPlEQlGGHwfrl1uaBh/1wz6mf
 74nNjn1SnQatOpQnt8LYbuQaBmBYAUXNDiSTSULbaKSObuDPgthzUd/7P2Sd11pxjOFd
 WYCMYMZ1Nr23dWGaGakRRzB1wNxcmT5NYIdf9KQedp6t9LJIsXet5Es00iNX9TYAw+PR
 zSRa4xFVXAhBijLch/Zyh9HxIeq4DWW9syJ6zOAkMoVFQhtlbjsYD81ERktMxPrLxdl5
 zkew==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uB8DJAW/IIhqhY4VrZZrta5EegaCSn+7u3L3b6of/Jadi/6ZFtyTmPUCunqQhDNPW0KPZ1AN7rQ==@nongnu.org
X-Gm-Message-State: AOJu0YxV+FoHRKRGflvzyMLDNiWgzFkYtyywTp8eTIHoqdBHlDe0tR/l
 OyxVxRa4ly44U6XEgRyp7uxUI/DCxrRIygIaGPkiQNFK8YI+W0LeFYxnivEMj29DziR+SlcHsUC
 Cf7K2jliAENEiuOuuR+bAnj+x/PDvi8JhkwTALPKADg==
X-Gm-Gg: Acq92OH1vjOZ6+m1GA8FfKaeXZM4RVYo7Bqh4XXCcZaWpFnLDrw+xk38TTpfFNPiURi
 sU7o1HSW2DVJzlYzQNiTwbvUyZ2dtWjodNLav/a0S4VSzjif5dD/vlIcW84TWaLn5JTo3+Rp4rY
 to3ZUasa2R5A5PWoZoz7def5AujExGU0KGY7ACCgOGn05gumBjt5dGr//on87FXzcCcI5/QuUPc
 nuhf+FMIMs9mE8FTN0SX2eu7pfX9dbf5UhZKAcTF/pNLsYxOBEjo34eyVxCB7ytk5WlxmCw4YJ7
 XEId/eUPVnvXNbrqEX3bqpz/R0ytoyncyo5SLxkYNKdV/mI3gWQ+IG3FGZjpCoMELZIyv+FYc03
 qFW8hfRYx/FZF
X-Received: by 2002:a05:690e:400d:b0:65e:4b1d:c694 with SMTP id
 956f58d0204a3-6614f7fa798mr1629260d50.45.1781002298059; Tue, 09 Jun 2026
 03:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-4-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 11:51:26 +0100
X-Gm-Features: AVVi8Cd2bDzh1nnNMTkt48l5Y8fzUkghxDoyBBUzWP8cZiHjqmAZRgzGwB60FQM
Message-ID: <CAFEAcA9D3x7hD=RmhddTmuHWvd+cpp027A18k+OQY3sPiQrW_g@mail.gmail.com>
Subject: Re: [PATCH v9 03/45] target/arm: Use FloatParts64 in f16_dotadd
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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
>  target/arm/tcg/sme_helper.c | 96 ++++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 56 deletions(-)



> @@ -1240,48 +1238,49 @@ static float32 f16_dotadd(float32 sum, uint32_t e=
1, uint32_t e2,
>      float16 h2c =3D e2 >> 16;
>      float32 t32;
>
> +    FloatParts64 p1r =3D float16_unpack_canonical(h1r, s_f16);
> +    FloatParts64 p1c =3D float16_unpack_canonical(h1c, s_f16);
> +    FloatParts64 p2r =3D float16_unpack_canonical(h2r, s_f16);
> +    FloatParts64 p2c =3D float16_unpack_canonical(h2c, s_f16);
> +
> +    int all_mask =3D (float_cmask(p1r.cls) | float_cmask(p1c.cls) |
> +                    float_cmask(p1r.cls) | float_cmask(p1c.cls));

This looks like a cut-and-paste error : we don't take account
of p2r.cls and p2c.cls, so if those inputs are NaNs we won't
handle them correctly. This should fix it:

--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1244,7 +1244,7 @@ static float32 f16_dotadd(float32 sum, uint32_t
e1, uint32_t e2,
     FloatParts64 p2c =3D float16_unpack_canonical(h2c, s_f16);

     int all_mask =3D (float_cmask(p1r.cls) | float_cmask(p1c.cls) |
-                    float_cmask(p1r.cls) | float_cmask(p1c.cls));
+                    float_cmask(p2r.cls) | float_cmask(p2c.cls));

     /* C.f. FPProcessNaNs4 */
     if (unlikely(all_mask & float_cmask_anynan)) {


thanks
-- PMM

