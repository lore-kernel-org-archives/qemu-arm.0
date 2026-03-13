Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C01105F786
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 10:01:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0zK0-0005vA-1t; Fri, 13 Mar 2026 06:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0zJw-0005uZ-5W
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 06:00:40 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0zJk-0002vW-8O
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 06:00:32 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so2511548d50.2
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 03:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773396025; cv=none;
 d=google.com; s=arc-20240605;
 b=Z9jGVBAmcV8ZNJsab2FOaDRPkU1AESkcuzGz4+pndm4wvHLol8gKSvEKBIqCoyjZe9
 X0zSZUl0u5QyqhqCo2HAfHfyp+UcAk18n8AumdiM4w4CVb9mp2u52IwjBknkyGSz7pYD
 mo8mioO9/WlotQX8I8X+pAsMSGT5TrC4AK4tfwngAiZeFt4t5kTP5twe76Knx0bWq4hi
 SrOBc/xCpQqkvzN6V1DQDbj4L9O69nWIZoVqfy4qiAur9CQ+0+DjsqDJtP04Q3Pnk7Zc
 Rr75tUVLEY2jiEc1RC/RQYEsGt5Y90X/zwm78xXWG5ON/MzfrgZgO9xF+dJ+lZJlAeFU
 jrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jaetzaU41Uc2nilTU+E4SHhU4sPTBnFvc+ZjCcQ2Pzs=;
 fh=CB0Eibvc8ehsEGMjcdGyzMsMVWR2/24buVSsl6jW0KI=;
 b=Ji4jsF6dymnbotm//znL+plC5AVw2Kr9IPAbsLnfQYEIcdP9F5sZuT8VTeUo0pmC1z
 NsxE2dK6bauPkgMqjVcWBSwY1S4EWI1KMkRe1hea3fdlspwsyqdvnVrxZA2XXz2uLOEs
 CXE9pI7S3kUaK1hUu7iDSYOQiLXaizVlcGGMFiB6UW7rP/TyFq85ArYV5WwcH/j7D6BE
 1+yrL/2SGMcUfH2LRogcNjWh6iOS6Ui6g+1sh01UtYXqrITfsQKvmWQmgpABPVawH8Na
 l+aWkC43xXBjqTA3tIpBbYq3Auav9FXcTp4jaLgjI/hEC+kCMBZ7Ml/YuDv/QOucZBUI
 8E6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773396025; x=1774000825; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaetzaU41Uc2nilTU+E4SHhU4sPTBnFvc+ZjCcQ2Pzs=;
 b=lhqXuq2RpmbmQjQIwn0ZYnnFykZwLfVB3mM6b+DxpqmUS8hd9nPJq2NiqzZ8N0MQ7P
 UbEEzrMJQksxQDKyZtZ9M4dQ//7gGUYwwLpM0BYZjZinDDTPqjwCJ3ziNJlGxaJkDRPd
 wpdRSLffpMmZU6rts2d3Rt5Jy2BRSNejmWEiGUJ7/8XbHbe3z6v2LyeVUO39TJ32VjyG
 04xBwxymlMLCRMPccuUQHFIG08uBSAgbKJwKpDcepg5bTjKbS+9PkyuzP3WAkEzh/9et
 qIWUGnQqGzGb8IZTsv9qGrYe1/kp05DFP5bpLMwAUw6yHR11FsioUxQkF5m4dgC0K1MK
 43hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773396025; x=1774000825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jaetzaU41Uc2nilTU+E4SHhU4sPTBnFvc+ZjCcQ2Pzs=;
 b=cIKNBsfeNkWgi1+16XYMm/WpKyLqVZRx3fW6ytESYB6qcVHPiV7dZ8CtwbAteKjuUC
 CM86sQ4jVTKTFYU3vHHgjVt/rbZfKDIWOiyJe7CiKhKShmGcz8PQjXMHK3m5qXeXZLnW
 KwGbA4ELGj2IL7HTaqWKeljsRSuuynnndTqh4Icvu6S5O4YlsNaMKCh406oXdDAqJ/EY
 uZs64ko8hw3rRNTnroXoEMgTFxQ+2NIBDYmD9XKHhXysXRdVlKETEZ8jIH0cqLWdTZmA
 JJTjqaYHsE6cN/v9jbkpCu6IZfDptJ+SxNN02zwbWFrGAHKN4BsXlcGpx3IyXAvATVXq
 Sx/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW25ExPxsled2FYIZCY06K8iYgR8/DrWEuEf2vCeyUU9uTTiASai0RxJ/5jnOBzugy/PQe4cDG7+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwtZUrdCvdPv9PAt1LA/IEntGtmh/8OtA9P3CdD0loUamWsfcVi
 RNFCLWMKg8LWifHwPJ1UNh/A9g0JgsNwWH4rGNj8ab+aYnJ8WJIYMZ4EyE0nwL0Hggy+JOfvZuE
 NjqFZVnVqukQ/DAQmj36L3luRUkbvOnh32T/wcCG/Mg==
