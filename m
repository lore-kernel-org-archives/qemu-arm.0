Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D847CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsVS-0002aC-3c; Tue, 26 May 2026 10:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsVQ-0002Zo-LD
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsVN-0003qT-Ni
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779804697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjZX+fvkTp1huSeLjS2B6u9Smx9ekUJsPEt5bh6hUpI=;
 b=Djcq4IlPTWkacHBwJgD1yReGrGAcxV8fIn7UBJoBFyJTzCmmIaK5PL/8aemEOYuD//ucUY
 gmgMONTPT2en+yNNs6tzf0Y0AXooF7bXcxHQGH93HBVFYvE49B/w1Fpj0E+C6pXyBy1+CX
 T+i8HoSGVJJOS7wV01x3/IKGtQSLEE8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-DZSraXylNFaNviQwpunU-w-1; Tue, 26 May 2026 10:11:30 -0400
X-MC-Unique: DZSraXylNFaNviQwpunU-w-1
X-Mimecast-MFC-AGG-ID: DZSraXylNFaNviQwpunU-w_1779804689
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44f1b4d0fb0so6430924f8f.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779804689; x=1780409489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjZX+fvkTp1huSeLjS2B6u9Smx9ekUJsPEt5bh6hUpI=;
 b=nSjG1M1GMgYAQOfprOfSQHlRhV3Xb0TOVaEjVs5DcfKK/M2DLkTjU9st8R8I37TDiw
 wBWO6mjuVk+bn19f/odk59mpqJkx+A5wnM0nExCVHZJ7IYcGGrgT5e0by1Pf8B9KTqhw
 DptVBi4wYuAh8QAJe2klwMVtK9paUstsFkfctz/OE1hTUBjaQKklR6SFELSm7tWGM/Dz
 Sqd+TBy34w1Z4LvQR3fwG0KgGVTaP7VjqtLykFg1b2xx4NqrbByvDAbXDYeY5UEH+w86
 apJ4ANnAlR65kQ1teRbi9BJmdzTFkxKe08JYYcjTJUAuQ9JnophCCa1KgZnVpoUyl1QQ
 DsUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kzDPL42xQKYKM2+yXSBQ1pQR8KWCZpYUzJStN5yKz42SdbS2Rm7iHDpfXwIqw3svysvAZWkwLDQ==@nongnu.org
X-Gm-Message-State: AOJu0YzoOOMOYofJLcrxKMRE0pw8zHWwjC36ErjDaitToYZC0fFMAqrf
 Dbc7o+7tS7UTfFKO9a3VI9r9QCunSnD76mCqyGDmKzlJTwdPAoPdmKoe0iJCiIIrb8PGp2PKTbs
 S8/20BkmPm73WqBdlHlTbsMobr15NWJniyJ2RPLJLDTAsiikv9Askzw==
X-Gm-Gg: Acq92OEffvRKCJibnO8rh4oVIlabMH7JK6FLU4kvJ/8QPjWeqyfoQCLYzg+xuF2m72K
 bNzk740SlVH06qNwk15XF02IV73rUYvIex5NhjsXR4lieLzWXR1OYX4DTg3pS6oNEoilzfPRVJp
 gC+8nH2SWJzbqOz24sPIA+HnrsxaL2kNffM7f9T4NX2FyV17kgugsQYhGMAGc3tOl9GLtHmA0B3
 BTYGSJB309q4I0AuL9z61yiKLYt/13OQyrDC2E9CJ0wHp50EPqNEdYLTG7tYPaWnU2IT6LzbwdR
 DYQSo1IlTVoCnwpH+QvVGW/Nd4Dis+pBs6ofTS9Ozj8lEYTjbB4WLrecaZ7SG4i3UCu2BLzg8wx
 6Cj1EnZ3GwoIKnF8LqgWGFgaI7XRcl0dNfYMOTmx4RU9Yks0NkSIJ81bBA7qnY0sI
X-Received: by 2002:a05:6000:1acb:b0:45d:b14b:2409 with SMTP id
 ffacd0b85a97d-45eb38a798dmr35514310f8f.2.1779804688720; 
 Tue, 26 May 2026 07:11:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:45d:b14b:2409 with SMTP id
 ffacd0b85a97d-45eb38a798dmr35514194f8f.2.1779804688015; 
 Tue, 26 May 2026 07:11:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5c32esm34704737f8f.26.2026.05.26.07.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:11:27 -0700 (PDT)
