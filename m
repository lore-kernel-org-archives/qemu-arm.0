Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1806932lfg;
        Fri, 21 Feb 2020 05:29:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtj2XQdLzO3JdUuf/tyYJHQeS+3w1lO2QwoeJDYqExu8U0U74pkpcVkEPWbenSNNtwx8lm
X-Received: by 2002:a37:9f52:: with SMTP id i79mr30884609qke.48.1582291785017;
        Fri, 21 Feb 2020 05:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582291785; cv=none;
        d=google.com; s=arc-20160816;
        b=pVRrsOjl4OJ2O1E9sUuI3ZmMWAnzbeMGd9tXNmLL0EdU1vYNvmIwlsccMfrJJuh+Oq
         IGD8c/MkWZg8HRvlfOICuAsz75+0i2xpeiHS13i5FtcUjS7/g7ZSe+qIUTz5ui5da4kg
         /W81nwijV/CiT5YW3wPfF/ZFBfi/dZzyHObWbCMrVRLE2glljhwtP9fuuJr3A64u2a39
         8O24/ma2lX0D1GfogaoSjJcXUoWLkipW+L2bXLAOCEd+JnU5plb8Jg723bTycS3AaPFC
         bAYWSdHZDcNn2QVVezIrWqa8ye2u03QKvrSQm/MJvNmjwTySqjWQFQxxuS1z9TykZxUs
         FBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=On/y4Ni6hDUH6QdbysM8XhDtZCPZbP4+dWO0WVvmVZU=;
        b=VPT80irtfulZk0rnAJ3kbtB+p8KnGngNtZ2BTULGAwiuu7688rFqJZGE52AX9EnQd8
         NpQxhrXVBZUJMljflVerBcbxTa63ZiDbAN6zWuY9S02LhHB3/VTaltwdXsS3CccuetcF
         PuDzD43F7lXbQZTUQUDOAaH7xjS02r57EfYom66nY+QXe6FJ2THxSWkx9R/+VmjbWfNU
         5m8/6KBSOgpR5q/HlKMrZgijibn1p7y6cBLexHRKA9sh/0CJs4AUTbi6/rKI8F34a6Fy
         kz5LuE+dYr9xCXuaD2LYptXT9rgFq9h7RSbXUKUvuLAd7QOKQT2R81k5dIOejHisck8/
         sfNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdAI8GV2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si1363841qtd.214.2020.02.21.05.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 05:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdAI8GV2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57683 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j58NE-00071x-Dw
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 08:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j588q-0002al-OH
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:14:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j588p-0007uK-IU
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:14:52 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j588p-0007tg-EP
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:14:51 -0500
Received: by mail-ot1-x344.google.com with SMTP id w6so1962684otk.0
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=On/y4Ni6hDUH6QdbysM8XhDtZCPZbP4+dWO0WVvmVZU=;
 b=HdAI8GV2ZU6ImLjGzrXBCLHfD7odIidLKhFVIHUyBLCGppmxn0HKZVkFR0P0/WDhVm
 9tYoZY+1zV3/TQPQjAgrREcvqgcnU+OtvWJN28R+ycEnX+b+yYWp829UgYmgzSJSNMhA
 8wHWTP5Pc653yzA8wy+Bvn3ZB8toJEpi3wmmBmMbSoBvGPVjCutn4h/mkOko6i41oV1I
 AQ4iTmLhX0Eq28FElgs2qyDhnvHXVpOfGWlomuYBCpTY5yum2oysAZdygU7tQ4RBR82i
 9ry5cGf/0k2kc6FuaXrQfriFvJyi+hTFy27YSSyCfZlzr8XVzEiMbHFNyewOawgRknS4
 iyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=On/y4Ni6hDUH6QdbysM8XhDtZCPZbP4+dWO0WVvmVZU=;
 b=g/RRTnrQGV/VGMZYMBuehKUN3UDEJDywTCClq2PZQrIAjCNZzgM0by2ksPW94qtzmC
 b3PlBKKpM3T/Lt2+z3tG9ZUsPrp7aD/CuJYwSLidoNb+xPn1tonMEOm/r8oarlpEr4yz
 Y1saw6SlADYp28Fmt3aC640cDeoHqOgyq/PtutLX9No1wUmkMRCCB4pMiqkTBDPyjdNj
 Nl4tw+fSjxuA08Jm8/f7REX7EzIrbZ3SDQ4MfMU6tEDOpOnAWB4IAJbBxu+UGaQy4G92
 mIZ8x9x62Xda9LXCTKOso2CVCvBNQWVN1yeasy8Agg9i3qe1k838bJKDRJFUfGQaKT0B
 c4Jg==
X-Gm-Message-State: APjAAAXYi32GhxHbQcs01herG9uVzlosyph7BNINAd/iEYaTOtUR1iED
 uyz/ziveneEhAVipVCeYTrLbiw9YvdLD3XMAiThzGA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr26308855otq.97.1582290890152; 
 Fri, 21 Feb 2020 05:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
 <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
In-Reply-To: <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 13:14:38 +0000
Message-ID: <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1auioEDSMgCe

On Fri, 21 Feb 2020 at 13:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 21/02/20 13:44, Peter Maydell wrote:
> > On Fri, 21 Feb 2020 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 21/02/20 11:21, Peter Maydell wrote:
> >>> Before you do that, I would suggest investigating:
> >>>  * is this a problem we've already had on x86 and that there is a
> >>>    standard solution for
> >> Disconnected sockets always lose data (see tcp_chr_write in
> >> chardev/char-socket.c).
> >>
> >> For connected sockets, 8250 does at most 4 retries (each retry is
> >> triggered by POLLOUT|POLLHUP).  After these four retries the output
> >> chardev is considered broken, just like in Gavin's patch, and only a
> >> reset will restart the output.
> >>
> >>>  * should this be applicable to more than just the socket chardev?
> >>>    What's special about the socket chardev?
> >>
> >> For 8250 there's no difference between socket and everything else.
> >
> > Interesting, I didn't know our 8250 emulation had this
> > retry-and-drop-data logic. Is it feasible to put it into
> > the chardev layer instead, so that every serial device
> > can get it without having to manually implement it?
>
> Yes, it should be possible.  But I must say I'm not sure why it exists
> at all.  Maybe it should be dropped instead.  Instead, we should make
> sure that after POLLHUP (the socket is disconnected) data is dropped.

The initial case reported by Gavin in this thread is
"-serial tcp:127.0.0.1:50900" with the other end being a program which
listens on TCP port 50900 and then sleeps without accepting any incoming
connections, which blocks the serial port output and effectively blocks
the guest bootup. If you want to insulate the guest from badly
behaved consumers like that (or the related consumer who accepts
the connection and then just doesn't read data from it) you probably
need to deal with more than just POLLHUP. But I'm not sure how much
we should care about these cases as opposed to just telling users
not to do that...

thanks
-- PMM
