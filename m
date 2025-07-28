Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E0C87FC9
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 15:34:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugPsF-0006kZ-Qk; Mon, 28 Jul 2025 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ugPrp-0005jG-8k
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 11:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ugPrl-0001RJ-93
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 11:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753716855;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sdt/9Ejlns4XKo+Lq+bhSxUAc8h7hmaymcXwIZo2vIg=;
 b=KQiaycxhxzuDI2jI3PRP5inlCiKJv9eAGO6Fm8zwFOCK6pgm5kz9T3Lh32EklhCToHpOdC
 RWbIer1gzgHEFMHjchJfxoPon9wuGbm2tSGkh/kIPqVHKe9G6sxurGWCmwbrMt6+u9/ZMZ
 8ExSG3FxVYlcN+Fw4mlNMHU1pwXqrhY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-E4Tmo75MOEmkOi0-IKfbsA-1; Mon, 28 Jul 2025 11:34:14 -0400
X-MC-Unique: E4Tmo75MOEmkOi0-IKfbsA-1
X-Mimecast-MFC-AGG-ID: E4Tmo75MOEmkOi0-IKfbsA_1753716853
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-456175dba68so27306775e9.2
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 08:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753716853; x=1754321653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sdt/9Ejlns4XKo+Lq+bhSxUAc8h7hmaymcXwIZo2vIg=;
 b=kSPM4q5EYUNjpJRyFCMeHh/rDNu/+MVIAJ5pPRVLcr2cagH4tzat5BhMXHQKZdZOom
 5p4IzKKLhTqgdydyTIUahmyEgrX1Jo6nTvs/A2lDv288nyfU7vqiQHWZF0xNsggXclIx
 lFyBnDRQ73j+RU94jhFtHEg2KGcfdT30sPkjq/Lxw7SkQ3KT7FD8gPnuAklTE6kWpez5
 6G0vFv/fPI+EmLOhI8QShyht8MpafooYmjZSbgZDrUs4LWlhmZExtMsO2wmnu0air0fI
 nlHpO4eyip15KZZCQE/WS/L8xcHfecAb7+dvYxFyRfzwJo0QNry7nlGRJhbmh4poBwVU
 Ed7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAxE5BuW9vtrvm2+PBCGPlil02tjqKj48HXbUSPAtdPDFiFDtAQr/9vW4UJ0vx7qRq0QmhSyGqUA==@nongnu.org
X-Gm-Message-State: AOJu0YzfEnhIbh1DHKsKP/wKqndNse5k1aTA9D5cFhbrqnRM+nvt3JkO
 vXZtFn0H/XXu0OtRnJ+ZnJO1elwu7E4KLkzxRl1F3YMcGSgjF2Ahg4d3RwCuhLoFAEFzfUkuSOi
 oZ/IIWpkMadGMxam7+gcI/ay8nCSctc4hd9z6ERGEptCv/uybC3ICdg==
X-Gm-Gg: ASbGncts9JtlrJ0glvEN9Eg/SSnv5fpKo8Gu1RSeGccdRX7VMUAXQQWSGGB0AmWt/zg
 e6tX1irXzrwI+c0CsDiYWEyYUJCmmeinuU7FCFyOp4jldLKZ3PGpHTp1KNf6QPpnfzBDtWIXhve
 p9qtLElHIwgwn1I/fqGQd6svPkkkPbHRR8xd6p5rxtYANVB5wFvLEff0BQf9nKsv3lUOyKCtqhV
 DJoPyyrmlC6eTNQCQWZHRPf9m/DM2eztDOzKK+N1jh6KHup0N8UY/MwUCl1L8IC+sEE5Al5Yd8Q
 UPwlQtoBdYUWa/hCJcG73vlKRpowL5tNOd7NGj5eXwhyr6cddowaHN0qQE+BtkJckJIWN9i9AA=
 =
X-Received: by 2002:a05:600c:1907:b0:456:1d93:4365 with SMTP id
 5b1f17b1804b1-458762fb73emr101470505e9.5.1753716853053; 
 Mon, 28 Jul 2025 08:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDBj7HeNJtjL1zliTzj//Vg8dtNx8e3sNk1h3JKiRJhk/Al8cyrFzpGHzh+ZiABP9GuhOR2w==
X-Received: by 2002:a05:600c:1907:b0:456:1d93:4365 with SMTP id
 5b1f17b1804b1-458762fb73emr101469925e9.5.1753716852407; 
 Mon, 28 Jul 2025 08:34:12 -0700 (PDT)
Received: from [192.168.3.191] (228.246.150.77.rev.sfr.net. [77.150.246.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7816e3641sm7384490f8f.73.2025.07.28.08.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:34:11 -0700 (PDT)
Message-ID: <df529eec-8987-4b32-a421-3ba63a368619@redhat.com>
Date: Mon, 28 Jul 2025 17:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/36] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
To: Michael Tokarev <mjt@tls.msk.ru>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, Jonathan.Cameron@huawei.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250714080639.2525563-1-eric.auger@redhat.com>
 <20250714080639.2525563-10-eric.auger@redhat.com>
 <ddf6f9e3-daaa-4ea1-a5e6-d402a75524c8@tls.msk.ru>
 <914677f4-07ba-45fe-9dc2-dea40940e789@tls.msk.ru>
 <53971ad6-9f50-45b0-80c4-eeedb24e53db@redhat.com>
 <46f08bce-7176-4332-9764-6999fd655bdf@tls.msk.ru>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <46f08bce-7176-4332-9764-6999fd655bdf@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1dGmmdgjL6uUJW3fW8a5sxp6htf1B4ud4FgISBNAWlA_1753716853
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Michael,
On 7/28/25 5:17 PM, Michael Tokarev wrote:
> On 28.07.2025 17:56, Eric Auger wrote:
>> Hi Michael,
>
> Hi!
>
>> This commit added an imply ACPI_PCI to the PCI_EXPRESS_GENERIC_BRIDGE
>> config in hw/pci-host/Kconfig:
>>
>> config PCI_EXPRESS_GENERIC_BRIDGE
>>      bool
>>      select PCI_EXPRESS  -> selects PCI
>>      imply ACPI_PCI
>>
>> In hw/acpi/Kconfig we have:
>>
>> config ACPI_PCI
>>      bool
>>      depends on ACPI && PCI
>>
>> ACPI is selected by ACPI_HW_REDUCED
>>
>> config ACPI_HW_REDUCED
>>      bool
>>      select ACPI
>>      select ACPI_MEMORY_HOTPLUG
>>      select ACPI_NVDIMM
>>
>> so logically the ACPI && PCI dependencies for ACPI_PCI should be
>> resolved. What do I miss?
>
> I think it should be "select" not "imply", which seems to be stricter.
> With a devices file like I'm using - it looks like - only things which
> are selected gets enabled.  But this commit brings hard dependency
> between the bridge device and ACPI_PCI, as demonstrated by my example.
> So when the bridge selects ACPI_PCI instead of implying it, whole thing
> works (I just verified it)

build_pci_host_bridge_osc_method() is called from gpex-acpi.c

pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'],
if_true: files('gpex-acpi.c'))

so the hard dependency exists only if ACPI is selected.

If you use "select" you will force ACPI_PCI even if ACPI is not set
which does not sound what we want?

regards

Eric
>
> I wonder why we build microvm-only executable in debian...  Initially
> it was a small binary aimed at very fast startup and light runtime.
> But with time it grew quite a lot of things...
>
> Thanks,
>
> /mjt
>


