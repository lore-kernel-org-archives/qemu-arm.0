Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1054246ejb;
        Fri, 17 Mar 2023 09:37:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:4299:b0:bf:58d1:ce98 with SMTP id o25-20020a056a20429900b000bf58d1ce98mr3712884pzj.23.1679071061349;
        Fri, 17 Mar 2023 09:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679071061; cv=none;
        d=google.com; s=arc-20160816;
        b=W6Dm5+vnrfQGUKrQoiqV6GabN3xBoqAdGaT0YweTkBvnY2h9NvR0arQVURTbXIw+N/
         vLTzyyV6OgOGjgVnB33gX03eku0cp4Jl2zaP6Jt/RsnyyEPR6DRlyYVb+IzWAvz/yAxc
         gXV1zo0822QV9EgZhy/JgaM/vOYIcEUGPTvAs8xHEGRnbnj1Jp3rSCcSSFjZmeudLLNT
         f+4Ltyu9CIYG0HgPOtHspETzSNMhjGb6SEytXSLtvR+ibAY3nyJmLDQ8w1j0WSLp0rHg
         cMY58EKi6hymXf2Uug4kqoV82/0X0/wvsjIQFCU+5B9hoduhQn4oyZDmSI0qkv/aPzQr
         QtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bXjDhVXGMhnumxyVHUzpj0olGsdargOsMsFYmhE4nEk=;
        b=rnB6jus7jVrOu1IUeceP3Fo4IZxkxSSBmaDdV6P/jSP18LInPtohmZwncdCjGAaRyI
         +O/fwEt5M7dzPOvBaG67/pwCXsSCBap4zDIsgrUYS8qRFjxgswso6m9IY0fvN8OetC18
         vA/k6qd5FP+owvwzjglSy9+AmxTjx0LhJGWFxhrUZu3L8qb789xbTh5zQHU6MVl4ad5Z
         JaOordzcnLKLytXPi4AjEwHUFv0N7EAY3VGC9TR4YvS/TN79CLBTVnCGzwpnlanjryt/
         Jj+EzJvi/uN8PA5aW4+RKnmvh2tr6Lb/AWQslSYShWaEmGsuqKVzHZc41BHnNa+GzCbA
         bdGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EAsZfvAc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n184-20020a6327c1000000b0050bd9c8c53fsor1001341pgn.49.2023.03.17.09.37.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Mar 2023 09:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EAsZfvAc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679071061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bXjDhVXGMhnumxyVHUzpj0olGsdargOsMsFYmhE4nEk=;
        b=EAsZfvAcqTW192AqI28UuUCFzeJ/Y1isNdi+8QpeTQV9rN8WhBTt2X/dDDGF3EWXq6
         cai7r2bikB5MKpJjrEHaOh7JLshA4yOpY8jFo+dQN1H9UG1XIWDbZuOoeTGw2AvE5Cv5
         OnZ4M0epayxXujbs32XOfMMrREmJ+dSDXvNBEDlWRwIMBaXbii6ky+zIm6agVq3AseVQ
         tuQod8byxNUuaTBnPULHyha9edEooAuI6D6mxZ76Ov1k+EY6Cd5OsOSkt9grGKqXQLBb
         VJBAX9SLko5acaMYFJvSsYOQp2ummKKZZ1HMGBiNzorxjWKz00kvnhjK5JmevZGNXsBC
         fRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXjDhVXGMhnumxyVHUzpj0olGsdargOsMsFYmhE4nEk=;
        b=xVxnnJYmChamArY+840C7mO9kZfWrwMGbVaKdlRIwn3QAQsFR+G34Kq2lRgTdjkMKf
         WHPYA2yga9MGvADAjxUjyoERYOsubMMFmFyweu9SxQQSDSqiMoSGRWWF2FJ9OAapf16W
         t8mhFO4L+vizCmxJywksWcPkBLxP/VYGtuErljcL6e9VXeFwoY88gj7/GKW/Lp3D9UuE
         oWkszxwDhJxXxUaefUCzAltNP5GEfrHDYUyldCr2uQaRdm3u0BBlXcaO6P9G4R2rD8J3
         8y1Xjxjfz3tUcF/vFMKHIl+9KdCHlQwwgMknNcvXnFVlKEiBZ0Gm3zCrPB+/HSbAbsCB
         8c0w==
