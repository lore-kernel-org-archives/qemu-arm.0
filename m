Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CE4C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 17:30:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiz0h-0005eO-Vw; Mon, 04 Aug 2025 13:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uix60-000711-Op
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 11:27:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uix5y-0002lm-8h
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 11:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754321244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cT5MP3PpaYHPm12btbACag4CqxeS0AqpNslJk0TUT8=;
 b=TUDfQK5nubYmQ7hWLdsUjSKt8fgDhT3XSTw0u3jO+q8/xwxgXjKkjU5iApZH+5hRV3SdhJ
 Cbm5ZWFu1R2jxUcLh54/9rZuFVQqnl0MyiGvC0Q2TPgF0k07AgGL0KVHM5AEczONo3SJjg
 FUzzD2XO+5xHoE2Wuh0jJ1UC3ZfeQwI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-d4_MTs-YNsyDkLGfSD0Yrg-1; Mon, 04 Aug 2025 11:27:23 -0400
X-MC-Unique: d4_MTs-YNsyDkLGfSD0Yrg-1
X-Mimecast-MFC-AGG-ID: d4_MTs-YNsyDkLGfSD0Yrg_1754321243
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7073cc86450so49521256d6.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 08:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321243; x=1754926043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4cT5MP3PpaYHPm12btbACag4CqxeS0AqpNslJk0TUT8=;
 b=asucKovqO9DsaFl/pZRm8KsxclfDBgjJqqva9vm25fjGPY60IXSPupM9oYBVkc1bdo
 20RfGhQH/GuqKuuzErViqfkHR5jJk86wx+WKUgDd9PZdnkKA2BNZJET4dL5mKJKadcHg
 bRwFeMVz52N1AnAkoxJ1Z5LeT6I3YhMhcV83lTLuN3idd+vkwtkUI+HRsYD6wlL98nXU
 VOqz8sqF/GjaOsIbwJPsiezX5cR4vGivF+i2TdFBKgUGj/hdrZ+QD1YU1PlUVvfDNGK7
 9+Y0yJlf7pgMMufgqrA/zzs8E/zL+UeEghIEhubjaatmcBz47rSmOQ8S53rgp5Qv2y0A
 80Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnnoJVtW3fI6aR8y7pDzdmxywF6MXNfMM9iEdMddzNEzoHD4r70tyVf6MZFXkmWtyDCwEduLBmGg==@nongnu.org
X-Gm-Message-State: AOJu0Ywu0effUKca97uJiZEMHxcJEzr5s7S4MYNFWtLL+XmNFEmYenKi
 ZO4lBeRrkaWCQyLKvXZnO88BTvojOf2dhjAMObG0D2MLmzmI7vs6iZ9V+CO/1omCisNXGFk+rRC
 koXN5+6X36J4R8lB3eKMyL/cmmb9Aruu10pbVlFuySLivWpQdag4f3A==
X-Gm-Gg: ASbGnctB5/7DsthQc+8YWz6F/0opq1DphsSm3BJeJYsKaTPuZrpIE5PMQV3DvVcJfyo
 dhLHn2/5Ho1fYfLNetdDyIhO0B19ErFTPH+97nXdIIiYsTrFShznvmtdS3tlZSzQTjINdgfBftc
 rhz1cuPLdKQEFuerL18X+6OmIzVmYHx5wPA1vFNLtUlXPlJ4DBcJZXgT1IrL/PJjs/5EJo9qpO+
 x/kGmX7qbMR5DOxBfZqMyKNla3OwwusFIoPoATcpOSq9pUWv2u9PU1naHa4FdWUevwnPsWfctbQ
 GBN0aKJrPPIg6kb6G7k7MiI/Yup6c5df03bpiHfHv6+0bda9KDVPyY+qM/c1GGrNBldYTF52PsY
 DslEydYzPM7k=
