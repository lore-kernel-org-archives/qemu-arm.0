Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp340489lfi;
        Mon, 18 Nov 2019 09:26:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbrZurO1ASbeNv5oypFPT0rZRcxbXlUy8J14WkPFudKmCQpN1cFrfWJEx2s4meiz7cOcpg
X-Received: by 2002:ac8:4901:: with SMTP id e1mr28028677qtq.280.1574097971063;
        Mon, 18 Nov 2019 09:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574097971; cv=none;
        d=google.com; s=arc-20160816;
        b=jYucfhyNee083u/AN4fqssqc8Qg1zNk98njt7at0+x+NI4cOf5GLhzZA81zymUMeD6
         ZUEOfBmJlDR+NLNEHxkf+tDizNSSf6bXaPa87pad77pyMyELqL+XbkXZSKAiTbE3Z6Yl
         Jbobb8sLcoy1PCnPOU2/PkVsW0tx3BlGwXgwopzNpRB4sEesErEIZj3H98bfuamMV/ET
         jVfcjMO17/ZSRoq32HUXmTT0jhzY2L41//9FGP9waKlUlfhDT/aSBAmpEwlmCuSCXb0F
         MOxIhOBjQssFuhMQ4YWaGZRWBQ/SX+aRfo2xtQp4wWV6T5kGJ6GsbxhD6etKDee3lxA3
         0cZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1vCWTm2yapJPkNp3Lj3hkHA50EH1mQuwW9MQi0cUu1g=;
        b=tE8Nm5fGbp3Xrauk+7uTN2MzWA1oL+espvkWnjIE2MY+R1NJOSwh1c8fGlDwGqEywv
         xp0E0NVUVZkuaWqfkDazvcCXShdaK315zpXTdt2qEWZQqHHZHVy2W6nfIwPbgTMPsGyY
         2oPuuDpPsJnZ2Q9915xvbVRd5Eow1RMvV3HvMUizq4L+NTPGdJW2BSq9aEjpUaLFh5rt
         ojhq2wp+ZzHuF6XdmvUtCQgJ9XtvCwjgLZtS4IWRGZCLDcntFFnHbDVFCkTcsR9rH6MC
         CGtK/iLcqRvMVqS/n2ZzCEqukSi+0BrHLiHro728hVaj9PawZ6LG6NON5xk3bkOn9f9P
         MBHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S9KQjsuh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a127si11906681qkg.356.2019.11.18.09.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 09:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S9KQjsuh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWkmw-0004Xd-I9
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 12:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWklr-0003rc-1z
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:25:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWklp-0005HX-15
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:25:02 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43413)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWklo-0005Fg-QW
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:25:00 -0500
Received: by mail-oi1-x243.google.com with SMTP id l20so16012173oie.10
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1vCWTm2yapJPkNp3Lj3hkHA50EH1mQuwW9MQi0cUu1g=;
 b=S9KQjsuhAaQd4KLmz3NEytTsx8ibMj2MO/0k1tRLjDPRt58elrsUAVvQFWvtWSGD9C
 jEN6A8EyS/lBhAR887fU06botpPAwqhg09QXBsdHlXVpiLhlPMiKlYITRTYiVgn+F9c8
 BfSB7Pl2qOd+46c74AP/ry6jwmmgH9lskbNRFewa2daXHU9hdpfHJT1X6SbmoPxFne+x
 QckO3+SarO6Ehew6J7W/UmLIh1b4ZEaPEgNftHuKBnLFgiDhLb9LT9rxFFSmzDNE6hKK
 HX/9obiA8092J9X8D6Jzunhw1ALWtg4MuK7JOTKcFD+4IW13vL8Xr3RoUfo4qkpzPUYl
 ev6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1vCWTm2yapJPkNp3Lj3hkHA50EH1mQuwW9MQi0cUu1g=;
 b=FZzergyY5zNCor2gUvaBU+SjD0jRRiExGzMebmOfMGpIkR41Qxdg+dZYUoQHoCf7iW
 W9pFuHOUvawmZcR4rzyQxeO+DChTNEJ8mtxgsviy/liWcGUQGz7b3tRHaQZEABYeRaQL
 lEBNnpz6KLiZouFdtIwyL4UiLAHDyDUs6I7FpcXC15gdEST7AccP3u1cB4Wg/qU2BMMi
 +o2OSVQrBEGJkeUx9qgPzYrPM4gIgBBHcD49sg+Q8+6HPaPTviUOf5PVAUkkNdwF1qB2
 WWpNO5Jp86t7QyO2xO1j8pe6TQiNH8aVp/t2yPRxndI9ARJuY/Skg63RDz3LIc5FyAYu
 Fa8Q==
