Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F83CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:18:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZ7H-0002gH-Bi; Fri, 19 Jun 2026 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZ7G-0002g1-Ie
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:18:38 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZ7E-00080a-Vd
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:18:38 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66058b880e9so2235156d50.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781875116; cv=none;
 d=google.com; s=arc-20240605;
 b=gsE2Tocf62cpgOBXSHeNjbf2yO08BOR6cOovvdvuLyqEWJisqjOryiBcAusnxxEK6h
 e590ohL8KkqH/h7Obqj7QFfxcL4HRPMerL+MQV/INSKSTExjKyDBCYJSlMw3WdAXfyel
 M/yE9iQZ2mZwyslzRcCmM8zCQMiqzshVd/Bh5OiDbWB78Ih/dKOUzk3kidIrVCpQsZfb
 QCoziikW94qW8XNb9IkKkhE2cmZUi6om6e9no+/v3YqWAQa0S4AK4cfCaLKJZz0GThzb
 6+YLcmOoi6TDDSjeeBcfBw6aHetVfXdJe5uUsaK3mHnbFeRLxk4GmfvzTCSFYRGI+Jtm
 Iucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EmEY+cjbJNIBkK9rxxbzV7Ux6b6JpIZ3d2sXR3Gm4OQ=;
 fh=rlq/3kp8yQ43z7ByfyIIUijj6U5J74v1vgqw4UfxxQU=;
 b=OpLoMBn93zbzGzZnodyoT3cCBsEN9CC3E5J+vDyNBeTvV6sTU7E7nds3zcLNQ/UujK
 YKvVw8DOh9foBul45o7WfK/vXi+GsOz6FOXI0cE4LTIYALCthym1tcwFg1he6dN5dv3R
 CzoclJjefKHaXr6Z5cDcIhk303rlpC1WzOGdheieFjJrrfGghf/L+AKUbCo4dzn9E8wc
 irj8UfoVO4Rdkyok1cdXkkpHRiyWHsnMY9PXi/VxdzzFK/7DmXBKCetCsGjMI8Q/b8cS
 khknvA+wQCVvp0bNzdGPTuOcbCpcSn6eY5CNxJG+5Kuyq8m+onCCn0LiYGOMcqnmmSRV
 Gn4g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781875116; x=1782479916; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmEY+cjbJNIBkK9rxxbzV7Ux6b6JpIZ3d2sXR3Gm4OQ=;
 b=EtorxWMBeWwR9o0NiesfehG1x+7IogrxwNr7hOVJUinVzWnoj5r4vVVbVqYhjarCQa
 o6GQ9s9+ExLVn+7+WZ02gA7z3JeLF3nat8sXSI+eW+WwS5LYU9CuVt5i6ARvOQzYgIh4
 6deCJao6IqhL9DfXprxmQnSqifrcPotaDa1kBfmGpOPmK1I58nrRdjJJ8SHBMeSzR/e4
 qAwOlzAI4DvjIsBGZ2rxiyewnHVfowekmS1Hta1gqv0wg18V4ViNd7KNg6E3CTRIQK63
 PMTLDRebEh0eV/EiLo8woHIWTcG20TEzxoaWm3rV1x/4W5c+iSxRcZaF67Z2R0yTAYx6
 gKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781875116; x=1782479916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EmEY+cjbJNIBkK9rxxbzV7Ux6b6JpIZ3d2sXR3Gm4OQ=;
 b=WhF/Zn81WNXjOcHkdVWg0nzqjb8GP1QNYtUPk58Ny4ZBQj8SkTMQee6bpW7I01SfWo
 AFe+LevPLvrpqoNtCiw6DxHUseaei+VMW1KDl3jQ42m7Zt7kgs65uBT9zeODi3oHx/2x
 tpxleEapw3d/fJl8teG6bFRnlPveXN4nwpB6462pvoiiCvpPSKFR5ekLpYQf60w4phlH
 2ySQn72xuKI6BX6sOEIS8IRA83TWVDgoZaMjJHPX61+adX/r0A4UMjNLwuY104Je4/Oq
 bWan3nlWFjMhnskLpYcGNOq6vmJSTLGXJCBfb0PDJG3KTsXWztEHmkFpwLv3GAr2MeOr
 fwgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XNv8WYmcTujXnP4HyuZz8dvraOe/MJy3/SAHozoZNuzYBsW1zww99NiHYd/4LCjTpZs3e8T8egg==@nongnu.org
