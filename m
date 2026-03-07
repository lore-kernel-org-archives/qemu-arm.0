Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6ADFCB602
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 15:53:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vytxm-0003fY-Cb; Sat, 07 Mar 2026 10:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytxl-0003fB-7I
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:53:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytxj-0003lQ-IS
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:53:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso95458885e9.2
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 07:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772898786; x=1773503586; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xsr7G48kO9RxsxoKWdMYMsQcdxFbvaBe7c3qmkwQQs8=;
 b=emVJ3VP+pj0qbgzBYZRQhAM7bDdMtCdNAFruGk8asTD8PJhEnRfZGVG4FMpJl6jFWF
 jXoj5Qb8AxpSu58R7d6S0dkePgRaM3zPv16jQgVNIpvEnPesJKfVZxOc/nM+nqS+qn3Z
 TVQ7TpUpWlPoPP9As5P6wZotIzehHNwVkB5p9ItSAsWWbn0gJUdhKGE10GysRLj6i5cR
 CBbGs0UkGAiq/3/H+kXq2flBPPC24BMJ3l59kr9dbkaXSGJ5oxOsz7NTCDlkbt+Gpo5e
 n0v3ytN4kU1jXA1p20+9MtuDIHvQsrQtE6joPD4hXujvXGiALQqFeIaPVGNYTg748hAF
 1H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772898786; x=1773503586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xsr7G48kO9RxsxoKWdMYMsQcdxFbvaBe7c3qmkwQQs8=;
 b=qrzz5bbzGU7NSoluuGU8vVUxiD0PVKHFzq9qgpfskv+3Q+RIU5ymU2ztJBPIVQufN9
 4TCTyVtPCrYrb/jPI1KzkVmPoD1q9bWeZgeKaElFoJXhIqxu0nHZNtgJrRIOdakl93Og
 3QUT5SP1ddMdrYv4UV5F2ubaFzE4ZpGuA85r0TtHT6lU3ruXuW7FOGIg/q10aPAAI9QC
 kwSPOy3NWkjhWoaYBnLNlTNsd2jP07ixhT6EFjdTaqWDkYhBva8Bi1sSf/0f2w8KgEUE
 qKTKDCWxK/WrNCLqYswjq23CAPX0LBDJCzhrxw3TC59xpPrJpjcnR061msNOPd86c71F
 996Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdxks6Eupa2UIS8aIDeschH0TPHHw/XGrCAgcTEMMFywSKbvhEvne6aGlyFQ/tTUpwAGjfTsVKhg==@nongnu.org
X-Gm-Message-State: AOJu0YzFNY+GmuOEUpg3Z40dEV8LU/qYabBp7lbAm5pa0yoyP4Ef4+nc
 hqRR5EFFjuB9kN4k88jRxVn27ZWym8iUyh3QMj5tntCIGaK+rT2ShhAoX5Gnxe1mYUk=
X-Gm-Gg: ATEYQzxt6JbwYQci0X9dSEEa53NvTFacBbREF2OB5ogilvW6x0xNtt6cSZV3QXm0bm/
 yNKiwesyUxdUwQxqN6Uxonl/aB00oAGgKBLEc0ah1q4FzIBNhYQitapLoMKOXjqOVbbHTo8IsoV
 iHGmAtXWL50BglIW5R3sN+Ef7sGa5ZJyCtRss26Mez2kskZuYENpY3IvoH/op2PjXSkR2EJjlth
 6hA11mZGAHQavbXMXZQkReWkeiiwlHC1ObpofOhfFX1+ksqxT8TX9eaeD/EXrp10/Jn3RcDo5+a
 zdL9m1E8hi+ElWDW7uOdHZHNvSJUETAsBg5pWKSBJXBqHOapxMkQq+9OqpkqoRfsN0dgOWyAIxV
 GMl66EvvyW8O6P61kXwGvCo7IrpSwXOe1AM1ObABm5Ia4za3E+oLpK1/MtNaOWaxuIAsLj2lnw+
 gEjsvT/hBo36Pz9bOft/pbuP7hNktzsT0VHrqKHQkvBUW5lRWzPUCGm2qMR3lspp6C6Q==
