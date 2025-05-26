Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4098504njc;
        Mon, 26 May 2025 03:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxrLCNFaET9jPlEmfHe8GcBOlqG0k1SjeS6CaQstIqinMs0w72DNC45DQOlj9XhS/EVN1mj8mI9CzYCg==@linaro.org
X-Google-Smtp-Source: AGHT+IE5CYVAv5H0FAKh/2RX2cXvT56MWe/ONNtrgPJ6r/5aga4/vQwboGarW0xZ/mCF/CNLm7sO
X-Received: by 2002:a05:6e02:1807:b0:3dc:8b57:b760 with SMTP id e9e14a558f8ab-3dc9b710e14mr59209955ab.16.1748254899629;
        Mon, 26 May 2025 03:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748254899; cv=none;
        d=google.com; s=arc-20240605;
        b=d4oYZV2vIhnUIgW+Lz3WT/la5rN9vq/Y/TwrwR++s8HqUyYiYVxKB3nRtxV48WKzbj
         l50Pq3GQ01W4pI9SUy4e6erxn9zkB0qbN40IMqqogUkR3+KUG3ipy6M0OKvSGVu/rjh5
         U6GO1Qh8xUg0REH9Ss/aQNBPF5IMVp+mDBhf3OqcTDtbjoAPAXy0EOiCFaP8F6l7cYYV
         x25yZ+Kk20cBL/KReFuHkqeYIZT/xmGF98VHNqxXsLR+WWua2mls+nj7M15Wzvv349su
         lKAD+CurhTMdWJfyAzjnbM/OZAPjXNUZo1TAM/v/o+BGuPoY1fuquU6hi9omc2Ky8WJA
         weCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=D2r2NJt7gr1iPEVYKtZXa/2g3jnOxC9qXFGu7EwA7rI=;
        fh=lUC3NtENq3tgryzQHQYedd9T3pGSCH3jQSjAMiQ8yrs=;
        b=Uxo3iYj96ipIAnNFhFZmO7wrF/xWA/Eemzy+tRswTb37mQRiyHh6Rt6999W4oOP8Fc
         eKRoSEHv2TrWQMUb7zO55HDzU//eqterI1wfJwLeYTCi+Qjgz8DWv39g9StOJ8maLs2O
         WiOJcmfovTJCHrzvRytkQAoAvcBjN7SRtPMYk2JLgIB5jW8EGx2pW0jk+vxSlu3EyKKv
         PJzBsbdPMEWoDsF3+87KXQHa0evX4CZgk+M+wAfF6YsnoUt3MAMeVHHpU+/759gIKWZh
         XyzWdLVDGvbr5J8uQfnBXK8yI8FSKL6lKMskLfRpnuNL+gS05H2PKfio4Xt8S2l3V/SV
         MBUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TUM2xyXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc3b914dsi3586385173.36.2025.05.26.03.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 03:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TUM2xyXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJUxL-0007rk-Gb; Mon, 26 May 2025 06:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJUxJ-0007rI-SH
 for qemu-arm@nongnu.org; Mon, 26 May 2025 06:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJUxG-0002Lm-Sf
 for qemu-arm@nongnu.org; Mon, 26 May 2025 06:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748254871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2r2NJt7gr1iPEVYKtZXa/2g3jnOxC9qXFGu7EwA7rI=;
 b=TUM2xyXHjwOPIBWw85LZtY5ltDYEHWm+DZz1XPXEDLPTbob9Y1Wzthe6T68vF6/uGZb5Zn
 nOCKpv+8aLN56E+aObw2kqF00dR9JaOnOKOUGSfBdG19ymsjzbct0odqBPPdx1nZYffz3B
 dGOqLy3aWi4FHfDFnjRm6U8YS3aK2tE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-4z65n9N4NLqA8Q_eXVoNnw-1; Mon, 26 May 2025 06:21:10 -0400
