Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp118697dlb;
        Wed, 28 Feb 2024 01:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWom7S7s8kXI1VNtGy5IikLTPzVoqUh96MuyiLBJuaj4+ajsINQa6RDmzEo+L5ELyY1mIzuU37NvdiS5jXmFSQkiw1gJcS1
X-Google-Smtp-Source: AGHT+IFMETCzvqzSl8YlzSTV3F3OcMH7kRcB6TMZanhggA1dwKzQuQIq8lFj1qMNW9N4ELmFxZWZ
X-Received: by 2002:a05:620a:13d2:b0:787:e5fc:c469 with SMTP id g18-20020a05620a13d200b00787e5fcc469mr4018337qkl.39.1709114173219;
        Wed, 28 Feb 2024 01:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709114173; cv=none;
        d=google.com; s=arc-20160816;
        b=xseiBfAX1JjP6yGssCpcXMUVMVTMbIdCauOqPwD0+AoTv/Gi5e0soTXdohjqUXg9Hq
         ego60I2m0+KSRKs1+5IkbE9Q71Y670q7mNe1fNAc2nqztUT7Oqvr+ejRH9nOBtjw3blL
         fdRfY9wapzdX3x89lDo2Q9zV/EtFhL2vjIIS4CXu3sswOFgIbDR5zUVimqcK7l6EyFvX
         fty8d6KeELXQ3GkVK0kFVcpRAnIkEMtRWltlxGOoUYGf1+taAo4JkMMuZqprfk2VSbrU
         k5gP+p2Kj7p0LqYALdPuuhG/pHS7ClEvZuLd2ru3JTv2mUnqpPEhFNvpxTaxqCCz2LEe
         XADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=WrU4SdJpUILDcvShBQF/bFRKoULcN0dtP6QnJwl6JZg=;
        fh=U56D331pc3vET6z5iLZZCP6O6B6SkoOhQjlj/PzAAYI=;
        b=UZRWeD1wUvMs6+8dVryPvPEfsv5EcOKdNYn/mcTVnPWmI9dR4JEjm+YU9ZSjkT9yF/
         wqL4LFAm0zT0pDhG7CJf1xhkipz82cBBvylW5VOsHLrGtJ1jzkaC2ZrjNsAmntogZvTU
         i8xVZN/W38UqZiGmi1Lx+ATnfjIXbIVmyBj3R5VLYZsYYS1jx3SkCuxUIWzoiIKvbAmt
         AIFx8p6IoLeS9m9yjbnMRC9RKPNoqmm7vyCccJ4nPqiv6jCkyIfUpY6DqrolwSX7/l7W
         2eFrmVHo2pLkR7tEhUeWuwVlmnPvWMF1y411EElMfEG7YxRCKPw86CXHLM+2s4s1gTwR
         9Oyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXspMwK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05620a454800b00787d6677545si6199138qkp.79.2024.02.28.01.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:56:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXspMwK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGfZ-0006cy-6Q; Wed, 28 Feb 2024 04:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfGfX-0006by-0n
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 04:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfGfV-0003KD-B7
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 04:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709114164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WrU4SdJpUILDcvShBQF/bFRKoULcN0dtP6QnJwl6JZg=;
 b=WXspMwK4VAiXrcO3OWZ2ea2gOohTE1ICh5W0vHkQ8E6i2f/ojgPD3EPU4lN69w1qeIQNFa
 V6bMCisAGOWFY1tnHmm9kbJTULVVGrYyMu3rQTFAnIx7K0+IRxcasRZXdwr93Wk0NOXRu+
 hITHr6JVSk8sAlWZRrL3yd1UtL/KZBU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-SgLeeRI4M4-pPnbySMewug-1; Wed, 28 Feb 2024 04:56:02 -0500
