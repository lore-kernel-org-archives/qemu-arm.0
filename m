Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp559269lff;
        Thu, 17 Jun 2021 06:47:56 -0700 (PDT)
X-Received: by 2002:a05:6402:214:: with SMTP id t20mr6760971edv.20.1623937676813;
        Thu, 17 Jun 2021 06:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623937676; cv=none;
        d=google.com; s=arc-20160816;
        b=gxoP8Rfqb5x7zNLsMoQ774D6pA6xGOFxTNDO6Ir1le1YDUX1mdKZZiIPNgtRf+iqud
         sWDdDYlJi0hBAcwCU2OoF2WY7m+OkPhf+cb9bfA6m1XTPhijM+QODJkdy7tPHkbOeW1o
         Z9GhxhmbXM69UQVIdy1OSmPAJJskZcyJOeX5LFnc6q3L/wVoyjR/QVUclLAkj8hr6yiD
         b/eKiees7UmOwJkusb7bYH2eRcpSzE651mwd+aqTUS0VYMDCjBZNiSiyy4xMJQcKYds2
         7C/pF+FtQCWwT49PwRNv2CWlRzL6236co9h2JtYE5rZZKkOgBa9ARCwYjd8Dg/pmdnZX
         tZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pg/2E0TUjGXLACtewWDG7dJgOojq+eLznTHhtoCT9Rc=;
        b=ueqr54rZhoqH/E4HFpGkXFw4tNcz2Td1o0bblgxI4/e21Gx1LU2ub/ZNGQqVWQBZac
         uzhG9880tm2fF3sTa9j0zxBGRr3OFcS14CA/W/dZGWCYrd/zZg899b01pSHogalC0PPs
         bbqPhWXI+DQQUYqzUG/L6WBtHqKHtbLsoTUnSCN8MWu9mustk83K5IvfSqrHneJe9k7F
         /nQGbSbud8AAoj+UKqLaOx6kjOvSmjUL3Rai1ppa7ZLxwh9t6+1b5Spu8jtckyKYPT3Q
         ttzBow8Q6mZQOeu/cOy2xpJy/VDAhbs6bG0HpUpX2vA8wi3syksO+Zd7ZVn8VSDATKDv
         ktwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q32JsHCO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y3sor3387239ejd.5.2021.06.17.06.47.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Jun 2021 06:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q32JsHCO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pg/2E0TUjGXLACtewWDG7dJgOojq+eLznTHhtoCT9Rc=;
        b=q32JsHCO6KJGfShO655DMzSfGuLc10HjA4UUBeogM/TeJxfiyagvGXyEvakQHRdQQQ
         djdzpoIaJKbQ4qFibk1lMiThwXhGUCuuJojuo76UQYToCoJBsGmPqwrSu8lf5wjqDC/D
         zaslXloihF3aWoQtF3RJlLHAzCFTyHQIuEDWT/pthX8r4mHti87vcclQEzgvvPmsWm8k
         IdIv0BrvhMGSvFipHn1HBke+uyztF4IK9+wlQJVZ7TxYXpBeVPsVv3c8mSLaaOWLnqYo
         94//6DmRHbf18lsWJekgqHY3LO+ioNpgFqXPTbXJ76HGg1w/pnRNsrvo8Jnpy4I2ZEfI
         QiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pg/2E0TUjGXLACtewWDG7dJgOojq+eLznTHhtoCT9Rc=;
        b=HWB4IiC9JWD+xHWh+pnTGV21Kbl4HtuwigrqLfsY8zIAy6RA170t7LnXyQlU5B9/1B
         x5PUkx2fE5ZmbIKQgWQYfVA1GP9LH076ZILsqtfZBxkdyS30J+sigjuIsgZxqYFe34fy
         HGPv/hKy7FqDNOf+fosVfDxyu4y8vyuxSlIO9bQfgj7wWD8oYz9bSNwJ4X8QoPzRgZxX
         zzaknr7A8iwg97U0luu1BgZ5nDQcvOdOBeYsK8VAcvh2bA9WJ0fWltSQdwDh11tPS7VQ
         kpRHai//z2LSU/rm1VaQCx894OoYcaxoa+nonMxp5fh+3+5XGDKq6tbIaNaIWZyKLlPV
         pkbA==
X-Gm-Message-State: AOAM533succgHb24oVhO7o7VH9zLIAn+HCzvuQKNhcZXgoEUbc5OCmSq
	CizZm5Ycfl4vMLEiqjSPytarMh0DTWCZhxeLGRHKcRHqM7qAGQ==
X-Google-Smtp-Source: ABdhPJxxwmpXLccpL4ypNSSFXwyHdpe/xRDLHWKZ98XZuCq4xcqU2p7vOhrQ3On0KB0W1s1Jvs4xF1f/uCIAJiFxqGE=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6541051edt.100.1623937676555;
 Thu, 17 Jun 2021 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-2-peter.maydell@linaro.org> <8918d342-4e17-e5f0-e18b-ae39b17cffac@suse.de>
In-Reply-To: <8918d342-4e17-e5f0-e18b-ae39b17cffac@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 14:47:21 +0100
Message-ID: <CAFEAcA_V_=-q1bjVEu4mX-NGBgH=Bq3GdDAcBxEFQ8gJHW9dLA@mail.gmail.com>
Subject: Re: [PATCH v3 01/44] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Alex Bennee <alex.bennee@linaro.org>, 
	Liang Yan <lyan@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IOWPWUJmYODk

On Thu, 17 Jun 2021 at 14:30, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 6/17/21 2:15 PM, Peter Maydell wrote:
> > Implement the forms of the MVE VLDR and VSTR insns which perform
> > non-widening loads of bytes, halfwords or words from memory into
> > vector elements of the same width (encodings T5, T6, T7).
>
> This is if I understand correctly, M-Profile only, and thus TCG-only right?

Yes.

> >
> > (At the moment we know for MVE and M-profile in general that
> > vfp_access_check() can never return false, but we include the
> > conventional return-true-on-failure check for consistency
> > with non-M-profile translation code.)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > +/* Values for M-profile PSR.ECI for MVE insns */
> > +enum MVEECIState {
> > +    ECI_NONE = 0, /* No completed beats */
> > +    ECI_A0 = 1, /* Completed: A0 */
> > +    ECI_A0A1 = 2, /* Completed: A0, A1 */
> > +    /* 3 is reserved */
> > +    ECI_A0A1A2 = 4, /* Completed: A0, A1, A2 */
> > +    ECI_A0A1A2B0 = 5, /* Completed: A0, A1, A2, B0 */
> > +    /* All other values reserved */
> > +};
> > +
>
> I wonder if this should be in a MVE-specific header,

For an enum definition, it doesn't seem worthwhile. internals.h
is generally for "stuff target/arm wants that other parts of the
system don't need".

> and I also wonder, when looking at code using things like ECI_A0,
>
> what about MVE_ECI_NONE , MVE_ECI_A0, ... - would help the reader connect code containing these enums with the MVE feature?

You'll only see them if you're looking at MVE code in the first place...

thanks
-- PMM
