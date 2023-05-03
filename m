Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4d8c000000b003063408dd62sm5391765wru.65.2023.05.03.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:35:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 87B471FFBA;
	Wed,  3 May 2023 11:35:35 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-23-alex.bennee@linaro.org>
 <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 22/22] tests/qtest: skip bcm2835-test if no raspi3b model
Date: Wed, 03 May 2023 11:34:53 +0100
In-reply-to: <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
Message-ID: <877ctpu2h4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6cF9AcRTAubk


Thomas Huth <thuth@redhat.com> writes:

> On 03/05/2023 11.12, Alex Benn=C3=A9e wrote:
>> We can't assume the machine exists and should gracefully skip the test
>> if we haven't built the model. This is ostensibly fixed by
>> db2237c459 (tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI)
>> but I still hit it during my tests.
>
> The problem is likely that you build aarch64-softmmu with the minimal
> config, but still keep arm-softmmu around with the full config? Then
> CONFIG_RASPI will still be set at the meson.build level since it is
> taken from config-all-devices.mak here.
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/bcm2835-dma-test.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>> diff --git a/tests/qtest/bcm2835-dma-test.c
>> b/tests/qtest/bcm2835-dma-test.c
>> index 8293d822b9..2e6245e9e2 100644
>> --- a/tests/qtest/bcm2835-dma-test.c
>> +++ b/tests/qtest/bcm2835-dma-test.c
>> @@ -107,12 +107,11 @@ static void bcm2835_dma_test_interrupts(void)
>>     int main(int argc, char **argv)
>>   {
>> -    int ret;
>>       g_test_init(&argc, &argv, NULL);
>> -    qtest_add_func("/bcm2835/dma/test_interrupts",
>> +    if (qtest_has_machine("raspi3b")) {
>> +        qtest_add_func("/bcm2835/dma/test_interrupts",
>>                      bcm2835_dma_test_interrupts);
>> -    qtest_start("-machine raspi3b");
>> -    ret =3D g_test_run();
>> -    qtest_end();
>
> Where did the qtest_end() go?

Yeah I dropped it because other tests seem to use the return
g_test_run() pattern. Maybe they are wrong?

>
> It's maybe cleaner if you move the qtest_start() and qtest_end() calls
> into the bcm2835_dma_test_interrupts() function instead.
>
>  Thomas
>
>
>> -    return ret;
>> +        qtest_start("-machine raspi3b");
>> +    }
>> +    return g_test_run();
>>   }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
