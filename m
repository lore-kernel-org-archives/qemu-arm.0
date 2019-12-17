Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5719930lff;
        Tue, 17 Dec 2019 01:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6HK4iwQK9HwJba8V249EU+WflB8H+6E7/zpACdC/q81yQjxM3SbtJRq89NeleykU4nxAx
X-Received: by 2002:ac8:408c:: with SMTP id p12mr3521708qtl.336.1576573706457;
        Tue, 17 Dec 2019 01:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576573706; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba8S/9yixufOw+C0csEV3BaCDDeNBKVwj8MUdtlvA0S5qa2XRGqkBVvyNiC7cnveRJ
         HHOjRNj+u/vCUyOMZuZoL3vjjO5XbdqmXoX63EyGnh9WJDlQPg96EwWrAslJvtfFLnB/
         q+HFP0MjlLFfIZJkPF4O5eZABSkNt+VN1ghCsPjs+NuUTfKGeKgHnHtBcZZLKkXTHtCz
         DcsW2O9iv4bESgCcw0TlrEmOy377hnwjy7Obz/PUe4bQgb+lZS1jekjDYSjGmlObOCBi
         bAf+E1+zlbMSM9UIhT52iVFk1Rg00YboJhR6wXYJ5LqD4gxsghp4Aa8vHjS8JJw57Vlg
         Su5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9HJKWolAg41zL7hPO63dV0aW6bVfWeULBzkYg6u1AE8=;
        b=eEtF10LZOTg24AHbWPo6N1MYLknKPWpxVCdt3kkomBskIwR3OWyh23biSjOEguFF6T
         Y/j9UGtGmTGr70/8YUmceiwnAOne4xnH8HknHlZRyAzA7uMNRkirCcVGyOfDKvZ2yB5P
         R3Sx39Yig6v+YsqdNYPKuKgBNkgqAuKeZeIR9DDTaQwwcsXh9d1WTtZGiX/ol+zMC1AI
         afzmHTDowxJujUiwTsATlD829rqz/hLDgYhMyQZEmDlI03xbeByI7pc10rFuF1DEAt0q
         kwsC9LbBRk6Njoel7ZvJSUOBXg8iILkU7hrkvDfjdH/DjKK4PpV1xhV5EZAoESM14jiv
         txjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7pqApxu;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id p9si11193990qvo.140.2019.12.17.01.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 01:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7pqApxu;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576573706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HJKWolAg41zL7hPO63dV0aW6bVfWeULBzkYg6u1AE8=;
	b=h7pqApxu/+tTHI+rTTw4nOnvIMoJt0U5J/wABmExQTWnYOXwS+rSkTCRHnNlTI2/4bq4Tt
	TIlbQ0oqhG9J/M8xo5R/tXaturqSv29hsEU5TOxoC/gTQ1UVXYMjHiSMlx9WfGHQuus7ro
	aTBpVSt+9kYjsnSD3Ef5Ql7ZNe6fsn8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-edg5wEXXMZKCNo-IsEaL0w-1; Tue, 17 Dec 2019 04:08:24 -0500
Received: by mail-wm1-f72.google.com with SMTP id m133so358507wmf.2
        for <alex.bennee@linaro.org>; Tue, 17 Dec 2019 01:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+qsBbSaHrwEfAZlKjDrHR4p3vP6YgzY79tvkGNrzuPk=;
        b=Dz7N5uSL3aTw9AMKROY1uddUEvkI617Xtj9X+LAxSLiCFqKM5zzcTQpvZpS57qhXtk
         YxQQznEl5T9TLxCP37AgV0eDFc+/sk2zgiQYGw1z7rC760IXWya5iiieYcggmnk+14xv
         aySEbjTUCe1AfJPYXEZBD6DYDDYvx8r5KPsELPo/IEJllFBCSLMTUygQowqSj8czT4k5
         rKu1MDsEyOUE2+UPqR7GoyqOH7QRK82rENkBNm5KBPLmHsy8hrSEfPKTt/HjGbXC9LC1
         B3y+og6adw1KoFpKtSZjHosDVDjkqWRve0+VEzizRZh6PnZHlXxneBk0FEQT7vK2jfjG
         eqKA==
X-Gm-Message-State: APjAAAVfyiCVg5kFk4uFtM23WqjSD6pgdV8zAokwO0X+3UzBushFnzgC
	bWCZ/dNxJWRqJUzS7W1wCNPUfw26t5TRraKDv4sEm9Ko+Dn1qSqlZegidi4tYnJEOlNEZUoKLNW
	wvtw1oabpR9ya+beP
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr4184746wma.24.1576573703629;
        Tue, 17 Dec 2019 01:08:23 -0800 (PST)
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr4184726wma.24.1576573703355;
        Tue, 17 Dec 2019 01:08:23 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:503f:4ffc:fc4a:f29a? ([2001:b07:6468:f312:503f:4ffc:fc4a:f29a])
        by smtp.gmail.com with ESMTPSA id x6sm2222288wmi.44.2019.12.17.01.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 01:08:22 -0800 (PST)
Subject: Re: [PATCH] Semihost SYS_READC implementation (v6)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org
References: <87h83w4dod.fsf@keithp.com>
 <20191104204230.12249-1-keithp@keithp.com> <87h81zwdmw.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a3b1155-4242-831c-8ae4-e9fb07f1cdb2@redhat.com>
Date: Tue, 17 Dec 2019 10:08:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87h81zwdmw.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: edg5wEXXMZKCNo-IsEaL0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dyYUikIkMij0

