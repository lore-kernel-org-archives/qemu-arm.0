Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id eq18-20020a170907291200b006da97b09661sm8133596ejc.17.2022.03.15.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:01:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DBDF01FFB7;
	Tue, 15 Mar 2022 14:01:37 +0000 (GMT)
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, sw@weilnetz.de
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Date: Tue, 15 Mar 2022 13:59:59 +0000
In-reply-to: <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
Message-ID: <87a6dr48n2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hpzpCh1ikqrp


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 15/3/22 13:12, Alex Benn=C3=A9e wrote:
>> Another cleanup patch tripped over the fact we weren't being careful
>> in our casting. Fix the casts, allow for a non-const and switch from
>> g_realloc to g_renew.
>> The whole semihosting argument handling could do with some tests
>> though.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   semihosting/config.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/semihosting/config.c b/semihosting/config.c
>> index 137171b717..50d82108e6 100644
>> --- a/semihosting/config.c
>> +++ b/semihosting/config.c
>> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>>       bool enabled;
>>       SemihostingTarget target;
>>       Chardev *chardev;
>> -    const char **argv;
>> +    char **argv;
>>       int argc;
>>       const char *cmdline; /* concatenated argv */
>>   } SemihostingConfig;
>> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>>       if (strcmp(name, "arg") =3D=3D 0) {
>>           s->argc++;
>>           /* one extra element as g_strjoinv() expects NULL-terminated a=
rray */
>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>> -        s->argv[s->argc - 1] =3D val;
>> +        s->argv =3D g_renew(char *, s->argv, s->argc + 1);
>> +        s->argv[s->argc - 1] =3D g_strdup(val);
>
> Why strdup()?

The compiler was having issues with adding a const char * into the array
and it was the quickest way to stop it complaining. I'm not sure what
guarantees you can make about a const char * after you leave the scope
of the function.

>
>>           s->argv[s->argc] =3D NULL;
>>       }
>>       return 0;


--=20
Alex Benn=C3=A9e
