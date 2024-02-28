Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp111546dlb;
        Wed, 28 Feb 2024 01:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpoo/FytO/ohDX52CDnSLysVNZPjf2ILPpcbE/TdOnU+jt7Hu+rpG44GYv36nz/S8QepzyyoTpLwAiskpLFK8Zn52iBhKr
X-Google-Smtp-Source: AGHT+IEXuLlyk/g3ou+UMky6x/sdJ4lIlIBAsw6iqgsOD+FBSf8sC4m3BI9adX/fRj66GFjTMEO+
X-Received: by 2002:a05:6122:4a02:b0:4d3:35ac:3553 with SMTP id ez2-20020a0561224a0200b004d335ac3553mr2719629vkb.10.1709112990960;
        Wed, 28 Feb 2024 01:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112990; cv=none;
        d=google.com; s=arc-20160816;
        b=IWBamH6u+y9QUBFin0+OmGECOcEiGI1tuRvb1hBLxFaZOsLyFgTH1zAklPMmAA54vh
         jv9fePjEiRd7aSIGA8TGLgbLhW4/w+1ul7pUtePpMYS+JBWncG6Y3W9/yywJIt5ynV9z
         dHDy5hCdOF9spmLFMEN1NIQksfok6F8v3MK5MHrBS1gIDYsX3RcE7ZaEdoX0EK4oJGqf
         cZIxg4Lb46CntjizDSCDnCQWMBz5gi9d7yHfThFRMV+XYbCz+Y8poaMOhmcgPsQjeCX1
         /O/B1MZaC55ZQy4mufPe4qLYB2YrDN/1xwqIb9WnrBtvTmq0kjx9BcxUzFwI2SpKv+um
         NDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=GGGtT4t0V2i+limzeTuJ7ih9vgEOsjzHoZhD0Z5eInU=;
        fh=VCiRIkd/vAsZytXJ0kT/LjT6fIItNkDZwdKg352y0ho=;
        b=IrEO6EcX+pIE5t67ELsWinAX1Ng3G2xqkABbD4hqjaHNNy428HykG9dtx61WfANMzg
         JD8U5aQ3Ks1lUV7TRW94IlMphtcd10ALmCSLomlWq2w8ut+CDH+jgRW7Zh+BDlqM1eY6
         WK0G9FzggVP7eP0BQHz+mmEcp2KPg5E1VS08YBQNLvmON06RpNeT/+wtuwIKCmhhjE0P
         z173N8Nzy3bRHe+Jvzh2IcgaMQhkU7aqXVdBmJR6Tkj9iGvWeYz/dPg4zDUWKKgrOVai
         VeesARZlFrWLUSTOjNGC4m3vKDmP1qq/BM1/DF/5YF+yngzv5nvbMLmriUh04daEm9Dn
         Rq3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ccKjDlP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020a05620a108200b00787b0fd1530si8919186qkk.595.2024.02.28.01.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ccKjDlP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGMS-0008Uh-8Y; Wed, 28 Feb 2024 04:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfGMP-0008TF-AG
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 04:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfGMM-0004pz-2H
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 04:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709112975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGGtT4t0V2i+limzeTuJ7ih9vgEOsjzHoZhD0Z5eInU=;
 b=ccKjDlP/JwtX3LwZFf7aMWJUOlJoE91ygik2qQCnWg5bMQS6dyqx2eijNuCVKq3O4NBW0M
 OzTH8HQLhBp6XxWiz+4D07EACSlPSmUG/nHrRM51UdroftzGQ/xiHnaTkCO4PfgiGRSe7y
 d5jbAt63z0elVOWL9MAZdkx+pMjZBpw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-wE9ZSZXONoWyrFUmAaxOvw-1; Wed, 28 Feb 2024 04:36:13 -0500
X-MC-Unique: wE9ZSZXONoWyrFUmAaxOvw-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-59fc1ae4e3fso5112435eaf.1
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 01:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709112973; x=1709717773;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8enEV+WSugbqmW3FMvj90KbZBFNM6QlAzJCtG9D5bY=;
 b=GfyBjWEldwEyhWaBXwMm42G6w6Xt4QDzeW/IXRuvQhSxuPnRvU/KwU/tCutovjC9QY
 ioM8MQDV8ieG6C4maOiyIq3RS34XZHb5YeGd81etQ5y1ewtNFrMklCBEeSEkJmIvHD0Q
 ADNEvfo+XSmEmcS1pSNDFtJKy5mbHVBuTGUEtUZVbCOLGUJVZ5DR5ChdzC1aK6HYkLVc
 SeY0DqPPDs6xaUKk2GajeRg+RH7zwHJgI+aZzFwkx1LDpZMT0aWtpgmQtBk4BOeHt+9F
 GvM8PArXRp8S5qf7G8lSjYPKcabd6+8JyJdRe/oeR3YGynyMcIdJJA3oo9kBFKlnQJa5
 oFgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpiwGeWdbeg9p6K+CCS6gpYoCPU9LP79cTmfOh8fiaogL4wl48P1woH/dBdZX7eL6rzw7EBRy/29rj2EZi7tSsaN91
