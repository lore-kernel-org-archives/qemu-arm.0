Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C33BCD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:03:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsMI-0006Uu-Ef; Tue, 26 May 2026 10:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsMG-0006R1-T3
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsMF-0008Az-2M
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779804129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlAFoVs12Bl0ab0oqv34IDtRNTCOGqQ+BraGIiq/+eM=;
 b=WDvRB1NPjg4uTUTjAovHygH/+FsNaz1/ZYPIGWx1dEezebgCBzju//B2u8XY0MA7sdwRHk
 0SR2zbLGwuG5ZsJDPn9YY8g+1rFvlHIzGZ5OBfGv7JKaBg2AJMN8JoZOWg1QmjKi+EJM5G
 axvFXVzQbsyoOafBzImLTK4D8Wn5pfs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-kcFoNb1eNhCBbV8FAqDF6A-1; Tue, 26 May 2026 10:02:08 -0400
X-MC-Unique: kcFoNb1eNhCBbV8FAqDF6A-1
X-Mimecast-MFC-AGG-ID: kcFoNb1eNhCBbV8FAqDF6A_1779804124
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-bcdbb46dce2so282002266b.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779804124; x=1780408924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KlAFoVs12Bl0ab0oqv34IDtRNTCOGqQ+BraGIiq/+eM=;
 b=hMWWDai8bCKxqBLg+S2TNkFMZJq71o9cilfz9UR+x6mzVr30sluvDspeRQ8kE0pprv
 lSHs8dsOiwKsY/blvWtmcmQiMOKldqZbQm72RuwQEnWuBMAXbTY9uh87x1GbZYHm0zkk
 PiAlxBxlLG7eiTI8SiQbrdVjnAoVv6ZKlRMRdwZZMkuGn//B/MOTN5Vg97cdrvy4tD2Z
 WHFakhSy02u1DScLse4XEKj7fVHVlAneG1BkQqFctGW/fFnufAbcrWV2IizUv9pQ3lya
 yk9DEtgpDLVeYf5gA9BA80SkTQXp8uKpStFh8ADbsD+NHegB2Gsench6emmemMu1P0f/
 V0Xg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AtRkuv3vTFvZb2+PQiRoU5gBI6AHInuORY9JEufYFxoy3a8nE+RCkE22BeYNkqFOZrOSw32BBDg==@nongnu.org
X-Gm-Message-State: AOJu0YwfSBIbNeUM0OI4F9QImMWEoAUEX2P0YHQf61V5dAOggqaDCQYF
 e5pkuFXStr6l0vwx7Q0T1jHRp+quWv9CrznaG9EGko0b6dPwtFHqQIjmD6CvELlb+JKZ/2ni6xT
 tPl5s/RZCcmGkCE5sj/yY2Ek4uaRMoGx1t5l1KO8GpIPXp3lM7/R/YA==
X-Gm-Gg: Acq92OE3tfWP/7xKYhmgtZtQwndZBhOjzYI05MToFVIxXxCBvEBlFQyDwSN8txENzoa
 GPVuCumdQDWu0q7zi9PPSfQTRSdTWiu23127ZNbDJWJCNKGWHxJN5FKicyeZn6Me8x1+IENJCBL
 X0HNlWaSD68P7UPrLfRsZmOIiIqthMj0xClY6erynFf5hWf1nNe2CwuOSd3JIvHnVbMPFoamuq3
 0aiv2ey8UDqqiLfxYavCp8jHJCDjgaEZJcyA1auT5+VxmjUdekWIIQqwtmc2dGSns7dd3g7BNsA
 /jv27z/kJ/PQbR9zZuju9cna2Xh31AWB7qJIHtsnDAfXXiRj/LKOsUmjlGmiJdR1pdB8RQx+yad
 fzqLoUtXFjpuJiFoaotmrukhJjq2qn5utUxOtipRIvtXCD+5pMLfqdHA90+s2vrD7
X-Received: by 2002:a17:907:75f7:b0:bdb:6a9a:713 with SMTP id
 a640c23a62f3a-bdd26bd897amr808998066b.46.1779804122970; 
 Tue, 26 May 2026 07:02:02 -0700 (PDT)
X-Received: by 2002:a17:907:75f7:b0:bdb:6a9a:713 with SMTP id
 a640c23a62f3a-bdd26bd897amr808991666b.46.1779804122170; 
 Tue, 26 May 2026 07:02:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d6ebf0sm36971862f8f.34.2026.05.26.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:02:01 -0700 (PDT)
