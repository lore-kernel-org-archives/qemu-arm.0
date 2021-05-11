Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3741358lfg;
        Tue, 11 May 2021 00:57:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo2dqLD12Xcz4x1jtlKOybf49RgqCKvqJMCidyc0cUCmxWh3LFsCVNS8kj1yijWQB1knls
X-Received: by 2002:a05:622a:58d:: with SMTP id c13mr25609409qtb.44.1620719835576;
        Tue, 11 May 2021 00:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620719835; cv=none;
        d=google.com; s=arc-20160816;
        b=UufQVFxfEG5P6a+/Yt0dOD54A6tJcELNIv2AHHGK8pmSHyEHz743SIZ3YNSJgp+yJi
         Jq8ooGhAbFoKsNNtYLEh7zLEyiLMi82r7WpNvd7Z29OEkTYucEoAB2n+SSxcNKwjI1AV
         78H1ngSpQkXLSfK6wJVEGvAMXJMC69hNo3nl5BVpBvjN7hURyMfot6ljl9VyFmk/bE5t
         RO8fZiEpHUpM9MvxykeLM4jGe+qq2old0i8uCEyNEyr0QGMkpxlRhw84+gc3OUFL6Xhu
         Vi3QicMxfiWBqwwing/QKUReS5DBWS3BTPkAh19wuZQfZl0w/bGjS6DE57e6JC8Zqze5
         jN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ge/fn6ENP3lkgJf7/pA69NPxOFc116GmVD/27DZQVn0=;
        b=ecyAls5h1TWbwCS98+PEUiE6f2dlr+ABC7mi0F0qPAno4Xju6HVIjFflHW4LsY9DYM
         KcMZU7q/ooo0dNfViMs62FbjYEpGpiSJXT+nSq7tQS/MhYl+2GdNGDibkwvxQfjmnzvT
         ft0bXpkcaJOuQM5JUjanY/TRZ6Z4ZU3RKgAWBhe106HHUCG4ofbiN3BeDKR1xweZreEL
         EcSmqFXVurtZhRcc7YuhI2JswNxxbRyrgCav50p3r4Olp9jv7WSqWUaTi4JvobaQUhGJ
         tDS7/Tf+/ERUFDxAUDRXclfCPQ5HTvrzCfJiq1bU5zHKUO3K/zwTKVcADXFcer/SgTkx
         u9/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kckJc+3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a68si12460342qkf.195.2021.05.11.00.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 00:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kckJc+3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgNGU-0005So-VH
	for alex.bennee@linaro.org; Tue, 11 May 2021 03:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNGI-0005Ri-Gd
 for qemu-arm@nongnu.org; Tue, 11 May 2021 03:57:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNGH-0007UT-0m
 for qemu-arm@nongnu.org; Tue, 11 May 2021 03:57:02 -0400
Received: by mail-ej1-x630.google.com with SMTP id s20so22873383ejr.9
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ge/fn6ENP3lkgJf7/pA69NPxOFc116GmVD/27DZQVn0=;
 b=kckJc+3Oh9mv65hrTrOFNvNAeGUe1apCMa9AwBJFa6Eyaanrl7AP6C41iBsjJhvgbF
 50MsZnNiE6S+JcUuLiQ4fJXIG3KtNni8Cgj0U+bfxi2LpPMlP5EYaaRppJionHPcoGI3
 gcjQo+JflhcZfrQ9JdT2ALXgJIZ5Rkae0BTYgh/wuzFyKAYDalSLXLnNjWcE0S5ieXCl
 hfBOyqUsZtxIvA57d0j6jcu/qMUoaOrvYTTe8zaYQa3ErzySuuuxi4tVefRArJSV3naq
 k0MCZy5mu/U4i9OEPY/G6DEO8e4iNQj9k2LweqnZN26azm33oqM9imisaELz8LxJR5Ji
 sUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ge/fn6ENP3lkgJf7/pA69NPxOFc116GmVD/27DZQVn0=;
 b=tCZy/urtLDB5teOIHPiXZqrdF5Cu+DAGHG9aKJ+1/EZo7no6B3GntFAUNbSo+hDajW
 yYIlSjmhL4Ce2gMWg60YpHF57nsvwT49/inA2CrVg5BWQXKWOeSqjClI1LcqqrhTW1Rx
 2+A61R7shGTd0iRSuT1BME+bRd7joEfPmLkBewnoRWizZ1MDLl1mgoyuj/rK9wsjLNcR
 zi9qxdSeycICluiiXZp3TpyQd/i+cwDD1kzKQZscOyX1xQCovL3OkmTG+b1XjPKHbl3E
 nVv2B858MLCsEoIVbMcohVSNly3K72QxbLqk84gzBpmEHaD5JnkLH3KfaHxtGcaEj8pt
 gokg==
X-Gm-Message-State: AOAM530beuNYEZO9diJsDyY8RfRETxLLQyUPSJkiwJ0VqCVsG+gTpzg4
 wOo6fm0XsQLum8LgrB3qOM5GDzCmV/8pXHTCiDOOBg==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr808318ejb.482.1620719819133; 
 Tue, 11 May 2021 00:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-2-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 08:55:46 +0100
Message-ID: <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/82] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
To: Richard Henderson <richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4GLgtBv8XAc

On Fri, 30 Apr 2021 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Will be used for SVE2 isa subset enablement.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Do not read zfr0 from kvm unless sve is available.
> ---


> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..e8729b53fd 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -567,6 +567,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf)
>          err |=3D read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                ARM64_SYS_REG(3, 0, 0, 7, 2));
>
> +        /*
> +         * Before v5.1, KVM did not support SVE and did not expose
> +         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
> +         * not expose the register to "user" requests like this
> +         * unless the host supports SVE.
> +         */
> +        if (isar_feature_aa64_sve(&ahcf->isar)) {
> +            err |=3D read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
> +                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
> +        }
> +

This code is earlier in the function than the place where we
update ahcf->isar to set the "SVE supported bits":

    /* Add feature bits that can't appear until after VCPU init. */
    if (sve_supported) {
        t =3D ahcf->isar.id_aa64pfr0;
        t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
        ahcf->isar.id_aa64pfr0 =3D t;
    }

so won't the condition here be always false ?

thanks
-- PMM
