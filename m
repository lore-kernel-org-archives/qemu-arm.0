Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1871145lfq;
        Thu, 8 Oct 2020 19:22:17 -0700 (PDT)
X-Received: by 2002:a02:b388:: with SMTP id p8mr9148546jan.129.1602210137752;
        Thu, 08 Oct 2020 19:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602210137; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMi0kLY5xXy7kK15sSAmQmKyFWMQks1Lqm4SqtziUzfe9HspeKarFKz8wZRB3W5kqy
         NzALeV9stMp5TWRFTgCtMs263HEyGpukkjHWVA249ipQei9sf3x3cPmvgC8B7/aEJ42a
         mJfGjuvRjmFEkCoXYDqjZ9sUg4UTZvYlI4Sk3UzEFYXj/RvbTZ2lu6fPQpsqE87H4owR
         pIx5uaAQq2d2Fs6S9L470B0NoVCibyVOs4QU1qMVOzt4GO0o1covW/Ux1zYDrDUQN/le
         OTbaAMR+sHDFNo9owv55hVFlejaDAzrbwj1gsgDuShcNwEXLLo64qUnsmQgx6dvkPts6
         g2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+IhlPNG0WnJ8C/eyKlGq3A2olcxgXB5Ce9kq09pSOQ=;
        b=YxQBqd+Gg0b0ya9FhLYM+0lrgBq8oOWltgv31+ypRwEyvGm5IG5Huqc1aWOtdpeZ/z
         dZ2YIvEXtZdLJHfyGEh7TkW64vxI1ZXle6GSEikUFgvebsJ6ltDx5wnjN5cZvUfuQ+0E
         eKJa2Fs1icGoFb2/iCAw89hWn688eKlhCeEFjR20cm5gPE4KA6nAGjiiA6y6zo13pADo
         OaiK4AOpvY4aLMmI0r6Q6bB01M+ceZ8bzWr35a93ajjXgd3wlV40dtNK5bEGpfMuNGIN
         b6r9SmsNkzsFYnuEh7xok8xSzxGLRXnIhYgAlrz4ae9p5snv93CtC1wxDhU0pwT64NZ2
         10Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJcdaYnS;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <pauldzim@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l18sor4713659ioh.0.2020.10.08.19.22.17
        (Google Transport Security);
        Thu, 08 Oct 2020 19:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJcdaYnS;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B+IhlPNG0WnJ8C/eyKlGq3A2olcxgXB5Ce9kq09pSOQ=;
        b=QJcdaYnSyXj+86/khBGGiwbRcm2WsSEe2sfBxl+UGAxLbbYzJz1ZZc4TmByR07Kekp
         u1RHcI3TKVKC8eYPtcJKNCUTuaun+ATLLUMSGghlXOkO5UaOz8e7S8uGiXIn7uaKJaWn
         HI3p34bZgleInU0uVyiv7CpX0I43w5JOlUc3tCEDDc2pDFoFJKVQvY09X4lUdglaRqd6
         +53zEIaG68Wfak9M0TNpGqVNyh2AqiWCWo2HFGZexi04BlJbgvgzEZAyzpx4PjgsAzAt
         nz7mq59Dc/NWOZNUUHMEwzITgPWtP2gqGn7ZIkghxUdIr3dapzjJUZiVUYtcwS18NO+/
         wz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B+IhlPNG0WnJ8C/eyKlGq3A2olcxgXB5Ce9kq09pSOQ=;
        b=W1BxCwcAUIuyaeC1pOyvhhc4m2PCH+je49evnzqQOoLU47y6tBixWn9KNA06X8Bwf4
         XoD2GmnC5fJTYVsCvJXirkXanD84A33NV50UkrbCy1WzpoHCx0+TBPYrT9MFf6chcUpH
         CzaPlRKqMHHRr3of7eLSzOV5F5VY8UQXDfKNbPfeZZ0CHxvsoZOaARSwZ3iITNnVpFEr
         5/WXopDI4CE8yOMKpjQx3jZeOLNJdAZO9mbnEvHIAzJVPDlyv0slDAL8HsVrE485bESR
         2lbVn/VsT4W78HF6OO8dnU6Va5jrFRx4nSsr/S5Ys38Ybu4NSQVkiMj3s9v2xE99rQhN
         mF9w==
