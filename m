Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp977810dye;
        Fri, 27 Jun 2025 08:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQEZ0ohVdz2FOWlWvjPMMmo/aE/iIv20zKnA2B52xpnNrAEGEOTn3gdjvuwxNWbqp7fzQbx50qcpixEA==@linaro.org
X-Google-Smtp-Source: AGHT+IHPAwd5AThoe84zcS4KU3kmOyiC1slDlOtyhXtmq/QxoF8VfYPFEyfO5WzKIatO6qQaNM/E
X-Received: by 2002:ac8:574a:0:b0:494:7e69:137f with SMTP id d75a77b69052e-4a7fcaf5a34mr53435321cf.42.1751038265882;
        Fri, 27 Jun 2025 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751038265; cv=none;
        d=google.com; s=arc-20240605;
        b=Cs5dhH7qlHizb7f68DOCib7Smhludds/OmH5yLqK5tVX081FKo3F650k1stj6oEeJp
         ALsZbXi0w8eTixVALbRvxgMu16/sH3RyV72KpDE1C+a5jV+JtJbSRKUu9w11Z/uWBJoM
         dj38b7u6VvWku+GG6u4nh7CnBxu5aUNAweI+K5+NdL1yVZHxhbVqRdAsDtJMZqfvqxqk
         ntGMwK2uBiz/YYx92o/KSlqk6VS6KUUf8uZQ7AIYZb56AxxlHhIOryrsoo8mCuLkfkPN
         9x5STwX1HO/8CD7KUbl1AhxSVA9SOxl7y+q3mxCiTRf4GXdIGRsMbD1vw5eWGwhQ9kV6
         4ECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=TsCrr17xly5aSqAX4ey7f6U6l3M4VCizqUxATFCa/40=;
        fh=Pjo6AcnoDf0Et5sAsm+Jy4eXDgETR6hd32U1rPJwMn8=;
        b=GgNlNnherstVHG4dZUUMHLk2A0GioNFrekrBXhG+RjSqDOSu4+FFBkQS361b1CS/TK
         zSUQ488d7/vxvK8uz01+E2+3UjEcyzWfRrRcrYjavE/Ibt88g6NiNEgjHqNEabp58lcF
         wKpByQo3OS74LNH8nNEc1LoCYoDxNu7M1YoNBOLPbUM6mmTznTTOI0zxKqregbqaObLa
         wD/aZbBh43e1PtftmiePMenG/IytnZgUsRrObAtOsvsjTaGbVscYyboE9C0PfbaJTZZO
         H2WBliIBLAvpxdFq5gOJeHthlx0yKqMjmGJABn4GmSXpEQVwGroagn8D6LUTppO4yUdR
         +vnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ei02p3Gr;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7e80si24569871cf.180.2025.06.27.08.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ei02p3Gr;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751038265;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TsCrr17xly5aSqAX4ey7f6U6l3M4VCizqUxATFCa/40=;
	b=ei02p3GrFpJ7vORa9fvxEAnzxLi4psG/ppdDdFC25hhCfskXRWcXZhXYirJNgdHySusBXQ
	62uxSVsM1NBYYEo28FojXmvBEU2K9EaewnOoN2jEaGJ0+2rph+flXdd8Xvww8Fk+Kmi1hQ
	1uQ99uxUhJI4gMNBkbY/AtyI10ocHXo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-iu4ZCD8MPD6jPqkJmNCRAA-1; Fri, 27 Jun 2025 11:31:02 -0400
