Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC67D172C2
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnElL-0003uQ-Gk; Tue, 03 Feb 2026 06:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vnElJ-0003t0-Tl
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:40:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vnElH-0007Bd-VA
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:40:05 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so901963366b.0
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770118802; cv=none;
 d=google.com; s=arc-20240605;
 b=jsHosJLJEQYmd4MlgQ4d8z7qEjQEcbh4AtZZJScXOHH7xvZCtxNw0VFlur3ieVgAW3
 dG5eSwPyS1Ny56T03KlGvyMzIjDL6mRHUE1JQu3w+aPDMklTpgQBIe3d5uekK+KyoUls
 R6LkhsAThb3s7ojCUzc09lw9MC9WACS7AXdVTnXtv9QgDDRWd0284H2LbZ7TiEfhOQfz
 VEjZNBW7y4gHiAFPWvuwsUAHURPV86Xf5LY90bUTXhow41G8J3BCxuNsLJUh5zv8mNzm
 AZoj6Uc2NwnauIhKewUYajP6t7x7okoir4qfn+Oq0+saLm9YbNzVCMEXY02cQJWo1DRx
 XJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=76JTyhqbIkeNRXU0ionHlFwDOADJj7YSYS+a9g+Smy0=;
 fh=qCFbztO3dhnOhG6Pt66yv+nu+y+qT59A8ZMkB24Ec0Y=;
 b=J4J4r/VKSvH/g1FdlcIUXvpgStdRAQtK9PG6900xV7SghheZaM1uxc+p2y6nonnfgv
 Ceimc04KKI/3NUVKQyZZhAbrifAE10GrknhT11b4h2aN9HS9gmTBm0PxNdgfF+otHeNT
 tiaGtmh54vobLrYc1xG7qa1KeiSMSfg+CsSS3JtKNqJ9aGhMvxRy2HPA7cuyG+72TkyH
 lUA5ACx+D6GdmP4Q8hXj68rHUizQ4fkdoBQO7ijUcgKEnXCZUgFcUuhMgfQ2UxScGzfe
 JhlaMrVVB9eUUjYI/G4oH6wWgFIaK3vDcAAe8JHbfzUPwfYaavON0SnrRgsFIBSJ/hlq
 tMxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770118802; x=1770723602; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76JTyhqbIkeNRXU0ionHlFwDOADJj7YSYS+a9g+Smy0=;
 b=rOeiyvvWGjUbrAJN9U4P+4uXXpZavS6CvYFPoh0Rca92rF82Q9QRzAFs8rmJS910R1
 pBQV01HuiInghtI8b50yzKacm/e9x4J/ye2s5Rm8tvwJr+CHbeXdQKyie455e9z4mV6F
 8CUxu34DWAi2ZKOhdI39uTnmavVBTZ4ttkrKNWnZ1kqrTfECbflxdpdi+dr/1MKkEOdN
 gFV+Xg02w1dsdvLvZUEauvkpk43pXlDutu09M26EYVRiHV3HVm31UH3FSy+R5W6Xg/tS
 MCv0oqUpmsSSwy8CzPMAg5xvGeisxoMaBne7+FoMoiT0YcvEJXlDXPpWZHBvtiCfgbgE
 d5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770118802; x=1770723602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=76JTyhqbIkeNRXU0ionHlFwDOADJj7YSYS+a9g+Smy0=;
 b=LnYhumLh58y13+S+q7YVjo2kDZlS4IVvOvaD6DrdButpWH80ZCUkhgCwiDd8UdfdKk
 5N9A3VLnDu6Qt0uD2ZOersNgOwxfRT46GsDS+82FkMNRT+t4i8yTRCwOKsTYRHgwB1En
 Lr8a0Ktzsy5IT79uU/4HzHy0y8QB3NubEEGi08C0RDjkYHZSjiY7MyOwnfFUvuxo3PV+
 Jd9rwg8W51/bSOJudgDjcHg+epRH/dx9pxnA4IBUBijJO7w2IlK1PV/crPA9qkl+AQ2z
 aB5Sk5W/DHhKVz5Mwq/CeMn2I0amtCe8Hx2fTFVwxxs7JtkkHC1aUG8i5Gc6f8aR+NMV
 MeHQ==
X-Gm-Message-State: AOJu0Ywj8zKsipn53KNflucMB7EFrFIjpSbq/99LJGm6POMbp01lrUDW
 fKfRAikaYa87rnt/nYp1IfeB+g7K6yxGDRxUH2DWKNyyXuxK0XycL2r3OeFJM9VF8FRMS8/0bMh
 4BBSLY158Zhu+RrAj8WQV76Pk1+3b/ibZ3FuJZ7zVqA==
