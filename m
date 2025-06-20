Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp885061njc;
        Fri, 20 Jun 2025 06:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZ3S4KV34RdsJY1sW6eJ6MWvSx+Cm2ZVNeuSv6GDDaJTPdaiGT9MkY/BTCqshUh6N0mnXJqYL47Uy1rg==@linaro.org
X-Google-Smtp-Source: AGHT+IEpl6VLukfyjThK1WGrCk9ZlcLqPsMvm9m4Z4XfYic/Quf3N+2a4x+/mCS2mCET6rxX3ccD
X-Received: by 2002:ad4:5c43:0:b0:6fb:62aa:29f2 with SMTP id 6a1803df08f44-6fd0a46d580mr49199746d6.10.1750425494769;
        Fri, 20 Jun 2025 06:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750425494; cv=none;
        d=google.com; s=arc-20240605;
        b=at99sCqGZsJNyMjSxSIVcpmf4hzrca7jwpY9jI4Bi5NzI6Uo01dgszShBw0utu7k1Z
         BPnO2WEA3suhjMZqgeFyRaqiS8qRzt24qu1b/GRbEmPrB4skLJOL2TVB5qMi/4AJ6EQu
         LxbgGC7xOGc8IeJX2aZLd4n5vzETEGUNT437WPbTijdEAk6dhGe+oEVQ/oeO+ryYPFcN
         zbvCU05uLE3aYpY47Mdzgl+K+7uTtx+KDW769pTZf2s6Zv+axX22jjMHppktaF5uD4ei
         p1pdVO8Oh9vBeVjzHemD0eN1LVNlysASta81G6Qy7AxjuchTAMSV/fg5SlX3tqdJd09D
         BKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=78KgBHkYzaVNbEYYl6xBENrGYcFNq/PxOzePpremf/Y=;
        fh=mYa0wXulwJH5qHLHiTqVbtZ8doFkhT2RZS2CXiOveko=;
        b=if8uf7JP+hJXb6/khi1yZnm8CpJ7nnRxZsBb0zN8CWWv67ElKmNUoDXcAklJ0dAEIk
         jtq8MftTEMDXePp5jW8cfQ8csHb0sP2qTa0vzkx9bwhcH4cCpSrY7RhNT8Pn+8YfLkry
         OPGNd4uNbXdhX9ib/Dh5I7/KvQfube9I3YyVpDqcD4Jb3u373MLGJwvSaeOB7bVpa5GJ
         RSf3enw61Jz7ATDZo4ETGEWI0Jy5unYjdqCywyEEi9qOY1amQtBe+dAJlBO8yqeSmpRk
         VY/I82yHNfMOMnh94hWy5BBl9S1ISl6M/l0L5+8Q+MHgAwepIEgtR2/IQgm2LowWTlDA
         PMAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCcx16ar;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09530300si20240586d6.143.2025.06.20.06.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCcx16ar;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750425494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78KgBHkYzaVNbEYYl6xBENrGYcFNq/PxOzePpremf/Y=;
	b=KCcx16ar7xS4xomTsQkvAqdHKLVkLlHrQ0PPFxuWLbpta9WeR1XEK0Gx3Csg0vmvJn3E92
	zaPBOY+PuFjcH6DuZGB4rtX7mpeVIm2lGucZfCZXNEjujOSgklShdUTx27hua5xiNB1ny+
	WCAvzya3mfBqo0695oieGEXG/ob+ReM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-_Kt0hK-3Ox-OAE0PnQ6ZVQ-1; Fri, 20 Jun 2025 09:18:11 -0400
X-MC-Unique: _Kt0hK-3Ox-OAE0PnQ6ZVQ-1
X-Mimecast-MFC-AGG-ID: _Kt0hK-3Ox-OAE0PnQ6ZVQ_1750425490
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so674123f8f.1
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425490; x=1751030290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78KgBHkYzaVNbEYYl6xBENrGYcFNq/PxOzePpremf/Y=;
        b=xNMgZlAaH2o3OV+3FFzrS9Qt7TXH2rPgVPeeILS/gOKP263ed29v/Aa+dLcj4NujcE
         zqbDSpsommMTVPOpyQ3Q1/i6sMYQSx1tNSbB5CjvhAo6DpGZGZtLU+SLB2P3NWdZI4jV
         Co0tIDw1vvL3Noz/rDXV5SO4PHKChDihH366hPh6IWTdsK9MY7Qs3rx/xgyVxfv6vwCf
         pj7FzvHxfAEkVDugJO1T3Djnn4ykIie2EAE1TxetZbaOeC+tY/ZIE4JVC6RB6pPNY1s/
         crLgQuAOjuxWqCw12SnhBvKvL0CfNRwSDsCIMwbryNpV8RUhWaAGOgJqXXrnkc7U7ETs
         TxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIiI8F6nYufck1Fwe0v01bUfFh8YoxlGmYCN3+E0j4wCGYEqPWPnINKDJ7y3GseO2Cp0zmkaqXYx//zQ==@linaro.org
X-Gm-Message-State: AOJu0Yw3QrfK28AV3YapuULdwuYH6VzIRzKyfnDkn4OtsSSUSqjmPOtD
	/beP0MYBdzD3BjkxoutUWUjlcacZPa6/kjwbai5ixfJ9K3cOyHKEL8evBxlBsacdVzxvmbp+Yrz
	E34p2kF+9PthkhSD+/VmihTmHC0EhZjpYwRyWDoUhOJb+kjU7wJyICW0/yA==
X-Gm-Gg: ASbGncv+ZU87vzQP9/2Unk8QQo0KbRUd/G1knPsYa0PpNT0p8MPt8o0eSXdcbT/fuut
	WodGRox1sSrNA909Y6zXeZuaHogikpYhqLq8vrkQdKmDPKliidYZAorN6jfb+gVL0wOjfh4m9ct
	lHNydesL7hI3Wz8hVa/G9ymQ67UkmdNEBiCxuHyX2s4UZowbmU+3YinzcXBNvbL4iXHznwZHLF9
	QikxQF5VmaLtPpXECGwq7nEI8sgs6iXCHEvwfx3W9XgZg6UIyLfQ5bicTFZQRL0LaInQbaZI+7l
	DhKR3T2V6pSI
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr2687912f8f.13.1750425489943;
        Fri, 20 Jun 2025 06:18:09 -0700 (PDT)
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr2687856f8f.13.1750425489236;
        Fri, 20 Jun 2025 06:18:09 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535a14221csm56508355e9.1.2025.06.20.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:18:08 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:18:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 28/29] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
Message-ID: <20250620151806.3f742bef@fedora>
In-Reply-To: <20250616094903.885753-29-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-29-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H6DPBOS28B2muKWcqVaLKk0d0TK5Sd7VSiyk8DMH88g_1750425490
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: R05Ama+au0Jt

On Mon, 16 Jun 2025 11:46:57 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> The test uses -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
> to force the usage of ACPI PCI hotplug.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
shouldn't be slot be equal to 0 for pcie root ports?

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
