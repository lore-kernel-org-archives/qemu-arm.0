Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm24067905e9.35.2025.03.21.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:38:29 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 83EFD5F7A5;
	Fri, 21 Mar 2025 11:38:28 +0000 (GMT)
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
Subject: Re: [PATCH 04/10] target/arm: convert 64 bit gdbstub to new helper
In-Reply-To: <e03abbd9-cb20-4a98-a112-66d13a76d244@linaro.org> (Pierrick
	Bouvier's message of "Thu, 20 Mar 2025 12:42:15 -0700")
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
	<20250319182255.3096731-5-alex.bennee@linaro.org>
	<e03abbd9-cb20-4a98-a112-66d13a76d244@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 21 Mar 2025 11:38:28 +0000
Message-ID: <87frj6likr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jtMYVEos+5r1

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 3/19/25 11:22, Alex Benn=C3=A9e wrote:
>> For some of the helpers we need a temporary variable to copy from
>> although we could add some helpers to return pointers into env in
>> those cases if we wanted to.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/arm/gdbstub64.c | 53 ++++++++++++++++++++++++++----------------
>>   1 file changed, 33 insertions(+), 20 deletions(-)
>> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>> index 1a4dbec567..793332af31 100644
>> --- a/target/arm/gdbstub64.c
>> +++ b/target/arm/gdbstub64.c
>> @@ -20,7 +20,7 @@
>>   #include "qemu/log.h"
>>   #include "cpu.h"
>>   #include "internals.h"
>> -#include "gdbstub/helpers.h"
>> +#include "gdbstub/registers.h"
>>   #include "gdbstub/commands.h"
>>   #include "tcg/mte_helper.h"
>>   #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>> @@ -35,15 +35,16 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByt=
eArray *mem_buf, int n)
>>         if (n < 31) {
>>           /* Core integer register.  */
>> -        return gdb_get_reg64(mem_buf, env->xregs[n]);
>> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &en=
v->xregs[n]);
>>       }
>>       switch (n) {
>>       case 31:
>> -        return gdb_get_reg64(mem_buf, env->xregs[31]);
>> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &en=
v->xregs[31]);
>>       case 32:
>> -        return gdb_get_reg64(mem_buf, env->pc);
>> +        return gdb_get_register_value(MO_TEUO, mem_buf, (uint8_t *) &en=
v->pc);
>
> For the 3 occurrences, should it be MO_TEUQ instead?

>> -        int vq =3D sve_vqm1_for_el(env, arm_current_el(env)) + 1;
>> -        return gdb_get_reg64(buf, vq * 2);
>> +        uint64_t vq =3D (sve_vqm1_for_el(env, arm_current_el(env)) + 1)=
 * 2;
>> +        return gdb_get_register_value(MO_TEUL, buf, (uint8_t *) &vq);
>>       }
>
> Should it be MO_TEUQ instead?

I've taken Philippe's suggestion and used explicit MO_32/64 which is
easier to follow.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
