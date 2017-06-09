Received: by 10.25.0.23 with SMTP id 23csp2970024lfa;
        Fri, 9 Jun 2017 02:48:13 -0700 (PDT)
X-Received: by 10.46.20.77 with SMTP id 13mr7970417lju.14.1497001693819;
        Fri, 09 Jun 2017 02:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497001693; cv=none;
        d=google.com; s=arc-20160816;
        b=zuZkr3DWVMkhIoubdVLDT3pDY/9Gk0WlWWDP3fCFYviPMi8qBZKLJhT5PWglJkTJNq
         PwTlWc7MvE+0G+T7EUIF4CH5wnRlZ099NuNGI7NJ2lGhlr8nwtfKIXKpOL1xsnGt7JMH
         kcCwD69iqbag3pRVXZDoNlT+avMjnprc4CakCLXJC0l130QqTX28C23yp6Bw24iyKLlh
         /pjTykICfucpilYX58e3ddo3gJowt1l6YSVfPBsBTfQWcu3BfG2KEpjAhbTLcbmhki11
         HVssn3UaFrYYCEOgteR2dT1utsOwUmRJmth4MPdwybAwNj+cdMb9LX8DoFsDeGbtnhnZ
         /dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=OAdVJ1MR98vrNVxzi1F+S1dehO9DmLyN5XoQ5oc9BuY=;
        b=oRkoWQ3wIHZ7TbwZ8n4jnWe8TLJO2RROScZhApDORxHivthQMTI/BHZxbT+ZFLzVUZ
         U6X80R129BEehjk8IvwjuuM6FsHopPsr5YFKxeJ7L/hu8xnT6mtHi1aDv2esn0x7IXNi
         Pry/fUUcLyjmDxty1uQMLziLwOITT7NggYux/DmRZlix5RIs35d8qcC0O3V/zFRwsM62
         Q0HaaPGS/Z4MfhB2gq5Amvv1RCSBB5Mt21nie++b8+ddEh5Kuejhl1K7FAcpw+5FxjJY
         JVCRGB5SqpcbrGsin+A/cDVY/GikIYxl/gWg170FeCX5nQUUf25EBwvWuTEDAJkZPVjN
         rJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 63sor129758lja.15.2017.06.09.02.48.13
        (Google Transport Security);
        Fri, 09 Jun 2017 02:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=OAdVJ1MR98vrNVxzi1F+S1dehO9DmLyN5XoQ5oc9BuY=;
        b=mhloygpEyWgzf1AnNnAz54T1Xp8AKazvjA25cm0WZoTo0zZdf4BUdlrdJR/N6RG8kF
         FGgkkuNq1Q0FVhSJbwIkoy8/x57xwYbrcLy/T8NFWw0Ge2Fu3qiW3roA3Wx5mRVo8gXX
         bayP4HSzCQtop0bP4dovLpowajO1F7rI0LRrN7J8rSAoeP7NIbp+N8vxwaXH34l2DFZ4
         v8h2RmIDobS1ascTCpJU395S4Vy4Q8KY7VaKzUBl/APnYMGazSGu6xFgGSGJrcDg0gmZ
         R9aX/hdJd8JXU09FLJzRubOPcul3tsp2gR1PpD/HlyVenNkfv65rcdeACTTFBNZj6M4f
         ZSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=OAdVJ1MR98vrNVxzi1F+S1dehO9DmLyN5XoQ5oc9BuY=;
        b=q4gwdUKCVCEB950qZE1BgvR82cAEp4iNinps2hdeHQbVIvI7fS9Kl6jdfHVI4kT4yJ
         W2e8mBqyMhMiTp+KiLqe6aGI0dFVdisK+L7J/jUp8tHcIihB6VhZFbAWi/6XfSEJCC6s
         59Fe7cUu2QuDP0w+otNz/Z41WLdbM1A7pRrvrKzdQLwzvOyG7rHZpFpE8ruVtW/4TOkZ
         VpCDxqGcE0XNgdunei+dDA99ojI15RSA8jYUwVCGY5A9BpdhFDZPhK092p6QWGOt+q+m
         kUtv45TaWM/xINOClYcWu1n21j8vQ31rN+7lTJWZjc1jt6/1ecypEJ3rH8wme5u3pq58
         IFkQ==
X-Gm-Message-State: AODbwcCQeANVfTmkCEp0ae359rLcOCvG/mPzV9nEyibMsEimgGSKiXgg
	PR2M21lxcR5kXyE/
