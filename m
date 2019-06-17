Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2593265wrg;
        Mon, 17 Jun 2019 07:52:17 -0700 (PDT)
X-Received: by 2002:a05:6830:1250:: with SMTP id s16mr470927otp.158.1560783137463;
        Mon, 17 Jun 2019 07:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560783137; cv=none;
        d=google.com; s=arc-20160816;
        b=I6/CL3t3ccTJFk4XB+EIWwGv5BOscYCdxOx09KnruuhJAXO1lHdfsRJHN9zAN/uNaD
         Gy+n/aT0AxhM6srktitevHNxkGTelkwIBHiK0S8H1TUb4QS0xv2RDVDM2aSqI5iXKwpW
         gn1xgEtFrEcB/Oc65GvvoSPATHjqMR8UjIjkBvA7TdA1VSkaPtkm5fgGNAoaNH+FuXw3
         dG9twTELBFuElyDeiKXmoZqmHg1ur+JENF/0ZugGcgBOTI5SCMCo0tuHScZBHyRz0Rvy
         NaEhNGprqimj6HN6vD/JNymOByknK7DZE17uBR51UcqI9vj/Cx4PBwcf7hQXasANZCpA
         Gz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJZR1Az/4V69kQygQp+9DMhkA03qEndikj3JJAFD+6U=;
        b=bcC2nB4efDtqZodlI0teidGDckZgvvbMvr8i667QqwVUhbLBSaum1kn3/Ya8ipqA79
         HBa4YID59iXAyUakj+yJHDMvaqxCk/wv5TzYZ5U9b6aFlrYBm1tqLSqzdby6pc7ACq+T
         k1RqMLYJ5X4oRLIc3jeiLO7ujrbdU8iKSda98PuAIVYln6EdQefqeNFeweOdW+zJpqqb
         GEGiPaEOVOmxZAb5oOO8XpFT3218gtnX69K7I6RgM0prXwb81onRBrU3VEEaXpuVitcC
         FwvEQ/RTBDZemyX4RtQ8Z//d1EvHZZ0HmnkvfWVAPZ6mNpZM2cQpUWO0a/rtVpK76BmS
         Xx6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lH50E6tW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i195sor3788171oib.37.2019.06.17.07.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 07:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lH50E6tW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QJZR1Az/4V69kQygQp+9DMhkA03qEndikj3JJAFD+6U=;
        b=lH50E6tWEvW7O1JnG0iKdOE4POA9mQil+6E4ZeO8VEzo28yuPihqSZaCblVoFNxBq4
         4aWpeLEAY4sqJzinvLAuyyRlpKutcArQca6TNn2EXFhTyBvK0JCwrOU3eu5j4ElXKCfM
         LfCBrEP4zI9VBvUMMPtCTI/kZpRNnWIGu5YsYAiRLjYr00l3wY2P6ZrVhPBvnLcfDpRG
         kpsGdjZuY81a8srfHszh2x78e479+OpWoBukJTlw03JqJ5vrMQjSoLbx/SGFLDKrgPiJ
         JvuR4XXr0x2CztuUEbq1F0hq1kPPH29dcfEWRJLfY5rKGX71ohWn0vqNe0IqDMyZNhL3
         TOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QJZR1Az/4V69kQygQp+9DMhkA03qEndikj3JJAFD+6U=;
        b=CKXlSPbJCGxCKibPgCx+JKOzER0Ya47pm5CVAxTKBcTdpVdJN26khevIgvnyYIggoO
         /wiaX23VZB8EznSv8wje5tG22XlXP1NE9737sBmHpyT5B9W0nwbz6p+1beEBo+M3U/NL
         Lg6OnQuX+/U0hTFe7mMO0AIhoJ/TDBkbDujcVMjenYLHfcAl1XPkDhpbb3AZB/gb8/Cc
         6xX8SV4bnpaf/60p1mRQnN5ppOj96Sl7NNb39xmLuwXlotcEjP7tXg88QwyRWWEUU9sh
         33LgwT0YUj51jVuOx/R8plPjx0o3FfwhAAt+9rLOX+m4qK74bvgp+EyEsvo1FZlKsnvn
         PeMg==
X-Gm-Message-State: APjAAAX5SzrNBrd7B146v+bwD8+VAYVshq209pgyisxMKvM/mNRS8wc5
	mRvDsm/F+ezdSprEARRAWQmxE0Vo6er5vVyNvRhpOtLOu/jLrg==
X-Google-Smtp-Source: APXvYqyh4oqRnWa1TDP75Wpicn3TAEw4pvR4VUGNApwJUO6lZGb9WdDek4PWJFuCym4FnH1eLh6/u/6CEoqSlbRnSCY=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr10102300oie.48.1560783136786;
 Mon, 17 Jun 2019 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-19-philmd@redhat.com>
 <87h88o9svq.fsf@zen.linaroharston>
In-Reply-To: <87h88o9svq.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 15:52:05 +0100
Message-ID: <CAFEAcA8t7EYC6PK24oHcsGsD7PazuqCzGcLuwiMmh2C4dKJF2A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 18/23] target/arm: Move CPU state dumping
 routines to helper.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Samuel Ortiz <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: sQNQTv5WDPWj

On Mon, 17 Jun 2019 at 15:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Hmm so helper is a mix of non-TCG and TCG bits whereas helper-a64.c is
> basically just TCG helpers. It makes me wonder if we are breaking a
> convention here as helper.c is traditionally only TCG helpers.

The original convention was:
 * op_helper.c has functions which need access to things which
   TCG puts in specific registers and which are accessed from
   C via gcc "register variables" (most notably the CPU env pointer)
 * helper.c has functions which don't need access to the register
   variables (a mishmash of stuff, usually including interrupt/exception
   handling)
 * some targets further split out some parts of the C code into other
   foo-helper.c files
This distinction became entirely moot when we reworked the TCG code
to no longer use register variables (but instead pass in the env
pointer and so on directly as a function argument). You can still
see the comments at the top of target/i386/{op_helper,helper}.c that
claim this is what the files are for, though :-)

So these days there is really no fixed convention, except that
when we've added new things we've sometimes put them in their
own .c file. helper-a64.c in particular is on its own because it's
code that's only compiled into aarch64-softmmu, not arm-softmmu.

> It feels like there should be different file that is unambiguously used
> for both TCG and KVM based workloads where things like the cpu dump code
> can live.

Some sort of split like this seems like a good idea. I don't
know if any of the other target archs have already got a
good convention/naming scheme we could copy?

thanks
-- PMM
