Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4278857njc;
        Mon, 26 May 2025 08:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiH6nLt/FyWiiaa+bhJY9iK9Z4Sn8ggCqfJr+8XONdenSlJy/N0/sKtmaKe/fN1VBQzrSk5sDXtIqvgA==@linaro.org
X-Google-Smtp-Source: AGHT+IGlbYzTFiX+wxaGjV7SA2+acmpVLkLHt+j/hkGZ3WuqalQqxw2Whx31Z0FZB/i8/5lXUpwj
X-Received: by 2002:a05:620a:268c:b0:7ca:f028:2e36 with SMTP id af79cd13be357-7ceecb821f0mr1361278585a.20.1748273314745;
        Mon, 26 May 2025 08:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748273314; cv=none;
        d=google.com; s=arc-20240605;
        b=j+9iv2swDVjDqJNhr0laSei0hVrmxGH9K8UxRKfvJz52YEwc/RLcmlqmKe4JuxB33T
         m1hhIYe83LnQZ1OUOZz2JPSpMdu/L1gN90zJj0MRpKZ7fEb7AFUUOO6fcFLZBmBTRQJP
         Lmj9InSbFRZTla01Ftz6omobIiP6kCA6DBedW+p9bhcnJgnlPQFc7GhBOrjE4+7IVt2A
         pc9oXjVAnYul0Io2y3GtNj63D6EJX2Yhr/mt2POrb06G5nz+qwwcdmMUlt5eKLWXhLSY
         mR7TKh+tdpUS6lmPmypftxmxlAAPWxRZVH0rtU9guWpRieZbV4XXlJ10/Ke0osjGHFuW
         KDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=0D4G09sMAs0RI5p0M++zlUeeduTrotw29CxcbTEtKGM=;
        fh=CxBoKVgYl/GLmrBdU4DJ8EuO3nmugc+fO4uqVmqkX3c=;
        b=gd4iEZ/ixTxh/L7iQ3FO2X4R5wn90mEXreuhERnQcc9azEtUK1O8lmE7fg4ok0nj8C
         U93L9KCOu7bi0WXxIBsSqnetTuXQAZhFeT4QfoI1T0aDbB0thg3QpgEqDCcK9+qx8uxD
         Dj8uMsq8vjEOlBfdFwsubWEvLxDd8UUp7ra7UgepVAgY/a5vpHuqweloMHJFaCdGAZVy
         BBwWCRcmsd18eFwG58Yp+5Xp2xVHcDT/gDLh+9m81S+1i5uCp/gaV7JWPV2IJnWyPgbu
         qa62F10VyufV8lEPVbWBt9mPmS8Qpfj4GD5Icrgq6NCDFWNmZArKC8D9fhzj3/dUHDCi
         2ZyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMKllwRQ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cf259si2577369585a.6.2025.05.26.08.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 08:28:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMKllwRQ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748273314;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0D4G09sMAs0RI5p0M++zlUeeduTrotw29CxcbTEtKGM=;
	b=OMKllwRQTwK70c0zKh33kB7VFc7ZVO5RV6GuxzqACSbeUYpeKeZlCBfJTnkcztrjI9AnkO
	rGDlGTnrUG40taHtgfWuTOsPXbabezOOAifN+oWWFzBY0I/Lpvi0pZd5zQyXe+C5Msejg0
	NyR/LjkIREo1FeuvlYOnd9ziar1YmHk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-kZIsntauMretDYe2yCRAYA-1; Mon, 26 May 2025 11:28:33 -0400
X-MC-Unique: kZIsntauMretDYe2yCRAYA-1
X-Mimecast-MFC-AGG-ID: kZIsntauMretDYe2yCRAYA_1748273312
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so17919825e9.1
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 08:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748273311; x=1748878111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D4G09sMAs0RI5p0M++zlUeeduTrotw29CxcbTEtKGM=;
        b=w/SHFbzAd6wD4Q8s8XeNGk5MDtlZ37rc2qVJbN78siNs3P09xGV+6VqsEpQDT+BNbX
         W4So/b8bs4wtx6rwTsnebIc6y1hR27gistSWZhGYjmj08Lo50uehzDL+PD63pD4HFnbJ
         xaTb6OfGS8cgzh3MWrS7NlfeDVNQcTSUj3WT/ruYgCxAeyOZNYRFklnrLhx8l1mo9fYN
         o+HlClsh295fPAHmyldrEj+zJrrDCrjU73gJP+uO8Mn4HMMb5qxZBZyILdlxrGV8dM9Y
         cXvCwt1PfPw5eawC6fEC0LdLyGRnYaEfNqH59p9iNUpfHVxAUZeAYmkOsUz2vy7OoDiA
         pCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0MYMNeIXaqmWNGaLuuA0etqpCJOb58x59McaPxSTRv+L9e4LTgpYDnIN2B7Z9etY6kn+vLsHwzukaHQ==@linaro.org
X-Gm-Message-State: AOJu0Yxkf5rToqjAIx4UvXrR+X0KIThLz2Pz33Js/Kqo67NKjgKYHjvB
	z5k8Wlm3uWI4gsbLgkbQBLLqry1wYJmBvuFPV5nkaCTdAVPKI25rlInqt+AHWLvGIHCSkuEzmEM
	zzTLpqygD27d/sD/W+M/R2bzBoPtgjG6IqSIlgtinpwddJoRCVW5BIvAnUlKUaWyzNg==
X-Gm-Gg: ASbGncvZDrYJzNfZ6s14RJuFqahvhZZrO8HYgVIjMdTsgGFGolynt8X6Aea3qR1GwZw
	zx30Cv0BKaB8NYPeQx0oKXyJyVt14rGdE4CSUCc+2KHKFsKMf4NLAjF1kDyy2PxHnp8hqrlt1we
	FspjEkZKdyJ7MxWAx+ZSxBLiY5Lk5XU4W2LoZ/7DQYRHEXkw0q2i6jK8jlbHw3Ly+qsp77ACj4V
	DaVQv6eL7RSSmsjNLxnOZVBzARFkzrFP4iK1ps1DyPfmK7Sxxp6hHPyGwPlVk9v5HRfd/Zrs/Jq
	OhIqnpjtDzAaPuJX4kUvz8amT+YrN9zZO5G7JHeQm5kbq1XM90go2RroXhY=
X-Received: by 2002:a05:6000:4203:b0:3a4:79e8:d1d8 with SMTP id ffacd0b85a97d-3a4cb0eaf18mr7382035f8f.0.1748273311632;
        Mon, 26 May 2025 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6000:4203:b0:3a4:79e8:d1d8 with SMTP id ffacd0b85a97d-3a4cb0eaf18mr7382021f8f.0.1748273311244;
        Mon, 26 May 2025 08:28:31 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c591c044sm9910815f8f.52.2025.05.26.08.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:28:30 -0700 (PDT)
Message-ID: <a9a8d55f-7409-4dd6-97f6-a373de9870df@redhat.com>
Date: Mon, 26 May 2025 17:28:28 +0200
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
X-Mimecast-MFC-PROC-ID: w2Z2w61OB4lEYN5ihXJg_F-q4pO8uOCYIHwDmvbszpI_1748273312
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: g5XtZwKjuf/J

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
On my end I also need to add -machine acpi-pcihp=off in
test_acpi_aarch64_virt_tcg_numamem

with that fixed,

Reviewed-by: Eric Auger <eric.auger@redhat.com>


Thanks

Eric
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
>  }
