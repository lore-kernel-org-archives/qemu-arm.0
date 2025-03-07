Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2084288njm;
        Fri, 7 Mar 2025 02:36:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8i5UgDzGg5IMcBijGN7uwNQ5QtK8+KX5zKXRp2ThdedZsicgD5Y/FeR/ptkSlQTCNH05sGHR1RZBuEA==@linaro.org
X-Received: by 2002:a05:6902:230d:b0:e60:a70b:23c9 with SMTP id 3f1490d57ef6-e635c1dc656mr3147386276.32.1741343780067;
        Fri, 07 Mar 2025 02:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741343780; cv=none;
        d=google.com; s=arc-20240605;
        b=AwTLJ/3l+Vai0tp6j9ItCOni6XrwP5ADM2B9qYgyNC5ZRZuyVuXLygdpS1U218RV8M
         SB41d3r0bKjv3qqELqbTIMNnwOm/eiNz2jKSm1mdCcwliou8ml/XHeJY6gtm9IQRMGyE
         JeZJPN1/nltsNPe7W19LFJk4l2ceDqzVG+03toW6p/Qi7Do8qnhsg8XYNRBFAFr0wv+H
         qrFYuywsdJvjwGOb2EyouCL78/HgzdELqzTeMH+tLt5+QmDWxMYQ8k5eLXZuY31CSf2S
         ANT1fI1HzixPR+WwlfRz2bgS4smbbR/71M0qNLMrlzRrHVVTaVdCil6I4TuzeE8M1Rjk
         kmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kLmPuTPkxAyKDm7E12J+r9WbRuBKoTnv4o0hMexvlcw=;
        fh=SPGLGHHFhI4D+FiwIPvNMYs7hREY3MSatZ6H02KYT6s=;
        b=kVBLv+hxbpH5A2bpIFazTC3KxNuoYdqA4c01CR8ZBCJIi0V15XFZGHC+PTdIlmjpbe
         EXdIgio4ZU6LEDn0jPWMj2wfatHwpj+FEvVvFZZOUDE+NfXCcy1Fv1Rp4+mf3jyeIk+0
         5t8/9djixDKzhxEdKbCGbiSdUcjzty2/uN2qp35DDOTTJ+NRlqgJPfWjucFVzn4LrC3C
         PH+1+zT2WgyTJUcNCO7S7MhNPDYWR53I0F3jmZo6lxz9j4xjcDLF1SAaPLDKvN1TCpu6
         sjmHX0OoMhQ8XsOGxQ0CWp3pl3iR3KwgClamdvz6Ae904TXUkwe2Mz/10SKCD1oAVs0h
         2QOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0EduUV7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e634b841f75sor1845939276.4.2025.03.07.02.36.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Mar 2025 02:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0EduUV7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343779; x=1741948579; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLmPuTPkxAyKDm7E12J+r9WbRuBKoTnv4o0hMexvlcw=;
        b=W0EduUV7wE+oTGWFnG/3uYXnQB8eOJvJ82KKXCP9ZxKyrJHhFcmJhp9vktruVAnyS8
         27vqg9JaP8Ja3Is3KbyGtSbP5Aenl2z0dZzaggJP2ephEEQW/CHTQGB6YJDb6YN2OoBE
         Yp9Ya3JG1axyPCJJpxSUT7jv+pbxrtWUSRQG6R6C6YpNU7q5lHq+KBQOFyNaYmPaAs6K
         LIaDVU5DL9JDM0zPev6M7hBnLFhZV6ir3lJSAzEXFLnPsQvul+E443bt84FvpEzJHSRv
         fqqGPGktSyw79BoFprWArpwe+LGf0/waez4Z2ccXMti0W9z6G6YLWUeA8GPeoMhwsxB3
         xhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343779; x=1741948579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLmPuTPkxAyKDm7E12J+r9WbRuBKoTnv4o0hMexvlcw=;
        b=jMVHw9IfltvXBfcyekSYJbjAMn0bGbnmANli7fY1kbUDtfIWbkRoR9IZVTpTpyHbPP
         5PBXftDqN1o6mS0rkyJvOBP+0kfpPowblOgq8COIeYGecD2i6QGbp3WdbujpyTWxA0Yf
         NoK2offm6DPlETBx2lulhTuDe8QTGcWAZaJgWgjtXeZ5x2NAkGuky/xkPLv9wK6nqRiY
         zzBxVgYolu3kM5US6Q6G0q4REawOgffiaJk8GA6lhqk94asAyLV6lt8FNsXP9y8dOhyV
         VksLiEW8c27CdoXNAI+jAqLYQpMuhQdzEKcKBT8ERuId7bpODMNxR6BxIyDevF1KvKQb
         TnbA==
X-Forwarded-Encrypted: i=1; AJvYcCUnNyxzhw/lzr1p10ezMV4p2o7WqBh4aQZsfafzu0nb6AlGfLJCM8ZkGxFSC9n51OR0zjkoHbKX/a6eEA==@linaro.org
X-Gm-Message-State: AOJu0YxkFPVlzQs1NeZYHh6jnendJqoUdNMYKVXMXxdb4WhRP73ajSAD
	xDExYxgY4c7xWx5iFHlcVQWHKPcxlRrxo1ZoEOEmo4Y/aBX47Rkf7y3S9SPpkovTp2UKyjqEQpZ
	KxmgEF0lXAs9+oa7cWo6OnIz5fs1C4ERXCETWzK+I
