Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4236455njd;
        Thu, 3 Apr 2025 09:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRxs6w1Dui8juCd/B/uhMmfKzUP5kFdpV8aIrJqZACyX3lG1usW1jn7dpOv2ug7vBR3+qOrFB2SAAV2A==@linaro.org
X-Google-Smtp-Source: AGHT+IGqaDHQmNk6uuYafeJGRR4XIV38GgxU/Awa+vs1PbKjilYcGjskx6S54ZcyLbseDXkHFCM9
X-Received: by 2002:a05:690c:4486:b0:6fd:41d5:de11 with SMTP id 00721157ae682-703e1601fc8mr938537b3.23.1743697909234;
        Thu, 03 Apr 2025 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743697909; cv=none;
        d=google.com; s=arc-20240605;
        b=UekcQXcjUk77i72xIbZfcJX/lu3EXQhDfUsnrlYeOLgKVFr35VS3U/SONLX5RD/5pK
         hrDj+41EYi3AjcGQZBMXtgKsmA2XaDHjYpLprJjpJCR/4VT+I/pEf7WU4I2YFXBuGedh
         BnH/1D5KqO2fl69vI8Wn0EBssWCqNg6ynvvMOKqeCPTjUe9mf4PQiqVKoOYUX3Bq91kf
         iXnKGQAsFrZ9aXISQtQ8Mdyhy5gUKyO8Ju7wVIo5PDWdRnuUQ0KzWpbhrJJ32FtWetMm
         BMt0xj+5i7zq6c7L+mWbXrx8N+FusJqUcrxG1M2PCjHcfhw2m1ayciR4PzmVRlS4N3k0
         9Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=MjM4pClLZIU0ZSFwgs4qTMDFVSuFSu4RDYnKmKQYdrA=;
        fh=zlHVD/cTaq0hR6YiPepdoo/yrjvxwzjFQXCENLcFS+0=;
        b=YmgP2BwtdQoMC4Gi+yedyZMVRaoHVuKeleyXhnVTB4upEn8rKtqq7ZyoZnAGLaBM14
         EaFSKArf0obwyB+O5JLfcvYoOZk4/kwgwHYmmApMUkvdZ283ysSxJRR6c/GsZmRyj7S6
         GrVHfbmNn3cm7CzlTnMeuS7PPjyCCLEnPCZ61LK2M57uIuVRldvHA6mwWxJJ8wvbhGIA
         xORe+VTHs88U2GUJEjq1BdHCrVHgXEsTxxUX8wuQ2SzZQaEDg80HzUD6KqMHOAPOBbL9
         texUoDY6XpvCb1g3g7qnv8k9wmhFs4rRPwieXw1B9zxFf/YvfRRZmww4xG20cA09n4UX
         GD8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xaew5SWz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-703d1e6a1a1si27651457b3.105.2025.04.03.09.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xaew5SWz;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743697908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjM4pClLZIU0ZSFwgs4qTMDFVSuFSu4RDYnKmKQYdrA=;
	b=Xaew5SWzgmkYOWw+iCBQw5J7poUywJpBlS8JRuG5hRsPRod/ejIt98AvR+c84LzGliSB3a
	xyAv7qEpzqngwGBLt8v4/LgL336HQ+nCffxpgMLOxqTTOFC8RVRLhOE3mKdLqE3oMudMBb
	lzY4hhQRx7R8IkR9DMPscyParwpFpgU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-sMBvNcOJMoqQJ3Uu4fw0-g-1; Thu, 03 Apr 2025 12:31:47 -0400
X-MC-Unique: sMBvNcOJMoqQJ3Uu4fw0-g-1
X-Mimecast-MFC-AGG-ID: sMBvNcOJMoqQJ3Uu4fw0-g_1743697906
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so1081542f8f.1
        for <alex.bennee@linaro.org>; Thu, 03 Apr 2025 09:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697906; x=1744302706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjM4pClLZIU0ZSFwgs4qTMDFVSuFSu4RDYnKmKQYdrA=;
        b=cAlBK9OPB5iSDmH/o4hR4PMkcNMc+8fNjdrTcY3yq0aGFf74NTe+KfyAoEVrmCXBZQ
         Si8XLZkww5PAViNVntk2EwxO9tnkeiv6ClhSoWH4fZicQ43chOvm4ox/ZfHJfN7TWxRm
         4nDM1PTxun3jPATwR7R8Em/MNRgYZ1roB2huLr/6VfHsAy5REO3dm3E+34lIowasztQE
         0kkltJHegr/vKudaI6vtl9GbDf5LnLNIPcmCWpwgKgOp99QjRJvD6rFx+ynEYTQ8M7pW
         XDWwPnuud13RumOyKbrKWmmAZYsJl8oO8gGguljgkx1GRo3KGdhX/vIrCXAqLODpz93g
         KA/A==
