Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp468446lfk;
        Thu, 11 Nov 2021 08:55:20 -0800 (PST)
X-Received: by 2002:a05:6000:1a48:: with SMTP id t8mr10631639wry.66.1636649720741;
        Thu, 11 Nov 2021 08:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636649720; cv=none;
        d=google.com; s=arc-20160816;
        b=ECU2TgCB43fJ8/aY0ZY9i4wq6ex3WuSooSe9uLgPfudIvzxTKCqAqchQ5tbh+/9C6h
         TRXJTkX6AgdWRI76UPEAqmM1ickRYj3XbUQOfYhi4ygD9egjymPJSG9FkH0x3iK0HZ4P
         T9UZmS1Ba3mUTiOBiHWPWF2KwiJYOs+dcSJ7D4USdOLCu85/EPKYqfE/dBxG2BAgsYIR
         CqPWyrRPUZiq5pvXBygGE3tRBpSv5NJVPblIzv1Z+RcVjSmlt8tCXmOV/DCjBZXqnwyl
         zicIdODnCz47x37vWySq8eHEku+dI6lYUKz0ANZche/wiKi7HvbV89zNYWoQpbn9kRSU
         OS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iADQHamfW58+cC1f3g4SsWPLaacjHyMht9a/GpaxB/E=;
        b=aTGI12qFRkVQ9yxgPKowSCj6wqOf0Dn9MAm02tN4JAOwdd5kYAhIeGJImtalubys2n
         UIV6AIvCLD9emc8qsExJUDNgSfm/WFviXEXZ49SepWas/kl7otljRe8MdKegyCYeiA2p
         DRseZywiTtZz+tB8f1isHgjFq+7c5C9+ZDKCH3JFe5EReXqgCbRx0lNNy9mWP2AdnuMy
         WJYO6KOXDj7S+1JFV3PgCK4RjlrrN9Zv5X0x2FGEQor0dMCNRinrSD85ixGKyMH+zzwr
         3/E47/5sYTGIAP9NthSoUPTJ90OY7994lpfdL+b+Y/gX/BYBxMzgGuQCAgXi0f/zbkdi
         sknQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXIzLxxV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n9sor2437249wri.61.2021.11.11.08.55.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Nov 2021 08:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXIzLxxV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iADQHamfW58+cC1f3g4SsWPLaacjHyMht9a/GpaxB/E=;
        b=PXIzLxxVFz6HcS5NOMSXLisrOJOnG59UkSmF0CgTvUTksJPa/30TNyL3y+KCDrdJpc
         UZAHwv7ODEizWdcKXUiez9Dek7Cc7izREjt7RNMdlQd//meYH4I/Po59ZxyI6cq3ld8n
         UKaL1S2scZX3MCPflChWnmyC4TC6wBac9XA63GIfKjSll6FNrtHWFkpkbkNhZjuPc+M4
         q/iRaosSrrJ6ZrOrZLed8Z5UEJ/RhAq9WfPu041jT4iNQ/F2GPs8pL1JItgyvJeokZLC
         1eSn7R3uQZ9UvJzVFXiaMk6fusW3Gp4vs8O4zyIIEDUeGIHINZ16Ws9158c8gLhokyQH
         P0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iADQHamfW58+cC1f3g4SsWPLaacjHyMht9a/GpaxB/E=;
        b=dd8jUe4cgXHNxHD/1aO3Tn0luMz+UZ1HJaTWT508bMmUXdhdE0Hm+L2OkHZFj7G63Y
         dJMXu6ppme1gqe5ciwT3lz7bTmcwAlwB/j6TDS8fKN4tficLyf+ESm+cYLbS8P+EoHjv
         +5v+tlgETPAPmsXIeN43GYp7RomRRK0ITtWCblx4BE9cuuKWjiv4ubZ+Ap2ngBH7Lmqf
         LsyjJ+lkouP7rl1uJwL/Yxe7I9x9ENhCBxEGo/Hp/yGkbJY/t74eOhM/6+29GfcxVdXM
         wuymecUZPA50qz5tk+hhGkJ3Y1z6HaRoVEUpTUBPKjud/ImylanAp7TyKWCJzIsu+Gid
         WGPA==
X-Gm-Message-State: AOAM533sx8kQif6TSz4kem20aa+cPl+wamSG75Zwpk+4zsx7WVMn43Qd
	K8GeUPTma9L/ktbwCocaz3+ndffwHSX1NddkMDBhIN5q
X-Google-Smtp-Source: ABdhPJy0PPv5fSAHpxrT8LFKBZANa72f9OmW7DIrD9SnLrRD09Y4d/oOVWpCo1OwGnJ6SXkXWeNpMglcD1G/sYWbHO8=
X-Received: by 2002:adf:e984:: with SMTP id h4mr10618461wrm.149.1636649720457;
 Thu, 11 Nov 2021 08:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org> <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan> <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan> <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan> <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
 <20211109225251.gfr2mvm3jynvdsnk@leviathan>
In-Reply-To: <20211109225251.gfr2mvm3jynvdsnk@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Nov 2021 16:55:09 +0000
Message-ID: <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PTmTbyzITSvQ

On Tue, 9 Nov 2021 at 22:52, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > The other thing we should nail down is how the user is going to
> > select which flavour of machine they want to provide. Three
> > options:
> >  (1) no control, QEMU just emulates whatever the newest flavour is.
> > User needs to go find a firmware image new enough to cope.
> >  (2) different flavours exposed as different machine types
> > (analogous to how we have musca-a and musca-b1, or raspi3ap and
> > raspi3b, for instance). Old user command lines keep working
> > because -M sbsa-ref doesn't change; the new stuff would be
> > available via -M sbsa-ref-2 or whatever.
> >  (3) different flavours exposed via a property
> > (so you would have -M sbsa-ref,machine-revision=2 or something).
> > If the revision defaults to 1 then old user setups still work
> > but everybody starts to have to cart around an extra command
> > line argument. If it defaults to "newest we know about" you
> > get the opposite set of tradeoffs.
>
> I'm leaning towards (1), at least while working towards a "complete"
> platform (when we may still add/change features, but not how those
> features are communicated to the firmware).

That's certainly the easiest on the QEMU side; you know the
userbase so would know whether that kind of compat break is
going to be OK with them.

Q1: who is going to write the code for this?

Q2: do we want to try to land "ITS in sbsa-ref" in 6.2? Given
we're in freeze we're quite short of time even if we handwave
the fact it's a new feature, not a bugfix, so I would lean
towards 'no'...

-- PMM
