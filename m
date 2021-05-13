Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp359579lfg;
        Thu, 13 May 2021 03:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm4TdW5h7llpiEmjeZqwVRbUes/+CK9fLIGLu/RRSxDHqYD2++hSM+VDcPKTQJF2mgTRIb
X-Received: by 2002:a67:f80a:: with SMTP id l10mr35898591vso.26.1620902285209;
        Thu, 13 May 2021 03:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620902285; cv=none;
        d=google.com; s=arc-20160816;
        b=plvPa0nc2OAnJI4naabpH2HnLSve5shfjkoq09LUDpVR5Luo6HqFL7Q21fytQkylbs
         p+1Fan4iirAjVIZoB0CfzKrlSWj1NN7dSfAkaOyRr5u8lga3VdVn/PlluN6pBApk4ud0
         bHNueH03+eLoITsOP5JVWaHhsvnJq2HI4eSwbVrRvyCfYm7R0yDRx1pAVYHN/oSy27LE
         F6YmyH9EtKsSQfKnikz+KDyeHlEpwWWXPcCnesxOX73tFIV4Jq6c6fvcUnY6BhHtxkE7
         cJMsAcYSooTEVCy98l79jtz8GulXUQoNtWLXQhr/TrrwHnDpTmeV0zLY+/RTt5dQdQIB
         zsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCRe0joRx9GQPPIp+TsMdwedfIpJ8Y55JWwdgqY4E74=;
        b=ccPKzNU+EtD+awh/cfARYiQjbrqDS25yvZWig5v3KV6G9RSHkjGfMwn9plFa2cM0to
         2t3UzYMMhpKbVXzoooRmDBDWS7zCtewdjCxhb6Vvt/QqPfcpz2W5z0qG4TCAIlbdfbh7
         EX0GapdSg8sE6tJrFiorz+u5KqQA957qkxD6yRkHP0ndK9Bn2n2iOiCw3c+Jisyw0xAU
         n0k8HTK2xN1cRupP6St80dNH/iHdJ4LSoEx78Nlk+BFXmebKRJ84sqcldoctzitD0rMl
         Bp+HvXhnHg9K8nNBLp0axPk24gKeBPQ8LyGaOFmz5OW2XT7h3sxJ31YhTXe2SYRyePja
         Vfdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VP1l7wKX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si1730422vsh.35.2021.05.13.03.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VP1l7wKX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8jE-0002gP-ID
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8fK-0007KU-VN
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:34:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8fJ-0003Pm-1Y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:34:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id l7so30478154edb.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCRe0joRx9GQPPIp+TsMdwedfIpJ8Y55JWwdgqY4E74=;
 b=VP1l7wKXWofqXummtxGDVsTA0KqGmUFqi1pDiWB6UzroGlQPK/o0y2uTmdq2NAQUfN
 BafLW0rY8aYlyBLTAIybecNJ3HbW56kMHQyGK+aZAH3RPoRhBmsNEfUkYlvi1KZvycUq
 t25b8drCtsjy8hoON/Lhvl7RlycMctVsbLnSZ162OeHlXwRcp8ylK2kq26q7yrfb/suK
 xyBgoP9ZPscakYQwVRknFKIpkYg87YeQVkEWPJCgA0L3HlZRK1B/rykYVGabyhWDmqjC
 LOaswCLHJZk4Tm6pt+zUvEkZnjuGn9kEr2tCCxrjurOXBsOorkgoMLY6n9OTjx6gZb6n
 i0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCRe0joRx9GQPPIp+TsMdwedfIpJ8Y55JWwdgqY4E74=;
 b=bCPBfnFMSFiRuoGRYXIMkZupoYvHVdMEX4/kkwyJW7249YnMdO4DmEQTkqV7NN8vr+
 fmx67kbiY8aYQmJNdtJ1cX4d2PSISGxTGxThvlWQxjxCd3u8av8jN1XBELJomT5tNDpx
 0ZGLjXNM7jyA51oC4ZOzGvOv6Co2QfcjrjM5TGhk1r2Lz3aA5ceGV00OKli/AseFujV3
 TQy5dqy/LO4EOj3DbXE1uLNqiyySJZPkgaNrSpzkQsYzBLN+xOxQim45/fq7R+T8I/XN
 LhhQmsmUNhowIj9UgnGFxJj8IbumZHPo1KSYh+85ME7KFXj1x/Vdrv7v/PVrFq2a6ppY
 Pw5A==
X-Gm-Message-State: AOAM530b77u4lNS8Dv6dLFx2Lpw89aWYUI4tZ2HbD0Ol7vFtJhbD9pFx
 V513W4uYqj3J6WlVkuj9/HXsCyeytCjbtrwxNpSszQ==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr49497232edv.204.1620902039160; 
 Thu, 13 May 2021 03:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-46-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:33:47 +0100
Message-ID: <CAFEAcA8UPq07jVOXz_uwAWZwmnUSLOTwV6AzOyQjuMaQr-EKXQ@mail.gmail.com>
Subject: Re: [PATCH v6 45/82] target/arm: Implement SVE2 gather load insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IxytU0o5ndjv

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
> load insns.
>
> 64-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1SW
> * LDNT1W (vector plus scalar)
> * LDNT1D (vector plus scalar)
>
> 32-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1W (vector plus scalar)
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
