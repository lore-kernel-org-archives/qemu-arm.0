Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp252686lfg;
        Wed, 5 May 2021 05:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpzmG9KfcUbahBhPPmUVC884KJY/lpEAN8MwBBK1d3EKfBWOK9/cle2ql4qioxF6Mt8PFf
X-Received: by 2002:a67:c397:: with SMTP id s23mr17127253vsj.36.1620217941158;
        Wed, 05 May 2021 05:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620217941; cv=none;
        d=google.com; s=arc-20160816;
        b=IPaVfClTZltiw0UrpxqGC/E2MLCSILZdWYrhP2ZbEUprvn2HM5Ym7ZEGA+myFH8Cq3
         5FTxzTG7cqFKK8+mGNU3os9vvC29AFqHGVErRsQh0w34KlKqI8W9JLADhQ/0btxqWkim
         LaiaBuUOLDkKDSK2L980ZPKMCwCHYx3sudeckVcB8J25qYVqQ9jr75k2FdI2j2XhnLsx
         FrpBbhI8JyW6YBEb3wbmIL0EqVPN2RNew3PJl6KkxifBwMYku6tPlis2googgOtCr9WC
         +MkFX1YEtxjlCnF8PDYXPz7lqS32/OY/mhfdgAQzzYZY+tgLvhhiIS2l/+JeSDGyHWW6
         vTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/fLldQ5/MgP4XkSLbnyeFmJ12vGS/IYX7pFIspgwu/4=;
        b=tzwYKqemDnd7m09oiCjbAKfMYbvZUOzRR5De89Ca2Z0q2Y8YjXCWOxKQLV/8uYXcri
         JNmvpKKdoTCoZBVErwtHtWbXsiiJkkNRJ4HSj8vemS6pvDxnZTZeeYYjPbH+lUg0uA9w
         5gMoiKzylu1oY+98DXbhDWqswgRiq3oiOQUw4m1FTWh/vGpEPmtJsDohu+ArySgtHfbc
         ooxcJNk0AOltxe+fBTsCiIKpR2gfMiIFlvBN19WOyhR4PEVZtPtDgmIqneyelkb3DdtX
         ng3337EAiDtJkmk5MLBjDgRVzEyRNHkSiIxreZ6wXWWaoqBvZMB6yVGy/Oc6StfSERgJ
         ee3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GEazS3OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si5215376vsj.185.2021.05.05.05.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 05:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GEazS3OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leGhQ-0006BR-ES
	for alex.bennee@linaro.org; Wed, 05 May 2021 08:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGhH-0006Aq-DY
 for qemu-arm@nongnu.org; Wed, 05 May 2021 08:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGhD-0005wQ-2u
 for qemu-arm@nongnu.org; Wed, 05 May 2021 08:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620217923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fLldQ5/MgP4XkSLbnyeFmJ12vGS/IYX7pFIspgwu/4=;
 b=GEazS3OP1G6dJMAAl5nW4ujRFipUL8BqWJNaC5T8ni9DSW+5rOOai8dUMhOJlxwubI5rTJ
 +oXpwH5BhzEKW52bBBPeHmjpYGXizT5KDCuSPxxDBOpom4mAIg70JF/IS2+88ZmhOmRJKc
 lt2bRrEuxAPu/VO9iz9D6Fssq7hBmAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-a2-Emg9XMAu8chDSWD-NtQ-1; Wed, 05 May 2021 08:32:01 -0400
X-MC-Unique: a2-Emg9XMAu8chDSWD-NtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8055835DE4;
 Wed,  5 May 2021 12:32:00 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A836D17BB8;
 Wed,  5 May 2021 12:31:49 +0000 (UTC)
Date: Wed, 5 May 2021 14:31:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v6 09/12] qtest/bios-tables-test: Rename tests not TCG
 specific
Message-ID: <20210505143147.79a4ddf2@redhat.com>
In-Reply-To: <20210503211020.894589-10-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-10-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TdIhD/5W4Lnl

