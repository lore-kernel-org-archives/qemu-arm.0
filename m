Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1654030lfu;
        Thu, 28 Apr 2022 04:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0n0ue3S/yNJrd+Bbpo3fGQg2muA6qgyY+ogAFLrd02RQof21033GXiHxiD4tZnpeeT3aw
X-Received: by 2002:a05:622a:1c7:b0:2f3:90be:e653 with SMTP id t7-20020a05622a01c700b002f390bee653mr320886qtw.239.1651145232257;
        Thu, 28 Apr 2022 04:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145232; cv=none;
        d=google.com; s=arc-20160816;
        b=dpyZHiiGr1rnWwJnk9HV1Inj2FjkkjIVNSY/3Rf+K2lMOpFCA0W2zkCTcG120LXGie
         mvDbU4of2KPeERrp3vsm85oEyTNmIvqU9IdtfZKjb7OskFxE7NJ5ciXLujj1cqmk3qO8
         toj8pBmnFE/O/lr8xgHkNHuwiumuBHInJ7/NyyVYK9HYA8DOBZvYb5drFvyiyyWmsR2w
         EN6D9EQBPxLUjiXNxonkGWR80/GBGapqWT6172Asb/AYyD2Mp6hpw12t4jPx0QV5hHCC
         0FRJKzg1PI4mkRSHT0Jp3kyuUg34wSjx/02KTcXWCG1KOw28+zlPdH+iAX5Ejlc5oEgx
         smAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=blsmPiQ4ekaunwzbPPrACXghB2YeBqJ/CATsw0osXqI=;
        b=ir6c5nfYblPDmHLi36paGGOYsCiEgIIvq19eiB0rrAFjiLGpC64JJNpjmn5GNEuJJf
         riuZr3hF+3xH+7zhdwge/r5NL99xq4uZUQqh+6L5txbHt1AwRezGWclPBFCKwwVYrBbI
         jorHskTxhfK6pSrxDfmo5wVFKLd2N9bgFDgi3030Qwq9t7FcBOhhQ4dFvXHwezKzfYKJ
         7728pw4nssZ3O8eUzVsiXdkw08F8vKVB0Rp2rS4pAE9PsuWBAWk2PEuiLmtBiRKxwqpl
         ZbnQ4IiKiVLmWVzGWo+jLWgB5BRSFk+fbjeQ1HkM0iwtyWDxLCGb0Aeps6dEmQ+fHv7J
         X3Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiWlzYE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05622a05cf00b002ee5a1f94a3si1766034qtb.379.2022.04.28.04.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiWlzYE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2Ih-0007Jg-OV
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1gK-0005vR-Uk
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:47:34 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:41152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1gJ-0001ww-Ji
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:47:32 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebf4b91212so48211687b3.8
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=blsmPiQ4ekaunwzbPPrACXghB2YeBqJ/CATsw0osXqI=;
 b=ZiWlzYE65o+Gxc857qTm+pZ8Vm/Itbn+yZXpEwsETdSZz1mh64wXcJmOgkBO0/DOXZ
 W5OTk9FFMf28zgoIRtX8JR5XttnRw+yat+LGrj54NyuSbzOkPS07GQ7aR5QwPesfEw9A
 o17jCbTLytdkrxdyeopymO5roKU2If5YBbPQA+e68DmDdJEaqT09Tq9GQjfwrg1a23gF
 Qrjw1SrMnEA1KAfW85zUyiQU+ULpdoNFCu0nO1owgyG2fDXTJQn+NTQL3C4Z/Lb9Yr8q
 IXjroiXI3Y3ETKww1cpMgZP7oke9Q2vuNkI6rHlSIju+2adHZCu4/2M0gs3H1yoJpnvz
 UrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=blsmPiQ4ekaunwzbPPrACXghB2YeBqJ/CATsw0osXqI=;
 b=4HBdlPMcACbxPmwj0m4qtBZJC/5GMuewZqVHix8Ilc51AdpDTUSFB4h225d2PYtfRX
 rFUskLLoLibQxhrhBhtmi04Zi6oAMxN9SCtQ6PL0SH/J4W/5qOjBpB4bkzm7WB/hp7XN
 IowxOodnsxROGx9PU41t7LiM5M/lcTIBKWp7SNv+79x3JTvBZxHsXrDTnV0I9VmEymHf
 6HzSRKqKSNH+797gRRLMcEWPpJ8Un6LpUrH2jtcm2AyVhxe3SXFCPVNfF9KsEjzjO1ps
 um6g/5VjQu0CmiOlgRZr4bc7U0Ju4+Y8YODL9LomZz5biPbZz+z0DGaEvCZifQaLycOa
 GCjA==
X-Gm-Message-State: AOAM5330GFNsJulvIAdcH5BB3Uip75lyweT0T5oMPFG40+3lHYNXIW0Z
 vk2qpXO2aB/6ai2emWyxOsESGw/MZEn0EGn7kGY8pwwECTM=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9377905ywe.455.1651142850734; Thu, 28
 Apr 2022 03:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-44-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:47:19 +0100
Message-ID: <CAFEAcA8XUkQ9HSXqTA08b4Jd+yg3h2VAAABh3gDxK=jXq-ar8A@mail.gmail.com>
Subject: Re: [PATCH 43/47] target/arm: Use tcg_constant in SUBR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AhPell0lhMC0

On Tue, 26 Apr 2022 at 18:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