X-Gm-Message-State: AOJu0YyIHSYAdba7XBVy+2jElDBhBojHUKwhqlsnCkRRiYCt7oFZ4RTx
 ctfC93+WZD0idFeX/s5op5d8zZ6IuaRzwiBWVObK/zvUpn4AbWRgbno4Cp0jOi3nsGJm2/ByycO
 puUg8hZ6LmTKTzKyhUDxH9VT3C6ccerVaOS5t2cjauGUwen+qiQ==
X-Received: by 2002:a05:6358:3a09:b0:17b:c0ca:3da9 with SMTP id
 g9-20020a0563583a0900b0017bc0ca3da9mr5081076rwe.20.1709112973007; 
 Wed, 28 Feb 2024 01:36:13 -0800 (PST)
X-Received: by 2002:a05:6358:3a09:b0:17b:c0ca:3da9 with SMTP id
 g9-20020a0563583a0900b0017bc0ca3da9mr5081045rwe.20.1709112972606; 
 Wed, 28 Feb 2024 01:36:12 -0800 (PST)
Received: from smtpclient.apple ([203.163.242.235])
 by smtp.gmail.com with ESMTPSA id
 bv193-20020a632eca000000b005dc4da2121fsm7017776pgb.6.2024.02.28.01.36.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Feb 2024 01:36:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 01/19] tests: smbios: make it possible to write SMBIOS
 only test
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-2-imammedo@redhat.com>
Date: Wed, 28 Feb 2024 15:05:53 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <18615A72-969A-449C-A8D9-79119CB8AD04@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-2-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oSrgPd2EHgK2



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> Cureently it not possible to run SMBIOS test without ACPI one,
> which gets into the way when testing ACPI-less configs.
>=20
> Extract SMBIOS testing into separate routines that could also
> be run without ACPI dependency and use that for testing SMBIOS.
>=20
> As the 1st user add "acpi/piix4/smbios-options" test case.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> tests/qtest/bios-tables-test.c | 47 +++++++++++++++++++++++++++-------
> 1 file changed, 38 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 21811a1ab5..b2992bafa8 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -858,16 +858,8 @@ static void test_vm_prepare(const char *params, test=
_data *data)
>     g_free(args);
> }
>=20
> -static void process_acpi_tables_noexit(test_data *data)
> +static void process_smbios_tables_noexit(test_data *data)
> {
> -    test_acpi_load_tables(data);
> -
> -    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
> -        dump_aml_files(data, true);
> -    } else {
> -        test_acpi_asl(data);
> -    }
> -
>     /*
>      * TODO: make SMBIOS tests work with UEFI firmware,
>      * Bug on uefi-test-tools to provide entry point:
> @@ -879,6 +871,27 @@ static void process_acpi_tables_noexit(test_data *da=
ta)
>     }
> }
>=20
> +static void test_smbios(const char *params, test_data *data)
> +{
> +    test_vm_prepare(params, data);
> +    boot_sector_test(data->qts);
> +    process_smbios_tables_noexit(data);
> +    qtest_quit(data->qts);
> +}
> +
> +static void process_acpi_tables_noexit(test_data *data)
> +{
> +    test_acpi_load_tables(data);
> +
> +    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
> +        dump_aml_files(data, true);
> +    } else {
> +        test_acpi_asl(data);
> +    }
> +
> +    process_smbios_tables_noexit(data);
> +}
> +
> static void process_acpi_tables(test_data *data)
> {
>     process_acpi_tables_noexit(data);
> @@ -2064,6 +2077,20 @@ static void test_acpi_q35_pvpanic_isa(void)
>     free_test_data(&data);
> }
>=20
> +static void test_acpi_pc_smbios_options(void)
> +{
> +    uint8_t req_type11[] =3D { 11 };
> +    test_data data =3D {
> +        .machine =3D MACHINE_PC,
> +        .variant =3D ".pc_smbios_options",
> +        .required_struct_types =3D req_type11,
> +        .required_struct_types_len =3D ARRAY_SIZE(req_type11),
> +    };
> +
> +    test_smbios("-smbios type=3D11,value=3DTEST", &data);
> +    free_test_data(&data);
> +}
> +
> static void test_oem_fields(test_data *data)
> {
>     int i;
> @@ -2215,6 +2242,8 @@ int main(int argc, char *argv[])
> #ifdef CONFIG_POSIX
>             qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_er=
st);
> #endif
> +            qtest_add_func("acpi/piix4/smbios-options",
> +                           test_acpi_pc_smbios_options);
>         }
>         if (qtest_has_machine(MACHINE_Q35)) {
>             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> --=20
> 2.39.3
>=20

