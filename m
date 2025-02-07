Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp282873njb;
        Fri, 7 Feb 2025 07:46:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWx0tKEX5lGlJUY4MzQgXPNWoCLQzan7IEH3eLwI+O9NxnzavmTt8Jpgu3dJ9zc48H2EP/hSqas+Y89fA==@linaro.org
X-Received: by 2002:a05:6902:118c:b0:e58:173e:abcc with SMTP id 3f1490d57ef6-e5b46172804mr3264420276.8.1738943164513;
        Fri, 07 Feb 2025 07:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738943164; cv=none;
        d=google.com; s=arc-20240605;
        b=dKqm/RvcptoijqjJVT/GdQRTKW2Nrup2oQuS70JsdaPu+LIJpHtmzN4Sx0j+ZlvV9+
         w87d+IfuIQQ/Hsma8FHfWhOZECi6o/sEmEI2ocRIPXamQq0HySzpibOQIXvFFAHrR0Eq
         gLb/hRX5Q2wpEW2bRBHNvWxtxkZS+WR39UzwvKmkefDN4TR0BBEHsWRyGIdxfgwL6kcU
         AB9M28Rhc7LTABMkoA7tf4fKHTQ/p1gjgJUm1yNkUkEjQvn3MJt8an4VXE/7xTn7NKB+
         mUQg72UiUEdMh15vWQFszomit/1Y8YPTIKqRFW5OcUvLQCThXfmHMubaPP6kcA9XhFkH
         ZByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8qHfuiv8szYGuQBfQUNagT+/VtxVwpzCJYe+xzLSfJI=;
        fh=hpfgwij0vuYi2coRxGbZw6gYJsDVsqHnru6+fobuxGc=;
        b=fcOUiuaShpq7SrfaxQ3KivdBvJxlG2ZM+1rtmRItqhcZiAw+wiz6NQtZevxy91v4ow
         nhcUn0s9g0trWg/MvK8yQt+lM+hqNcpouTvVwo38xSHA+3QJ3vSTH5ZOihqQSNwbvLR/
         VHGF1xbfPEWEminM8UOzLzvYHoWKFekkajPS9xVSO8qZ6trYx0FHC+BLsAolgoyduyuS
         CUjg3ieM8lGW2ol6xuiR77ER1/K6stbJy4jRiwZ2rYGKM6+4KCR5c1vTcf3ItLTQsjj0
         83t4fXZGXjTtVkFeVXtHh+tQ14zaq6oh1tOiMSxXTe6w7j0pwcplQhqOf2me+upRdUth
         DfTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoCvtSbU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b3a4637d5sor1967714276.16.2025.02.07.07.46.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 07:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoCvtSbU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943164; x=1739547964; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qHfuiv8szYGuQBfQUNagT+/VtxVwpzCJYe+xzLSfJI=;
        b=IoCvtSbUw6KNQ1vmHJjgsBFKhGRksLnIho/paYDKfdDH0xu0uFxqrK4iNGut/Q3fFd
         7WLOdBNuqJOb22OSWynckbZdH4iyoeiDQtqLkuvaECrxcL6kWfSpDQDE+smScQs+FAzt
         vdlnuYg3ES719y1mZWzZONrsRJqCmatkX9HFKbN7knkdfah9/nCFU4YaPidZztVB6zre
         yClpGMbPfv8cvtOuIQyjhnZZz1MXf2Efj5qyS+cGEJDIuzmD3xDNSWkgx6dNqwgx2+ug
         GRnqFUUynkL80FYU1yMdgJFrGwQe3h5Ncj3qaMeHsbmfBoREREHJvXzuievGYMOaKLgO
         uFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943164; x=1739547964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qHfuiv8szYGuQBfQUNagT+/VtxVwpzCJYe+xzLSfJI=;
        b=fSCcARiJA4zwEYLD0/t8ZpBkJQgPmoKlBNHgt8gQTNVVIB1f0AXcq55okHKulS8c1X
         iTHOnCYHTvW1giQeJVnCQyybM9pD8OgPKQJ93G+8fJhfcQzxhzIEtzX99L+1ELfUNsXT
         /XbMLuvsgNK2r/8RcabCv7vjxNPeumAZYOczhBrYEhlCpHWjPKiRs8XrDhLVPJCbmv/E
         ETCrswjl7KrP6mEcNqAIdSHZ8SFLR647P4//DG5VVNN13vE5005N50mwKDcWglfiSkL4
         pnUI7ay1JFllvXK9RYfLFlJYhU5XIFIK3X3wtjEOPY88+GHc9n0SbA8UFH33Pkg9OF5y
         zB6g==
