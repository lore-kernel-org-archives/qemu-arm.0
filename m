Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6347679njn;
        Mon, 20 Jan 2025 15:52:36 -0800 (PST)
X-Received: by 2002:ac2:4463:0:b0:543:9a61:a2ed with SMTP id 2adb3069b0e04-5439c251e27mr3866043e87.26.1737417155781;
        Mon, 20 Jan 2025 15:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737417155; cv=none;
        d=google.com; s=arc-20240605;
        b=M5NxrOZ32xcKlaaiMAZ2H7LU4yoYzV1T8R3XXTzUbwHen+5kPqBti6Pu7L2guIztZE
         c8Eto8eLZT5FkR8BmygZL8kT3e5OiM2m0jUhfm+JLnp5SV7tNvvEZKg/zouzgFJy01Sx
         5SWymP0Qt3njottmgc35CV5azqNic6e0hsREdbgZ8iae3AXpavOKS0fjZOZN08uJxzCk
         9FiK6Z81j/W2hJdi5PjlM9yMy5yZkL6EVe0TarAl1vFJDDUqK893Db+xWMSGyowv7YKs
         U8dm/sDURUQNdI01yDSdtVERHiSg4gEPzr1hgcR3KooFGjE+tkvB+s4gGecK8DI8pn7a
         2BYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ISEyHJOQ5WFrqtdgAxL81FLvJauks5nM3LBV0hOWqoI=;
        fh=xDb5JU30SbBq30TIkvO66RKTcYGQUbKPbuQbH68yP7Y=;
        b=CYKgrlWj9jS7gcHAPdjYtFurlmKv+YoP6oMteaTgldbiYSk6Jw5zAJL3kFOWP0kZ79
         BCww70xjxa2QihzRhr96nIaoiC46FEN6OarzSOWYEp/w0UzbaNQ568Js0DIHudMxTn+A
         zN7bGUhhrkM2gj1FECSmoJZdfmsVemJ6vsgsislbcEkufTY60qwxkQq6w+JYwYSv1EGd
         voNuCjckb+NUk+ztwChzXWCQro4wsPHlWD7XvrFHPgiWebrhIObmk3tZDeSQl0BT3Znc
         x4g472fNEGlXtBpkvJLznLD403toToF0FYXq3p0Kauh+Fuf1L0iP/9mVajIozpTzK07J
         N/gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="S/hKmmi/";
       spf=pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wuhaotsh@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <wuhaotsh@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-542a8445fafsor850048e87.1.2025.01.20.15.52.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Jan 2025 15:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="S/hKmmi/";
       spf=pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wuhaotsh@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737417154; x=1738021954; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ISEyHJOQ5WFrqtdgAxL81FLvJauks5nM3LBV0hOWqoI=;
        b=S/hKmmi/uZuCrWhLfcknadRMF4Ve25Nmj1FumO2T2JDpo1MQZHsme83bh57RIrST1f
         QheDKevdEwmoGX++DmBbjPXA16uNsuP8C04t0pmiwCz2031ZA6OQV545aIDjnnDs1La2
         A9g4fEHP1P7XsN5R+m5tPIyvwfuQFlX3iNT0hMyO5gUIl4Z9dRrVbP3W4hijcdhUvIdD
         ZNwKMUnUESEIBCpluzmmf5QBRCCg2uBLL8Vu0ohBa/hG2OmljosG9yEfe/eyBNGTn2nM
         bxzL7J5BeK6JIq2AJVlN1RwZySu/Z56OeDx0okDSsaj6n3Evy3BbuOcFE68Kf40qn3+R
         Q7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737417154; x=1738021954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISEyHJOQ5WFrqtdgAxL81FLvJauks5nM3LBV0hOWqoI=;
        b=v+GHwMjNR3ROokN/67WDrBnzNUUKxZyJoP/A5Vaovw76Ra5e4cCOduFL2bOUb93R/W
         +BFUpSi6UOjRkV9MKmuMTUFkZP8HlSpwBpZ+IeA4tsBCPVCeWEKAo8waWXiHA1ndrs/8
         qNtOFbIp2dYJYF1xXK9Zo8Hzu0OWBWKJbjSkCCCDNPtlaL/fi82rUEZgtf1099LIB0wB
         pYR51pV3j7r33JLebFEj3I8reALOzFj6Lfpg/m0XcI9RGJ/Zt4vpaxKJh/ow2PP6mtnQ
         wSlxwHAqqsudwsXNFKWDMyjTNVk3pCGmIWAe31slk2BhR75xiySkYyW4zgbt+kH83mlB
         wDWA==
