Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3233603lft;
        Mon, 4 Jul 2022 06:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+wDU6bV9llSpWRACh3Xddt9f6T/YXdc6YR7P44/x/gVN5iKH2hQt5lH5ZKxH31luUxevC
X-Received: by 2002:a05:6902:114d:b0:66d:9fa6:4bd4 with SMTP id p13-20020a056902114d00b0066d9fa64bd4mr24299995ybu.362.1656941728693;
        Mon, 04 Jul 2022 06:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941728; cv=none;
        d=google.com; s=arc-20160816;
        b=ikmwUsyYrrywHZC6zuHLNPApBAeTRnPhi4FX7iKGIpWmmCEN0Je0NqpmELTlQkqLP1
         JEqinZUQySRoyG13X0nuFpHpvljLbeE5rNr3an78NytR5k6rXfnxqtNRqYPAs13hA2iL
         FtONH/S3RXkS1sLrJvM+Opw9BuEtbDmq+49doPtv0V5F/oAq2AEciK+XZi20mut2Z4am
         BEasnqxdgJwd9woFfKrSx0a9y/W2cytpczO98n8TKQDUQWpp017D7jLUwV5/5iJMiY3u
         ri5nQFJZQcMaD6fy9za2xSQs0PkIvbTRNROZ9C6Ee18j6GbgaqmoOPqB/L5f1Gq+p8hG
         gUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=i1YJ/HgeYKcYtLDBdns9a+3qzGhociFoi/QTV8085pw=;
        b=d2rOpuDN9qi0T/BEYGwy7u8ObdM6XJXN2oNbnZizt7LiAk92uHl8D27GNEGEkbICMJ
         AU4A2Z/Bm+Ogu78jPmr8Pk3uMWx6Pj1psqEqgyUK/ibZ1bMNEoPyQH3z4Ezd3hSETsLw
         K75PlJfFFOXyRyVNFnR+aHLqV+7mvIPHAZGFltAl7T+qfmGXza+k8oah1YZAe5vXGuv1
         YzBBzdtmXH2CD5NCXvctdvwPyQcD4t+N5O89y6UYdYmkL+cf55C2bQS+T3gVVTiyAH7Q
         z5I2DPFJGf3z5HNtBB7LeLWU5Wq3C+eBooNSmQdkzlfyN9YUQ6z4skbLDBwRtcCEynFE
         btpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zJ/CIHuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a2515c6000000b0066deb35b2adsi12825890ybv.114.2022.07.04.06.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zJ/CIHuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MEZ-00014o-W9
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lum-0000H1-TS
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:15:00 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Luk-0001gx-C0
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:15:00 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e80so9597782ybb.4
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1YJ/HgeYKcYtLDBdns9a+3qzGhociFoi/QTV8085pw=;
 b=zJ/CIHuy7LLiEihqEWIpRHXq95hy9lbeeDh9EU0fCI9Qr0mA9IFJMcSiePZ8FmjNP7
 Gj9+JInvLBz3WSyYytDR2BdrkSvYgDq0OQzBzfKKitLmvWq5x0MDVuP95RPULTYt/p0P
 PR9KZCcC1xWGBtDogvz79svcoX/pRYOyWwXXRpfL/+cA78qfmgxa0SMVp4gwW0pMuFl5
 8jN38CelhZ3aIsF0t4sxrJdJdx0pGFyUtGBSdrYnXQYXfjmG055loSvCsVpwFHgdNMya
 qwSCuiplAnEWMjT8k/2xc/97DzpiGJOeBmWOAwg5VleJSv90d0Um1MN9R9CFc6lOS2FV
 hQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1YJ/HgeYKcYtLDBdns9a+3qzGhociFoi/QTV8085pw=;
 b=oaDBx9k9QegviRkDBDdKES8DWRabW1D8/MpV4CplNqnn4F3nD3v5JvCH0pqEZmk/PP
 a6PexYEg1Y1uiDeR0Q7FkgdEjoRKtsnMypuMGJD9mnZSoZT+IMpRqdhMo5iHn80FSNiy
 vg9Prw5Y11XljGsLeL05XatxEwXxRmIB63WUsZEmZ1Xfm6MlLe4LiVqjQxfUeXeL3Q6N
 z3W78TCdKixk+VoH+qXTjaWySXHJcDbhuvreElkSTT51GCvNZRsc0Yx+3Rn0TO1iFM1N
 eE6FNWc5nABr40f2DUBZzaNEEJY5x4NK4Ex+V8Xwp3KULvCnIou7+ouXEmlzy0xDT8PI
 ljRQ==
X-Gm-Message-State: AJIora9Gy03HknYODhvih+lPM8D2XukmqblV42i40yRe3yLbsMfeG1HE
 vdPrE6f3Z9y599pH5emPtif3fyS6YhwHVkxuW0B3aw==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6125609ybu.479.1656940497244; Mon, 04
 Jul 2022 06:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-4-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:14:46 +0100
Message-ID: <CAFEAcA8vRaLXmAZpWCkO8FoJd9cwvaCqHRCJugDSZfyEy4rT9A@mail.gmail.com>
Subject: Re: [PATCH 03/40] pl050: change PL050State dev pointer from void to
 PS2State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: L7wMkwNWCVY7

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the compiler to enforce that the PS2 device pointer is always of
> type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
> this type change.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
