Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp733296lfm;
        Wed, 17 Jun 2020 08:55:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTKWi97hTOJi6VjBNGo/uAWqp/yQ4qyKI+SmIEAxD+mVMJP0lCBK+t9xgytKvbfyVFT/xA
X-Received: by 2002:a25:da96:: with SMTP id n144mr13398341ybf.291.1592409306676;
        Wed, 17 Jun 2020 08:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592409306; cv=none;
        d=google.com; s=arc-20160816;
        b=qL1unAjnp/TGGTKDpnYT5E+UfTnEt885wT8cG9Mq/RbuthQ5eUJSWO+6CQptEeTXUB
         OOR2NsK/oLiiQrnhGfhI5EWmRZ0AXE9zhsxUuCr9JskfzZOGiA77EGLY2LaZqThd7s8f
         WVuntE40WO8E2g7f5CCTV4OUN+mBBVNXicm0GnAppryAmPi4pJuzrGpxuWIsDB+iYZiY
         ZtAnzTCaMlxjknscDumZMANt45BQ3fnKU0CP7XWKyVA09r2zCaGCmUspMWB/ZjyM+qBs
         oIRk+OUyZ7KqGa4jwmQqa0ViRPMmJpMUMqvZ83IgssRV+hKIdgBNXjaR3i8tN8vQlxAd
         G+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=B1dwwFcbDTHfWS+4AbIlw33G+Uuxp8GXAHB60BC9Pq8=;
        b=NwTgdc7DEpooNTWZmH7r6dyhCf5sAlO4pVigaqEOWRvmJUpc7QARV97psHLOcpzSuf
         eN/FxvB91UwHngrq+vPQQrDhCKEwlL0Y2ZutU4yNirax1XenQaicy+f7n4Utg+TnY81e
         swf78fABz2qy4EPY0TqPTKBnERz+FHyjtrpMqcMV+TEtFAxX/zrHvHpEGokE3i5e6smg
         na1T3tn0+iFyvHmjU3xh7uPG4pSHtSdceFkHvv9pafdndBfTyBJ7ibg7OmiqyT5+FtT7
         z5rmnpDJIxqI6HtK6Li7ivzY6dF+isE8ifBi3GQvMsFti/Bf2djSl00hjvQUFqo5Lb5d
         gswQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e129si45173ybf.359.2020.06.17.08.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 08:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlaP3-00076x-Vz
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 11:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaOs-00075o-DG
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 11:54:54 -0400
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:49264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlaOo-0005vh-6A
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 11:54:54 -0400
Received: from player786.ha.ovh.net (unknown [10.110.171.49])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 756491CB2A1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 17:54:47 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 3C19713A20AEB;
 Wed, 17 Jun 2020 15:54:37 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00413d696b5-c388-4447-a337-5abf61b586fc,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 joel@jms.id.au
References: <20200611223016.259837-1-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <49cf918e-7c03-8e51-6080-a136ad25ba0e@kaod.org>
Date: Wed, 17 Jun 2020 17:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4379469164696931241
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetkeduveffheffkeevleelieefgfekgedvleekgfeludeiteetudefkeehfefhffenucffohhmrghinhepnhhuvhhothhonhdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.158.110; envelope-from=clg@kaod.org;
 helo=7.mo1.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 11:24:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tyFIEc+QnE5q

Hello,

On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
> an OpenBMC image built for quanta-gsj. This includes device models for:
> 
>   - Global Configuration Registers
>   - Clock Control
>   - Timers
>   - Fuses
>   - Memory Controller
>   - Flash Controller

Do you have a git tree for this patchset ? 

> These modules, along with the existing Cortex A9 CPU cores and built-in
> peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in turn form
> the foundation for the quanta-gsj and npcm750-evb machines, respectively. The
> two SoCs are very similar; the only difference is that NPCM730 is missing some
> peripherals that NPCM750 has, and which are not considered essential for
> datacenter use (e.g. graphics controllers). For more information, see
> 
> https://www.nuvoton.com/products/cloud-computing/ibmc/
> 
> Both quanta-gsj and npcm750-evb correspond to real boards supported by OpenBMC.
> While this initial series uses a stripped-down kernel for testing, future
> series will be tested using OpenBMC images built from public sources. I'm
> currently putting the finishing touches on flash controller support, which is
> necessary to boot a full OpenBMC image, and will be enabled by the next series.

ok. 

It would be nice to be able to download the images from some site
like we do for Aspeed.

> The patches in this series were developed by Google and reviewed by Nuvoton. We
> will be maintaining the machine and peripheral support together.
> 
> The data sheet for these SoCs is not generally available. Please let me know if
> more comments are needed to understand the device behavior.
> 
> Changes since v1 (requested by reviewers):
> 
>   - Clarify the source of CLK reset values.
>   - Made smpboot a constant byte array, eliinated byte swapping.

I have revived a PPC64 host. We might want to add the swapping back.