Message-ID: <0e7783a9-cf5d-47f5-a8ec-5f31c2bab430@redhat.com>
Date: Tue, 26 May 2026 16:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] arm: add tracing events to sbsa_gwdt
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-9-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-9-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H44tnM6s09MNBF0F8UYt2hyNn_uVpyhNzzCZBxe8k3g_1779804124
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/watchdog/sbsa_gwdt.c  | 8 ++++++++
>  hw/watchdog/trace-events | 9 +++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index b739a3ce3c..acb970e8b3 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -24,6 +24,7 @@
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "trace.h"
>  
>  static const VMStateDescription vmstate_sbsa_gwdt = {
>      .name = "sbsa-gwdt",
> @@ -62,6 +63,7 @@ static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
>          qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame read :"
>                          " 0x%x\n", (int)addr);
>      }
> +    trace_sbsa_gwdt_refresh_read(addr, ret);
>      return ret;
>  }
>  
> @@ -93,6 +95,7 @@ static uint64_t sbsa_gwdt_read(void *opaque, hwaddr addr, unsigned int size)
>          qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame read :"
>                          " 0x%x\n", (int)addr);
>      }
> +    trace_sbsa_gwdt_control_read(addr, ret);
>      return ret;
>  }
>  
> @@ -127,6 +130,7 @@ static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
>                               unsigned size) {
>      SBSA_GWDTState *s = SBSA_GWDT(opaque);
>  
> +    trace_sbsa_gwdt_refresh_write(offset, data);
>      if (offset == SBSA_GWDT_WRR) {
>          s->wcs &= ~(SBSA_GWDT_WCS_WS0 | SBSA_GWDT_WCS_WS1);
>  
> @@ -141,6 +145,7 @@ static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
>                               unsigned size) {
>      SBSA_GWDTState *s = SBSA_GWDT(opaque);
>  
> +    trace_sbsa_gwdt_control_write(offset, data);
>      switch (offset) {
>      case SBSA_GWDT_WCS:
>          s->wcs = data & SBSA_GWDT_WCS_EN;
> @@ -180,6 +185,7 @@ static void wdt_sbsa_gwdt_reset(DeviceState *dev)
>  {
>      SBSA_GWDTState *s = SBSA_GWDT(dev);
>  
> +    trace_sbsa_gwdt_reset();
>      timer_del(s->timer);
>  
>      s->wcs  = 0;
> @@ -196,10 +202,12 @@ static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
>  
>      if (!(s->wcs & SBSA_GWDT_WCS_WS0)) {
>          s->wcs |= SBSA_GWDT_WCS_WS0;
> +        trace_sbsa_gwdt_ws0_asserted();
>          sbsa_gwdt_update_timer(s, TIMEOUT_REFRESH);
>          qemu_set_irq(s->irq, 1);
>      } else {
>          s->wcs |= SBSA_GWDT_WCS_WS1;
> +        trace_sbsa_gwdt_ws1_asserted();
>          qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
>          /*
>           * Reset the watchdog only if the guest gets notified about
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index ad3be1e9bd..a5c10882f4 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -33,3 +33,12 @@ spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u
>  # watchdog.c
>  watchdog_perform_action(unsigned int action) "action=%u"
>  watchdog_set_action(unsigned int action) "action=%u"
> +
> +#sbsa_gwdt.c
> +sbsa_gwdt_refresh_read(uint64_t addr, uint32_t value) "[0x%" PRIx64 "] -> 0x%" PRIx32
> +sbsa_gwdt_refresh_write(uint64_t addr, uint64_t value) "[0x%" PRIx64 "] <- 0x%" PRIx64
> +sbsa_gwdt_control_read(uint64_t addr, uint32_t value) "[0x%" PRIx64 "] -> 0x%" PRIx32
> +sbsa_gwdt_control_write(uint64_t addr, uint64_t value) "[0x%" PRIx64 "] <- 0x%" PRIx64
> +sbsa_gwdt_ws0_asserted(void) "WS0 signal is asserted"
> +sbsa_gwdt_ws1_asserted(void) "WS1 signal is asserted"
> +sbsa_gwdt_reset(void) "reset watchdog to default state"


