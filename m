Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3932294lfy;
        Tue, 18 Aug 2020 08:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqWLDwCdVFCt1+vpY1ZFw9fMK5Z6Kx05ivbg0P6o24hVVt5FoxGU4H+o27kPUtWP9/3IX6
X-Received: by 2002:a25:3ce:: with SMTP id 197mr28424595ybd.493.1597764839112;
        Tue, 18 Aug 2020 08:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764839; cv=none;
        d=google.com; s=arc-20160816;
        b=Qwm7oeaYCZeSZHyUm6Vw2+HcDcsu5upaC4k1nI6MV7G4IKZ3jw6BWIFUqZ2aINFpdx
         4xaVydoKVoWke3z/nlQYzi2xDdpU3/C6PG7UHO0jsQzkoM/OI8LsM8mTEowR/tkzuJt/
         TQnGw92WEFcddD9XJDi8d6kz6PISQTeuzN9q9YmXZ35dllR//GX1araOhlty/8j07Wkc
         TtcdlaT3jhU2cyCbWLddjElgHweFi3uTSMaVpUVejK12rxFnxLJh+OSNzvEWQIOnhqxS
         sSHwnt98gXOMZk3DmMPdGnPvEi25pvFFRxR1nTfJWljmKF6bluZOpfGMWk7Js8UuxPfc
         fwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pbcQ9uxrmizDVFdUTFIBTedVuFk2sWvUdAG0bsPX4/4=;
        b=FhfV9kudnKFXNAG72qByNVk22NL1pkWR51FkQ0e/Y4luaKhsfEt3lc0yJQtWqXt2Wv
         hYttuTFEl5uHFNiuA/gez5k9EvAEnZLFNPMi581Iho7vUENv/EMD0p8Q+tixjfEXyEDp
         Ssyr7tPnlwV3xUkbHANLHg3leu+HmkV4Oeo/TgAvx4DdKCDCwCXUtl86ufwvWY0t68Ae
         z9L95KiLxYIWNN2IZc+Bk9NDSIulJ0bTTqSMzt+NgMsFZ3IwVzHNVd4auaaeD0JzGHT7
         Wnsy+ZPgks/UO18WL2ZM85fVYpwiWJo8BLpPdtPaKOB7y8TA/icb52dRo7W/2YIPeZwM
         DgMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dY/yiVRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si28285991ybt.404.2020.08.18.08.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dY/yiVRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83cc-0004uQ-GW
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8359-0001NX-QG
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:59:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8357-0005JN-BK
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:59:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id m22so22415455eje.10
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2020 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbcQ9uxrmizDVFdUTFIBTedVuFk2sWvUdAG0bsPX4/4=;
 b=dY/yiVRzh20tqGbIqqvMtRY4ic5wVw7UtvOIFV5XPFY/2NiGgZcdczv4iNwFGbktJn
 DvthOk8bJ8W5mqGp7TjRTIZAgk4+kWe+KhMOedxORXHl4B3ja6b8Ugy4cocVVcwAkqIF
 YZrZErqI17BBiyBl3xJsRY5y8qPlKDpRutFLlA9scXmEA2XhwA8TV301PnR07GxqFeCl
 q/CVsz45j9LSsKNxuWCCBUh7EUZkqJ9++C450UF1puixHjV86XCEPknAt1snC6GzmZb8
 G2El3ZzhFqZoIC+DZntZZlj6GX2QMNnlGHZ9p8Ki59xo2xtgg8K6S6SpM3NApm2s011d
 OpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbcQ9uxrmizDVFdUTFIBTedVuFk2sWvUdAG0bsPX4/4=;
 b=YyVAXcXst+uv0DTTZgCri9Kqbd3dk6AW9imyNZnAkJPXreWjYQOd4pw4t1LdCCa0pA
 zq+Sldx+WgiBvkkc0hEYe34uDOOeYTzhIewF5v25o0l2JnItjZU7odq8dkmYceXRgTdC
 2aDyz68shVnrxy6Ug+E1kNaLmcGEY/oWldiz6Z5M8xqEtpws8r1GevKR3gPmjP5FF1Bx
 4qtmp4b9CZLGNXJUYpqtLttaMN+chnsoM/m7AwQhg+BgngFMCtbbOP3eghk242VEVUsd
 fR6L1kGvw5gJuxg3qqtL8niuwwdYT7M2un9NWkhOggq91m6tFhqhOCuCwpdiBjcP48Wa
 jEjg==
X-Gm-Message-State: AOAM533WWNF87BBDsM3TAC0PfBCcOfBKJDTc7eInwHLzdQn0706mNojC
 oYy3OX9KBvhL6ILGSp0KiUvUSIw9w0hKRglEkvm3Nw==
X-Received: by 2002:a17:906:3911:: with SMTP id
 f17mr21444116eje.56.1597762759723; 
 Tue, 18 Aug 2020 07:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
 <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
 <1359439110.3773430.1597762095933@mail.yahoo.com>
In-Reply-To: <1359439110.3773430.1597762095933@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2020 15:59:08 +0100
Message-ID: <CAFEAcA_YA-=7Fnb+=g_uFmhcKDNLmjxmvOtFFPx+qQUD5QWuuw@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MoyqjvF3aRD4

On Tue, 18 Aug 2020 at 15:48, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
>
> Thank you very much Peter,
> I will try this first thing in the morning,
>
> But before I try this, if the register is memory mapped, the stelaris memory map has no FPU.
> Is the FPU always at core level at the same address?

The registers like the CPACR are memory mapped as part of the
CPU itself[*]. They're architecturally always in the same place
regardless of what board is being used.

[*] in QEMU's code internally we actually implement them
inside our NVIC model, which is a slightly odd place to
do it, but this isn't visible to the guest which just sees
the registers in the right places.

thanks
-- PMM
