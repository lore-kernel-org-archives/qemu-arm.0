Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n10-20020a1c720a000000b003fa96620b23sm5513602wmc.12.2023.06.27.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:58:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3A6231FFBB;
	Tue, 27 Jun 2023 10:58:08 +0100 (BST)
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
 <20230626215926.2522656-9-alex.bennee@linaro.org>
 <87h6qtcpup.fsf@secure.mitica>
 <2274a813-af8f-6447-6dbd-04f2f4f2beba@linaro.org>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, Alexander Bulekov
 <alxndr@bu.edu>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Alexandre
 Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Riku Voipio <riku.voipio@iki.fi>, Peter
 Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Leonardo Bras <leobras@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>, Mahmoud
 Mandour <ma.mandourr@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <eduardo@habkost.net>, Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Radoslaw Biernacki <rad@semihalf.com>, Marcin
 Juszkiewicz <marcin.juszkiewicz@linaro.org>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 08/26] tests/qtests: clean-up and fix leak in
 generic_fuzz
Date: Tue, 27 Jun 2023 10:57:44 +0100
In-reply-to: <2274a813-af8f-6447-6dbd-04f2f4f2beba@linaro.org>
Message-ID: <87r0px1b2n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RkBelm8TqeYK


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 27/6/23 09:43, Juan Quintela wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>> An update to the clang tooling detects more issues with the code
>>> including a memory leak from the g_string_new() allocation. Clean up
>>> the code with g_autoptr and use ARRAY_SIZE while we are at it.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>>   tests/qtest/fuzz/generic_fuzz.c | 11 ++++-------
>>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic=
_fuzz.c
>>> index c525d22951..a4841181cc 100644
>>> --- a/tests/qtest/fuzz/generic_fuzz.c
>>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>>> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>>>               .crossover =3D generic_fuzz_crossover
>>>       });
>>>   -    GString *name;
>>> +    g_autoptr(GString) name =3D g_string_new("");
>>>       const generic_fuzz_config *config;
>>>   -    for (int i =3D 0;
>>> -         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
>>> -         i++) {
>>> +    for (int i =3D 0; i < ARRAY_SIZE(predefined_configs); i++) {
>>>           config =3D predefined_configs + i;
>>> -        name =3D g_string_new("generic-fuzz");
>>> -        g_string_append_printf(name, "-%s", config->name);
>>> +        g_string_printf(name, "generic-fuzz-%s", config->name);
>>>           fuzz_add_target(&(FuzzTarget){
>>> -                .name =3D name->str,
>>> +                .name =3D g_strdup(name->str),
>>>                   .description =3D "Predefined generic-fuzz config.",
>>>                   .get_init_cmdline =3D generic_fuzz_predefined_config_=
cmdline,
>>>                   .pre_fuzz =3D generic_pre_fuzz,
>> Once that you are here, what about?
>> (Yes, I didn't care about the ARRAY_SIZE) but you got the idea.
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> To your proposal with/without the change that I proposse.
>> modified   tests/qtest/fuzz/generic_fuzz.c
>> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>>               .crossover =3D generic_fuzz_crossover
>>       });
>>   -    GString *name;
>>       const generic_fuzz_config *config;
>>         for (int i =3D 0;
>>            i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
>>            i++) {
>>           config =3D predefined_configs + i;
>> -        name =3D g_string_new("generic-fuzz");
>> -        g_string_append_printf(name, "-%s", config->name);
>>           fuzz_add_target(&(FuzzTarget){
>> -                .name =3D name->str,
>> +                .name =3D g_strdup_printf("generic-fuzz-%s", config->na=
me),
>
> Even simpler is g_strconcat() suggested by Richard in v1:
> https://lore.kernel.org/qemu-devel/42b497a0-e234-64db-e845-1c37b67839fc@l=
inaro.org/

Doh - missed that will fix up.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
