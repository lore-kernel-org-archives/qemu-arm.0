Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp197894lfp;
        Fri, 15 Jul 2022 07:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1H+hJHzUjMBYz2uKUC9OQKGJMKOav6WoFKjqZSRMF4q0XiupCwZOaxVzcS6PdVW6C7c/P
X-Received: by 2002:a05:622a:551:b0:31d:c3da:fdd3 with SMTP id m17-20020a05622a055100b0031dc3dafdd3mr12823385qtx.559.1657895943244;
        Fri, 15 Jul 2022 07:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657895943; cv=none;
        d=google.com; s=arc-20160816;
        b=EptUA3uVxctAyR0U5frRxd0Z/6h3RDXMdWVXigXCftJOU0uJej5fwJAvqk74dSlvWy
         tBOSTcSjUAiom3Y09X2HDJPUPZYUkwQ1ClC1geLJ5bh2OX22jZmouP4jngop1B4uVKMX
         dV+Dz4e61w4WzIhfBdxXpxBDFIoG7GC0+xkel0O2/w2VNP1NAf4s9VQEVUe/5o9J+qrb
         +pV6t/Ciecgxsk+9FNB8wKShxNIRmOfubO4mgVPZsjQKE2ROV5tlzj6EbZZFoV34oOB1
         HifQxyH+Ga6cFU4Oq2hCWJ/xWmwJfD7vwvfE7GkexEYhHXLCB0fAha7KYvKyA9Ordf4a
         aXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1nntSu14kiYA5aRvwAZ6Xu0P2IzNjfktu+XIgD8NX/A=;
        b=I90u8WQy1lSWQ48g5fARGYqooJUyZwa4QsFiEXWaBw7Beb3GPvC0XzMjDSzA0lOnrt
         baLwq4wxTyimy42z/qwbI+fxCvyJIcBif8VL6zfuGKOox1AQnInhAwJaarWlvWbbHBs9
         /0HZAzbeo5bZFZlGiW9ZdrcYBIdZ8rCvgsYiju6Ab6BlbuMEPyB3wSwNQXOk1FSSk+Xd
         w9EpOeFOSfJu0yqeX2/U4CR24BLqZi36nUDg/NUJ5CYnomo7xHzb4ptIjGJ9fcMwkG23
         4d4iwWNAhyQd2kAtCieDfRcsnxyWUXzy1y4U3t8rbNHC0r5/Uiqf1QWhRZWCnsdec9n2
         Qllw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EZI7VpNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a0562140d6c00b00473408fddf1si2781465qvs.6.2022.07.15.07.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 07:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EZI7VpNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCMT8-0007uY-Oz
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 10:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMRt-0006gD-B1
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:37:45 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMRq-0003rb-ML
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:37:43 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31bf3656517so48540627b3.12
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1nntSu14kiYA5aRvwAZ6Xu0P2IzNjfktu+XIgD8NX/A=;
 b=EZI7VpNK3bSFuAooICJ3BuRz4KhtOz7WmEJCrnf4vaFUtDtIk6VG2IorTuKGlIPskC
 e1g6K09PMuSNzkCp70D7f27PRCIhIKEjOT7Bqx+QGB53qx0B4ZTv9FwV7SfzKnoTG5D6
 xd3xrmVKGdpv0i7U4GeeaU7L9Jsh0qZUT2hTGNwRVsVP7G4+pBUBvKerMjYyZuGRAiDw
 /mTATNnEiZQrJAWW3869jl+Bj9b1Yxwgmh1g6dor38wAdiUCUSWBzeyGpMk89kGWLO1L
 IRHTKdtFzvz7EnNAoheM0gVQqKRtQ9eNKxcy6iCNGizkrnty2R7KpfHcC2uxAj2AI5K1
 Hoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nntSu14kiYA5aRvwAZ6Xu0P2IzNjfktu+XIgD8NX/A=;
 b=UXWe9dNXddhfod5f59aTbaux8eSknOzSGnOgpVXPgoG+Ic9b4lCfKY7xuMjSh5Dj5L
 G4tu+XIceQEoi7p9tcXqonTX94MuUibr+WNlL2gEhB0ZaEyTnoJmjRnMWtk+LA1rXdD7
 DAB1jOa8w9dhtyXgxkxDW4m+PFAtnFOENOtJj//+v8QU/pNGEJ+PhOvl4mjxu/hdGVgU
 PiwT33UJsWr4ym2B3RKbFOWgHwK4dn8AjJb+RdliGXwa0NBj3LzldWXPF2KsuGuMYK1z
 4AwbEX7w6fhGD3NXYs357KicKAOf2IT+wA1zlHUyVCyD81XjTp2LJEL7d4io6udIEF51
 v8LQ==
X-Gm-Message-State: AJIora8Tm0ts1pRnVLk1O7BhSJwHvDIlOHwZvwBKSYdgqI0HiTR+zA3n
 QqZgYkP6J5KHB+fAbu1lA6y+C+su46bZXOoMzw+djA==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr15761166ywg.329.1657895855637; Fri, 15
 Jul 2022 07:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220714154456.2565189-1-clg@kaod.org>
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 15:36:56 +0100
Message-ID: <CAFEAcA_mKbzYsavPboCKqo1f-PsL_tg1n=9nkjMVFymJhgXUcg@mail.gmail.com>
Subject: Re: [PULL v2 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WpIdhYZacM8b

On Thu, 14 Jul 2022 at 16:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 08c9f7eec7002dac2da52c8265eb319aba381c=
86:
>
>   Merge tag 'darwin-20220712' of https://github.com/philmd/qemu into stag=
ing (2022-07-14 09:30:55 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220714
>
> for you to fetch changes up to f0418558302ef9e140681e04250fc1ca265f3140:
>
>   aspeed: Add fby35-bmc slot GPIO's (2022-07-14 16:24:38 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * New ISL69259 device model
> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
> * Aspeed GPIO fixes
> * Extension of m25p80 with write protect bits
> * More avocado tests using the Aspeed SDK


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM
