Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1351523wrp;
        Wed, 25 Sep 2019 15:10:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+YMsnpzwDPPxijCX+OhPG+XwiEg4rATV6zR+LO+xDOVQ3mbR9oTX1WRYDROWiPpz+mTmz
X-Received: by 2002:a5d:88c5:: with SMTP id i5mr194766iol.273.1569449445286;
        Wed, 25 Sep 2019 15:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569449445; cv=none;
        d=google.com; s=arc-20160816;
        b=E27MA+6idIdlAXJulCgZZbno8Os6i3sDaiCMwcY8rgmqb6dWfZ7HYaIYcQTBxN6WrY
         hjh0iCYNZcofQtkeIKdWqvCpYcwh9qoeZTIPDFktE106C2GYmwhdesv7T2H3HLcG+YfT
         UkGAAnp28I2iNuWhmawpC9vC7FnrMeVPzxzcW3EB3JKTR5nmR3W2I2YyD1AtZbuw2f4l
         poZoJyQpez0P3mhcBeoL3bxCMPOCl3P6RKYzfSIXzDFBG0fVBSnEZoXHAHWLSqdyWBum
         T96vJWBYBmPT/gotYellrVUPmSnBMBNBNm6aPRej0LnVD9N+ZupQ7779S7BSWENX1Pmz
         9m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=UUldIwW+IHzGQP9Y2UQxG8YyUqwLyaABNWdBtl6rL9o=;
        b=omE3rKEKi1SHDdAe7sYsMdCySlJeXGvc7g+vbebFTkVAginU0DF1VNK6O1crGbElA+
         HuPRQ1y41uOVCNyaQTl6kMyar+8tpoYL4mnXpPUkvUc5TibI0p64CSAv3uDzlGdxjBJ3
         Ig92/xBgn4qeS3IqQjjCuDa7w2gEfU1bYjqXkEUClAE1+LSDTlmj3SUVqSmDJoFy3QsD
         JhK3vs6q/OfuzGYgbrZxCCPgKfpzTWESU4Qp+jmoMFz8tVZ1Q4zV6i2J+WPUAj2+UViX
         RDfAzRtG8xY2pC4DLk+lt9CH1y68zzpvXmSOj0Tc/Qk6AZgSWJhySODa9LNPxPPljRQR
         PXfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pmathieu@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pmathieu@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pmathieu@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m18si429891ioh.95.2019.09.25.15.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pmathieu@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pmathieu@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pmathieu@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B7413CBC1
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 22:10:44 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id 190so139076wme.4
        for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 15:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UUldIwW+IHzGQP9Y2UQxG8YyUqwLyaABNWdBtl6rL9o=;
        b=tcnJWN3PObl6clgctfYfYNaIlkcshv0JuhkAYMk7AxRzwYjlqj7M171VqhiRuoFNjZ
         A0G+jj+xQj4OBsf1edsRkMv4TV3l+akSIqQegt5flQ6fD4Z2FTek5Rovm4cdoJMompT6
         4Bgmh1uPpnqHCm223SbBD6RDoYSMt/9wEEUCsnhwb6Pgq1uM7B1Roqr+GM6pPoyBaJd8
         vIk4uu9QB4687oZ0XBhejLhO6/N9LLYspRiWbZJFzMZZdxO+a4uNcLqbgjY9WZJDiZAJ
         F5ivZBAsUsP1zc7Nw6mFDqLfTpEdE4DJlLF6wOe2zdwU6TwaEWOwziKRMJMnr457ZvMs
         d2+w==
X-Gm-Message-State: APjAAAWJqg56cx4+XlYxD7QLDl2jDBvsGbFcjBa4sbzGUxKZSsMSCAcL
	pRULvsKnNYQ1nkjzz3xG0oZTJKeilb25EZ6kRB4dJait7ltY/xgJxqahslND51KnJLCp35JF8Ac
	GNsCaHZ4KAOMHd9GPiiw2Y3L04cn2M6tz
X-Received: by 2002:adf:f00b:: with SMTP id j11mr351487wro.298.1569449442673;
        Wed, 25 Sep 2019 15:10:42 -0700 (PDT)
X-Received: by 2002:adf:f00b:: with SMTP id j11mr351475wro.298.1569449442462;
 Wed, 25 Sep 2019 15:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-18-alex.bennee@linaro.org> <e90a11b4-5f68-79ba-b865-7ba9fef128df@redhat.com>
