Received: by 10.28.71.27 with SMTP id u27csp6061wma;
        Wed, 31 Jan 2018 09:07:00 -0800 (PST)
X-Google-Smtp-Source: AH8x227KgOwlGJfufbh1o2IybDapgphEi+10B1FIzyEevdIv5kwmk/yKbAhyGW55ZB/3BBXJghvp
X-Received: by 10.37.73.194 with SMTP id w185mr1964007yba.427.1517418419986;
        Wed, 31 Jan 2018 09:06:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517418419; cv=none;
        d=google.com; s=arc-20160816;
        b=O941Z/ZYNdFQiUAB8B1RpRhXnVEpf7RAtmlLyBvqf0I+3Bb6GywLMQg+KJOJ7FyEJm
         nfb861Y3GvD65uwintylZWVbQsxm9lpYo79QORQMaqLK/xAysUJojBUCbGIn2FiMW4A/
         hqBQ+Yju3HExUQl19tRBdYy5npUQSd6j7rs+Gi4LCs7XTZzepTbweSE7qcvlmgMJ/3QC
         /84YNuo9bS9Y7jRmdsp24KaL5oLtnkHrhoqHW4ftkCUsdsBJDNWOsViWJ+IjVK2UilF7
         p882sQVzrTAZ051BKtAftXeUiLIf+r71yTni354Aco/jK6X3jbq5l/W6hqLNd66bjWjO
         v/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RaZ9/BF4bUjqO9GpAnz7rSFq27EwfWwHD4x8Mj69+PY=;
        b=VrNdbBacu7EcIAUrmKbzco8UX4UboYmC6d0VHT8mzohvsJQIth9k/jHNhHz36iDUpM
         FhfW1ZV0raEPf7NzcvyGSeydodNds2+CFL2s0RHB+qYzAoe0LNjLes5FvdObFw6lo+Yu
         M+GukV8R1BRkdXcrD5sntlVKjGjdSUs3rzHI7tIcnlVyKpYa7ZzdFQU01/EUxJTvqTBU
         UFeegTlGS+L0dg8qmOZbmANP4d4KkEvjlDCzJFLDGjcJgaDfLLASWYyJbqMxgPMn8kj2
         tLiQJxQEjVc/tJh7H6n8HnQ8MY/LpMmb5pf3F+Z7pZRXEFgjMmBCyX29aJXqnwaiZrLg
         ZK5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D/+52j7O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si3222748ywk.669.2018.01.31.09.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 09:06:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D/+52j7O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvqd-00058j-CL
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 12:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvnT-0002pC-8x
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 12:03:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvnO-0004JD-P6
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 12:03:43 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1egvnO-0004HX-JK; Wed, 31 Jan 2018 12:03:38 -0500
Received: by mail-qk0-x244.google.com with SMTP id n188so4253367qkn.11;
	Wed, 31 Jan 2018 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RaZ9/BF4bUjqO9GpAnz7rSFq27EwfWwHD4x8Mj69+PY=;
	b=D/+52j7OLl3LRF5ieC3Y5VipugJoqAJ2aiMoJnwtPdZYYDLepO1kmxgYgZ8lEt9aF8
	Yyf0T7nGF0g+P1cWqZBmx71ePnqOcUiXL1HB9OVlkXcrxi6WHyYzU1+n+GflzSt/1dFw
	L8JlHImJjip0QGmgdxMLbym02hYZJi8nE4iOzst3yp8N8t5FlDnE1CILtavd6LdThHy7
	NkMb9dSJQTKRXMFiYCKU261Mi8fGBdmFGAxkWYMhKeoic9JdHtZ6HjwRa+j4Qb4LqztU
	xV6LpQ4FAAJ8i/JBndqiGF8sMcHQxbBEgbpdOhV49kgsZPObnIwfQ1yBiALxFRkv8K5o
	pSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RaZ9/BF4bUjqO9GpAnz7rSFq27EwfWwHD4x8Mj69+PY=;
	b=iQ7+RRE1wV4xD7rWhqqbjy1u+/1/O8bF7wQaSGzPBocM3jxxWRmK6CYDDdOhd5Y90k
	+4lXRqOa8DPjFF0L2KsjkCkss1QvorFuLD8GqGwSyG0BWWm6ii/MjKHXRVt6IUJsm1Lc
	X8UMJ4B+y6bDtDjHSrHg0tVVz4eGDARf7/rOTd1EW1Wc7qggrUVhDOLijaOqCPN0NuOk
	IxHK8sBGeJHVWZRJbKjTsGaww3g4MzNZGmVKO7MKcPVH7KHQn+MB2w+XR2V3lHTlHX8S
	gGiCDfy2JPMifsIqPpK/MDMmal4DuWRIHXBVeyl9DbcpuHk8gSUz607+xP6itI/d/jFO
	I+9A==
