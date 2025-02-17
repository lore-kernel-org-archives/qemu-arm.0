Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp77276njb;
        Mon, 17 Feb 2025 06:39:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLXKu5YI7+Yze+60SzBRqfAU9FBt8LZWqx5d/Fq7YlRB8ywLwXKfrkzlcd/4U0DLvryndQGOIZbsTwHw==@linaro.org
X-Received: by 2002:a05:690c:6303:b0:6f9:8b50:bac7 with SMTP id 00721157ae682-6fb58374510mr78984927b3.29.1739803177395;
        Mon, 17 Feb 2025 06:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739803177; cv=none;
        d=google.com; s=arc-20240605;
        b=abh92T1aq/PLkfKs6WUdQmSK/r4ROmAeNauhtbVCjigbhwBSGaR5N1ynO0uBFBm2XW
         Fz6y9ADQKZYv67Wi14ZeGks86va1oIvEouz0VlUhP32z04thvo6jrUJnNEJJ11DKqg2R
         v6UrFLOwoZKpUle9e68qx/yRPy7bR04ma5Gy9v2rB6p/dER4theOa08V+2TpcyTql7Qb
         vnc64mhgyPZqaZOMWw40JEwwE9oowlWdNHf8mNrlLmMrUogMyEg5lMMIVO+7PSmZdCOM
         Df8gC09j40+9XitH7Z6nH3zm/3OxKSOwiWHxlpcI1f7eZYueilSaAW0TnfgH50gp6hsf
         b+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7RfeVFL/7Pgf5C8rBy/PRDnAc2i72PnzzwI+WiTIYms=;
        fh=AqePrEqpA3kV527AuIk8tFfTLIlEkgXE3XZYun/+gv4=;
        b=boK//Bh8F1ve0upvtO5rxi+izKG8qBvgSNIHPBOaNBQEY+C414neCMHFt/ZeV2567E
         hbMixoDALTFE1j4K9a1UhT0dXid91AZJoQJhLw5wig1BZDnD7zU056ADq2QTz1WIVll3
         avng2UFL36pSwKrDWXx3Wt1Iy4hUJsfNaSPMxq6R5aon+tY/HuFS7bdjgWz7voBHqW7o
         CXNt8jBj2nqLQROjeKFV/3HzvYsuQCfqmr4icDNqF/vlZFJAGfBIOZO9Kkb/DudjG0vK
         f9LLXNhN0EYDz19BTbImNjt9lrNSX+vrpbSMLRHUym07QpkbGouOXrPtKfJfTWC958W5
         ps7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMFKQyFT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb35d276e5sor55476217b3.6.2025.02.17.06.39.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMFKQyFT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739803177; x=1740407977; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RfeVFL/7Pgf5C8rBy/PRDnAc2i72PnzzwI+WiTIYms=;
        b=aMFKQyFTxqztgycgU7grcTQfDScthJBi52xq0kZgGMgjdcD6ox8lHkzYVzjOl7mEFG
         bBYgX3fl+sGgGdJdbw0Ogbj6cwDE1VQGsbDlLH9wotatlntSKrveiyHNRAZsdQxGhbOi
         AQk9uQdRssllhyRHGS81+RUNUJ0NdYNlyat60xMfR/h+NZTWu+ufCTXkUarQB3Bo64y6
         KsOeyyP1N0WDZ0Fg8qrDIR0o6ip+tMzL6aXMO80/a4PLC24H/nKaKAndVl6KeUqcT2no
         rE/hXL2WCm5YksLgiQuxLjzJnBxnXEgWicMq9CzATRgog/E/SB+Xb6X5ID7Boffjq5Ma
         IiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803177; x=1740407977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RfeVFL/7Pgf5C8rBy/PRDnAc2i72PnzzwI+WiTIYms=;
        b=grtkcWA3PBPIcnS0FwdKad9MPTr+8bGdHd9uGQWdkoINRPOFqdiZuBAW345GFS5ZVM
         fYMd8ZRyZq71Xt8oaH9MCRerHeyrN06Jrw1r9IzXC9REPU4EV2trCwyumAflqP61+lTk
         wk+arbv2NwEFP5I9CQ7XbTl7NqbfyBOxBbXGI8fbWGx7LLGWzj3Tw752ew5C1zN9moRi
         1O8v36ppIdCHTA/6CcY+vJ/VR+TgwvTXhQBf0fytcBujJarodrn8fwCB4oBjJkieCjml
         dKDaF207u4OaTf6akcfNroRl54L3kwKn9EZd8Drcwe2PzmAPPAaa0QYtGHyk1HBGAa/+
         gvTg==
