Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5d1a73sm298284566b.87.2024.07.16.03.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:54:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 94C085F7A0;
	Tue, 16 Jul 2024 11:54:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Free GDB command data
In-Reply-To: <CAFEAcA9_x1BUnip+cB0kKqaUSrLY6hiubCjQ9D4-pSXM1ytVJA@mail.gmail.com>
	(Peter Maydell's message of "Tue, 16 Jul 2024 11:41:31 +0100")
References: <20240714-arm-v1-1-c045bad45e48@daynix.com>
	<CAFEAcA9_x1BUnip+cB0kKqaUSrLY6hiubCjQ9D4-pSXM1ytVJA@mail.gmail.com>
Date: Tue, 16 Jul 2024 11:54:47 +0100
Message-ID: <87y161haiw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z4vBCc5YB2Cz

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 14 Jul 2024 at 11:43, Akihiko Odaki <akihiko.odaki@daynix.com> wr=
ote:
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>  target/arm/gdbstub.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index c3a9b5eb1ed2..03f77362efc1 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -477,11 +477,11 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_fea=
ture(CPUState *cs,
>>
>>  void arm_cpu_register_gdb_commands(ARMCPU *cpu)
>>  {
>> -    GArray *query_table =3D
>> +    g_autoptr(GArray) query_table =3D
>>          g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
>> -    GArray *set_table =3D
>> +    g_autoptr(GArray) set_table =3D
>>          g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
>> -    GString *qsupported_features =3D g_string_new(NULL);
>> +    g_autoptr(GString) qsupported_features =3D g_string_new(NULL);
>>
>>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>>      #ifdef TARGET_AARCH64
>> @@ -495,6 +495,7 @@ void arm_cpu_register_gdb_commands(ARMCPU *cpu)
>>          gdb_extend_query_table(&g_array_index(query_table,
>>                                                GdbCmdParseEntry, 0),
>>                                                query_table->len);
>> +        g_array_free(g_steal_pointer(&query_table), FALSE);
>>      }
>>
>>      /* Set arch-specific handlers for 'Q' commands. */
>> @@ -502,11 +503,13 @@ void arm_cpu_register_gdb_commands(ARMCPU *cpu)
>>          gdb_extend_set_table(&g_array_index(set_table,
>>                               GdbCmdParseEntry, 0),
>>                               set_table->len);
>> +        g_array_free(g_steal_pointer(&set_table), FALSE);
>>      }
>>
>>      /* Set arch-specific qSupported feature. */
>>      if (qsupported_features->len) {
>>          gdb_extend_qsupported_features(qsupported_features->str);
>> +        g_string_free(g_steal_pointer(&qsupported_features), FALSE);
>>      }
>>  }
>
> I don't think this is the right approach to this leak (which
> Coverity also complained about):
>
> https://lore.kernel.org/qemu-devel/CAFEAcA8YJwWtQxdOe2wmH7i0jvjU=3DUV92oe=
B6vUzT1GrQhRsTQ@mail.gmail.com/
>
> I think the underlying problem is that the gdb_extend_query_table
> and gdb_extend_set_table functions have a weird API where they
> retain pointers to a chunk of the contents of the GArray but
> they don't get passed the actual GArray. My take is that it
> would be better to make the API to those functions more natural
> (either "take the whole GArray and take ownership of it" or
> else "copy the info they need and the caller retains ownership
> of both the GArray and its contents").
>
> Also, there is a second leak here if you have more than one
> CPU -- when the second CPU calls gdb_extend_query_table() etc,
> the function will leak the first CPU's data. Having the function
> API be clearly either "always takes ownership" or "never takes
> ownership" would make it easier to fix this leak too.

I'm working on cleaning this API up to make it easier to use. I'll send
a patch once its tested.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
