Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1497918lfj;
        Tue, 3 May 2022 08:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Oq1Zaf1IeHNnI7b2d+mKIYoVPmrc7HzsjNBt1BgcPSAxSsHbsG1GwFZ8kZXN6IloaZEK
X-Received: by 2002:ad4:4bcc:0:b0:456:37bb:992f with SMTP id l12-20020ad44bcc000000b0045637bb992fmr14133020qvw.39.1651592315496;
        Tue, 03 May 2022 08:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651592315; cv=none;
        d=google.com; s=arc-20160816;
        b=kyk+HdATAzjG2mBIaK7zCF37Lm/krsjcr1L7kY8UkXiODUFjzu2Ovy0sVYV7qgZIMe
         JQ2QpB5mcldAgZR3GtvT1Uf5qv5qqp5hMM4GcY5SFXZ/LwT9BGnVTwJNG3fbJ+GzX/5Q
         oSgfwkdiy0RUyQG4bPaScqJVQ5Ow4/X9lNZ8fyimOUCXMMlwVs+jmeF8IZo/zpDhdvkg
         Ekp+cVdUS2IXqGvEu9S8/6rffcxKFC2zXljkOB1Fq9rAu2e8OP1g3GMRkSZ6I8wQ5I9A
         XLR5jA9r6UshBvkI/fDCLjsfrFoNOTmUSdsS1jjhHNEuiRGK4YujaBUOVqowtyiRNtXH
         vgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IGpmnYQlOH/CRB9def+U3MAhMh65fsxdYCFOo6oX80I=;
        b=Sn1zNjkSspFs2CpFb02wcdf95j6zouo3SkqPqRUz8S3Z0/+Pp7Li7DuK1IAk5KNWe1
         r7Wou+OgTGu8L5xR8NGPvKMkG0phTykWwkjPBPQiG/5+wayVbb+UBOL6pguFNkWSrwdf
         yG4ND9mbUDKu7t8G2+v44TKqae66v7zhGP7Lil8fITUL0L9YVEBpvAOFmPIWIOhNuHZp
         pqHvh30neLgGJYTUaiUxXlmnhI9K8INxwPYZvO8rZ41jHjrpYnxTgQzjk+CPLhYQObz9
         ECh1HS4Ls9O9oQLab6hUXAsQoyQ5OqllDzN6oworGuv0auXfxnHwF5nI5p132pPCynHR
         i/yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mt8NxZ39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac85c14000000b002f39f32d615si4161612qti.487.2022.05.03.08.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 08:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mt8NxZ39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlubi-0002tU-WC
	for alex.bennee@linaro.org; Tue, 03 May 2022 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluZ2-0007j3-2B
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:35:48 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluZ0-0005Bk-99
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:35:47 -0400
Received: by mail-yb1-xb36.google.com with SMTP id y76so31757292ybe.1
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IGpmnYQlOH/CRB9def+U3MAhMh65fsxdYCFOo6oX80I=;
 b=mt8NxZ39UZloiyGYMZM1bk59AO4iW82JTFgtNYuqW3DpNH8EHn2eZJRtiOTUzEBC44
 5NO1ogE7lSqCYf0/mfXZB5ZkSoZOYLV7OFJmlfHBbgCKXA7vWBoHr0SF4tovUH42doQp
 BwfJYZHhm6Tn6t2CSisM2yNVH93E01RjmXzkRQSX2aSbi3+RobiSEu5xUHyv27z0loTg
 C+p99UOgLmbZXkfszO8a/AaM0OSicu1/StB6ceINx4HkQnxyZ+pKkt4vWB+rDEH45OKH
 9xjysQvD4GYWiTgYizen886b7BQBgT+05BpFaQDo6ioOjx26IvUCgw88WIHTXGfGEOCP
 xAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IGpmnYQlOH/CRB9def+U3MAhMh65fsxdYCFOo6oX80I=;
 b=NafnwrZK/1yVCfZOyGA5pyKb7GiaqkDjdtXu5V/PbGTTyIhmPjVqkaBKnJomOPB+SG
 Cga9XPSkCSMtzDcyp+zAiLxCAtK1AX7SeH3EKt30FMuNkNXOHNtsXqGmy8lvqLeJju4i
 Qb+1kCKvjbw3zfnRJmmMD2Nh4FNcDRFzKynfVBAzjKd6c3TrLr62szx5bhDtSUvESNQI
 hx4PTFDDRUGysanmij1PvG5zPQMLVqyz5smZrSFe745SNiShX/LiiC8X5OSiZTLEBOfB
 j98mNp3LkmGtXpP6QrKSGY7GpjPDpXXrWl6N/RIKgQU0NvODiMInn+Baq0vNJA66YSzR
 HpZA==
X-Gm-Message-State: AOAM530JLu4batLSsgkgC+1SWb72IPwvCphSWqBC7E0gkoRUxdSzV9Qg
 ghI5fACcoy6ZtmPgbM/iyj9eEmK4ulnB8PVwyPxvtQ==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14388144ybq.67.1651592145267; Tue, 03
 May 2022 08:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220427182934.27075-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:35:34 +0100
Message-ID: <CAFEAcA9AxyG6_M_-32gNCNNg_Yaiu5JVarTLfpthJL+DdQK7UQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7sz6XHaU4hLv

On Wed, 27 Apr 2022 at 19:29, Leif Lindholm <quic_llindhol@quicinc.com> wro=
te:
>
> The sbsa-ref machine is continuously evolving. Some of the changes we
> want to make in the near future, to align with real components (e.g.
> the GIC-700), will break compatibility for existing firmware.
>
> Introduce two new properties to the DT generated on machine generation:
> - machine-version-major
>   To be incremented when a platform change makes the machine
>   incompatible with existing firmware.
> - machine-version-minor
>   To be incremented when functionality is added to the machine
>   without causing incompatibility with existing firmware.
>   to be reset to 0 when machine-version-major is incremented.
>
> These properties are both introduced with the value 0.
> (Hence, a machine where the DT is lacking these nodes is equivalent
> to version 0.0.)
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Radoslaw Biernacki <rad@semihalf.com>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/sbsa-ref.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..e05f6056c7 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);

Seems reasonable to me, but I think:
 * we should say explicitly that the hardware version defined
by these values has nothing to do with QEMU versioned machine
types (and is more akin to a hardware motherboard revision
A/B/C kind of thing), and maybe that it's not aligned with any
specification version number either?
 * we should perhaps say that on real hardware this information
would be more commonly passed to firmware as part of some
sort of revision ID register, but that for sbsa-ref we put
it in the DTB for convenience since we already use that to
tell firmware a few things about the emulated hardware
 * at least some of this should be in a comment as well as
the commit message, so nobody in future decides this should
be "tidied up" to be a versioned machine type

thanks
-- PMM
