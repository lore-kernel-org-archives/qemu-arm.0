Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp405694lfq;
        Thu, 7 Jan 2021 07:57:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZgcWW9tIwFyvV6KUtksbraXo716zYuT9bH6BgvJyoj+u6Tv3+nC2/fvjxSrDuf7Kgg9nh
X-Received: by 2002:a25:680c:: with SMTP id d12mr14649940ybc.336.1610035022326;
        Thu, 07 Jan 2021 07:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610035022; cv=none;
        d=google.com; s=arc-20160816;
        b=xCvb/NGSM6YgepRSpSy2Hinhx5fVaVUYwXPnT41DPO5tm2jt19pGVYjJY0ubNT4mna
         6P+ySUa7pcUlj+xrSjPyZOzNTN/7z0NW7TYSl5I21EuIUv1t6KAtlU1oWhlkVQxtnFWS
         iVMFh1dzJDB/d8FIeLjw7V7r6Egw62QzAPQRbsKRh/MuliLfYD4BV4gSGldfjyjtWYKF
         mQfGw4aGNbUKs1wB7Dax8Ojstfh/YoA9K0jvOmlziGlRvrgra5ahyUzZ6dKJFZCIByG8
         khMX5y6DkvkcdKFyU6anWkOAhdMMqqzdvxcveCH0Kd6cvWJNXbKkQpvhePsw74P4Kp4l
         IS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tE6F8Y+uAOLiNnHj5XpVgy8AxDEDwhsX50dwch7V89E=;
        b=ulVWc/EFYUPg9i0Z3y9lrrSgSXSfdcp3Hx6QnvyOln7nKx4dQd/bry4d2+5+IYsKTO
         gTf9KGzLImt2QSFouaXedJXpBO4thJfsdPbGp65NbjSAYRge5/+Q1wqb313sC1nMp70C
         wCmc8M3iZKq1bjvaBFesuK10IO37vywph6D2Mg7bm/WUu31GWOLS6G9feDJka7p1Qa/4
         8obm3bgKV68eUWNFztMpMztoTMpEhsfP9lp5AkQKG3SNNMMRTGsGWTOKsXhmNXQONQp3
         YMCi60v31JZjR0usRpNUfPEL8F/olM7QVr+zzdDRKWGv9JP/U3sfFuxbkW9q/juukMGP
         yvKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MyX55ryj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si6973999ybl.4.2021.01.07.07.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 07:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MyX55ryj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXen-0003yT-LZ
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 10:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXee-0003wE-4T
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 10:56:52 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXeb-00053q-CG
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 10:56:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d17so10316183ejy.9
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE6F8Y+uAOLiNnHj5XpVgy8AxDEDwhsX50dwch7V89E=;
 b=MyX55ryjtYkHwS9QKjoSp9NX6q/K6XFWgY8Lp3VIAqAmRqsgh+33URQiH9sU8RrMrZ
 ODAsPrSHfCn8IMrLalwt+K8VJ+NCYPjcrsa+RwKY8MhBGLmhMwCSjhC7NMtHtluff7tK
 za7rVhtYyaqUZWy4pamSkvb3QDETK+PUce2w1JpAAIq3fIHFMflOALe2Cifj8ldKLUCv
 awJGWHSBar4hA+oUZRDVTZ4fDe/h0HTx6K9P3KCWDKzsAiO6TO2f2oSheEvH2CejRP44
 VVRamYt7gMtkHi3skLbJYGARymBv5UDxnqeLIxIl721yWpxk/11NgFo5lqlGU46ChaD8
 mJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE6F8Y+uAOLiNnHj5XpVgy8AxDEDwhsX50dwch7V89E=;
 b=jWiYR5glmL+ImNBJ/3CGIqJ61TX8Ao7SG8z2N8PZwk5YSogfva8RHKKMxdzPxg10hs
 n8YsVonyT+WW4BiLBm9BuVumpxm0a+RpqLM0ep155B6g4sA/vxYdA+EjetdJXpyOY1PK
 rhBDcgDgQBl3Y2r9UwIolO/aJ+Qq94i7oEBQmcG8S1xhyps/dYk5Bfh7RafBb2VX+3Ue
 VbTgkZRQS5L+4XItKlZWuuraEYiKIKB+WvA38jJFNrftPlML7fHcc3gnlsPeMjlJI3Te
 WpdanWGeylS6dTjDYMoYuHTGmzXVNkcVXPePYh5B7UexANpW5tHJhxCk+cnNirxpB6dS
 7pvQ==
X-Gm-Message-State: AOAM531I9+OFO2YgzEFaRFs9IJVXzKzlh+YMQvOteq5CJSMSxGxON4Op
 /pMizK9oISXjtZ8URIxl2xNO0pjKlqCbOE+UDCWyGg==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr6970678eja.250.1610035007516; 
 Thu, 07 Jan 2021 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-5-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:56:36 +0000
Message-ID: <CAFEAcA_0yykn-2LDc+fN+FvF9pb_NFFK1v=f9grfenK--wPbrw@mail.gmail.com>
Subject: Re: [PATCH v2 04/24] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: KEjOYThcWOUJ

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only caller.  Adjust some commentary to talk
> about SCTLR_B instead of the vanishing function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