X-Gm-Message-State: AKwxytfGRFhycYlyc8YmfRRwdt5oi+qXHEWQvxO3zKg1iDXNVxE9Ib8O
	nmfanh2hkQWjHwWM3PXjaaY=
X-Received: by 10.55.75.151 with SMTP id y145mr50514714qka.281.1517418217542; 
	Wed, 31 Jan 2018 09:03:37 -0800 (PST)
Received: from [10.17.0.157] ([190.210.239.69])
	by smtp.gmail.com with ESMTPSA id
	g1sm13948128qta.46.2018.01.31.09.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 09:03:36 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11f684c4-9159-0e4e-5990-635194b32d65@amsat.org>
Date: Wed, 31 Jan 2018 14:03:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [PATCH v4 00/14] Initial i.MX7 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tpw2vWy4m8dX

Hi Peter, Andrey.

On 01/15/2018 10:36 PM, Andrey Smirnov wrote:
> Hi everyone,
> 
> This v4 of the patch series containing the work that I've done in
> order to enable support for i.MX7 emulation in QEMU.
> 
> *NOTE*: Patches 1 and 2 are provided for the sake of completness and
> 	are going to have to be adapted once Philippe's SD changes
> 	land in master. As such, they are NOT ready to be
> 	accepted/merged.

Peter:
Since my series are taking longer, if this series is ready it is
probably easier to apply Andrey series first and I'll adapt my SDHCI
series after.

Andrey:
I only plan to keep the sdhci.c file generic (dealing with quirks) and
split out the imx usdhci code, similar to this patch:
https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg01265.html

