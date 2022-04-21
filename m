Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp261243lfk;
        Thu, 21 Apr 2022 04:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZfhRhoCmtKEBmUfx1epaLLeTnjnvqNhLK+BLZXTMWJQZIj+oxcTm4HbQzsvCtlNyXwnro
X-Received: by 2002:a05:622a:58e:b0:2f3:4449:cbea with SMTP id c14-20020a05622a058e00b002f34449cbeamr3925272qtb.79.1650539149085;
        Thu, 21 Apr 2022 04:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650539149; cv=none;
        d=google.com; s=arc-20160816;
        b=rFaWE3uNJC8WnkhIsrzMPKt9vIJBHUZqXGDjNelnzDcFrI2reuQ/Nn665TeFM4s+/1
         D0/WnTPAZwmH/f2f74cdyaPzik4Xsp2ylY6RnAA4CQfVyvwQdz09Ga4pt2t2LTSp0lzA
         JqQHuAcUypSf+NAGt3Nil45sKOpCtJImHjCTzYZMZQnT+/tf9LCsTNgyqi7/VyWnYrhK
         Y701cKrD/aV9BL1pwRSIktTLMoGxD4fxZfkRn7OWF1WM/bUifQd0I2Ekk5grP5+3HlmS
         pMWfjB56nxPIqRPd/M4iS3lHCoJVcO/vfBW+OxoTpkO4JEgr6ry0cmHB4anasqkOTsVX
         bvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLWf7xlwiNqaTYa9Ly9dPPbhY4fAchbkPfDbw7UIEXc=;
        b=W2Ra5P1eZauPgomN8+VdcaBYbrcRyr4w1LWJ7JTgX7L+iQXAfDpkBzgLomGEUY0ei1
         M/Onxhr4//l26nmyUUAzqMMySfw+Ai5QxLMDmLaH2rFxWLx9GTkVm4/yEtMtbU45Uabg
         zgSEN0R97LMo+7PepfPtbE4KQUwDyCw2jIpGeyPlySefMtjX+nu30GnBFSmhc+gB5qq7
         5wDF4A7y4T271c0G8dqgeIOlk+T7DCXoTAcaRmNYS02CYPLtsVgYhke64v013kMGgASP
         6ME03YEPbuMh5dCe59YIjtOwC0sDAn3YxefyU0uJrTrZpNr29h12x+oc4UwH6Ils1uSO
         464Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XxnilaRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020a05622a03d300b002ebc832213asi1239450qtx.425.2022.04.21.04.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XxnilaRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUdA-0004oK-9x
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUMH-0000ML-Hh
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:48:21 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUME-0005mw-42
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:48:19 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso47498247b3.9
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JLWf7xlwiNqaTYa9Ly9dPPbhY4fAchbkPfDbw7UIEXc=;
 b=XxnilaRqGvMz9L4itPjjMzwfadevYwlz0rjj7nOr6C2rC46LcEIznZexRisiI0Z3fV
 J6pHwYkPq2Wz6JzyJuHzd00A6QYD/mxR6hFW+q3CNtYT1a+x4PqlI53DNsAk3hjCnB7Q
 kufMyqIgp8FoReFMIAQK7dbx0hIiaMwV154aqJe8qGu6F977pvkyGukWk4pnCKU9rwK/
 KczylhrabSxVehqD8B+f2OgDs8sM9jPUrXOaoTRtc02Kz4Vlun6OogHR8DIqjRQ+0KwY
 G3PkSEAKqvPg3AmaSpSw1jK37IfHGl9cl+pImF17Q7OuOCWkDVrqya+0UQtiUFKajgol
 cUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JLWf7xlwiNqaTYa9Ly9dPPbhY4fAchbkPfDbw7UIEXc=;
 b=QHLSAWdvwvopnL7mjAln0n40YB39RqDMGDlPC1kIRo1Vx6DDdhS1javS/rMuOPsVup
 gkh5JpBKFdJXX9rcaRi2eHaDG2YVxdSYPG+epQVOTUmQKxlsTp6c5ZzKa1dERVPXsp1c
 Co3sJOejlxt2O1JfkKWawu2ee6//FokY7JK3THcui8CeOxooDs1u9EYL0y1p6k/Ixy5l
 TxPEYKn9gxh2FgsEiUbVzRMdZK9lSuTDJo3f0ckRaVguXZTtnkxVFfF/Cgcf99HY3rhs
 5OJ3uc7at2Xy3vSktAkQg3KzQEo97guOjavC0SDUo6tb7oXruS9FgtzLve3vTt6RFarY
 qwYA==
X-Gm-Message-State: AOAM533vu5YHNQkN/Xa4uxhh03rQuUxRLQX9O2+SCkmp3XD58uheWRKO
 Dfm2/IZ5lx3ljzScnr/izNNh9jaCIvInZNDJqebEJw==
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr26417036ywb.469.1650538097198; Thu, 21
 Apr 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-3-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:48:06 +0100
Message-ID: <CAFEAcA_dYEbSziv9AdkkR85YybUWQr2m-Phnzsts5R1+t3Bg9Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 02/11] hw/ssi: Make flash size a property in
 NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0mr8tnSxxsJF

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/npcm7xx.c             | 6 ++++++
>  hw/ssi/npcm7xx_fiu.c         | 6 ++----
>  include/hw/ssi/npcm7xx_fiu.h | 1 +
>  3 files changed, 9 insertions(+), 4 deletions(-)

> @@ -525,7 +522,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
>          flash->fiu = s;
>          memory_region_init_io(&flash->direct_access, OBJECT(s),
>                                &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
> -                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
> +                              s->flash_size);
>          sysbus_init_mmio(sbd, &flash->direct_access);

Creating a zero-sized memory region if the user forgets to set
the flash-size property is going to be a bit confusing, so I think
it would be better to have at least a basic sanity check of the
property in realize.

Otherwise looks good.

thanks
-- PMM
