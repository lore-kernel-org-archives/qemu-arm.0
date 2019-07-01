Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3118221wru;
        Mon, 1 Jul 2019 15:23:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzy2sZMPCmdc45w5jqDOcF7rMNd4/fDIGjXNSFlKo4vlsj112wovPEBxfLC7jG65XYHWiKj
X-Received: by 2002:a17:906:7541:: with SMTP id a1mr25213462ejn.50.1562019787811;
        Mon, 01 Jul 2019 15:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562019787; cv=none;
        d=google.com; s=arc-20160816;
        b=b+w61CUAleOQ5/XuEBvYYOfJdOZJUNE88birCrO9ZzfhG+AmKitB2DsI6aGPi1K0DC
         51AWhGZEbykRGa5RjgbjRTwqUpIjXaw1JAvkaqXhib5x0XtEXEjFBHnf+UpcyzFBMbKT
         +O/6vGzWWfWwmlXDobjtw+Tk08pt9lIvmr4yQp2erpnacfn0xTDByO92o/KyucUtPUfx
         5GqJjbOmErbwNnLCnutORju809tMEqPrONu4mVIH158PjwBmYGpZCeto461CPy52BfzL
         cDiFCO3ewMEZ/XubfXz00QTylsrR/PFg8Tk3pUDXcKh5+iFeHZ9Hj0TAsAKRQQJ/nLoP
         fR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YkJ+DrTHPblpxKMv/4Ul7jv0bv4rnYYnJQcVZ9/wFpU=;
        b=LFUFksD3Rf3BAAnZBRlMYm4I589rMqz3jndMUFo58Xzve2i7BfBLURzexLJvVwdDgy
         cqAmdGOYHWYWUD8E8AyPAb6Hi2rkmzQk2Aca9B7+txpulLUL6j/XOmfB4hmrjTJqxLjC
         YG9FVnGRkv45yK2aVsDZigI/VcNhvH1uo1wiVhLd+Ly3A35YiHu0RyIxjkQRyNYy/Oby
         rsdGkEx6qA3cpBQO6/JfhVKGwaOZkf1BAW2/10pXsu6euLT3rdJOMi+kC1PVYyYimOYD
         0D4Y/WVSLWYakoPNjRR7pcfJ/2OFO0PHH6nzm3u8xRkb3s34LSfGWbv0b1C7pPzEkr+u
         5kyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=eOqifwzF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o55si11516568edc.137.2019.07.01.15.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 15:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=eOqifwzF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi4hW-00023S-Lx
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 18:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hi3dm-0004sw-W1
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hi3di-000232-Sc
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:10 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hi3df-0001E0-PV
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:06 -0400
Received: by mail-yb1-f194.google.com with SMTP id x4so566954ybk.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUdJ2ra0quRmBJw7uvelcVmfVROIlFC4VcERGTjbcMc=;
 b=eOqifwzF+s5nDPQtVR1dlA7jZKNj9uWM381ERJcKTxr+jUKVnYCkuROs11yGm7zRnl
 Cw8AG8uVoAl4hs/v2/bfDMGsGmloHlihtZYCnJd8ceOvxnKRMMwhaDSjhDAu+HDdPpcV
 KHouR0Ihxkdr6jmK52GNAAUyHkI63siJ67lrqBasKLRqEIKZyOnAqoM/t2e0dZkyTNzU
 6iH8vBaNtODTGlOtM/UqolpWqM8SZlHoM9wKQyKqjL+YNGU6ptXYBYwNgL4zt3NAyONv
 Z1PLUiDbkmrSDfaatJNW/2qF9RUTwvl1zw1zWSyQk2zDg7Ihty0cUTHwFuu/8BfZ8Sa+
 b1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUdJ2ra0quRmBJw7uvelcVmfVROIlFC4VcERGTjbcMc=;
 b=MZ7yPc8nvuMi0HdMMMPuh9Qaq3wGgUG6equx241zbGXWOLa4JOucrbGXwoZ4SS9s71
 AMzVAfsvGefJecbj6mfhUvNKofF+wSG2x5TnICfM+Z0J8xsrX3TJCOyeG9jykoJDQQTW
 tJscDrNPGItnuC6m6kZEVy985cgO/lTPud5vcukJO1Ll/lG0+M4vfHy9XZvFaXs8X8Yt
 /7QPGmvHzZLdxC6OmGyoqQYvTZImU8/2upIb+jm1sEbbisCjm5LLVJIEJbaDXQR5HIN5
 LibtJ0IVSQWqXMgbNPHZr8hl3YimeOkWYrlSosArLRmHHDPqBry0GeKSIwmeuTTLUDiG
 X/vQ==
