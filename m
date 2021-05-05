Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp256032lfg;
        Wed, 5 May 2021 05:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWDELUDBei2Mcphvx/6ywTOp/7X3AUJNSuHC8DNoRx/IULiT1wG6fXDV09HycKJsm1GhwX
X-Received: by 2002:a17:906:3b13:: with SMTP id g19mr27273110ejf.238.1620218198509;
        Wed, 05 May 2021 05:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620218198; cv=none;
        d=google.com; s=arc-20160816;
        b=LZ24FK/0deq5PHrM+0IAzPxoArUWTCmcnRJDdkG9mK8um40jicNma7KPpU4Vdt6o33
         cy47sz63x3DNKYlJ+1Vxu9MgUV4MgqbLNRgv6urhOBO6TY1JnKsFmuCfFOYk42XFvqP0
         ENMQuRBKS/nVEasYHvfeHXevA5SCsL83fpg6iTsLmilMgUlyYxemiKKEmXiRhHaH6JYF
         FBlzeLHp+IMpO8EK2+ePu+43rCdeOE5R3SohR5MOzify7FG8v9UMEWzVBGBEf8SEXdtM
         ds1y55f3l4Cp9WufwNgxTFMVFGWm8sUmv4c3zarPYJJti0zqPNxMk2HEyJegHq/0Dwt4
         l7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=ogYmNKWR9ZkckddfL12BxYTI9aXpldL3OP0i8oAuYUQ=;
        b=IEdgUt6/E+0bgKn1vjUH6hOtjw/9S8kuGxpVKEtAjxTd+K0HsqpnmlpJ2LC23och+a
         DFkQvlYdK5ucsvHphJEeLxFVoBZy59PA1Ih9k3872tmgPyT/2JPHGj9wMeLWLcDbsolu
         9D0UAL3LscK97ceYz2IWLSuafpizw9U9zC8RBP+efgCufxwK0p6xGTAoMqF4A4KrwGlZ
         ecqtJVR7cJqvPlJ4NTkpwqsHcmYPlGQf0U0cJTwJHSOM4eIOB/qxEg3AsUzRqZquSfZX
         osNZE5ZNMNDLWRoGGspz6M/PM/0Nrpkvf39dGkdqsSP6S+Tv7rrcORK33YPW5Vzx9/mo
         Xzhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G/hlCvCZ";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g8si5290117ejj.29.2021.05.05.05.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G/hlCvCZ";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620218197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogYmNKWR9ZkckddfL12BxYTI9aXpldL3OP0i8oAuYUQ=;
	b=G/hlCvCZM7l65V8QTbsEM2O9pdm8ogDwdtAmwZgmMyIM5duARZDispaFr0d2ZNtyGYa49X
	MrjkoiN6J6gS4EuoCR3gLEOLUO93desoaDGQeD1DOYDeunJWGKdHxbn+8HmNxDqKFFXzw5
	owYSLyigY0FUfhGl8F7hZinvPuXehOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-uSQHvLDdMZ-TH-TiPE4QIQ-1; Wed, 05 May 2021 08:36:33 -0400
X-MC-Unique: uSQHvLDdMZ-TH-TiPE4QIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D9A835DE1;
	Wed,  5 May 2021 12:36:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2983620DE;
	Wed,  5 May 2021 12:36:26 +0000 (UTC)
Date: Wed, 5 May 2021 14:36:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Message-ID: <20210505143625.5fa539e8@redhat.com>
In-Reply-To: <20210503211020.894589-12-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
	<20210503211020.894589-12-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dbcLnc7guSzz

On Mon,  3 May 2021 23:10:19 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v5 had:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> v6 is simplified and keeps the same logic, however since
> it is different, I'm not keeping the R-b tags.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index ad877baeb1b..762d154b340 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>      QTestState *qts;
>  } test_data;
> =20
> +static bool tcg_accel_available;
>  static char disk[] =3D "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir =3D "tests/data/acpi";
>  #ifdef CONFIG_IASL
> @@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_d=
ata *data)
>      char *args;
>      bool use_uefi =3D data->uefi_fl1 && data->uefi_fl2;
> =20
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);
> =20
>      args =3D test_acpi_create_args(data, params, use_uefi);
>      data->qts =3D qtest_init(args);
> @@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
> =20
>      g_test_init(&argc, &argv, NULL);
> =20
> +    tcg_accel_available =3D qtest_has_accel("tcg");
> +
>      if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
>          ret =3D boot_sector_init(disk);
>          if (ret) {
> @@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
>          qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
);
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
> -        if (strcmp(arch, "x86_64") =3D=3D 0) {
> +        if (strcmp(arch, "x86_64") =3D=3D 0 && tcg_accel_available) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
>          }
> -    } else if (strcmp(arch, "aarch64") =3D=3D 0) {
> +    } else if (strcmp(arch, "aarch64") =3D=3D 0 && tcg_accel_available) =
{
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
