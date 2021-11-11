Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp574289lfk;
        Thu, 11 Nov 2021 10:21:51 -0800 (PST)
X-Received: by 2002:a1c:730b:: with SMTP id d11mr10458603wmb.17.1636654911367;
        Thu, 11 Nov 2021 10:21:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636654911; cv=none;
        d=google.com; s=arc-20160816;
        b=bNisHc5X79hbI+//A5u+KHARxu1iKl7ErmhdR2Fql94kWAwUGay5u9UOe9l91lLwSP
         5Q1EDEqg9sqDlbwxWTN1UJR3F4jBUK3p9eGtEyyBAGvysPr1gIKIj5ggpNf5Dt7JKhUA
         zKOjaQBaXXEfcvMAi5DabxsN3Sz53XHa13If5B5Xl3kVtbAhC/2Nm7b+o5MlObreKtZq
         hJyEXhC5ZvwDmk5eWs128bZtOdW2/53BjvoEbwpQwFvOOMwZ6KEdVYQIJW/3ODqnpQL9
         IdbBxUs7b6OX+gtVm3dzSgw/RKTw+HndkUhvf2PTvO33Ev8hrkdJ+JGSdvM4SCNdB3F6
         ZIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=1nDfgExPLVmPjrHAgq5VjwgrVgGQAem5IuVIe5/76Gk=;
        b=JN18o5fkNZc7h932wLmPldF06teuM3wh/vrbRtdXcYN4enHQiTMduJLXCkruPf2hqL
         2fzgu2kvLt9rShHy+pGLnZU9EjTOBRhF8Ij5ojt4l9FxlmrwOts2dinQOdL0WG7272Rv
         6G0S5diUtwUlYjojWoCBnGaDmynMCmD3HGt8N19S/X4tXem4pzGnCxSFq/uQMrXVptUe
         lfRHzr3DY33kcKFuD0R6WNWMYAPln7sXtfag6C4BVylkonHE9/Dk4sVubJrQqK/H9IjF
         sAtTlXMxkFzwcGD6+VvdutG/fBTKs0DYsHKvPD9c8huJZVJvXCEtOydhfrg5dphqmyMz
         HWXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=UGhHc4TF;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
Return-Path: <leif@nuviainc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z8sor2635952wrm.15.2021.11.11.10.21.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Nov 2021 10:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=UGhHc4TF;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1nDfgExPLVmPjrHAgq5VjwgrVgGQAem5IuVIe5/76Gk=;
        b=UGhHc4TFB2k+7wS5DHjiEITIVyZrXuCcKONzlu8VgFClKneznjC3TAqo/mWe7sI3xa
         rv1CQQg7A/FOxG4XVD1vC+X50rAc+HJb2c+Lek3joHgtuES86dWD1f6U/AukNHzFHN5n
         huaf9DmwRFF/kOV3rUAndqdPQIM6NcK+JDqzhBFWGfZUh0OVamZZC6oS8vxt1e/xzsb4
         rvsOL+0/7E1y6VLc5mQmdfHrwqB+sgFHT6JaL4D36k8lOvF/4YcjFTqA4Y33ZRWX6N5i
         ZCl73Iiy1dHfd5XugPNaOEpv2bkAzHGLvg+yAwUktse0VgJpgzCfrOdorG9ETkhFcPec
         GHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1nDfgExPLVmPjrHAgq5VjwgrVgGQAem5IuVIe5/76Gk=;
        b=JztGM4C3lDMeA4lTWfB6MD+lQWGx+Y9ouA3CSkMJfrrVkACZ+qSxHW8EUktU5PAeJ/
         S9qSLVssvMRCC2HROEfwNX4trCSA2uG6yqJPZwwsRlLIbZ4A5KUh8LD7X8GTeiqAU+H0
         F6JRLJZ4JSS563AwsIroLYl5QW8qcIA5qLIw8A7ZQThqLu3DWwbHA7McQJw/QGJYgOkD
         KSs1pfl2US0/1UQ3RG5/g71A9k9L1a9UEAjNs5Ksto26oL38zrRzqN5CMoP37l/QrnuP
         Xd1HsYFar3j3flzBZFdLWciTZC9TptYGuJZDHjufwwlUt/c7IncsmxXiWEanuAssTcPC
         gabQ==
X-Gm-Message-State: AOAM532xYsfH8VV8mGIYbbmp8EfgvxdJZogj+04vJwTSdt7YhpZKHjIW
	VWpExPrX0h+2+VeMuSk1QTV1QQ==
X-Google-Smtp-Source: ABdhPJzfqpatzU8RaPRMu6+pUprPNM3lLb7nzJ4fswLhkBrpO8jx0tR9hTF1vJWfrLd8Nc4XpQvD0A==
X-Received: by 2002:a05:6000:15c8:: with SMTP id y8mr11340278wry.101.1636654911055;
        Thu, 11 Nov 2021 10:21:51 -0800 (PST)
Return-Path: <leif@nuviainc.com>
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net. [82.11.186.48])
        by smtp.gmail.com with ESMTPSA id n32sm3374467wms.42.2021.11.11.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 10:21:50 -0800 (PST)
Date: Thu, 11 Nov 2021 18:21:48 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <YY1fPNywEOvSaJ/a@leviathan>
References: <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
 <20211109225251.gfr2mvm3jynvdsnk@leviathan>
 <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
X-TUID: kQ+sP6bWsZfq

On Thu, Nov 11, 2021 at 16:55:09 +0000, Peter Maydell wrote:
> On Tue, 9 Nov 2021 at 22:52, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > > The other thing we should nail down is how the user is going to
> > > select which flavour of machine they want to provide. Three
> > > options:
> > >  (1) no control, QEMU just emulates whatever the newest flavour is.
> > > User needs to go find a firmware image new enough to cope.
> > >  (2) different flavours exposed as different machine types
> > > (analogous to how we have musca-a and musca-b1, or raspi3ap and
> > > raspi3b, for instance). Old user command lines keep working
> > > because -M sbsa-ref doesn't change; the new stuff would be
> > > available via -M sbsa-ref-2 or whatever.
> > >  (3) different flavours exposed via a property
> > > (so you would have -M sbsa-ref,machine-revision=2 or something).
> > > If the revision defaults to 1 then old user setups still work
> > > but everybody starts to have to cart around an extra command
> > > line argument. If it defaults to "newest we know about" you
> > > get the opposite set of tradeoffs.
> >
> > I'm leaning towards (1), at least while working towards a "complete"
> > platform (when we may still add/change features, but not how those
> > features are communicated to the firmware).
> 
> That's certainly the easiest on the QEMU side; you know the
> userbase so would know whether that kind of compat break is
> going to be OK with them.
> 
> Q1: who is going to write the code for this?

Me, my team, and perhaps a little bit of help from Shashi where it
intersects his code.

> Q2: do we want to try to land "ITS in sbsa-ref" in 6.2? Given
> we're in freeze we're quite short of time even if we handwave
> the fact it's a new feature, not a bugfix, so I would lean
> towards 'no'...

Shashi - what is your feeling?
If we could make ITS support depend on the platform version being
communicated through TF-A, we could simplify the transition a lot.
But that would definitely mean missing 6.2.

Peter - could we sneak in an "add version node to DT" into 6.2?

/
    Leif