X-Gm-Gg: AZuq6aJnIJmzEBjJKljZqgWLMGskZi0s86/RlB5wJAxtP6K/41EkkGpEfRx5K/yhjsk
 ELQc9zKmxmNn+Qh7i+FR17j/3TM1Y0pgsoDl+PzjCbmdu9hXV3MIeg+Iwd0Aw6fyk14/swqArHq
 NR8SG2yDHwTM7DNznveaDSENbmnhe4Ur7jWfFjCXWjCgQX3Tz/LZaZaZj810DzfV2Yda05qsEfI
 y5yGz+jdrD4W9yY7kQig79rnSKs7OOgXK4GKsb+bCk4s74vtUSWfAeLhCNlPkbqE9vCKGLcuFXe
 +XsBvYcP9CULC3JIbAoF4nQovmfbR+/kOHZT
X-Received: by 2002:a17:907:1b1d:b0:b87:1d71:f44d with SMTP id
 a640c23a62f3a-b8dff591487mr930268266b.11.1770118801990; Tue, 03 Feb 2026
 03:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-6-peter.maydell@linaro.org>
In-Reply-To: <20260202133353.2231685-6-peter.maydell@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 3 Feb 2026 13:39:36 +0200
X-Gm-Features: AZwV_QigU5OtBvy1foc9UUNJACM9EUMeEambHHM5LbCdlnhesSVL63jxkMckxDA
Message-ID: <CAAjaMXYFZ2vFGeKgsExwdCpQGZW7HHeocU=k9AVuxcvVJbNA-A@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] target/arm: Don't let 'sme=on' downgrade SME
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62e.google.com
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

On Mon, Feb 2, 2026 at 3:34=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> In our handling of the boolean 'sme' CPU property, we write this 0/1
> value directly to ID_AA64PFR1_EL1.SME.  This worked when the only
> valid values in that field were 0 (for no SME) and 1 (for SME1).
> However, with the addition of SME2 the SME field can now also read 2.
> This means that "-cpu max,sme=3Don" will result in an inconsistent set
> of ID registers, where ID_AA64PFR1_EL1.SME claims SME1 but
> ID_AA64SMFR0_EL1.SMEver claims SME2p1.  This isn't a valid thing to
> report, and confuses Linux into reporting SME2 to userspace but not
> actually enabling userspace access for it.
>
> Fix this bug by having arm_cpu_sme_finalize() fix up the
> ID_AA64PFR1_EL1.SME field to match ID_AA64SMFR0.SMEver.  This means
> the "sme" property's semantics are "off" for "no SME" and "on" for
> "enable at whatever the default SME version this CPU provides is".
>
> Update the documentation to clarify what 'sve=3Don' and 'sme=3Don' do.
> (We don't have the equivalent bug for 'sve=3Don' because
> ID_AA64PFR0_EL1.SVE only has 0 and 1 as valid values, but the
> semantics of the property are the same.)
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  docs/system/arm/cpu-features.rst | 10 ++++++++++
>  target/arm/cpu64.c               | 15 +++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-featu=
res.rst
> index 37d5dfd15b..024119449c 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -318,6 +318,11 @@ SVE CPU Property Parsing Semantics
>       provided an error will be generated.  To avoid this error, one must
>       enable at least one vector length prior to enabling SVE.
>
> +  10) Enabling SVE (with ``sve=3Don`` or by default) enables all the SVE
> +      sub-features that the CPU supports (for example, it may also
> +      enable SVE2). There are not generally any lower-level controls
> +      for disabling specific SVE sub-features.
> +
>  SVE CPU Property Examples
>  -------------------------
>
> @@ -430,6 +435,11 @@ and all vector lengths must be powers of 2.  The max=
imum vector
>  length supported by qemu is 2048 bits.  Otherwise, there are no
>  additional constraints on the set of vector lengths supported by SME.
>
> +As with SVE, ``sme=3Don`` enables all the SME sub-features the CPU
> +supports (for example, it may also enable SME2), and there are
> +no lower-level controls for fine-grained disabling of specific
> +SME sub-features.
> +
>  SME User-mode Default Vector Length Property
>  --------------------------------------------
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4dfc03973e..26873a39b4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -363,6 +363,16 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>
>      cpu->sme_vq.map =3D vq_map;
>      cpu->sme_max_vq =3D 32 - clz32(vq_map);
> +
> +    /*
> +     * The "sme" property setter writes a bool value into ID_AA64PFR1_EL=
1.SME
> +     * (and at this point we know it's not 0). Correct that value to rep=
ort
> +     * the same SME version as ID_AA64SMFR0_EL1.SMEver.
> +     */
> +    if (FIELD_EX64_IDREG(&cpu->isar, ID_AA64SMFR0, SMEVER) !=3D 0) {
> +        /* SME2 or better */
> +        FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR1, SME, 2);
> +    }
>  }
>
>  static bool cpu_arm_get_sme(Object *obj, Error **errp)
> @@ -375,6 +385,11 @@ static void cpu_arm_set_sme(Object *obj, bool value,=
 Error **errp)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
>
> +    /*
> +     * For now, write 0 for "off" and 1 for "on" into the PFR1 field.
> +     * We will correct this value to report the right SME
> +     * level (SME vs SME2) in arm_cpu_sme_finalize() later.
> +     */
>      FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR1, SME, value);
>  }
>
> --
> 2.43.0
>