X-Gm-Message-State: AOJu0YwFa/bcIuR96FY9goRoAzqouE3j7m9n3iUforz2vwObbbk76miU
	aPkjqTWvKXL22FziCahRZf4LEMGyGZadyVtSJxQyYKLUV+hMAExjxIlVj73eLe8427h9G8SN63E
	2LBwxvpxqKz1yW3Q/pE8R0I9Q44kF95EYgjl9dtPrrGx1K28fwg==
X-Gm-Gg: ASbGncsKhd/tf3imXIFePQg1kYndMScVNqg04LThgFNGlw49BNJ3ltufgX0ya14R24g
	DQ6p+TvQBz9qHjNJA5W3NFI/HRCBe6CjBATPfhs6hcmGcV7BnYDVb8lVjZ292n/C4iTa4
X-Google-Smtp-Source: AGHT+IG5y+K2o8vuXjA9PQTTTU2rUpXj6s9DcCjdz7SSqo3B4Vu+GoNK2JBaYoaQB+5jwtm00kjwYHC7UB+AHh+BKGM=
X-Received: by 2002:ac2:4319:0:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-543a4690357mr300953e87.7.1737417154335; Mon, 20 Jan 2025
 15:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20250120150049.3611864-1-alex.bennee@linaro.org>
In-Reply-To: <20250120150049.3611864-1-alex.bennee@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 21 Jan 2025 07:52:22 +0800
X-Gm-Features: AbW1kvZ2xgysIX3NtM9L8XFfWJNWPOnMFDdwlR7-VuSg76CUGqfhYZMD-TjFHvA
Message-ID: <CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, 
	Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000500298062c2bf4c5"
X-TUID: cVBKCqhNPXR5

--000000000000500298062c2bf4c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have you tried that the test can pass with this? If I remember correctly,
interrupt won't trigger properly if not advancing the timer

If the test passes it's probably fine to remove that.

On Mon, Jan 20, 2025 at 11:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:

> Until there are timers enabled the semantics of clock_step_next() will
> fail. Since d524441a36 (system/qtest: properly feedback results of
> clock_[step|set]) we will signal a FAIL if time doesn't advance.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/qtest/npcm7xx_timer-test.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/qtest/npcm7xx_timer-test.c
> b/tests/qtest/npcm7xx_timer-test.c
> index 58f58c2f71..43711049ca 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer
> test_data)
>      int i;
>
>      tim_reset(td);
> -    clock_step_next();
>
>      tim_write_ticr(td, count);
>      tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
> --
> 2.39.5
>
>

--000000000000500298062c2bf4c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have you tried that the test can pass with this? If I reme=
mber correctly, interrupt won&#39;t trigger properly if not advancing the t=
imer<div><br></div><div>If the test passes it&#39;s probably fine to remove=
 that.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2025 at 11:00=E2=80=AFPM =
Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Until there are timers enabled the semantics of clock_step_next(=
) will<br>
fail. Since d524441a36 (system/qtest: properly feedback results of<br>
clock_[step|set]) we will signal a FAIL if time doesn&#39;t advance.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/qtest/npcm7xx_timer-test.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-t=
est.c<br>
index 58f58c2f71..43711049ca 100644<br>
--- a/tests/qtest/npcm7xx_timer-test.c<br>
+++ b/tests/qtest/npcm7xx_timer-test.c<br>
@@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer test_=
data)<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0tim_reset(td);<br>
-=C2=A0 =C2=A0 clock_step_next();<br>
<br>
=C2=A0 =C2=A0 =C2=A0tim_write_ticr(td, count);<br>
=C2=A0 =C2=A0 =C2=A0tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(=
ps));<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div>

--000000000000500298062c2bf4c5--
