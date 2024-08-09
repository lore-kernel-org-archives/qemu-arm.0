Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp19928njh;
        Fri, 9 Aug 2024 12:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvPYb81mxizftq5VbHRneL8uezT6Amfw5ag5vE1Z8Xn4cJtdNVS/VUvXfugjnf7yRloKDEgxWYCrdmRDRQ5P07lt7LTE/t
X-Received: by 2002:a05:600c:3b98:b0:427:ab29:30cf with SMTP id 5b1f17b1804b1-429c3a17143mr19402075e9.4.1723231731586;
        Fri, 09 Aug 2024 12:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723231731; cv=none;
        d=google.com; s=arc-20160816;
        b=E5jWsgYROEePXzRpWFQQAt1kfgMSis3LvGqotCp7wc+VBVuf0o5dDyGIS98ISZKVGw
         SGHGLRQG0fksUB8awGdOyPpGm0X4RCA758ALg6Ymtn+rHTA7rRaW2whcupc56Bp9vVPS
         ghIHrFb2SalpxU8P6JZAAfzrUyZOlHRUHBzI+VDwO4udF1O7zuJBu2lkX18RiDGlYbrc
         XB0SNPw8b5ZCbNkAZ4eAsVOJCvKlTGMB5DNt1psXacpz7o7bwcabqCfnE04nYOEskgdh
         IG11jH3V7WCspcYnTto+mXB+E0CXWYviP8O6CIIJ3Hlt94+KfMKMwRm8x8g5aKurLQik
         clAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CfqI07Mq5XGJm324B949qGeZKcnG6wqL+yz7+BuRvb0=;
        fh=eCRVdmrW3gP5fVx7x2PTNnelMvW5zgfZsgHNHx/foIs=;
        b=pHWjYgXu61mOWE+eJ1951JtZ/u+hRlgLDcnMSyUn/CcD/ZgJ/LPAruiRQ7LrZpP543
         DH5wP+v6ykuYI9X0pqKYNILFnhs3XweFCShN+8pB0PUSZmiKJTYrsnTAL9ftHQpo4laW
         aKlFXGmgxL7QXB/TIPu7c9md4goF6SFhel6vTF587Y5uDF2XiU01MedaUfWhosZNgn39
         klcd1Wlet36SvS9EOLrVyMwbKfz0G+HdyKJtR331KHPj4Sn/sN9sAzw0OaRBElYttxzc
         gU4lT1FAWj5Y3iZ8IoH0mDQCXmgHNQ+AzjER29ZcbYeGSpga9AoIEeDbAcdVRjFx2Fn+
         l0zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QM0NEL4j;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36e4c8414a8sor49065f8f.4.2024.08.09.12.28.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2024 12:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QM0NEL4j;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723231731; x=1723836531; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfqI07Mq5XGJm324B949qGeZKcnG6wqL+yz7+BuRvb0=;
        b=QM0NEL4jaU39I6mFwX8zs3H9pUMWjmr+F8VnAlIbpymYdKq9B4EZFJ3jv/nU2uQc1I
         VzTAQTNfEf9OjzpEsQecPS0JV+DoCVjy+UIGi2FCuPEZ3EZnS1qGtewlDm5XeYUvLGt/
         BatpGbdWlcI1+GBD+w3BnE38Y4G70xmQn9sak/b3PPAZd8mdyTbFE4eNHFZRMW5p/FI0
         bG+IIExBEihaz9gsBuL7Hpc3nKf0a5xx/WzukNGMXPtSR3AxmrlCLaTtRkw5139+BLZH
         nreyeKXqAblqnciaIUl1ZnVVc63vdoeDk9erGWhHF4YSnMBgEAIz6OmDZAGp6w2izKDq
         oGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723231731; x=1723836531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfqI07Mq5XGJm324B949qGeZKcnG6wqL+yz7+BuRvb0=;
        b=MtglDGBjlKYrUfCE9XGLlIDZFsysXI7AVDseuelErxLc33B79feTQ2S53JUY45foAs
         LYurF+jPy8tUnJzE0cj7KPDqESInBKhOz9IPPArxCEmh8nPtCeGBtwKc5aP2QwRM8NCO
         LwubCjzenNe77rcN4HbacbF3fzJAX4MJ84nfszJ3OXCqS9MZe3+73JJX+4dy8VHYLkUg
         Pn34oOq1ZMc0Ph2z6eWtK+qgSBFCGhOkjLh7QotbdFOLS+HxTrTUFPxspz+Ajc34+4Md
         rrh8abxLjuVfPvVd7vos5GKL3Yh9D+WvpfaN2/4dTpF/pHA5JnuysQ8ySyABr9QHTSTn
         M2jw==