X-MC-Unique: iu4ZCD8MPD6jPqkJmNCRAA-1
X-Mimecast-MFC-AGG-ID: iu4ZCD8MPD6jPqkJmNCRAA_1751038261
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so14650915e9.3
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038261; x=1751643061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsCrr17xly5aSqAX4ey7f6U6l3M4VCizqUxATFCa/40=;
        b=Y47PUHZuqN9wHu6YVzHJl7Gz5ILFtuZFbID+bLwmdClD+7T/iEAVMl62bkL0lmckXu
         avwyPZazah87u7DGUDKOXmJcPp3eETcTCid2LHATM7NIuqBAHGXGvqdyFzpcVU9s/6O1
         raErQlt5llhbkdc5UqVnu9ztvExVzKUousCpdHcLpW11u7yfW6g8ejyxucLsbLuBNeeP
         p6r2r1/wuatJTyyRuOXTB1pAjngbGpjW3Hgh+66RCPaeTO88GHS3sagMzEGUCk8tFFST
         ednqiFJn/BHb4kWr+rFSBIWq+tYIxBL3pW7t1Mbuj0OqDi5ui3J7cg1yDPnjKg5LFxTo
         gIQA==
X-Forwarded-Encrypted: i=1; AJvYcCV53+y2XSeVt7RfX56oMG6wq6LaD9zZElFM3CjF4uJh41XTYyQFqeTm5w8EBqmt+9NWWCumaAFt4iZimQ==@linaro.org
X-Gm-Message-State: AOJu0Yx1jJNh+ejB5uJFNWFWcoJ1LU+1Sb9+6ebDI+mQelmHByEOqyxC
	xdOUBmsI5Qe8Elp2IbbpsRIz8jexV8faBsaYRtt5k5P2lFGXn74LuVexEpxl8PpMxfdTi461QE+
	sASPqtkVETeIWQa4S9yHTzpdda6nxhMafq91OYNmFyj93ZvFmPty3i4jrsw==
X-Gm-Gg: ASbGncuYY5uOfowfyKtlGd6vkOCM0F+O+AyiIqzRe0M8k1EZo60z99kyxqajW2ENLnn
	eDusYjTBA2Z6imvYci/ogJkim00R8CxIOv9g633wMwERquwM6hngjElN6FTpt1Dfco9FK2MNbcZ
	73+h9xsp1xH2DZbbSTFm2JagtCM5X8gT4qPxsuByUhc3Lf5V70Ih9AGledOfKYbKZgzR5FZvImd
	YG1zAjMijrFeU12nLJYqsHta+H8jKtM8o5cBnKWdy58Y0pmAGBiVUeUJin93QKcAwaF3XfoC9/U
	+4q4+P7AwOTHR/fW7Sf+n2dhrb7aOa97kxskGFN+dTbGI/3lsIWhQUFZ0vwdmU0dYFUr1Q==
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4538ee6e8f1mr38534405e9.24.1751038260866;
        Fri, 27 Jun 2025 08:31:00 -0700 (PDT)
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4538ee6e8f1mr38533655e9.24.1751038260260;
        Fri, 27 Jun 2025 08:31:00 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7814sm2961797f8f.8.2025.06.27.08.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:30:59 -0700 (PDT)
Message-ID: <b756df7e-2176-45e1-95ef-c758d8d33ddc@redhat.com>
Date: Fri, 27 Jun 2025 17:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 6/9] qtest/bios-tables-test: Add test for when ITS is
 off on aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-7-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-7-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0INkboahTiiaLEquUx7uFUEs4IQmJtqgAX3jC-WaBg4_1751038261
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q3uigJu4+At0



On 6/23/25 3:57 PM, Gustavo Romero wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>
> Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
> hardware introduced in GICv3 and, being optional, it can be disabled
> in QEMU aarch64 VMs that support it using machine option "its=off",
> like, for instance: "-M virt,its=off".
>
> In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
> table, while the ID mappings from the Root Complex (RC) and from the
> SMMU nodes to the ITS Group nodes are described in the IORT table.
>
> This new test verifies that when the "its=off" option is passed to the
> machine the ITS-related data is correctly pruned from the ACPI tables.
>
> The new blobs for this test will be added in a following commit.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>  tests/qtest/bios-tables-test.c              | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a88198d5c2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0b2bdf9d0d..4dbc07ec5e 100644
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
> +        .variant = ".its_off",
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
