Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1081743ejb;
        Fri, 17 Mar 2023 10:07:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4503:b0:626:9a1:3731 with SMTP id cw3-20020a056a00450300b0062609a13731mr4158565pfb.7.1679072851118;
        Fri, 17 Mar 2023 10:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679072851; cv=none;
        d=google.com; s=arc-20160816;
        b=TSiHvz8FaFGcehfJvcaqK6MRBv/HTuZpBQDnRB3DqRaZIDU81dWZEY5rkQkYlwudJl
         bZ+lI73b8SZuj3fjBgtV1TSonjxzTf/o9Ljk6VOz6IbEJbfHW0D+7wE76D3QKbD1S3ph
         2/rsfxXrKfYaRGJ+5f0ArE9xF11yGh7dq8sm4gsMzjwv5a2fXvj/S4Eg+xrWqY+oc+70
         L23ibHgg/b2LktWLTLt6M62qS172U02N7gv8li23DC5rkd8LpzzM4+IX//PdfuxHHFKl
         rYB2YspNqKi6+PL/8bupK70FX9C7+7yYlm1suioqs2LCHRQPjel5318vt52gVuCMFXZD
         HVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XP8Q2FI1U9PJPNNWvkZAKAWR8a38tAxxBoCJWVesujc=;
        b=EOTIQJ413Z2gDBK6l0kyl3wdSuCLWpCJCKfjwZFoJtAwD/fSbxhNHAvhCV7JFO4NCC
         TbRFExaUFddBt0zd2tHjdR/dXHtH6/WoHpLzPtxsR1I+p9zb57GgXxIxRn51vEndpWQo
         0zMku2fwT8Qh5oU6hpRZMBQMX6m8rxTpFt7eyuvupsPEyKzR4ghcYwsUZ6BB01pXhrdz
         GNQDlaQFzAbBROS12OJhAv5h2QGg11n6fXi+xhKl4dDRRo205FzN/XywTUqFojHkU0bo
         r3Bt/hAkt+j99Sxdhvvx61vuulOeMzT32dHUWxBWV03iyQH2E66XwpqlzlIxebpBDtHi
         Nllw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uah1eNVp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z190-20020a6365c7000000b0050300ad3e6fsor917218pgb.80.2023.03.17.10.07.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Mar 2023 10:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uah1eNVp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679072850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XP8Q2FI1U9PJPNNWvkZAKAWR8a38tAxxBoCJWVesujc=;
        b=Uah1eNVpm5n38JC5SwvtsZEJXJl9oB5JWpI6gL8dfXJUjb7GCtWZp1cml9ukoav3Kn
         nXuTUUx45ztzILyJlZknso75cQaJvsqeUumBvBwPMrjTPYyqCenVuPuWLc8mTEoDP5TY
         1a3S0wOLMKmeteN30Q1KPOQj8nLUQUGbYj9+cHKFrE/zMHEiqdVdcod7y/3Jt9MYklRx
         EdEwGtocc13qKkhKOjSMOYoxQe2NE+83WOaqoB7rQ3JMFR8vRYxjboSggr35fekpScgd
         2DJx3Oh66RyFw2SyLwMeMJ83Zvw2N9H3hdPgKGL3s6WHpX/YI9LP5d+OP3yb448n1HQ1
         2eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679072850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP8Q2FI1U9PJPNNWvkZAKAWR8a38tAxxBoCJWVesujc=;
        b=d3yF5LgjTLjdVqv4C1t5H0AVoZn6bHDWGeQASxJ8cnqT1PAIxfQZsqUUCrJBgzIZm8
         VdFsSVst3rLLZIqQwHsYFbKx4CT0wfgK5XKbGXIzEsjDjrYB3P8CxdiN0Xr7lkB+BAM9
         XR5JDQpJ5pr/T+B8azPhozS3VKimDXX2YwoP8CVQtizhY22HcWnBW/KgwzPX7RKZiNsg
         W2L+IGX+L6IQwwCw1zVw+4jWvEa/bL79fQcFpJ4HHkSHxukBAjLxaOlTO4lHgxG+8R5n
         baPPbNdTMItkBZdeZwumWzIRzh/4Qq3b6IuALYLKC5PdOUUMTPy9qmjDW/xsgQEH58N2
         5b2A==
X-Gm-Message-State: AO0yUKWZOOWYn6SiMRbnEG4zCN7IA9YOsRAXuJPcYST8xOkg7YOmKF5v
	CEtzkFVPnaS7MhEmQb79foiaHtCA+mWiL7KSERZ4uRsq
X-Google-Smtp-Source: AK7set91JaoAQhC93HH4dnDd5zdv+X5Z1/Kkld/Kkifoo5YfoFvlj57xdPK2jluw+C5LucBDQcjSUsyLqUcr+e+cm2c=
X-Received: by 2002:a65:400c:0:b0:50c:bd0:eb8c with SMTP id
 f12-20020a65400c000000b0050c0bd0eb8cmr918540pgp.6.1679072850499; Fri, 17 Mar
 2023 10:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org> <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org> <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com> <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
 <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com> <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
In-Reply-To: <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:07:18 +0000
Message-ID: <CAFEAcA8gDqrg3Hjv=0P-6m-bHytoHrYRSrrY1anu3gGZuQaL1Q@mail.gmail.com>
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
X-TUID: 6aiAiIpKZf7n

On Fri, 17 Mar 2023 at 16:55, Luis Machado <luis.machado@arm.com> wrote:
> On 3/17/23 16:37, Peter Maydell wrote:
> > Having run into this problem in another couple of situations, one of
> > which involved gdb 10, I think I'm increasingly favouring option
> > 2 here. The affected gdbs seem to be quite widely deployed, and
> > the bug results in crashes even for users who didn't really
> > care about pauth. So I'd rather we didn't release a QEMU 8.0
> > which crashes these affected deployed gdbs.
> >
>
> Are the affected gdb's packaged by distros? If so, a backport the distros can pick up
> will solve this in a quick package update.

Yes, it's exactly because these gdbs are distro-packaged
that I don't want QEMU to make them crash. I think it's
going to take a long time for the fix to go into gdb branches
and gdb to make a point release and distros to pick up that
point release, and in the meantime that's a lot of crashing
gdb bug reports that we're going to have to field.

> If we decide qemu should now emit a different xml for pauth, it will fix the crashes, but it also
> means older gdb's (9/10/11/12) will not be able to backtrace properly through pauth-signed frames.
>
> Maybe that's a reasonable drawback for qemu users?

"No backtrace through pauth frames" is the situation we've
been in ever since we implemented pauth in 2019, so I think
that's fine. It's not regressing something that used to work.

> If someone decides to implement a debugging stub that reports pauth (fast models, for example), it will
> also crash gdb, so I still plan to do the backport anyway.

If you're backporting the fix, you could also backport the
(hopefully tiny) change that says "treat pauth_v2 the same
way we do pauth", and then users with an updated older
gdb will also get working backtraces.

thanks
-- PMM