Message-ID: <24184b07-2ba4-4bc4-a73f-084f0e4719ab@redhat.com>
Date: Tue, 26 May 2026 16:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] acpi: add API to build WDAT instructions
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-2-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-2-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y3HMlUD6S7-OfKox1cXNSgL2jSZ4tQ6aP3eZLLs2k5I_1779804689
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> Add definitions for WDAT[1] actions/instructions
> and build_append_wdat_ins() API to build table entries.
> 
> 1)
> "Hardware Watchdog Timers Design Specification"
>   https://uefi.org/acpi 'Watchdog Action Table (WDAT)'
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/wdat.h | 118 +++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/aml-build.c    |  14 +++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 include/hw/acpi/wdat.h
> 
> diff --git a/include/hw/acpi/wdat.h b/include/hw/acpi/wdat.h
> new file mode 100644
> index 0000000000..89803eef4b
> --- /dev/null
> +++ b/include/hw/acpi/wdat.h
> @@ -0,0 +1,118 @@
> +/*
> + * Watchdog Action Table (WDAT) definitions
> + *
> + * Copyright Red Hat, Inc. 2026
> + * Author(s): Igor Mammedov <imammedo@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QEMU_HW_ACPI_WDAT_H
> +#define QEMU_HW_ACPI_WDAT_H
> +
> +#include "hw/acpi/acpi-defs.h"
> +
> +/*
> + * Watchdog actions as described in
> + *  "Hardware Watchdog Timers Design Specification"
> + * for link to spec see https://uefi.org/acpi
> + *     'Watchdog Action Table (WDAT)'
> + */
> +typedef enum {
> +    /*
> +     * Restarts the watchdog timer's countdown. This action is
> +     * required.
> +     */
> +    WDAT_ACTION_RESET = 0x1,
> +    /*
> +     * Returns the current countdown value of the watchdog hardware
> +     * (in count intervals).
> +     */
> +    WDAT_ACTION_QUERY_CURRENT_COUNTDOWN_PERIOD = 0x4,
> +    /*
> +     * Returns the countdown value the watchdog hardware is
> +     * configured to use when reset (in count intervals).
> +     */
> +    WDAT_ACTION_QUERY_COUNTDOWN_PERIOD = 0x5,
> +    /*
> +     * Sets the countdown value (in count intervals) to be used when
> +     * the watchdog timer is reset. This action is required if
> +     * WDAT_ACTION_RESET does not explicitly write a new
> +     * countdown value to a register during a reset. Otherwise, this
> +     * action is optional.
> +     */
> +    WDAT_ACTION_SET_COUNTDOWN_PERIOD = 0x6,
> +    /*
> +     * Determines if the watchdog hardware is currently in enabled/
> +     * running state. The same result must occur when performed from
> +     * both from enabled/stopped state and enabled/running state. If
> +     * the watchdog hardware is disabled, results are indeterminate.
> +     * This action is required.
> +     */
> +    WDAT_ACTION_QUERY_RUNNING_STATE = 0x8,
> +    /*
> +     * Starts the watchdog, if not already in running state. If the
> +     * watchdog hardware is disabled, results are indeterminate.
> +     * This action is required.
> +     */
> +    WDAT_ACTION_SET_RUNNING_STATE = 0x9,
> +    /*
> +     * Determines if the watchdog hardware is currently in enabled/
> +     * stopped state. The same result must occur when performed from
> +     * both the enabled/stopped state and enabled/running state. If
> +     * the watchdog hardware is disabled, results are indeterminate.
> +     * This action is required.
> +     */
> +    WDAT_ACTION_QUERY_STOPPED_STATE = 0xA,
> +    /*
> +     * Stops the watchdog, if not already in stopped state. If the
> +     * watchdog hardware is disabled, results are indeterminate.
> +     * This action is required.
> +     */
> +    WDAT_ACTION_SET_STOPPED_STATE = 0xB,
> +    /*
> +     * Determines if the watchdog hardware is configured to perform a
> +     * reboot when the watchdog is fired.
> +     */
> +    WDAT_ACTION_QUERY_REBOOT = 0x10,
> +    /*
> +     * Configures the watchdog hardware to perform a reboot when it
> +     * is fired.
> +     */
> +    WDAT_ACTION_SET_REBOOT = 0x11,
> +    /*
> +     * Determines if the watchdog hardware is configured to perform a
> +     * system shutdown when fired.
> +     */
> +    WDAT_ACTION_QUERY_SHUTDOWN = 0x12,
> +    /*
> +     * Configures the watchdog hardware to perform a system shutdown
> +     * when fired.
> +     */
> +    WDAT_ACTION_SET_SHUTDOWN = 0x13,
> +    /*
> +     * Determines if the current boot was caused by the watchdog
> +     * firing. The boot status is required to be set if the watchdog
> +     * fired and caused a reboot. It is recommended that the
> +     * Watchdog Status be set if the watchdog fired and caused a
> +     * shutdown. This action is required.
> +     */
> +    WDAT_ACTION_QUERY_WATCHDOG_STATUS = 0x20,
> +    /*
> +     * Sets the watchdog's boot status to the default value. This
> +     * action is required.
> +     */
> +    WDAT_ACTION_SET_WATCHDOG_STATUS = 0x21,
> +} WDATAction;
> +
> +#define WDAT_INS_READ_VALUE 0x0
> +#define WDAT_INS_READ_COUNTDOWN 0x1
> +#define WDAT_INS_WRITE_VALUE 0x2
> +#define WDAT_INS_WRITE_COUNTDOWN 0x3
> +#define WDAT_INS_PRESERVE_REGISTER 0x80
> +
> +void build_append_wdat_ins(GArray *table_data,
> +                           WDATAction action, uint8_t flags,
> +                           struct AcpiGenericAddress as,
> +                           uint32_t val, uint32_t mask);
> +
> +#endif /* QEMU_HW_ACPI_WDAT_H */
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea1c415b21..9f9ce28dcc 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -32,6 +32,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "qemu/cutils.h"
> +#include "hw/acpi/wdat.h"
>  
>  static GArray *build_alloc_array(void)
>  {
> @@ -2647,3 +2648,16 @@ Aml *aml_error_device(void)
>  
>      return dev;
>  }
> +
> +void build_append_wdat_ins(GArray *table_data,
> +                           WDATAction action, uint8_t flags,
> +                           struct AcpiGenericAddress as,
> +                           uint32_t val, uint32_t mask)
> +{
> +    build_append_int_noprefix(table_data, action, 1);    /* Watchdog Action */
> +    build_append_int_noprefix(table_data, flags, 1);     /* Instruction Flags */
> +    build_append_int_noprefix(table_data, 0, 2);         /* Reserved */
> +    build_append_gas_from_struct(table_data, &as);       /* Register Region */
> +    build_append_int_noprefix(table_data, val, 4);       /* Value */
> +    build_append_int_noprefix(table_data, mask, 4);      /* Mask */
> +}


