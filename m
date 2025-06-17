Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2516196njc;
        Tue, 17 Jun 2025 06:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtK0CErEdL/WttMO6plDHlkPW9UWY/e6r0XWtndMck7W+MLS74wlR6XgVhoX/BDplJb8KDFOt1NZou/A==@linaro.org
X-Google-Smtp-Source: AGHT+IErCM16PoS+0klTuybAPd8WvgiKpVjbXf4CPMjQbrOJnHNmHlbM66dJoLP9a0UWsyzQHIsl
X-Received: by 2002:a05:6122:21a2:b0:531:2906:7519 with SMTP id 71dfb90a1353d-5314945e88amr8074855e0c.5.1750167251224;
        Tue, 17 Jun 2025 06:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750167251; cv=none;
        d=google.com; s=arc-20240605;
        b=hZ1LJWSu1hokuyKecF+8y1T/R3WhN280njBKWBx/2J8lDmRC2E/HKOo2iUS9Ce1U4S
         4VXPDFnm1h8E/p5z09QgfvVkJasxp7qYTRsLW5jjCRUdKlVMxrpUSLl7xeIlEsBMP7eW
         Luh3g92aH8CuiBbNOChH+DZnSNxXYGLrj5SKaGtRYoQc1Ka2WxUx2oR6nnH3q6vFWyIN
         IiLrrhJRyGEbHbs7hpdLq3PUSxKOM2aCxZmqIitOB7LPb8ezQtqtJFgjPRBIxdLKwjoD
         okwSepoHYa7aYp3hSS4pnbzzTvch+qpkY5FSl7nqkZIfUe3TtNIruJQSPn0Ce+Y+4Cge
         SXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ha0XZi3PC2IVQ1lBR0EUp81EerH9P6ZxpdcTmNxLBlw=;
        fh=RUhmyiTg8JxIFFOxumfMsjZzohQi+0ThyoqVFm824FY=;
        b=cFAoqo0sQXm3wMsFJpHLezqQWwlBuZxEsgZXCt+jzc4IBNcuHjBv/RqlouBJ6q9j8s
         5qadHzFTZ7IWIYRldwZUSvDPGGnt8w4WInxh7D8w6TEK4+C6uistMVCebFyN48B8vcNi
         tNGw+E7Czv7eaprItkm36HT+990CVBvZQAp0pcKbkVtiCAW32qhgJDGy1MrMk8laBAgb
         99to4BEuN6XN6wB5xr/TO6A5iNyqbu7T8jD6v9CTwyjlKa+l3OoVxBIwq4tFlyNJaNm5
         mNhW8emTkMslHht5+zWrgHoxAgA5X6oHoDx0sTwu7TEXxC1+6dBcPePxML/8sxt1mHE/
         aUeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cL5idvsP;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e8189b78d3si1189048137.682.2025.06.17.06.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cL5idvsP;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750167250;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ha0XZi3PC2IVQ1lBR0EUp81EerH9P6ZxpdcTmNxLBlw=;
	b=cL5idvsPKO9/E56Y8XdISq4L+U3zq64/B6hAtWuy3TL4eihY2RxJhVCKLl54kDeHi9asCv
	COS2jG1J+eP4XDTHe0gw3yeGZswAN8m8L3KH3X5YD9G5Jn3pM4VsoJrtmZouNUb9D5qLmw
	Mt0+e2xp/CXcDCjjlGto9WW211Sm12w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-Cqq-sAJlOsSoImi9bOEAuw-1; Tue, 17 Jun 2025 09:34:09 -0400
X-MC-Unique: Cqq-sAJlOsSoImi9bOEAuw-1
X-Mimecast-MFC-AGG-ID: Cqq-sAJlOsSoImi9bOEAuw_1750167248
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so3553715f8f.2
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 06:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167247; x=1750772047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha0XZi3PC2IVQ1lBR0EUp81EerH9P6ZxpdcTmNxLBlw=;
        b=ShAyiWWmL6VX/o4KB+lAHHWB20zG000KaS+Gc/HGSnuQK/nlAHkIrQKCvX4iZobBCe
         tjyXzcXY3PVEOmOuMQu9/PS/CrtUe8jJOq53gpsl6wdarxID/AMokMNlfQSd7g9hYyZl
         x+2j8t/ouOdqlCIJ+OT5IvDWIktURqokLVDoHDdHbYmWlayUaKwDyV0dX/Fs8/PbUorZ
         rw7LZhJ9HzT3sGU8An6IsZS65zCIYWnh/Nw8uFXo7rDrckbJtRZR/KueBCUdbeiohc2S
         CkfqdV10yRmXt6FXCieFMZHwxevXWovDiYDZihnYp6hr8EU9RYuzF/WCJGD4T3sDVXO0
         odRA==
