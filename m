Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp772088lfv;
        Thu, 4 Nov 2021 04:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv580RWcS+CECgLzOOPMLvc0qIgmb1z1fIMEwf4KC2rKsWNNHe7LqpzPFx75NXugKDrdeT
X-Received: by 2002:aca:4283:: with SMTP id p125mr15574060oia.81.1636024610220;
        Thu, 04 Nov 2021 04:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636024610; cv=none;
        d=google.com; s=arc-20160816;
        b=sED30xtLc+kyEbpRYHsragjf4K45Rbm/Gz9LVINQDqjUA4nxfsII0jzMOLTYq+7VzQ
         jre4mVCdJHAu4i//S9+uGvK4E+Ec0vPVIvk0CiPAwxqly1rrnCxMsTP+E9TASF/mmNV7
         zj2N7hbc4QzqPBz7bKc1wD+VMd50cuLT5634zgkXPXhfsnTweJkGLeJUa+FP/dsBcuho
         ChtedQvJMuiqxRy3fth3GaPdAhNlIv9dpzFS4esh6M60rz+tVffxI0FauzQ6Z0rRJT3H
         HT6/OgJsh/0Vp4Jf2n9MFpQyTMmJY679RGW6kIuT3KeZe2v4mHeh2c+FXd6uCHB3bTo8
         AZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JH7aWD1deqAxer9UVZEUB1erd/E/9U0gVnrgxAHAvEA=;
        b=Tw9ymx3tIZLPWdU6piDftBUC1lCdDFEJeA+52TvTHXvsutS8opKVS6+KnXIrBJ5B4s
         fzBc2k4MSzJdc0sg6J3DixwiS9mXWcz0ZQfsrVlRLw7FiMdrVUtkc5WXF7o+mWWHfeQU
         3sNnLMYtby+K3YTDxNlKgxOY8r2ny6Py21MaFXponqn6SctBBXbjdyyGK6Xn2XNWdH66
         z4DKD50o71DxHWnx+5GWC2vtj7qUwb6mpEo7bpiOEqjNzHlh/jwluAucY3wBPPbtdgCc
         szt6/S/LxPWxM53EQ2QBK+fdBYD/7SNTVCImDPKbvtaNxtVqzGDVhLp9ZiUZZI9YdAZo
         8C7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0bxjrGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si10309547ots.32.2021.11.04.04.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 04:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0bxjrGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miajh-00083l-HX
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 07:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miag3-0004hI-7f
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 07:13:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miafz-0004te-Rh
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 07:13:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 133so4256099wme.0
 for <qemu-arm@nongnu.org>; Thu, 04 Nov 2021 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JH7aWD1deqAxer9UVZEUB1erd/E/9U0gVnrgxAHAvEA=;
 b=g0bxjrGLrd3s8jo2c+MXLn5GhFeB+E/oAXuT+oaQQDTGizl/9ouurEIH0rWY0xWT9G
 zyTKvria5de4B6BuzkhIqJebTYi5iSVgOY+mMf3aSDM+qudQUGftZ+5nJ1HOHtLG3ELm
 IeaMg0jz+XYglJFHZlnYYXcJEa57Z4lxczP4n4usWYYTzyF10vMukPPVItOmX3p1adNS
 Fk5rF6T6lnw34GtR9+a6UcznsM6Kza8u06QzpSCUIbxunl3UQyftLVrejd8kCpBsScgn
 WpGPgmNqC/GZnbswqpmrv1pEiCJzPqygfbZ6dDVsykXLK9nPkJ1QkBP/Xe8pVEOAoNh/
 nP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JH7aWD1deqAxer9UVZEUB1erd/E/9U0gVnrgxAHAvEA=;
 b=J/W16IdFHRYvc6DRIPV+LSJjjofc4tIc9EufAqoJQsMjDJ23pjiGadMzQAxKP12Xbd
 96Wm05JQXJ76CbjQ1ioozq6jqAkkiscAM4FefFTFlwZ5mTRhfScvNRdMNn3lzkBnKo+M
 QHYx4PlP280zgFm907mMN9Q8OiDVl8Oa7vGx6JU+jN57U85GDLmXpR7b8jZ8bpepZb9p
 6mE59uq5vweE3lDOdomeHyJkmgy/mj1KiWOgCg2OrWWv8hCnw9uMZPOTLJ8rVyJy77pY
 VfsYIXtnkFeVpNVcT/wB7m383J8NFTxlvaikpY3kcc4Beet1hj6ddTzaAIYiydVXUfRl
 Xv6g==
X-Gm-Message-State: AOAM530KyI3HeaMEg5YF33vqUyusEKabJk2BHhTMn/mYafGnt7ZElzp1
 oT0460XIXy5nvUBohHWeyxutX2Czr+QncQJZD+IYptdFlt4=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr3724754wmq.21.1636024378366; 
 Thu, 04 Nov 2021 04:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJZtUfeUWkkTZo-nGPk94JEL-sv9c=FFJEquq3VUNEo9VvwqKA@mail.gmail.com>
In-Reply-To: <CAJZtUfeUWkkTZo-nGPk94JEL-sv9c=FFJEquq3VUNEo9VvwqKA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:12:47 +0000
Message-ID: <CAFEAcA8azRcoAw1HVzX_UYwjQz0gqpfGzMOtLuUme8r=xDu7=Q@mail.gmail.com>
Subject: Re: Rust Compilation on M1 Mac emulating x86
To: Colton Weaver <coltonbweaver@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZWCO8hFaI0z

On Wed, 3 Nov 2021 at 16:03, Colton Weaver <coltonbweaver@gmail.com> wrote:
>
> Hi all,
>
> Apologies if this is a well-known issue in the community, I just
> couldn't find much more than this github issue to docker:
> https://github.com/rust-lang/rust/issues/80346
>
> Of course, this is no longer using the Docker preview and they've
> since claimed this to be a bug in QEMU. Does anyone know of any
> workarounds to such an issue? For those that didn't open the link,
> when compiling rust for x86 on x86 images in Docker (emulated on
> QEMU), I get: "thread 'rustc' panicked at 'invalid terminator state'"
> after a segfault.

Is there a repro case that doesn't involve using Docker ?

thanks
-- PMM
