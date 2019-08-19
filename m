Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2647366wrs;
        Mon, 19 Aug 2019 06:19:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMDXHDn5mq4h4PLgSnZhRXq3piXylWHjrM4STmpcOKYGQZwqNAqYN5zkJNIac+z7s0a1F1
X-Received: by 2002:a17:906:3d8:: with SMTP id c24mr21093461eja.105.1566220756834;
        Mon, 19 Aug 2019 06:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566220756; cv=none;
        d=google.com; s=arc-20160816;
        b=qNXlzkKumaNHGLgDwtgqtMMPIp5tvybByxU2svMq4dFXaxw0NL8HDQH+AbrXhpgGFW
         dntM/8QBr9qDWevYUAyiSc3R70eCBYxylJ+Q3jpGouJm3jll1CehkJxz+a6y6c67ZSyh
         vEo2QMbuhRZbd0xnq+nB5fJZxupagwzFn271j3m6WFbcujt4fch4BzPexvQb4ZpWflPu
         yVLN/CyKCr9xuvx5c71Zufu8rX6zY+yNWlGUbG0tsknlYeYu0TIXH6ifrma78YS0k+jJ
         BEhqSCCtfks5btTpOG1ojtbmtT9wMq+BBPJ5/BrdUdZlpdavhM7O8RqQnltzlZHgOP6a
         q7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVweLXtZ+wSXU5GcqQegNDhfZ1nPcypw8IAPu4OvJ+c=;
        b=tNqLJvah9Qynsrq/kTn1jkzKk4BxnPWgi3EuEaB8o1xPdidjaT2tsXMvRw842BrwZB
         b/JQz2QsiFSF9TqXK3t21ntM95a4gRlcHOqmvmso+qns50HeHSjuEo4hQ6jiUxlxE13/
         YJK91bEZmo3uXKZlrKGEoyNq3S1ZDk+1TlmCsEZWGBpHjlWpt13567gGG/LmkPNGW5ti
         Y+GyrM4gmciDrJid2LQ4FUlPGumFGCCaZQgVgxTgFH7WxBcyPoUyCmZfP2pMHT48ZDT6
         K30VOUbRsijekRO/aO2noHhO5oE4ZAzgxkO0XfybkaKhpwnI725MzSqZgNvATpVrIw/9
         z+2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UmBreZ8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si5722646edc.65.2019.08.19.06.19.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 06:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UmBreZ8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzhZ5-0005ST-Ut
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 09:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hzh1m-0005aq-Od
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hzh1l-0003n6-AK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:50 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hzh1l-0003mT-16
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:44:49 -0400
Received: by mail-ot1-x341.google.com with SMTP id e12so1495992otp.10
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eVweLXtZ+wSXU5GcqQegNDhfZ1nPcypw8IAPu4OvJ+c=;
 b=UmBreZ8Zhi+mbXoBKu4ueSTZJOvMFd4Zso0r1uo9XAO8lvMn1PQq1WAbG2DmpyFzs3
 Il+jMu4Et5vLc+0cdyZizvjdt+ZIIWb6eWL7eYzMDm+kKVp9MV7QOLgGbkCHJnFfLDur
 8g9cME0g//EbahgK1+ASCGP+YJ9IeAVCoephOW3qdc4bSYF3zP1h47hSUIk5DSxZcMtb
 ErT8G/MykDKA/TdBW0mxYtj0XdNrSvRKLGgq/70eI/fbBnmYKl1bUuxtKbWZs0OeFTs7
 YNDVPVwwVrobljTOhz27Jd7i9hfT55zl4Hqg5yf9dgkugtQDYlIqGfda4OIDQDOKVXuI
 ztOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eVweLXtZ+wSXU5GcqQegNDhfZ1nPcypw8IAPu4OvJ+c=;
 b=HLM+2wIvPPWqp5QQmogRyxiLOkcMcUoYnSYODaJkfZWrM6SKVmEjN5daR4pv0HPvh+
 8M9nHhdt9uNDdXMItp0F01f141aw8rfT+RVStpOdZgEOUyaOG3uDn4n7+aKwcf5Jxnuy
 zXWaGTZ3d8HEJPD1nUl4Xys2Zl4VomzHfV64L2+q5oqcj+XTrPr2Tot0bBtKldLUKSNQ
 mDBTBOdm1LU9Pp6agWn3tMfC8D0KLkRGrXjvOQKaJJsY9wuoqBlxXH/XuTUME+pfOK48
 0gCqzMlkE4EifaLune8CAg3DWs+Hr/i92sF5u/k7Hgfm4Uaz4cvFI3iLhuLTRG5Wvkw0
 mr8Q==
X-Gm-Message-State: APjAAAW5ps2wp4NRQrc8hIde795Z6qz6DPmTf1imJVKVtBKGFc6gRPJ4
 s+MenbVPNJKoPVgP5HvXAeu4DbwBVxaaf630G3JvknBi
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr18694147oti.91.1566218687905; 
 Mon, 19 Aug 2019 05:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190816125802.25877-1-peter.maydell@linaro.org>
In-Reply-To: <20190816125802.25877-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2019 13:44:37 +0100
Message-ID: <CAFEAcA-7Lr0nUD3g=C7S1Obgaa0E0p794XLhuBZRW_+fC5YjcQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, 
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 0/2] target/arm: Take exceptions on ATS
 instructions
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k/0j9hbEJU7a

On Fri, 16 Aug 2019 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The translation table walk for an ATS instruction can result in
> various faults.  In general these are just reported back via the
> PAR_EL1 fault status fields, but in some cases the architecture
> requires that the fault is turned into an exception:
>  * synchronous stage 2 faults of any kind during AT S1E0* and
>    AT S1E1* instructions executed from NS EL1 fault to EL2 or EL3
>  * synchronous external aborts are taken as Data Abort exceptions
>
> (This is documented in the v8A Arm ARM DDI0487A.e D5.2.11 and G5.13.4.)
>
> I noticed this by code inspection back last year sometime when
> I was investigating a guest boot failure that turned out to be
> due to an entirely different cause. I got about halfway through
> trying to code up a fix before I realised it was irrelevant to
> that bug. This patchset is just tidying up and completing that
> work so it doesn't get lost.
>
> Use of ATS insns in the cases where they might actually fault
> is quite rare (obviously nobody sets up page tables where there's
> no memory and they'll take external aborts, and even for the
> "take a hyp trap for a stage 2 fault" case you need a setup
> with a hypervisor and a guest that uses ATS insns, and Linux as
> a guest doesn't use ATS at all. So my testing of this patchset
> has been more "check it doesn't break things" rather than
> actively finding and testing a use of the throw-an-exception path...

I'm told that Xen for Arm makes more active use of ATS
instructions, so I've cc'd a few Xen people -- do any
of you have handy testing setups to try running Xen in
emulation under QEMU? Configs where the guest (EL1) actually
uses ATS instructions are the particularly interesting point
for this patchset.

(if there's a good set of instructions for creating a test
image I could probably add it to the ad-hoc set of things
I sometimes test with.)

> Peter Maydell (2):
>   target/arm: Allow ARMCPRegInfo read/write functions to throw
>     exceptions
>   target/arm: Take exceptions on ATS instructions when needed
>
>  target/arm/cpu.h           |   6 ++-
>  target/arm/helper.c        | 107 +++++++++++++++++++++++++++++++------
>  target/arm/translate-a64.c |   6 +++
>  target/arm/translate.c     |   7 +++
>  4 files changed, 110 insertions(+), 16 deletions(-)

thanks
-- PMM
