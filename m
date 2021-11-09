Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1579351lfk;
        Tue, 9 Nov 2021 13:21:58 -0800 (PST)
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr11297900wme.188.1636492918151;
        Tue, 09 Nov 2021 13:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636492918; cv=none;
        d=google.com; s=arc-20160816;
        b=HxP7m5imx04c0HRarDnlKh0wggwPOmz3zp7CnOTCGcnTvF5X849Cdd+1JQGO3yteMF
         2TRV8GWpEDo6/geM/4MFmvHTgpYSRPVr73kN6a/wfyGkh/aAm3uMGpO1jLEL3ohuKdml
         W0jVx12sxvrDcBpVD/rjd7tEdtFWboAollGgXbBMTE4bsMV40Z1SJX/Fu4TuieiNKsLw
         POeMtRIUu3aoI5sKlJVpJ58HxXtpsegin2Tm7zXXbBOCszEJKC1KzSS/UkQ442iiHXhL
         98d8+ywDwC+8qJ3gbxCC8Kq4H7DZ+CTUKr9XfEDWKNtMKTLhjv930Xi+6dbN9UHQ+NDf
         w+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vln+6uXc9Tglm914nsNGgZ9aFjIT+o0h+0Gn1gMpGr8=;
        b=GVaqfIs5uwOavDnHv7aYI0Og/E9V7cb0X4pTotF+4FnCvehlhYFB5kTrulP/u/J5cb
         4QnT11gAhiBSwAsDc+nmq8NoD/89SYMx67bOqpuKUIoquRxWZdPZFCte5sLRKwQQHOXg
         PKKI69KKn90qpgdr5wz5805kEJAJkeZY7/DlmbX83WOCvRhUGSjfYarNsFCOHaR3KOFX
         2KBnEj00hpjLsScnUYANmYB8J4Wt6abrxnpdM1/ZD1zH/wtM16ZGiDWPIdlXf0j5OhJa
         AnmOEjy7Y4Si1PcIfHZnsAKB8WYDj5a86xI3l0sEOGlFppDxClmzUKVOMuj1+5ySoZFU
         k5ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNqFgl0r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n30sor2494797wms.2.2021.11.09.13.21.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Nov 2021 13:21:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNqFgl0r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vln+6uXc9Tglm914nsNGgZ9aFjIT+o0h+0Gn1gMpGr8=;
        b=qNqFgl0r4Anhpp4m9YKuyLoAO+ku7Cz6b6DRr3jyh8zA0lrAlVzwPa1XYxgrlBCb9M
         G6INwYDGxxq1xaj1fM3ZhOnDPDvWPdP1ZCBCRTsE3oHYs96j1zOc/rjlZxppGgRjQJ3e
         NRzYOr6Qb2gHkRDxnEBL8/dP6DDB5ohH/oZ8dC5uyhE9ncOi/sugweQQ5emwT5QYUt2j
         xVgE0wcsmVipbcnJJacD4cABz+8fSEjsKANeUT5CRqTnXMMnHcIj+v1IPwc6ebbdv3b8
         MyOwNFmp5ST+cCTf6BXOzrD0dRNPDL442gc3DxoiPCo7MpnfnJUJhRNFcYreIu1tuVh4
         xEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vln+6uXc9Tglm914nsNGgZ9aFjIT+o0h+0Gn1gMpGr8=;
        b=f7Lci85+FZU58h/DBNYOlSBNnwJrQaJ60Z4qJljAlmfptids0GSMkBHchKFv8rfNv0
         sB8vh+jOwKQJPTRx8ps6lD0lYJm1+gV1nQzTkHVqjMJv/Q5bqpyJaHyb79Bi2Ag8lh8Y
         1x6PnQKl/4W/z2AIgzVkWiHPv/R92mtoK04mMuSMkRlV0F2Zfb/ZPOJgI15zht2rGrkJ
         mpBUWFsrabxLLJV9WQxRCbP8+C4pQOKqmEb5VGc5dbOrjAv1j+38J6efo6iS10p7z5sg
         pt+B8YySQ3soAc1ZqG1qFgpDme5s6WrMYjJ6PnCqGpxGSwSN1/u5Xd0oWdROAQRfBxjt
         JFLA==