X-Forwarded-Encrypted: i=1; AJvYcCUFBf/+cUn/cp2iqEm08ylYxbudo2FfYw9JpCzZZBDYgsOL2fdDr3IeZknvt7uchYY6YkiTKp5JmTjrDQ==@linaro.org
X-Gm-Message-State: AOJu0YyG5MyGVcltiqsN/D8WL7yq7h3cFUjVmElDzxHn/ueBNtfklz/V
	Zb5nkdtKD8TsDxlrUEV8LfCGThyc39v8MYYoJhUSY4TJY/71E2Ka7TwWfv3zWwxtc0B+qOgheyQ
	vv5DbQ+sdzO6ysfV24v1/JLvXeCPVbpWBu8WPWhXn
X-Gm-Gg: ASbGnct6iza/+lpHpiYo7+wUoUvgUGHRdbA24h+KSeMiUaENicria5PziU3WUuBvPF9
	WegGzLWAjdIelbglWvUZGOQTPfal1K5ZDiG1Fny5bD4d+G+7pl2fBvh7kGuTTAb6VvgtSWW3Xfw
	==
X-Google-Smtp-Source: AGHT+IGXVSI+MhROu/JHs+t7/bs+/l0JMYC5jDsDKt+onl42dVXRN8dUnMLoxO2J8UMn5QjA0dbgcNkUCThhm1xo1NE=
X-Received: by 2002:a05:6902:2684:b0:e5d:c30f:22ec with SMTP id
 3f1490d57ef6-e5dc900e896mr6436762276.9.1739803177030; Mon, 17 Feb 2025
 06:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-5-philmd@linaro.org>
 <CAFEAcA-tQUL2Rt4Y_eNFxCFXzNXupzQz3qYdEupB6Bb3HFyhfw@mail.gmail.com>
In-Reply-To: <CAFEAcA-tQUL2Rt4Y_eNFxCFXzNXupzQz3qYdEupB6Bb3HFyhfw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:39:25 +0000
X-Gm-Features: AWEUYZkdzG9yLQ6nYHX4IOYClySz87ahHbKy-fvk_EjfzGW3nOgJBUSVgoHuAnk
Message-ID: <CAFEAcA_66f2t2UQv5eKwspDTBs+kfvpGsMPG6f31aqs6FWMx=w@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] hw/char/pl011: Trace FIFO enablement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5Wefm/IuW+RP

On Mon, 17 Feb 2025 at 14:27, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  hw/char/pl011.c      | 4 +++-
> >  hw/char/trace-events | 2 ++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> > index b9c9e5b5983..447f185e2d5 100644
> > --- a/hw/char/pl011.c
> > +++ b/hw/char/pl011.c
> > @@ -148,6 +148,7 @@ static bool pl011_loopback_enabled(PL011State *s)
> >
> >  static bool pl011_is_fifo_enabled(PL011State *s)
> >  {
> > +    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) !=3D 0);
> >      return (s->lcr & LCR_FEN) !=3D 0;
>
> Might be neater having a local variable rather than
> repeating the expression twice.

I'll squash in this tweak:

--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -148,8 +148,10 @@ static bool pl011_loopback_enabled(PL011State *s)

 static bool pl011_is_fifo_enabled(PL011State *s)
 {
-    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) !=3D 0);
-    return (s->lcr & LCR_FEN) !=3D 0;
+    bool enabled =3D (s->lcr & LCR_FEN) !=3D 0;
+
+    trace_pl011_fifo_is_enabled(enabled);
+    return enabled;
 }

 static inline unsigned pl011_get_fifo_depth(PL011State *s)

thanks
-- PMM
