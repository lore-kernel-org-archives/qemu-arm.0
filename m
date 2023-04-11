Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b002efebaf3571sm7327060wrq.64.2023.04.11.01.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:28:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 732391FFB7;
	Tue, 11 Apr 2023 09:28:14 +0100 (BST)
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Date: Tue, 11 Apr 2023 09:26:56 +0100
In-reply-to: <20230321150220.mfrvgxg3ebju5e6k@orel>
Message-ID: <87ile2rffl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Sk2c/NYh9oj/


Andrew Jones <andrew.jones@linux.dev> writes:

> On Tue, Mar 07, 2023 at 11:28:42AM +0000, Alex Benn=C3=A9e wrote:
>> This adds a fairly brain dead torture test for TLB flushes intended
>> for stressing the MTTCG QEMU build. It takes the usual -smp option for
>> multiple CPUs.
>>=20
<snip>
>
> BTW, have you tried running these tests as standalone? Since they're
> 'nodefault' it'd be good if they work that way.

It works but I couldn't get it to skip pass the nodefault check
automaticaly:

  env run_all_tests=3D1 QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-syst=
em-aarch64 ./tests/tcg.computed=20
  BUILD_HEAD=3Dc9cf6e90
  Test marked not to be run by default, are you sure (y/N)?

>
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::page_other]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'page'
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::all_self]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'self'
>> +groups =3D nodefault mttcg
>> +
>> +[tlbflush-code::page_self]
>> +file =3D tlbflush-code.flat
>> +smp =3D $(($MAX_SMP>4?4:$MAX_SMP))
>> +extra_params =3D -append 'page self'
>> +groups =3D nodefault mttcg
>> +
>> --=20
>> 2.39.2
>>
>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
