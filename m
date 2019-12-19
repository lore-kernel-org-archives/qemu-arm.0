Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c15sm6022465wrt.1.2019.12.19.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 03:14:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA3A81FF87;
	Thu, 19 Dec 2019 11:14:01 +0000 (GMT)
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-4-alex.bennee@linaro.org>
 <5ca1462e-5129-2b32-f014-a732a26a0587@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 keithp@keithp.com, Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier
 <laurent@vivier.eu>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 pbonzini@redhat.com
Subject: Re: [PATCH v1 3/4] semihosting: add qemu_semihosting_console_inc
 for SYS_READC
In-reply-to: <5ca1462e-5129-2b32-f014-a732a26a0587@linaro.org>
Date: Thu, 19 Dec 2019 11:14:01 +0000
Message-ID: <87v9qcefeu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8siqWzgDI9eN


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/18/19 8:00 AM, Alex Benn=C3=A9e wrote:
>> From: Keith Packard <keithp@keithp.com>
>>=20
>> Provides a blocking call to read a character from the console using
>> semihosting.chardev, if specified. This takes some careful command
>> line options to use stdio successfully as the serial ports, monitor
>> and semihost all want to use stdio. Here's a sample set of command
>> line options which share stdio betwen semihost, monitor and serial
>
> between.
>
>> +/**
>> + * qemu_semihosting_console_inc:
>> + * @env: CPUArchState
>> + *
>> + * Receive single character from debug console. This may be the remote
>> + * gdb session if a softmmu guest is currently being debugged. As this
>> + * call may block if no data is available we suspend the CPU and will
>> + * rexecute the instruction when data is there. Therefor two
>
> re-execute, Therefore
>
>> + * conditions must be met:
>> + *   - CPUState is syncronised before callinging this function
>
> synchronized, calling
>
>> + *   - pc is only updated once the character is succesfully returned
>
> successfully.
>
>
>> +static int console_can_read(void *opaque)
>> +{
>> +    SemihostingConsole *c =3D opaque;
>> +    int ret;
>> +    g_assert(qemu_mutex_iothread_locked());
>> +    ret =3D (int) fifo8_num_free(&c->fifo);
>> +    return ret;
>> +}
>
> Boolean result; better as
>
>   return fifo8_num_free(&c->fifo) > 0
>
> (We could usefully change IOCanReadHandler to return bool to emphasize
> this.)

It's documented as the amount you can read and other handlers return
amounts as well. I'm not sure I want to go messing with the chardev code
in this series (although I need to look at Phillipe's series).

>
>> +static void console_wake_up(gpointer data, gpointer user_data)
>> +{
>> +    CPUState *cs =3D (CPUState *) data;
>> +    /* cpu_handle_halt won't know we have work so just unbung here */
>> +    cs->halted =3D 0;
>> +    qemu_cpu_kick(cs);
>> +}
>> +
>> +static void console_read(void *opaque, const uint8_t *buf, int size)
>> +{
>> +    SemihostingConsole *c =3D opaque;
>> +    g_assert(qemu_mutex_iothread_locked());
>> +    while (size-- && !fifo8_is_full(&c->fifo)) {
>> +        fifo8_push(&c->fifo, *buf++);
>> +    }
>> +    g_slist_foreach(c->sleeping_cpus, console_wake_up, NULL);
>> +}
>
> I think you should be clearing sleeping_cpus here, after they've all been=
 kicked.
>
>> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
>> +{
>> +    uint8_t ch;
>> +    SemihostingConsole *c =3D &console;
>> +    g_assert(qemu_mutex_iothread_locked());
>> +    g_assert(current_cpu);
>> +    if (fifo8_is_empty(&c->fifo)) {
>> +        c->sleeping_cpus =3D g_slist_prepend(c->sleeping_cpus, current_=
cpu);
>> +        current_cpu->halted =3D 1;
>> +        current_cpu->exception_index =3D EXCP_HALTED;
>> +        cpu_loop_exit(current_cpu);
>> +        /* never returns */
>> +    }
>> +    c->sleeping_cpus =3D g_slist_remove_all(c->sleeping_cpus, current_c=
pu);
>
> Which would mean you would not have to do this, because current_cpu is on=
ly on
> the list when it is halted.
>
> I presume all semihosting holds the BQL before we reach here, and we are =
not
> racing on this datastructure?

Yeah this is all under BQL - which I assert is the case. I'll add a
comment to the structure.

>
>> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
>> +{
>> +    uint8_t c;
>> +    struct pollfd pollfd =3D {
>> +        .fd =3D STDIN_FILENO,
>> +        .events =3D POLLIN
>> +    };
>> +
>> +    if (poll(&pollfd, 1, -1) !=3D 1) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: unexpected read from stdin failur=
e",
>> +                      __func__);
>> +        return (target_ulong) -1;
>> +    }
>
> Why are you polling stdin?  linux-user isn't system mode, there isn't a
> separate monitor thread to get blocked, and you aren't even blocking the =
thread
> to try again just returning -1 to the guest.

Hmm not sure - I guess we should just bite the bullet and potentially
block here. semihosting is linux-user is a bit of a weird use case
because we are not providing "hardware" but it seems it is used by a
bunch of testcases that want to test things like M-profile non-glibc
binaries without the baggage of a full simulation.

>
>
> r~


--=20
Alex Benn=C3=A9e
