Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c77edsm1195181a12.54.2025.03.21.04.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:46:22 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6CD5C5F7A5;
	Fri, 21 Mar 2025 11:46:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Juan
 Quintela <quintela@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  Thomas Huth <thuth@redhat.com>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  qemu-ppc@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  qemu-s390x@nongnu.org,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Peter Xu <peterx@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  David Hildenbrand <david@redhat.com>,  Yonggang
 Luo <luoyonggang@gmail.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Beraldo Leal <bleal@redhat.com>,
  qemu-arm@nongnu.org,  Greg Kurz <groug@kaod.org>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Nicholas Piggin <npiggin@gmail.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
In-Reply-To: <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org> (Pierrick
	Bouvier's message of "Thu, 20 Mar 2025 12:52:22 -0700")
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
	<0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 21 Mar 2025 11:46:21 +0000
Message-ID: <87a59eli7m.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fnSB/RjBKfuK

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 3/19/25 11:22, Alex Benn=C3=A9e wrote:
>> The aim of this work is to get rid of the endian aware helpers in
>> gdbstub/helpers.h which due to their use of tswap() mean target
>> gdbstubs need to be built multiple times. While this series doesn't
>> actually build each stub once it introduces a new helper -
>> gdb_get_register_value() which takes a MemOp which can describe the
>> current endian state of the system. This will be a lot easier to
>> dynamically feed from a helper function.
>> The most complex example is PPC which has a helper called
>> ppc_maybe_bswap_register() which was doing this.
>> This is still an RFC so I'm interested in feedback:
>>    - is the API sane
>>    - can we avoid lots of (uint8_t *) casting?
>
> Even though the series has a good intent, the fact we make everything
> "generic" makes that we lose all guarantees we could get by relying on
> static typing, and that we had possibility of mistakes when passing
> size (which happened in patch 4 if I'm correct). And explicit casting
> comes as a *strong* warning about that.
>
> By patch 7, I was really feeling it's not a win vs explicit functions
> per size.
>
> If the goal of the series is to get rid of endian aware helpers, well,
> this can be fixed in the helpers themselves, without needing to
> introduce a "generic" size helper. Maybe we are trying to solve two
> different problems here?

It did seem natural that if you were defining a MemOp you would use all
of it rather than only its endian definition. But you are right we could
introduce the same helpers with a bool flag for endianess.

Maybe we should have fully formed mops and just assert in the helper:

  gdb_get_reg32(MemOp op, GByteArray *buf, uint32_t val) {
      g_assert(op & MO_SIZE =3D=3D MO_32);
      gdb_get_register_value(op, buf, &val);
  }

I was also trying to avoid over boilerplating the code.

>
>>    - should we have a reverse helper for setting registers
>> If this seems like the right approach I can have a go at more of the
>> frontends later.
>> There are a few other misc clean-ups I did on the way which might be
>> worth cherry picking for 10.0 but I'll leave that up to maintainers.
>> Alex.
>> Alex Benn=C3=A9e (10):
>>    include/gdbstub: fix include guard in commands.h
>>    gdbstub: introduce target independent gdb register helper
>>    target/arm: convert 32 bit gdbstub to new helper
>>    target/arm: convert 64 bit gdbstub to new helper
>>    target/ppc: expand comment on FP/VMX/VSX access functions
>>    target/ppc: make ppc_maybe_bswap_register static
>>    target/ppc: convert gdbstub to new helper (!hacky)
>>    gdbstub: assert earlier in handle_read_all_regs
>>    include/exec: fix assert in size_memop
>>    target/microblaze: convert gdbstub to new helper
>>   include/exec/memop.h        |   4 +-
>>   include/gdbstub/commands.h  |   2 +-
>>   include/gdbstub/registers.h |  30 ++++++
>>   target/ppc/cpu.h            |   8 +-
>>   gdbstub/gdbstub.c           |  24 ++++-
>>   target/arm/gdbstub.c        |  57 +++++++----
>>   target/arm/gdbstub64.c      |  53 ++++++----
>>   target/microblaze/gdbstub.c |  44 ++++----
>>   target/ppc/gdbstub.c        | 194 ++++++++++++++++++++----------------
>>   9 files changed, 257 insertions(+), 159 deletions(-)
>>   create mode 100644 include/gdbstub/registers.h
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