X-MC-Unique: 4z65n9N4NLqA8Q_eXVoNnw-1
X-Mimecast-MFC-AGG-ID: 4z65n9N4NLqA8Q_eXVoNnw_1748254869
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cec217977so11751965e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 03:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748254869; x=1748859669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2r2NJt7gr1iPEVYKtZXa/2g3jnOxC9qXFGu7EwA7rI=;
 b=Mw7KlWSNCnpzjuL5Hkzwat5RNZPEzTrQ1oEFhyclV0qtOGGrWdO20/sV3ejBcPUaHy
 hRG2SOHyAIsTdYZr4n196gWcKcs1epSU1UwRtTkpHKCnN8Bl+wf+v8DxMLg8pp5JxV/K
 YC2RP+G1fLixmpt1xAeCC3ZiZPHzoRm+sOpF4LxNU447pm1wj91utHK6qT2o1mQH7l4x
 IIRAbYoD5pJHM+z6/x9Qcu/pI/DmtZsSJoz3oY6YAnbls0AjWZk0pejqu8DQHN4Enpkm
 vNYSQmsPd783Af1ZpVIzxi6kLz8uBNwVJSF0Gj4/e8AD+/9v6FAsxIfkUtUXqpiafJ9h
 PJMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyClZrb1OVV0vPFY56RVdetZtqCCmnyASU5FNjGXeXNHtUQuarGt/n/VIHX7w4VGedBHMFF7DWtQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1KCR9lrwSKI3LN+iRiXFdj5QUEnjLK52CZQCGKjkDrX52R/RV
 l6SmZeu/JdKtNDOx5XBp3pdM7EzHnRjlfe9a9D/ZDYZjCF0D4vZLCbA9PyQ/7hJ4rlSrhI8Uuit
 U5EYVBT6pxFF8iHdpM6z2vEjZE1paHs3FjQczxetISOwXPlCOkRwL3g==
X-Gm-Gg: ASbGnct8+GogEAKooCCEn0u6NARN1YaMmPNUh9GOy2NA97B85vm1IJUGcxodUoOFhYG
 94hH9hnOyRKPGuoLVIh5bT/bm5s8SFgw4SEAXwqNu0cjAHggmKdU1EeuzY/u/jL2GsIEUIA2cuP
 1ixfTf331ICIQ1/oYSuzW9VqWGOn1H3EAIp1+yFc7TuUylg+wyPg4xv7OP55v5+QqaNNKNRKeTU
 fcRy9i1HzV5WtX0A9i/zKb2Qd8+lN000BH9iZpxhcemKI1LjbeMyBxvCmtJKvO8abyql88iHepr
 GA7c3MGC6pHLdaJjoKc/GgUqGG0+JxD+KSrjBzvzCyoCXFfrpB9GsY6cf3Y=
X-Received: by 2002:a05:600c:64ca:b0:43d:46de:b0eb with SMTP id
 5b1f17b1804b1-44c935dcaecmr69828575e9.12.1748254869118; 
 Mon, 26 May 2025 03:21:09 -0700 (PDT)
X-Received: by 2002:a05:600c:64ca:b0:43d:46de:b0eb with SMTP id
 5b1f17b1804b1-44c935dcaecmr69828295e9.12.1748254868701; 
 Mon, 26 May 2025 03:21:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd8b9absm215122685e9.1.2025.05.26.03.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 03:21:08 -0700 (PDT)
Message-ID: <2fe04c2b-d631-4ea5-9703-d44e50e13016@redhat.com>
Date: Mon, 26 May 2025 12:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] ACPI PCI Hotplug support on ARM
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <6b7b0e20-546b-4b72-9489-4468fafb76ba@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6b7b0e20-546b-4b72-9489-4468fafb76ba@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAdi33WDPT_E1DUET31xAdA75R5D0xPOKPehZzn_fWI_1748254869
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CXhyVABrTvyS

Hi Gustavo,

On 5/26/25 7:55 AM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/14/25 14:00, Eric Auger wrote:
>> This series enables ACPI PCI hotplug/hotunplug on ARM
>> and makes it default for 10.1 machine type. This aligns with
>> x86 q35 machine. Expected benefits should be similar to
>> those listed in [1].
>>
>> It is still possible to disable it using a virt machine
>> option: virt,acpi-pcihp=off and restore the legacy behavior.
>>
>> The infrastructure used in x86 is heavily reused and a
>> huge part of the series consists in moving code from
>> hw/i386/acpi-build.c to a generic place and slightly
>> adapting it to make it usable on ARM. The DSDT table is
>> augmented to support ACPI PCI hotplug elements.
>>
>> On ARM we use use a GED event to notify the OS about
>> hotplug events.
>>
>> I have not noticed any tests/qtest/bios-tables-test failures
>> neither on x86 nor ARM. x86 DSDT table has not changed.
>> ARM DSDT table definitively has but there are no tests
>> impacted. ARM misses hotplug tests that do exist on x86. This
>> most probably should be considered in the future.
>
> I've just posted a v1 for a acpi-pcihp=on test:
>
> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05824.html
>
> The odd thing is that I noticed failures in the existing aarch64
> acpi tests in tests/qtest/bios-tables-test. At least the rename
> of the variable 'CTRL' to 'Local0' in the _OSC method should cause
> a mismatch against the current base DSDT? So I had to handle it
> via patches 1/5, 2/5, and 3/5. The diff is in the 3/5 commit body.

