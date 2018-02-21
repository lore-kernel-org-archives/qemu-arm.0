Received: by 10.28.71.27 with SMTP id u27csp569807wma;
        Wed, 21 Feb 2018 02:30:33 -0800 (PST)
X-Google-Smtp-Source: AH8x2254Ru2OGCbzlbyLBcn8JGCJBfQpDf5tV47zTCemGxZdTfVgnjiCyQyfAj3UqE6evgPTX5hx
X-Received: by 10.129.0.2 with SMTP id 2mr1833793ywa.417.1519209032933;
        Wed, 21 Feb 2018 02:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519209032; cv=none;
        d=google.com; s=arc-20160816;
        b=ygm2KJPyyeGd86QeJhLbV3HUnjgfjWzQYTZmFOSJcsGrqNN2SM7MEYif+Mci5ZrkP1
         VRqfrCZSyxRgDgYa40Nfo0os0mHm5+DF52LGyylsPx5XO1bv+ZC70eYm/iFBkoUF/q4M
         u0bm1WKqQUHaiuQ6d4tkLzwHtBir8026ZdmhG51oE/VEGlJ1lkgE2JB9haF9ZIj47Mi6
         n1KKiVoid8th0SsabXlniz4hxpUVYyXD+HPtzJkWhW3OvVwit1RALnFJFB2zOPrqjtqc
         MRpmoHnstAHKhmdL1XI8hNfTE+TO+jX7pVIhLkzWXOseQW54HAuh3dQKIA9ufkS1Wgxx
         lOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=uJnWkI4kLIN8Xys7r9/lO+tugdH4mOzd0cRVzKzUvtE=;
        b=udjzjYCQZ7CInx7VbtcjMB+nxrdXghUyp7ZLIFhRIhGCVeChbVeyKlWzWmeByVjYML
         XiOGU0GUxFgEguCWyc6m+wqypJAi/bjT87YkS+K8NLIZid1PHpnooocBsIreyvXUg6n6
         TMIDols6leQgLY0NGKA8l5/UHV4CCui8Qjfq1b7dGFwtHh49ciUbGjoVbn4rQnLpAwtT
         3IsXf/D82dVs9j/uUOsDsr1hW2NdJb1zoIHjEOmw6dSQYadkiSIwVe6DC/ZzAOdSmDyH
         QwLSSbmt5vXiF7x78JLLbFqvfmiZFo0AhJWjphfAEf4KgrG3ITWbVPCWRb9sPG0zeIoc
         E6aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186si1681029ybb.6.2018.02.21.02.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Feb 2018 02:30:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoRfU-0002tW-D6
	for alex.bennee@linaro.org; Wed, 21 Feb 2018 05:30:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoRfG-0002nt-DL
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 05:30:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoRfC-00023R-Vy
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 05:30:18 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52760 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoRfC-000232-MH; Wed, 21 Feb 2018 05:30:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42A07EB705;
	Wed, 21 Feb 2018 10:30:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84061AF013;
	Wed, 21 Feb 2018 10:30:13 +0000 (UTC)
Date: Wed, 21 Feb 2018 11:30:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180221113012.2ee836fb@redhat.com>
In-Reply-To: <20180220180325.29818-20-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-20-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 21 Feb 2018 10:30:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 21 Feb 2018 10:30:14 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/19] mps2-an505: New board
 model: MPS2 with AN505 Cortex-M33 FPGA image
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LNaES0t0VLX5

On Tue, 20 Feb 2018 18:03:25 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Define a new board model for the MPS2 with an AN505 FPGA image
> containing a Cortex-M33. Since the FPGA images for TrustZone
> cores (AN505, and the similar AN519 for Cortex-M23) have a
> significantly different layout of devices to the non-TrustZone
> images, we use a new source file rather than shoehorning them
> into the existing mps2.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Makefile.objs |   1 +
>  hw/arm/mps2-tz.c     | 504 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 505 insertions(+)
>  create mode 100644 hw/arm/mps2-tz.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 79cd30bb92..232258160a 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,5 +19,6 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
> +obj-$(CONFIG_MPS2) += mps2-tz.o
>  obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
>  obj-$(CONFIG_IOTKIT) += iotkit.o
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> new file mode 100644
> index 0000000000..ff414c649c
> --- /dev/null
> +++ b/hw/arm/mps2-tz.c
> @@ -0,0 +1,504 @@
> +/*
> + * ARM V2M MPS2 board emulation, trustzone aware FPGA images
> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/* The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
> + * FPGA but is otherwise the same as the 2). Since the CPU itself
> + * and most of the devices are in the FPGA, the details of the board
> + * as seen by the guest depend significantly on the FPGA image.
> + * This source file covers the following FPGA images, for TrustZone cores:
> + *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
> + *
> + * Links to the TRM for the board itself and to the various Application
> + * Notes which document the FPGA images can be found here:
> + * https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/mps2
> + *
> + * Board TRM:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.100112_0200_06_en/versatile_express_cortex_m_prototyping_systems_v2m_mps2_and_v2m_mps2plus_technical_reference_100112_0200_06_en.pdf
> + * Application Note AN505:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
> + *
> + * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
> + * (ARM ECM0601256) for the details of some of the device layout:
> + *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/arm.h"
> +#include "hw/arm/armv7m.h"
> +#include "hw/or-irq.h"
> +#include "hw/boards.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/misc/unimp.h"
> +#include "hw/char/cmsdk-apb-uart.h"
> +#include "hw/timer/cmsdk-apb-timer.h"
> +#include "hw/misc/mps2-scc.h"
> +#include "hw/misc/mps2-fpgaio.h"
> +#include "hw/arm/iotkit.h"
> +#include "hw/devices.h"
> +#include "net/net.h"
> +#include "hw/core/split-irq.h"
> +
> +typedef enum MPS2TZFPGAType {
> +    FPGA_AN505,
> +} MPS2TZFPGAType;
> +
> +typedef struct {
> +    MachineClass parent;
> +    MPS2TZFPGAType fpga_type;
> +    const char *cpu_model;
I don't see it used in this patch, should it be removed?


> +    uint32_t scc_id;
> +} MPS2TZMachineClass;
> +
[...]
