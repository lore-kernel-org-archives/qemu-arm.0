Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1575647lfg;
        Tue, 25 Feb 2020 03:47:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzosGr6m4l6c4djN02Ke0fQptBAmk8Evm55xZ+N2JZAc/Xb2H8XGFekMEqPYl6z62nPLzOI
X-Received: by 2002:ac8:5410:: with SMTP id b16mr51429041qtq.45.1582631240629;
        Tue, 25 Feb 2020 03:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582631240; cv=none;
        d=google.com; s=arc-20160816;
        b=v+OjIIScLub/qgAgCeAtav8fyhmSEcpgHoMfGwPqwGd0Bp1d4M24qnPtAPO0oALeFp
         JEty6NoUVu5rEb1woJXYzr8wehBcs30KTJEcwES/G9fSvkgwBNfdE6BF6nLjibbe/Wd6
         Vm4s4MhMrhi8vVWjJns4aK7P86VJAZXbVgUHTP4dC3YQJOeKdQNBUXgtth7+Kqtw1uBA
         NnAtJecvCvAXUBE5WNdCEAXr7flA9TJ375FRmnjkgMJfA/+SFG2aGVnh/+8jPhPQ0hE3
         eJDAPS5L07WnmUFGO5iSnMP8Xdk8VOy092ibl1tVAywX47EdX1WC8v//iNxIFAOP4ReZ
         Te9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0WIgrSjO36kulyTpaFvSm4AhO1fHqQY7DjaAiBeMN5w=;
        b=ZmKUCJm17ffPjiENzrcj0JH9u0u4M6bU3BoBneknJNvQCkgFCGaTtpXDlklIAq1OG7
         Gyr6/iHQDMAqFyFvcojpQLQ5aOlV6vwDWH0PKE75uTQTcE1qv/Vh+J1ZS+6hltUS65Y1
         Rxy2uzyBhi8Ql1fLJCDXNAd4+s+bZb7YbXgZg7lrLJnaSI1oLfpl9H8YFtkk9XsPTMf6
         Gpl5WVZ63wE6TygVqJrca/n+jgZT6X19Lsf7VPexi76yIbLEuHw2DqkY3r8Pjkk7UvhK
         VoJtxhcz6YbgxdfwEFHfU8qDSmiBiMxUvrW+G60+dKF5R2GntGhZnM60sPpjj7qxzgmi
         wJQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7z133ay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si7331941qtb.204.2020.02.25.03.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e7z133ay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6YgK-00057n-25
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Yfm-000575-Rl
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Yfl-0006Ib-83
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:46:46 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44017)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Yfl-0006BD-2g
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:46:45 -0500
Received: by mail-oi1-x243.google.com with SMTP id p125so12246555oif.10
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WIgrSjO36kulyTpaFvSm4AhO1fHqQY7DjaAiBeMN5w=;
 b=e7z133ayg7ypsNfvU2hq5T7gJ6LYrrFgv10GI2Lp+N1D8NiwnkHU9RJ96UHqXC1Ur7
 ADkhkgpAZmIcdm+kLh4wgyxvV+L62M2zCHcgtVmfoWqXhf7UKl5VOVC71IibyBewi4KR
 0jTSl2Kk8BOICQgrXcznIiZxtchterwUJkhEfGRMMuUTm0MWdrD1+UtbDePeYRhWaGzA
 UUDDYaOpTBCPFs0iDy60Im7QoU9u0MyLucrzCBWqFVYVHXjJrdvf8PZ2YS80UHC3+8V6
 dx3n8yZPS58rUD+Fb87wApA5rW+v7tOUIUudy6Gwo3dWccJu+BQvMVym9bFnQLgGTE6a
 wG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WIgrSjO36kulyTpaFvSm4AhO1fHqQY7DjaAiBeMN5w=;
 b=TNqCl7Ka+IeZKrTENLmZvqQIYULLtqv3fy9SZxGvVfSV/fESxq4cE9gvh8DUbqYcCi
 4vzhHpz9tWjd/4XjOU/YDpvErmbVsj5wbNFxBLVdvQpDjDaMj9dKJbW0yK9NOy3Et8GK
 0yTLwAg6f4jcORXVe4LHJDgUyLFzYwsK1aarvPXc2zxwzteyb1y81hjoRUdpswq40jia
 VVG3fmONImVrGVZLto6MxPM2NijaNVrOspkzMPDB69/V8R8stYtAJ0uWei9p1rdbJfsG
 Y3j5QjKZE9O3FX8Sjm4plv/zy6LvbPz7R2hQIYnuNCvq/JLMDOPGkrVp/njXFph4lCDf
 P5vA==
X-Gm-Message-State: APjAAAW6MidEFEAcJqiRfjkPrZ9f1SuJ3kSy5Q8pBVqJFFAYZQXNcfpA
 h9A9yC1fZWPva7p28JHkGrEDtsh92Q3LhVA9fDtCKPKC
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr3129020oif.163.1582631203662; 
 Tue, 25 Feb 2020 03:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-4-richard.henderson@linaro.org>
In-Reply-To: <20200218190958.745-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:46:31 +0000
Message-ID: <CAFEAcA_izWw2PkO-xz3Eu7Jsc1z4SMa4=027hHN172k0f_FeGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] target/arm: Honor the HCR_EL2.TSW bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: +FBoUI3+XyhW

On Tue, 18 Feb 2020 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits trap EL1 access to set/way cache maintenance insns.
>
> Buglink: https://bugs.launchpad.net/bugs/1863685
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