X-Received: by 2002:a05:6214:e81:b0:709:2ab3:17ba with SMTP id
 6a1803df08f44-70936361fb6mr119543766d6.47.1754321241769; 
 Mon, 04 Aug 2025 08:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEn3bLwhCCDI04vfqt6mQmMB+ZPYWCYIrPGOIx4djUKNlZ8XuJJ617C2pah3ThLJrfY2GGQg==
X-Received: by 2002:a05:6214:e81:b0:709:2ab3:17ba with SMTP id
 6a1803df08f44-70936361fb6mr119542026d6.47.1754321239761; 
 Mon, 04 Aug 2025 08:27:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdf4831sm58916876d6.75.2025.08.04.08.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:27:18 -0700 (PDT)
Message-ID: <fcef24c1-ed42-4cd0-89fd-0e0e63b0090b@redhat.com>
Date: Mon, 4 Aug 2025 17:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/36] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
To: Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, Jonathan.Cameron@huawei.com,
 gustavo.romero@linaro.org, anisinha@redhat.com, shannon.zhaosl@gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250714080639.2525563-1-eric.auger@redhat.com>
 <20250714080639.2525563-10-eric.auger@redhat.com>
 <ddf6f9e3-daaa-4ea1-a5e6-d402a75524c8@tls.msk.ru>
 <914677f4-07ba-45fe-9dc2-dea40940e789@tls.msk.ru>
 <53971ad6-9f50-45b0-80c4-eeedb24e53db@redhat.com>
 <20250801082904-mutt-send-email-mst@kernel.org>
 <2f2bc1e5-22fd-4cea-82fa-6be6bc82ad2c@redhat.com>
 <32544769-d484-41a5-962b-9cef8445b557@tls.msk.ru>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <32544769-d484-41a5-962b-9cef8445b557@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RGW_OGF9N5aKgYUTHAgAC1wfeZDWwng74RDshgYpUDg_1754321243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 8/4/25 8:29 AM, Michael Tokarev wrote:
> On 03.08.2025 19:49, Eric Auger wrote:
> ...
>> I have not proposed anything ;-) - sorry I am on vacation - I was trying
>> to enumerate the various config settings and to me dependencies should
>> be resolved so I fail to understand. Unfortunately I cannot test because
>> the problem happens with a custom microvm.mak. I would need this latter
>> to reproduce and try to fix.
>>
>> if the microvm.mak selects PCI_EXPRESS_GENERIC_BRIDGE (which selects
>> PCI_EXPRESS which itself selects PCI) and ACPI_HW_REDUCED (which selects
>> ACPI), the imply ACPI_PCI should end up as a selection because PCI and
>> ACPI are resolved. At least that's my understanding. Reading it again,
>> please can you check whether ACPI_HW_REDUCED is selected *before*
>> PCI_EXPRESS_GENERIC_BRIDGE in the custom microvm.mak. Depending on the
>> order of dependency resolution it might make a difference. Otherwise
>> please can you send the full microvm.mak and configure command so that I
>> can try reproducing. Thanks Eric
>
> All the details were in my very first reply to the original patch:
> https://lore.kernel.org/qemu-devel/ddf6f9e3-daaa-4ea1-a5e6-d402a75524c8@tls.msk.ru/
>

Sorry I was confused by the fact the microvm.mak was not upstream and
its content was cut in your original report.

I was able to reproduce and could check that both ACPI and PCI are set
since objects that depend on them are compiled. However
ACPI_PCI which depend on both and which is implied by
PCI_EXPRESS_GENERIC_BRIDGE is not set as opposed to what I would have
expected. 
So I sent "[PATCH for 10.1] microvm: Explicitly select ACPI_PCI" as a
tentative fix of your issue. It looks similar to PC setup. An
alternative could be to set it in your .mak file.

Nevetheless I still fail to understand what prevents the imply from
beeing active as a select here. Maybe that's due to the "eveythning
unset by default".

Thanks

Eric





>
> Thanks,
>
> /mjt
>


