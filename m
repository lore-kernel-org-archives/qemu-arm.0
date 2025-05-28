Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5357412njc;
        Wed, 28 May 2025 02:38:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5ovi8ioUMowZ6EC4CBWmiD0kkCYhY7+/+foFvhfna728yEBV/dayphXbletmnAnE76BPoX9X4h2gqIA==@linaro.org
X-Google-Smtp-Source: AGHT+IEJ0iShMT25S7gybXzZAFOy3CgQnCF3t8uSIhQwakLa7MN0lPfgrSvsCdfRdz5qQSkNCDbJ
X-Received: by 2002:a17:90b:1b51:b0:30e:840a:92ed with SMTP id 98e67ed59e1d1-311106abc11mr21826214a91.31.1748425100955;
        Wed, 28 May 2025 02:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748425100; cv=none;
        d=google.com; s=arc-20240605;
        b=i8l15DRPjLq9sZ+Ls7bsEv8gfmwyPjCtoX8WA06WKrdfzeoCYyL0EJ6NlNIs1mvbiL
         R2oOCbR0help2R+Gy1ownyyixLYd160mw8Il4KTM59fD26LEt5lYGxmV+BiPIAEYCF+m
         g3ef2Lr/pzR6k5uJvY1t9FKYQpjLRfe9MW/0D5kwYVhSRHcDEF/x6Bt985qxvHt2tAW9
         10d6+APeCTjQcrsL8mLGK0DWkTnyi5Kf5WZAciLo12n1PzRaMe8RRMTPnEYhoOvoEtR7
         HhfJgTj21z9z7h/t9BpEwo0TPrIcYYj5KxmSp1oeJLURVDvL934Q8LdAZCFmcLpf3N9+
         C0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=krFMIC+eTZXcDknndge0Xr7QUcgAcGAFRiTpmtefKt0=;
        fh=75QPwHgVwPURdrVQYNurDLFxqXLCpIXzUhRYmSLo65g=;
        b=gHFqW/Q3pee1P/toB1O7urJK21+D4fRD7SFsyOeF5haIa5HM+OXcNxMgWkBoCMiFXb
         jOnQDeOEfsVBzveC0saLh7GxYtZoUIlJ9gGI7bOvAAZVhHjr2Fz1ZtyW6ZJLlcyaj/CB
         0Exc5x581TOiCxzgfkjgosmC+ZD3yHzcG+Tn2UKgg6X8hSqs8vTXfVg/Gelg3xZ4T7mY
         At5laMUQaqitBsN6a4pkFzu2S0+yhG0VLNgzUJy61Yu2OZLb3Z4BED1Qq6TfIr6N9Fc8
         maDXCbS9haLko9XqisdqmlBov2GdixTjP2cp6ui/APoLk+ySx7KyZVvdALUU/6s4ASs2
         TZnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QOtedN8u;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-311e3dadabdsi1514146a91.75.2025.05.28.02.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QOtedN8u;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748425099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krFMIC+eTZXcDknndge0Xr7QUcgAcGAFRiTpmtefKt0=;
	b=QOtedN8uNMKTq6qYIERnV0x9df5e6DXZMvvfjvrYmoa2S2X8wLhL6o5XUNle1k2Yndol8E
	XY8yifcF2s/i3WTOPFrBA+/cC7HcW1096uGC0Kug6UQOXJPhwQzsqolCrlulp6G2S3YjdW
	BwLe3lppINV1UU3+Uya57By2mjoquEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-bqwJZz9tMdOj52aYgrrHiA-1; Wed, 28 May 2025 05:38:16 -0400
X-MC-Unique: bqwJZz9tMdOj52aYgrrHiA-1
X-Mimecast-MFC-AGG-ID: bqwJZz9tMdOj52aYgrrHiA_1748425095
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so25557405e9.1
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 02:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748425095; x=1749029895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krFMIC+eTZXcDknndge0Xr7QUcgAcGAFRiTpmtefKt0=;
        b=w2JXgckUvCrj0ewRxZBIO5/HK61ufpfYkeKdcOViqsJ3cPHbjHe+DldS24ROpziE03
         YxelXH+QxQ2eHcdLCR6PdZl32oQNMDsg7/pi4RlcXWxL8wAjgjaIWWoTHTxL6Ha6qiNd
         TcYBoFIBtHxt+Q/VyG2yJFpsBqHegbjATSKCX1SyZt8xrODJjwdJZ5bXQqODeAUSB8N+
         5kQACC7afPqnaDlqu73OBwXOaXcvu6iEtLMb6hVLdDi+f5gOcQT0ZNSZXR8Td96P091M
         ZzO5DZhfTcey32GlmDeLmm3KZho/6yUvb0MRTwqdvqtJR12gRc25+UHZE/gtB4c2Ylvh
         bBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu6I8bhCe5ZCGXQn7Ev1V6Ob2PkVJqv8UxjcwSddES3fIO5dqzOMm/SWTKytRhKrtJXluw41DCICv5uQ==@linaro.org
