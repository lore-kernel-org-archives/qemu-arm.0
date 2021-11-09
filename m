Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1682977lfk;
        Tue, 9 Nov 2021 14:52:54 -0800 (PST)
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr11628549wmh.19.1636498374636;
        Tue, 09 Nov 2021 14:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636498374; cv=none;
        d=google.com; s=arc-20160816;
        b=XF0hb+FJffzEcOR5K+UOOTkM1F5ykmdxCFmUBx9Er3/kb5DhUt97knrMycpzyX8AmU
         oRAmuuqkJyDFnZHul/kmqj0RlgtoEj7lG8xfr/Dd/+lJ1tUJTJWNcXvK6f+mpRU8ZtcG
         eLBKR19KfAQJ8dxWZr/3866SJx9lBZVWP2oKYwNAJ/CEdmR9KG7r6z9rCdBo2JctClre
         dUurfdnw2+ZJwloFDZZ7CkzI3HeH4bygMwyPMln3u7H+NsJYFU2GlwIzZz7OuO5omKcc
         At+FXPZ4qFo8cNmhs2d3LR4WseLzwPw4kQNhFeCIYrmP4dQfn1IKOyxA/6YiJV6D4Xv7
         nvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=+xLp7dacCBCy4620NVyS91oE2zwQj4tmo1glBUi4mHY=;
        b=B19T33tQXuBKMJXVR9ewFAZnOIMO/LVXQOhODmT1u6mW/LWXutbcXj+7m06NTcSOIW
         fTneczzqXZNmN9/F8kz9HQQxIF3jRZHwDTjt3zqRJgWUK6f4DTqD7P0nDnJ4RGTRXbKA
         A6LAIxWUDW7QRkVEmQ7CAOfOB71pIoQJvqcne/duKjXWvVq5VJbwFWxYUd+GulqYMDci
         uiU4pBH2Bwei0ElevYP0HS68YMdcs3ccZ68SAfLSsZwtHewN5bpI3ksc4WmAZe3ssM/9
         MXIavFPCkNYYd32FCN2d1d00EnS9k2u0XQfabg9vJivCY30ty6GgDgN02L09ml3GgweG
         wrOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=hINUKwbF;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
Return-Path: <leif@nuviainc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 7sor4534566wry.19.2021.11.09.14.52.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Nov 2021 14:52:54 -0800 (PST)
Received-SPF: pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=hINUKwbF;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+xLp7dacCBCy4620NVyS91oE2zwQj4tmo1glBUi4mHY=;
        b=hINUKwbFhTFX4U5ayjIkuuIF5nWOtKuQBHi2vmjNQGcCMQsO4NzF47TYA0vy8RWBBn
         SegD0L8jYLlDB5V9FXDJurgFGA8YPvhsjzxu1AbP5IgQeigMpMN9qscZxTq59wmAQxkj
         Waeoj3pywydgXgbU4uJUYLQZuILwe13ol7iYtJpBYzIGTnE30EYE+ZbBdwNi06+m2/+x
         uXigLU1UUeN1ESyZiPBiqEmV0g6BMR4QArB5e47wU+xHNQl0HHH5jK08zNh9sIZ/o9Yj
         e0E4GPMSA5ASmva3L73EHgwNeoqpOrz6ngsxQjFKM1N65RtcxdQNhEdgRf087kMCXTFD
         ZkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+xLp7dacCBCy4620NVyS91oE2zwQj4tmo1glBUi4mHY=;
        b=MHZURyJNDzaJ9X20DAh2z/lHTLiBOsEI/p3C8Hu6o23f+3oYd7KtDnIFkuiPf54hsf
         THAeIXkyH6eVWxntyZF2KA/UkA3EGNmRKymVKzJBim2V5YlxBealNl1PC2aw2E3aErUa
         dEJC9dSfOr+1XGgfUgt44w/fkk/Dlj2ybNki8h3rWFPNypDBUajAfhJw6cvtGv2RUvlp
         D8ndAe/it/xpCO8gbJ7wm4E4vzv4NrND9IZq9uoUTEUTIaaGYI62YRdPG24rBmL3NeEW
         caJjUbWijNaSSymPc0cHueKm1CvnOhyHAwRgDYae6dPQTlrkDs1K/6CpRBakBQPoL0O0
         9hDA==
X-Gm-Message-State: AOAM532RiV1Z49Q7G1XqlQ084gVSDa7Z+lyfn28DbXeHHdj+BPkMXHX4
	uJ9/pnnH1/WtG8+QOII3OJ5+0w==
X-Google-Smtp-Source: ABdhPJz0wCoPAnFy8NcRn69idxtU95iybhRMj66V/MpwJ0sKaa1Zdw4qaru4WTntviC59LWWkoDTqg==
X-Received: by 2002:adf:8008:: with SMTP id 8mr13554790wrk.188.1636498374289;
        Tue, 09 Nov 2021 14:52:54 -0800 (PST)
Return-Path: <leif@nuviainc.com>
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net. [82.11.186.48])
        by smtp.gmail.com with ESMTPSA id d6sm20859488wrx.60.2021.11.09.14.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 14:52:53 -0800 (PST)
Date: Tue, 9 Nov 2021 22:52:51 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211109225251.gfr2mvm3jynvdsnk@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
X-TUID: PnfJ5eM48b9/

On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > Hmm, right. So you're thinking containing the versioning fully in the
> > interfaces presented by the model:
> > - Is the version node present?
> >   - If so, is it greater than X?
> >     - If so, is it great enough to support the SCP interface?
> > And let the firmware deal with that?
> 
> How the model tells the firmware about the presence/absence of
> certain things and whether it's one version or another is
> a different question again :-) I guess since we're using DTB
> already for passing some info to the firmware that that would be
> the way to continue. Whether it's better to have a simple
> "version" node or property, or to have perhaps distinct things
> in the DTB to indicate presence/absence of important features I
> don't know and leave up to you.

Right. So my preference is to communicate the version only, and then
have that version let firmware know whether there are now other
interfaces available (i.e. an SCP) to gather additional system
information.

> > I was kind of thinking it was expected for incompatible machine
> > versions to be qemu versioned. But I'm good with skipping that bit if
> > it's not.
> 
> The other thing we should nail down is how the user is going to
> select which flavour of machine they want to provide. Three
> options:
>  (1) no control, QEMU just emulates whatever the newest flavour is.
> User needs to go find a firmware image new enough to cope.
>  (2) different flavours exposed as different machine types
> (analogous to how we have musca-a and musca-b1, or raspi3ap and
> raspi3b, for instance). Old user command lines keep working
> because -M sbsa-ref doesn't change; the new stuff would be
> available via -M sbsa-ref-2 or whatever.
>  (3) different flavours exposed via a property
> (so you would have -M sbsa-ref,machine-revision=2 or something).
> If the revision defaults to 1 then old user setups still work
> but everybody starts to have to cart around an extra command
> line argument. If it defaults to "newest we know about" you
> get the opposite set of tradeoffs.

I'm leaning towards (1), at least while working towards a "complete"
platform (when we may still add/change features, but not how those
features are communicated to the firmware).

Once the platform is complete, I would very much want to
support (3), for example to tweak GIC layout to match GIC-600 or
GIC-700, with different configurations.

/
     Leif
