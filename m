Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp482634lfq;
        Thu, 7 Jan 2021 09:39:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzplNJ50vENmTB+X2kinAoRn+ikG5kH2gGgKVPr2NH/hlG6b5csjyoFOXRF+NmCT50WzERb
X-Received: by 2002:a25:3a04:: with SMTP id h4mr14473546yba.285.1610041182850;
        Thu, 07 Jan 2021 09:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041182; cv=none;
        d=google.com; s=arc-20160816;
        b=y1M45uQFBk49SE1DHS27TStw83cKPgK3O3zB3nxbxQ14je5zqcTLbScogOyyQ3GmGX
         H0CkSIcpsXVYZxN0nsZa6BjtKtslomjncfQAEKTRw+4gP7+B3xop5sYU065EpOoYPvBX
         IdkllNM3ZdX5N0Hb/ek+6ZM8CIX2szbuVXS77Ol2N6nHbYl1juYD2Y6vLWrmMK1/8rG0
         nsw5DjRi9hAXx1+L+k8jOLoMd/Tpaq1FMCF8LiF39t78cARk6kiXnnlKHhwBtck+fI+N
         kcm0n02eJI2+Sx+e/9n4kWcSm4a2kB1Urwo52KRGmsLjeVyYqxyDUc6cMdnKvJvpYydq
         fYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iaEUFd0+EBKn5/NAWb4IN3dyUhMVYNiu8c9XpxIk8f0=;
        b=i7wWjJvBWqggNic7Wqv72wOsQ5pJIPpoU5FiQPPPaUCFe+k1n9R4dUWK7gPcnTEc0d
         nFA591U5719bt9xMGX3zmDRo8t7YfCeBxDIsPKS3b6YEVyYOX6qruueT9y0kapkCh13i
         b5adb4zJOfaVpQbO3jFX5uT/aDiBDZhoMXv2+ckNvx0P2ADd+d9iSYWutVSgwdt9Nw0T
         NvLWzms6h/29p6tjBXPWAjpLxrB2Xag9XpRMLI+AT9jCySyFOJRjoSzvkVZYKcEyx4Wc
         QxPGDmNZcEZtFHYNtupoGK/i8ZxS4UosBzI2445TEjtWQ1BDjxarUrCX+1oLjRee9Ys6
         oacw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IEgG+U8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si6382826ybl.375.2021.01.07.09.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IEgG+U8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZG9-0004O1-To
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDY-0002LS-KQ
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:37:02 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZDW-0002Gl-Ts
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:37:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id p22so8465195edu.11
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaEUFd0+EBKn5/NAWb4IN3dyUhMVYNiu8c9XpxIk8f0=;
 b=IEgG+U8v4AHNRyAPXlqsp5xiibHWWeISKH13HcsdjAtpr62QE90wLjcRyku9i7rDJV
 eb8GOdUf4W9niKVe+MbQOvWG7y2VtgzLxs6Aos0KUPX6DOZFMB5DZPD3zdIy0GWtHCG0
 1y2eXBOrCaCmBQuLoRSqRy+S8MlFQQ/0YsA4/hUsWrHBUCLq4uhAq+f9F7eNKYrHIb3H
 WJ1yVaXzSffByJi/0tiRelZJoszUqRluxMLIbqOWTgP9RJjSAYtV7RvWhUiSGgnSYRvu
 T8GDCeo6j4pjzuijNiEvl8TFfOpz9SO9s2+arE7JeJFN4D9iEdr3X4cGyathRMotPXnP
 mHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaEUFd0+EBKn5/NAWb4IN3dyUhMVYNiu8c9XpxIk8f0=;
 b=RYgAUhV8CXlmf6gxVAIpBH5YlFQPbo2VCi7LQjJtMcvZ9UZiIwodL2sl3k5vMSPDuG
 gwofHLaZ8mYIebO+hG78ySt8GbECevf6kmm5eNb5sjz8pG8Bzdo6qmxmBwO9vkeyXcfv
 K0OtX/sCr/iFvPfjV2ltCmajmM14L1G6B5qSwG1ZjqTTYq4QHVjSY6R1oIOOPMtDmvgh
 khJ0OG9RSpm8xvygIl7PyQ0ynNuE2XeZo1ELh4yDQqmUbhpCNTNOJ2UrqGrwNS3us+Ae
 V++G+hSTYPTMEzRSpvqFzavUEEA9QFj2Ihae8ltyHzgFa7VRHcbh8E8Gm4wEsdj9L+G7
 nFbQ==
X-Gm-Message-State: AOAM533J4arstbm8Sc8qeQphJDk9PSaHDnkOLrfBMfSabMOIm5fJl0AV
 h6u25FBKdZ3V2tTInBmmTfMCIC+EZUcqaukpEeAMZg==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2414928edr.251.1610041017370; 
 Thu, 07 Jan 2021 09:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-23-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:36:46 +0000
Message-ID: <CAFEAcA-_idiGLjvUCUvqC4h=K5Y1hQL9Ugrcq0kG32HY0NQHLw@mail.gmail.com>
Subject: Re: [PATCH v2 22/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: cjw3hv9bjaR8

On Tue, 8 Dec 2020 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
