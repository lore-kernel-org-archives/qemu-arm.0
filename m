Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp794207njc;
        Fri, 20 Jun 2025 03:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvsWkJcngLTpwacTbsBLLD2Cc/J5CcK3XRgQKS0wZtjpA9JEp5vbAdA2nZ0Ic6kLpjbZpcnKasIc4eFA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7HEX+no7EDulyktS/nspH++FirTqcyqg5Et+vm7mSbC5UWh7DAGmzvceO25t15K00t1x6
X-Received: by 2002:a05:6808:1383:b0:406:67b7:8b62 with SMTP id 5614622812f47-40ac6fe65f9mr1473510b6e.38.1750416034547;
        Fri, 20 Jun 2025 03:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750416034; cv=none;
        d=google.com; s=arc-20240605;
        b=HUzewaPVKbXbPR1fNoBWyFK7ZuH19PgtISLzfpBB2NxKpr8C/isxAZ3QRpa1A4/0eT
         ZBxGF+QKJrPS+o4IFsGcAxee8YZ6s8Sb/IIfAAldeBKLrpgKIf3KigdRZA+gi6RsFQv3
         Y1IXy03l9IcFXLjvtlIVUHnoDxi9yc7kDGeFedi/DN1hdgHmhxiDne++OeSE5rnxvhH9
         CxNosjZycTAl7PnQjb7/ravbzq/oOpdDOZ09jClOEyRxVk38Lc7dMuQf46UDdZtDdk8O
         i4aVkD1rHSRKXs0X8a4OOztSUuvHYfxWdPu5ylSYA2+iQh8VLx2xYu/EwJM04f7BuzHU
         tXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=whbp4OcEZY/etS3636ICwd1VA+i4/5SalyT0CWgmCkM=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=GNApUn/guryGVQ7kKeE9VsPFjj3HbUV0+J7T+KIVEmZqQkyqFBBwcBEmZhWZWR24Zw
         Tc3MbFN+RX2S/C6Tf3PBtX8oaZh60f+5jQmsedtgdN6l0lChWupCEN/mr0UzufvZYNC1
         q/EGOejVxGT+g01H4bD9MGtahAEDTmFFwupfgRpRKMhnT9ju2gr++/svIHlquWcu9Iww
         6QTC9tgWWcf0mPoVyzbIYMbqS5XgSDJMUjT3Pt69ldeV+zSQbEOqvDVkIYDUerGqPxxQ
         TWfP3Ghgp27WQUU6jIlBD4WD7JhGO/jAjzOK/y0XjzKq6MwKPCDTNCe8PKqKhCUtOVNQ
         Ox0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5614622812f47-40ac6d22bf1si885543b6e.112.2025.06.20.03.40.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNv850nq5z6L57d;
	Fri, 20 Jun 2025 18:38:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 758931400D7;
	Fri, 20 Jun 2025 18:40:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:40:30 +0200
Date: Fri, 20 Jun 2025 11:40:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 28/29] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
Message-ID: <20250620114029.00005a94@huawei.com>
In-Reply-To: <20250616094903.885753-29-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-29-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 8B7N3VCdV+C6

On Mon, 16 Jun 2025 11:46:57 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> The test uses -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
> to force the usage of ACPI PCI hotplug.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Could we add the necessary (I'm not quite sure what) to trigger the _DSM
creation so EDSM gets used?  I'm not keen on that being dead code
wrt to tests on ARM.

Jonathan



> ---
>  tests/qtest/bios-tables-test.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0b2bdf9d0d..4b9e391eaf 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1643,6 +1643,38 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>  
>  }
>  
> +static void test_acpi_aarch64_virt_acpi_pci_hotplug(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 256ULL * MiB,
> +        .variant = ".acpipcihp",
> +    };
> +
> +   /* Use ACPI PCI Hotplug */
> +   test_acpi_one(" -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on"
> +                 " -cpu cortex-a57"
> +                 /*
> +                  * We just pick address=0x04 for the root port to avoid
> +                  * collisions with other PCI devices on the root bus (pcie.0).
> +                  * It could be any other value that doesn't collide.
> +                  *
> +                  * The 'chassis' and 'slot' options equal to 1 have no special
> +                  * meaning here, could be any integer, but we set them to known
> +                  * values to keep the test consistent.
> +                  */
> +                 " -device pcie-root-port,bus=pcie.0,chassis=1,slot=1,addr=0x04.0x00",
> +                 &data);
> +
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_microvm_prepare(test_data *data)
>  {
>      data->machine = "microvm";
> @@ -2580,6 +2612,8 @@ int main(int argc, char *argv[])
>              qtest_add_func("acpi/virt/numamem",
>                             test_acpi_aarch64_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
> +            qtest_add_func("acpi/virt/acpipcihp",
> +                           test_acpi_aarch64_virt_acpi_pci_hotplug);
>              qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
>              qtest_add_func("acpi/virt/oem-fields",
>                             test_acpi_aarch64_virt_oem_fields);
