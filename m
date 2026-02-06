Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4E8EE20A6
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 15:29:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voNlc-0003Pi-41; Fri, 06 Feb 2026 10:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voNlZ-0003Oo-Qm
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 10:29:05 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voNlY-0004oy-8V
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 10:29:05 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-794719afcd4so23710727b3.1
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 07:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770391743; cv=none;
 d=google.com; s=arc-20240605;
 b=L6FEPzIOhhGqtuLAPHNyvBOnxY8asoxo4mLwmTKYoRECff7fmOpDX8quW0wZIj4oWr
 VwsVFUWvpWzcnqJp8TEQyOspKuffD28Bq9GO/9PsUC3T1/8WUSJWFy7maOOynOBbPjFM
 VDhKwOTISXgxivYD3HyIZYx5sw06fWs2gmKdsxtqRzrl9VNmSJI/hcAookCxByyTCCAA
 1OUpdPnPpF2bL//G6LaZhu32ofO++wi1lDt8orZkPEIcCXPqKBlRrlGirCXM1rgcwMJl
 IIONZmf2l5B8tA0kRN60iOK1zBm4mLW/yaKFMLCXXE1lKo2bvpIwjMR/JONo916zI6Va
 dkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=W/EC1oBs1ewzyTH+kZEMtwhXVAiWd9mTj1Nuyn37lIg=;
 fh=T1gi0NMur7QhwNNsjs0hlHO2gZ63ht/rf6MJr2SDNBk=;
 b=ZrSm2BdOrxGxDBX/28IbG312DKb1VEvIazN0dR6q+ENdxMkaDZ8m/K3Y6jCjW7aKeG
 IKcDXakMDLd6lQPvgLib+PfSTd41lJIvplpl4Ucga1nP7Zu46vdf3w3+Pckdv44YeDR2
 TZXErJilYDKPXlbrSrutBj1NAhrOrPGq0XlPEllu6FmX6YECMIzWyFMfapvvKbMyCxe3
 7JRSXoZ7aCds0PccF4xpFmomPGfF4a5a9IK9UUrpD5h5cgKqrWAT3GEjfDb8EfwCiJXb
 pksLN4NA0pzCAH4SwoHTdgttO3h3hjV91g1OrW7bIJO+BrorqPRdogqaxme4oSpHJQbu
 x0sw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770391743; x=1770996543; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/EC1oBs1ewzyTH+kZEMtwhXVAiWd9mTj1Nuyn37lIg=;
 b=VYFACtZlAvEd3PXqvmrXfsPG1PZCf2fQ96OWfaQuwm4PIDBxDW3BXkJuBFMLTkMX7R
 3+bEzLj2MDJRg+mJ8Mt3NSsM/7kpC2FODUVXPj/73PZSi9JzZLHzS5kWGeMt8ARK8Mqv
 RSb1xRas1W0lsEe1vsVl64M/7a+5sG6oeGWx+CHVCvoG/Yn7ijgp/aX49iZSeyyReriN
 +91FxE1dmELQvJV3Q6negMPuvIzbYVuR6Z0/Zy908h3QhUpvq0BAHmENjNcepdWOWfcL
 LUfetTZwSXrit/0ZGB1hRPYk9WTlKN3nZL+zi00xRvw27JQr+eVe4okPF4e85Q5azy1y
 cC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770391743; x=1770996543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W/EC1oBs1ewzyTH+kZEMtwhXVAiWd9mTj1Nuyn37lIg=;
 b=cMT2U1AZ8J3+OevInm4tVG6TPU8IfLQca3d4MImm3gA1ZDemW9a6MiqUC3pBmMSoeD
 g/5jrTj1wMeQvr4N5V0rqRSMoMvocqRLQoyG8P6m4GgfJupReqExNztZa+73Qt0C89YV
 l4N8jGhviaYdd78hsvj3LCuqUkze8ITOqR3NH+SQ6I1+Naaxnk7//MAU8w+t8bzdcB+x
 jIHCnChbGbUhwWUMnGD/ZT4kIMoD2xXEJQ9pX7V+o9guZubaa14soAcUBSnCMT7x3Fkq
 ZJ2rAxiZkOnnWkt+oLGhkwm0I2KZAcO0IDJytwZvEgjh+OejCyPSkn4jRGyhhs73zXu0
 WNDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5BR+Qh3Gd9C10Jha6Wk5EynhOxLFWJcdcR+YX9kPQE7Sn8SB7UcBJdKxPYOSkP7Gm+vuiZDaKUw==@nongnu.org
