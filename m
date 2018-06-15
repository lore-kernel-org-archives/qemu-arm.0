Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1026946wrq;
        Fri, 15 Jun 2018 09:09:38 -0700 (PDT)
X-Received: by 2002:aca:5f06:: with SMTP id t6-v6mr1313648oib.103.1529078978697;
        Fri, 15 Jun 2018 09:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529078978; cv=none;
        d=google.com; s=arc-20160816;
        b=GhN7lN5JdNWNvR5X8MAth1JefN+ZSiUtgtUkhSW5BFn3jzOCwZc/Rb1S4t92rcvBcs
         rWL/rgwmpE0mqyVtjqrTMeehLb9VfW6bDtwiEmeWs93W63VrghqtYe65KORQOExrqHoJ
         y8UMbjmmKjKsBrfmt6pp08lI+PpDtxJssZMp0lM3tCGG3eXHUbj5MZsp77zBMG4HvpKk
         ETcTmh0r+4+pq+IIw5KksM+0PSMXjPYR1ne2Xy3mMaIGSffN+sQpI9k5rEmqhQkB583J
         JSvB5m5BdpmbeSl9lUoSTD35dA+VyBW560/AwKyiNabsUW8U7dvWwNT9YnPgFpbn4O6E
         ANrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Z2hGHoknod/hDoRoJtiUBvmG6kRGA/8/G1t/ZlJXL+A=;
        b=j9Z5TeqyGyBaMVI/NEecX6PNG7+70PHzazudZ++LsOVkjWXz20ICgLL+heGs8le40v
         vwt8pUrUIzR7igg1dcehw9CKQHg6Ou8r88BbI0iKroFhreJOpyYdSCvyLVvSIHZ9Iw0f
         BIZ41OGH0p2rOqPE6l0oe4Bya75kyQaAAJWDQWYxUIVncno8ETZWTzN17pEhoSAFGopQ
         McQ1yfHowZL7WDowjqeAeED/aWVtIKlyaDAoTKdafGd15eFsfUuOwht0Xws6hgbwh5nV
         Rg0CbPIHKsx2bkHBgpi2kDdBG7Qrg0e1OLuaOrxRhpiaBrcPkcVFQMFsL2BwY8U9agWh
         58UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3k4zKyr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s7-v6sor3413796oie.15.2018.06.15.09.09.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 09:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3k4zKyr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Z2hGHoknod/hDoRoJtiUBvmG6kRGA/8/G1t/ZlJXL+A=;
        b=N3k4zKyrPFDfp00wI0zoyvn9l5S9r1rKA6x1Rp4CPnz9CMpY9GCDjZ4EeXVvdYsHKG
         h3KA9wEsN5ANHrvBBHA2hahaLwbmzYOr+SCkH+RTIqNrCehbHUcyNfTGL03QrlgIow+d
         IceooCOav+dFvPOzc5kcBrBXws57YYbFDOumE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Z2hGHoknod/hDoRoJtiUBvmG6kRGA/8/G1t/ZlJXL+A=;
        b=C4+buG/1CSPX6xaSvESRC1gW5AOK0hQvXYYN+CvSKEE2ThUn7k1ymO0dY4GDlBaJCh
         oY7tqXXENbYdSO+RG703HFlzK8dqfT50QV7pWgjzqbU1WYHR49vncdmfYm73+YIfZSEm
         YdT6HvimSpvzWWbhqo9qtUnC9nGaqKF/sRVDla3K4JwOrCkFwzsYPt0KDPVr84hX7ACl
         2LLQWqw11+jIxiHvVOZQuTt/f9loUdHiGC4hqJayeVfcWtEYcISwgjs1SFLQm3BIcfzS
         MrTZJf0aN7E+/nwmgKH3XUBb1zZzNcU30+dk2649E8mGfbS7k1b/atFfMheC+xjvLxic
         LcPw==
X-Gm-Message-State: APt69E2eclF75XR8IkjljRS6TOlc5PaanSD0VRGDPT25J5fUT5prVPfO
	WNoYFYPahRyIzgvwwAbHH7ZkPZPa36ymPqgR6/+wzdc4
X-Google-Smtp-Source: ADUXVKKfuMqWEmEpnR7fS7z1RYKLaqH096BfP+9MisOBy/+Z8U/xrHEp3Hb8JY9b14NSmkIhjitPjUPXSASDpjrkkoc=
X-Received: by 2002:aca:743:: with SMTP id 64-v6mr1117284oih.164.1529078978413;
 Fri, 15 Jun 2018 09:09:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 09:09:18
 -0700 (PDT)
In-Reply-To: <CAFEAcA8ioVZuB61XWQKKRyGAJxn1gge4fjbrQuK21-drh6y81Q@mail.gmail.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-9-peter.maydell@linaro.org> <64ff124d-fe34-75eb-e9e6-7c419827ee3c@redhat.com>
 <CAFEAcA8ioVZuB61XWQKKRyGAJxn1gge4fjbrQuK21-drh6y81Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 17:09:18 +0100
Message-ID: <CAFEAcA-keXSuHBN9HVem0yoG5bySo01DH1GtbzNcRjsFcLPU_g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 08/13] hw/misc/tz_mpc.c: Honour the
 BLK_LUT settings in translate
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Ks/e57ugjB1x

On 15 June 2018 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 15 June 2018 at 08:31, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>>> The final part of the Memory Protection Controller we need to
>>> implement is actually using the BLK_LUT data programmed by the
>>> guest to determine whether to block the transaction or not.
>>>
>>> Since this means we now change transaction mappings when
>>> the guest writes to BLK_LUT, we must also call the IOMMU
>>> notifiers at that point.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>>> +        if (newlut & (1 << i)) {
>> Add a comment saying the block is configured as non-secure?

...actually, how about instead having a new variable
   bool block_is_ns = newlut & (1 << i);

and then here and in the later if() having "if (block_is_ns)" ?
I think that clarifies without needing a comment.

thanks
-- PMM
