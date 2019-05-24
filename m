Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u2sm5603656wra.82.2019.05.24.04.25.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 04:25:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 366551FF87;
	Fri, 24 May 2019 12:25:23 +0100 (BST)
References: <20190523102532.10486-1-alex.bennee@linaro.org> <20190523102532.10486-4-alex.bennee@linaro.org> <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com> <877eag165o.fsf@zen.linaroharston> <CAFEAcA_Fu3Ep10NooU5-XcAqQVjJQE5o1L2JTdYTatjcOptPUg@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a semihosting console
In-reply-to: <CAFEAcA_Fu3Ep10NooU5-XcAqQVjJQE5o1L2JTdYTatjcOptPUg@mail.gmail.com>
Date: Fri, 24 May 2019 12:25:23 +0100
Message-ID: <875zq014d8.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ggp5DRMTmMxB


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 24 May 2019 at 11:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 23 May 2019 at 11:39, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> > I'm not sure about the "no callback" part of this API. The operation
>> > here is genuinely asynchronous and providing no mechanism for the
>> > caller to be able to say "ok, now wait til it completes" doesn't
>> > seem like a good plan.
>>
>> Well the caller doesn't really get a choice. At least in system mode
>> gdbstub does a vm_stop(RUN_STATE_DEBUG) and brings everything to a halt
>> anyway. All we've removed is the ability to tack on a callback (which
>> can get run in all sorts of contexts) when we restart.
>
> gdb_do_syscall() is asynchronous -- it arranges for the syscall
> to happen, but makes no guarantee about when it will finish.
> At the moment the gdb_do_syscall() API allows the caller
> to cope with this asynchronousness, because when the callback
> is called the syscall has definitely finished. As it happens
> the callers are buggy in that they don't actually do the
> sync that they need to do, but we could fix that bug (ie post
> a semaphore in the callback function, and wait on it after
> the gdb_do_syscall() call). The API for this new function
> doesn't allow us to do that.

So for the ARM semi side the console writes are treated as always
successful so the return value is correct (it doesn't matter for writec)
and no syncing to the guest is required. However I ran into a problem
because in gdbstub we have:

    /* Is there a GDB syscall waiting to be sent?  */
    if (s->current_syscall_cb) {
        put_packet(s, s->syscall_buf);
        return;
    }

which means it can't accept NULL for the callback. So I've removed the
gdb_console_out and done:

  static void semihosting_cb(CPUState *cs, target_ulong ret, target_ulong e=
rr)
  {
      if (ret =3D=3D (target_ulong) -1) {
          qemu_log("%s: gdb console output failed (%s)", __func__, strerror=
(-err));
      }
  }

  int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, in=
t len)
  {
      GString *s =3D copy_user_string(env, addr, len);
      int out =3D s->len;

      if (use_gdb_syscalls()) {
          gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, s->len);
      } else {
          out =3D qemu_semihosting_log_out(s->str, s->len);
      }

      g_string_free(s, true);
      return out;
  }

for now.

>> I could just drop the API here and allow the semihosting API to call
>> gdb_do_syscallv directly?
>
> I think we should either make the implementation of the function
> properly synchronous (ie do the post-semaphore-in-callback,
> wait-on-it-after-gdb_do_syscallv thing in the implementation,
> or have an API that lets callers do it.
>
> Perhaps we should just make gdb_do_syscall really be
> synchronous (ie have it do the semaphore stuff)? We
> only actually use it in semihosting, and I think all
> those cases require that the operation completes before
> we can resume execution of the guest CPU. So doing the
> synchronization in one place in the gdb code would be
> simpler than doing it separately in all the callers...

Maybe.. this seems like a bigger clean-up to do that properly. Maybe
that would be worth tackling after the gdbstub refactor stuff goes in?

--
Alex Benn=C3=A9e
