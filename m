Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b8sm9780162wmh.46.2019.07.05.06.39.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 06:39:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A1DD51FF87;
	Fri,  5 Jul 2019 14:39:52 +0100 (BST)
References: <20190705124318.1075-1-philmd@redhat.com> <db75031d-e9af-c349-903f-276ec92f850d@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Desnogues <laurent.desnogues@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm/vfp_helper: Call set_fpscr_to_host before updating to FPSCR
In-reply-to: <db75031d-e9af-c349-903f-276ec92f850d@redhat.com>
Date: Fri, 05 Jul 2019 14:39:52 +0100
Message-ID: <87v9wgvbvb.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bQKbuACGKdMH


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Correct subject: "Call set_fpscr_to_host before updating FPSCR reg"
> (or without "reg").

Queued to testing/next, thanks.

>
> On 7/5/19 2:43 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> In commit e9d652824b0 we extracted the vfp_set_fpscr_to_host()
>> function but failed at calling it in the correct place, we call
>> it after xregs[ARM_VFP_FPSCR] is modified.
>>
>> Fix by calling this function before we update FPSCR.
>>
>> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  target/arm/vfp_helper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
>> index 46041e3294..9710ef1c3e 100644
>> --- a/target/arm/vfp_helper.c
>> +++ b/target/arm/vfp_helper.c
>> @@ -197,6 +197,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_=
t val)
>>          val &=3D 0xf7c0009f;
>>      }
>>
>> +    vfp_set_fpscr_to_host(env, val);
>> +
>>      /*
>>       * We don't implement trapped exception handling, so the
>>       * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RE=
S0!)
>> @@ -217,8 +219,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_=
t val)
>>      env->vfp.qc[1] =3D 0;
>>      env->vfp.qc[2] =3D 0;
>>      env->vfp.qc[3] =3D 0;
>> -
>> -    vfp_set_fpscr_to_host(env, val);
>>  }
>>
>>  void vfp_set_fpscr(CPUARMState *env, uint32_t val)
>>


--
Alex Benn=C3=A9e
