Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0351AE9B251
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 11:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuqTE-0005q0-Vo; Tue, 24 Feb 2026 06:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqTD-0005eu-7I
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:20:51 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqTB-0002yS-EI
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:20:50 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64c9707fc11so1056367d50.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 03:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771932048; cv=none;
 d=google.com; s=arc-20240605;
 b=EtHDo7iUUJJ5fsbGgoaCAa4rH5yccL8mrnJptd1cYJ8bpmmYeDhTTOCZpJ1N1GuWww
 hrQP2VviJTnAg5ZXJJG3K57Bm2jVi95UZjiZgCCOGJmJe5NLdAUOIfK0wRgyVAiRKeIZ
 kLTX04uh34v0fO552nSM0sA1+2bGeul8x5SkiOy0502VSw+IeBOK1brNVcMu/Qtu0avZ
 nRdukHKYVxCzuydNFksF7OLRdr0hKFH3zDo6MK6X33/4VwWEstd82Jo+TCZMZT4kK3OL
 qp/ZcnmGZwc7Sbb6dNQLm/Ux+PKukssTvkE1hSKGO4Ls3ycWCQtRrJudEUyl5dp3YgSy
 nYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Iu0tbVQseP/ba2U+BTwo7uXn9iBtyXOY7Am9eLC7jcM=;
 fh=69uBB7HzuH12rDotWjAdddaFi60MWWqdV9p5LMkiSWQ=;
 b=CL60bTfOy6L9ITJgMDDiVet+8mZglzEo5Sw4QN65rgCMCr0PVHEL7l6czFq62vbtBt
 sjdM/VgQ0u6eHP8/YB+/sh+ElE0OTOXfddsvYBkt4vQRj3dGq8AL8JF2/BhaHER+6Zjq
 r4Sx0V+UbI9SfyyKTOnboekKJdlHygFjf3yzK3fMUcLGtmyH7ToKP+fj4dWHRnkgDjZu
 5s0o9Xa5M0Wk+j12af4aGzyIsPH2wsGFvNXFVJmyPKYNx6AvdwODcbbFYuduqlRizks6
 ZgkQ4eACNvytTjWVZcsVaj6s+H8FGeOGSIB4TIJmO2NGKEzGuqsesYb7Q+oCCTuPa3Tg
 955g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771932048; x=1772536848; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iu0tbVQseP/ba2U+BTwo7uXn9iBtyXOY7Am9eLC7jcM=;
 b=FSPYKOz2qQmigG8aBcCyaGpkGRrmn89IIifhdFr0A1LGm1lW1jXh0yaAvLxFVGY7th
 Uduav72rH45sdiqobp0PCF3+8Kcti4DNLu/cWtOPl+AeKisqDepCN7DY4GU4Jh5RSIyz
 NySNpI9JyFcdXT+xDXDzyvFTr2yhNDir3oOnj8HW95R1KTUGz+P5/GqnOHMUPAaXA39z
 UHal6hfIueWjHD41Uf20pXni9R/7/u76ijeP7iTCgTaFFRaUWY1zD82istVaQfyr9Dgd
 OgdYZJP7ZRgEc2TAq8JP3anoIhwMKNYSQeSibts45oPQAz4KciFsJQbfMUokyNBgsyTh
 7oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771932048; x=1772536848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Iu0tbVQseP/ba2U+BTwo7uXn9iBtyXOY7Am9eLC7jcM=;
 b=MytZee8QZjHEc/erHegfGFVDRYUHPAI3Yba7FiwlhtI2BdDKaMXQjaviMrbRI1W6+q
 lssX+Op8uoeH9FKEeszPgNoAUWldr8OD4+TTMvmCw3yKkGyav+Q5LU4pvMaFQQH8ljMU
 k1rHHJZ1DwvaFmn0r0M/+TL42N0k/gwdJJA50lSltqN5VfRFhaEzzXb+RpNe6eR9tAc+
 kar1KsFkHHFLCBd3nb1dARK7SV/t0SFpUv451ir365LQUgFBNYAnC8anoQ0ifMgwAHsA
 TJdh5EeLfIF13QrAC5k6UWCyutw+j6QXIwD9JqLDcMK+VWc0TuaGtrQoZl02rGJeUEJW
 WlQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZXkcbSBzSiDRRiHlfsRn001H3+6MLjLcuc2uxHkyTkK7K5wZhZ3QEiKn+t4ImZLqQQY9QZt95cg==@nongnu.org
X-Gm-Message-State: AOJu0Yw7LJPv2p9vM7HuYuUd/QJRNttgKrUIqgaeDqmpnRFe30+qHWxf
 ZXnQigZWiDf/WcvGpkYiTmbMJQvIjrDBaWSYqgdnX6SYcTkdFLS13yo6r9s3NUI2neg9IuJJCX2
 8peDzx39st1+8xyjY8x7C8z4kQ9Xhy4czA8rvwrlynw==
X-Gm-Gg: ATEYQzw07hB+ccDLuuq0VanW1PnhQn101rvXVBU1Mzvf1Zr+jsSKy9oam3IFk+Qgx0Q
 XV5yuTElgoQVAT5HaIni4RUX4QaXgJZmyMRpcdNsv4O2WB0tSFldpALAg0EHZII0UIZAIAiBXem
 kNp+sDosHoOik+Al0JA3H0Od4KcqsQyrzGGz/dPn+gSc1De+GT7z754RnGKyV158IB4GqY0nw/Q
 qpJG4IYgA7Br+c8rtKitmRjIPQNNoNibMhrGoQp5873Kwigazi5Wa6j5N2gzG/31lXpHJ+dk8i8
 AY8H4+tdWLhc2SU3mT98z6H12C32KzKEd6lusAfb9jbpsjMbQqFXOduEbDskefP4Q4Y=
X-Received: by 2002:a05:690e:b42:b0:64c:a0c6:da8e with SMTP id
 956f58d0204a3-64ca0c6e1b2mr707107d50.29.1771932048203; Tue, 24 Feb 2026
 03:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20260220171945.1065102-1-alex.bennee@linaro.org>
In-Reply-To: <20260220171945.1065102-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 11:20:36 +0000
X-Gm-Features: AaiRm53ORj6AJMwhJVxXCQsyYwC4uwXebvfspEo9Df4aMCGz7EyGf1oI8zBQFfc
Message-ID: <CAFEAcA_rhRnJWQoC501HimdutMKessVbAF3VV=J6tFFvHMzriQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: set the correct TI bits for WFIT traps
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 20 Feb 2026 at 17:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The WFIT trap should be reported as 0b10.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/tcg/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 4d708635068..aa14f15eb62 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -448,7 +448,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>
>      if (target_el) {
>          env->pc -=3D 4;
> -        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el)=
;
> +        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el)=
;
>      }

It would be nice to also report the register number in the
syndrome (especially since KVM will use it if it's there),
but that is architecturally optional, and getting the TI bits
right is a bug fix.



Applied to target-arm.next, thanks.

-- PMM

