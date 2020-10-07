Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y6sm2664036wrt.80.2020.10.07.05.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 05:02:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E572E1FF7E;
	Wed,  7 Oct 2020 13:02:30 +0100 (BST)
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
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Schneider <74cmonty@gmail.com>
Cc: Paul Zimmerman <pauldzim@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com>
Date: Wed, 07 Oct 2020 13:02:30 +0100
Message-ID: <87362q1bxl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sBYERaRf64Jc


Thomas Schneider <74cmonty@gmail.com> writes:

> Are you referring to this tool?
> https://github.com/stefano-garzarella/qemu-boot-time=20
> <https://github.com/stefano-garzarella/qemu-boot-time>

No - just plain perf:

  perf record $QEMU $ARGS

Then a "perf report" which will show you the hotspots, for example:

   8.92%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_tb_ptr
   4.76%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass_1
   3.69%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
   2.95%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup_custom
   2.93%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
   1.28%  qemu-system-aar  qemu-system-aarch64      [.] tcg_out_opc.isra.15
   1.09%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr_lpae
   1.09%  qemu-system-aar  [kernel.kallsyms]        [k] isolate_freepages_b=
lock
   1.05%  qemu-system-aar  qemu-system-aarch64      [.] cpu_get_tb_cpu_state
   0.98%  qemu-system-aar  [kernel.kallsyms]        [k] do_syscall_64
   0.94%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup_cmp
   0.78%  qemu-system-aar  qemu-system-aarch64      [.] init_ts_info
   0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_lookup
   0.73%  qemu-system-aar  qemu-system-aarch64      [.] tb_gen_code
   0.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_with_a=
ttrs

>
>
> Am 07.10.2020 um 13:00 schrieb Alex Benn=C3=A9e:
>> perf to record your boot


--=20
Alex Benn=C3=A9e
