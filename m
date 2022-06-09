Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp437866lfb;
        Thu, 9 Jun 2022 06:27:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEAN/D6iK7G/JLeME1dDs/ba9Yp2J1l/nqaEp7Uo/bbgP404Frzjpk4voBLAMsRIeRVeZy
X-Received: by 2002:a05:620a:2986:b0:6a7:1379:62ce with SMTP id r6-20020a05620a298600b006a7137962cemr4497512qkp.277.1654781253363;
        Thu, 09 Jun 2022 06:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781253; cv=none;
        d=google.com; s=arc-20160816;
        b=yd8jPzBYyKIjZxKlk2T6qNq9Z9RXdKGrZ+7NCGtybRb/scoL1TDQBFgF6CBm4l9uSq
         hul0WcNihbivu+JxDqmsT9PbF2BGKq4wpevLWAQqCeFeNNDd7GMRLKVfwysYFhYUNVon
         fNQp6YCK4tM6Cw0e4MQQ57a1SR2A1It8HzWBkVoHtrf/9UX+AtAdmPRgzLCStyA68vr1
         E4rhjcWOEGI0Y3kE36yYKxZiifMInMmWLJgrR3rcNEIYb9MB2vebTv0+4bv9viQKXMoU
         WFqycq2fnb7G92KaG54XtryJ4x4rUBNac8RN0BQFupCqZrPygJ4Jo2G9IcCMxDGLGYUt
         00jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ho3weBZYh1VYUE+rNvqpgx7t8t8BZRnGLuUf9xmBW2s=;
        b=YxsDluDEFG0xih6iqHfjIAMi0yURF4t2C/2d4fVjsL6TWCBZwp5Jd5LEPq5hVtzHGW
         SW3FAaeAKNM3FRZzQe56rLXeBqhLE5RPf0eQYs3VmwIFx4nAvsrv1kMjtFCe4l64W6tC
         OJ6Skr9cShyo5A1bey8KYb7rKQN3BL+oQhglZ2C0XWlbtwTpQ1a47MclkdP+g2Y6WtLn
         gP8wCsOSMkr8CFvgceLiwMeYHRTNBo/bxfAP91reFn1gF1jXyxuZbeQgBlUYNR64R5Z1
         WNWwdJnCRMp6hwN8/FhEagY/qKUBtGfW5WInebYC3O7kvgEOoyqSRvXYiuKkvy5osb34
         LgdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhP8ZJoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de18-20020a05620a371200b006a6d26cc2d7si4635590qkb.453.2022.06.09.06.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhP8ZJoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzICC-0001Gt-HZ
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4C-0003tw-9I
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:11:08 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4A-0001pg-QD
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:11:07 -0400
Received: by mail-yb1-xb30.google.com with SMTP id l204so41174379ybf.10
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ho3weBZYh1VYUE+rNvqpgx7t8t8BZRnGLuUf9xmBW2s=;
 b=dhP8ZJoLoRKaQAgWYcCsEQztAkF7tKzw2Lc8LK29iv1TWdtV3EPKW0SRRN/OJTlr0h
 Sz8fciWgLVlryIYBF3kg0m9ffp4CWMLjbMpB+83GfoEYa2C/8cWR3OFAspjYZ83+7U+u
 LF9griKC0KM30jm9qqBudecAyfAKd9XvgWHyBLUdI1DQ2h5MEKaJU41ccFFaZ5kX2/Y3
 dsEE9JdvmRd4kliU6loOmN4gG/vYoMivxS3lTg+Kr2vA5LPcTcKOydOJNwTwtMrQb+PR
 vUYZK3MGbF2wVqosHubLcppREZY9SCtAG8tVkGVlgynC8e3oRprh75fbwsInSEViqyEd
 wZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ho3weBZYh1VYUE+rNvqpgx7t8t8BZRnGLuUf9xmBW2s=;
 b=ojpA6efdsC2hfW0+6O7ofJGvbfHgFT/aAmjXttCU0XAea8K+l7igOkA3/RCeZeazj2
 NdhlP0kZVdXCp/9ANi0scc0bTNemvDs/PxyLJqUzybfL6DNTheK7f6ulmrpFlsgNKfg1
 aRP4KzD45Ho+E4DI+moC7XIUIe8a4PEiVvhL+aSJfB9PwYo3UPoad4C8mdW7Xtuf1x1F
 1Ijt1epdvhlX4EIq5es4CpeRXvZ/H675SKKmx7cX08roIemoS3dXOi3IVyUMNPjOZXQv
 5ayuLzJyRbkHI/IaYlIZlFE42vtcWXRNqDxgJNQg8gHouHcMc3J8Z2FRyNP4mpO2op8V
 36pw==
X-Gm-Message-State: AOAM531Z4DgLIIIM9BceGqtkP1pCO6V13fnT9Qm1r2yJ0xYcFMcLcs5c
 3iC8ibUmcVVZKi6WRW8+rJD03OAqLqZArb/sHb3rig==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24959908ybt.288.1654773065982; Thu, 09
 Jun 2022 04:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-41-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-41-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:10:55 +0100
Message-ID: <CAFEAcA975etE=ZghScN_afLFxSa3p=Ku2Lva7W_kRO8Pu_0zQw@mail.gmail.com>
Subject: Re: [PATCH 40/50] lasips2: implement lasips2_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: oDBYETKY0h2m

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the keyboard and mouse memory regions to lasips2_init()
> and expose them as SysBus memory regions.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
