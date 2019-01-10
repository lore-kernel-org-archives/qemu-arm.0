Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1658230wrt;
        Thu, 10 Jan 2019 02:34:20 -0800 (PST)
X-Received: by 2002:aca:4d8f:: with SMTP id a137mr6377152oib.168.1547116460387;
        Thu, 10 Jan 2019 02:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547116460; cv=none;
        d=google.com; s=arc-20160816;
        b=ovgRcDMrF+eF2omeHxGZiM4LGqLnzqeQeTtsORqQb+jssYBYV+5JGil+lNO6UycqMu
         0SIOCzKMxaDPQLT7AJjSHuDG90XLnr6iU5lkkpjLIFoSZFpsTYnHNa4a6VqRcYnDTFZM
         8XdKN5H1HJLpjJ8DNxHUm2wb+m6lgu7NYMt6wK25GI/hHVrb5yCWFVxx5Tynl9UihiE2
         9ND8wE12qVvmgtgBRA5+Xkv1B4ni3VDEdhzuo8JdLetDBDeYcgyIIlBY+5AJazqRDI3c
         tpyo18s+wpNEyRPnT0KjPenGhYfkf1G+VrTT/uzW9inhaj+uE6iI6Uc3dYtMHZs034Ru
         6m8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gOGemD/OhZUYT79w4xcUa/KubwvdwIv32wWefvuujjY=;
        b=NRCm+So6mB59ro0Q20c0hcXZr3Omvi6bedUJv+v2ZwTf+PZUpP2DqvFLhLGrOW+JfP
         2mbN3caZbVFkzQ1TNTYt+FAAlgNTLEKPGJzGP3FmPAc2l6YCbWiWBBPnk6+fqkfG6IpX
         216PaOxczbvagjQpAdsGbDgRJlMUTHKYCndKW4OEcN/3tF5U8ds5c7iOlkH+MyWrjbJY
         8DszrlXfu3KedEwDnwYbWSiYxLXyGJYeZhMq/hroBzEStCInoXs6UkLy84HxG+WyScji
         jZ7ea9+CkcuCoUDd3oiLekZnIHUR9NiDgUYve0+9e+BFy+B3IIXfJwvOBGc+o5AOkzug
         to/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW+XQcbn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c8sor32919086oia.31.2019.01.10.02.34.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Jan 2019 02:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW+XQcbn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOGemD/OhZUYT79w4xcUa/KubwvdwIv32wWefvuujjY=;
        b=WW+XQcbnmf4/Uj/jZpn0yn5hL6AFxAqaCtx3r7d4wCjs3x69wv6lOYFLdx0YjkxaYE
         uRx6G4frObyaIhV5kDrV5J33d5C4edb1/Uioac4+QnxZjf5ly95Q6SipFdld7+G0WClu
         uyKxkeG4VuTNrqfXPpTNB9p3XngvkTkGKSv5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOGemD/OhZUYT79w4xcUa/KubwvdwIv32wWefvuujjY=;
        b=iEejCBbw+U+ZUlawg5wIgj8ZIFasM1Ik0oRJcCAP/yUzikxf4dwDJ7ymQBewj1vR1/
         dLe4juAHmXxeczUN/FrKMhTmVLnamhhl+9LBmV2bDyMA7Sbo2yUh+GquQJaDeLyIHsXE
         +sT+OtrU28EJsa6JoOLJ/HClvqI82nVjEiUKzTAR1UmSRnfsBd/bBVJExKQzfYHqygvp
         PVa4ajDf8+YuLYkBraNgz1rU4pfvYtG/bI3fUI5XEkgj41Nm5xNo/Kg9HQBjfejobONo
         IUNLllE2nvgxRq6WrT+SWJ1oum9x6Axq0LRd9ifrH8TG3HeKqboexVTiqjDTX52ZHOnY
         Ukzw==
X-Gm-Message-State: AJcUukfxiMrRckL5pZDDSGSRFcuWK4QbiJwE0ECbSwZ0q/rIgrELeAkZ
	r89hPOJ4Nl56aMwQHoMf0Q21RPandGCmxsm7nT5piPbClVs=
X-Google-Smtp-Source: ALg8bN5cVLNzTT9tmtodtJPMNd2SyXGN4QBWvqZjZH6hvcIg8JwKrXS2reVcbgW6UIzBvAfgOXXco+qzqyyVh48lem4=
X-Received: by 2002:aca:c501:: with SMTP id v1mr5878817oif.48.1547116459936;
 Thu, 10 Jan 2019 02:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de> <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
 <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com>
 <92dba7da-f3fc-b7dc-6896-cf8d58cc7f17@suse.de> <CAFEAcA_sxvfHG6ryA4xHMfbwhDaRrF_+6xaef_0RqqH-7JESzQ@mail.gmail.com>
 <0673d8c0-16f0-49e7-f002-06491353cc6c@suse.de>
In-Reply-To: <0673d8c0-16f0-49e7-f002-06491353cc6c@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jan 2019 10:34:08 +0000
Message-ID: <CAFEAcA-duBwj2-DG=dQLo-448ca--+C6Fu54avwEFQ5D-bwy8A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
To: Alexander Graf <agraf@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	Michal Simek <michal.simek@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: U5oS507PvOWX

On Thu, 10 Jan 2019 at 06:43, Alexander Graf <agraf@suse.de> wrote:
>
>
>
> On 10.01.19 00:08, Peter Maydell wrote:
> > On Wed, 9 Jan 2019 at 17:14, Alexander Graf <agraf@suse.de> wrote:
> >>
> >> On 01/09/2019 05:59 PM, Peter Maydell wrote:
> >>> On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
> >>>>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> >>>>> HYP mode. This dance seems to work ok (hence it's there in the code
> >>>>> base), but breaks with current QEMU.
> >>> PS: it would be helpful if the commit message said how u-boot
> >>> is trying to go from Mon to Hyp -- some ways to try to do
> >>> this are OK, and some are not, so whether it's supposed to
> >>> work or not depends on what u-boot is actually doing...
> >>
> >> I don't fully understand all of it to be honest :). But the code is here:
> >>
> >> http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/nonsec_virt.S
> >>
> >> What I managed to understand so far is that it goes to MON using the smc
> >> #0 call and then changes SPSR so that on return (movs pc) the mode will
> >> be different.
> >
> > Thanks -- yes, that's an exception return so it's the
> > expected way to go from Mon to Hyp.
>
> That was my understanding, yes. Do you still want me to change the
> commit message to mention that or will you just do it when applying?

I'll add a note when I apply it; thanks.

-- PMM
