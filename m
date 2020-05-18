Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3102512lfb;
        Mon, 18 May 2020 07:46:26 -0700 (PDT)
X-Received: by 2002:a9d:3f44:: with SMTP id m62mr11879970otc.38.1589813186531;
        Mon, 18 May 2020 07:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589813186; cv=none;
        d=google.com; s=arc-20160816;
        b=iAcvs33nvhKV88kfatrfgr9bwg+my5w2Th1w/913vemME/oXzWnwa5utgwaCpJUjT1
         Vu6d1XGVbOzOnkGKCI/Jc+QP/oMErk0N9L9AtzHaxHcZFTpi6PW/RkShppDkWnLkHUO9
         BGAR1WcOOpsYDD8WBg4QvJkAj8nRAZV/RTOMxFAGmqeDyG153kdu2FyPJ4f0UIaGglZk
         T1sZPYdpz8ZBEBtwMLZly1X7qT93PimErU0tjfkniWZpq9O3NJ8mTindn6t5OrUEKXP7
         I750w5wbqnFiDePBJObiEq2Cc+jREFJGB/sB+YuxFQLEZXr99LzvRa6zdKvpNIL56ciD
         Ux9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yg5Gk3dDviSnJiLkiL3wJMyhIIyqlq1pt8iO8sb2z3M=;
        b=kj7b29UJLwe9b+YE2tBlYtHBhjqBvVgUbH7OXxlYTy2uFN4+M/nSVjBwbYGuN5uJbe
         a1eMCeL0xpsmUyJ+Teo0e3D454v340vtHdcFH8BFkwAwRcJTypIw9pzs7DRT3W8eI9VH
         rSEoB/vHNf0m34X1GAWLxdf+HEYxiDEOxcUhKs50mpmyDlkWdyd/vjcPT6CJk0YS9P0m
         bO8cIPb2KSPQkcBevan+etUswanG8gWO64LgdKXwY5hSmxDzeB8dwd0PQFn0xE97WuSX
         RamcDOLrwqz252VwLbNkOjIIJofO/AfZBThoVQclUEJ2Aww1yZocYGY1PE68+VJSv4Kp
         SgCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MavUC32T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w11sor13730598oog.8.2020.05.18.07.46.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 May 2020 07:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MavUC32T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yg5Gk3dDviSnJiLkiL3wJMyhIIyqlq1pt8iO8sb2z3M=;
        b=MavUC32TMJnMXk96KOjxjiFjv9y3DmwRH+8meCFVBlaBfNk/uJn9MMIupggQdUYp/w
         XkyKi4uvlEl6MSzo74ab1mT3A4ogxIosyVyI9AW6SvzdyEtSQoeWMNKsSGnACIwLhzoF
         dWqe86VCKujMrP6so7p6MstMsI1p8e+YicjYqJOGLOcbzmk/bNKIHWJHDwr9pyQRk/fW
         Oamr9u3T5f4FrFzofWqLuVEPqRV7GTJ0BrkgNoMLK5yJ83pHacIthmMpD3ws1eiycO04
         bhI51K7Pgloi1dp18aFintEcGUveQYWaSZzbzK50aZJszWdPubuJe/cYpt4xnk0GOho6
         NGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yg5Gk3dDviSnJiLkiL3wJMyhIIyqlq1pt8iO8sb2z3M=;
        b=BnrGga/9EStdcm38eAMfpm74wcxOvGsI++1NyiXuVZFQbWO+kCZNuHNfy8uCBhpiXz
         HWRnD/bpB1eDB0707SmKqP9dHDMTmX71wdufDvxTPVD2arciT04U0iob2OAL8TRLzYxj
         mJccanyrQkJj2wB2JE/mWA/rRcBzAK+DSo158pn6f27c6EszAesnlp/Ngqun3LUQNCnX
         3mriDEqYx0CI0JoKAtH5RDABxGdllHcOiwsZfE3WIeSV/ayjByN7Z9U69gxEvoHVlTg/
         mNhcu7I/9S/vvb7p49YFcwwUwDjJL1Z+ei2XLOfoGLXqWQ79v8i5CcJ37nOIwvCyKx92
         31Qg==
X-Gm-Message-State: AOAM532QtOxxI4+AtLXS3HN+hX+31BZxfW9Uqx3KNVt4zGy517H8ZU6Z
	Ekw34brox+hXesse5llQXTmdg8L8D6N35Mi99nznHMuV
X-Google-Smtp-Source: ABdhPJzSJUIDY0tuP5fZZX7BjSgprqLVb98gvRNXDQLbiwMH/OXQQO3SZOergSTsIhVECQ8sDRzp7bz04mP5nv3N6oM=
X-Received: by 2002:a4a:3556:: with SMTP id w22mr13049640oog.20.1589813186025;
 Mon, 18 May 2020 07:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200312194219.24406-1-richard.henderson@linaro.org>
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 15:46:14 +0100
Message-ID: <CAFEAcA-3YYciv1VZZdeYZOZYAgaRrTvPj6kHUbBv06-0otoGdw@mail.gmail.com>
Subject: Re: [PATCH v6 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: uzDCLtSqjYW9

On Thu, 12 Mar 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> I've done quite a lot of reorg since v5, so much so that I've dropped
> most of the review tags that had been given.
>
> There are a couple of major improvements to note:
>
> * The effective ATA bit is in hflags, noting whether access to the
>   allocation tags is enabled by the OS.  This is moderately expensive
>   to compute, so it's better to hold on to that.  This allows trivial
>   inlining of some of the operations.
>
> * Updates for SVE, and thus
>
> Based-on: <20200311064420.30606-1-richard.henderson@linaro.org>
> ("target/arm: sve load/store improvements")

For clarity, given this is now 2 months old I'm just going to drop
it from my to-review queue on the assumption that you'll do a
rebase-and-resend at some point now the prereq patchset is in master.

thanks
-- PMM