> 
> As the one before last commit in the series states the supported i.MX7
> features are:
> 
>     * up to 2 Cortex A9 cores (SMP works with PSCI)
>     * A7 MPCORE (identical to A15 MPCORE)
>     * 4 GPTs modules
>     * 7 GPIO controllers
>     * 2 IOMUXC controllers
>     * 1 CCM module
>     * 1 SVNS module
>     * 1 SRC module
>     * 1 GPCv2 controller
>     * 4 eCSPI controllers
>     * 4 I2C controllers
>     * 7 i.MX UART controllers
>     * 2 FlexCAN controllers
>     * 2 Ethernet controllers (FEC)
>     * 3 SD controllers (USDHC)
>     * 4 WDT modules
>     * 1 SDMA module
>     * 1 GPR module
>     * 2 USBMISC modules
>     * 2 ADC modules
>     * 1 PCIe controller
>     * 3 USB controllers
>     * 1 LCD controller
>     * 1 ARMv7 DAP IP block
> 
> Feedback is welcome!
> 
> Changes since [v3]:
> 
>     - Changes to FEC were split into a separate set and merged to master
> 
>     - Patchest is rebased on latest master
> 
>     - Converted to use PSCI DT fixup code that is shared with virt
>       platform (now relocated to live in arm/boot.c)
> 
>     - Large number of dummy block were converted to use
>       create_unimplemented_device() as opposed to its own dedicated
>       type
> 
>     - Incorporated varios small feedback items
> 
>     - Collected Reviewed-by tags from Peter
> 
> Changes since [v2]:
> 
>     - Added stubs for more blocks that were causing memory
>       transactions when booting Linux guest as were revealed by
>       additional testing of the patchest
> 
>     - Added proper USB emulation code, so now it should be possible to
>       emulated guest's USB bus
> 
> Changes since [v1]:
> 
>     - Patchset no longer relies on "ignore_memory_transaction_failures = false"
>       for its functionality
> 
>     - As a consequnce of implementing the above a number of patches
>       implementing dummy IP block emulation as well as PCIe emulation
>       patches that I alluded to in [v1] are now included in this patch
>       series
> 
>     - "has_el3" property is no longer being set to "false" as a part
>       of intialization of A7 CPU. I couldn't reproduce the issues that
>       I thought I was having, so I just dropped that code.
> 
>     - A number of smaller feedback items from Peter and other has been
>       incorporated into the patches.
> 
> 
> Thanks,
> Andrey Smirnov
> 
> [v3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg04236.html
> [v2] https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg05516.html
> [v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html
> 
> Andrey Smirnov (14):
>   sdhci: Add i.MX specific subtype of SDHCI
>   hw: i.MX: Convert i.MX6 to use TYPE_IMX_USDHC
>   i.MX: Add code to emulate i.MX7 CCM, PMU and ANALOG IP blocks
>   i.MX: Add code to emulate i.MX2 watchdog IP block
>   i.MX: Add code to emulate i.MX7 SNVS IP-block
>   i.MX: Add code to emulate GPCv2 IP block
>   i.MX: Add i.MX7 GPT variant
>   i.MX: Add implementation of i.MX7 GPR IP block
>   pci: Add support for Designware IP block
>   usb: Add basic code to emulate Chipidea USB IP
>   ARM: Add basic code to emulate A7MPCore DAP block
>   i.MX: Add i.MX7 SOC implementation.
>   hw/arm: Move virt's PSCI DT fixup code to arm/boot.c
>   Implement support for i.MX7 Sabre board
> 
>  default-configs/arm-softmmu.mak  |   3 +
>  hw/arm/Makefile.objs             |   5 +-
>  hw/arm/boot.c                    |  65 ++++
>  hw/arm/coresight.c               | 120 ++++++++
>  hw/arm/fsl-imx6.c                |   2 +-
>  hw/arm/fsl-imx7.c                | 583 ++++++++++++++++++++++++++++++++++++
>  hw/arm/mcimx7d-sabre.c           |  90 ++++++
>  hw/arm/virt.c                    |  61 ----
>  hw/intc/Makefile.objs            |   2 +-
>  hw/intc/imx_gpcv2.c              | 125 ++++++++
>  hw/misc/Makefile.objs            |   4 +
>  hw/misc/imx2_wdt.c               |  89 ++++++
>  hw/misc/imx7_ccm.c               | 277 ++++++++++++++++++
>  hw/misc/imx7_gpr.c               | 119 ++++++++
>  hw/misc/imx7_snvs.c              |  83 ++++++
>  hw/pci-host/Makefile.objs        |   2 +
>  hw/pci-host/designware.c         | 618 +++++++++++++++++++++++++++++++++++++++
>  hw/sd/sdhci-internal.h           |  19 ++
>  hw/sd/sdhci.c                    | 228 ++++++++++++++-
>  hw/timer/imx_gpt.c               |  25 ++
>  hw/usb/Makefile.objs             |   1 +
>  hw/usb/chipidea.c                | 176 +++++++++++
>  include/hw/arm/coresight.h       |  24 ++
>  include/hw/arm/fsl-imx7.h        | 223 ++++++++++++++
>  include/hw/intc/imx_gpcv2.h      |  22 ++
>  include/hw/misc/imx2_wdt.h       |  33 +++
>  include/hw/misc/imx7_ccm.h       | 139 +++++++++
>  include/hw/misc/imx7_gpr.h       |  28 ++
>  include/hw/misc/imx7_snvs.h      |  35 +++
>  include/hw/pci-host/designware.h |  93 ++++++
>  include/hw/pci/pci_ids.h         |   2 +
>  include/hw/sd/sdhci.h            |  14 +
>  include/hw/timer/imx_gpt.h       |   1 +
>  include/hw/usb/chipidea.h        |  16 +
>  34 files changed, 3261 insertions(+), 66 deletions(-)
>  create mode 100644 hw/arm/coresight.c
>  create mode 100644 hw/arm/fsl-imx7.c
>  create mode 100644 hw/arm/mcimx7d-sabre.c
>  create mode 100644 hw/intc/imx_gpcv2.c
>  create mode 100644 hw/misc/imx2_wdt.c
>  create mode 100644 hw/misc/imx7_ccm.c
>  create mode 100644 hw/misc/imx7_gpr.c
>  create mode 100644 hw/misc/imx7_snvs.c
>  create mode 100644 hw/pci-host/designware.c
>  create mode 100644 hw/usb/chipidea.c
>  create mode 100644 include/hw/arm/coresight.h
>  create mode 100644 include/hw/arm/fsl-imx7.h
>  create mode 100644 include/hw/intc/imx_gpcv2.h
>  create mode 100644 include/hw/misc/imx2_wdt.h
>  create mode 100644 include/hw/misc/imx7_ccm.h
>  create mode 100644 include/hw/misc/imx7_gpr.h
>  create mode 100644 include/hw/misc/imx7_snvs.h
>  create mode 100644 include/hw/pci-host/designware.h
>  create mode 100644 include/hw/usb/chipidea.h
> 