X-Gm-Message-State: AO0yUKUDjl9D3GZBFcpsELltsA+q/A49enXUPijTM7nYHaB36VzLHjMw
	qcgfGl5US8KNaj7TwXwNeVfOaXCVTA+dRLYCGdEK+dOi
X-Google-Smtp-Source: AK7set8rCN/moXRSQZiutfvZ8gC+LveEcdQh80LRcFgwNHE9ebfl7xe5nhSJG73LV00oRxPpkc5p9lHEWXDIeLkZ9dk=
X-Received: by 2002:a65:4544:0:b0:4fc:2369:811 with SMTP id
 x4-20020a654544000000b004fc23690811mr2035530pgr.6.1679071060848; Fri, 17 Mar
 2023 09:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org> <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org> <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com> <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
In-Reply-To: <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 16:37:29 +0000
Message-ID: <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Luis Machado <luis.machado@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: w3xkM7d3ZsSm

On Wed, 15 Mar 2023 at 09:51, Luis Machado <luis.machado@arm.com> wrote:
> On 3/13/23 11:44, Luis Machado wrote:
> > On 3/13/23 11:22, Peter Maydell via Gdb wrote:
> >> Luis and I came up with two options:
> >>
> >> (1) leave QEMU outputting the pauth xml as-is, and tell people
> >> whose gdb 12 crashes that they should upgrade to a newer gdb
> >>
> >> (2) make QEMU output the pauth info under a different XML namespace,
> >> and tell people who need backtraces when pauth is enabled
> >> that they should upgrade to a newer gdb
> >>
> >> Neither of these feel great, but on balance I guess 2 is better?
> >>
> >> Luis: I think that rather than doing (2) with a QEMU namespace,
> >> we should define a gdb namespace for this. That makes it clear
> >> that this is still a gdb-upstream-sanctioned way of exposing
> >> the pauth registers.
> >
> > That should be fine as well, and would work to side-step the gdb 12 bug so it doesn't crash.
> >
> > We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and slowly stop using the original
> > "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a compliant pauth_v2.
> >
> > FYI, I've pushed a better documentation for the arm/aarch64 xml descriptions here:
> >
> > https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=d7001b29e9f256dfc60acb481d9df8f91f2ee623
> > https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=e0994165d1b8469dfc27b09b62ac74862d535812

> Just an update on this. I had a chat with Richard Henderson yesterday, and it might actually be easier and more convenient to backport
> fixes to older gdb versions (at least gdb-12 and gdb-11, but gdb-10 and gdb-9 are also affected). This will ensure those won't crash when
> they connect to a qemu that advertises the pauth feature.
>
> It also means we won't need qemu-side changes. My understanding is that we're close to the 8.0.0 release, and the code is already in place.

Having run into this problem in another couple of situations, one of
which involved gdb 10, I think I'm increasingly favouring option
2 here. The affected gdbs seem to be quite widely deployed, and
the bug results in crashes even for users who didn't really
care about pauth. So I'd rather we didn't release a QEMU 8.0
which crashes these affected deployed gdbs.

So:
 (a) if on the gdb side you can define (within the next week) a
suitable new XML name you want QEMU to expose, we can commit a
change to switch to that before we do the 8.0 release
 (b) if that's too tight a timescale, we can commit a patch which
just stops QEMU from exposing the pauth.xml, and we can come up
with a better solution after 8.0 releases

In fact, I think I'm going to submit a patch to do (b) for
now and we can follow up with a patch for (a) if we want.

thanks
-- PMM
