Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1169217wrt;
        Wed, 9 Jan 2019 15:08:51 -0800 (PST)
X-Received: by 2002:a9d:1d29:: with SMTP id m38mr5146997otm.264.1547075331131;
        Wed, 09 Jan 2019 15:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547075331; cv=none;
        d=google.com; s=arc-20160816;
        b=mwWwJVcZs3pM4UsBRGJqz1m7KVcIvC8zxpvjop3VZ2rdP59XXC6vfkOhvY4OFVpucV
         D1tnUBxRThDV6Y8zGDJ+Z5T2umPQoKgO7sB5aZsvfvoKkHYR3Lbghs6VMyQixm/GBM8w
         ZF5mKtxLOlkeU/k/7Ok9XDtExUUYfCsMWKqNdblMZ3s1Gt4eG921ZDXpxHktKIsNUjsH
         Z98N1MGzSS6ZReEoNcuXnbKfbDxVHp7PyFaCpGuVR+SXzrq1puVojorfCzD7/teyePgq
         bR94fiewp8AA7El67Z0YSvimxtQGGLztQthTxrsdBPFs5HTVsBD4vdHMDWJdzZWDO9hB
         lX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=syg3a75/whplNZBEJNSywJd7kbLMUuCOZgenta1ff5E=;
        b=aBHg1yRFzwXeT/JzZxIJfhMzBtcTcuzQTPCBO2Nk3xvd9zU3yV2ktF6mTIlFMazsGK
         XMJbiSMTktq6QMF9qKwxANITOkKJ8p0ZSolG6fLuW0D0tlElfKQj/yB0lfmEeK2JD4Nr
         9pAU6UFYcyU5/RCPcZIZIjMfr/ucsUHMrQPrKLMsxLOqIWFbghqfIanC+I5dc38h8Tfy
         +i8lYF9dn00R0G7slt4+o+OkorjLgT/SE1OkTgcQzGioOFlGlfK9lKwjSJXmPY0vmBTT
         MaHBffHUHlEo2PZb113C1/O9kysYATPTpvjQVBAMiWQnNbtsXNhS8pgKEs+ArXiCu+lq
         yS9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRt6SGuo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n3sor32697062oif.171.2019.01.09.15.08.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Jan 2019 15:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dRt6SGuo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=syg3a75/whplNZBEJNSywJd7kbLMUuCOZgenta1ff5E=;
        b=dRt6SGuo7iCD0fBMGA73yzX1n02rmOjQyEwrhVFFtXJCbAtPvCUIhciMiw7VXx7FsL
         tdYUsJp7LQI7c5uGH8ykwdaFX18GwuNtzOcLSTt52TkdPimDLlNX9FMwv4zC1qQb9VMK
         yxqrIWxAVjhBCoHigTLdaEHJ4Z6yib1Qbwgz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syg3a75/whplNZBEJNSywJd7kbLMUuCOZgenta1ff5E=;
        b=NO8oUBJmYo9O6ECjttqUY3dmk8mZmczITe4gg1olAw3RufWoGcB20XEjIE43wHGjeW
         amADi2U+9P9loQPIvLldpH9TyeS9giLp/9xyDM3FrHBldFEp5BzfhKKXEdp3cgKUl47m
         VPRaLzV67Mw0IW9LCE4rPf2Xp36yMCySjLPVHLVjC6MmLcU3n2ZmG2cCO9NvlNBVEdS8
         BGZqjpMfRWuI5W2383m9NHNhclv2LZuK4sqL88QjKDFllvdK/PvQICHGLqkUM3yPi5Oj
         rieVcSSTa47RkRgAkYTUZMiTN1fRWcNWbraF+lnSkxr2w6Oqp3w/z1P19Pu9vHvh54gy
         pWIw==
X-Gm-Message-State: AJcUukdLS87aWtgfcnuiMDdetPLPGyni8JO/71rPOzmWg/pnx+HC/bbf
	zNIkxxArZomG7b/YJj2y1CjRoMCbiE+5sgp9+vNNuwDHh19aHg==
X-Google-Smtp-Source: ALg8bN5IvLNA9NNdV8hskF4N5itTYBPpZe+YPK2xZCc1/+NJqs18gcy2ZJJ/++TT52Kn8UPKy0U7JIvPwVMxSRJQCYw=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr5270485oif.25.1547075330623;
 Wed, 09 Jan 2019 15:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de> <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
 <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com> <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de>
In-Reply-To: <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 23:08:39 +0000
Message-ID: <CAFEAcA_sxvfHG6ryA4xHMfbwhDaRrF_+6xaef_0RqqH-7JESzQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
To: Alexander Graf <agraf@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	Michal Simek <michal.simek@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ymny/D257eIC

On Wed, 9 Jan 2019 at 17:14, Alexander Graf <agraf@suse.de> wrote:
>
> On 01/09/2019 05:59 PM, Peter Maydell wrote:
> > On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
> >>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> >>> HYP mode. This dance seems to work ok (hence it's there in the code
> >>> base), but breaks with current QEMU.
> > PS: it would be helpful if the commit message said how u-boot
> > is trying to go from Mon to Hyp -- some ways to try to do
> > this are OK, and some are not, so whether it's supposed to
> > work or not depends on what u-boot is actually doing...
>
> I don't fully understand all of it to be honest :). But the code is here:
>
> http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/nonsec_virt.S
>
> What I managed to understand so far is that it goes to MON using the smc
> #0 call and then changes SPSR so that on return (movs pc) the mode will
> be different.

Thanks -- yes, that's an exception return so it's the
expected way to go from Mon to Hyp.

-- PMM
