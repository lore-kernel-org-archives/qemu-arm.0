Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp797084wrt;
        Mon, 19 Nov 2018 04:44:26 -0800 (PST)
X-Received: by 2002:adf:f101:: with SMTP id r1mr14985246wro.32.1542631466690;
        Mon, 19 Nov 2018 04:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542631466; cv=none;
        d=google.com; s=arc-20160816;
        b=lQgmgAYxLNom6KuLdu4lycEzRu1zcCu8LRyaihLyN+PHKDn8rIAxAv7+pQMP2pHPG3
         01ahqmTShQ/tdLPqmlWneOxO/kfqMWtFBGkeSpbkgtFXfexk+wbYlHbE+HEyqyte3GYH
         67sqA9L+uU6f8rn98zhLV04/5MzwkxP12HlobA2uuI2CUD1j1YWirZNVr7/8Z7NCYR1N
         06UUALXu61RTy3UsyB6tQ8pg0adCLcStkqfsJ7uZSoFS8L+lTR/c9VE+EDf2jswVk/kz
         TArOsIG3Fw7hRhe1Tx3evVlvtCxZlh8xRH48qpvBXdw1BLHsCjwCpM2XP9dw+uOft4wp
         5tBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=5ixC5v24laPHqOBTTwKKh4idTJAtKCYCKhTxpBVveYc=;
        b=vgQnKoYP+ML5/RJUUy3qgjL6ycM3BYOcIvY/qJ2vUies97aXSAVIZjEE8OMhyyCTZC
         kD5q91P28xlu84CLX1BNn0j2je1jT6mrvxrVc8ow8v4VFim9qE8yJilSM+ab6VgMU/FC
         vkS996vaS0GO4ja51pTomEun5smCkRVBseoUywc4AeslVMrGWzyj7F/a/maUF09UaRtJ
         SCohU3HSJCV6YlsZfSse0vADL8FbvIJzPOSVSTezoBNQKUpqBSda2Prz81Lc671equnL
         GQj8ndQG9FnASyIZgiQEx4QJHpqQXgqF7cWpeaUd3fgGXU8aCuHYBcNnqwcI3+hnO+TL
         LGIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RP41MGL9;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y5sor12745424wrs.27.2018.11.19.04.44.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Nov 2018 04:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RP41MGL9;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5ixC5v24laPHqOBTTwKKh4idTJAtKCYCKhTxpBVveYc=;
        b=RP41MGL9///t7zeBwFc2R7vjimdT+zO0uNqEWxas/4w3j5o3IqBEFFIOEq7wLREN1n
         rOiVLigReFfS+ZTGhEOqSGBqkH0oLAUqsAnqnodCt3y2ubwv/nR1UX0ktyhHesUDxHa5
         10ZTMfWTa1wFkfZMIto2Ia4/rz1uEHGKHU4hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ixC5v24laPHqOBTTwKKh4idTJAtKCYCKhTxpBVveYc=;
        b=f6lLLl9DZYtB6E2QLIo0Cz1cd8I4We79w04ybfT9hJVCMAzIzpuofkMBIpHp4eewyN
         3t6Q74mOFyMe7PY7OgHNFglRR3Od3otIXtUZs5PP5jjORZeoew5suTev76cfrWcyvtYX
         L9KlxIRzMAmKAJc/EcjSodAA0qtanAwhGOO1i20pFr+PsciI98mCaniy3oCXvXf8B9FO
         SgQHgG64p9KU+VjgjI+MAOLe/Oit5wXz70M/DC4Ni4YuRrQdSwHJY5nHZoQwgnHmN0if
         xj5yI9he1kFGivex1UXufRfDZ0sbP6SYZMmy5qoR0QsOLH/KtWyh4vEw6wzb7hZNN61T
         vU+Q==
X-Gm-Message-State: AA+aEWZsatybpahesdfdLg8cBCnf5QXTJ+G2kt/whrGCxYl80sh6KLhc
	Qu18pScJpSusssVqVRzKHyI6Souqnu++1g==
X-Google-Smtp-Source: AFSGD/V0ri/XLCDBePz2DpbmAgXZJQyRnr+h6K0LYIjPWkX1owHGXb2hTbLgK8TIVW+RlPvD8q3aZw==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr16241595wrs.272.1542631466380;
        Mon, 19 Nov 2018 04:44:26 -0800 (PST)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id 66-v6sm26827596wmp.28.2018.11.19.04.44.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Nov 2018 04:44:25 -0800 (PST)
Date: Mon, 19 Nov 2018 12:44:23 +0000
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
Message-ID: <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
 <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: jKphvpC6gdZu

On Fri, Nov 16, 2018 at 02:04:07PM -0800, Ard Biesheuvel wrote:
> > > > What is this using the exynos4210 USB device for? That
> > > > is definitely not correct for a generic board.
> > > >
> > > Checked the code:
> > > #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> > > #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> > > #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> > > #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> > > #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> > >
> > > The first one seems only a parent type, not a general instance, cannot
> > > be used directly.
> > > The other four are specific instances using the first as parent type,
> > > one of them can be chosen to use.
> > > That is my understanding, any comments, or do we need to implement one
> > > which seems generic?
> >
> > I think what we *really* want is sysbus-xhci-generic.
> >
> > That'll be a bit more work though as xhci core and xhci pci needs to be
> > splitted, simliar to how it was done for ehci in commit
> > 5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).
> >
> > Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
> > to physical hardware.
> 
> We don't need XHCI especially, EHCI is perfectly fine as well.
> 
> This is mostly about ensuring that the emulated hardware spans the
> space of what we encounter on real hardware, and non-PCIE SATA and USB
> controllers is something we see often.
> 
> So I could live with MMIO SATA and PCI USB as well, but I'd prefer it
> if we could have both MMIO.

I would actually strongly prefer non-MMIO.

What "we see" is generally a result of embedded companies "value
adding" in the usual way when moving from embedded to servers.

I want the SBSA target to be an idealised machine, not an educational
vehicle for showing how companies have got it wrong.

Where in doubt, anything software discoverable should win over
non-discoverable.

/
    Leif
