Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6263451lfp;
        Wed, 12 Feb 2020 03:35:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKIFd/NajKSl2wyCjXpjDH9pV0acte2s3Qmx3GtA0jI121sQJXac0rXDHLB/kYJG1T1z2n
X-Received: by 2002:ae9:ed88:: with SMTP id c130mr585917qkg.299.1581507346669;
        Wed, 12 Feb 2020 03:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581507346; cv=none;
        d=google.com; s=arc-20160816;
        b=vCrl9HgPVwg79Hwq6hhyRuKI+fOUOoXDULKjCTlnAMq0aNi5vhW4Y3m0jMdhgCAbqW
         vJXZe7wgR62YW19y6E8ls8WCwbqPmdT/j+5BnxmM8b7MCiswmSUg0JrcWRRXFq9J1Ha0
         aCHTwFcUXIs1YP5g2RHGJLF9c5OMy0uJ13V6+rbMTawnshesS7nP9Gx/TDMhmh8a98dl
         TtiR0b7Z/YGKkqyKZLNBuuw71VDK1Ckea3hnGbN75N0e99l3u4pOhffaGGGXm84UVEiZ
         QfENupua7Tx/MzrkApUAPf+tnhXMvFwdRYUBogNKO60CKtYYXVMQO1iS6clPw1zkp9jm
         bHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXjD8EyEhHZYAbdaSuBNtwAxsP8oXh4ihx4v8XWc8ZY=;
        b=aHjf8QgA+4Pm4snzm6zu9egMb2vfSjADASdGw8E/qTjepBLzXf76nCS6tzux3Rpwm5
         l5J684wSkw5Ws0f8WMo3QGYroaFOptCdmbyT9tjM5hyJ0sBdbSkBJiFl8k5E+PyV3IlR
         cSCFGHyx5vyq40YV8YROfBajVaTPQZK7NMyx3Q5kAlnkUMBFHGlSzGEOIVU8sB6ZhVGu
         Eqg2vIMGOHn06LYDKsexx12JW9TwgVrOAZcxu9kJRdkaciSLP7XKS+EikJglfEUzPdFo
         SOmQFeoO53by0lWH4RSPytPy6chIjPF2ALx9/I6ZT2dFSJFTbb01JSK2o656mUlzweVY
         v++g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sAvJrwfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si100953qvs.223.2020.02.12.03.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 03:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sAvJrwfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1qJ0-0003jV-4O
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 06:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qI6-0003FN-72
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:34:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qI5-000378-6P
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:34:50 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1qI5-00036f-1u
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:34:49 -0500
Received: by mail-ot1-x344.google.com with SMTP id z9so1569557oth.5
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXjD8EyEhHZYAbdaSuBNtwAxsP8oXh4ihx4v8XWc8ZY=;
 b=sAvJrwfYEQf6wxKXNTL9s89ja4IuxpoThZM75cx8exaqi8S2ixZoM8SrzI4MG0Uusn
 Lg5r5q0u+eiYLX0XNiDZMiINSpOo/77F0NuU7IW8EFjZvODFOA7AyLzSvj80bEjxqe2R
 jyy+bwqf9QLH39hqTLJu4z7uWlr3Ws6h0Wh1IRRfiXl1X7uATyrWGCiaVii5jjwghNH/
 BpFfQybckDCLZCL/i1rmyOxZYXVGvflrC7FICxZ1nRoZv2oxJQfmUfV/PKNQdbLcptqh
 7k8Pv/426ak805nJTPeuKRKxniMt+hkofPr4eJai81jHfSmPlxlOsgQBBrMxp6i7z04R
 l06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXjD8EyEhHZYAbdaSuBNtwAxsP8oXh4ihx4v8XWc8ZY=;
 b=H1HnynCIOa7/YJF8xooG4wtL5J3zRlyOqSzVU7r8VxW9W9KYny68yX+uDrRaFno/z4
 WuV5RDzYWEFzMqFBObbLhZhP7bsKcAE65rXLqja1xAXY69JR/BLo5XyfyuhzFIVPkb1r
 hZbq4tKgVygeBO5t5LTKWA1DmCA32d5d/+4MSE8pd3E3a7mIX5OhQrWIrwRlh4yJFPrt
 tsGE0GpA8d+JCooYR0DEFnJ/AfJCLBcL/TQs7uZ3xWiFf9sxVeo9lGj95O9ND4wnj64R
 wyU1kElY3Bsj35PCHqXIMKpPIiaF4rycPuw/95wthsSUb70z2WmaIHzMbxUC5sTNJQyI
 FD5Q==
X-Gm-Message-State: APjAAAVgezZWWVEXb04I3LBPG108bKkjKjIGS8MnOMkWaN4ccqGEB+59
 QgEkEQUV5REEq+1WyikYflw2bQHsAX1xhDexLyEUsg==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr8447382otq.221.1581507288260; 
 Wed, 12 Feb 2020 03:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205110541.37811-2-gshan@redhat.com>
 <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
In-Reply-To: <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Feb 2020 11:34:37 +0000
Message-ID: <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
To: Gavin Shan <gshan@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gGWTYGNzRSaz

On Wed, 12 Feb 2020 at 06:39, Gavin Shan <gshan@redhat.com> wrote:
>
> On 2/5/20 10:05 PM, Gavin Shan wrote:
> > This allows to inject SError interrupt, which will be used on receiving
> > QMP/HMP "nmi" command in next patch.
> >
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> >   target/arm/cpu.c    | 11 +++++++++++
> >   target/arm/cpu.h    | 12 +++++++++---
> >   target/arm/helper.c |  4 ++++
> >   3 files changed, 24 insertions(+), 3 deletions(-)
> >
>
> Hi Peter, could you please take a look when you get a chance? I'm not sure
> the implementation is good enough to inject SError. If there are somebody
> else who can help to review, please let me know so that I can copy her/him
> either.

Yeah, this is on my list to look at; Richard Henderson also could
have a look at it. From a quick scan I suspect you may be missing
handling for AArch32.

thanks
-- PMM
