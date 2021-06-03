Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp58350lfa;
        Thu, 3 Jun 2021 02:23:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3uVIOAYKclqmqh4Q9SXzwKIYkM6hwlcXjeB7Z1AgHIBB4+8RnBq+3uC9Z1J6IyTGL1u0B
X-Received: by 2002:a5e:a704:: with SMTP id b4mr29364096iod.35.1622712192297;
        Thu, 03 Jun 2021 02:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622712192; cv=none;
        d=google.com; s=arc-20160816;
        b=uBfb+xcRL5L5Ux7m0gNs92IyWjy1G1bDiT3/Noai0la/gYNnahyoeATn3gAbfdO53n
         j19F3wONtfDnPV6phYH1Re20+GcIrQxm1S7j1hzaKHX5pL7Vt3mC3X8cBJypIm54/3m5
         Y6rG6BQURnK5P937zPu5/M8trSGrj+TOfEV/Mr7No1eW78BEDlwCP5NLtRdcnfr/UEhl
         sklpy+Vn5Ox0H8s1VPsJ8BwZET5pgmt33PGcJjGJx7s0ShP+gmp+XaTQV/N75rrXFrgK
         oBJFtRikxAtxIaJSoMbk6JNk1yaLwPl6OF15NIa/EZYeDV1ERH7yV5A6oD+YnmrwAI39
         kcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9qWXOgCOHO+YbEkj0N3B2e/3m+pUj43rh7cMwlh8sU=;
        b=aHkRwdsnDis4gkPpZTvZXTPVyLezU4kb72iVqz0TJR6xyCBb0mhH+CcpTVg9v4a0C1
         qKd7Tg2a8vh6t7pcYW9S6mNE1UyxM8p3KkjaUyZSUdRbJX+5wAKFenK423RMtnht6AY9
         K5zAb2VmaoD+u3s111uTsieNjnZ2Ubgnwubc4WpHSAcXjY8GXAcCbeMWyOgR2w1AscZ8
         8YYj8tjg1+bb0ggXjQRS1tQnQCxsFevbKPywsDeqohM4hocr8vZGiDjvNA6Ko6Bna2JS
         k4MyVjkWlwbwjIE5puSzWqg3me9xXj6Rp8ibiOFxEFyw3pcQ8fVjL3qYloT9GP2zqGlA
         8I8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ByFI3/wG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si2579340jaj.14.2021.06.03.02.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 02:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ByFI3/wG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lojZH-0004a3-Mi
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 05:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojZ2-0004V2-39
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 05:22:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojZ0-0005RC-CZ
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 05:22:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id g20so8287651ejt.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9qWXOgCOHO+YbEkj0N3B2e/3m+pUj43rh7cMwlh8sU=;
 b=ByFI3/wGDkiJvszg9fd+/Jdp/cuD4GT9wYgVwwTLjQuJrXrC3Y9TAqoY12AEYpk1/e
 TieFi0KOvMa13vy4KcIg5shcvsy4a7jVpF2OGG5HemlxBLiP17G17XN/LrBBUhFbFoNR
 OGzJK2nPiKMN5eff3hY9ZIlEU2Am4ByUGezrze2hkI0zOhcaXoO+yVZmNIW7goXQWsNM
 MNvXSZc1ziQp8eufTutSA10UglldTp3DEs2x15bvz7EmWyHGdCmpZGlxcKlGS0TYLH2h
 BI3tX8+eq/Fer1RthutrZ51WrMwtXEGQJK3stY5HbH5qMm04Ghp9BZipAIdk529OjFsb
 tIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9qWXOgCOHO+YbEkj0N3B2e/3m+pUj43rh7cMwlh8sU=;
 b=cJZ7dvEGRLCpclGZZwy2hWeEdYzCqbQB5BSBr0wK6w7CeQDeJadac3JWbSdQNMPGvF
 RL5QBdN20S/WDSsGXd/+gAxVOboQs4VILkg3LuB9DrzmgAwvTlKYq6s5jujyV1NLP5S+
 G0bdQDARTH8iOKvFbm66eQaucJrO91IIv1q2HE81//NmQOGnn87h98kUQ1+kuL7+HHgy
 SgMiMhbpVO9Rb8VIP0UcVI4ou8CXWiOQjXvhtkKvcnufYOtlcy0fd88IBt8V1TZpwbfu
 p4PP6Jf3gtjjBuggnI4I37gG7mrB7loGe5HV5O3UPAjp983ksmNnmbiRTlOAefeUoUn1
 fYKQ==
X-Gm-Message-State: AOAM5333f1rcyi+NNt/xvf4rUQvRskw6Af4bKmIGSP0ObA58cc6Gih1+
 I+xvzdKXDtBuMb+TAia1Xww5W0u/rT8stySEphSqVg==
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr16276443ejb.482.1622712173024; 
 Thu, 03 Jun 2021 02:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602020720.47679-1-richard.henderson@linaro.org>
In-Reply-To: <20210602020720.47679-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 10:22:20 +0100
Message-ID: <CAFEAcA-rc7vFwwmvXVZtsZ9VQgxRFbr8vaf-YfUO6wmXv8-vNg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: BXp5t2NvEcOs

On Wed, 2 Jun 2021 at 03:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
> be signed, so that the inputs are properly extended.
> Zero extend the result afterward, as needed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
