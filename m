Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4199452njc;
        Mon, 26 May 2025 06:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS2aSDRywf5l1MTXbZ3ARElK+dNRPkGGRKg7X+0KzyX60SWzaSE5AUgNTNrsZEAIT7mXUH3AZvX0a8kQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWNFes6+SXEx3O3PjcacElaVhgZ1ihW4BQL5W0ghDS996Y8zBmquzFYZKtKh6Wi32wrzK4
X-Received: by 2002:a05:6214:4115:b0:6f8:bfbf:5d29 with SMTP id 6a1803df08f44-6fa9cff2ebbmr150990516d6.5.1748265830931;
        Mon, 26 May 2025 06:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748265830; cv=none;
        d=google.com; s=arc-20240605;
        b=HravFnuH9aA0Xsl2pDZjU4xjAlc6h2X7aKLQMFCHkmVGZU6nRbrjBWFXp3i9NufRlU
         oiLjqazrnRzX+b2PqG/4s3UqxemhTmeBbCvQ4Ly8XDcCsn3A91zE8+WLwOpPRM5uCFI9
         YDok2XacIfOMcHsQgulrh3Td9gFYs8xmX1d+rstrymVjx60bphtCaUR+L0IY/N0FoFvY
         3zNvUD1Hk//XJrFxRUj+iQj25eLyQ876wam+hrBjXr4h6pXcKmlC3kXGrI94/xqVpWFH
         SaKgZSJWdJvTq+dZY9F3675y3ZkHQWYuqWu9Y5gf3QwBgiOu81eGgyAJ7/OYDCdtUSiC
         4Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=52ttX2PlP14rw8iM0ZOHMjqyQ17AkL3kgDdh+hMHi78=;
        fh=15OYsjWbZooxq8g8xV99WcXWjM+eFElb3s7DgOrwd3A=;
        b=DfvdbLiCbW5grTQQ87OkgGRHIAMos5WY63zcLEEd2jUqnPche2wCbCz7B9hcB2hmRW
         Xvt2CPwHYlDCJXe6sesV8eS5GoNwfnQ4WHwCR1sBqqRjUY5CrVYmqh2Qiq0CV20Ia9tF
         RL7kbITXdeQK3NhdSyOAZl8kuk2UhVnwiSSW+eDnl1TzcuPzww99p1jMk4kxZJIedGay
         FoIJXJeCTj5EfppERyeZglWbHSsqW61Uvl3WMVJpdKbucuIPfuHcy9ESJOcqdBpPhvyR
         tbb+RdvOfo3HJ57+hNTbxiajJHV1Y5VDauirQk1bOlhAkPMO7d2C5gt83T7qaN+aiEgS
         a8Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUnHStJW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09c2b75si241951866d6.396.2025.05.26.06.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUnHStJW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265830;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52ttX2PlP14rw8iM0ZOHMjqyQ17AkL3kgDdh+hMHi78=;
	b=LUnHStJWtIKyDjLRLT62yEnPvoOEqYzC2bXlw6u9AgDOIjEBudO0MpzW1QSBJ5v+vt/nhn
	hdrwp4nKkh4kGS1p3rGl3z3YgnOqBYvegLkPP4/e/H/Ro7Kurjlz+gI0E2T1IW9yVQz3Q3
	DPeXabQaseds/3OfojqbJlfV1dBPegQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-N3wCeDjiNnShmhK9gBsOrA-1; Mon, 26 May 2025 09:23:49 -0400
X-MC-Unique: N3wCeDjiNnShmhK9gBsOrA-1
X-Mimecast-MFC-AGG-ID: N3wCeDjiNnShmhK9gBsOrA_1748265828
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so13242385e9.1
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 06:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265828; x=1748870628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52ttX2PlP14rw8iM0ZOHMjqyQ17AkL3kgDdh+hMHi78=;
        b=GdIl0yprQTt8KjtlqcjpkyBCcyDEfdii6/kwPt8dEXopTGdtyRUs3YkA5iYVnr7A+J
         fZI7pMO8L1SFvuqusAPWlUQq/+96ahtswIOIMLXZAJVZFo1uABo5ahSs5Dx3fcPsYooA
         gg8km6lH9cTOIQG9f4F+TDIYC7v7++eb3K5fjxLqOHeUpATWH1uFaKTVbQtCS90cKi8L
         ixiN1K/VE5YUbuhFFsQ4ys12UN2kQ9qLrKvYeX2/f8BxGzxa+5+xYYlsONucISCX3JWi
         BiNQwWGTCW1jMBCqRxNb/cKc5uH0MYIeDygiufkCOZB999mKU9Wj7i25TIDCpj7kvkPJ
         d/zg==
