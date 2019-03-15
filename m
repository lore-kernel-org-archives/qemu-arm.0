Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1843311wro;
        Fri, 15 Mar 2019 03:09:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrrx6q5M8Gmn4NXV5Nzm30x3lhfP8fM1yoWFG1WVBXD4aOhXEIWwbDLmXQDYQ3zrlUnn3w
X-Received: by 2002:a7b:c7da:: with SMTP id z26mr1539001wmk.151.1552644546015;
        Fri, 15 Mar 2019 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552644546; cv=none;
        d=google.com; s=arc-20160816;
        b=WoqqtSTVCSB7JEfczbu9pNTzn5c1lydmXidxO1Lec7L/hg1cqPsSbP4bYST4PJhgDu
         vsz66Mk3eHYVMUEF/oNQneXNLcGNEuXs09D/1JbxpTsev7J7jbHVWPwV/vlRF3OWlEf1
         9kXPh6F23pt7ecquQaJtqMDvwzLsOpVkYZ0SAvyX5PEYKHwKuFrW9/UYoT1qJMgNdmXw
         5U8r6RjACFYmkzUNIroPbchIWwzt8ZmY4C9xJu8BNY9HPNWhiFf9eGjY9skvI2ViLXuD
         2Z19WytjzkNqyyaSNWGrgedcHIh0B3pCUA10vwmkA7bTwjU5GkgeLLrOevonKo3FHl3q
         E94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODuyyeHjL/KhnJvIDEdBlZd2QJox+Bkz3q3nW2oNHp0=;
        b=gymZi+zgcBPAYLplRweY+wak3ItCCaxgiT/aylynge+sTOnU1HLGaE3SyDvF1Uf55k
         s9n39mkMNoY5LXD0mryR2Osh01oB15ye0dlFKbB8F/KeNnsGTkQV1hpaCqePQPvAU5yn
         CMjChs0T///z/7g3ur31FUYynzY3Vr0QNL3tk8rQe0FeeEo7YXbvrC0kFd6cJbpAkjzy
         1cGleGw4cNyUpCW64hriELWC5qT/hnDjLTpZukz3sFU+zUrIMgLhzqhoq16XnvMwjAxB
         /0thlC904acjNdkGy/xC2LA7JDj5xgfHlfAp6/kqr5EPaDskGCc5puOmt99k2k/kDFIm
         O6Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7fnPHnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si993320wru.96.2019.03.15.03.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 03:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7fnPHnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4jlx-000244-2L
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 06:09:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4ji9-0008Bj-Ci
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 06:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4ji8-0007UH-4F
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 06:05:09 -0400
Received: from mail-it1-x132.google.com ([2607:f8b0:4864:20::132]:35078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4ji7-0007Ta-LN
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 06:05:08 -0400
Received: by mail-it1-x132.google.com with SMTP id 188so9936549itb.0
	for <qemu-arm@nongnu.org>; Fri, 15 Mar 2019 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ODuyyeHjL/KhnJvIDEdBlZd2QJox+Bkz3q3nW2oNHp0=;
	b=V7fnPHnhLCZTRmQS+DChkjm8iM1UK+j7F6zy0PVSubnasIBLFCFzekyto5jhNXi1H4
	2rQd01CqaBxP7icwSet0eR58wS8smdeB2rgEYbXFGBu+3iCwpnaQGDSD34J/lPO8nOdb
	KIwWOymfyrN9iUbx99y4ijyvaSKkPUptHDSIxY7ieXE6VlxxqmjH47lWCK/jEeo1cVdS
	XYsESK0vL40IlcBGiQt7r2XFHIiV0OJv2U+8v/WP1MQbB7rdcge5pb32a3B/WCkhxN34
	7/YXNXYPufdd6IbPlzEyARkayZZ0GDlE7plhCDZiozTu0A+/JpZamsErFE8YfxwsmYz4
	HtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ODuyyeHjL/KhnJvIDEdBlZd2QJox+Bkz3q3nW2oNHp0=;
	b=HrOhxIRQhjuT53iOzU52LvhZZ+FJhU6yVcHv0j4JL89vp4El5/r8tEEn0mdCMeJ+q2
	b5l9D3Lhu3c9K0TRZnhGBe6nps741sgY/u3A22e+8gF9ujZERr7zyYieIE37YT/0bn7a
	iF5kYhcNDm1t+o0lXmCp0gyzGRmKLHSmH1WWJZEEeg17rpHX5aBAKtoszOtC3Shkwoi3
	CfwXFNx2BaQdofwjC9ejPL0c6pu3OGRIg2TCB2i+O6rwCvkXJLByenMYYJWBcbTOwNUL
	GGludNQuCeaFWy4w47F6zo5HJK/949e7IToCfeHtewIYlQQrgHYYGcBo4MXJwciMF6Fz
	ejbw==
X-Gm-Message-State: APjAAAXsnLqdBozOq9CJpSY2hffASgu2a5VRcVj2NiATDWt6aJnod0IG
	d6hWsC28byJh6xCw8X3n8av2YihCGmWp1c3I76jqtA==
X-Received: by 2002:a24:d546:: with SMTP id a67mr407447itg.140.1552644306126; 
	Fri, 15 Mar 2019 03:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
In-Reply-To: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Mar 2019 10:04:55 +0000
Message-ID: <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
To: Massimiliano Cialdi <cialdi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::132
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGLUgNhofXHW

On Thu, 14 Mar 2019 at 22:30, Massimiliano Cialdi <cialdi@gmail.com> wrote:
>
> hello,
> I would like to try some algorithms on cortex M (especially cortex M4). I don't need to emulate the whole machine, I just need the user mode.
> To test the feasibility, I wrote the trivial "hello world".
>
> I can compile it with arm-none-eabi-gcc, but the newlib associated with it does not implement any syscall.
> So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc and its libc6, but the latter is only distributed for cortex A.
>
> What do you suggest? Should I recompile the libc6 for cortex M (or do I find it pre-compiled)? Should I implement (and how?) syscalls on newlib?
>
> In summary, I would need a step-by-step guide to running Cortex M code on QEMU arm user mode.

User-mode in Cortex-M is a weird thing to do, because what QEMU
gives you is the A-profile Linux syscalls. It's a hybrid that
we only continue to provide because it happens to be used and
useful to the gcc folks doing compiler testing. I would
recommend against using it, personally.

System emulation mode will get you something that actually
works the way the real hardware does. You can then do
output either via the UART or via semihosting (you need to
enable the latter on the commandline).

thanks
-- PMM
