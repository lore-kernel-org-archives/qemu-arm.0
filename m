Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1920054njc;
        Mon, 24 Feb 2025 06:52:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxbIPSFJZVbwz6qbIhCr7HxRn6bl6o6rbNoMSA7YmB9+V6udScRpaBDxrtHNW6K6XFGRfv52iBvsUfPA==@linaro.org
X-Received: by 2002:a05:690c:25ca:b0:6ef:8c41:defc with SMTP id 00721157ae682-6fbcc77df64mr119566997b3.11.1740408770070;
        Mon, 24 Feb 2025 06:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740408770; cv=none;
        d=google.com; s=arc-20240605;
        b=IJx8eL8cx2GL8KP0uKmZVYwUgRGCKJgOgNxMvuXvK1w1FyKdSEtessW1Tos07XCruD
         6INqCFEl+EMsSBZ9S0UBx+galcuLT5Itsczyuc3k8EGvN2bGjYkYdkyyUYlXNv14ObAx
         1Qhe2c5HulKOawjHfL3HuDm4xZfXt6cGigOWjQa8Z+69dyQmhz6qDtHGE60uAXoYgwpm
         gbPaCEZqqY7csYEvuTVUWKB5XD4gmzvVCkRiMRzPOhGXFREIoRczqSwO+hsc/lESGqOR
         e2jSKwqGyYC/U3AW7yH7FFQooMdycOamRuzFoPU2lE26C6g1hmhrF5j4hxy26mlV0BAS
         vx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CCVwFU30iRIVDUkhO8+T1DaSlcaCUl6Lrdm8AEwgjvM=;
        fh=oNP7bj1WlFxPYoL243KUhb7wa6VhwRLHaUldDxgLxCM=;
        b=PhxipNYa1MYgaZ+pqizn70m3qYko4mD6DMjSTX/bGSgcddZgw+GfUeV4bGcoTg6VD1
         Oh7ICSqRJmLXuqn2TWWMqXMMBsVeDXwY9YXH9SfWqbwP57ARlxEdXCB8tweEFgrGIkgW
         ZYsklh3uCXhfd0jOrDNw1b3DFBwtdzK9gzaQ8vUBi9EQ9N17PQBuvlOpQBfJneCaKgOj
         uocFqkGUbcnbi6R3x4/KE9VBiDmlPvmyPtI2YBZk8FihfpfzS2sLpZ2FryjkuAv2KSHc
         ER+sjNyrNcvwldnihKlIbUqMu363i16Tvmg7r7zLLxtmYcl3bR9lCDYjOH/6h/dq6azS
         GMKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF1uUO1b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb36179616sor159152877b3.16.2025.02.24.06.52.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Feb 2025 06:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF1uUO1b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740408769; x=1741013569; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCVwFU30iRIVDUkhO8+T1DaSlcaCUl6Lrdm8AEwgjvM=;
        b=BF1uUO1bEbhua2KWYbkNEPGi+klrKWl+cBNGSPVoFRqpp5hNAcWwwukL1OqwsmcWJY
         UFqzxL15QVis4CoWXEzrLxp5PWsRvYvSqxK2aZbokKKSWvqGZguXlsdirkopqfp5Yc6h
         xte2MzqVW4Xe0TqqM+x8RgcSIcfyOePIJ69MpN24GwCX9t1zxSYokqm3AA3Y3FfHEnlH
         dWJAzTasLqV6MLbZeYuDpMxIW3GItSRuWRZQgSCXYb4boZRix+gxbvS4jQOls3l/Ez//
         HlWrstrjexAPqfEZg13AncgrQi1RDx7L/oPhIGbxMSTAXNIlhJU+j5YwHOoc3YoS/A0L
         6FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408769; x=1741013569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCVwFU30iRIVDUkhO8+T1DaSlcaCUl6Lrdm8AEwgjvM=;
        b=HyPMEpjU8uQONPHnEyX1db8UbNUwYtuxwBGj/rkTfVhu5QKIewL7YR2U6KP38A//Gx
         f+2Vjx9PDKHhpNMtts5PG6CVdLhnHcP0d0kdwhk9iZjz7QnvtSWceSs4T1eaNB3s1Mbt
         DcN5Ue33EQq6xT2U+1xaJmm/X35RDmQYC7ieyErl0+Y0PBiv736P9Sv7pzsg+gSB8eZP
         YHv5piMvKCfiG9Lqr53v3lB/SEa8nG9Sm6kCS3YUt3Xmc+I98+gP+jD6/l0AtWHoOhd2
         d+DN3nwH2iSDuyrmajr00yC41eqvCUZK0MX9j5k3MKxqiSwojQOrXF+JGvpzBjGCGM8z
         FaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUNMtV+rkBDa7Y+84kUuwe/gtCZNtA7z4QRUuo+ckJWXjS2Hd+gEbIa8eIgrJdqZnNlLh8eE4eTY2bdg==@linaro.org
