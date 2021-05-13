Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp783793lfg;
        Thu, 13 May 2021 12:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoIJUrY7gUEyc55keVyav6bs4z7oOMifPkkEP9185xuzOnGLzoLTIcnwVS6akLJDTMxF5R
X-Received: by 2002:a05:6830:10d9:: with SMTP id z25mr17270949oto.112.1620934566698;
        Thu, 13 May 2021 12:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620934566; cv=none;
        d=google.com; s=arc-20160816;
        b=xKGIs3I1/bJto2sgIayaal/xhcyNA2QdKihmCPmrQoESY4BbSjhAkaOy9ZIByA7ssS
         h0i/6bVLdR0YghxQMAXf1CalI4HLMvohp4ywBbLPgQJqsyRz5WxT0kHIWwZsHIV2ZEoP
         WtXagxghkBuNkwymB8jCiCyVRrMjSxI+LtoUTxJ0ZI+hGdTW7X/RbtyCDoivHTMOETmR
         QRhtq4SnILQZmA6gVib73jDi/BvzEB7+sb/Y8/yoHuW1DpRhg4J3Z//dVDG5kPF9VIk/
         XDZKosIUkco0emSI8HS6CIRdYR+3EYP97QQhLSSH7MlzAJKXuaWGDd0kNaS2OSXJ3THe
         uR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiyOCwT9DsAkJCdxc1D1wTgaAbUmbvm8ZqvFXESkxV8=;
        b=yn9D6TXBQa691MQSVkB4m0/SMNdtbmTTUnibtzCmiDaLLP8N2UpyoWLs9Ru1fcaABO
         ZEt59g8d/ZjWMxDe989BO1KNp6cGvVevms1fILUwHor05LCD6sbgmBDOlxPbW7xtcVE3
         Yp3VyDER1wuBswzKxeP6Ca+BXyp8n3bK+5AD9LjpSxafc/N8LkHd0srKQY9fVcZvoVTn
         JjTOlNAVKCYDh1bg4M4VvB70oflugBS4mkkaR6vIvYZX405vtYQ8HYo+/WiS+/Kb3z6c
         Kgmug8DUwavWObukFabysPgcim1KwOKJwv0POWtCeHxDIOinQOyBlBfnaJn4jipZIete
         bXEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKbFepE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si4652184oob.68.2021.05.13.12.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKbFepE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhH7t-0000Mk-Rq
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH7l-0000MD-L6
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:35:57 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH7j-0005Da-Oy
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:35:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id a25so8093116edr.12
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kiyOCwT9DsAkJCdxc1D1wTgaAbUmbvm8ZqvFXESkxV8=;
 b=EKbFepE60VEnyylpJPp82YVnSC62ZSWBEMThwvpEHIZlB28wa3XsD9nSvpqicPtEbO
 +4GCHnduXeuAWDWlJLO/r+PIbBx4EH8S/TcdpDl2w+3kEJz2kcQXEBMFMYSrRDE3hHaN
 AfB3VCYw18yIgFN8xUSwIHkvM/JyFKEk/zlDLdzMb6r+zJsuMNAFImmt78DFxM3UC1nL
 H5h4wegTqDkMASrJFrNefzKDETx4HFEJvan4R3g8CN6c5PGwhu1Vke9a+4DN/+8+j85x
 GcXbUjuw/NTLH08PA8AmrDkdA5t5G09Z24bEdPABniuqF+MEhd47uoJY2UD+Xaiv/4vR
 vBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kiyOCwT9DsAkJCdxc1D1wTgaAbUmbvm8ZqvFXESkxV8=;
 b=mI4Lv6KQiN0wSnihnBa7lpkEYm3BqxHc5hXnRsX3JbAKzQdfi+iRocsWxafIMoTh4U
 cxBXaKjBg9Qg/H4WrrtnoF8XqQjDyCY3GplY5ONsDB7C9qblvx0MY/PiD86KZM7IZ1aU
 453GNT80T5ZOV+8ltprPvplCxqf/qMIL/J3Y7660Aq269JAmIEupuNLBAavM5v5Dwicv
 OaaX0u1kXqZsbR45b+faOCh7Vz2behjFZMejn/r1qeXVFLZ2eXtprzSx5WMJ+AEydJWN
 h0swcuzJjYtaNr53/F94Re/+44OsfsnTVmE0cD/DV/X3kD6AM1L0h2gQT408gTzlxLYc
 Xp7A==
X-Gm-Message-State: AOAM533mZ8MlaKW/9VbqqpphQS7GN/ABuIV8RVLFBdILMql1e+fNiIf7
 VIASHf6yoPDR0ln2u6VHIWYApsuE0QzvYHJDZKzZyg==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr51459036edd.251.1620934554333; 
 Thu, 13 May 2021 12:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-83-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-83-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:35:42 +0100
Message-ID: <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
Subject: Re: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rwET2aiAMsi9

On Fri, 30 Apr 2021 at 22:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c   |  1 +
>  target/arm/cpu64.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 0dd623e590..30fd5d5ff7 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>
>          u = cpu->isar.id_isar6;
>          u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
>          cpu->isar.id_isar6 = u;
>
>          u = cpu->isar.mvfr0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9..379f90fab8 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
> +        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
>          cpu->isar.id_aa64isar1 = t;
>
>          t = cpu->isar.id_aa64pfr0;
> @@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
>          cpu->isar.id_aa64mmfr2 = t;
>
> +        t = cpu->isar.id_aa64zfr0;
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
> +        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
> +        cpu->isar.id_aa64zfr0 = t;
> +
>          /* Replicate the same data to the 32-bit id registers.  */
>          u = cpu->isar.id_isar5;
>          u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
> @@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
>          u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>          cpu->isar.id_isar6 = u;
>
>          u = cpu->isar.id_pfr0;

Do we need to clear any of these in the "user set has_neon and/or
has_vfp to false" code in arm_cpu_realizefn() ?

thanks
-- PMM