>   - NPCM7xxState now stores an array of ARMCPUs, not pointers to ARMCPUs.
>   - Clarify why EL3 is disabled.
>   - Introduce NPCM7XX_NUM_IRQ constant.
>   - Set the number of CPUs according to SoC variant, and disallow command line
>     overrides (i.e. you can no longer override the number of CPUs with the -smp
>     parameter). This is trying to follow the spirit of
>     https://patchwork.kernel.org/patch/11595407/.
>   - Switch register operations to DEVICE_LITTLE_ENDIAN throughout.

yes. We should do the same for Aspeed.

>   - Machine documentation added (new patch).

Thanks,

C.


> Changes since v1 to support flash booting:
> 
>   - GCR reset value changes to get past memory initialization when booting
>     from flash (patches 2 and 5):
>       - INTCR2 now indicates that the DDR controller is initialized.
>       - INTCR3 is initialized according to DDR memory size. A realize()
> 	method was implemented to achieve this.
>   - Refactor the machine initialization a bit to make it easier to drop in
>     machine-specific flash initialization (patch 6).
>   - Extend the series with additional patches to enable booting from flash:
>       - Boot ROM (through the -bios option).
>       - OTP (fuse) controller.
>       - Memory Controller stub (just enough to skip memory training).
>       - Flash controller.
>       - Board-specific flash initialization.
> 
> Thanks for reviewing,
> 
> Havard
> 
> Havard Skinnemoen (12):
>   npcm7xx: Add config symbol
>   hw/misc: Add NPCM7xx System Global Control Registers device model
>   hw/misc: Add NPCM7xx Clock Controller device model
>   hw/timer: Add NPCM7xx Timer device model
>   hw/arm: Add NPCM730 and NPCM750 SoC models
>   hw/arm: Add two NPCM7xx-based machines
>   hw/arm: Load -bios image as a boot ROM for npcm7xx
>   hw/nvram: NPCM7xx OTP device model
>   hw/mem: Stubbed out NPCM7xx Memory Controller model
>   hw/ssi: NPCM7xx Flash Interface Unit device model
>   hw/arm: Wire up BMC boot flash for npcm750-evb and quanta-gsj
>   docs/system: Add Nuvoton machine documentation
> 
>  MAINTAINERS                      |  18 ++
>  default-configs/arm-softmmu.mak  |   1 +
>  docs/system/arm/nuvoton.rst      |  89 ++++++
>  docs/system/target-arm.rst       |   1 +
>  hw/arm/Kconfig                   |   9 +
>  hw/arm/Makefile.objs             |   1 +
>  hw/arm/npcm7xx.c                 | 449 ++++++++++++++++++++++++++++
>  hw/arm/npcm7xx_boards.c          | 168 +++++++++++
>  hw/mem/Makefile.objs             |   1 +
>  hw/mem/npcm7xx_mc.c              |  83 ++++++
>  hw/misc/Makefile.objs            |   2 +
>  hw/misc/npcm7xx_clk.c            | 216 ++++++++++++++
>  hw/misc/npcm7xx_gcr.c            | 211 +++++++++++++
>  hw/misc/trace-events             |   8 +
>  hw/nvram/Makefile.objs           |   1 +
>  hw/nvram/npcm7xx_otp.c           | 391 ++++++++++++++++++++++++
>  hw/ssi/Makefile.objs             |   1 +
>  hw/ssi/npcm7xx_fiu.c             | 497 +++++++++++++++++++++++++++++++
>  hw/ssi/trace-events              |   9 +
>  hw/timer/Makefile.objs           |   1 +
>  hw/timer/npcm7xx_timer.c         | 437 +++++++++++++++++++++++++++
>  hw/timer/trace-events            |   5 +
>  include/hw/arm/npcm7xx.h         | 106 +++++++
>  include/hw/mem/npcm7xx_mc.h      |  35 +++
>  include/hw/misc/npcm7xx_clk.h    |  65 ++++
>  include/hw/misc/npcm7xx_gcr.h    |  76 +++++
>  include/hw/nvram/npcm7xx_otp.h   |  93 ++++++
>  include/hw/ssi/npcm7xx_fiu.h     |  99 ++++++
>  include/hw/timer/npcm7xx_timer.h |  95 ++++++
>  29 files changed, 3168 insertions(+)
>  create mode 100644 docs/system/arm/nuvoton.rst
>  create mode 100644 hw/arm/npcm7xx.c
>  create mode 100644 hw/arm/npcm7xx_boards.c
>  create mode 100644 hw/mem/npcm7xx_mc.c
>  create mode 100644 hw/misc/npcm7xx_clk.c
>  create mode 100644 hw/misc/npcm7xx_gcr.c
>  create mode 100644 hw/nvram/npcm7xx_otp.c
>  create mode 100644 hw/ssi/npcm7xx_fiu.c
>  create mode 100644 hw/timer/npcm7xx_timer.c
>  create mode 100644 include/hw/arm/npcm7xx.h
>  create mode 100644 include/hw/mem/npcm7xx_mc.h
>  create mode 100644 include/hw/misc/npcm7xx_clk.h
>  create mode 100644 include/hw/misc/npcm7xx_gcr.h
>  create mode 100644 include/hw/nvram/npcm7xx_otp.h
>  create mode 100644 include/hw/ssi/npcm7xx_fiu.h
>  create mode 100644 include/hw/timer/npcm7xx_timer.h
> 

