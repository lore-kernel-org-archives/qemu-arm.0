Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp722360lfm;
        Fri, 1 May 2020 07:25:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJEOcw7CXLr0JbHKzuVOkQMWtP3hah63OqQb4KCu+LSnxiDYrRgF3CXIr5V7RzoFD6HI/VZ
X-Received: by 2002:ac8:38eb:: with SMTP id g40mr4037121qtc.386.1588343117189;
        Fri, 01 May 2020 07:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588343117; cv=none;
        d=google.com; s=arc-20160816;
        b=vqnQwtwniuGdDlr58WPHKx+SWex8gJuPCTJzoat1bJvHvJUJlcEr666qTj2jNRW5DQ
         eKPCUY2PLaB6hCV/NVy+j84BQpG2WlpMMuHIt8RLbMUw8zEAMLUrbXPgzp9RffRh1Vc4
         8Ya+H5jpibOa48tPp1XN5OwNLqzVABfQGeh+y6VP9CmK7wOWUcA3ctl1PYNqWpTCn5ee
         y/g8ehgs6bxEud4oZXAYhJsS40X4GGhJJ/TJf4Z2GsWZIZjNJ8JmmqxFmZDJfNUn3H4f
         88p66KEuFxwaRQRq9aRO7L9FoXWQFc46X76kyGFHJtXwPevAWkDhG8G97qaY7unFYN73
         ccxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kthQaBAqwyqn4UX9Xg4B95+4pb5naLZASIAFDxXig8o=;
        b=uBxBoEOcb4c9hNqWPVaWPNLUOr0eOUtrekEgc92UILOWX13LvTG8XQAlhb+rXr+3Ze
         riRRL6RznP9YOlxh7ZELksUE2y4PIoy2oJYbAhH3n+PjftA+kNcpGMTiRu6v0h+5kxmv
         7xT+06eKHeRw4TW5sutmOPBx8frwCM9mSrGVdFzXgN8yo3jarod3SX1TQkb930osZJ00
         v0ngZT1Y7bBc1919UOBQm9pb1NcY9vLgYmEx1FrPkiX26+nWhgKaCgrz+9EbQRK+F00s
         B3V51H87FUDbMttnIQwmk3jMwUcE3GXWl3h6FiJEy1KbYyO/HQR9U+i74ggoO5/XO3fY
         2Z2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYZIB20K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p55si1827550qtk.60.2020.05.01.07.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 07:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYZIB20K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUWbM-0003nr-Gf
	for alex.bennee@linaro.org; Fri, 01 May 2020 10:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUWb4-0003lU-5L
 for qemu-arm@nongnu.org; Fri, 01 May 2020 10:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUWZv-00088Q-N2
 for qemu-arm@nongnu.org; Fri, 01 May 2020 10:24:57 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUWZv-00085c-A5
 for qemu-arm@nongnu.org; Fri, 01 May 2020 10:23:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id m18so2642837otq.9
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kthQaBAqwyqn4UX9Xg4B95+4pb5naLZASIAFDxXig8o=;
 b=yYZIB20KtdDL/dhOnYyBRoSAutM1jX4gUZ36g3IqyCUPKnoyeuooNPSfu+Gtu3kqtK
 sSeo9WmoP90F2R3bkK2/AyCeSQj/PYO9wYCLba54TPp34fbGVZTNUDNfMca2njHLqWgS
 BBCs85KkqjqbcmgwytzCDckzN29rKZxu7/ukS8ZR254w1BHaixjkI0gZAz7c7vtGFRkU
 jQ2NL5MbUTYqMiVcy9+3idRO5Vy6YZKcoUzhY9Uczss6TGeMOTFZHrj4s2YOwVqlYC4L
 VsnNBD9TCfTS7DHT71UWjBKcRs+Kcc99nqhsNPHyNa5s5QFUwJuk4CtHsqsg4TLirVXg
 b3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kthQaBAqwyqn4UX9Xg4B95+4pb5naLZASIAFDxXig8o=;
 b=Gt366+fPG40Az715pI6BHJ7tnOcsh1DjqX2XT/21zvgoVBSwcCUOpf7c6OudzXZrqL
 LFIm+z//WIehwXirBLfCOYtQK589FBXn1xXZXt1lZkW85XVhMXMON9jSokHyJdtB1jwa
 1+ljasuq6Rv6TVb+7wtsI3E/QCfpq2YBOwntZP0exfQgAfhljeNHq3fX4XYYbRhl3bg/
 jA7XmhSfDel399gxk4SrDPiRIoKnpkatJdQ70ZENuMe+P0L/+exOXhIKgduzLnULuR75
 ayrQcJ1aucJ3mWCZKvY2gQvWQPqiqadDRvq04cierBkHFsIbFKf4mRj5iUAp8zh7YFPR
 r5Bg==
X-Gm-Message-State: AGi0PuZK8/lIooy7isDwc2WN9ZMEH+AxB4skEOC1eoCxSigjLrpSzr21
 WMc3A1gSB0UmHezQyQopRuLQYq/+b9WkiRwLOG5Y3w==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr3585617otc.221.1588343026033; 
 Fri, 01 May 2020 07:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-21-peter.maydell@linaro.org>
 <7c8d148d-8980-ad8b-da32-008a0e6f81be@linaro.org>
In-Reply-To: <7c8d148d-8980-ad8b-da32-008a0e6f81be@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 15:23:35 +0100
Message-ID: <CAFEAcA_7fxa2WtwNgAMC1jGf030sQ_wX=s9_Oj=t=QqW232vfg@mail.gmail.com>
Subject: Re: [PATCH 20/36] target/arm: Convert Neon 3-reg-same
 VQRDMLAH/VQRDMLSH to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pe67WQCKw9/w

On Thu, 30 Apr 2020 at 21:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/30/20 11:09 AM, Peter Maydell wrote:
> > These don't use do_3same() because they want to
> > operate on VFP double registers, whose offsets are different from the
> > neon_reg_offset() calculations do_3same does.
>
> Actually, no, it's an around the bush way of computing the same register offset.

So it is. I could have sworn I'd written this using
do_3same first time around and found it didn't work,
but maybe I'm misremembering a change I had to make to
some other patch.

thanks
-- PMM
