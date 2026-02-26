Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8BFC591F
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYTE-0002Pb-Dl; Thu, 26 Feb 2026 05:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYTD-0002PM-3j
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:19:47 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYTB-00046m-Kb
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:19:46 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7987531082aso6447257b3.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 02:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772101184; cv=none;
 d=google.com; s=arc-20240605;
 b=Qisv5owfBNNB8va28EuAZdzOALeEXul0QkNarPoixxR0WWL/9aj8tRhtnd9RRSVoxC
 HWONR/MX63fgAp/xV8Yva6fS7j5t+V0pdzLg4FKv84n9ekrPe8xmiooez6inw0aPizbA
 ankvNVPABEvCwJnHkT3lRNhSMVBrVwFmPoSRAGUlNmP5rtMiW3Rhi6qMzNPzgpfg3eX7
 3gHk2BTU2Xjnl3ce2fQfyX0oYuNOiSSv9WD74TktyO3gAYzvBROuGxQdQV/Av+//PXPs
 s+fnm2TS2NnLkYVxljk+v8vgcXsKwKRrnA5188pJ8jQ+mapiVP1TnBJrieCBrhALTz4I
 +JqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ERgBiwPJOT5sqaJzAZH1sG7hvUhBl2XMAdmXa++VDEg=;
 fh=3Xn4ErQEoYA2nKtGKqyFike4hTnuj40zeCW82w71QUQ=;
 b=Z7eCgXeSxIgx4G0yadlZ2HIX8IC/0pvb1AakhfsOrXdLNnOogZKb8rhBGJx0/k49nN
 s1Me6IhxTb1twGbcXWntRV00RMbNcSPIY+Aj95gCZ43jDWvTTcY7Q4FRYso6k+8DO91e
 wwjGLU8EqBurWuSptde+YyTOhSnforVehWRkllucdRijA05Htncen/ooxLA8Z/kDBFvg
 nA9cBZpqMwaUbPPtJENBCqRSuIcjjm8CHMSqeJ+hCiw6rkb7K1KbIDpiUjeEhi/bmA8B
 s8X1yilAVHNfK919pOWuoAC59GSjxojR2ZKNPH6+O7teBE4Uzwko6AjOb1OgmZ/r80JZ
 J6hw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772101184; x=1772705984; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERgBiwPJOT5sqaJzAZH1sG7hvUhBl2XMAdmXa++VDEg=;
 b=ir7sL2q495nJgZERktS/o8pQ11HTvOXUjQx8z+FngmGDbOeNtYa+aNpWHJ2mqPfeHR
 BvYtPZo6ifWwY71033p79sT3C4RQidDQg0O4ZNAouCS1LfdqTSb1B3H7NlfpHCm5KzgD
 cp+/87epuHj4iY2KQ4MZYb4+yrmStySFcosdTb1f3xUH2k6XKZXJ3L6I55Kl3L1gl2lK
 x83rop6AmpIwDExPVnJa/4o3epIooSqyVjXXGdKfLs/9nR4eiGY9fbYdO7mZZSMy7WaB
 R1LAFkcM3nkiilX/0QMt5YJ3v2m41obcBshd8UgCVbdsQ0kWWTpqa7T7Itlh5TTV7k88
 ZrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772101184; x=1772705984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ERgBiwPJOT5sqaJzAZH1sG7hvUhBl2XMAdmXa++VDEg=;
 b=prCYP8q7GfaDn2uOEI7z/b65EkB3aRddHPOG8PEboLlLZCVS6gZCNqIEjtBRew/7ig
 z0suHfUVRoHEq1z8HrJ1FLWQEmGWORx4iv/Ayi7gS2OuhjbQW74F59+gXC86s8Qg4VLh
 TYwvXy8+oKwuZGAwjDNNvaur77vturrvG0+amwvhnMcYH4YduovnIU4BFbLetbOGmoaA
 iTKIj+YZ9i+zoFMhWItQngRGPPI6NBuQBNLSt16z/R+BQiLbbE0HDgSsdXRx/tM6JIf/
 4gHd9V0gxToOFnud/DmhPHNjh4dXVc+wXCKQ+NrDuhjrTR8Cu1L9WwUmLmSez7xGH7In
 G/uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW12bQ4wJt8wt84eVzS9vITj7pm9cGtWSSLYtdw1Qx2zXPL9oVq7hhMJZ6o+9p97VedTzYhANgbrg==@nongnu.org
