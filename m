Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23594381lff;
        Mon, 6 Jan 2020 08:57:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzeepYBM477ChMUBkPBv9sZqqXyqS7CrZhKtltDKs77rEp5pNgKEgcEVzjkDZ4ixlnYDuN2
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr97075853edw.27.1578329833033;
        Mon, 06 Jan 2020 08:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578329833; cv=none;
        d=google.com; s=arc-20160816;
        b=DIHJpQfJYS8+vZMSC6oDZg4m92cTYshiPvriBHx79ruooa+S6Rnvtu1x6/xMP5aaF2
         RE86MePsjQl47kLOGB2vZP9xqtnJtzSfAFrZVbZv6UQvFh893hlRiAU0vubA9Jcw3AXr
         sZwJ6upHVwkv4J/DOmOBlN+2YWOKWxjgT6IGRiY3wOpgT86weLIANuNJr1UHR48SmuXl
         IQOkJ5js6xYcGw1kuiADx/iAoLsyG9hz6N4O8nk1uWt1NJVqOOrZUOAyTjmPUEytj2js
         lbzm6ZKaOOYNK13ujYbAhSmBqYGOCz6ntCsc38vmAWlanmsCT6E+ASasxpGFeocYXaWV
         11QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=02TUdWYuGZFoP948H3QA+6CQ6nzlskfpSUT1h3iutTA=;
        b=XHD7q/TZbT64R7c4+t4aUspFQoKdLgWqKPEOZJcoUNifmZtYhmnGH6U3T6GtI9Hp2R
         JXJO7SnlwEt8yiYHNH956tzeUI761t8nJntqRyKqpTByzfzxB3U5OqPF0xkYEhKIGpxX
         4litjrMp+LlrqT8CMCMXxJS0KRYBNPubP3zjxG0OAEeo2uVA1O6t8j4DtUf+qLeuxrHo
         LU4BoOMFQWvaMC9PHhdDqnsNRYN01GDN0n7eleFSoqWEd4cm6RJptLnOevMHw3G/TsKv
         /zVxG//9BHh6PCyQy9mLl4sqWOG1BlDGQlpsfpyWCN+fRm6bUF8sVtSpSdvYystPMfzg
         YWbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DZsECNW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kt18si44186824ejb.213.2020.01.06.08.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DZsECNW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioVgl-0008Vv-UF
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ioVgc-0008Uo-OQ
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:57:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ioVga-00075r-In
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:57:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28116
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ioVga-00074f-4f
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578329819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02TUdWYuGZFoP948H3QA+6CQ6nzlskfpSUT1h3iutTA=;
 b=DZsECNW6i411VwnE9IJT0Qd5jgV64noYDfg1IVmbK72chfkgxhuuZeFUYoZaaCSuKiO/VN
 zoQcH1bEbZHH/vobxUEJHzrozxyW4+3Ybc1hYDvdhJoJdEqkuVkMxjxXTkNKhKlwWFVsRj
 WNNmBaU+nQ6lxCUIDDxgZT8UNt+iplI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-NwXBIvPPM9KVPYO7qywHXw-1; Mon, 06 Jan 2020 11:56:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53ED71005502;
 Mon,  6 Jan 2020 16:56:56 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DB2C10840F1;
 Mon,  6 Jan 2020 16:56:51 +0000 (UTC)
Date: Mon, 6 Jan 2020 17:56:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v7 4/4] hw/arm: Add the Netduino Plus 2
Message-ID: <20200106175650.0ddc9bf2@redhat.com>
In-Reply-To: <dad8d8d47f7625913e35e27a1c00f603a6b08f9a.1576658572.git.alistair@alistair23.me>
References: <cover.1576658572.git.alistair@alistair23.me>
 <dad8d8d47f7625913e35e27a1c00f603a6b08f9a.1576658572.git.alistair@alistair23.me>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: NwXBIvPPM9KVPYO7qywHXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alistair23@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxlhIB4DDuqJ

On Wed, 18 Dec 2019 21:22:55 -0800
Alistair Francis <alistair@alistair23.me> wrote:

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  MAINTAINERS            |  6 +++++
>  hw/arm/Makefile.objs   |  1 +
>  hw/arm/netduinoplus2.c | 52 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 hw/arm/netduinoplus2.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bda53628a5..203ced66e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -829,6 +829,12 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  S: Maintained
>  F: hw/arm/netduino2.c
>  
> +Netduino Plus 2
> +M: Alistair Francis <alistair@alistair23.me>
> +M: Peter Maydell <peter.maydell@linaro.org>
> +S: Maintained
> +F: hw/arm/netduinoplus2.c
> +
>  SmartFusion2
>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index d9d54da7cf..336f6dd374 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -11,6 +11,7 @@ obj-$(CONFIG_MAINSTONE) += mainstone.o
>  obj-$(CONFIG_MICROBIT) += microbit.o
>  obj-$(CONFIG_MUSICPAL) += musicpal.o
>  obj-$(CONFIG_NETDUINO2) += netduino2.o
> +obj-$(CONFIG_NETDUINOPLUS2) += netduinoplus2.o
>  obj-$(CONFIG_NSERIES) += nseries.o
>  obj-$(CONFIG_SX1) += omap_sx1.o
>  obj-$(CONFIG_CHEETAH) += palm.o
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> new file mode 100644
> index 0000000000..e5e247edbe
> --- /dev/null
> +++ b/hw/arm/netduinoplus2.c
> @@ -0,0 +1,52 @@
> +/*
> + * Netduino Plus 2 Machine Model
> + *
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/stm32f405_soc.h"
> +#include "hw/arm/boot.h"
> +
> +static void netduinoplus2_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_create(NULL, TYPE_STM32F405_SOC);
> +    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       FLASH_SIZE);
> +}

I wonder if we should make user provided '-m' a hard error
for boards that have fixed RAM size. And make '-m' or forthcoming
"-machine memdev" optin feature for boards that explicitly ask for it?

PS:
(I suspect that the most boards with fixed RAM size do not really
care about numa, mempath/prealloc and other features memdev provides)

> +
> +static void netduinoplus2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Netduino Plus 2 Machine";
> +    mc->init = netduinoplus2_init;
> +}
> +
> +DEFINE_MACHINE("netduinoplus2", netduinoplus2_machine_init)

