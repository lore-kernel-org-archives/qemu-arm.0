Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4098801njc;
        Mon, 26 May 2025 03:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOeHQBaC+uN8FoqmCBY2taHg4D9G4SaApRKK1MDh7HLbALH2PVhDr4WYeZqwWKpLFyt3053eDrJmkvUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF4fdlzxhHyEazdQhm95zfht7JgwxPRB9efMBzUTuGnENRapERmN+pgLl5lh/lCFokI2IgP
X-Received: by 2002:a05:6214:1945:b0:6fa:a0ac:8d47 with SMTP id 6a1803df08f44-6faa0ac8e1bmr115053266d6.2.1748254936613;
        Mon, 26 May 2025 03:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748254936; cv=none;
        d=google.com; s=arc-20240605;
        b=Qo0CbtwLQo41T1Hw9GIsvYFovT3QwpSSONlYjNs/95vsfeI0lJkY/ktHLZa4QOWyvr
         IJJOWqRlXfO2O2k/DUseluFpPnr8kYzATHcesD83CBGvL+0kZnM/89jWSwOhluDCcsHK
         pKQfW+wM+naxEzmIV2dUdJugFnyDww4ZVXOa49QJPl6wU/jO8x6wuOR3qRoTooenyBNz
         QvD6AC0gACKkO/WtC+OMr2U43clJtqv3wn6hMJvTvNcv4yz4EIulo+ZfRuwkGOIuzwmp
         Sb1cWCFYIWoZi1VvpyxE9y0gUkxd7mCQzT0eqEKZZPx+p4uhoWarL9Mdgqu+asxfhJR9
         EgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ten/ZjOtLjP7gEc/u55GHxW/oMTTj4AlrDqeyDkZJNw=;
        fh=r2y3QqfVVdcIYqhEN7FF4Be1fefnNOTy/lLrAsKPfPw=;
        b=iDdPtzXgcm4oKt0Kj8H5Wb7jXGvNut37fKMdKUIluYjQznadhz1RtZB9yvCc0tFIDk
         6SysiXof6PSFt8dQn0dqVGn/9K8rHBdE2w8GWsmGO64IokTLRNwUnOFr4fg8WOnfrW0j
         VqHGFkkJYfwL55DtSoj9K7RriEryESGwUMaMIAB0v7dD8Ejw5t41eXiB1ziwiWi3E+dL
         uTj0CcBtTPvUzNFimsy6uRPLAhdTnusi8YPMuAr7villeO7RXAap5PbOc6B4RuO9Ezke
         biND0zfrFT9lygLUiHDGYJrr84bgRNzmR0qTFYpPCXDHKDZNL2TepgDakchZgAjS0fqj
         Uavg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LCduiwyu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa20ac609si46709236d6.210.2025.05.26.03.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LCduiwyu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748254936;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ten/ZjOtLjP7gEc/u55GHxW/oMTTj4AlrDqeyDkZJNw=;
	b=LCduiwyut8r8reywi72sAxhq6zQwWeCus5A51hW8vR7Vc6AQjSmyMfx7eSm0kMfYoymzku
	6LfJ7jFuKT9SJ5SuguT2aMQG9kUegkrLXp6W59QS1TlppaFpuBYJA0K8TQCH+W/U8U4t2X
	8lBYNKrs2Y06z9ZvEBC6GTw+pw39Bhw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-aEbohgbLMleRg9rg3HKkmg-1; Mon, 26 May 2025 06:22:15 -0400