X-Gm-Message-State: AOAM532ay46LT7Y+8qhlVn8Q5osU4TP9tPXdnhXHZ6vPNZYqFdPNlBG9
	qQ7PMM4KL1aym7fDTVBUCmyVmm4YLarliVFN7wWihSUkgjE=
X-Google-Smtp-Source: ABdhPJwIaFTzMq52uc8XptnLoovSkpBBAkRrELwDLTmDJk2MavBc3AEIhegXJKnM2KqFOMp1PKMOaK+kgcjBhthjk98=
X-Received: by 2002:a6b:f909:: with SMTP id j9mr8119682iog.184.1602210137119;
 Thu, 08 Oct 2020 19:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org> <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com> <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com> <87blhe1esd.fsf@linaro.org>
 <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com> <87362q1bxl.fsf@linaro.org>
 <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com> <CADBGO79XkF7hAxDmrPm9Za16rXPHbB2L6xD2zr8puDLQp+z0Fw@mail.gmail.com>
In-Reply-To: <CADBGO79XkF7hAxDmrPm9Za16rXPHbB2L6xD2zr8puDLQp+z0Fw@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Thu, 8 Oct 2020 19:21:50 -0700
Message-ID: <CADBGO7_taH6z3x-Ab3rtxUJ_FrFL3ULexO=CJsMoynbvCGazaw@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas <74cmonty@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ymWtXA2rC+Gs

Running 'top -H' (to show individual threads) I see qemu is using 6 to 7
threads while running, and each thread is taking from 15% to 70% or so
of cpu time. So probably qemu is not able to spread the work among the
threads evenly enough to use all the cpu time available.

Might be an interesting area of investigation for someone motivated
enough :)

- Paul