X-Received: by 10.46.74.10 with SMTP id x10mr12127187lja.92.1497001693462;
        Fri, 09 Jun 2017 02:48:13 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id h98sm145152ljh.57.2017.06.09.02.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2017 02:48:12 -0700 (PDT)
Date: Fri, 9 Jun 2017 11:48:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>,
	fred.konrad@greensocs.com, alex.bennee@linaro.org
Subject: AArch64 regression
Message-ID: <20170609094812.GA2201@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: /QPIiRHWVZTW

Hi,

I was running a bunch of tests in preparation for the MMIO/exec
series but am running into regressions on master.
I'm at commit 64175afc695c0672876fbbfc31b299c86d562cb4

On the xlnx-zcu102 I see lockups, the console goes unresponsive.
On one of my vexpress-a15 setups (with an a57), I see weird
segfaults in user-space.

I bisected this multiple times with each of the test cases
and all of the bisects bring me to this commit:
commit e75449a346bf558296966a44277bfd93412c6da6
Author: Emilio G. Cota <cota@braap.org>
Date:   Fri Apr 28 14:59:23 2017 -0400

    target/aarch64: optimize indirect branches


Does this ring any bells? Are there any known issues at the moment?
I've copied a GDB backtrace form the ZynqMP lockup at the end
of this email.

Thanks,
Edgar

GDB backtrace:
(gdb) thread apply all bt

Thread 6 (Thread 0x7fff431fc700 (LWP 28586)):
#0  0x00007ffff5e2826d in __lll_lock_wait ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff5e21dbd in pthread_mutex_lock ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#2  0x0000555555b5cc40 in qemu_mutex_lock (
    mutex=mutex@entry=0x55555620be80 <qemu_global_mutex>)
    at /home/edgar/src/c/qemu/qemu/util/qemu-thread-posix.c:61
#3  0x00005555557bc9cc in qemu_mutex_lock_iothread ()
    at /home/edgar/src/c/qemu/qemu/cpus.c:1581
#4  0x000055555578e865 in cpu_handle_interrupt (last_tb=<synthetic pointer>, 
    cpu=0x5555566c40b0) at /home/edgar/src/c/qemu/qemu/cpu-exec.c:491
#5  cpu_exec (cpu=cpu@entry=0x7fffc543f4f8)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:670
#6  0x00005555557bcb9f in tcg_cpu_exec (cpu=0x7fffc543f4f8)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1270
#7  qemu_tcg_cpu_thread_fn (arg=0x7fffc543f4f8)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1473
#8  0x00007ffff5e1f6ba in start_thread ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff5b5582d in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 5 (Thread 0x7fff439fd700 (LWP 28585)):
#0  0x00007ffff5e2826d in __lll_lock_wait ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff5e21dbd in pthread_mutex_lock ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#2  0x0000555555b5cc40 in qemu_mutex_lock (
    mutex=mutex@entry=0x55555620be80 <qemu_global_mutex>)
    at /home/edgar/src/c/qemu/qemu/util/qemu-thread-posix.c:61
#3  0x00005555557bc9cc in qemu_mutex_lock_iothread ()
    at /home/edgar/src/c/qemu/qemu/cpus.c:1581
#4  0x000055555578e865 in cpu_handle_interrupt (last_tb=<synthetic pointer>, 
    cpu=0x5555566c40b0) at /home/edgar/src/c/qemu/qemu/cpu-exec.c:491
#5  cpu_exec (cpu=cpu@entry=0x7fffc54208d0)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:670
#6  0x00005555557bcb9f in tcg_cpu_exec (cpu=0x7fffc54208d0)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1270
#7  qemu_tcg_cpu_thread_fn (arg=0x7fffc54208d0)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1473
#8  0x00007ffff5e1f6ba in start_thread ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff5b5582d in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 4 (Thread 0x7fff441fe700 (LWP 28584)):
#0  0x00007ffff5e21dac in pthread_mutex_lock ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#1  0x0000555555b5cc40 in qemu_mutex_lock (
    mutex=mutex@entry=0x55555620be80 <qemu_global_mutex>)
    at /home/edgar/src/c/qemu/qemu/util/qemu-thread-posix.c:61
#2  0x00005555557bc9cc in qemu_mutex_lock_iothread ()
    at /home/edgar/src/c/qemu/qemu/cpus.c:1581
#3  0x000055555578e865 in cpu_handle_interrupt (last_tb=<synthetic pointer>, 
    cpu=0x5555566c40b0) at /home/edgar/src/c/qemu/qemu/cpu-exec.c:491
