Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3925579lfg;
        Tue, 11 May 2021 05:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym+moyEHlGprQo8tVop+LzZlydfogV4mN5l3pUKJ2cqKC866zm7z4SUASh4lDxF/JtbquM
X-Received: by 2002:a67:ffd9:: with SMTP id w25mr24614709vsq.8.1620735772828;
        Tue, 11 May 2021 05:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620735772; cv=none;
        d=google.com; s=arc-20160816;
        b=xbryUlUc8XzDgkJT7O+bIKzninCLFoY1NxEpMEfTVV1RqH/RbdaIBTwgZPqRKFT2yv
         +2bherdlKHcplq+a0+fVJrdtMgcUHlQtUkqUa33hrC/5UvIgURSbnK2vRHqV9M/WNrpy
         FXOxJ/dh5ybrpHXWgBgDCzzoQSeX3MkBE/mh9Ix+yZr7bT8MjjFJlwYE1iqPm1VOHBGG
         aATgpko2SpfhLKTIthA/Z7GFzTtUjYeRg7jmuDP98leDxYy9N/0RcByQklY9yqU4VEy5
         t85THnLLDXOrnnAqq4oLSGkm+1QcLll8D3GfgUaZz1HJkc2PweLceByxWSlPIA7XLiFE
         45Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZbnj/pfbAYwixvdzIkaLzIvHt97LUdySIhv7rguSSw=;
        b=hYshBl1zt8/QQ+tQHOHy8rEp/HgXzWb9s/6HDo5yyv1Al6ndDlB2LXXguQGTfRPX4W
         hXONuqr/2YtE1JQ6GthR7LfMIaNK0pot/fAobd4x+WdB2h+YExyBiGuFihs9hfPCEILo
         HMqqPcs2TGudjDmyloXP89J2B1vRlsPhADwlYfhi40TE995zDosCxvaV4u6IjtuPxORw
         FkX5XrA5V9hdNjliWWj8Aa8gbaYHSlu6KdcGayEmiJfGtYbrN/7F1IaJSaRpy6aooKsP
         r5qz3h9WrpzPBL4zKEzPsvsvvWS1s1dMMR5ZtsypmbWbPKYV16Yk9AMYfrkQp3WVdWnQ
         d7hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W1AG0fZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si8692506uaq.232.2021.05.11.05.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 05:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W1AG0fZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgRPY-0006Zw-2s
	for alex.bennee@linaro.org; Tue, 11 May 2021 08:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRP1-00063I-Ho
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:22:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgROv-00025T-Sd
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:22:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id zg3so29464667ejb.8
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZbnj/pfbAYwixvdzIkaLzIvHt97LUdySIhv7rguSSw=;
 b=W1AG0fZURuZ56UXPVU6qk09L48cNhTmvA7LCSFOYjKFSAHJfZXQULrdfiyzKpE1i7+
 SWVqaZsTqh0O1kySjDVcm0TtJwqkR0SL/SIoqeiW8lSXPge4menuHwr6taNwHbsdbiL5
 CNmWnSTPXZIZj1W60Bcx8AdSyWznoo5Bi+QXjco/E8RyqYZfvad33ZerSg/WVYgJqJjP
 +l8ZaqN0d63+M/+yx1BrwY+SGUad36ydPrdBbGLRJ4OQAq8VfjeHCu3Z/glIwPDD8QPp
 g45V0ELKEfaHIg/FN1/HYnfA40AMYDFKtSFGM9N3XOJdONHK7ynGbUo4U8armb5kl0B9
 bjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZbnj/pfbAYwixvdzIkaLzIvHt97LUdySIhv7rguSSw=;
 b=ahhZHoTPZByVayuNNp31ZvwSMDU5shQSkpju8ZymsaF1kDJu7pexQOq19qaPnRMjTd
 eAa03VTuFtnjAC7QbvFXFy+hpwKxkfM3O+MkDFJHBJgL1xKubhZijCwZ0hZnMnzcJFgD
 tYqyV5sLYDvyjilwq7U1SI1PX1/+oD8W8nD4zUBEBiwaNehsbS5CnTvjbETmE9xMQmck
 7BPf2wcyHlu+THTALm89F+aQCyL/IGxLvPpLeinuwslti4MNwbEzd6mYgqPYDxvL5naz
 2CReE3uhqNIwiliPa8Y6fhG9BIKv//TqLJgVvpg+8H8n53/MY7W2e+zxBxNCHpcXdxmw
 yahg==
X-Gm-Message-State: AOAM532E2pQDDsiJ2082TGizLErAgOFx2o9RhNcIpEJGyG+WcPKJ7so6
 8HtTOgCSjVeezkAqdzIGsn823MWDhXIJbr8Al+pu5w==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr9302163ejb.56.1620735732459; 
 Tue, 11 May 2021 05:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-14-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:21:00 +0100
Message-ID: <CAFEAcA-yz0d+vUwf+YaarNBXK4vbtCWAe3M_W03pn43=1OMh6g@mail.gmail.com>
Subject: Re: [PATCH v6 13/82] target/arm: Implement SVE2 integer multiply long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: fM9FMUPxrIbj

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Exclude PMULL from this category for the moment.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 15 +++++++++++++++
>  target/arm/sve.decode      |  9 +++++++++
>  target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  9 +++++++++
>  4 files changed, 64 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