X-Forwarded-Encrypted: i=1; AJvYcCVYBSs4oSznkCq77OTpENTXvLO8i2KtAKFr/WbOycspcwEHgg6VbhJm93Q7noJtUXVaLhuGnXlnFzGL1g==@linaro.org
X-Gm-Message-State: AOJu0YyNGOggF63KW/AsqW73SZGT4XvuiptPInjbFSJwCncF3PWLieHQ
	puH+pH8xEJvhQStW3seIjUJYegJl5uzvt9TPrqRFioLHC6ad/yn68hexj5tevnbCs8GaaUqXvkx
	YkxPR0HG2AibNNMazTotE2i4uxkXD6VvZvXW7Hc65bFUjmc6EevZLxwOGXw==
X-Gm-Gg: ASbGnctNqVCUgwr29Gwwrb/YUyQA3ch2grwYbLTWFDaWU6JrXp1+4BuBo/iAL2/P4QZ
	bJ0xySOcjddRlhwt66ynRQ97fnLebu5q/xgeOLXRWiLKx/5h8Tp4cFHpb3BKxavOU3NTp1w1tmZ
	4JyutJJS4S8p8t50+v8dsp4xL3yHmxF8SRBcckWXN3HYZrG2R/tZRkaJdPlCGHEIIs3C7Ze690m
	/OO3E9nDvweSqaALeijdQQQmSR1CadUBM8xLGOZQA9MkH+zkGwwc7ldErBdnpNrxDH5xCr5bEfe
	CkPoIXQAVN7zFOHtH2+53V4eEV74ExLdICpy3InH/3jvTZidKlPEGZf2JXA=
X-Received: by 2002:a05:600c:5605:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-44c91dcc11fmr62152095e9.18.1748265828157;
        Mon, 26 May 2025 06:23:48 -0700 (PDT)
X-Received: by 2002:a05:600c:5605:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-44c91dcc11fmr62151885e9.18.1748265827703;
        Mon, 26 May 2025 06:23:47 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38142f1sm236841685e9.31.2025.05.26.06.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:23:46 -0700 (PDT)
Message-ID: <a6cbf985-4bea-40ff-b12c-8f459249f570@redhat.com>
Date: Mon, 26 May 2025 15:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 2/5] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug
 off
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-3-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250526053123.1434204-3-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rX_Z7--nwXtmsoaozfnvXRM4zrOHM7gl-3pNMxIYhdI_1748265828
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: IfbExLixGIad

Hi Gustavo,

On 5/26/25 7:31 AM, Gustavo Romero wrote:
> ACPI PCI hotplug is now turned on by default so we need to change the
> existing tests to keep it off. However, even setting the ACPI PCI
> hotplug off in the existing tests, there will be changes in the ACPI
> tables because the _OSC method was modified, hence in the next patch of
> this series the blobs are updated accordingly.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  tests/qtest/bios-tables-test.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec435..216941dbb5 100644
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
> @@ -1775,7 +1775,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>       * to solve the conflicts.
>       */
>      data.variant = ".pxb";
> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
> +    test_acpi_one(" -machine acpi-pcihp=off"
> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>                    " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>                    " -drive file="
>                    "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> @@ -1846,7 +1847,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  
>      data.variant = ".acpihmatvirt";
>  
> -    test_acpi_one(" -machine hmat=on"
> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>                    " -cpu cortex-a57"
>                    " -smp 4,sockets=2"
>                    " -m 384M"
> @@ -2123,6 +2124,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>      data.smbios_cpu_max_speed = 2900;
>      data.smbios_cpu_curr_speed = 2700;
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>      free_test_data(&data);
>  }
> @@ -2142,6 +2144,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>      };
>  
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>      free_test_data(&data);
>  }
> @@ -2227,6 +2230,7 @@ static void test_acpi_aarch64_virt_viot(void)
>      };
>  
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-machine acpi-pcihp=off "
>                    "-device virtio-iommu-pci", &data);
>      free_test_data(&data);
I think this is also meaningful that this gets inserted in the ACPI PCI
hotplug series before it acpi pci hp becomes the new default (of course
if you agree on that)

Cheers

Eric
>  }