X-Gm-Message-State: AOJu0YyUXrz1cMu5ObQ04jnCrleqElfSOoO0OwrD9J2DQruYt5Bq8lpa
	ewk39zFLX44WNLDej+n4ZwxUNFktTVNpz7f+4yOgqHnZdORH0Ta1XTYzbJb16werAIiL0P0SW5q
	r4MJw0kbuUnn/vYIx1nAytN56lU7aSA9zNJq5TSdSlFNghJKQWtHs8mLD3Q==
X-Gm-Gg: ASbGncvqOdZaQ4oa1sijXDMeGLmnoP2IOUCnDvzUZDWqf53PmN08noAxG8f+4DHidRk
	pjuE2Nu0esKfAWxdhnSbTRByT1fxVrotP74E9qFUKgbSHoeCOuxx8tiAjZCP+GrcEJHnSom+F6y
	wxilpy+ioejkr7k3CE92qwpOoA9qAb8Vajl9OemHIdhPcXw8h+4M48xCPpp+fbeMZQSf/xM3PbL
	J1a0g1B55fugDzHNcj/zvjESOobgvOdVRpsuiP1Tjwpf1B+wYT4YhCpF4XzpimBS5OJ3RhbcY1m
	09oAV3wGAOtWXDhCCrYP+loJhNCpiR3V
X-Received: by 2002:a05:600c:46c3:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-44c9301912cmr162783225e9.30.1748425095469;
        Wed, 28 May 2025 02:38:15 -0700 (PDT)
X-Received: by 2002:a05:600c:46c3:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-44c9301912cmr162783005e9.30.1748425095057;
        Wed, 28 May 2025 02:38:15 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1d3c6asm15262575e9.26.2025.05.28.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:38:14 -0700 (PDT)
Date: Wed, 28 May 2025 11:38:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250528113813.47086516@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-25-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DoelII2ibe7h3VlEg1Nk5hgiJr6qVb1GgBa2xBk5uQ_1748425095
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: KFRBsqK8IQ2G

On Tue, 27 May 2025 09:40:26 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> ACPI PCI hotplug is now turned on by default so we need to change the
> existing tests to keep it off. However, even setting the ACPI PCI
> hotplug off in the existing tests, there will be changes in the ACPI
> tables because the _OSC method was modified, hence in the next patch of
> this series the blobs are updated accordingly.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

it would be better to test whatever default we end up with.
(like x86)

> 
> ---
> 
> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
> ---
>  tests/qtest/bios-tables-test.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec435..6379dba714 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>      };
>  
>      data.variant = ".memhp";
> -    test_acpi_one(" -machine nvdimm=on"
> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>                    " -cpu cortex-a57"
>                    " -m 256M,slots=3,maxmem=1G"
>                    " -object memory-backend-ram,id=ram0,size=128M"
> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>      };
>  
>      data.variant = ".numamem";
> -    test_acpi_one(" -cpu cortex-a57"
> +    test_acpi_one(" -machine acpi-pcihp=off"
> +                  " -cpu cortex-a57"
>                    " -object memory-backend-ram,id=ram0,size=128M"
>                    " -numa node,memdev=ram0",
>                    &data);
> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>       * to solve the conflicts.
>       */
>      data.variant = ".pxb";
> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
> +    test_acpi_one(" -machine acpi-pcihp=off"
> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>                    " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>                    " -drive file="
>                    "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  
>      data.variant = ".acpihmatvirt";
>  
> -    test_acpi_one(" -machine hmat=on"
> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>                    " -cpu cortex-a57"
>                    " -smp 4,sockets=2"
>                    " -m 384M"
> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>      data.smbios_cpu_max_speed = 2900;
>      data.smbios_cpu_curr_speed = 2700;
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>      free_test_data(&data);
>  }
> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>      };
>  
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>      free_test_data(&data);
>  }
> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>      };
>  
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-device virtio-iommu-pci", &data);
>      free_test_data(&data);
>  }