X-Gm-Message-State: AOJu0Yy8pdjXw5FqFSaQmc+tWvs9FkLuMlqUCaTjgHXbXQbsD9Z7CSPA
 gz2/RuEFZ6CwT6Q4fWEwkeczlQoF9aXUq1EiJ6fk14T96kdv7K/k1QW3cozyNTJSxprgg/Vsob7
 NpLQroiv9AhhuDh6G1Jt/irQBiF3LJmLrWx80uJrS1A==
X-Gm-Gg: AfdE7cn8j+Fo6RJr0ggUQJeV042MxvL9r1KSq+QymZGPtOYOjRjsKJS6hRArHjF2fFY
 FwlcOvR3FQhAW89hGphcY9HukmK4IkNdo8/feFC7A2cg+6W20gpaY0J2L/W5mQ2Y0KH1bn1NA4f
 gGXQhYiJwQ+cjQioo+/GKcvSHMOACGwr8/Xg13jX0otCujtNMoO4ZiQ+j7qAnYgBaa3vuy1DOJV
 JkXE1crRrSXtnNvvBCyc+zgaW3sUYrlpTuqyNTgRmAZYqOsvc8+N0pW5oY2VtY+qGxOMfvGSnQo
 S6KAs/DpV+4RtOz8QQzMSk1XlymAC4EHTu2V7Twdnt68G3SF8tR1bHFb
X-Received: by 2002:a05:690e:11ce:b0:660:d512:46dc with SMTP id
 956f58d0204a3-662fcbb0086mr4092145d50.57.1781875115603; Fri, 19 Jun 2026
 06:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130537.820184-1-alex.bennee@linaro.org>
 <20260619130537.820184-5-alex.bennee@linaro.org>
In-Reply-To: <20260619130537.820184-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:18:23 +0100
X-Gm-Features: AVVi8Cf-7SRrv9WiiLBvbBYNyVc4TY8I_uOR2bV6pZJYEsQtlTzN9wdxrxv20oA
Message-ID: <CAFEAcA8QWor1P210Td1wHeot2npzga5_XfonNMpPSZeviYCTOQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] target/arm: ensure we create the wxft_timer for
 all modes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 kvm@vger.kernel.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 19 Jun 2026 at 14:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We don't want to just use it for timeouts as we will calculate which
> will comes first. Remove the wxft feature test in favour of the
> broader architecture checks.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v8
>   - new commit
> ---
>  target/arm/cpu.h | 2 +-
>  target/arm/cpu.c | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 31a5567c951..8aa7437a397 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -966,7 +966,7 @@ struct ArchCPU {
>       * pmu_op_finish() - it does not need other handling during migratio=
n
>       */
>      QEMUTimer *pmu_timer;
> -    /* Timer used for WFxT timeouts */
> +    /* Timer used for WFxT timeouts OR event stream events */
>      QEMUTimer *wfxt_timer;
>
>      /* GPIO outputs for generic timer */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 597e0626e7f..61945b6e6cc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2269,7 +2269,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      }
>
>  #ifndef CONFIG_USER_ONLY
> -    if (tcg_enabled() && cpu_isar_feature(aa64_wfxt, cpu)) {
> +    /*
> +     * We use the wfxt_timer for timeouts and event stream so we
> +     * enable from V6K up. There is no event stream on M-profile.
> +     */
> +    if (tcg_enabled() &&
> +        (arm_feature(env, ARM_FEATURE_V6K) ||
> +         arm_feature(env, ARM_FEATURE_V7) ||
> +         arm_feature(env, ARM_FEATURE_V8))) {

This code runs after arm_cpu_propagate_feature_implications()
(which happens at end of instance-init), so you can rely on
the usual "feature X implies feature Y" stuff being true, and
just check ARM_FEATURE_V6K -- that is set for anything A or R
profile that's v6k and up.

>          cpu->wfxt_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                         arm_wfxt_timer_cb, cpu);
>      }
> --
> 2.47.3

-- PMM

