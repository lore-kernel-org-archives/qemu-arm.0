Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp611083lfk;
        Sat, 22 Jan 2022 03:33:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUnb9EnE3R++9xqpIldGfTSznCb7iUnoe+D5ixxhwE17fNGh/GnCfU9GhGS4kPi8IJ9401
X-Received: by 2002:a25:7e86:: with SMTP id z128mr11465586ybc.212.1642851227842;
        Sat, 22 Jan 2022 03:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642851227; cv=none;
        d=google.com; s=arc-20160816;
        b=BzlB1DG1wN3/adKUjrjDE6XTXafj/vy5MYMXK/tyqDtEi3LphVutsBuOdSmdMZBsVB
         pXjOFPblIQjTvNJuH4GrRzvXJ258duM+nQj0XTASMYwuTKpZLwN9pahtcgx/XojxnMM8
         ngyR5Bis5/oyCZQRwemYEtIPbDx269vpy+wmPul2BRZAsaibq8VoTjHqmlA56Krk3Tbt
         1j1QcJxw9rhsWVjiT4XVluUhEgY8jugeqccuyqZL+hms8kaDhVkILkpnW+l0A9PlwGx4
         dZ/nOZqGP3UDfBdAHFNUMcGYQvNGHTe/2IrQnswEdVK7gYZKdDqIlIPI88Lktk6AimR1
         GxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x4METSBRCu+M+1CeFoZY5hrhO9eCehTjQqfMGhV/KQk=;
        b=BpE6iE1PlcRAQGlrFxVvNKHKFFBBu/9jWzGVQLrDDOEay75Rh9OeUzho44WN7Xl9TY
         nbmNEAWZ2ZBGiy07TTtHIsFRkwHGTrbRHVOZU3Af4i4yMI9D6H1zghYr7NkT80yuGbno
         NNBSoh9F286hyKVZcHkuUw+V/RM47JhKb6JaqSdFsBeFnkNH0hL2mWXKshU1J7VgZAJ9
         tF/HEIYEfuAqEOYUZHyRGyDsT9vrKGAtnTTSfbjwdS8l7sPNdoZ72BgTODExoHx02vju
         vbVnYotVSTW6Jf9snMOej8wzYs5EXo0P1cA9ya/R1J4ZirfLl0tgpUmVdDkHBy8Hh0TM
         GYxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIapDb0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v77si9015886ybi.81.2022.01.22.03.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jan 2022 03:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIapDb0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nBEeR-0004J9-AB
	for alex.bennee@linaro.org; Sat, 22 Jan 2022 06:33:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBEYz-0001rH-L6
 for qemu-arm@nongnu.org; Sat, 22 Jan 2022 06:28:12 -0500
Received: from [2a00:1450:4864:20::32e] (port=43989
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBEYx-0006dv-7E
 for qemu-arm@nongnu.org; Sat, 22 Jan 2022 06:28:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so24400452wmq.2
 for <qemu-arm@nongnu.org>; Sat, 22 Jan 2022 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x4METSBRCu+M+1CeFoZY5hrhO9eCehTjQqfMGhV/KQk=;
 b=SIapDb0XpZqX+oGPaORq5tLivQQBsIazBkU7neC0/rLGfcSGQ01P/fbwx8KBvMRWct
 o57nMsJC405DIRcMYaNW1FllWyqDn84uaTIo0NVJQsFEJWRSUoLtXSkWuaGJMpRWisOa
 8fdQCzdaX+hQNXTgelkP/lRcUDjyVJRpRzk5noZ2v/3YqvMLB82V1bukBdKdAel55DjJ
 tn+cvAc05qxuVkz14h2/Zhhcblkqkjw2X6itzXEh+zPlTHYXXPNBCYtthM/yVsUoCotd
 rL1/AYBH+OYXc5ePlozSfBvjgp0XrgwuWla78BbFy1olJwX1+IYXmSqYIY/Hb8SxoUr8
 ZJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x4METSBRCu+M+1CeFoZY5hrhO9eCehTjQqfMGhV/KQk=;
 b=IaXe9IvYox1M/CaAIiHKkYVR2XBfwDcHaTIYYRLu05sNQT+RteS/+lVfZmkv+8HoqZ
 GSr/DRFxqgwzudhkHKxieSkS8qkCSe0gA5tCiagUEhmJjY2kCLBdtvkwPW9iql/ZUUU5
 fJAkeE4XH3snDt71iPZA/ID2jSvNRNbzX7rF28WAHnPprNGFtqTS9Tj3H2U2QuSBpNWT
 a3XhyxYR6poIzXvbiod0Fus+bnCDEm4ZVp+HlYDD3BXvCucuXUpwaSruBEM1PSwSGXYz
 oexK7J3OSSuNPWUXGvjuhTHzIn5Oe5DvwSuJJQcEZCWFbPojOj+jG0/pSLrB2xq+wgnZ
 TcTw==
X-Gm-Message-State: AOAM533+7uiBnSR3mb911O7t9ooZbMdD2EGdPDWxTuN8i0GA9O9dx5BH
 WnAQC27895lzAfxPA/cxZNAknvcIwL2U90sJ06HmbA==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr4360418wmm.37.1642850885360; 
 Sat, 22 Jan 2022 03:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20220120151648.433736-1-peter.maydell@linaro.org>
 <e4466aa1-9fc7-a913-91e8-50c743cc4fe2@amsat.org>
In-Reply-To: <e4466aa1-9fc7-a913-91e8-50c743cc4fe2@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jan 2022 11:27:54 +0000
Message-ID: <CAFEAcA-cCO_S3uQP1BSNhunWO=gihwV0cr=QoG72fT80=QVBUw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM
 state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNy7NNpk5TlU

On Sat, 22 Jan 2022 at 09:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 20/1/22 16:16, Peter Maydell wrote:
> > The exynos4210_uart_post_load() function assumes that it is passed
> > the Exynos4210UartState, but it has been attached to the
> > VMStateDescription for the Exynos4210UartFIFO type.  The result is a
> > SIGSEGV when attempting to load VM state for any machine type
> > including this device.
> >
> > Fix the bug by attaching the post-load function to the VMSD for the
> > Exynos4210UartState.  This is the logical place for it, because the
> > actions it does relate to the entire UART state, not just the FIFO.
> >
> > Thanks to the bug reporter @TrungNguyen1909 for the clear bug
> > description and the suggested fix.
> >
> > Fixes: c9d3396d80fe7ece9b
> >     ("hw/char/exynos4210_uart: Implement post_load function")
> > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638
>
> Apparently GitLab doesn't recognize "Buglink":
> https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#defau=
lt-closing-pattern
> which might be why we use "Resolves: " to have GitLab
> automatically close issues.


Thanks; I can never remember which tag is the right one. I think
I just fished this one out of a random commit in the git history,
but I should have checked the docs, where we do have this
documented.

-- PMM