X-Gm-Gg: ATEYQzw27n9nhOLDU+2qZaRVr3JuRO2h+sX+CnBQpl52uNoQzMLXI5HtOELnvgCeN4Y
 xJhVS7a6vvvz8+htbq7NdT/DG+wqS82qmMFgWuiSpLqyaTbXRt1+sJf3MYv56h87ZCsx8NS3L1u
 h8GCBmY2Iz1c3fVoU0+fZnLRawHYc3IldMqmYGdK2Tmm1ekHllXfb72YqgE9tKiUV1xbhS1NAyn
 Kc7b2L3j+8GQR5XScBWGMwbZArwxY11oGEsucuMJTpA0swq0zyn3P1c/IBKx4MBEEjBzwVZ+3NA
 1HxU7MqrHXWwfnZ1XCy8sIe7K++oWuLryFekeLhVOwjQHC8izl2lGOdWRXW9OgajtWM=
X-Received: by 2002:a05:690e:24c6:b0:64c:a516:de8f with SMTP id
 956f58d0204a3-64e63048f8emr1980606d50.47.1773396023040; Fri, 13 Mar 2026
 03:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260309114651.18825-1-mohamed@unpredictable.fr>
In-Reply-To: <20260309114651.18825-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2026 10:00:11 +0000
X-Gm-Features: AaiRm52MzBnKzqF5nCr001-EVAuRE2lULhV6b3Qj67qJOZLrL6AUrolnPaI_XhM
Message-ID: <CAFEAcA9GctVQo_Xc7EyfhinXza-8Kw0SOxwrwpyB1=Br+XjHpQ@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: fix Windows boot with kernel-irqchip=on
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Mon, 9 Mar 2026 at 11:46, Mohamed Mediouni <mohamed@unpredictable.fr> wr=
ote:
>
> Apple headers say:
>
> > When EL2 is disabled, PMU register accesses trigger "Trapped MSR, MRS, =
or
> > System Instruction" exceptions. When this happens, hv_vcpu_run()=E2=80=
=AFreturns, and the
> > =E2=80=AFhv_vcpu_exit_t=E2=80=AFobject contains the information about t=
his exception.
>
> > When EL2 is enabled, the handling of PMU register accesses is determine=
d by the PMUVer
> > field of ID_AA64DFR0_EL1=E2=80=AFregister.
> > If the PMUVer=E2=80=AFfield value is zero or is invalid, PMU register a=
ccesses generate "Undefined"
> > exceptions, which are sent to the guest.
> > If the PMUVer=E2=80=AFfield value is non-zero and valid, PMU register a=
ccesses are emulated by the framework.
> > The ID_AA64DFR0_EL1=E2=80=AFregister can be modified via hv_vcpu_set_sy=
s_reg=E2=80=AFAPI.
>
> That documentation turns out to not be so accurate, with the determining =
factor being whether the vGIC
> is enabled instead of nested virtualisation. If ID_AA64DFR0_EL1.PMUVer =
=3D 0, Hypervisor.framework doesn't
> give us the luxury of having PMU sysreg accesses trapped to the VMM when =
the vGIC is enabled.
>
> As Windows really wants at least a single counter PMU, give it even when
> using the kernel-irqchip with nested virt off.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8aa59a1f77..136761b429 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1187,8 +1187,12 @@ static bool hvf_arm_get_host_cpu_features(ARMHostC=
PUFeatures *ahcf)
>
>      clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
>
> -    if (hvf_nested_virt_enabled()) {
> +    /* Windows really wants at least a single counter PMU... */
> +    if (hvf_irqchip_in_kernel()) {
>          FIELD_DP64_IDREG(&host_isar, ID_AA64DFR0, PMUVER, 0x1);
> +    }

This comment and the code don't line up. We say "Windows wants a PMU"
but then we only conditionally enable the PMU. If the irqchip isn't
in the kernel then presumably the PMU is still disabled (or at least
not advertised to the guest) and Windows still falls over ?

-- PMM