X-MC-Unique: SgLeeRI4M4-pPnbySMewug-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1dc8b828178so32268635ad.3
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 01:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709114162; x=1709718962;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jX9Dnd84RuEhgEq2ijfHFBv4LiC0xGGXw+n8jfHh304=;
 b=IuJChm9cTHNpoJly7LLQ7O8l3iElszrbwYccj3iY7vD59oXZbXEMI1gMa6uU1W5hWn
 PLsBtR1sk1bxShvNU5I5h7Oh5NsysP2Vwoe9QA66o2RtbS1o3GsAZ5PFjpjj3A9KV1V1
 k4D+WfTjf592iKiIWLS7yGuPqrd0jSpxjL8/nUPAZT45RcXKjBxCKsyiIJoOH2N8nlOG
 ueVB0zD9X9gzhN9sCwnCVxKfdhZTT4fmvi6J8rmlh9fEOtIbdYwQuLyvSKMJgGgjHHKI
 ac5/lVWud04Mqf8iarlXnB8Dlr8D6SPUHUjGwNy3FVZibndIrjQsEhKksoFg04mwwV+G
 obFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8EXnHw+7gyKSB3lgncFfLC6jMPruo7YIVMofwNKWQR6WA5rifVIhJQMpwqmokM2NcRLbLlt7k1vrE7e1o28DnFDx0
X-Gm-Message-State: AOJu0YxzDJG7HdJEVX7qKRProxe/RrEpuH9WZE36wFPQYDzMl4iVxCQ9
 cAgbE/Md6lRMTJ+JIYhJ+G1JDimAQYrOL9/l4gb82J/jRiMxKWUIctDiwnlgBaY/1GBpvyfsvvy
 HdOsM3lN44xRta9kKEgO7WkIQV32/N7rKrYwU0wwMIZjdclDoUQ==
X-Received: by 2002:a17:902:bd88:b0:1d9:fc3f:5081 with SMTP id
 q8-20020a170902bd8800b001d9fc3f5081mr11262589pls.33.1709114161932; 
 Wed, 28 Feb 2024 01:56:01 -0800 (PST)
X-Received: by 2002:a17:902:bd88:b0:1d9:fc3f:5081 with SMTP id
 q8-20020a170902bd8800b001d9fc3f5081mr11262578pls.33.1709114161572; 
 Wed, 28 Feb 2024 01:56:01 -0800 (PST)
Received: from smtpclient.apple ([203.163.242.235])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170902e28a00b001dc3916853csm2958204plc.73.2024.02.28.01.55.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Feb 2024 01:56:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 02/19] tests: smbios: add test for -smbios type=11 option
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-3-imammedo@redhat.com>
Date: Wed, 28 Feb 2024 15:25:43 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>, alistair.francis@wdc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, philmd@linaro.org,
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <F617BB4B-F5D0-438A-B650-C38B967B1260@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-3-imammedo@redhat.com>
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
X-TUID: lCTCFF2g2V28



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Empty description is not nice. Other than that,

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> tests/data/smbios/type11_blob  | Bin 0 -> 11 bytes
> tests/qtest/bios-tables-test.c |  17 +++++++++++++++++
> 2 files changed, 17 insertions(+)
> create mode 100644 tests/data/smbios/type11_blob
>=20
> diff --git a/tests/data/smbios/type11_blob b/tests/data/smbios/type11_blo=
b
> new file mode 100644
> index 0000000000000000000000000000000000000000..1d8fea4b0c6f040a13ba99c3f=
ad762538b795614
> GIT binary patch
> literal 11
> Scmd;PW!S(N;u;*nzyJUX)&c?m
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index b2992bafa8..a116f88e1d 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2091,6 +2091,21 @@ static void test_acpi_pc_smbios_options(void)
>     free_test_data(&data);
> }
>=20
> +static void test_acpi_pc_smbios_blob(void)
> +{
> +    uint8_t req_type11[] =3D { 11 };
> +    test_data data =3D {
> +        .machine =3D MACHINE_PC,
> +        .variant =3D ".pc_smbios_blob",
> +        .required_struct_types =3D req_type11,
> +        .required_struct_types_len =3D ARRAY_SIZE(req_type11),
> +    };
> +
> +    test_smbios("-machine smbios-entry-point-type=3D32 "
> +                "-smbios file=3Dtests/data/smbios/type11_blob", &data);
> +    free_test_data(&data);
> +}
> +
> static void test_oem_fields(test_data *data)
> {
>     int i;
> @@ -2244,6 +2259,8 @@ int main(int argc, char *argv[])
> #endif
>             qtest_add_func("acpi/piix4/smbios-options",
>                            test_acpi_pc_smbios_options);
> +            qtest_add_func("acpi/piix4/smbios-blob",
> +                           test_acpi_pc_smbios_blob);
>         }
>         if (qtest_has_machine(MACHINE_Q35)) {
>             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> --=20
> 2.39.3
>=20

