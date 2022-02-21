Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2728825lfq;
        Mon, 21 Feb 2022 05:31:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHi3hvIm+8l9y2IUexGJ4Fq3Bbp5hebcAXBEljc6CSjPIfRNP/sTq3F/1nqX8v2ZEWEsWL
X-Received: by 2002:a37:9ed2:0:b0:47b:7895:9e3c with SMTP id h201-20020a379ed2000000b0047b78959e3cmr12210677qke.12.1645450314315;
        Mon, 21 Feb 2022 05:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645450314; cv=none;
        d=google.com; s=arc-20160816;
        b=JZCGkSIBz0UFjXbg302Jv2tfTFGLuB0m6bJjJOPSROzibrA1geaHSm5Eqy70IgFQHp
         7cWrQ3l6JcRAlGSA7aW4dxgK0cNnZNQ9U6YLRoakBbQja+Soxgq2FFpCaAKpj26BGzzf
         eV2TkvunHDn5HAlTx4QpuiZYyPqwk/gaHDq0TiHhNJv1UPQp/Yf5xYLywM0yrxO5nXHo
         HX5jDdEjrhQRISZ20Ggw4aVrsJBOZOMdvGYvhLx/xYm5l8Rh22RbuB0F0o7zhKfuO9hk
         R7MXC6JB+oXwO7crVAQB8QicJHh8qeuexr1hCuYN5CAHDHcee0+OZKk2gAIZ3N2oVblc
         jrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=eStDs/QIT6YtrVtOO0bz7fDj0bXGodPs7RPThpwfNYo=;
        b=Q0XHLsSc0hpd6DZhwjoMMlqISMJXeNedIW0I7LjY/lp+ngbOOdY92kZnJLpT7t3uTQ
         mZVsZ0OHcwar+/3vXn+JB6de1CeBfJQENnwo7qjHKmPR/3exm1eVwf5/MWetn4ZLWXuc
         cdyIQ/ldpqB7BxRAdDkazr56of9l/PVJp7WupUiehwK/jLxkVtNUrWUZGt6XIjt2SF25
         0WLnOCieIkesRz7jLRXxmWikxJtZyvJvawdeB+nMNrSJ+ZPXPIfwKoR2H2sjjqJR1Ic+
         1x9VYG9or0MP4qlWfjgq6sqMpbfUiRzqxn1fO27M/xkShlOdbnJEp0X8kIMcnFvP8wu5
         G0KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XavBHwGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si15784140qkp.198.2022.02.21.05.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 05:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XavBHwGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nM8nB-0007Cg-QF
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 08:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7Yj-0005CG-VP; Mon, 21 Feb 2022 07:12:53 -0500
Received: from [2607:f8b0:4864:20::533] (port=37548
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM7Yi-0003Kj-IL; Mon, 21 Feb 2022 07:12:53 -0500
Received: by mail-pg1-x533.google.com with SMTP id 75so14120262pgb.4;
 Mon, 21 Feb 2022 04:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eStDs/QIT6YtrVtOO0bz7fDj0bXGodPs7RPThpwfNYo=;
 b=XavBHwGTo8j0OnE4o0ASD2nD2tUcwV4cHpHtO8nldfUpdUBxaoxRtNYW53l0e/zBBO
 cL0s2KjOMVoE4QNtUGbr3gtdHcXJ/rCtigO1dY5WT9WMZEUj5Qx54sILrA5WUMAZ0bRI
 +yWc/KYjn10U0m0PzAkxWfPbEum0tZamtUFyjj3SiklL0WG7+XtX1ocUwOe4Q+v8fl3B
 HzKUqJ/gQw5xHemecmQl9H+XHhFOdCwOvoqpsQnFgnj7q2ceQFusA4pv8zOOQnNw2oa4
 mV8dFTvYHp+HZ8SPbGKTNS6gyZSXnCc21DNyKdcWv7fL2/zFNpPgZiLi6t0itQa6FsP8
 TmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eStDs/QIT6YtrVtOO0bz7fDj0bXGodPs7RPThpwfNYo=;
 b=Br8hQu/L4OGWH4sa4P8eKRcyX4vI5FeexHVdrVotE0m064tkDyfAcJ8a45eivlsDdM
 FTxc0edwxiwIoFilFVu6c79qIY9PhVCh2H4GA9A9Wuq0FysX4aHdJC7if52vYcKgMOan
 Yc30nKGSFN0tRrK3J6RlEj5y1IUQ2nkT6OrhyeWdg273TfHAC495R9ms1cu5JK38YvFV
 6WHRcr1nPAQ8IZvFKyccosPFqOUjVs3LWG7bacL0GzJuiW8BBWc0A9W5pyI1emdWaXPP
 cCLyKuO9xUWZp7TgngWLSaqLBL04t2VKYMV/GbW7Z4ykklR6jPzvkq6vjPNpQqzhL8hD
 3jWQ==
X-Gm-Message-State: AOAM53384mFk0Ff6c2phscUxBBGe/lfSnI212Dm+E1PNA4Upo2Stuwpe
 s/FUsi4GwmAuFdQEAzGWUu+74+Z6Nb8=
X-Received: by 2002:a05:6a00:13aa:b0:4f1:1e5f:1c39 with SMTP id
 t42-20020a056a0013aa00b004f11e5f1c39mr6880439pfg.24.1645445568079; 
 Mon, 21 Feb 2022 04:12:48 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u17sm8912108pfi.99.2022.02.21.04.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:12:47 -0800 (PST)
Message-ID: <b3e0b93b-38db-1b29-d31d-b9998bfc26f4@gmail.com>
Date: Mon, 21 Feb 2022 13:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] hw/arm/mps2-tz.c: Update AN547 documentation URL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221094144.426191-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221094144.426191-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Py8mPBKXTHwN

On 21/2/22 10:41, Peter Maydell wrote:
> The AN547 application note URL has changed: update our comment
> accordingly. (Rev B is still downloadable from the old URL,
> but there is a new Rev C of the document now.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

