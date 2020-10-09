Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q4sm10087851wru.65.2020.10.08.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 23:20:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 69E891FF7E;
	Fri,  9 Oct 2020 07:20:43 +0100 (BST)
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org>
 <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
 <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com>
 <87blhe1esd.fsf@linaro.org>
 <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com>
 <87362q1bxl.fsf@linaro.org>
 <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas <74cmonty@gmail.com>
Cc: Paul Zimmerman <pauldzim@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <2e3754fb-8b3c-4ef2-989f-a0015ef3a7e8@gmail.com>
Date: Fri, 09 Oct 2020 07:20:43 +0100
Message-ID: <874kn3zzr8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EnkO7SkbRMb+


Thomas <74cmonty@gmail.com> writes:

> Interesting enough is: my top figure reported by perf is like yours:
>
> Samples: 6M of event 'cycles:u', Event count (approx.): 1936571734942
> Overhead  Command          Shared Object                  Symbol
>    7,95%  qemu-system-arm  qemu-system-arm                [.]
> helper_lookup_tb_ptr=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> =E2=97=86
>    4,16%  qemu-system-arm  qemu-system-arm                [.]
> cpu_get_tb_cpu_state=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> =E2=96=92

Not quite - cpu_get_tb_state should be a fair bit cheaper now since the
optimisations to hflags where introduced.

>    2,52%  qemu-system-arm  libpthread-2.32.so             [.]
> __pthread_mutex_lock=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> =E2=96=92

This indicated there is some lock contention. The QSP profiler can
help here.

Are you running the latest state of master?

--=20
Alex Benn=C3=A9e
