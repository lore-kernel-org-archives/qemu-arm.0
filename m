Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC0ACD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 13:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPKhG-0002yk-68; Tue, 19 May 2026 09:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPKhB-0002yM-OW
 for qemu-arm@nongnu.org; Tue, 19 May 2026 09:41:18 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPKhA-00029M-89
 for qemu-arm@nongnu.org; Tue, 19 May 2026 09:41:17 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-65c1ba7eeb6so3603455d50.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 06:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779198075; cv=none;
 d=google.com; s=arc-20240605;
 b=OmL25hIZ7iw69RChPa2vc0qe1sWICmXgB7q3jR8hqMORnecrHHz/iA4JHnyWUeQRkr
 X+PN2Xfw3EoPIuXzPe3nLW8hNp6U1wkuZ650SRqVPNMPpmoqWnpnvbGMLVXk3a6KQYV2
 ADNaODdbIK7LhsK/MwJgklm6Uur/Iu5IM/wmlK77idpuzFFZ+o6SQc4r/TyVk7I9OXfd
 zoNA2+xkS0tWfuHmiuZZg0yPvPMhWgjguaJFaBmQzYBjxDwQgi8akKzb5U6AQ8JY54Az
 4Vyp4AzqpeZeCx51q6dwj1MGMYqmVqFsX6IDozyV2EFUnZLMCG2YKpe33KkAWaBgLiii
 prHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kNP6oY9itOPkE4pxOHCVKOdRO8IRPVCfs/wkn9O+vO8=;
 fh=dNR5+zSLDS0uUtxhktZWYZOfte+vlR0yRfQCMIzuXqU=;
 b=JaSLCYX/T45a0xvvkx9EDqF/ol1oTqJ3p6NHVDoB5ZpbWoaoE7A+sSDzpvlLsjcxKU
 y5JOlu3Qq5takN0zYSsg2TyrP0/sGxQF77OT/ns+nLGxaIKZULaqAdrBNi4PgFt18gd9
 Geo4KaURlNOF+380uZm0wmDrUr0N6wKJWA8nFmqAcmp2PGi+3lcfjPNIUcgECVR2oUPZ
 Jj8THwuRvJIuqJeqfCl9hwYi/frOpga2wEXGK8VG6SMdFVMf5F/TvXjJa1K93qeAkAkS
 pUo77ZHFTzcs1S+zqKWroG60zLyI+C4JwKV9nia8U1sMv9+1UhOb2FC+8zCAs+v0aHhE
 iV6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779198075; x=1779802875; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNP6oY9itOPkE4pxOHCVKOdRO8IRPVCfs/wkn9O+vO8=;
 b=dtRNg4lxS4Sj9eyXaHm5cMmWOXTWF7vvrzCnBTNWDn8jkvuctg9TtY8em8e4XIfpIV
 uPf5XnsVKqb7vDCUcpcRF4eZbBh3wFnZcy8/WpXFkFujNUCY8oMVbJYBguvN8C49o9nA
 938wiRv7SMS9G5ftYszlQdPERbYxYtfsKgu0R5LdGbdqKGl1N+EC2ASsUX5bx3PdT3tH
 rRtw7lqzTQEcme6aCs08Pw/UQJiXgFBx/GzLPLgTaLThYjXLFsM03mnbv4ZXYUM20Xla
 3JpjWSHAkWbCp49U9tohbsGxC336UOgL8FZB9gS6R2xpavncZosB/4MihBmIApHwd+OT
 L+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779198075; x=1779802875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kNP6oY9itOPkE4pxOHCVKOdRO8IRPVCfs/wkn9O+vO8=;
 b=nElIYbGRTzWjpscZ8g3va1HHBL4BvCvNxscfy23Rknvcbui2LV/ELGw7pJ/LuAdg6T
 76YDhahhNo0k3c4rf1TKFv4p0vdOLxF5hk+IhWVcU1WfDezfU1w4zwi/Bxb9djVp1ML3
 eU5hb7jY5Z/tfUCWrSowU+R1i1GkmfogjoYTEfmu0AloXwGOEHRzDeq8OzGLeFyq2dyI
 +ZBLulMo0UejuAQKZu1m9A0nw8LVFdOACFqyh2NqJyhFch82v6RumWKLd2LsCIFig0o1
 XKTeSD2MJaysFWK8cHaPh4vOzyikg1SVdvATeTHiWsivSyvONehcauEnjRwIueboHuTJ
 Pk7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HBO+L+m+r4y1pikL7C9PKqKr4aYUCj4aE0S8m53Ff8YdLKFKx67f4NxBqu3dwncyxGIobzrm/9w==@nongnu.org
