Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j13sm2199053wrd.81.2021.04.30.02.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 02:52:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B0BC81FF7E;
	Fri, 30 Apr 2021 10:52:00 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-6-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost
 <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Fri, 30 Apr 2021 10:51:56 +0100
In-reply-to: <20210415163304.4120052-6-philmd@redhat.com>
Message-ID: <87im44w14v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9BEiPhnyvoRF


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The sve_tests_sve_off_kvm() test is KVM specific.
> Only run it if KVM is available.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/qtest/arm-cpu-features.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-feature=
s.c
> index 7f4b2521277..66300c3bc20 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -604,6 +604,8 @@ int main(int argc, char **argv)
>      if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm=
")) {
>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                              NULL, test_query_cpu_model_expansion_kvm);
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> +                            NULL, sve_tests_sve_off_kvm);
>      }
>=20=20
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
> @@ -611,8 +613,6 @@ int main(int argc, char **argv)
>                              NULL, sve_tests_sve_max_vq_8);
>          qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
>                              NULL, sve_tests_sve_off);
> -        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> -                            NULL, sve_tests_sve_off_kvm);
>      }
>=20=20
>      return g_test_run();


--=20
Alex Benn=C3=A9e