On 17/12/19 09:38, Alex Benn=C3=A9e wrote:
>   Thread 3 (Thread 0x7f8b1959e700 (LWP 14017)):
>   #0  0x00007f8b2ada900c in futex_wait_cancelable (private=3D0, expected=
=3D0, futex_word=3D0x56213f5482e8 <console+136>) at ../sysdeps/unix/sysv/li=
nux/futex-internal.h:88
>   #1  0x00007f8b2ada900c in __pthread_cond_wait_common (abstime=3D0x0, mu=
tex=3D0x56213f548298 <console+56>, cond=3D0x56213f5482c0 <console+96>) at p=
thread_cond_wait.c:502
>   #2  0x00007f8b2ada900c in __pthread_cond_wait (cond=3Dcond@entry=3D0x56=
213f5482c0 <console+96>, mutex=3Dmutex@entry=3D0x56213f548298 <console+56>)=
 at pthread_cond_wait.c:655
>   #3  0x000056213ea31a40 in qemu_semihosting_console_inc (env=3Denv@entry=
=3D0x56214138a680) at /home/alex/lsrc/qemu.git/hw/semihosting/console.c:151
>   #4  0x000056213eab96e8 in do_arm_semihosting (env=3Denv@entry=3D0x56214=
138a680) at /home/alex/lsrc/qemu.git/target/arm/arm-semi.c:805
>   #5  0x000056213eacd521 in handle_semihosting (cs=3D<optimized out>) at =
/home/alex/lsrc/qemu.git/target/arm/helper.c:8476
>   #6  0x000056213eacd521 in arm_cpu_do_interrupt (cs=3D<optimized out>) a=
t /home/alex/lsrc/qemu.git/target/arm/helper.c:8522
>   #7  0x000056213e9e53d0 in cpu_handle_exception (ret=3D<synthetic pointe=
r>, cpu=3D0x5621411fe2f0) at /home/alex/lsrc/qemu.git/accel/tcg/cpu-exec.c:=
503
>   #8  0x000056213e9e53d0 in cpu_exec (cpu=3Dcpu@entry=3D0x562141381550) a=
t /home/alex/lsrc/qemu.git/accel/tcg/cpu-exec.c:711
>   #9  0x000056213e9b4f1f in tcg_cpu_exec (cpu=3D0x562141381550) at /home/=
alex/lsrc/qemu.git/cpus.c:1473
>   #10 0x000056213e9b715b in qemu_tcg_cpu_thread_fn (arg=3Darg@entry=3D0x5=
62141381550) at /home/alex/lsrc/qemu.git/cpus.c:1781
>   #11 0x000056213ef026fa in qemu_thread_start (args=3D<optimized out>) at=
 /home/alex/lsrc/qemu.git/util/qemu-thread-posix.c:519
>   #12 0x00007f8b2ada2fa3 in start_thread (arg=3D<optimized out>) at pthre=
ad_create.c:486
>   #13 0x00007f8b2acd14cf in clone () at ../sysdeps/unix/sysv/linux/x86_64=
/clone.S:95
>=20
>   Thread 1 (Thread 0x7f8b1c151680 (LWP 14010)):
>   #0  0x00007f8b2ada900c in futex_wait_cancelable (private=3D0, expected=
=3D0, futex_word=3D0x56213f52c7c8 <qemu_pause_cond+40>) at ../sysdeps/unix/=
sysv/linux/futex-internal.h:88
>   #1  0x00007f8b2ada900c in __pthread_cond_wait_common (abstime=3D0x0, mu=
tex=3D0x56213f52c8c0 <qemu_global_mutex>, cond=3D0x56213f52c7a0 <qemu_pause=
_cond>) at pthread_cond_wait.c:502
>   #2  0x00007f8b2ada900c in __pthread_cond_wait (cond=3Dcond@entry=3D0x56=
213f52c7a0 <qemu_pause_cond>, mutex=3Dmutex@entry=3D0x56213f52c8c0 <qemu_gl=
obal_mutex>) at pthread_cond_wait.c:655
>   #3  0x000056213ef02e2b in qemu_cond_wait_impl (cond=3D0x56213f52c7a0 <q=
emu_pause_cond>, mutex=3D0x56213f52c8c0 <qemu_global_mutex>, file=3D0x56213=
ef43700 "/home/alex/lsrc/qemu.git/cpus.c", line=3D1943) at /home/alex/lsrc/=
qemu.git/util/qemu-thread-posix.c:173
>   #4  0x000056213e9b74a4 in pause_all_vcpus () at /home/alex/lsrc/qemu.gi=
t/cpus.c:1943
>   #5  0x000056213e9b74a4 in pause_all_vcpus () at /home/alex/lsrc/qemu.gi=
t/cpus.c:1923
>   #6  0x000056213e9b7532 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_=
stop=3D<optimized out>) at /home/alex/lsrc/qemu.git/cpus.c:1102
>   #7  0x000056213e96b8fc in main (argc=3D<optimized out>, argv=3D<optimiz=
ed out>, envp=3D<optimized out>) at /home/alex/lsrc/qemu.git/vl.c:4473
>=20
> I guess my first question is why do we need a separate mutex/cond
> variable for this operation? This seems like the sort of thing that the
> BQL could protect.

No, please do not introduce more uses of the BQL from the CPU thread.
The problem seems to lie with the condition variable, not the mutex.

> Secondly if the vCPU is paused (via console or gdbstub) we need to
> unwind from our blocking position and be in a position to restart
> cleanly.

Perhaps if fifo8_is_empty(&c->fifo) the CPU could update the PC back to
the SVC instruction and enter a halted state?  Perhaps with a new
CPU_INTERRUPT_* flag that would be checked in arm_cpu_has_work.

Paolo