X-Gm-Message-State: AOAM532NKMBGJ9rS17R8ScKLCfv89ZDqjrkTZvaDPuPG6iRUo75kmiHk
	HxTWS+CumNIRjC+FkECK3a5HnXTUSnWYejVa3sRyCs0Z
X-Google-Smtp-Source: ABdhPJyujnnkrHEBSYbG+1Bg9NeddcTrNYara4KTKMWjjNZWegjmL5l56cqXb8pSCYzzCm5mVdqzdulLKps/kai0wqs=
X-Received: by 2002:a05:600c:1993:: with SMTP id t19mr10812093wmq.21.1636492917801;
 Tue, 09 Nov 2021 13:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org> <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan> <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan> <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
In-Reply-To: <20211109204249.usvfatm3frar3u7a@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 21:21:46 +0000
Message-ID: <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: W1pQelYT81a5

On Tue, 9 Nov 2021 at 20:42, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Tue, Nov 09, 2021 at 13:43:50 +0000, Peter Maydell wrote:
> > On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > > (Apologies for delay. Alex also tells me you are currently away, but
> > > there is no strong urgency here.)
> >
> > (Thanks for the ping via Alex -- I missed this email when I was
> > scanning through my qemu-devel mail backlog after my holiday...)
> >
> > > On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > > (Numeric values described as incrementing integer rather than trying
> > > to guess at specific qemu release numbers.)
> >
> > This is kind of mixing up two separate things. The above describes
> > three "versions" of this machine type, which you might consider
> > as like revision A/B/C of hardware (and where firmware might for
> > instance read a 'board revision' register or something to tell
> > them apart). QEMU release numbers and versioned board types like virt-6.0
> > are a very specific thing that is taking on a guarantee about
> > maintaining version compatibility of the same board type between
> > different QEMU versions. We can make sbsa-ref a versioned machine
> > type in that sense if you really want to do it, but it makes future
> > changes to the machine rather more painful (everything new
> > immediately needs flags and properties and so on so that it can be
> > added only for newer versions of the machine type and not for the
> > old one -- at a rough count at least  10% of hw/arm/virt.c is purely
> > boilerplate and machinery for versioned machine types).
> > So it's not something we should do for sbsa-ref unless we have a good
> > reason I think.
>
> Hmm, right. So you're thinking containing the versioning fully in the
> interfaces presented by the model:
> - Is the version node present?
>   - If so, is it greater than X?
>     - If so, is it great enough to support the SCP interface?
> And let the firmware deal with that?

How the model tells the firmware about the presence/absence of
certain things and whether it's one version or another is
a different question again :-) I guess since we're using DTB
already for passing some info to the firmware that that would be
the way to continue. Whether it's better to have a simple
"version" node or property, or to have perhaps distinct things
in the DTB to indicate presence/absence of important features I
don't know and leave up to you.

> I was kind of thinking it was expected for incompatible machine
> versions to be qemu versioned. But I'm good with skipping that bit if
> it's not.

The other thing we should nail down is how the user is going to
select which flavour of machine they want to provide. Three
options:
 (1) no control, QEMU just emulates whatever the newest flavour is.
User needs to go find a firmware image new enough to cope.
 (2) different flavours exposed as different machine types
(analogous to how we have musca-a and musca-b1, or raspi3ap and
raspi3b, for instance). Old user command lines keep working
because -M sbsa-ref doesn't change; the new stuff would be
available via -M sbsa-ref-2 or whatever.
 (3) different flavours exposed via a property
(so you would have -M sbsa-ref,machine-revision=2 or something).
If the revision defaults to 1 then old user setups still work
but everybody starts to have to cart around an extra command
line argument. If it defaults to "newest we know about" you
get the opposite set of tradeoffs.

-- PMM