X-Gm-Message-State: AOJu0YzyYz9n1DJ88cYk4CDdblxNQ6Qj7wcd86yN2D37kVVRgbQr2fvi
	50hKcZ1uA2Rb6a7+/ZbAP3PQ0INbRBK7lc4KAZbamwM/rxdwYEcpaSSL8jKdFp4jcy0o9DVEU/y
	ybMLpYFDQb2nwkay6PdV+eYVLKY8oFOfl6kEBJVeB
X-Gm-Gg: ASbGncs7wLj9iAcP1z+BGLfQwlWqg1/6ibAWaVfNgLVjkHoevTQ76T6WqEzelV+vm2C
	j+/3QkuMBlMw5H6kGQ5Zh9MDE0lTtVb8VCxHw8jvmymoauhIGqAOh63XMh4V99YsOCCUSErQYel
	M9R8izzHRN
X-Google-Smtp-Source: AGHT+IGJ7//z/viz6CX9wR+A/D7zOKGUa8JHhsNi9AAn39cZTjnPkyDlqv3tL6vJfuAFl3VN5kTc6H3ny6F6VeuI0Vk=
X-Received: by 2002:a05:690c:6a12:b0:6ef:5097:5daa with SMTP id
 00721157ae682-6fbcc856ce4mr114955077b3.34.1740408769655; Mon, 24 Feb 2025
 06:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
In-Reply-To: <20250210135804.3526943-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2025 14:52:37 +0000
X-Gm-Features: AWEUYZkP0tpN-ueTrtqF1asomW7jXOP8tBH0MmuW-H8alHZx7JaGuMcnTIAf0Ks
Message-ID: <CAFEAcA-SbHjBu8xo8Uy11n2N22LtUejARHC7w8ucu24kg15Xog@mail.gmail.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: p7zx93ylVmB2

This has been reviewed, but nobody's picked it up. Paolo,
MAINTAINERS says qemu-timer.c is part of your "Main loop"
responsibilities. Did you want to pick it up? Or I could
throw it in to target-arm.next if you prefer.

thanks
-- PMM

On Mon, 10 Feb 2025 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we call icount_start_warp_timer() from timerlist_rearm().
> This produces incorrect behaviour, because timerlist_rearm() is
> called, for instance, when a timer callback modifies its timer.  We
> cannot decide here to warp the timer forwards to the next timer
> deadline merely because all_cpu_threads_idle() is true, because the
> timer callback we were called from (or some other callback later in
> the list of callbacks being invoked) may be about to raise a CPU
> interrupt and move a CPU from idle to ready.5A
>
> The only valid place to choose to warp the timer forward is from the
> main loop, when we know we have no outstanding IO or timer callbacks
> that might be about to wake up a CPU.
>
> For Arm guests, this bug was mostly latent until the refactoring
> commit f6fc36deef6abc ("target/arm/helper: Implement
> CNTHCTL_EL2.CNT[VP]MASK"), which exposed it because it refactored a
> timer callback so that it happened to call timer_mod() first and
> raise the interrupt second, when it had previously raised the
> interrupt first and called timer_mod() afterwards.
>
> This call seems to have originally derived from the
> pre-record-and-replay icount code, which (as of e.g.  commit
> db1a49726c3c in 2010) in this location did a call to
> qemu_notify_event(), necessary to get the icount code in the vCPU
> round-robin thread to stop and recalculate the icount deadline when a
> timer was reprogrammed from the IO thread.  In current QEMU,
> everything is done on the vCPU thread when we are in icount mode, so
> there's no need to try to notify another thread here.
>
> I suspect that the other reason why this call was doing icount timer
> warping is that it pre-dates commit efab87cf79077a from 2015, which
> added a call to icount_start_warp_timer() to main_loop_wait().  Once
> the call in timerlist_rearm() has been removed, if the timer
> callbacks don't cause any CPU to be woken up then we will end up
> calling icount_start_warp_timer() from main_loop_wait() when the rr
> main loop code calls rr_wait_io_event().
>
> Remove the incorrect call from timerlist_rearm().
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As far as I can tell, this is the right thing, and it fixes the
> "icount warps the timer when it should not" bug I'm trying to
> address, but I'm not super familiar with the icount subsystem or its
> evolution, so it's possible I've accidentally broken some other setup
> here.  This does pass the tcg, functional and avocado tests,
> including the record-and-replay ones.  I've cc'd it to stable as a
> bugfix, but it definitely merits careful review first.
> ---
>  util/qemu-timer.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index 0e8a453eaa1..af6e1787e57 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -409,10 +409,6 @@ static bool timer_mod_ns_locked(QEMUTimerList *timer_list,
>
>  static void timerlist_rearm(QEMUTimerList *timer_list)
>  {
> -    /* Interrupt execution to force deadline recalculation.  */
> -    if (icount_enabled() && timer_list->clock->type == QEMU_CLOCK_VIRTUAL) {
> -        icount_start_warp_timer();
> -    }
>      timerlist_notify(timer_list);
>  }
>
> --
> 2.34.1
