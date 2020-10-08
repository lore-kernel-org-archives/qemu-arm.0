Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1689990lfq;
        Thu, 8 Oct 2020 14:07:54 -0700 (PDT)
X-Received: by 2002:a92:cd11:: with SMTP id z17mr8165484iln.201.1602191274827;
        Thu, 08 Oct 2020 14:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602191274; cv=none;
        d=google.com; s=arc-20160816;
        b=T/D+3Vr93Euh6RzSlqR0g2C297rnROI4BZ2JjKHg84DqFheVs8WpIFMKV8RHrgaOeR
         942s1mGbM6ewsnFrZPe3ntt805HF3zJ03zo09dOiotmBi+7E24YwPj8nKDPEzE28EM5x
         o+IG/N5CIJ5dqIIEhWPXHPb83eAViBmlUO4wBWYe8UFZxw/FRqUTQC+K6Gfkvcdt/5Zv
         1wbnbO+cYwqxFS/UhJTdz83c4rIDOckUSlcK+eedv/kniaUAKkslBzcetR8ejK2/v7pH
         tIrihqkiYhM1kJELAFifyVpUpd2o9XfI/BU47ycHgt353Ejz3Yi6p62PziVo4lF60kvU
         8j9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wGw1bQKjLmdDuCCMwLCKEcpMrQ/51xudvGHXz1YuUI=;
        b=Sl2z7aA08R9vZpwgo/RcdO0zH6lcT3YVO5KMHCVguhpYEL9KRk8+UubbIjL+PS1JvI
         uq1EYTgyH+Eg6S3fLEJTF1JvLpD0mQXv/lLJp4neIq4l6Gbvss1Qh1USdZIo/g14Fua3
         xqlrxfA+Fb4dD1/Zed9eC3u2mDvwZAhilIkG1SkL+dQMCU3sDoc9jn42pHfnrs1pKH82
         YqYCyDY3GKogmqP6ubHoP1U8eJgsi9+MIQQtVQKUOCce4FW0+Y+jDUeQD3ymPQWHrEA9
         7SdojFi8wmu7e9lxsD/JIVeclW+SbKCGKdHZyCjlVkZzUdf+3hKHq/TlHTRYa5me1A60
         kN1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jtiwrfg2;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <pauldzim@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g4sor1771007ilk.86.2020.10.08.14.07.54
        (Google Transport Security);
        Thu, 08 Oct 2020 14:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jtiwrfg2;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8wGw1bQKjLmdDuCCMwLCKEcpMrQ/51xudvGHXz1YuUI=;
        b=jtiwrfg2Mb3CO2+FAO5xUZl2kr8gzHUtjUB2qtxQMje0vOALQk3busiG89JDJOic6u
         ZKUsNo5DHNcQVVgFjMdF9FuqUGm30HKvOAUV4K+VG9rc4R3jhGd8ebqqBjTA8tD4C0vf
         Eq8W1JD4Wd8mb7eC2MdrxpMU4azXyS2orSwRUb8sOsY5pgGBy0PvYcWblA/U7+ibjAaz
         god/2F3Z5PSu+Q+u3/qXFq+VDN3vwqH2+egSfByAZTHgxvHixDfAH4PlM/OJx4Z/E5O6
         nqA8tPNtGMr67vyCZUs6n5eRgrxKDPvQmH3rjJyFKBv8oMwHsRhEhPkxJhOuHAa1u/J3
         xXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8wGw1bQKjLmdDuCCMwLCKEcpMrQ/51xudvGHXz1YuUI=;
        b=BSLQwu4s11/BH1hxJdrV0DzgSFYtz1TLifxdv0xHliE7Y4Q2T9jfWBHZorU0HXe0DH
         fcR7Zz7WgCl+BsRI9Nag5TyDsw484dPGSDMkJ5WwicX74FqHjnHuYmTFInNTBKCQMQKa
         2fnx022Ht58Nb7hTcBMM0j2G9kBO2CzGiDdJ32QOM+bV6AO81Jn9X6m83/XS8TcB5OUy
         Q7j3RVxhd0trFeUesX9N7NwsW/Pr4kAdcNNWVEl34r7EymKr0MYrT2K0U3OT75QNbJC+
         QsJPG1eDgqpXMt9q5e5KuiZ7z5nFrEHD9S+bMh5dXcuHtZf2scQPiO5jKH8jsZO6Uyc8
         csJQ==
X-Gm-Message-State: AOAM532r3sRURkUuXlwGIy8Q5TVHJ9aHOvDEv6us+TezV7J/IJs0fGe+
	uRTVCyvu5/08AxxEwYJNOVSCXJw7u6LQyQcK9t8WHr0mWeo=
X-Google-Smtp-Source: ABdhPJy4dsE64vuxOnjdVL0w95kR6ehkEdW6nVxyjJPEyi9JFwiKYpXi35wW0FkVxHeyE055et3qRwjoPjBbCgcAaU0=
X-Received: by 2002:a92:d850:: with SMTP id h16mr7874809ilq.281.1602191274339;
 Thu, 08 Oct 2020 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org> <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com> <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com> <87blhe1esd.fsf@linaro.org>
 <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com> <87362q1bxl.fsf@linaro.org> <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
In-Reply-To: <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Thu, 8 Oct 2020 14:07:27 -0700
Message-ID: <CADBGO79XkF7hAxDmrPm9Za16rXPHbB2L6xD2zr8puDLQp+z0Fw@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas <74cmonty@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8RL+JvGaUPle