X-Forwarded-Encrypted: i=1; AJvYcCV370EeTs7S0mShQGXlZDo5NtVLQ0KzXLhZ3YuVTuMvSCH7A10xBftXMHo1lUrB4hgEfEjNQwYEkBeXGQ==@linaro.org
X-Gm-Message-State: AOJu0YxfnVlwVJGTrlalzvFrqGVbiiID6+YW0eUmz0aSv1+NBPSinJod
	b+6AKrc6ZqeHOasJ6+6w/nqyyTJzAY3b9SXdzwW5hQmUbqIo4iGqbd1uE2QxVdj5gSR8gUMKaXS
	U7/W19TNpsFUBtNPD6Mdjq5pCumJDE+3fGsrJAS4D
X-Gm-Gg: ASbGncs8op+myXe/iXGaaq5o8Wi9xXp2ww7TQ2VY0rh6V8+1bYuf2odj1jYknE3BhM+
	GocmcDwHGaWoTm2GzO5LHw0UrTf9Gid5YLukAyjaSgE0Jcl5ghZYOgsSVC40cUoyeevHOCfGKVw
	==
X-Google-Smtp-Source: AGHT+IG96PO/WT4Y1iZvBDavJypKJGCuobMLX37Y8etZTCazGr9wNy9osAjN4dIa4/vXxIH3quCxdfD9G9IncTROsOk=
X-Received: by 2002:a05:6902:1249:b0:e5b:248a:bf2f with SMTP id
 3f1490d57ef6-e5b4626c51cmr3228852276.31.1738943164092; Fri, 07 Feb 2025
 07:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401> <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
 <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401> <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
 <20240820113024.53tmzejw2omm6bbx@flugou-latitude5401> <CAFEAcA9X0w5QW2qnnhF2k72ZrS8SALWiXV7uNr1e=jQnZvrQ7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9X0w5QW2qnnhF2k72ZrS8SALWiXV7uNr1e=jQnZvrQ7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 15:45:51 +0000
X-Gm-Features: AWEUYZkJW5JQOCs7l_XTcs6Ajx6AeMqHFF_9wUObdj7LlibeladJiY8WEkVxmnI
Message-ID: <CAFEAcA-MrouAPdwpsyojMC-bx4aFtuL=tYZD=2pBS1vP5iicaw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: qemu-devel@nongnu.org
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Florian Lugou <florian.lugou@provenrun.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RVZ3KRl9JGV1

On Thu, 6 Feb 2025 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 20 Aug 2024 at 12:30, Florian Lugou <florian.lugou@provenrun.com> wrote:
> >
> > > > $ aarch64-none-elf-gcc -ffreestanding -nostdlib -T qemu/tests/tcg/aarch64/system/kernel.ld -o test test.S
> > > >
> > > > $ qemu-system-aarch64 \
> > > >         -machine virt,secure=on,gic-version=3 \
> > > >         -cpu cortex-a57 \
> > > >         -kernel test \
> > > >         -display none \
> > > >         -semihosting
> > > >
> > > > $ # Exits after ~1s
> > > >
> > > > $ qemu-system-aarch64 \
> > > >         -machine virt,secure=on,gic-version=3 \
> > > >         -cpu cortex-a57 \
> > > >         -kernel test \
> > > >         -display none \
> > > >         -semihosting \
> > > >         -icount shift=0,sleep=off
> > > >
> > > > ... (hangs until QEMU is killed)