X-Gm-Message-State: AOJu0YyjVqhQ9E7Khga7MXMNplCi1OK01q6xy2uX8wBgOBG8nlNNmXqY
 LEOjFEGdzjhX6Cp7l8KOrakw5OgxMbMWi0Kj1HRjALgGU8okzuFEfApmniatyRcA8LLhw9avK2t
 CrO/XgvowL23KCO9gABZjoXvNMxckBIYlHIRywvKs+w==
X-Gm-Gg: ATEYQzxTzaaUu1cP29MX2qQ5ZnBaNObbuwzOKIeqmRZkX/UqGeELOI8w5AFkvPPyOdT
 CYDYn3uB56AHQaocftLKI1AnCO61TwvQF3yLDM3kdeQPBjzmbge6XBzjk5wbHxXhL2sECjO/lAs
 UutvdIS/zQBu08uT2QhdHjArzEJnWH69Lnr9PVsTaP6oLW5tUJDK2IKH+b8nK5JJTbqd8e/4gLD
 kkaIxfnqQ9t+4fpkib3VedOWbMmerJtmSBZafpmjowmhBATfCWyNHSGl+MnDbNAIA0cR5ixAPY+
 z7JKcZ6V1Qtwsy9kg2lH0+rLI441SdAhhUn5cvm715aoWsuFnDY9XF+ZYmhx4vwoF8c=
X-Received: by 2002:a05:690c:b10:b0:796:3f2f:a33b with SMTP id
 00721157ae682-79876c1c2d7mr11547367b3.18.1772101183918; Thu, 26 Feb 2026
 02:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20260224154347.344219-1-alex.bennee@linaro.org>
 <20260224154347.344219-3-alex.bennee@linaro.org>
In-Reply-To: <20260224154347.344219-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 10:19:31 +0000
X-Gm-Features: AaiRm50DPzGrXORSCBPZp3zns44SYEPNOpukRR4ANOPj6ov1RvPIjvsrF3rGS2o
Message-ID: <CAFEAcA8BX-YdALLhyYB_mDOycnUaLQ_abmSyK3VcPNQz9E3imA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: use FIELD_DP32 instead of open-coding
 syn_wfx
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 24 Feb 2026 at 15:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We can use the registerfields API to safely set the individual fields
> and avoid open coding magic numbers. The EC and IL fields are still
> driven by defines but we could convert them later.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +FIELD(WFX_ISS, TI, 0, 2)
> +FIELD(WFX_ISS, RV, 14, 1)
> +FIELD(WFX_ISS, RN, 15, 5)
> +FIELD(WFX_ISS, COND, 20, 4)
> +FIELD(WFX_ISS, CV, 24, 1)
> +
>  static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
>  {
> -    return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
> -           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
> -           (cv << 24) | (cond << 20) | ti;
> +    uint32_t res =3D (EC_WFX_TRAP << ARM_EL_EC_SHIFT);
> +
> +    res =3D FIELD_DP32(res, WFX_ISS, CV, cv);
> +    res =3D FIELD_DP32(res, WFX_ISS, COND, cond);
> +    res =3D FIELD_DP32(res, WFX_ISS, TI, ti);
> +
> +    if (!is_16bit) {
> +        res |=3D ARM_EL_IL;
> +    }
> +    return res;
>  }

I'm not hugely enthusiastic about this mostly because it
means we would have one syn_foo function that's written totally
differently to all the rest.

-- PMM