X-MC-Unique: aEbohgbLMleRg9rg3HKkmg-1
X-Mimecast-MFC-AGG-ID: aEbohgbLMleRg9rg3HKkmg_1748254934
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a34f19c977so944249f8f.0
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 03:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748254933; x=1748859733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ten/ZjOtLjP7gEc/u55GHxW/oMTTj4AlrDqeyDkZJNw=;
        b=izHD46CtLsiP5Zqt8B7rZyt1QXqh6PM/6XnUQCKr2sbpm/qT3zjnTdXDilcthMTYYN
         hUTBMA25qeTcXsvGzEEhfD3y/HOQGvJQhEBDvyE2ZQ1poZ+yLMUDZu1Jh7pLxngcCFp0
         TOLYRf5GdTUUT5uBcSgNTJkKNznITQyATCIpWZoj7T7pe/0FtGlykXPPT/VTtCDp3XzB
         RexglnJRePDo0bFD0WUX9rqBALZGBjtZj9azyNWmrs3U0YNDWxbfbCubgJljQfOWdVmp
         wjCyKjuvgD9SIp/oWlZKnmpijMWgCjnVNhTRAabrcii07uhLpyYFNS7baPnNJLhmy039
         zdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt0Yjrra5krmJfgGh7gdSFkJ5EdcLwu1on5A3+TwirS5NEWFf0jm1D2zX5Za1gfS68mOjuSolMUFYIhw==@linaro.org
X-Gm-Message-State: AOJu0YyUiwY/yKTB0xKqRZ0mqWqkJEvioFKUZSH5hKp4f9PJHxo+Sjrr
	Lg/B3eGE4UhescesVFS/2F2V8ZSihbv6HbW6a4sB5j+XwyOLoYRUNsQrId0Uo6xWQOSAmXjPQ2O
	tVI7ab2TK0eVVD9FK37D5fJtME2n/EWKARsg4c+Wovv2lc8ksvxLGpu0G/GQne5MkHw==
X-Gm-Gg: ASbGncswvOrzXRDA8/ijf14qUEkUd95hs5h+SYKB5hjSayFbRDTGfH+LRQsRekCm23U
	Ka6gmRq8rUts5Qnbm3mtxO7cGCzlTmCvqVU7foUiPYkJ8hGpaMZy9oSjqa+h7kmb86nBGw4zIhX
	DLpEP47JEvZuNxBt/4g2tgtbN4dR/PwvkRQv4TFt2cRkcW8RXCv7PgMiSwDQPaM3qC2oXhWw5r4
	hzEs4GUdkMo8g4BR/12kt2u6Qjdw0CCh5i2rbx11w1bvhvwvn7p8d0B7VfPONiQAQB4r0onzGuy
	/D7b+i8WNObx7jIzDKGhgyg05opMr94F7e7Ymx8k96Lvs5MJSO0QD2NPqso=
X-Received: by 2002:adf:e742:0:b0:3a4:c963:5fe6 with SMTP id ffacd0b85a97d-3a4c9636045mr5921273f8f.19.1748254933432;
        Mon, 26 May 2025 03:22:13 -0700 (PDT)
X-Received: by 2002:adf:e742:0:b0:3a4:c963:5fe6 with SMTP id ffacd0b85a97d-3a4c9636045mr5921252f8f.19.1748254932984;
        Mon, 26 May 2025 03:22:12 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d9f09622sm2089434f8f.98.2025.05.26.03.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 03:22:12 -0700 (PDT)
Message-ID: <ac596aa4-8345-460e-8828-4a4158dfbcd6@redhat.com>
Date: Mon, 26 May 2025 12:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 1/5] tests/qtest/bios-tables-test: Prepare for changes in
 the ACPI tables
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-2-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250526053123.1434204-2-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XpCFIEmQlj5UATqFV9I80BMhxZk-vae0kKv-SsxHZqY_1748254934
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: lzc8AMb1PkiI

Hi Gustavo,

On 5/26/25 7:31 AM, Gustavo Romero wrote:
> This commit adds to the allow list the ACPI blob related to the base
> aarch64 'virt' machine and all of its variants, in preparation to adding
> the ACPI PCI hotplug feature, which changes the _OSC method, the GED
> device, and adds a couple of new methods, like the PDSM.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Cheers

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..abe00ad4ee 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,6 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