Hi Thomas,

What does 'top' say while the emulation is running? I have an 8 cpu-thread
system, yet 'top' never shows more than about 300% cpu. I would have
thought it would get closer to 800% cpu. And running qemu as root with
nice -20 doesn't seem to make much difference.

- Paul

On Thu, Oct 8, 2020 at 12:00 AM Thomas <74cmonty@gmail.com> wrote:
>
> Interesting enough is: my top figure reported by perf is like yours:
>
> Samples: 6M of event 'cycles:u', Event count (approx.): 1936571734942
> Overhead  Command          Shared Object                  Symbol
>    7,95%  qemu-system-arm  qemu-system-arm                [.]
> helper_lookup_tb_ptr
> =E2=97=86
>    4,16%  qemu-system-arm  qemu-system-arm                [.]
> cpu_get_tb_cpu_state
> =E2=96=92
>    2,52%  qemu-system-arm  libpthread-2.32.so             [.]
> __pthread_mutex_lock
> =E2=96=92
>    2,06%  qemu-system-arm  qemu-system-arm                [.]
> qht_lookup_custom
> =E2=96=92
>    1,66%  qemu-system-arm  qemu-system-arm                [.]
> tlb_set_page_with_attrs
> =E2=96=92
>    1,61%  qemu-system-arm  libpthread-2.32.so             [.]
> __pthread_mutex_unlock_usercnt
> =E2=96=92
>    1,59%  qemu-system-arm  qemu-system-arm                [.]
> get_phys_addr
> =E2=96=92
>    1,27%  qemu-system-arm  qemu-system-arm                [.]
> cpu_exec
> =E2=96=92
>    1,23%  qemu-system-arm  qemu-system-arm                [.]
> object_class_dynamic_cast_assert
> =E2=96=92
>    0,98%  qemu-system-arm  libc-2.32.so                   [.]
> _int_malloc
> =E2=96=92
>    0,95%  qemu-system-arm  qemu-system-arm                [.]
> object_dynamic_cast_assert
> =E2=96=92
>    0,95%  qemu-system-arm  qemu-system-arm                [.]
> tb_htable_lookup
> =E2=96=92
>    0,92%  qemu-system-arm  qemu-system-arm                [.]
> tcg_gen_code
> =E2=96=92
>    0,91%  qemu-system-arm  qemu-system-arm                [.]
> qemu_mutex_lock_impl
> =E2=96=92
>    0,75%  qemu-system-arm  qemu-system-arm                [.]
> get_page_addr_code_hostp
> =E2=96=92
>    0,73%  qemu-system-arm  qemu-system-arm                [.]
> tcg_optimize
> =E2=96=92
>    0,71%  qemu-system-arm  qemu-system-arm                [.]
> qemu_mutex_unlock_impl
> =E2=96=92
>    0,69%  qemu-system-arm  libc-2.32.so                   [.]
> _int_free
> =E2=96=92
>    0,64%  qemu-system-arm  qemu-system-arm                [.]
> tb_flush_jmp_cache
> =E2=96=92
>    0,63%  qemu-system-arm  qemu-system-arm                [.]
> address_space_ldl_le
> =E2=96=92
>    0,62%  qemu-system-arm  libpthread-2.32.so             [.]
> __lll_lock_wait
> =E2=96=92
>    0,58%  qemu-system-arm  libpthread-2.32.so             [.]
> pthread_cond_wait@@GLIBC_2.3.2
> =E2=96=92
>    0,52%  qemu-system-arm  qemu-system-arm                [.]
> cpu_reset_interrupt
> =E2=96=92
>    0,52%  qemu-system-arm  libc-2.32.so                   [.]
> cfree@GLIBC_2.2.5
> =E2=96=92
>    0,52%  qemu-system-arm  qemu-system-arm                [.]
> qemu_set_irq
> =E2=96=92
>
> However the absolute time is 3-4 minutes.
> And I don't know where I should start optimization now.
>
>
>
> Am 07.10.20 um 14:02 schrieb Alex Benn=C3=A9e:
> > Thomas Schneider <74cmonty@gmail.com> writes:
> >
> >> Are you referring to this tool?
> >> https://github.com/stefano-garzarella/qemu-boot-time
> >> <https://github.com/stefano-garzarella/qemu-boot-time>
> > No - just plain perf:
> >
> >   perf record $QEMU $ARGS
> >
> > Then a "perf report" which will show you the hotspots, for example:
> >
> >    8.92%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_t=
b_ptr
> >    4.76%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass_1
> >    3.69%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
> >    2.95%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup_cust=
om
> >    2.93%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
> >    1.28%  qemu-system-aar  qemu-system-aarch64      [.] tcg_out_opc.isr=
a.15
> >    1.09%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr_l=
pae
> >    1.09%  qemu-system-aar  [kernel.kallsyms]        [k] isolate_freepag=
es_block
> >    1.05%  qemu-system-aar  qemu-system-aarch64      [.] cpu_get_tb_cpu_=
state
> >    0.98%  qemu-system-aar  [kernel.kallsyms]        [k] do_syscall_64
> >    0.94%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup_cmp
> >    0.78%  qemu-system-aar  qemu-system-aarch64      [.] init_ts_info
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_looku=
p
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_gen_code
> >    0.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_wi=
th_attrs
> >
> >>
> >> Am 07.10.2020 um 13:00 schrieb Alex Benn=C3=A9e:
> >>> perf to record your boot
> >
>