#4  cpu_exec (cpu=cpu@entry=0x7fffc5401ca8)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:670
#5  0x00005555557bcb9f in tcg_cpu_exec (cpu=0x7fffc5401ca8)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1270
#6  qemu_tcg_cpu_thread_fn (arg=0x7fffc5401ca8)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1473
#7  0x00007ffff5e1f6ba in start_thread ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#8  0x00007ffff5b5582d in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 3 (Thread 0x7fff449ff700 (LWP 28583)):
#0  0x00005555558c4c89 in regime_el (mmu_idx=ARMMMUIdx_S1NSE1, 
    env=0x7fffc53eb310) at /home/edgar/src/c/qemu/qemu/target/arm/helper.c:7028
#1  regime_tcr (mmu_idx=<optimized out>, env=0x7fffc53eb310)
    at /home/edgar/src/c/qemu/qemu/target/arm/helper.c:7117
#2  arm_regime_tbi0 (env=env@entry=0x7fffc53eb310, mmu_idx=<optimized out>, 
    mmu_idx@entry=ARMMMUIdx_S12NSE1)
    at /home/edgar/src/c/qemu/qemu/target/arm/helper.c:7142
#3  0x00005555557ba346 in cpu_get_tb_cpu_state (flags=<synthetic pointer>, 
    cs_base=<synthetic pointer>, pc=<synthetic pointer>, env=0x7fffc53eb310)
    at /home/edgar/src/c/qemu/qemu/target/arm/cpu.h:2571
#4  helper_lookup_tb_ptr (env=0x7fffc53eb310, addr=18446743524088820436)
    at /home/edgar/src/c/qemu/qemu/tcg-runtime.c:156
#5  0x00007fffcf2f7e53 in code_gen_buffer ()
#6  0x000055555578de7c in cpu_tb_exec (itb=<optimized out>, 
    itb=<optimized out>, cpu=0x7fffc5727478)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:166
#7  cpu_loop_exec_tb (tb_exit=<synthetic pointer>, 
    last_tb=<synthetic pointer>, tb=<optimized out>, cpu=0x7fffc5727478)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:574
#8  cpu_exec (cpu=cpu@entry=0x7fffc53e3080)
    at /home/edgar/src/c/qemu/qemu/cpu-exec.c:672
#9  0x00005555557bcb9f in tcg_cpu_exec (cpu=0x7fffc53e3080)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1270
#10 qemu_tcg_cpu_thread_fn (arg=0x7fffc53e3080)
    at /home/edgar/src/c/qemu/qemu/cpus.c:1473
#11 0x00007ffff5e1f6ba in start_thread ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#12 0x00007ffff5b5582d in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 2 (Thread 0x7fffef7b7700 (LWP 28582)):
#0  0x00007ffff5b4f8e9 in syscall () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x0000555555b5d385 in qemu_futex_wait (val=<optimized out>, 
    f=<optimized out>) at /home/edgar/src/c/qemu/qemu/include/qemu/futex.h:26
#2  qemu_event_wait (ev=ev@entry=0x55555661bae4 <rcu_call_ready_event>)
    at /home/edgar/src/c/qemu/qemu/util/qemu-thread-posix.c:415
#3  0x0000555555b6cc6e in call_rcu_thread (opaque=<optimized out>)
    at /home/edgar/src/c/qemu/qemu/util/rcu.c:249
#4  0x00007ffff5e1f6ba in start_thread ()
   from /lib/x86_64-linux-gnu/libpthread.so.0
#5  0x00007ffff5b5582d in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 1 (Thread 0x7ffff7f31c00 (LWP 28578)):
#0  0x00007ffff5b49c21 in ppoll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x0000555555b58f39 in ppoll (__ss=0x0, __timeout=0x7fffffffd5f0, 
    __nfds=<optimized out>, __fds=<optimized out>)
    at /usr/include/x86_64-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, 
    timeout=timeout@entry=9223371867734611302)
    at /home/edgar/src/c/qemu/qemu/util/qemu-timer.c:334
#3  0x0000555555b59d6a in os_host_main_loop_wait (timeout=9223371867734611302)
    at /home/edgar/src/c/qemu/qemu/util/main-loop.c:255
#4  main_loop_wait (nonblocking=<optimized out>)
    at /home/edgar/src/c/qemu/qemu/util/main-loop.c:517
#5  0x0000555555779057 in main_loop () at /home/edgar/src/c/qemu/qemu/vl.c:1918
#6  main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>)
    at /home/edgar/src/c/qemu/qemu/vl.c:4752
(gdb) 
