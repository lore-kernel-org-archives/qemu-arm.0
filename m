Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7db5ef658sm20916966b.42.2025.02.10.11.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:46:21 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0A6995F8CF;
	Mon, 10 Feb 2025 19:46:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
In-Reply-To: <20250210135804.3526943-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Mon, 10 Feb 2025 13:58:04 +0000")
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 10 Feb 2025 19:46:20 +0000
Message-ID: <87ikphr3ar.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BWOAz8yMaJ1U

Peter Maydell <peter.maydell@linaro.org> writes:

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

Yeah as far as I can tell in all the situations we do this with icount
we should always be exiting the loop anyway. Changing our mind about
when the next time slice ends while in a block would break things. For
IO triggered events we already know the block is about to end anyway and
things be rectified.

I did wonder if pmuevents (under icount) might suffer because they call
timer_mod_anticipate_ns in pmccntr_op_finish but my kvm-unit-test smoke
test was fine.

So:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  util/qemu-timer.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index 0e8a453eaa1..af6e1787e57 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -409,10 +409,6 @@ static bool timer_mod_ns_locked(QEMUTimerList *timer=
_list,
>=20=20
>  static void timerlist_rearm(QEMUTimerList *timer_list)
>  {
> -    /* Interrupt execution to force deadline recalculation.  */
> -    if (icount_enabled() && timer_list->clock->type =3D=3D QEMU_CLOCK_VI=
RTUAL) {
> -        icount_start_warp_timer();
> -    }
>      timerlist_notify(timer_list);
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