> Somebody else reported a similar issue to this to me this week,
> which reminded me of a different bug that we'd found and fixed
> in the interim, which was enough of a hint that I figured out
> why this wasn't reproducible for me.
>
> This bug only reproduces if your QEMU binary isn't compiled
> with slirp support (which will happen if your host system
> doesn't have libslirp-dev or libslirp-devel installed).
> If slirp is present then the usermode networking backend
> will be present and it always has an active timer. Without
> slirp, the problem manifests when there are no active timers.
>
> You can also repro it on a with-slirp compile by adding
> "-net none" to the command line.
>
> I'll have a look at what the underlying bug is... thanks again
> for the handy test case.

So I've looked at this, and I can see *why* it hangs, but
it looks like a structural problem with icount, which I'm
not super familiar with. Richard, Alex, any suggestions?

The sequence of events is that the test case sets up the
timer with an expiry in the future, enables interrupts,
and then executes a WFI insn. What's supposed to happen is
that the interrupt fires and the test case exits.

In helper_wfi, we set cs->halted and do a cpu_loop_exit(),
so the WFI definitely goes to sleep.

We do fire the timer's callback:
#0  arm_gt_stimer_cb (opaque=0x55870482d670) at ../../target/arm/helper.c:2962
#1  0x00005587013c3c86 in timerlist_run_timers
(timer_list=0x5587042f5950) at ../../util/qemu-timer.c:566
#2  0x00005587013c3d3c in qemu_clock_run_timers
(type=QEMU_CLOCK_VIRTUAL) at ../../util/qemu-timer.c:580
#3  0x0000558701102f4c in icount_notify_aio_contexts () at
../../accel/tcg/tcg-accel-ops-icount.c:73
#4  0x0000558701102faf in icount_handle_deadline () at
../../accel/tcg/tcg-accel-ops-icount.c:88
#5  0x0000558701103ac9 in rr_cpu_thread_fn (arg=0x55870482d670) at
../../accel/tcg/tcg-accel-ops-rr.c:234

and the timer count is correct for the timer expiry, so
this part is OK.

First the arm generic timer code reprograms the QEMU timer
(for an expiry at INT64_MAX, ie "far far future")
by calling timer_mod_ns(). timer_mod_ns() ends up calling
timerlist_rearm(), which calls icount_start_warp_timer().

This is where things go wrong -- icount_start_warp_timer()
notices that all CPU threads are currently idle, and
decides it needs to warp the timer forwards to the
next deadline, which is at the end of time -- INT64_MAX.

But once timer_mod_ns() returns, the generic timer code
is going to raise an interrupt (this goes through the GIC
code and comes back into the CPU which calls cpu_interrupt()),
so we don't want to warp the timer at all. The clock should
stay exactly at the value it has and the CPU is going to
have more work to do.

How is this supposed to work? Shouldn't we only be doing
the "start moving the icount forward to the next deadline"
once we've completed all the "run timers and AIO stuff" that
icount_handle_deadline() triggers, not randomly in the middle
of that when this timer callback or some other one might do
something to trigger an interrupt?

If the arm_gt_stimer_cb() was written in the other order,
so that it first raised the interrupt and then modified
the QEMU timer second, this would happen to work, because
raising the interrupt sets cpu->interrupt_request, which
means that arm_cpu_has_work() returns true, so when
icount_start_warp_timer() calls all_cpu_threads_idle() it
returns false and icount_start_warp_timer() returns without
doing anything. But I don't think there's any reason why
timer callbacks should be obliged to reprogram their timers
last, and in any case you can imagine scenarios where there
are multiple timer callbacks for different timers and it's
only the second timer that raises an interrupt...

thanks
-- PMM
