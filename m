Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j17sm4173663wrb.35.2019.07.12.06.35.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 06:35:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 949B31FF87;
	Fri, 12 Jul 2019 14:35:20 +0100 (BST)
References: <20190712111849.9006-1-alex.bennee@linaro.org> <20190712111849.9006-6-alex.bennee@linaro.org> <a8137849-8d9c-bd87-523f-f2c7cdfa013c@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 5/7] tests/migration-test: don't spam the logs when we fail
In-reply-to: <a8137849-8d9c-bd87-523f-f2c7cdfa013c@redhat.com>
Date: Fri, 12 Jul 2019 14:35:20 +0100
Message-ID: <87y313cr53.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GxaKBUJi+2/O


Laurent Vivier <lvivier@redhat.com> writes:

> On 12/07/2019 13:18, Alex Benn=C3=A9e wrote:
>> Quite often the information about which test failed is hidden by the
>> wall of repeated failures for each page. Stop outputting the error
>> after 10 bad pages and just summarise the total damage at the end.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/migration-test.c | 19 ++++++++++++-------
>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/migration-test.c b/tests/migration-test.c
>> index b6434628e1c..ce041f80c2a 100644
>> --- a/tests/migration-test.c
>> +++ b/tests/migration-test.c
>> @@ -308,7 +308,7 @@ static void check_guests_ram(QTestState *who)
>>      uint8_t first_byte;
>>      uint8_t last_byte;
>>      bool hit_edge =3D false;
>> -    bool bad =3D false;
>> +    int bad =3D 0;
>>
>>      qtest_memread(who, start_address, &first_byte, 1);
>>      last_byte =3D first_byte;
>> @@ -327,15 +327,20 @@ static void check_guests_ram(QTestState *who)
>>                  hit_edge =3D true;
>>                  last_byte =3D b;
>>              } else {
>> -                fprintf(stderr, "Memory content inconsistency at %x"
>> -                                " first_byte =3D %x last_byte =3D %x cu=
rrent =3D %x"
>> -                                " hit_edge =3D %x\n",
>> -                                address, first_byte, last_byte, b, hit_=
edge);
>> -                bad =3D true;
>> +                bad++;
>> +                if (bad <=3D 10) {
>> +                    fprintf(stderr, "Memory content inconsistency at %x"
>> +                            " first_byte =3D %x last_byte =3D %x curren=
t =3D %x"
>> +                            " hit_edge =3D %x\n",
>> +                            address, first_byte, last_byte, b, hit_edge=
);
>> +                }
>>              }
>>          }
>>      }
>> -    g_assert_false(bad);
>> +    if (bad >=3D 10) {
>> +        fprintf(stderr, "and in another %d pages", bad);
>
> "bad - 10" as you have already displayed 10 errors.

Will do.

>
> Thanks,
> Laurent


--
Alex Benn=C3=A9e
