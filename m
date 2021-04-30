Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v17sm2599717wrd.89.2021.04.30.08.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:36:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F07441FF7E;
	Fri, 30 Apr 2021 16:36:45 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-9-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, qemu-arm@nongnu.org, Claudio Fontana
 <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Date: Fri, 30 Apr 2021 16:35:34 +0100
In-reply-to: <20210415163304.4120052-9-philmd@redhat.com>
Message-ID: <87y2czvl6a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: O3WM2x9/PF81


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Since v1: use global tcg_accel_available, call qtest_has_accel() once
> ---
>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 47 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 156d4174aa3..a4c7bddf6f3 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>      QTestState *qts;
>  } test_data;
>=20=20
> +static bool tcg_accel_available;
>  static char disk[] =3D "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir =3D "tests/data/acpi";
>  #ifdef CONFIG_IASL
> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_=
data *data)
>      char *args;
>      bool use_uefi =3D data->uefi_fl1 && data->uefi_fl2;
>=20=20
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);

I find it odd that we need TCG here (especially on an x86 system) to
test what are essentially device models we use in KVM. On the other hand
it maintains the current effect with less ifdef hacks so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