X-Gm-Message-State: APjAAAVMeKP1vcNxdcUkoX6JB5ojLBWq/DmNaIAQxnOWn/B/Mv0IRGcs
 H+r1+N0xzxJ0yIxDregt5CYwIWOZAAp9yxY32Q/3tw==
X-Received: by 2002:aca:a9d4:: with SMTP id s203mr52865oie.146.1574097899013; 
 Mon, 18 Nov 2019 09:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20191104181604.21943-1-linus.ziegert+qemu@holoplot.com>
 <CAKmqyKMWS18ssBUhDgYSnGiFRwCkSJPBRui4Op50Tq_Z-OUakA@mail.gmail.com>
 <CAPm2bJ_mfVepKP9hj-PQBnESsCi6t+9zj-m_KWQYx6m-S5ddAg@mail.gmail.com>
 <3c063300-b107-b17b-3647-8489b856a038@redhat.com>
In-Reply-To: <3c063300-b107-b17b-3647-8489b856a038@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 17:24:47 +0000
Message-ID: <CAFEAcA82V++Xd6SGbKqeinRXe=MxjFKbcx92Ux9umoG-QvOSjg@mail.gmail.com>
Subject: Re: [PATCH] net/cadence_gem: Set PHY autonegotiation restart status
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Linus Ziegert <linus.ziegert+qemu@holoplot.com>,
 Alistair Francis <alistair23@gmail.com>,
 Linus Ziegert <linus.ziegert@holoplot.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Gl1EB1r5/pA

On Mon, 18 Nov 2019 at 17:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 11/5/19 12:31 PM, Linus Ziegert wrote:
> > Am Mo., 4. Nov. 2019 um 23:50 Uhr schrieb Alistair Francis
> > <alistair23@gmail.com <mailto:alistair23@gmail.com>>:
> >  >
> >  > On Mon, Nov 4, 2019 at 2:02 PM <linus.ziegert@holoplot.com
> > <mailto:linus.ziegert@holoplot.com>> wrote:
> >  > >
> >  > > From: Linus Ziegert <linus.ziegert+qemu@holoplot.com
> > <mailto:linus.ziegert%2Bqemu@holoplot.com>>
> >  > >
> >  > > The Linux kernel PHY driver sets AN_RESTART in the BMCR of the
> >  > > PHY when autonegotiation is started.
> >  > > Recently the kernel started to read back the PHY's AN_RESTART
> >  > > bit and now checks whether the autonegotiation is complete and
> >  > > the bit was cleared [1]. Otherwise the link status is down.
> >  > >
> >  > > The emulated PHY needs to clear AN_RESTART immediately to inform
> >  > > the kernel driver about the completion of autonegotiation phase.
> >  > >
> >  > > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dc36757eb9dee
> >  > >
> >  > > Signed-off-by: Linus Ziegert <linus.ziegert+qemu@holoplot.com
> > <mailto:linus.ziegert%2Bqemu@holoplot.com>>
> >  >
> >  > Reviewed-by: Alistair Francis <alistair.francis@wdc.com
> > <mailto:alistair.francis@wdc.com>>
> >
> > I consider this stable material. Applies cleanly to all versions
> > starting from v1.5.0.
>
> Too bad this wasn't Cc'ed to qemu-stable@nongnu.org and missed 4.1.1
> stable release.

I can take it via target-arm since it only affects an arm board.

thanks
-- PMM