X-Forwarded-Encrypted: i=1; AJvYcCUWBCn5o3EqCgbJTjLxGQcsn/bfBvqM9urCPD9Ul3Te8xmZJGIlAJMkitPijc3JNmtDfoPNOBPRj2GGpPq6qcuhF7vT/Zgq
X-Gm-Message-State: AOJu0YyjYGQxAzHaumL1RlGfFk0azod9wjTgSwDfR3aw6iLBs0kS6GmW
	zerYJbBZXcGIiodmgwRuHJ9vw+YDF5xasgCzUX2V6Eb+ytbd+W10OzQB6pqt4Dp/6OS58fzlCQH
	3AbJ4HAXfW6x5ER9Nbpa1+bg5x/6IKl7QvkU8hbKoySG4DUbyjS7A
X-Google-Smtp-Source: AGHT+IGw6E/Puw/l6sN8kmtdImn36GWYnoUi1j8CyNpJvJwjGTwHh6vnHHHz5g0qbwsHnfNDui5LAE3BSjkFNBnZ11s=
X-Received: by 2002:a05:6000:b02:b0:367:89b0:f58a with SMTP id
 ffacd0b85a97d-36d6053e7e8mr1629737f8f.58.1723231730731; Fri, 09 Aug 2024
 12:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com> <96cc6b27-751c-4420-b661-871a09aaf316@redhat.com>
In-Reply-To: <96cc6b27-751c-4420-b661-871a09aaf316@redhat.com>
From: Octavian Purdila <tavip@google.com>
Date: Fri, 9 Aug 2024 12:28:39 -0700
Message-ID: <CAGWr4cThLpkCA-hC2gf_cViX5dRGe7F-KFcFGepHsYZf0QVuOg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	stefanst@google.com, alex.bennee@linaro.org, thuth@redhat.com, 
	peter.maydell@linaro.org, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	berrange@redhat.com, philmd@linaro.org, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FQ2Z3CI4Rgrd

On Thu, Aug 8, 2024 at 11:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 8/8/24 23:56, John Snow wrote:
> > I haven't read the rest of this series; I'm chiming in solely from the
> > build/python maintainer angle. Do we *always* need pysvd, no matter how
> > QEMU was configured? Adding it to the meson line here is a very big ham=
mer.
>
> In general I'd agree, though for a 7.5 kB package with no other
> dependencies I'm willing to make an exception.
>
> The alternative would be pretty complex:
>
> - check if pysvd is installed in the host
>
> - check if a machine type that needs pysvd is enabled, defaulting to y
> or n depending on the previous step and --enable-download
>
> - use that to decide between doing nothing, installing pysvd or erroring =
out
>
> - pass the availability of pysvd to Kconfig
>
> - use that to make the final determination on whether to enable those
> machine types that use pysvd
>
> This is quite obviously overengineered compared to the alternative.
>
> Another possibility is to ship the generated file, skip regeneration if
> pysvd is not installed (on the host), and not touch pythondeps.toml at
> all.  Whether shipping a generated file is acceptable should be decided
> by Peter as ARM maintainer, personally I would go the way that Octavian
> is going already and I'm mentioning the rest only for completeness and
> education.
>
> However...
>
> > We also need to provide a way for pysvd to be available offline; some
> > packages are available via distro libs and if this package is available
> > for every distro we officially support, that's sufficient (but requires
> > updates to our various docker and VM test configuration files to add th=
e
> > new dependency). Otherwise, like we do for meson, we need to vendor the
> > wheel in the tree so offline tarball builds will continue to work.
> >
> > It looks like pysvd is a pure python package with no dependencies, so i=
t
> > should be OK to vendor it in qemu.git/python/wheels/ - look at
> > qemu.git/python/scripts/vendor.py and consider updating and running thi=
s
> > script.
>
> ... this is indeed correct.  It's not hard and it helps building on
> older distros.  Future versions of Debian or Fedora might package pysvd,
> but right now it's not included anywhere
> (https://repology.org/project/python:pysvd/history).
>
> > That said, you might be the first person I've seen outside of Paolo and
> > I to brave mucking around with the python build venv. You deserve a
> > bravery sticker :)
>
> It's not that bad, come on. :)  But yeah, I'm positively surprised by
> the effort to include pysvd in the virtual environment, and any
> suggestions to improve the documentation and discoverability of the venv
> setup are welcome.  I'm curious whether you figured it out yourself or
> found https://www.qemu.org/docs/master/devel/build-system.html.
>

A combination of reading the docs above and looking at how things are
done for other packages (meson, sphinx). It really was
straightforward.

> One thing I heard from others is that pythondeps.toml looks "too much
> like" a fringe standard Python feature that no one has heard about.  In
> some sense that's a great compliment, but I can see how it can be a bit
> disconcerting.
>

Now that you mentioned it I can see how people might think that :) But
the build system docs are pretty clear IMO.
