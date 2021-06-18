Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r6sm8877577wrt.21.2021.06.18.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 08:25:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BC13D1FF7E;
	Fri, 18 Jun 2021 16:25:35 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-64-alex.bennee@linaro.org>
 <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Claudio Fontana
 <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v16 63/99] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
Date: Fri, 18 Jun 2021 16:25:00 +0100
In-reply-to: <24538cd3-0e17-7c32-4b71-8ca994f5cdc9@linaro.org>
Message-ID: <87bl83dwk0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: g+tvXY+IdbJG


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana<cfontana@suse.de>
>> test is TCG-only.
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> Cc: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>
> The new qtest_has_accel should be used instead of an ifdef.

I think I can drop the whole patch as nothing is added unless:

    } else if (strcmp(arch, "aarch64") =3D=3D 0 && tcg_accel_available) {

further down.

>
>
> r~


--=20
Alex Benn=C3=A9e