In-Reply-To: <e90a11b4-5f68-79ba-b865-7ba9fef128df@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 26 Sep 2019 00:10:31 +0200
Message-ID: <CAP+75-X7Z4SfzXV3JGL+JvJi3iYTHVRVpYF-TGztF3WjKSn9bA@mail.gmail.com>
Subject: Re: [PATCH v3 17/33] tests/tcg: clean-up some comments after the de-tangling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uYvYrblkaKaG

On Thu, Sep 26, 2019 at 12:07 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 9/24/19 11:00 PM, Alex Benn=C3=A9e wrote:
> > These were missed in the recent de-tangling so have been updated to be
> > more actuate. I've also built up ARM_TESTS in a manner similar to
> > AARCH64_TESTS for better consistency.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  tests/tcg/Makefile.target         |  7 +++++--
> >  tests/tcg/aarch64/Makefile.target |  3 ++-
> >  tests/tcg/arm/Makefile.target     | 15 ++++++++-------
> >  3 files changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> > index 8808beaf74b..679eb56bd37 100644
> > --- a/tests/tcg/Makefile.target
> > +++ b/tests/tcg/Makefile.target
> > @@ -74,8 +74,11 @@ TIMEOUT=3D15
> >  endif
> >
> >  ifdef CONFIG_USER_ONLY
> > -# The order we include is important. We include multiarch, base arch
> > -# and finally arch if it's not the same as base arch.
> > +# The order we include is important. We include multiarch first and
> > +# then the target. If there are common tests shared between
> > +# sub-targets (e.g. ARM & AArch64) then it is up to
> > +# $(TARGET_NAME)/Makefile.target to include the common parent
> > +# architecture in its VPATH.
> >  -include $(SRC_PATH)/tests/tcg/multiarch/Makefile.target
> >  -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
> >
> > diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Make=
file.target
> > index e763dd9da37..9758f89f905 100644
> > --- a/tests/tcg/aarch64/Makefile.target
> > +++ b/tests/tcg/aarch64/Makefile.target
> > @@ -8,7 +8,7 @@ VPATH                 +=3D $(ARM_SRC)
> >  AARCH64_SRC=3D$(SRC_PATH)/tests/tcg/aarch64
> >  VPATH                +=3D $(AARCH64_SRC)
> >
> > -# we don't build any other ARM test
> > +# Float-convert Tests
> >  AARCH64_TESTS=3Dfcvt
> >
> >  fcvt: LDFLAGS+=3D-lm
> > @@ -17,6 +17,7 @@ run-fcvt: fcvt
> >       $(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
> >       $(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
> >
> > +# Pauth Tests
> >  AARCH64_TESTS +=3D pauth-1 pauth-2
> >  run-pauth-%: QEMU_OPTS +=3D -cpu max
> >
> > diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.tar=
get
> > index aa4e4e3782c..7347d3d0adb 100644
> > --- a/tests/tcg/arm/Makefile.target
> > +++ b/tests/tcg/arm/Makefile.target
> > @@ -8,25 +8,26 @@ ARM_SRC=3D$(SRC_PATH)/tests/tcg/arm
> >  # Set search path for all sources
> >  VPATH                +=3D $(ARM_SRC)
> >
> > -ARM_TESTS=3Dhello-arm test-arm-iwmmxt
> > -
> > -TESTS +=3D $(ARM_TESTS) fcvt
> > -
> > +# Basic Hello World
> > +ARM_TESTS =3D hello-arm
> >  hello-arm: CFLAGS+=3D-marm -ffreestanding
> >  hello-arm: LDFLAGS+=3D-nostdlib
> >
> > +# IWMXT floating point extensions
> > +ARM_TESTS +=3D test-arm-iwmmxt
> >  test-arm-iwmmxt: CFLAGS+=3D-marm -march=3Diwmmxt -mabi=3Daapcs -mfpu=
=3Dfpv4-sp-d16
> >  test-arm-iwmmxt: test-arm-iwmmxt.S
> >       $(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> >
> > -ifeq ($(TARGET_NAME), arm)
> > +# Float-convert Tests
> > +ARM_TESTS +=3D fcvt
> >  fcvt: LDFLAGS+=3D-lm
> >  # fcvt: CFLAGS+=3D-march=3Darmv8.2-a+fp16 -mfpu=3Dneon-fp-armv8
> > -
> >  run-fcvt: fcvt
> >       $(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
> >       $(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
> > -endif
> > +
> > +TESTS +=3D $(ARM_TESTS)
> >
> >  # On ARM Linux only supports 4k pages
> >  EXTRA_RUNS+=3Drun-test-mmap-4096
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> (via make run-tcg-tests-arm-softmmu)

Err I meant 'make run-tcg-tests-arm-linux-user' ;)