X-Gm-Message-State: AOJu0YwQgtM08v/GoBgmo9HBFsaLvV9XZvUbrvaAXAwPjHHd2z3sDX0R
 tCDnES+tPemxf200k5RZXYPCCPHkRKZgQ5GCzVCaks7VaF8s6G+Fii6TINEZbHUYm9P1gv/+XaA
 /XFTLBUHrBGcPr7PIP+QodVgmRZ61qAeHqGM5VAjJ9w==
X-Gm-Gg: AZuq6aIx+74L3N8hBF34VoibFN5lJRr3TKSbhbaBIIVEripN+dzWcIC6/VJqC9A0SyZ
 gFvGInOkGvt9li+TCIdbRH7BK8S7ZldcpP4Jrw3cHnqSt+cJkPqStSEyt13spceUb4aUkoJjrMv
 cl9s/EP3xgLwYvY5C1mgxT3+80I/m+HWgKJszFhnhwzUxlYu91cVLHTmHU9pV4kxlytRFRgM2fA
 Ec6eTAXyBbqbShv4mJPuRFSqav6pJJLR3LzSkUfeRytnQlXLBhn7wweos5nE6PCsxTD3+8ioNJs
 MGTug+ZU1iPBV4zCeXV6WCD4Od5L2zg1R5Xn2LSZVCfKKVKBX5zs/UY=
X-Received: by 2002:a05:690c:f81:b0:795:1f65:4154 with SMTP id
 00721157ae682-7952ab7c6d9mr29299997b3.64.1770391742901; Fri, 06 Feb 2026
 07:29:02 -0800 (PST)
MIME-Version: 1.0
References: <20260202153618.78675-1-philmd@linaro.org>
 <20260202153618.78675-2-philmd@linaro.org>
In-Reply-To: <20260202153618.78675-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 15:28:51 +0000
X-Gm-Features: AZwV_Qg_0BcctXaQStDMgnJhrLIefby8I9YJsgSPR5ZP0MwknPs1oZ83uyNgsuU
Message-ID: <CAFEAcA8CtzzyWQxeV+zBZMU0JEacctMGvC5dezR+n3J7xKYiNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 2 Feb 2026 at 15:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Since commit a0032cc5427 ("target/arm: Make 'any' CPU just
> an alias for 'max'") the 'any' entry is never used (we use
> 'max' instead): remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu32.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 0b0bc96bac2..2127d456ad6 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -897,9 +897,6 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>  #ifndef TARGET_AARCH64
>      { .name =3D "max",         .initfn =3D arm_max_initfn },
>  #endif
> -#ifdef CONFIG_USER_ONLY
> -    { .name =3D "any",         .initfn =3D arm_max_initfn },
> -#endif
>  };

This is not entirely dead, because it's what causes
"qemu-arm -cpu help" to include "any" in its list.
But we already don't list "any" for the qemu-aarch64 help
output, so it's not really a problem to drop it from the
qemu-arm equivalent list.

I've applied this patch to target-arm.next with the
commit message adjusted accordingly:

=3D=3D=3Dbegin=3D=3D=3D
target/arm: Remove entry for "any" from cpu32 arm_tcg_cpus[] list

Since commit a0032cc5427 ("target/arm: Make 'any' CPU just an alias
for 'max'") the 'any' CPU QOM type is never used, because we change
"any" to "max" before creating the object.  The array entry means we
have an unnecessary type in the system, and the only user-visible
effect is that "any" is listed in the "-cpu help" output for
qemu-arm.  (System emulation already doesn't include this array
entry.)

Since qemu-aarch64 already doesn't include "any" in its "-cpu help"
output, we can reasonably drop it for qemu-arm also; remove the
not-very-useful array entry.
=3D=3D=3Dendit=3D=3D=3D

-- PMM

