Received: by 2002:a0c:a3a3:0:0:0:0:0 with SMTP id v32csp2297385qvv;
        Mon, 3 May 2021 05:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybpHFBnfgTZ3amLn5MEC1XNORs1g4pen+ySKjegxZv8xIakAxsVMPsuw+9HI/2T13IODpv
X-Received: by 2002:a17:906:739c:: with SMTP id f28mr16022410ejl.259.1620045415319;
        Mon, 03 May 2021 05:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620045415; cv=none;
        d=google.com; s=arc-20160816;
        b=r5JENNCKxZ1C8IDhv+2zgUsoN4YsQM9xc4dyJM9iD5GRCt8PJTUkjsUWKjJYF1bhP9
         UxA1kJ+KYEz+hdDOQQBpWV4WvinrtGOBbL8S0SehMNpypIrwToqsZfnEPXkTiZoMqTvV
         mCc0S7NNav42tCr2xVUGCbDwAFHAWS3X6krPDdlcX2MWvYDpjGaL9HJ2h7QUob6KoWW9
         9Y/fGS5KlTvPfZLxkXH5l/sjxd02bKppH7Qwn6HU2lKvAFBr/M6EoYh587ClY1vmI2+y
         bNu60oZm7tOOTpm2MNUp10KId1XHvwcBE+U5T7DkH0iY7gcsD6MJzeMKgDqif6bHo0ar
         QVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=3igQNUhCbE3a5GvfM6OXBjDrklYB9819k3D5lD3AOTE=;
        b=CYMG1YF4YHFXjZpxcz/qIroEEf+D/JffhEygScSZyNqEOCc64ZdVr7BzaNf3KkRFOw
         viTkbee/rAtt7lDKNXUjyWXhl2pmxWs/pBwkoK/OBSJDU4MiK3Xyz3j4TWriBW5DIu6Q
         mU3BZixSMZOfXfvD+GzSnYUJctpwqaR2lZrkR/Gw+Vz0XCVUS2wPHuXMOggdxsf68poM
         WM4Bwttqajkm3w2LfSME9xB7cmrPjNMQsHKVxjxUjWeW1Z4s3AfgsIZdAnpkfyaoB4Io
         v1VNsMTeFr5jMJuWFRfbcRpbNfUHap9k1AGFotXnvWAXUIOfCZqpS9EM64Jxu42NP/5U
         WnIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LoytXbEg;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id k18si9818536ejv.186.2021.05.03.05.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 05:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LoytXbEg;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620045414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3igQNUhCbE3a5GvfM6OXBjDrklYB9819k3D5lD3AOTE=;
	b=LoytXbEgLuX398KOQd/usCLJk21PRmcamJAmFV9akB2ESn5IlrYGbTUlrskYMH/NyPZ8Ot
	80jPE5LAn6QMqn4RJO3u+sGmF+vE2PLtzhvWY+XMc7y14Em80AGBGqiGZJKvqFhzRTvizN
	oGfGHn5gfX1hZzXVGVD1D/PI7oQVl0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-XZIp9i4GO_ymEP0Uqsmwfw-1; Mon, 03 May 2021 08:36:50 -0400
X-MC-Unique: XZIp9i4GO_ymEP0Uqsmwfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738C1107ACCD;
	Mon,  3 May 2021 12:36:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2BF10190A7;
	Mon,  3 May 2021 12:36:41 +0000 (UTC)
Date: Mon, 3 May 2021 14:36:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Andrew Jones
 <drjones@redhat.com>, qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
Message-ID: <20210503143639.57e7c52c@redhat.com>
In-Reply-To: <20210501223638.510712-9-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
	<20210501223638.510712-9-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fnlFyDB74Qd4

On Sun,  2 May 2021 00:36:36 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 47 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 156d4174aa3..a4c7bddf6f3 100644
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
> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_=
data *data)
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
> +
stray new line?

>      test_acpi_load_tables(data, use_uefi);
> =20
>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>      const char *arch =3D qtest_get_arch();
>      int ret;
> =20
> +    tcg_accel_available =3D qtest_has_accel("tcg");
> +
>      g_test_init(&argc, &argv, NULL);
> =20
>      if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>                         test_acpi_piix4_no_root_hotplug);
>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>                         test_acpi_piix4_no_bridge_hotplug);
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem=
);
> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> -        qtest_add_func("acpi/piix4/smm-compat",
> -                       test_acpi_piix4_tcg_smm_compat);
> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> -        qtest_add_func("acpi/q35/smm-compat",
> -                       test_acpi_q35_tcg_smm_compat);
> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
> -                       test_acpi_q35_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_px=
m);
> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_h=
mat);
> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat)=
;
> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
_tcg);
> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
> -        if (strcmp(arch, "x86_64") =3D=3D 0) {
> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
> +        if (tcg_accel_available) {

most of this can run without TCG if KVM is available, so why are you limiti=
ng it to TCG only
or am I missing something?

> +            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis=
);
> +            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> +            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_brid=
ge);
> +            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> +            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> +            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> +            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> +            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp)=
;
> +            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> +            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp=
);
> +            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> +            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_num=
amem);
> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem=
);
> +            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm=
);
> +            qtest_add_func("acpi/piix4/smm-compat",
> +                           test_acpi_piix4_tcg_smm_compat);
> +            qtest_add_func("acpi/piix4/smm-compat-nosmm",
> +                           test_acpi_piix4_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohp=
et);
> +            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> +            qtest_add_func("acpi/q35/smm-compat",
> +                           test_acpi_q35_tcg_smm_compat);
> +            qtest_add_func("acpi/q35/smm-compat-nosmm",
> +                           test_acpi_q35_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> +            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dim=
m_pxm);
> +            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_px=
m);
> +            qtest_add_func("acpi/piix4/acpihmat",
> +                           test_acpi_piix4_tcg_acpi_hmat);
> +            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_h=
mat);
> +            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> +            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg=
);
> +            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg=
);
> +            qtest_add_func("acpi/microvm/ioapic2",
> +                           test_acpi_microvm_ioapic2_tcg);
> +            if (strcmp(arch, "x86_64") =3D=3D 0) {
> +                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pc=
ie_tcg);
> +            }
>          }
>      } else if (strcmp(arch, "aarch64") =3D=3D 0) {
> -        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> -        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> -        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> -        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> +        if (tcg_accel_available) {
> +            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numam=
em);
> +            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> +            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> +        }
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt=
);
>      }
>      ret =3D g_test_run();