X-Received: by 2002:a05:600c:c16d:b0:480:39ad:3b7c with SMTP id
 5b1f17b1804b1-485269582fbmr106990085e9.16.1772898785629; 
 Sat, 07 Mar 2026 07:53:05 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb4257csm315745455e9.15.2026.03.07.07.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 07:53:04 -0800 (PST)
Message-ID: <ef4e4171-e4fe-43a9-91c5-a720ba0612d3@linaro.org>
Date: Sat, 7 Mar 2026 16:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] whpx: make Hyper-V enlightenments configurable
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Wei Liu <wei.liu@kernel.org>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20260307154104.84567-1-mohamed@unpredictable.fr>
 <20260307154104.84567-8-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307154104.84567-8-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/3/26 16:41, Mohamed Mediouni wrote:
> Have them be a machine option instead of a CPU one, to have something available, even if not ideal...
> 
> The existing Hyper-V enlightenments configuration mechanism is part of per-CPU configuration, which happens too late for this.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c       | 44 ++++++++++++++++++++++++++++++++++
>   include/system/whpx-internal.h |  4 ++++
>   target/i386/whpx/whpx-all.c    | 20 +++++++++-------
>   3 files changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
> index 4863fc8663..dae9ff0800 100644
> --- a/accel/whpx/whpx-common.c
> +++ b/accel/whpx/whpx-common.c
> @@ -25,6 +25,7 @@
>   #include "qapi/qapi-visit-common.h"
>   #include "migration/blocker.h"
>   #include "accel/accel-cpu-target.h"
> +#include "qemu/target-info.h"

I suppose you meant "qapi/qapi-types-common.h"?

>   #include <winerror.h>
>   
>   #include "system/whpx-internal.h"
> @@ -470,6 +471,41 @@ static void whpx_set_kernel_irqchip(Object *obj, Visitor *v,
>       }
>   }
>   
> +static void whpx_set_hyperv(Object *obj, Visitor *v,
> +                                   const char *name, void *opaque,
> +                                   Error **errp)
> +{
> +    struct whpx_state *whpx = &whpx_global;
> +    OnOffAuto mode;
> +
> +    if (!visit_type_OnOffAuto(v, name, &mode, errp)) {
> +        return;
> +    }
> +
> +    switch (mode) {
> +    case ON_OFF_AUTO_ON:
> +        whpx->hyperv_enlightenments_allowed = true;
> +        whpx->hyperv_enlightenments_required = true;
> +        break;
> +
> +    case ON_OFF_AUTO_OFF:
> +        whpx->hyperv_enlightenments_allowed = false;
> +        whpx->hyperv_enlightenments_required = false;
> +        break;
> +
> +    case ON_OFF_AUTO_AUTO:
> +        whpx->hyperv_enlightenments_allowed = true;
> +        whpx->hyperv_enlightenments_required = false;
> +        break;
> +    default:
> +        /*
> +         * The value was checked in visit_type_OnOffAuto() above. If
> +         * we get here, then something is wrong in QEMU.
> +         */
> +        abort();
> +    }
> +}
> +
>   static void whpx_cpu_accel_class_init(ObjectClass *oc, const void *data)
>   {
>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> @@ -498,6 +534,11 @@ static void whpx_accel_class_init(ObjectClass *oc, const void *data)
>           NULL, NULL);
>       object_class_property_set_description(oc, "kernel-irqchip",
>           "Configure WHPX in-kernel irqchip");
> +    object_class_property_add(oc, "hyperv", "OnOffAuto",
> +        NULL, whpx_set_hyperv,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, "hyperv",
> +        "Configure Hyper-V enlightenments");
>   }
>   
>   static void whpx_accel_instance_init(Object *obj)
> @@ -507,6 +548,9 @@ static void whpx_accel_instance_init(Object *obj)
>       memset(whpx, 0, sizeof(struct whpx_state));
>       /* Turn on kernel-irqchip, by default */
>       whpx->kernel_irqchip_allowed = true;
> +
> +    whpx->hyperv_enlightenments_allowed = true;
> +    whpx->hyperv_enlightenments_required = false;
>   }

