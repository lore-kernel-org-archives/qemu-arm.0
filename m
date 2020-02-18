Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6282198lfp;
        Tue, 18 Feb 2020 08:13:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXzxhWLr72zWg6ce5LX24UXZKNhd4wRdgC6K+e/fBczpllJtz8GZvgtbOiOfhRcSG/kjbh
X-Received: by 2002:ac8:969:: with SMTP id z38mr17496638qth.203.1582042403140;
        Tue, 18 Feb 2020 08:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582042403; cv=none;
        d=google.com; s=arc-20160816;
        b=qVD/Eeg8QMZNFZhUIoCGPpKKzeMzrISOH3w6QJetPHOWAk13ejLJzBPcFiCXnn2pQv
         yrLYrwHAg2EvEweUXOqiERQHFM7hBL//zKVcq3ypOU/DaESTJDBrVmqwWGaPA4PIoAhm
         b4VHStO7eaFqK9UyxY66+YTy6KX0HEGTsu5CIPq6EgHkzty5a2vvTMnGg9MF7ygxi+d7
         dFT0XMVjDhAvwD504G28u0HzqaIBg0jAAQMrx3lzS9dLtLLWwWdbB4363c0+iQ4+79pw
         noCOkcSEXqHnpokRgskOk8ZRPpO8U+O481y5BCt2f/U+Vzk0slv+S58MprItiP7iB/Ox
         P4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vf3esyWUav8tIO7Tt0s+3PzYyqPkFiPqob3OCQ3mGaQ=;
        b=OmXPL0lVpt5feQP06IBxDxigo2v20ZwdkawwG0NECZJ3iUrpZojCXtTSvNmgaPWAfj
         UIZikRwaDBZg0bGXdlLPDg9urfU6+MXstxszVjJ7lvphPrAmcITZflcyP38oqifeG50/
         IoapqoeVisoGBb6IKYF8jX0KvV7EKRl5OefMJ41X5sQnKmZnNCJqp+UfpKXlW5txrJCu
         bdk8XOhQgcr2AYXFzjWQ/kjZ30Eky2nn8kyGR3K7AJo4a7Y4XRNkgta9TOpFvTuw/1zb
         NyMmtv3k/cOT1r8BtxW9cDGLsc/nb5oHEJAIIp7Z1QTV8/LwbR3htj46aWPgFf6V/kc8
         VUtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3yvYCD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s34si1901913qtk.212.2020.02.18.08.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3yvYCD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j45Uw-0000bV-J2
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Uo-0000aZ-N3
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Un-0002h1-Qq
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:13:14 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j45Un-0002gZ-Lx
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:13:13 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so20054929otq.3
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 08:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vf3esyWUav8tIO7Tt0s+3PzYyqPkFiPqob3OCQ3mGaQ=;
 b=b3yvYCD1MKFkWsgOIoWLTRnKQhXGLsm+62jpNj6p0CyNqc7SrQQ1cNjt57fymyxF/B
 WKYcoUooHVE8YB8eynNpcLzNYAqtz/RA3vxxT2wPRNoSLPXH9c+e0Qs/Mc2aVqs9ARej
 tg4wCNLhdrLhNduszUD72JgTMK1hCzEsnKIzEySwaVs+KBxBbovqJPncp1yiicLtyPkn
 t+Y8jRfrlKZkU3vJIxSBpHu4ViZT/6IsUJSoIkwCNYJHr87ca00jy17R+lm+M6wgmyOC
 q6hp44EM1hHOpaZ7txHBXKU6/OGsgUjnhSThOgyWxzUeqtsDPgQN/4TrrHe1kb+vbpOG
 ypuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vf3esyWUav8tIO7Tt0s+3PzYyqPkFiPqob3OCQ3mGaQ=;
 b=bCWQwZkFjioXGkEt753Bkjf6L6QIGwgNqYCbDvaCt6BGCnzhfw0myBnGUKirhXsSrK
 +0r3ZhlgVtgv+QL56kH68YaAcauZvwFCBGDxwYh1nHibTV1XW7J7fm/WSc1VoccTxNDG
 DXCNstGzSruFFShHMupqD6T5k05UqXM0301mLofdU0ODNGOTpm0PHIZckp/iI7oi3EfS
 ZR2Z59od8fd/HOsp0jdXx4lsLO4JzKh/jFwm+KTdejv61FL5m6qwogzx1uFdiHklJYOS
 RLeZsH9jz30KvvC7MiVUcqc+0K7g3cPqsoHcqPfO2W7k80TIgO+DNTAtT9iawm9QUFKi
 pUag==
X-Gm-Message-State: APjAAAXbREjpdbuMyeJTnoss02HTUo2q2Qcf+Vn6889FBhl73YXlTCBK
 Uf3unH91eZvFcNwceLPpedgeuDHAIccK23c2FTInTg==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr15575502otq.221.1582042392785; 
 Tue, 18 Feb 2020 08:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20200217210903.18602-1-linux@roeck-us.net>
In-Reply-To: <20200217210903.18602-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 16:13:01 +0000
Message-ID: <CAFEAcA_O4BjURk1GPz0fUwCbnkvyUnfYzq4+sDdUCVSzGa1-Rw@mail.gmail.com>
Subject: Re: [PATCH] z2: Make providing flash images non-mandatory
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RvzeM5fXVfjh

On Mon, 17 Feb 2020 at 21:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Up to now, the z2 machine only boots if a flash image is provided.
> This is not really necessary; the machine can boot from initrd or from
> SD without it. At the same time, having to provide dummy flash images
> is a nuisance and does not add any real value. Make it optional.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/z2.c | 6 ------
>  1 file changed, 6 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