X-Forwarded-Encrypted: i=1; AJvYcCVFKZlt+ugIML2terY8BFsbTFPhYMVuIwSAxTfu+teWMkMf4dyUWk7LzjRUtdmEOHFdmS+ho2wIKPOfaw==@linaro.org
X-Gm-Message-State: AOJu0YxSJGlMhqVZBj5TKrrSiOJc7CPmbX+TRhP+FY/AuGMD605654CS
	byPFu56aBpOLv0TElZwWvGZ9qd3XoQDG7/hGl5OshGlKzR7aWKwzBB4lLKRl+BbOj2vXxmxTJo8
	SnZZjWV+YEdOOYvuxFwUor/CTApuxo+NxpIO1LbhvBzNOf0OU1HwLTg2buZcizVnn5A==
X-Gm-Gg: ASbGncuAnr0HZaFhG0QBlzcOfBjDnINFInq3koPYyTiHSkmula61p3CFaY39v1aByVM
	GFoXMtq8fCY+9yScpc30GrKYmoc0jsE3v+B8DHxnKEB5BLX1CwdPcIC/ccgwu/1GCQ2psTFQkBF
	aDcI3a700KNLWDqs/RnNJFwwCvPfY8GK1dy7pVHx9cDyNKzOpUH/eRV+cpa1+z08dNryGxDqsbt
	toYJ6aF62c7ELWalxtV5ty+mMt1Emn5GIT2FAGWEmwd2w0ysYntoYaT8+fxJmj+a3tKgzPegxy9
	Vtxj+FIrIaL6M9gq6KW3nj/M2QKQ9SeVciIM45O9c6LslfHGup9xA1JfsS8zQlf0bBHnXg==
X-Received: by 2002:a05:6000:1447:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a572e58cbemr8799270f8f.57.1750167247309;
        Tue, 17 Jun 2025 06:34:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1447:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a572e58cbemr8799244f8f.57.1750167246910;
        Tue, 17 Jun 2025 06:34:06 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a68b0esm13828969f8f.29.2025.06.17.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:34:06 -0700 (PDT)
Message-ID: <fe166574-9e53-4e27-9c12-c91f3fc774c7@redhat.com>
Date: Tue, 17 Jun 2025 15:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 5/8] qtest/bios-tables-test: Add test for when ITS is
 off on aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-6-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616131824.425315-6-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2sBJdbgCLda850cvsVDNaF06u6zFCVk4_MNYMxed_GM_1750167248
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BLxPMRwUCjet

Hi Gustavo,

On 6/16/25 3:18 PM, Gustavo Romero wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>
> Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
> hardware introduced in GICv3 and, being optional, it can be disabled
> in QEMU aarch64 VMs that support it using machine option "its=off",
> like, for instance: "-M virt,its=off".
>
> In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
> table and the remappings from the Root Complex (RC) and from the SMMU
I would rephrase "and the remappings" by "while the RID mappings from ..."
> nodes to the ITS Group nodes are described in the IORT table.
>
> This new test verifies that when the "its=off" option is passed to the
> machine the ITS-related data is correctly pruned from the ACPI tables.
>
> The new blobs for this test will be added in a following commit.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>  tests/qtest/bios-tables-test.c              | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a88198d5c2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
I still fail to understand whether empty tables + update if the

bios-tables-test-allowed-diff.h need to be done prior to adding the new test.

 * How to add or update the tests or commit changes that affect ACPI tables:
 * Contributor:
 * 1. add empty files for new tables, if any, under tests/data/acpi
 * 2. list any changed files in tests/qtest/bios-tables-test-allowed-diff.h
 * 3. commit the above *before* making changes that affect the tables

> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0b2bdf9d0d..4201ec1131 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2146,6 +2146,25 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_aarch64_virt_tcg_its_off(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .variant =".its_off",
you have a checkpatch error here.
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-M gic-version=3,iommu=smmuv3,its=off", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_viot(void)
>  {
>      test_data data = {
> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>                             test_acpi_aarch64_virt_tcg_acpi_hmat);
>              qtest_add_func("acpi/virt/topology",
>                             test_acpi_aarch64_virt_tcg_topology);
> +            qtest_add_func("acpi/virt/its_off",
> +                           test_acpi_aarch64_virt_tcg_its_off);
>              qtest_add_func("acpi/virt/numamem",
>                             test_acpi_aarch64_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
Thanks

Eric