On Mon,  3 May 2021 23:10:17 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Various tests don't require TCG, but have '_tcg' in their name.
> As this is misleading, remove 'tcg' from their name.
>=20
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
>  1 file changed, 71 insertions(+), 71 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 156d4174aa3..ce498b3ff48 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -753,7 +753,7 @@ static uint8_t base_required_struct_types[] =3D {
>      0, 1, 3, 4, 16, 17, 19, 32, 127
>  };
> =20
> -static void test_acpi_piix4_tcg(void)
> +static void test_acpi_piix4(void)
>  {
>      test_data data;
> =20
> @@ -768,7 +768,7 @@ static void test_acpi_piix4_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_bridge(void)
> +static void test_acpi_piix4_bridge(void)
>  {
>      test_data data;
> =20
> @@ -824,7 +824,7 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg(void)
> +static void test_acpi_q35(void)
>  {
>      test_data data;
> =20
> @@ -841,7 +841,7 @@ static void test_acpi_q35_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_bridge(void)
> +static void test_acpi_q35_bridge(void)
>  {
>      test_data data;
> =20
> @@ -855,7 +855,7 @@ static void test_acpi_q35_tcg_bridge(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_mmio64(void)
> +static void test_acpi_q35_mmio64(void)
>  {
>      test_data data =3D {
>          .machine =3D MACHINE_Q35,
> @@ -872,7 +872,7 @@ static void test_acpi_q35_tcg_mmio64(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_cphp(void)
> +static void test_acpi_piix4_cphp(void)
>  {
>      test_data data;
> =20
> @@ -888,7 +888,7 @@ static void test_acpi_piix4_tcg_cphp(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_cphp(void)
> +static void test_acpi_q35_cphp(void)
>  {
>      test_data data;
> =20
> @@ -908,7 +908,7 @@ static uint8_t ipmi_required_struct_types[] =3D {
>      0, 1, 3, 4, 16, 17, 19, 32, 38, 127
>  };
> =20
> -static void test_acpi_q35_tcg_ipmi(void)
> +static void test_acpi_q35_ipmi(void)
>  {
>      test_data data;
> =20
> @@ -923,7 +923,7 @@ static void test_acpi_q35_tcg_ipmi(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_ipmi(void)
> +static void test_acpi_piix4_ipmi(void)
>  {
>      test_data data;
> =20
> @@ -941,7 +941,7 @@ static void test_acpi_piix4_tcg_ipmi(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_memhp(void)
> +static void test_acpi_q35_memhp(void)
>  {
>      test_data data;
> =20
> @@ -957,7 +957,7 @@ static void test_acpi_q35_tcg_memhp(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_memhp(void)
> +static void test_acpi_piix4_memhp(void)
>  {
>      test_data data;
> =20
> @@ -973,7 +973,7 @@ static void test_acpi_piix4_tcg_memhp(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_nosmm(void)
> +static void test_acpi_piix4_nosmm(void)
>  {
>      test_data data;
> =20
> @@ -984,7 +984,7 @@ static void test_acpi_piix4_tcg_nosmm(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_smm_compat(void)
> +static void test_acpi_piix4_smm_compat(void)
>  {
>      test_data data;
> =20
> @@ -995,7 +995,7 @@ static void test_acpi_piix4_tcg_smm_compat(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
> +static void test_acpi_piix4_smm_compat_nosmm(void)
>  {
>      test_data data;
> =20
> @@ -1006,7 +1006,7 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(vo=
id)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_nohpet(void)
> +static void test_acpi_piix4_nohpet(void)
>  {
>      test_data data;
> =20
> @@ -1017,7 +1017,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_numamem(void)
> +static void test_acpi_q35_numamem(void)
>  {
>      test_data data;
> =20
> @@ -1029,7 +1029,7 @@ static void test_acpi_q35_tcg_numamem(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_nosmm(void)
> +static void test_acpi_q35_nosmm(void)
>  {
>      test_data data;
> =20
> @@ -1040,7 +1040,7 @@ static void test_acpi_q35_tcg_nosmm(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_smm_compat(void)
> +static void test_acpi_q35_smm_compat(void)
>  {
>      test_data data;
> =20
> @@ -1051,7 +1051,7 @@ static void test_acpi_q35_tcg_smm_compat(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_smm_compat_nosmm(void)
> +static void test_acpi_q35_smm_compat_nosmm(void)
>  {
>      test_data data;
> =20
> @@ -1062,7 +1062,7 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void=
)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_nohpet(void)
> +static void test_acpi_q35_nohpet(void)
>  {
>      test_data data;
> =20
> @@ -1073,7 +1073,7 @@ static void test_acpi_q35_tcg_nohpet(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_piix4_tcg_numamem(void)
> +static void test_acpi_piix4_numamem(void)
>  {
>      test_data data;
> =20
> @@ -1087,11 +1087,11 @@ static void test_acpi_piix4_tcg_numamem(void)
> =20
>  uint64_t tpm_tis_base_addr;
> =20
> -static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
> +static void test_acpi_tpm(const char *machine, const char *tpm_if,
>                                uint64_t base)
>  {
>  #ifdef CONFIG_TPM
> -    gchar *tmp_dir_name =3D g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XX=
XXXX",
> +    gchar *tmp_dir_name =3D g_strdup_printf("qemu-test_acpi_%s_%s.XXXXXX=
",
>                                            machine, tpm_if);
>      char *tmp_path =3D g_dir_make_tmp(tmp_dir_name, NULL);
>      TestState test;
> @@ -1139,12 +1139,12 @@ static void test_acpi_tcg_tpm(const char *machine=
, const char *tpm_if,
>  #endif
>  }
> =20
> -static void test_acpi_q35_tcg_tpm_tis(void)
> +static void test_acpi_q35_tpm_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000);
> +    test_acpi_tpm("q35", "tis", 0xFED40000);
>  }
> =20
> -static void test_acpi_tcg_dimm_pxm(const char *machine)
> +static void test_acpi_dimm_pxm(const char *machine)
>  {
>      test_data data;
> =20
> @@ -1174,14 +1174,14 @@ static void test_acpi_tcg_dimm_pxm(const char *ma=
chine)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_dimm_pxm(void)
> +static void test_acpi_q35_dimm_pxm(void)
>  {
> -    test_acpi_tcg_dimm_pxm(MACHINE_Q35);
> +    test_acpi_dimm_pxm(MACHINE_Q35);
>  }
> =20
> -static void test_acpi_piix4_tcg_dimm_pxm(void)
> +static void test_acpi_piix4_dimm_pxm(void)
>  {
> -    test_acpi_tcg_dimm_pxm(MACHINE_PC);
> +    test_acpi_dimm_pxm(MACHINE_PC);
>  }
> =20
>  static void test_acpi_virt_tcg_memhp(void)
> @@ -1223,7 +1223,7 @@ static void test_acpi_microvm_prepare(test_data *da=
ta)
>      data->blkdev =3D "virtio-blk-device";
>  }
> =20
> -static void test_acpi_microvm_tcg(void)
> +static void test_acpi_microvm(void)
>  {
>      test_data data;
> =20
> @@ -1233,7 +1233,7 @@ static void test_acpi_microvm_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_microvm_usb_tcg(void)
> +static void test_acpi_microvm_usb(void)
>  {
>      test_data data;
> =20
> @@ -1244,7 +1244,7 @@ static void test_acpi_microvm_usb_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_microvm_rtc_tcg(void)
> +static void test_acpi_microvm_rtc(void)
>  {
>      test_data data;
> =20
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_microvm_pcie_tcg(void)
> +static void test_acpi_microvm_pcie(void)
>  {
>      test_data data;
> =20
> @@ -1267,7 +1267,7 @@ static void test_acpi_microvm_pcie_tcg(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_microvm_ioapic2_tcg(void)
> +static void test_acpi_microvm_ioapic2(void)
>  {
>      test_data data;
> =20
> @@ -1332,7 +1332,7 @@ static void test_acpi_virt_tcg_pxb(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_tcg_acpi_hmat(const char *machine)
> +static void test_acpi_acpi_hmat(const char *machine)
>  {
>      test_data data;
> =20
> @@ -1364,14 +1364,14 @@ static void test_acpi_tcg_acpi_hmat(const char *m=
achine)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_q35_tcg_acpi_hmat(void)
> +static void test_acpi_q35_acpi_hmat(void)
>  {
> -    test_acpi_tcg_acpi_hmat(MACHINE_Q35);
> +    test_acpi_acpi_hmat(MACHINE_Q35);
>  }
> =20
> -static void test_acpi_piix4_tcg_acpi_hmat(void)
> +static void test_acpi_piix4_acpi_hmat(void)
>  {
> -    test_acpi_tcg_acpi_hmat(MACHINE_PC);
> +    test_acpi_acpi_hmat(MACHINE_PC);
>  }
> =20
>  static void test_acpi_virt_tcg(void)
> @@ -1512,50 +1512,50 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> +        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tpm_tis);
> +        qtest_add_func("acpi/piix4", test_acpi_piix4);
>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> +        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_bridge);
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
> +        qtest_add_func("acpi/q35", test_acpi_q35);
> +        qtest_add_func("acpi/q35/bridge", test_acpi_q35_bridge);
> +        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_mmio64);
> +        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_ipmi);
> +        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_ipmi);
> +        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_cphp);
> +        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_cphp);
> +        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_memhp);
> +        qtest_add_func("acpi/q35/memhp", test_acpi_q35_memhp);
> +        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_numamem);
> +        qtest_add_func("acpi/q35/numamem", test_acpi_q35_numamem);
> +        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_nosmm);
>          qtest_add_func("acpi/piix4/smm-compat",
> -                       test_acpi_piix4_tcg_smm_compat);
> +                       test_acpi_piix4_smm_compat);
>          qtest_add_func("acpi/piix4/smm-compat-nosmm",
> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> +                       test_acpi_piix4_smm_compat_nosmm);
> +        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_nohpet);
> +        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_nosmm);
>          qtest_add_func("acpi/q35/smm-compat",
> -                       test_acpi_q35_tcg_smm_compat);
> +                       test_acpi_q35_smm_compat);
>          qtest_add_func("acpi/q35/smm-compat-nosmm",
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
> +                       test_acpi_q35_smm_compat_nosmm);
> +        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_nohpet);
> +        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_dimm_pxm);
> +        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_dimm_pxm);
> +        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_acpi_hmat)=
;
> +        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_acpi_hmat);
> +        qtest_add_func("acpi/microvm", test_acpi_microvm);
> +        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb);
> +        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
> +        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
);
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
>          if (strcmp(arch, "x86_64") =3D=3D 0) {
> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
> +            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
>          }
>      } else if (strcmp(arch, "aarch64") =3D=3D 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);

