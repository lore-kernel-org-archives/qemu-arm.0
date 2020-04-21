Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4876520lfm;
        Tue, 21 Apr 2020 02:34:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJayI4LDFA6EaJBPoG+dcXgKCANSD8WsyUcb+syqczjjz5O3OiYI00Ucf4Iuoy8UVt4OgDQ
X-Received: by 2002:a05:6214:15d1:: with SMTP id p17mr19734528qvz.45.1587461675651;
        Tue, 21 Apr 2020 02:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587461675; cv=none;
        d=google.com; s=arc-20160816;
        b=lPb37oaL2yjinKev8TJSH88vQDhRHdPdrAe6urD1l6Baw6JROVR2IgTDkIXfZniaXD
         oPrPWjXtjPooSrccddkWFkvBZF9MhlskWdZGuE59gux8tEl7NxEsX/nP/pr/stlP5/ts
         KniFVw5yYnuK6N69Xn+eD47HyAtGkv+obtuQEOdLnEXLfKhJLZ9m/S9NwYUY+QkzNxt8
         kr+tNEKLG2Kxrk9d3UO+6XI3vE09ki05y6fnt8wZPSbw/SukhMX5jzeZv9+IefK4puGQ
         G6TMX4dyuuDfU5lqtxf1YQs5xQs2IsQJdRGnVWLFZzpoS9ZNGyYY/H6ov1PcoEkVhtrV
         3nCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=s/zAJIUxNrxYoJ0x/HJnhpypVh0XlsT3XQ8awieQzBc=;
        b=Z4qVBuJKtmNs1j/rNL9xpXJIxCDIQb7fvs/Dh3AQIGO5c55Ohx9iry+UNREuJV+JrB
         Jjh3VSwaQcKetOs3y6zIeNtWnytAkTo6hIerqKOVkNsnZVhMgTeIczzqq/ryyVjv75qZ
         XiPgmEJZAcMkw61g0qkwd0RXGfgKW3aGoxTEy8Oqne7xwIEeG4nRQaJOHi8SgJWoSLIY
         cG0JG9HgMZw9PS+NwEAD9woMKpTw+DnVAP1QhWWfCx6ttlmr/p6bm3i1OAJ4K0LRHN7L
         ywf3dubLwY5bXRclxqLDtefhtFODidNKk00OUrQ/o7EWt1Tm+SQV1Hhbirl6T1wWbncl
         8GUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a0qmtK6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v196si1246428qka.363.2020.04.21.02.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 02:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a0qmtK6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQpIY-0002ev-3I
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 05:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQpIQ-0002eC-A5
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 05:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQpIP-0008I9-2W
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 05:34:25 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQpIO-0008Eg-HA
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 05:34:24 -0400
Received: by mail-oi1-x241.google.com with SMTP id r66so11497216oie.5
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s/zAJIUxNrxYoJ0x/HJnhpypVh0XlsT3XQ8awieQzBc=;
 b=a0qmtK6grY2WkffuCofTeWpSL4BkmZmOoMpHNBvQ9+z+xUEX3pruCyioFzbdKUUkfD
 3RRBN2WYNfAxRmH8sIC9TMPXxWSupEyD+Vi6fEb75Mu2+kjByVAhh3wGbriCZhHFTSmI
 VKpw2P+4/zcbyVEKtwXsXeV2jdVps/7HLZbrbvDY4FZndQSQmmJoKYKKo+bFCoSPZJGx
 iN3rpGZ5T3H4LGYD9QMTvieFhWZptcdGLCBiDBifzR4IMVlcO2jgLRQON2DXcQpJHXWe
 +7MhUGqXzbLLsfWSC/xgNBmC66W4a4MjFs5Va78sKhf/G50s8TEnZj6FUr4PZwTccKab
 eaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s/zAJIUxNrxYoJ0x/HJnhpypVh0XlsT3XQ8awieQzBc=;
 b=UqLdlnGb9/DcJa9o+Vs6Bt0yDPkskiXIINfRMkQ2IKGFuUGHLlMgS1RxqaGsEFrBA8
 d54cIKlA8afoWS7/ADggRPr5SywAYgZxTsXAfHVNaFJFlDxA0ekOC6hczj3MTp+axkLm
 UwHHGxmXiCQZhZWuq68pB0IiIavzij1IMdXt+fI/Osqg3+S4rNh0ofM0swRKYXhASzlk
 zFnjkHs6bVJUD/5mxz06hx3HwgTLR6nqB+9VkEeFp8xavmD+3QGF75DUVuLurDfa8ZDQ
 gYZzFJ7+1zzLtKwNG85iYKRQ9JJixffkGba6vJ78xFsM3xKmCF9S3Yygnr0lWg35z5S+
 Ps5Q==
X-Gm-Message-State: AGi0PuZQsubudWKRD8UXqup0lWjjrbDRNIxhT/Iq2mRwcFTz3olF8Ii0
 YODRvIznwWGfkyRRhny2bKecR2EfGGjg9GyuS4nvjg==
X-Received: by 2002:aca:dc56:: with SMTP id t83mr2390084oig.48.1587461662996; 
 Tue, 21 Apr 2020 02:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-4-peter.maydell@linaro.org>
 <CAHiYmc6zqMve7J2nMqRD=nZXLMaVN+8kYB7_LtAf_4BNYu+Wug@mail.gmail.com>
In-Reply-To: <CAHiYmc6zqMve7J2nMqRD=nZXLMaVN+8kYB7_LtAf_4BNYu+Wug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 10:34:11 +0100
Message-ID: <CAFEAcA_OdxjcFc_mpCdoiP9G=mJhpnJ7te=VCHiHpRmb-O78Ng@mail.gmail.com>
Subject: Re: [PATCH 3/4] linux-user/arm: Handle invalid arm-specific syscalls
 correctly
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: omerg681@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+y/3byrQZqF

On Tue, 21 Apr 2020 at 10:32, Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
> =D0=BF=D0=BE=D0=BD, 20. =D0=B0=D0=BF=D1=80 2020. =D1=83 23:25 Peter Mayde=
ll <peter.maydell@linaro.org> =D1=98=D0=B5
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >
> > The kernel has different handling for syscalls with invalid
> > numbers that are in the "arm-specific" range 0x9f0000 and up:
> >  * 0x9f0000..0x9f07ff return -ENOSYS if not implemented
> >  * other out of range syscalls cause a SIGILL
> > (see the kernel's arch/arm/kernel/traps.c:arm_syscall())
> >
> > Implement this distinction. (Note that our code doesn't look
> > quite like the kernel's, because we have removed the
> > 0x900000 prefix by this point, whereas the kernel retains
> > it in arm_syscall().)
> >
>
> Hmm, I suspect other targets could have a similar problem.
>
> I am definitely going to take a look at the mips target, but did
> you Peter have a chance to take a more global look whether
> this problem is actually widespread?

My guess is that this is Arm-specific, because both the OABI-vs-EABI
"do we pass the syscall number in the insn immediate field or
via a register" changeover and also the oddball "arm-specific
handful of syscalls in a distinct range" are Arm hacks, not
something the kernel deals with in generic code.

thanks
-- PMM