On Thu, Oct 8, 2020 at 2:07 PM Paul Zimmerman <pauldzim@gmail.com> wrote:
>
> Hi Thomas,
>
> What does 'top' say while the emulation is running? I have an 8 cpu-threa=
d
> system, yet 'top' never shows more than about 300% cpu. I would have
> thought it would get closer to 800% cpu. And running qemu as root with
> nice -20 doesn't seem to make much difference.
>
> - Paul
>
> On Thu, Oct 8, 2020 at 12:00 AM Thomas <74cmonty@gmail.com> wrote:
> >
> > Interesting enough is: my top figure reported by perf is like yours:
> >
> > Samples: 6M of event 'cycles:u', Event count (approx.): 1936571734942
> > Overhead  Command          Shared Object                  Symbol
> >    7,95%  qemu-system-arm  qemu-system-arm                [.]
> > helper_lookup_tb_ptr
> > =E2=97=86
> >    4,16%  qemu-system-arm  qemu-system-arm                [.]
> > cpu_get_tb_cpu_state
> > =E2=96=92
> >    2,52%  qemu-system-arm  libpthread-2.32.so             [.]
> > __pthread_mutex_lock
> > =E2=96=92
> >    2,06%  qemu-system-arm  qemu-system-arm                [.]
> > qht_lookup_custom
> > =E2=96=92
> >    1,66%  qemu-system-arm  qemu-system-arm                [.]
> > tlb_set_page_with_attrs
> > =E2=96=92
> >    1,61%  qemu-system-arm  libpthread-2.32.so             [.]
> > __pthread_mutex_unlock_usercnt
> > =E2=96=92
> >    1,59%  qemu-system-arm  qemu-system-arm                [.]
> > get_phys_addr
> > =E2=96=92
> >    1,27%  qemu-system-arm  qemu-system-arm                [.]
> > cpu_exec
> > =E2=96=92
> >    1,23%  qemu-system-arm  qemu-system-arm                [.]
> > object_class_dynamic_cast_assert
> > =E2=96=92
> >    0,98%  qemu-system-arm  libc-2.32.so                   [.]
> > _int_malloc
> > =E2=96=92
> >    0,95%  qemu-system-arm  qemu-system-arm                [.]
> > object_dynamic_cast_assert
> > =E2=96=92
> >    0,95%  qemu-system-arm  qemu-system-arm                [.]
> > tb_htable_lookup
> > =E2=96=92
> >    0,92%  qemu-system-arm  qemu-system-arm                [.]
> > tcg_gen_code
> > =E2=96=92
> >    0,91%  qemu-system-arm  qemu-system-arm                [.]
> > qemu_mutex_lock_impl
> > =E2=96=92
> >    0,75%  qemu-system-arm  qemu-system-arm                [.]
> > get_page_addr_code_hostp
> > =E2=96=92
> >    0,73%  qemu-system-arm  qemu-system-arm                [.]
> > tcg_optimize
> > =E2=96=92
> >    0,71%  qemu-system-arm  qemu-system-arm                [.]
> > qemu_mutex_unlock_impl
> > =E2=96=92
> >    0,69%  qemu-system-arm  libc-2.32.so                   [.]
> > _int_free
> > =E2=96=92
> >    0,64%  qemu-system-arm  qemu-system-arm                [.]
> > tb_flush_jmp_cache
> > =E2=96=92
> >    0,63%  qemu-system-arm  qemu-system-arm                [.]
> > address_space_ldl_le
> > =E2=96=92
> >    0,62%  qemu-system-arm  libpthread-2.32.so             [.]
> > __lll_lock_wait
> > =E2=96=92
> >    0,58%  qemu-system-arm  libpthread-2.32.so             [.]
> > pthread_cond_wait@@GLIBC_2.3.2
> > =E2=96=92
> >    0,52%  qemu-system-arm  qemu-system-arm                [.]
> > cpu_reset_interrupt
> > =E2=96=92
> >    0,52%  qemu-system-arm  libc-2.32.so                   [.]
> > cfree@GLIBC_2.2.5
> > =E2=96=92
> >    0,52%  qemu-system-arm  qemu-system-arm                [.]
> > qemu_set_irq
> > =E2=96=92
> >
> > However the absolute time is 3-4 minutes.
> > And I don't know where I should start optimization now.
> >
> >
> >
> > Am 07.10.20 um 14:02 schrieb Alex Benn=C3=A9e:
> > > Thomas Schneider <74cmonty@gmail.com> writes:
> > >
> > >> Are you referring to this tool?
> > >> https://github.com/stefano-garzarella/qemu-boot-time
> > >> <https://github.com/stefano-garzarella/qemu-boot-time>
> > > No - just plain perf:
> > >
> > >   perf record $QEMU $ARGS
> > >
> > > Then a "perf report" which will show you the hotspots, for example:
> > >
> > >    8.92%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup=
_tb_ptr
> > >    4.76%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass=
_1
> > >    3.69%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
> > >    2.95%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup_cu=
stom
> > >    2.93%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
> > >    1.28%  qemu-system-aar  qemu-system-aarch64      [.] tcg_out_opc.i=
sra.15
> > >    1.09%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr=
_lpae
> > >    1.09%  qemu-system-aar  [kernel.kallsyms]        [k] isolate_freep=
ages_block
> > >    1.05%  qemu-system-aar  qemu-system-aarch64      [.] cpu_get_tb_cp=
u_state
> > >    0.98%  qemu-system-aar  [kernel.kallsyms]        [k] do_syscall_64
> > >    0.94%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup_cmp
> > >    0.78%  qemu-system-aar  qemu-system-aarch64      [.] init_ts_info
> > >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_loo=
kup
> > >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_gen_code
> > >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_=
with_attrs
> > >
> > >>
> > >> Am 07.10.2020 um 13:00 schrieb Alex Benn=C3=A9e:
> > >>> perf to record your boot
> > >
> >
