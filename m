Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1635891lfu;
        Thu, 28 Apr 2022 03:56:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZhn2MU7hZwv6hGEiZNrnU7gc3N/W5dF1CX2/lpx1zyAWA2shcwOHtEuEaKuo6ZmjIUGJy
X-Received: by 2002:a05:622a:3cc:b0:2f3:5aca:583d with SMTP id k12-20020a05622a03cc00b002f35aca583dmr20738347qtx.195.1651143377559;
        Thu, 28 Apr 2022 03:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143377; cv=none;
        d=google.com; s=arc-20160816;
        b=Euc6F6djo+jl0yVITLsA1Ep7/unS2XN5gDZiOUE9PZacbdVOJ/twwkcRzAzTKv3Juk
         GICKihcn1E2jMwNrwBC7cu2l6aZLXCa1ggNRJ8A1Jfs+nQIAUsENxf8wzbqx0rAf5LU4
         qUq0ujwfWhDpijHkX0F6fOk6NP6kzZ+pnSR++0b49b2WD0PzjqGImpUzAqSucvYsW5RC
         FjbU0/PF+QjzL6z9oWT25SczKJhOYjAKPF6Ya2IGq0K7Z603LQcjOT0C4fMOhG86EtKM
         TtylSniWOOfz7leHNe7KAhNM3I6cOjxJ4lprrBPLYz/2O5d2cKZmhl6S9pBrGltWmK/J
         hWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HXs81Z4KM4KR/xLvMB1ex8dT64hXU673a2oODpn09NA=;
        b=ZJMXSzc3dTFpxB8wLV8wxOq4WhJ4jW6BdHcXoQHQtvG4ie1CpR+Ihvi0LJFl7uB9fP
         SGUZf5pxB8erbuhKtY8qyW51OgKF//F/WVPtI/YeGWtMzC4bbD+l9LI3cJJ+Y07Hb9Cq
         ROQIU2n9mK4KfACulVq99Mlag7pMha5Y0ZvMX+FN4Eru8Ut4+j5tOKHDGyiIR4+W9bsx
         /NaUdUjzUFKXqt3qp9keygJPjpdJy56qE6GOO3CneKpexKja+wt7mWklF0GRnouWBTrr
         0e+5DeUiHlwDnmwZ6pfjYBHVdQcIj0SThbU+e6ol9vHPnNL4abrc4x2gERZAzXy7EGBj
         hcgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c8V+gN/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a0cdf09000000b004462b69ee00si1530494qvl.180.2022.04.28.03.56.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c8V+gN/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1om-0005xg-Hl
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0xy-0002oa-Vq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:01:51 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0xt-0002H5-Lh
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:01:42 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f16645872fso46940207b3.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HXs81Z4KM4KR/xLvMB1ex8dT64hXU673a2oODpn09NA=;
 b=c8V+gN/GfXQv0EWMEOAHaN33KhdVC4TCqulTqti0a1Po2y1lPlXLt2rioKDCq3jba2
 Xi7XxQMvBiKHTVHZiyty2m8shJEKRq4eQhRIrogPd3n+wNAoS5oEwLf9M5RpesFz5XiO
 0OJeMgO99cVpV1BSPt2Iy2QBeDv8u1xBVVB+VOqgIN+pvhaXgVwu1NFsBi4aT0KG2br4
 uXQa9iNfIgjweft1oqyV2+XYqOScaasjCqs0/+uW+say3zt1GLpeJFa2g/rrgbfmlCev
 i8bbW3Tc6oJ8tnTs/yArrrrDWFrvFgwkifFyuq7MQN1C0JhMRv8G8oDHgspieo9UO9wm
 KjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HXs81Z4KM4KR/xLvMB1ex8dT64hXU673a2oODpn09NA=;
 b=VqE9QFQfVJ0m5GFz2E5J4xnC9Es0LmNVZBVb4Gla3cRVZjtpXiy0ClMH6Q3F/AzDS/
 0AJrN8Nw4wJzvfDr7LMNLxjk8zaxCSeXrAHejeG14nLnCH73mF1/QQA0EPmNYHGjsfdf
 1l/37JqSui/oX5ZUN05FoMNyymk20AuP7qRpus7zdHQWTxQVAs/5/er2G/LzRzQyW7Xd
 DqZN6XkkLKUv1GyVepP1cBNADNp5kdxhOtywB8aEDoGyvgIB8eK4LBWJ2Bth2xnQJVFp
 YsnYaVF8Z0R8hWxPtm2NJVL5K5SojxQqE8oJ7PrhYjjxIzD4+yaAeSa9AgAJP8NKZBcg
 k2QQ==
X-Gm-Message-State: AOAM531Yf35v1eFgXULEFeAMUItBOF23XUWv31jE17TmuoAmO9EjoVNq
 T1/jo6Lsl4e+EPH/celdbQkWAt5g+lcVQzMiGdC9qqr2uXs=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22978392ywb.469.1651140096593; Thu, 28
 Apr 2022 03:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-17-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:01:25 +0100
Message-ID: <CAFEAcA8mb8s_OA2HfXkA=sEE5X04WdpCs9QDfr9N5EnzEuasnQ@mail.gmail.com>
Subject: Re: [PATCH 16/47] target/arm: Use tcg_constant in disas_data_proc_2src
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zTyc7GZKyrEN

On Tue, 26 Apr 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Existing temp usage treats t1 as both zero and as a
> temporary.  Rearrange to only require one temporary,
> so remove t1 and rename t2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
