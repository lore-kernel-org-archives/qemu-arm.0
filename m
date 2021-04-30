Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f6sm2638620wrt.19.2021.04.30.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:40:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 56F4A1FF7E;
	Fri, 30 Apr 2021 16:40:42 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-10-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Claudio Fontana
 <cfontana@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Laurent
 Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
Date: Fri, 30 Apr 2021 16:37:56 +0100
In-reply-to: <20210415163304.4120052-10-philmd@redhat.com>
Message-ID: <87v983vkzp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SMz4/LDAMo+m


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb4929..c32a2aa30a2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "ppc64") &&
>          (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>          g_test_message("Skipping test: kvm_hv not available");
>          return g_test_run();
>      }
> @@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "s390x")) {
>  #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>              g_test_message("Skipping test: kvm not available");
>              return g_test_run();
>          }

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
