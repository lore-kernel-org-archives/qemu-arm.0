Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n2sm9282261wrq.58.2019.03.05.01.16.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2019 01:16:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C225D1FF82;
	Tue,  5 Mar 2019 09:16:41 +0000 (UTC)
References: <20190304181813.8075-1-cota@braap.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Alistair Francis
 <alistair23@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>, Anthony
 Green <green@moxielogic.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Chris Wulff <crwulff@gmail.com>, Cornelia Huck
 <cohuck@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Fabien
 Chouteau <chouteau@adacore.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, James
 Hogan <jhogan@kernel.org>, Laurent Vivier <laurent@vivier.eu>, Marek Vasut
 <marex@denx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max
 Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>, Palmer
 Dabbelt <palmer@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v7 00/73] per-CPU locks
In-reply-to: <20190304181813.8075-1-cota@braap.org>
Date: Tue, 05 Mar 2019 09:16:41 +0000
Message-ID: <87zhq9fzpi.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qjISYRjbXW5v


Emilio G. Cota <cota@braap.org> writes:

> v6: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg07650.html
>
> All patches in the series have reviews now. Thanks everyone!
>
> I've tested all patches with `make check-qtest -j' for all targets.
> The series is checkpatch-clean (just some warnings about __COVERITY__).
>
> You can fetch the series from:
>   https://github.com/cota/qemu/tree/cpu-lock-v7

Just to say I've applied and tested the whole series and I'm still
seeing the improvements so I think it's ready to be picked up:

  Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> ---
> v6->v7:
>
> - Rebase on master
>   - Add a cpu_halted_set call to arm code that wasn't there in v6
>
> - Add R-b's and Ack's.
>
> - Add comment to patch 3's log to explain why the bitmap is added
>   there, even though it only gains a user at the end of the series.
>
> - Fix "prevent deadlock" comments before assertions; use
>   "enforce locking order" instead, which is more accurate.
>
> - Add a few more comments, as suggested by Alex.
>
> v6->v7 diff (before rebase) below.
>
> Thanks,
>
> 		Emilio
> ---
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index e4ae04f72c..a513457520 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -435,7 +435,7 @@ static inline bool cpu_handle_halt_locked(CPUState *c=
pu)
>              && replay_interrupt()) {
>              X86CPU *x86_cpu =3D X86_CPU(cpu);
>
> -            /* prevent deadlock; cpu_mutex must be acquired _after_ the =
BQL */
> +            /* locking order: cpu_mutex must be acquired _after_ the BQL=
 */
>              cpu_mutex_unlock(cpu);
>              qemu_mutex_lock_iothread();
>              cpu_mutex_lock(cpu);
> diff --git a/cpus.c b/cpus.c
> index 4f17fe25bf..82a93f2a5a 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -2062,7 +2062,7 @@ void qemu_mutex_lock_iothread_impl(const char *file=
, int line)
>  {
>      QemuMutexLockFunc bql_lock =3D atomic_read(&qemu_bql_mutex_lock_func=
);
>
> -    /* prevent deadlock with CPU mutex */
> +    /* enforce locking order */
>      g_assert(no_cpu_mutex_locked());
>
>      g_assert(!qemu_mutex_iothread_locked());
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index bb0729f969..726cb7b090 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -322,7 +322,8 @@ struct qemu_work_item;
>   * @mem_io_pc: Host Program Counter at which the memory was accessed.
>   * @mem_io_vaddr: Target virtual address at which the memory was accesse=
d.
>   * @kvm_fd: vCPU file descriptor for KVM.
> - * @lock: Lock to prevent multiple access to per-CPU fields.
> + * @lock: Lock to prevent multiple access to per-CPU fields. Must be acq=
uired
> + *        after the BQL.
>   * @cond: Condition variable for per-CPU events.
>   * @work_list: List of pending asynchronous work.
>   * @halted: Nonzero if the CPU is in suspended state.
> @@ -804,6 +805,7 @@ static inline bool cpu_has_work(CPUState *cpu)
>      bool (*func)(CPUState *cpu);
>      bool ret;
>
> +    /* some targets require us to hold the BQL when checking for work */
>      if (cc->has_work_with_iothread_lock) {
>          if (qemu_mutex_iothread_locked()) {
>              func =3D cc->has_work_with_iothread_lock;
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 3f3c670897..65a14deb2f 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -3216,6 +3216,10 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_ru=
n *run)
>          qemu_mutex_lock_iothread();
>      }
>
> +    /*
> +     * We might have cleared some bits in cpu->interrupt_request since r=
eading
> +     * it; read it again.
> +     */
>      interrupt_request =3D cpu_interrupt_request(cpu);
>
>      /* Force the VCPU out of its inner loop to process any INIT requests


--
Alex Benn=C3=A9e