X-Gm-Message-State: APjAAAUPOInZqMnTi/2mtsMfSoFx8dyGJsGP5xQabo24yXc96q+44zg/
 GJqt5OZAQvaqofoLElzDdTUuZgevz+8gm2cS4gQDTQ==
X-Received: by 2002:a25:db8d:: with SMTP id
 g135mr10947046ybf.336.1561998231160; 
 Mon, 01 Jul 2019 09:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
 <20190701160846.fwjeco3zuobn3pgv@bivouac.eciton.net>
In-Reply-To: <20190701160846.fwjeco3zuobn3pgv@bivouac.eciton.net>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Mon, 1 Jul 2019 18:23:40 +0200
Message-ID: <CAEK-wK=gV7t8sTnN9dLmJO4ECgAudO-THhtJzHWxMpxf12mPtg@mail.gmail.com>
To: Leif Lindholm <leif.lindholm@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.219.194
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Hongbo Zhang <hongbo.zhang@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOTu7ku9WqvJ

Hi Leif and Peter,

We talked with Hongbo about the takeover, so please add me as maintainer.


On Mon, 1 Jul 2019 at 18:08, Leif Lindholm <leif.lindholm@linaro.org> wrote:

> Hi Peter,
>
> On Mon, Jul 01, 2019 at 03:54:24PM +0100, Peter Maydell wrote:
> > I've pointed out a number of issues with these patches, but they
> > all turn out to be very minor (mostly fixable by moving code between
> > patch 1 and 2). The other thing we need is a MAINTAINERS section for
> > the new board:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cad58b94879..0bf3739f06a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -728,6 +728,13 @@ F: include/hw/arm/fsl-imx6.h
> >  F: include/hw/misc/imx6_*.h
> >  F: include/hw/ssi/imx_spi.h
> >
> > +SBSA-REF
> > +M: Hongbo Zhang <hongbo.zhang@linaro.org>
> > +M: Peter Maydell <peter.maydell@linaro.org>
> > +L: qemu-arm@nongnu.org
> > +S: Maintained
> > +F: hw/arm/sbsa-ref.c
> > +
>
> Sadly, Hongbo is no longer in Linaro (but has generously helped keep
> working on this platform being upstreamed since he left). It is my
> understanding that in his new role, Hongbo does not have the bandwidth
> to keep maintaining this platform once it's in.
>
> Unless I have misunderstood this (Hongbo, please confirm - we would
> certainly love to have your help if you feel that you do have the
> banwidth), could we please add Radek as a maintainer instead?:
>
> M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
>
> If you think it could be useful, feel free to add me as a designated
> reviewer:
>
> R: Leif Lindholm <leif.lindholm@linaro.org>
>
> (I would not be offended if you don't, I have plenty to keep me busy :)
>
> >  Sharp SL-5500 (Collie) PDA
> >  M: Peter Maydell <peter.maydell@linaro.org>
> >  L: qemu-arm@nongnu.org
> >
> >
> > So rather than making you do another respin, I'm planning to
> > make the fixes in my target-arm.next tree as I apply the patches.
> > That way we can get this in before softfreeze (which is tomorrow).
>
> Many thanks!
>
> Best Regards,
>
> Leif
>
