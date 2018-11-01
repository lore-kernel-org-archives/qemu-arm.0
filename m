Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp602861wro;
        Thu, 1 Nov 2018 03:04:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5evrc2EHbwcQM+BU4harMxMD2OwZ2ffOtTSkrp7v5UbeuA6MAYyccZg9Ic4V896F0J8uTS9
X-Received: by 2002:a0c:da86:: with SMTP id z6mr6048107qvj.84.1541066694050;
        Thu, 01 Nov 2018 03:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541066694; cv=none;
        d=google.com; s=arc-20160816;
        b=Bh39FWKq2t6R0HcoenU40bBBubSA6cszyDL6AV/NQlPwvx0JV3MUsDxuSCou0N+mQ+
         jiWHUXaz8SEz01Tczz+s2xsQnnPeepEuAbmO60vJNfohDuxEmaJJG/QaeT6BUXII0niv
         iEFW+CV7ub4tgXVXwNoeSxONcfkAjR/C9Og6J0JIWgI9nX+6gw3MYCSVMKLLyJNpz7tH
         nWkqizpd5qP+JdOLWYnabTEJi2cIx/ujz1WiMqkf085uHJ7WMQETdexmR4127porzSlA
         PPgFhGxBqzouzdzRg74Ey+GUHm7s1eGhxkMvWY9Clv7sVl/6lgEjsSHeytrf6WKXeFfb
         OyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=X4sDeHg0CBEEZMYC3x91tNzFtAn5JOIGrWbsTQQAhQo=;
        b=YhE5LoUzP66oKLJ6Oai6T5YzyOvBqNxdKkQebMjZQmNbOFX6na6n4sxnS7FAaYtxFX
         H7IgbLmAxRY1KcQtqmuyEEqqOj1EPx312EL8mVEPVdCp0fcUqr7PNQmgrehMH19OcEWG
         r1IE4xcXQkkaw3AFrQXsjYldJkLWFruijyehF3ZZG0Iir7/h3jlZmRVkIjEm7rYgDyjy
         VkkidF7J4/L2KLq2Txe7MEUKbeWWHo+BVazy6l0WRlkUI2t4EFGhpHhOurmm9tj1+AQX
         OS+Q9CvEVCDGA/0NjqoCiH51ZTiweThtXqOdoVln4Vc1ql3K/Sl3GaehHpsNHpGX11DM
         /hSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si5995186qvv.118.2018.11.01.03.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gI9qP-0007Gb-KV
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:04:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gI9qI-0007GV-3w
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gI9qE-0006kl-U6
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 06:04:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gI9qD-0006i0-70; Thu, 01 Nov 2018 06:04:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67DC43086267;
	Thu,  1 Nov 2018 10:04:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F9F3600CC;
	Thu,  1 Nov 2018 10:04:29 +0000 (UTC)
Date: Thu, 1 Nov 2018 11:04:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20181101110427.4ffc6a0a@redhat.com>
In-Reply-To: <20181030001841.1658-1-philmd@redhat.com>
References: <20181030001841.1658-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 01 Nov 2018 10:04:36 +0000 (UTC)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZOQ2/bd2+50+

On Tue, 30 Oct 2018 01:18:40 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Fix the extraneous extra blank lines in the test output when running with=
 V=3D1.
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
>      GArray *exp_tables =3D g_array_new(false, true, sizeof(AcpiSdtTable)=
);
> +    if (getenv("V")) {
> +        fputc('\n', stderr);
> +    }
>      for (i =3D 0; i < data->tables->len; ++i) {
>          AcpiSdtTable exp_sdt;
>          gchar *aml_file =3D NULL;
> @@ -385,7 +388,7 @@ try_again:
>          aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data->mac=
hine,
>                                     (gchar *)&sdt->header.signature, ext);
>          if (getenv("V")) {
> -            fprintf(stderr, "\nLooking for expected file '%s'\n", aml_fi=
le);
> +            fprintf(stderr, "Looking for expected file '%s'\n", aml_file=
);
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