Thank you for contributing those tests.

Hum I think my mistake was to have executed the existing tests in KVM
acceleration mode only using
QTEST_QEMU_BINARY=qemu-system-aarch64 tests/qtest/bios-tables-test
direct execution.

The failing tests belong to the TCG category I think.

I will review your tests and if you allow me I may need to include
patches 1 and 3 in my series to prevent existing tests from failing, of
course with all your credits.

Thank you again for reporting the issue!

Eric




>
> Cheers,
> Gustavo
>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v1
>>
>> previous RFC:
>> https://github.com/eauger/qemu/tree/arm-acpi-pcihp-rfc
>>
>> History:
>> RFC -> v1:
>> - First 3 trivial patches were pulled separately
>> - Fix of the register region size (0x18), ie. ACPI_PCIHP_SIZE
>> - addition of aml_pci_edsm which was not called in RFC
>> - acpi-index feature is now fixed. vms->bus was not set on
>>    acpi_pcihp_init. The init sequence is still hacky though. Suggestions
>>    appreciated.
>>
>> [1] [PATCH v6 0/6] Use ACPI PCI hot-plug for Q35
>> https://lore.kernel.org/all/20210713004205.775386-1-jusual@redhat.com/
>>
>>
>> Eric Auger (22):
>>    hw/i386/acpi-build: Make aml_pci_device_dsm() static
>>    hw/arm/virt: Introduce machine state acpi pcihp flags and props
>>    hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
>>    hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
>>      acpi_dsdt_add_pci_osc
>>    hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
>>    hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine
>>      downto gpex
>>    hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
>>    hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
>>    hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
>>    hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
>>    hw/i386/acpi-build: Move build_append_notification_callback to pcihp
>>    hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_slots to
>>      pcihp
>>    hw/i386/acpi-build: Introduce and use acpi_get_pci_host
>>    hw/i386/acpi-build: Move aml_pci_edsm to a generic place
>>    hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI
>>      hotplug
>>    hw/acpi/ged: Prepare the device to react to PCI hotplug events
>>    hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
>>      implementation
>>    hw/acpi/ged: Support migration of AcpiPciHpState
>>    hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
>>    hw/arm/virt: Let virt support pci hotplug/unplug GED event
>>    hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
>>    hw/arm/virt: Use ACPI PCI hotplug by default
>>
>>   hw/i386/acpi-build.h                   |   4 -
>>   include/hw/acpi/aml-build.h            |   2 +
>>   include/hw/acpi/generic_event_device.h |   5 +
>>   include/hw/acpi/pci.h                  |   4 +-
>>   include/hw/acpi/pcihp.h                |  19 +-
>>   include/hw/arm/virt.h                  |   4 +
>>   include/hw/pci-host/gpex.h             |   1 +
>>   include/hw/sysbus.h                    |   1 +
>>   hw/acpi/aml-build.c                    |  50 +++
>>   hw/acpi/generic_event_device.c         |  55 +++
>>   hw/acpi/pci.c                          |  20 +
>>   hw/acpi/pcihp.c                        | 482 ++++++++++++++++++++-
>>   hw/arm/virt-acpi-build.c               |  27 ++
>>   hw/arm/virt.c                          | 107 ++++-
>>   hw/core/sysbus.c                       |  11 +
>>   hw/i386/acpi-build.c                   | 552 +------------------------
>>   hw/pci-host/gpex-acpi.c                |  75 +---
>>   hw/arm/Kconfig                         |   2 +
>>   18 files changed, 806 insertions(+), 615 deletions(-)
>>
>