X-Gm-Message-State: AOJu0YxXMPZkG3Hsy2Yh1g++Lq/zI305cFVwjMl1InTnMfsdoiwftlp6
 M0dzxyXhK1bMGS3mOPSxRIkf7TNKqlUWVM9OH8ttQtC9E2ksXdbCnN2DAKuTXj2lKp6993eM1SN
 wwLEpwokZ561YOgjq0d3soHxmw13OOxiDhzjbBhgAXg==
X-Gm-Gg: Acq92OF0G3Ym8Y6CN8qPUpvgtuYCT49kTnWFVp2du7j6xMHO/bRk9mQEqauODQ3Sznk
 qehaUfPJI9xp3cyGBjW2vbQHbDT7xoLbQkHCc9gYXruT7+Sgye8Rxsz36CJfDi49gbjG+Gx4CCr
 NuOnUzqXMV9/CT6b/LtOss2L70H0620euHEpqkaXm+OGBNILLwYXDzY5uQ70Kr+AMWaTOpMFxy6
 txtHMjS2NwBdR4tJVha61ZwyJRAVmcsfQ7nhxA9/D+663JhLoXUQIAxKcMqWDGOmNbm7m++whIy
 QTQBXoLU493N3TuBPp/iVNTTcz6Mk6IZz0tMryU9Bb0yYrbm5w3vix6dGiGJRVo9D98=
X-Received: by 2002:a05:690e:169f:b0:65e:3c29:cb42 with SMTP id
 956f58d0204a3-65e3c29cc8emr12761402d50.38.1779198074745; Tue, 19 May 2026
 06:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-46-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 14:41:03 +0100
X-Gm-Features: AVHnY4JgNbL-2cGA5hrOBFmqcQXwD3PiNqYiuVaWR4kNtgcgUelI7uIImC3qdN4
Message-ID: <CAFEAcA_4wU+wndbAqjnObpvnLit11OVDZvTZ1RWy_q0cNfH7uA@mail.gmail.com>
Subject: Re: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Sun, 17 May 2026 at 01:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |   5 ++
>  target/arm/tcg/helper-fp8-defs.h |   3 +
>  target/arm/tcg/fp8_helper.c      | 113 +++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  16 +++++
>  target/arm/tcg/a64.decode        |   8 +++
>  5 files changed, 145 insertions(+)



> +static void fp8_mul_finish(CPUARMState *env, FP8MulContext *c)
> +{
> +    /*
> +     * FP8 multiplies don't update FPSR.{IDC,IOC,IXC,UFC}.
> +     * Since this is multiply-add, DZC does not apply and only OFC remai=
ns.
> +     */
> +    fp8_finish_fpst(&env->vfp.fp_status[FPST_A64], &c->stat,
> +                    float_flag_overflow);

Looking at the A1.5.5 text a bit more carefully I don't think
we should propagate OFC either for FP8 mul:

"When the rounded result with unbounded exponent has an absolute value that
 is greater than the maximum normalized number for the output precision:
 =E2=80=94 Generate one of the following outputs with the sign of the resul=
t:
 =E2=80=94 When FPMR.OSM is 1, the maximum normalized number.
 =E2=80=94 When FPMR.OSM is 0, an Infinity.
 =E2=80=94 Do not update FPSR.OFC. "

If that's the only case where that an FP8 multiply detects Overflow,
then we should just squash it also here. If there is some case
apart from the "rounded result is too big" that is also Overflow,
then things get awkward because we need to squash the "too big"
Overflow but not the "whatever the other case is" Overflow.
Working through the pseudocode it seems like there is only one
reason to set Overflow, so we need to squash all fp status flags.

Also, I realized that this squashing mechanic means we can't do
the handling of invalid input formats the way we do at the moment.
The float_raise() operations done by fp8_invalid_input() will
get squashed for multiplies. I think the fp8_invalid_output() part
is still OK because we only use it in the FP8 convert operations.

We could perhaps have fp8_mul_start() explicitly check for fmt1
or fmt2 being fp8_invalid_input -- it has access to the real
fp_status so can raise Invalid and InvalidSNaN there.

thanks
-- PMM

