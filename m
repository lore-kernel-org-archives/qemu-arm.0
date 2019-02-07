Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n9sm9537wrx.80.2019.02.07.12.55.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 12:55:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D4A9D1FF80;
	Thu,  7 Feb 2019 20:55:50 +0000 (UTC)
References: <20190130004811.27372-1-cota@braap.org> <20190130004811.27372-39-cota@braap.org>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v6 38/73] arm: convert to cpu_interrupt_request
In-reply-to: <20190130004811.27372-39-cota@braap.org>
Date: Thu, 07 Feb 2019 20:55:50 +0000
Message-ID: <87h8dfmi7d.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XfO8lI4A3/Lu


Emilio G. Cota <cota@braap.org> writes:

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
<snip>
>
> -    /* Hooks may change global state so BQL should be held, also the
> -     * BQL needs to be held for any modification of
> -     * cs->interrupt_request.
> -     */
> +    /* Hooks may change global state so BQL should be held */
>      g_assert(qemu_mutex_iothread_locked());
>
>      arm_call_pre_el_change_hook(cpu);

So I dug into this and currently the only user is pmu_pre_el_change
which updates a bunch of the performance counters. While profiling the
system running the other thing that showed up was:

  void HELPER(set_cp_reg)(CPUARMState *env, void *rip, uint32_t value)
  {
      const ARMCPRegInfo *ri =3D rip;

      if (ri->type & ARM_CP_IO) {
          qemu_mutex_lock_iothread();
          ri->writefn(env, ri, value);
          qemu_mutex_unlock_iothread();
      } else {
          ri->writefn(env, ri, value);
      }
  }

And friends. I'm wondering now if these are candidates for using CPU
locks. We mention it in out docs (which might be a little out of date now):

  MMIO access automatically serialises hardware emulation by way of the
  BQL. Currently ARM targets serialise all ARM_CP_IO register accesses
  and also defer the reset/startup of vCPUs to the vCPU context by way
  of async_run_on_cpu().

for registers that affect things like the GIC that can have cross-vCPU
effects I suspect the race free IRQ raising might be enough. Are we over
locking if only a vCPU can read/write it's own CP regs?

Peter any thoughts?

Anyway as far as this patch goes:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e
