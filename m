Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1924315lfq;
        Mon, 28 Feb 2022 08:49:48 -0800 (PST)
X-Received: by 2002:a0d:f883:0:b0:2d0:ee66:5f97 with SMTP id i125-20020a0df883000000b002d0ee665f97mr20435646ywf.313.1646066988464;
        Mon, 28 Feb 2022 08:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646066988; cv=none;
        d=google.com; s=arc-20160816;
        b=R10DdpmTErUmKgZCUNPu+jytZx9n8JXiEubY5sdALfXk12tOAIT5SGfqCphiOL9FgA
         Rrz017FsXfYir/rdM+jQC24da4kr3s9Fg3JuC7pzRQycyrmVANDelJQjbogeNsudHx7Q
         fn0QShk2CpLVHInZZLnNOe6xXiWWapL5U2zaHLciHJscBVm4JwFQS7hG56dUytaagaYI
         tZi1geQbRkH2VeuDMNYNn0833nQKWC2xRZ7nzHcDr2TepxHccqyZWj0nXgEGcgkZnaaK
         cig//4/r1S7ml2bOvLXUUcxxdcLweKkQlh1ndC2h/Vk1K06uhriIfyKYdJdkuG/pBJsu
         a4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tykO1rWDH4YNWN/cFdBY60978RDlItaxReFrDdZm3F8=;
        b=ODvX3LAkXQJreLe4hwFamDSEQ0D6hy6YdysTS1MHaWujRTs+YnKXjWhXjJ11hXjGiF
         fu+IDIfU67wcBZdGuuYJHzfJCg1HlQyTGVDcO3INQSikZ6QhNlm2BbHXn6p/neB+8jGc
         VeNq3cZjApGt2cTdx/OLKqDVmPvHVFmKQyG7rbmCKzbBvVViSSgIWRUYeAUt6rAs/HMP
         cNGo6z26o+rmkAV+9YAJvyw1Tgl/c3+aSnjFvvqh+EjhUAouNU7o19UYfkZG6B5RXQce
         KW6RZ2kDdTA99qj2xrfgj1h0fLTT4trhZPsgoXxNI+vemxJaKgO9FQeSINpparf85e8T
         29Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TT/pc5lm";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 132-20020a25158a000000b0062441fda5e7sor5293694ybv.149.2022.02.28.08.49.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Feb 2022 08:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TT/pc5lm";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tykO1rWDH4YNWN/cFdBY60978RDlItaxReFrDdZm3F8=;
        b=TT/pc5lmfZkTs+CLYwA5PYNQl8solEau7pDu054bcxIvYKFSLn64PPyWB8/2gFYNtg
         Ewnj//y26Z/fdeK4yxsgI0Z9bXDfGkb52f4tAJuKwad2uK8wvzRHs2urDsBpzSiZ0RhT
         8qUXLPdtNJjj0j6jUmV+t6N8qdUsrpbwJ1bqBt6InFMJBHNtw2ffT5UIwL+XWuQE0MbZ
         YiSEF5KLqWH0CQyEjuYrVYqsVZzuEnrOF2fCtd2aAPjVoVKHTvH1BCmUhEo/ZDsTNx78
         hgnC3E/85ero5YtnBP+lpL0+c8PLsNd7GB4TGWZfAK+6GNKFk78rbLkHfcKQkR3NpRN+
         dqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tykO1rWDH4YNWN/cFdBY60978RDlItaxReFrDdZm3F8=;
        b=0MuEmxXtF0zxvP+svsYR5ypHuFkQqfNWM+Ub5fsGqGezQIn+rBwfTBgFZjz3s6PeCY
         8CVf41suBJv9ARioRDxvp2xIfpviMo42dmy9gNiLoAQ1Ydz6DAHPtkEYLcgqYb/kigq0
         ReWOpS+pZGIolhps5oSk6wwF8pbCBdhVkl5oR0pLMDsOIYDXMYmdjn3xMB7jyX6w9uBc
         zJivITBu3OwfQ9VLgLMszHYeM8JeRJKHfTJMQsKcgb96k0bWFgBIEmz4rgY6sWdHgQXd
         ivRPBHDpmUKbB2L3+xDnvGm6/1ZjVkwiZQEbOtl3vVB0Csqy3PeD00iNtrkwAZBGszKj
         vBAQ==
X-Gm-Message-State: AOAM533SWpYLoZdATaL2zGnMXeEv4d6QSoOoMYD4unCwXXhHH9YxEr1u
	uvYrNUDyEoTdYlIl1gC9GIrMZW6jsbOxFtuyJNgjzXpQksLQUw==
X-Google-Smtp-Source: ABdhPJxGMWOEBCIJnks4Ok53ynwMwvNQbuXWdndKzi8Ijx8j7f6PHY8OKJVo4oVJoi5+SwzMsbnOptgL2xs67WHhfqI=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr19984885ybq.479.1646066988146; Mon, 28
 Feb 2022 08:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-4-alex.bennee@linaro.org> <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
 <87ee3nlz1k.fsf@linaro.org>
In-Reply-To: <87ee3nlz1k.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:49:37 +0000
Message-ID: <CAFEAcA8=33zjv72BYNxdNehtrVgWuUR=9pZJTbdi_JwmHZCLwQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, Thomas Huth <thuth@redhat.com>, 
	berrange@redhat.com, Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, 
	richard.henderson@linaro.org, f4bug@amsat.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, stefanha@redhat.com, 
	crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8dRxuzzXM4/v

On Mon, 28 Feb 2022 at 16:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> We will need an update shortly for some new images.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
> >> ---
> >>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
> >>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
> >>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
> >>  tests/lcitool/libvirt-ci                      | 2 +-
> >>  4 files changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/doc=
ker/dockerfiles/opensuse-leap.docker
> >> index 1b78d8369a..e1ad9434a3 100644
> >> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> >> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> >> @@ -127,8 +127,7 @@ RUN zypper update -y && \
> >>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
> >>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> >>
> >> -RUN pip3 install \
> >> -         meson=3D=3D0.56.0
> >> +RUN pip3 install meson=3D=3D0.56.0
> >
> > Why are these formatting changes to the dockerfiles in this commit ?
>
> The latest lcitool I assume didn't see the need for the continuation
> line. I ran:
>
>   make lcitool-refresh
>
> when I updated.

Oh, I see. If you put something in the commit message along
the lines of

"This commit was automatically generated by running 'make lcitool-refresh'"

that will help reviewers, since the default assumption is
generally that changes are hand-written.

thanks
-- PMM
