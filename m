Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp664550lfr;
        Fri, 16 Apr 2021 12:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbKtUi03eNeI8ds8xWLu/b3u87wq/XDHbLWRPv/IDVlavtSmkGpihaVBoiutFEw6LjoDh7
X-Received: by 2002:a05:6602:2089:: with SMTP id a9mr4741489ioa.90.1618600983432;
        Fri, 16 Apr 2021 12:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600983; cv=none;
        d=google.com; s=arc-20160816;
        b=wNto2J2tQdFJ2ui890SsPwYuIfSGSRhW8j1po3l+G4JcEMmKUu7Sa/ghIe/RE83Pl/
         bpo8SeE+MDsOVhao9O5/c0HDCTIXQdZmPbTSjj3sDDgVtq847k6ZYjD0i7ZZEvhfmgHb
         q7aX/rmg/f2buBAGsZD+9YxwjBhrNNYczzPwfKFIj/NnxpVSAVEj1NrQhFPW5T/JjBr3
         wlPlqCZu7JhEBHcAwNYrA5yqSfcjJuHX5+VHbeuM/kKz0glN2H90E3LbalQiCS8ZTGcw
         Fr8pg1lYNqfQ5wUnKccsq+R7eqXoYQJznQUSlBx+EW0fEv6HaF17pcy3wV8A9bYyzWZR
         1BUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQ50nJfYxuKPsva+LWRGT805gpOlHHQSE1O39nYKRhE=;
        b=U3GIMp7nGEtCxBAC8C0VGiTTsGtifEacPwfPUY3ZMraVHZdYyq/n60M41E7GSrXGLM
         LTEwbUFymiE9XFufYDIfI5hMI8U4014u73qV5vq4tUnsv0Gsq1gCpgTLsqDlDH0Fzigh
         FPbrd9Cg+0u8kw9vI139vLzBZ3HtRMiXLUvi92T3B3R1zKtgPA2JCnyHWBLYVaknHoOI
         Fp3IHHkd1LODFjJBR9XaHdqRIgVXVgcEOcBiG1XOusOeP4jt3O2JQopKsXkJ751ZbqbE
         Y/CoQ4CmTI8xqEqnYuZEw14R3fSXEQ17FPEZqEIlqbMnBOXYI/GaaHJzRZzgCSQByzxE
         GQfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qr837y6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2288049iln.114.2021.04.16.12.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qr837y6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXU3S-0001Bv-P7
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXTz7-00034N-JH
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:18:33 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXTz5-0005aY-VO
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:18:33 -0400
Received: by mail-ed1-x530.google.com with SMTP id m3so33527804edv.5
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xQ50nJfYxuKPsva+LWRGT805gpOlHHQSE1O39nYKRhE=;
 b=Qr837y6VSXTYrV7k6basXyn5xKHal2tSEKpEhXvrbuQbwY1Hk7QsWwreLypc6TegOz
 ElSz2cTqDvv+R4yNmAllhSfockOAcjR2FGLLn9qP+DXcBSno0YpWnISRnNBDUtu79fn/
 EvnWjLPkuKy9+Kss/VVVZMv7n68LyzW73h27Y7y0lmwtyUxNtFsaPMJR79Uxk9UNEFRS
 XmwaKUzmI/VeOGha8KScexvrR7P47I7oTY8WC0cogJ7dpfY33rNeVSqDs0iLOdBwG26f
 YeYjX4OJsWvqGS/JYeD6SNmrXCmN7Q1Cj1HAZ+Fle12B9Pbd9DGLbd+VZg/nG9HSsoWY
 hcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQ50nJfYxuKPsva+LWRGT805gpOlHHQSE1O39nYKRhE=;
 b=OCjOhf25/dN4ZqrIyoTJ8vjTI0htdfJWtjCpWn41nWs9avA504wC2owxqrk89qNgcA
 eq2Y0Qwfyfp4pDlLyWh06DwstOYsDLRpzGC8y+t0XcB4cA8AYhcfbew+J+BvJwSATeZF
 IsCGwX8ONQshMNFXtXxpHdLcxy2YsVM2v6AHI67IEVPcGEj9pXrWh2rZ9I5gh9wlbEF+
 e9IHrLWeWVD9LlNz2E2hhoARzwD96nPdTCFCkSNtimJAoieSBvEJ5/aImpKMTHPtCbjG
 gEQcQSaJGwOXtc3AP9iVIRBJpvjvm/C7p1sLgv2v8cUPx5kpcciSUGrUUdyMaldOvHH9
 0obw==
X-Gm-Message-State: AOAM533e038sx0SZfsIqN7dxhWb3QZvWEMRBObRh6EGMSyWBzwSDWJnK
 9UT1wKCns0RaXlVUb4QOHEM3OK8Y1Vks2y5+VX4o6A==
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr12022678edd.146.1618600710140; 
 Fri, 16 Apr 2021 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 20:17:41 +0100
Message-ID: <CAFEAcA94XeExOTYxF8owHUjKN_dbpXx19OonuEMGGTNBksPg2Q@mail.gmail.com>
Subject: Re: [PATCH v4 for-6.1 00/39] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: tRaUOw8ySNT7

On Fri, 16 Apr 2021 at 20:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
> ("[PATCH v5 for-6.1 0/9] target/arm mte fixes")

Subject says 00/39 but...

> Richard Henderson (30):

...only 30 patches actually sent. Are some missing ?

thanks
-- PMM
