Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2738483wrp;
        Mon, 23 Sep 2019 07:35:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBErbgeetzjWo0u0m5oY8tgAQmIzM6hT3ByzIZCnreo3JAVZJBi4uLPPTb0zI0Uc+y0jJi
X-Received: by 2002:a17:906:7fda:: with SMTP id r26mr215149ejs.170.1569249320873;
        Mon, 23 Sep 2019 07:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569249320; cv=none;
        d=google.com; s=arc-20160816;
        b=jqg++13zsdkwlrXShwSrSr5uYyu9CVL9Ltv4AWrBxpV14G6KWYQQzWYi+XIead+G5u
         EHGhi5HQABStI630nygEd1CP6DqnEUVAbdom5R2r7Sc85o1bk6kyQ/TAmjs/DrAsA1Fp
         aaBnbBz1KRQT1tAmComSnJVFimtXIuvo+P4Ip+mH/3hm+J5sVHCRp7/SheFIgTSm7kPx
         /DqYfc/KDOnPHidExG89F49/zBTJBd/CPwoIQ8LixlDreY3cuRQA2E8qxdJL639JVAzj
         X2AfU+r0x9SWsxlham7SxoVlExVuCoOh0rTEOa3VEFdMQL7kS7WaFSM1hq59eF5dwMqp
         iLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCwfNWL7UcYDB2Dq+mmue0+8MPtgEhYVpIx7xNcCp5Y=;
        b=IZjfI7F325wBWjDC/szO2MgFhNiJj2bDaOXOzD2PoQmcRJIgsfFp4h9GTJ0sThgZqn
         ojPBEBNRYmWIBybN9UZE6G7l0mqPxCxJiDhPNwSOE7AyGeMAeawxIWf9/IFxn2/mTQs7
         hxnwkiv919RHf14th5Tk0atkCCuxXcpLzDkuqRIQBpiOfWbzommt+qFkRxn7FZtYlSKd
         0AokR8b9LaFKWmE1/NTWuTGUOX+xVGtH1GlTAzyedY8fWkHcAtUaMxXKNf5GWV2fo27/
         Tqrv51V4x/L/AJpp/r91uivdpis1+tkGhOh2HYazSSrNUjZ5k6X28oWcU33i78QRLEF8
         DSww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+cR5590;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si5108596ejr.234.2019.09.23.07.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 07:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+cR5590;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCPQt-00085j-SJ
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 10:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPQV-00082C-MN
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPQU-0002WA-Bj
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:34:55 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCPQU-0002VN-6a
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:34:54 -0400
Received: by mail-ot1-x344.google.com with SMTP id g13so12277419otp.8
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCwfNWL7UcYDB2Dq+mmue0+8MPtgEhYVpIx7xNcCp5Y=;
 b=j+cR5590GUzaDHfDhu4SZ3KPBQb8VIS411ScmP+uO2pWl5sS9q1a51XmHUtoKAxi9Z
 rCLb2F2X7XUbdnIHk/Qrc58HwXb787oicTFGeruwtqVjsjLtSS4pWwnpnz0UJbC1REMR
 i7kVWVFMASIuxHskWEKU5Zjkr/cdlVXxDm4mbr1aJ50ZpOkj/VN6PfELCvNxtX4vL7kQ
 qdfHZ2a7LwX8XsV5gQwN/yeWviiAZFR18TsLzjPZDafwLi5tCYEg7WnXAgfC7447Ko4i
 yX7YUr7Nbph7KISKwPJTvBAfwaZtb4wbxs5/sNQg64k9MVn+oOjX/QjCd4Qe4cobwtvb
 sghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCwfNWL7UcYDB2Dq+mmue0+8MPtgEhYVpIx7xNcCp5Y=;
 b=Am7qRmX7Ohu0OX0ju6HYx6kRv4MPO2E7kRD29cWCOazokl4dQWMwMydWwzFAlMSle0
 xP4J3HHIMSRuXHK1oaIjsytiZLgGVAS1xZtk20ucldn6MxJWxGXkYDhzmuYHXumj10Js
 ta6Gb4rJeknD438x6ede1cB6qsGvq1BwtNc6o9zKEIAJ0LvAUwOwVQrHOW6pyPIoi9yP
 CzhzTnxsdHLDRMs3TuFLP7lMlJ3W6bdFI2vh8lokZW49fQGOXHy/4R8mK52Hgul6S45Y
 8GXMP2/pXwocweEsRWUb7xksa8eBRjciTT6oo2bIo30FOSIcGwNsJjjFZeGwl3o0TUeS
 okBw==
X-Gm-Message-State: APjAAAVWqIyX1AZtpfJLIsWWbktK9x5fjd5jVjF1gxQhy2/o2ugPyUTW
 ITGpwNWHlq7IDWdv17ZTmnVoyiDebpn66oWwDkrCqA==
X-Received: by 2002:a9d:562:: with SMTP id 89mr112556otw.232.1569249293223;
 Mon, 23 Sep 2019 07:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
In-Reply-To: <20190921150420.30743-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 15:34:42 +0100
Message-ID: <CAFEAcA9KbQF071ZWXm4Y2GcoxfksKLTH8OvcUJqkfY79_oNnMA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sit9A0bvK/of

On Sat, 21 Sep 2019 at 16:04, Thomas Huth <thuth@redhat.com> wrote:
>
> We are going to make CONFIG_ARM_V7M optional, so the related cortex-m
> CPUs should only be created if the switch is enabled. This can best
> be done if the code resides in a separate file, thus move the related
> functions to a new file v7m.c which only gets compiled if CONFIG_ARM_V7M
> is enabled.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/arm/Makefile.objs |   1 +
>  target/arm/cpu.c         | 146 -----------------------------
>  target/arm/v7m.c         | 193 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 194 insertions(+), 146 deletions(-)
>  create mode 100644 target/arm/v7m.c

Calling the new file something with 'cpu' in it would help
to convey that it does the same kinds of things as
cpu.c and cpu64.c. Maybe cpu-m.c or cpu-v7m.c ?

thanks
-- PMM