X-Gm-Gg: ASbGnctcy0gE26nfhwNrc3U/XCUUzALhCKnN+y4+ODHD9ZtQR368+izUE9R+s2QTeHk
	vVb0IuCY+mESn+5glPLl5bX6mP2gZc60Y4iAWnAjYiZpKPleGLLhU1XoAmo3ykoczCvg9+4EBxD
	fhJzaoEPYx/PnBsEKm5iyjsJin36s=
X-Google-Smtp-Source: AGHT+IEILKnMGvhXjFsl3Bp43vgXKpMYnA4edCIZqUOoUUYmzaBni70MZckDojlxOOtk2kUuSJmV+1FDTYAxhd5rSJ0=
X-Received: by 2002:a05:6902:33c3:b0:e60:97b9:5a96 with SMTP id
 3f1490d57ef6-e635c100616mr3061783276.1.1741343779628; Fri, 07 Mar 2025
 02:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20250210135804.3526943-1-peter.maydell@linaro.org> <CAFEAcA-SbHjBu8xo8Uy11n2N22LtUejARHC7w8ucu24kg15Xog@mail.gmail.com>
In-Reply-To: <CAFEAcA-SbHjBu8xo8Uy11n2N22LtUejARHC7w8ucu24kg15Xog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Mar 2025 10:36:08 +0000
X-Gm-Features: AQ5f1JoDA8Lw4OZdJgZwY9LksjpWrxU_IS5SPdObcl1E2VzQed9-Gjfno-pr_-A
Message-ID: <CAFEAcA_bL-OR=RNvnWokjoz05AAM1d-eCjG_YtE=_s-LdcHMZw@mail.gmail.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: L8n+k27nG+O6

In the absence of any objections, I'm putting this into
target-arm.next.

thanks
-- PMM

On Mon, 24 Feb 2025 at 14:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This has been reviewed, but nobody's picked it up. Paolo,
> MAINTAINERS says qemu-timer.c is part of your "Main loop"
> responsibilities. Did you want to pick it up? Or I could
> throw it in to target-arm.next if you prefer.
>
> thanks
> -- PMM
>
> On Mon, 10 Feb 2025 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Currently we call icount_start_warp_timer() from timerlist_rearm().
> > This produces incorrect behaviour, because timerlist_rearm() is
> > called, for instance, when a timer callback modifies its timer.  We
> > cannot decide here to warp the timer forwards to the next timer
> > deadline merely because all_cpu_threads_idle() is true, because the
> > timer callback we were called from (or some other callback later in
> > the list of callbacks being invoked) may be about to raise a CPU
> > interrupt and move a CPU from idle to ready.5A
> >
> > The only valid place to choose to warp the timer forward is from the
> > main loop, when we know we have no outstanding IO or timer callbacks
> > that might be about to wake up a CPU.
> >
> > For Arm guests, this bug was mostly latent until the refactoring
> > commit f6fc36deef6abc ("target/arm/helper: Implement
> > CNTHCTL_EL2.CNT[VP]MASK"), which exposed it because it refactored a
> > timer callback so that it happened to call timer_mod() first and
> > raise the interrupt second, when it had previously raised the
> > interrupt first and called timer_mod() afterwards.
> >
> > This call seems to have originally derived from the
> > pre-record-and-replay icount code, which (as of e.g.  commit
> > db1a49726c3c in 2010) in this location did a call to
> > qemu_notify_event(), necessary to get the icount code in the vCPU
> > round-robin thread to stop and recalculate the icount deadline when a
> > timer was reprogrammed from the IO thread.  In current QEMU,
> > everything is done on the vCPU thread when we are in icount mode, so
> > there's no need to try to notify another thread here.
> >
> > I suspect that the other reason why this call was doing icount timer
> > warping is that it pre-dates commit efab87cf79077a from 2015, which
> > added a call to icount_start_warp_timer() to main_loop_wait().  Once
> > the call in timerlist_rearm() has been removed, if the timer
> > callbacks don't cause any CPU to be woken up then we will end up
> > calling icount_start_warp_timer() from main_loop_wait() when the rr
> > main loop code calls rr_wait_io_event().
> >
> > Remove the incorrect call from timerlist_rearm().
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > As far as I can tell, this is the right thing, and it fixes the
> > "icount warps the timer when it should not" bug I'm trying to
> > address, but I'm not super familiar with the icount subsystem or its
> > evolution, so it's possible I've accidentally broken some other setup
> > here.  This does pass the tcg, functional and avocado tests,
> > including the record-and-replay ones.  I've cc'd it to stable as a
> > bugfix, but it definitely merits careful review first.
> > ---
> >  util/qemu-timer.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> > index 0e8a453eaa1..af6e1787e57 100644
> > --- a/util/qemu-timer.c
> > +++ b/util/qemu-timer.c
> > @@ -409,10 +409,6 @@ static bool timer_mod_ns_locked(QEMUTimerList *timer_list,
> >
> >  static void timerlist_rearm(QEMUTimerList *timer_list)
> >  {
> > -    /* Interrupt execution to force deadline recalculation.  */
> > -    if (icount_enabled() && timer_list->clock->type == QEMU_CLOCK_VIRTUAL) {
> > -        icount_start_warp_timer();
> > -    }
> >      timerlist_notify(timer_list);
> >  }
> >
> > --
> > 2.34.1
