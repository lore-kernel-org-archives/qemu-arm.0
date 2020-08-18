Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3933956lfy;
        Tue, 18 Aug 2020 08:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo/AlA2dFzKMnIGX3/9eBOyJ6jk085h69YKUYRycoNchTdqPXas6tzi/5tXTP6U1GHSc64
X-Received: by 2002:a25:8481:: with SMTP id v1mr28475656ybk.203.1597764940360;
        Tue, 18 Aug 2020 08:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764940; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9gS8+PqOwa9+FEb2mZiatCoFhmocWz2J3733NQpN4qkuUPvtyJWFatriCndMU67dn
         3/firOJrM5ex9uDH7sZ9v7/R1GGdgbNwSOJTvnhJfWVGfWmSZEDGpkM8YE13liuMwQ1N
         FKkvbQ+Oi+exUR18ohzGic1tokRCgvkBeawO9UrGu/AKi3B7EQxMoTcznnGMyGVNJfQF
         5XLqNUybAjlE85JIDEXZ1PCrwm0LmSLREecZAihclEt5bdzY7ZfRbJjns+/GHyXykNhc
         auwxk1Ax5pgFBSlQACbNApvWq0oDwMjCMaVVPHtmHjQcTHUEb/euzESj/jHpwZ3BfYXY
         O4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BqAW5JdLcR/OwiQ7soZOOaW63907wIswgU7Ow0//l0w=;
        b=vmOqQ1f7UrF2GXOw97gAiE2h6bQsO2v0gFCghsmL2ixBmOjoEfyB5WNqigSYN/V1IX
         DuwwnCgNLGGwPLOjGjObivmBw5sJwFoagifP2+XmJ54cpSsb4dTysGolKbeZ2LgXwqMk
         8uEXrY8KrTeGQ2G+R7Cgrjfud64VwrEz/6WCPVhTqRkGImJGoH0qahMtCESPpy1CFeF9
         n6KjBaiQnB22kVXrteRRmOpfeQOx3uZ9Vcd3/Yw9wQWmGJ0m0X/TZXgrDph0Qad5FUMA
         gAjWtRqdfshLXFKi2RYpbGexzH3Qb+r6xVch/DCsYIocJzC3D/3XdNJ9RGoZ4x3uROUg
         wQkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpCZNtne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h65si20157171ybb.159.2020.08.18.08.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpCZNtne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83eF-0007iI-Ox
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k82Pq-0005ev-AD
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:16:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k82Po-0008DK-0b
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:16:41 -0400
Received: by mail-ed1-x533.google.com with SMTP id v22so15400939edy.0
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2020 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BqAW5JdLcR/OwiQ7soZOOaW63907wIswgU7Ow0//l0w=;
 b=rpCZNtneZhGYH6RmS/rzAR/R3FYW5SWEIr5QywgbqqaU8SwFfxct/MLdhJkxraK6Qj
 FjyeYQR9hCfTtNhavsMiqoe+k6/3lSEW9FkLdnvrzMAHmS/U1ltcoCSgMiRWbXvyUYKo
 m/SCqgiktrnPoL9M0/mJwQh+DDkZlmTFEK3+qX9ets6RcLZluh8aBvn8OJWVP+5IURaX
 JCo2o3QU7mGK1s8SIFhcS8ObT3Urz8eDPTlsw0K7lGmstgXrInpzojmc+p19MItMqmjJ
 i60tHwsfKK+OtsMggLBzkovS8buNnGPIXmPmm9Xk4ssNdj2r8WsyP0t7dT1jQ3QKx0Ml
 Rnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BqAW5JdLcR/OwiQ7soZOOaW63907wIswgU7Ow0//l0w=;
 b=bKOrcQ389IUqS1+HuLSK5fLc0DQA10p5qCgFMLCOe6qFDmIa/z9ONPlPZmUqZk80B7
 3a173ZMs62D1yG6isIoNc8TUTKLqfmLi7lTH2H3L999yXTJ7VaYKRG22tsnke7GZoUC9
 u3VheLLRIl0ALpVPb3Q9xijkyRGb4jRVTpQDJKP91aligwkzB/b60I8O0veYxz5bd+vC
 zzHPnMhXKhePYfVSkvXRuPJ4scv21HebqIsh6Thurl1nVKOp8qFDeQeYNpxYMJZGYvcD
 9w7A48k5zrG+ymdBjBl9tAuZrLGTxRM/WvVmfeoXI9TFzwnc4iudsbJcoi7FM7Tdxx8C
 Vcig==
X-Gm-Message-State: AOAM532SJ0wiJNY4AlNmYliHlzHRY6astT4x9aEAWZrx2AbUJmsiOgCs
 2Il1Cl/kvA9OlS9uCrQdeTXxG1psshGa2fvHDZOoIA==
X-Received: by 2002:aa7:ca0c:: with SMTP id y12mr19541346eds.251.1597760198300; 
 Tue, 18 Aug 2020 07:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
In-Reply-To: <1348331683.3733974.1597759332262@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2020 15:16:27 +0100
Message-ID: <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: 4QdOF+JJZ8Lo

On Tue, 18 Aug 2020 at 15:02, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
> gcc params: -Wall -Werror -O2 -nostdlib -nostartfiles -ffreestanding  -mcpu=cortex-m4 -mhard-float -mfpu=vfpv4-d16 (to make sure I have FPU instructions)
>
> the source code:
>
> void PUT32 ( unsigned int, unsigned int );
> #define UART0BASE 0x4000C000
>
> int notmain ( void )
> {
>     unsigned int rx;
>
>
>     unsigned char s[]="QEMU is not that interesting";
>
>    //dummy FPU command
>     asm("vmov s15, r3"); // If you are to remove this, the qemu would print after I type the command continue in gdb, with this line, it shows nothing

This looks like you're trying to use the FPU, but you haven't
enabled it. If you're writing bare metal code then it is
the job of your guest code to make sure it enables the FPU
first, exactly as it has to do on real hardware. Check
the Arm architecture reference manual for the details of
how to do this (I think the main thing is writing to the
CPACR to enable the FPU).

Otherwise QEMU will correctly emulate the behaviour you
get on real h/w if you try to use the FPU when it is disabled:
the CPU takes an exception.

thanks
-- PMM