X-Forwarded-Encrypted: i=1; AJvYcCWyLEiJYyCzMvKzN2S/kHdeIUOZMWnGH4H0Bw8AeWDcG3D4lg9CPcydNStxYCHAt0WiDNVJQY8DQehCYA==@linaro.org
X-Gm-Message-State: AOJu0YyhLJ4SUptZzNPEKUPdHoi8F/cj/3OBaYJYqP+6lOUNvfSpR/TQ
	0GGQ39KKc9fjUcFP3UkCW0kcStAnwLX6XKAefSjeijQzomhBymVlsZIu+7ANCE+GeSjMaOhvA8l
	iXB2PRr+sOdXwsXQQT1aEd3cLtrnS+MV7pU+cZP0NJ8gyqvNjcibf8g==
X-Gm-Gg: ASbGncvnc3nPRb6/ZYGQTX7SzB/fn7ORaH3j/JyUolWZAFg7FWcrkwl6WdUgGjr1YnD
	fNXE9TPfabq5/oL1/QMm1tozJvzCYoB2MUzr1q9imXX/vxp85r+bYeadPVIAN1MVSc5KyKNvM4k
	KwTmsfpwBrEkqDwOMigrAGLG5Gw8Ca1Z+5i2me9XSo3DL71JDmx814YgoM8mxh341prf9k5z2Wm
	H4FbMDFnCgHBQ3xxt/zeb0mIUg3viD6tPY4Egl5TRnztxxMDMUnyKXCPI23vzW/C+pw7JOfn3/x
	KdE4CQHwjw==
X-Received: by 2002:a5d:64cd:0:b0:391:255a:748b with SMTP id ffacd0b85a97d-39c2f94bf88mr3080662f8f.39.1743697906133;
        Thu, 03 Apr 2025 09:31:46 -0700 (PDT)
X-Received: by 2002:a5d:64cd:0:b0:391:255a:748b with SMTP id ffacd0b85a97d-39c2f94bf88mr3080621f8f.39.1743697905671;
        Thu, 03 Apr 2025 09:31:45 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6a1esm2243463f8f.45.2025.04.03.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:31:44 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:31:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>, Udo Steinberg <udo@hypervisor.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH-for-10.0 v2 00/14] hw/arm: Tests & ACPI tables fixes for
 10.0
Message-ID: <20250403122948-mutt-send-email-mst@kernel.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tGzs4PFXR0xRia65JhNDIADa1EtL0GJ_9Qk_uBxxqlY_1743697906
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: HPXAERXtaZIZ

On Thu, Apr 03, 2025 at 05:18:15PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I tried to gather all the hw/arm/-related patches for
> the GitLab issues tagged for 10.0.
> 
> First, trivial ones fixing / disabling broken tests;
> then disable the VMapple machine (not sure about it);
> finally fix ACPI tables for '-M its=off' CLI option.
> 
> While polishing the series, I noticed MST mentioning
> the ACPI changes are likely too late:
> https://lore.kernel.org/qemu-devel/20250403100406-mutt-send-email-mst@kernel.org/
> I'll defer that jugement to Alex :)
> 
> Regards,
> 
> Phil.


Patches 1-4:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


The rest indeed seems late.


> Philippe Mathieu-Daudé (13):
>   tests/functional: Add a decorator for skipping tests on particular OS
>   tests/functional: Skip aarch64_replay test on macOS
>   tests/qtest: Skip Aarch64 VMapple machine
>   hw/arm: Do not build VMapple machine by default
>   hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
>   hw/intc/gicv3_its: Do not check its_class_name() for NULL
>   hw/arm/virt: Simplify create_its()
>   hw/arm/virt-acpi: Factor its_enabled() helper out
>   qtest/bios-tables-test: Add test for -M virt,its=off
>   qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
>   hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
>   hw/arm/virt-acpi: Do not advertise disabled GIC ITS
>   qtest/bios-tables-test: Update aarch64/virt 'its_off' variant blobs
> 
> Pierrick Bouvier (1):
>   tests/functional/test_aarch64_rme_virt: fix sporadic failure
> 
>  configs/devices/aarch64-softmmu/default.mak |   1 +
>  include/hw/arm/virt.h                       |   1 -
>  include/hw/intc/arm_gicv3_its_common.h      |   2 +-
>  hw/arm/virt-acpi-build.c                    |  48 ++++++++++++--------
>  hw/arm/virt.c                               |  23 +++-------
>  tests/qtest/bios-tables-test.c              |  22 +++++++++
>  tests/qtest/libqtest.c                      |   1 +
>  tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 164 bytes
>  tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 212 bytes
>  tests/functional/qemu_test/__init__.py      |   2 +-
>  tests/functional/qemu_test/decorators.py    |  15 +++++-
>  tests/functional/test_aarch64_replay.py     |   4 +-
>  tests/functional/test_aarch64_rme_virt.py   |   4 +-
>  14 files changed, 82 insertions(+), 41 deletions(-)
>  create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> 
> -- 
> 2.47.1
