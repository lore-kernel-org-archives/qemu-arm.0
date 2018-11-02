Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2618530wro;
        Fri, 2 Nov 2018 15:03:49 -0700 (PDT)
X-Google-Smtp-Source: AJdET5drjhg7P5XOjhuIzegxlnQ1EyyDvotfojg2AdejnNIXBbBgGNWsqgooivMsJmQnXs09+ACi
X-Received: by 2002:a37:5887:: with SMTP id m129-v6mr12516223qkb.58.1541196229787;
        Fri, 02 Nov 2018 15:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541196229; cv=none;
        d=google.com; s=arc-20160816;
        b=lnB1/Ifa3gNXfDRGiDxX6f6CZrR7ZqLDmbrExy7ART58vtoDp4fNhDdpHvqNeOp2fo
         0omAzHLIYrFKP4koWfoUOODCv6ipzdUyQUg1x5oPTb2ut5VviCykSRCwZXP4mWX9Rzyo
         ATKJQT2ZBQ7HaBZhcnhOP7xDEIAXmzPJIXSL/1r22uzxVVO9CGJZr2vL/VY3F4Hc4bSC
         jwxAaUP7kNLCmtHtKMK53mB2rjhMS0IXHr/N2eVnUrpQsXTTIbLBtvo21aGCsiZ1qgRh
         N+B2qhbs3BX6q/aNCNH9zSVfq2+OHcduzubRJGiyYKDdzfFSNqapfafGna14sYegi9r+
         VNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=24C4BkHKeo7vdh1A2Cc54S5ep9q9Nk8b9co4+zoKrgc=;
        b=ymT0yJ4ISGc8VJve29YekL5sHZcXZNSMuZI7YkhMlGoiAuk9coEUqlcZwrHmdLApex
         rOmZ2VZ/Mql/9FBxQUtb0XVj2lh1aEWrAU6ekoJnyNJy/a9x326UJ05PySFULwEFaA64
         nwok5NVX1GryNmOYTUUFwYBF0entk9fQYBWnFsJGA93KR55PdeAxCAhBEXsCOSWGfcvz
         88GVNsUKSp6FO0oiUt29ZVe43UzA5gFwe54HqzpNmi48Aw5X6tLUyDe4M5DSqCIXrcoS
         Z+763vVyd8dICzgBoklzEAgW98Qhi13P4aoW7SJav+nDGEVDQYsHxG+ri8Ij5ShmwysX
         DycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j90si2007688qtd.27.2018.11.02.15.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 15:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIhXh-0001iQ-7u
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 18:03:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gIhXU-0001iJ-Eu
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 18:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gIhXR-0000Sh-20
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 18:03:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gIhXQ-0000Ly-FT; Fri, 02 Nov 2018 18:03:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6D7E308FB8B;
	Fri,  2 Nov 2018 22:03:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 675FF5D9D1;
	Fri,  2 Nov 2018 22:03:16 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181030001841.1658-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <d6148cb9-9cab-1aa2-18c8-ed9e076fd9c2@redhat.com>
Date: Fri, 2 Nov 2018 22:03:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181030001841.1658-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 02 Nov 2018 22:03:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] tests/bios-tables-test: Sanitize test
 verbose output
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLNpztGJwk++

On 2018-10-30 00:18, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix the extraneous extra blank lines in the test output when running wi=
th V=3D1.
>=20
> Before:
>=20
>     TEST: tests/bios-tables-test... (pid=3D25678)
>       /i386/acpi/piix4:
>     Looking for expected file 'tests/acpi-test-data/pc/DSDT'
>=20
>     Using expected file 'tests/acpi-test-data/pc/DSDT'
>=20
>     Looking for expected file 'tests/acpi-test-data/pc/FACP'
>=20
>     Using expected file 'tests/acpi-test-data/pc/FACP'
>=20
>     Looking for expected file 'tests/acpi-test-data/pc/APIC'
>=20
>     Using expected file 'tests/acpi-test-data/pc/APIC'
>=20
>     Looking for expected file 'tests/acpi-test-data/pc/HPET'
>=20
>     Using expected file 'tests/acpi-test-data/pc/HPET'
>     OK
>=20
> After:
>=20
>     TEST: tests/bios-tables-test... (pid=3D667)
>       /i386/acpi/piix4:
>     Looking for expected file 'tests/acpi-test-data/pc/DSDT'
>     Using expected file 'tests/acpi-test-data/pc/DSDT'
>     Looking for expected file 'tests/acpi-test-data/pc/FACP'
>     Using expected file 'tests/acpi-test-data/pc/FACP'
>     Looking for expected file 'tests/acpi-test-data/pc/APIC'
>     Using expected file 'tests/acpi-test-data/pc/APIC'
>     Looking for expected file 'tests/acpi-test-data/pc/HPET'
>     Using expected file 'tests/acpi-test-data/pc/HPET'
>     OK
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/bios-tables-test.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 4e24930c4b..02dd48de0d 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -371,6 +371,9 @@ static GArray *load_expected_aml(test_data *data)
>      gboolean ret;
> =20
>      GArray *exp_tables =3D g_array_new(false, true, sizeof(AcpiSdtTabl=
e));
> +    if (getenv("V")) {
> +        fputc('\n', stderr);
> +    }
>      for (i =3D 0; i < data->tables->len; ++i) {
>          AcpiSdtTable exp_sdt;
>          gchar *aml_file =3D NULL;
> @@ -385,7 +388,7 @@ try_again:
>          aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data->m=
achine,
>                                     (gchar *)&sdt->header.signature, ex=
t);
>          if (getenv("V")) {
> -            fprintf(stderr, "\nLooking for expected file '%s'\n", aml_=
file);
> +            fprintf(stderr, "Looking for expected file '%s'\n", aml_fi=
le);
>          }
>          if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
>              exp_sdt.aml_file =3D aml_file;
> @@ -397,7 +400,7 @@ try_again:
>          }
>          g_assert(exp_sdt.aml_file);
>          if (getenv("V")) {
> -            fprintf(stderr, "\nUsing expected file '%s'\n", aml_file);
> +            fprintf(stderr, "Using expected file '%s'\n", aml_file);
>          }
>          ret =3D g_file_get_contents(aml_file, &exp_sdt.aml,
>                                    &exp_sdt.aml_len, &error);
>=20

Could we please get rid of the getenv + fprintf here and use
g_test_message() instead, like we already do in most of the other tests
that want to log additional output?

  Thomas
