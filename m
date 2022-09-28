Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp501799ocs;
        Wed, 28 Sep 2022 11:56:23 -0700 (PDT)
X-Received: by 2002:a05:6402:4493:b0:451:141d:3231 with SMTP id er19-20020a056402449300b00451141d3231mr34358979edb.318.1664391382961;
        Wed, 28 Sep 2022 11:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664391382; cv=none;
        d=google.com; s=arc-20160816;
        b=eltvp5xMA5hA4YvSqnBH7uCm1nkCBBYSx+6sRi6UKDKhURfTzVG9oncTeY8JELn/1r
         qUUPGob+/MZROQvRFvN5K/G9VcDrFUgPGI0aO62ciD4QaYEcKaGxePSrgOz0mDZIjFsg
         mlpNxTppaT9zHLV66OOP2ElF1S4L/d9c/oaU2ZIkcSnd7wN0RzCpyhuyAOUbChpSIGnA
         Gaz6sU4dYOULXd5rD62Rx/JlqIKESBnIzvM598NhZPjFwzfjUBkI0570QzddDt1pBWmd
         fNkQX86kntYptc21+IbRzmmWWfmLP0p78iTjDPt0XgC4QyGxVSt9+HnaIuUQbwdsc2Gn
         tGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZY2HNktMluQmsNvOy1Svrazl3wDZBz83ClQa6XKE/Pk=;
        b=LPplgOPgeOkJewV+HstK//tii1KeCEJnDRjfK2mg7SSbnt0k05fHDKXSusSYE5TxPR
         6AK5t0FuMX9/meA0QKjgB5Whw9GlNLUKb/7SdURHc5dAGibsOVW/alIamP+Y+FU6TCbx
         pTtOAqv8UMYCBK4/0763m1sgNATFMHJqSAOT18FwxHkXvQN8pTL1Zx6sivv/gngX2k/i
         ed5RD0HbNHRpH/u8FM/xocHdbAHK3hamTAY9Q/7YA/Rs/qAjWPYb+tmJN0hjRtTkTdDK
         AecWbujvGSIWQbd4ffvemywxmD9lQTlg/lq+48FrHWYWAhXaDfdWmyTMrNfatUJC4Frl
         SJHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQWUoa3J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dc16-20020a170906c7d000b00781dc00e919sor606784ejb.47.2022.09.28.11.56.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 11:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQWUoa3J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ZY2HNktMluQmsNvOy1Svrazl3wDZBz83ClQa6XKE/Pk=;
        b=EQWUoa3JktyoMDaSm0R9kHmF9LO00m9mptqUukQVVsowdJKFjoWApEe+shhC5q2EVg
         hvjc716SDry6+cazWICfXkLbxcRRb0CouTs1UpbK/XrAaJrIViDs6hMkfkXF7yOnchnJ
         mKpCWOiojhfgDkRe5hsVDHQY6qTZQ3bEJsan/2KkAa5erQEyp23E44QLoDSWxr5fAWpm
         RQbmxqYU+nPvGDuLoEBoFvqJkhPmFOvSCLGCGXf6BeOdpvA5VfDvs36Fffd54YyKf5LD
         NgzNJptpinjkngm/yONdmottotGAmzq6+8vopNMJca7brD6LB+9CwcAfK8AgbnVhdMxC
         3LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZY2HNktMluQmsNvOy1Svrazl3wDZBz83ClQa6XKE/Pk=;
        b=TWSozbpZWyQnhgZooI7YCiQBxgO94N6nfigAnW89tLr2ELfRsGxWaSjt1IbY7EGjLA
         fshlXMDT3tpPEtRKoFL4HV6wpcZkZSAiPOJeFYJjyR5Ns2ErRkAPFU5mpIUBJST4DDc0
         CduduUlIa+Zqtr608A186pNz0NHzkRyegIfmoi30TtXi1gZXOVCcu8Y1YYfhQ9mgZ5Sj
         JI+0m75fzlF2muBpvkDOeNcSKLJXYvqM32/A32CTUp0bFHBXCU+Jm3Ht/R4qJ4yeJXVP
         F0JfLGWp/F/8gIcz1t1+PrB4RAf0fimPIKDwnF7H+S0lwaMH7BsuHJyc8GiaBSrSGmX2
         UR2A==
X-Gm-Message-State: ACrzQf16cPcDmTJTgWExqOXW9/j+S4OTemOHIu+ee6BFURYuK0HtPpyK
	LzdNXYwefLo7rnBUxobwNLiidp6/I+q4o6vTIZffbSu9
X-Google-Smtp-Source: AMsMyM7MzPu5T11FIlKx57fLw0gfd0u9zQL+jlmwi6zBBCV8XJkKv6lPqZjC/q/LxhmaGhoK6/TKIPZidkbEb7D7wJ0=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr24830530ejc.659.1664391382579; Wed, 28
 Sep 2022 11:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org> <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
In-Reply-To: <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Sep 2022 19:56:11 +0100
Message-ID: <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: lJ3T28VJGTde

On Wed, 28 Sept 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/27/22 07:14, Alex Benn=C3=A9e wrote:
> > --- a/hw/misc/tz-msc.c
> > +++ b/hw/misc/tz-msc.c
> > @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwad=
dr addr, uint64_t *pdata,
> >           return MEMTX_OK;
> >       case MSCAllowSecure:
> >           attrs.secure =3D 1;
> > -        attrs.unspecified =3D 0;
> > +        attrs.requester_type =3D MTRT_CPU;
> >           break;
> >       case MSCAllowNonSecure:
> >           attrs.secure =3D 0;
> > -        attrs.unspecified =3D 0;
> > +        attrs.requester_type =3D MTRT_CPU;
> >           break;
>
> This is surely incomplete.  You can't just set "cpu" without saying where=
 it's from.
>
> Since this device is only used by the ARMSSE machine, I would hope that a=
ttrs.unspecified
> should never be set before the patch, and thus MTRT_CPU should be set aft=
erward.

The MSC is in the address map like most other stuff, and thus there is
no restriction on whether it can be accessed by other things than CPUs
(DMAing to it would be silly but is perfectly possible).

The intent of the code is "pass this transaction through, but force
it to be Secure/NonSecure regardless of what it was before". That
should not involve a change of the requester type.

thanks
-- PMM
