Received: by 10.223.134.117 with SMTP id 50csp11365924wrw;
        Tue, 2 Jan 2018 16:16:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBotSOx8rOZV/WDBoyC15k3dAvh6y4qAHFe44gA7WuPajAfVaupsWn0wQPZms2T3ahQb6Yo1a
X-Received: by 10.13.218.133 with SMTP id c127mr34480172ywe.68.1514938564841;
        Tue, 02 Jan 2018 16:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514938564; cv=none;
        d=google.com; s=arc-20160816;
        b=B+34yNeghTQNfWx7D8nbiUtAI3eu4D9xYjZTj2nrR6vJJbVjsrld4mbDMxbXH3IzkJ
         LKLlkqjOAfMMM+cqkPvmIH+Ojdn/EJ5LGiOy758hy1byyJLq/8N2XtrFPPi/8eFqCWYb
         ejeNSHQz30kNeta7WDb7b5YgsGebRaMjXK0LbSVU6Mmfxf2J6//STAFJ3hxACAFsKeAK
         VsbO9Iafj3/2oQu8kNSQtLwfL7qd/09MB7MpEMdM2UAR3deCdMK155voptoOTdKM3R7M
         VyVOJ+WH/71n8udBv3gN/2OXJOG4aVe0jgoNO/ua8b/OtvxDgC5A3deeDGZvNKexje9Y
         pHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=1th5gbCzCCTYKVECjLxJ2zdEiYDYgyeTm6S71ZMV5EQ=;
        b=bjbuQu+gf/KF7BDE1WogswlPGJ1abI9ZOchnGfnOov/wVK1mJ7/mxeeGmLqe+0UJvO
         4xGNaxOSzi8GUYK6l1/N6QaRcQST3kogTHK5EGgu0CbSntwaf7u5S/vZ6fp1dZLb9USK
         HftMK4SAiZWfzFpwrCpYt4EbB7d2Or1n5VVJoVDE8MI1LLq3W3Ybk34Fpm7yWE0V+W4m
         yK/XF9BG1q9GuF6FIPdbFeZ7peQ0X25FcjmtC+J5ivIleBdLRw3ypTvggxrEApWpLIPL
         0SMYgdD6/8wmyMYl3SjYy3iVhOnzM9YGshfMr7Pl6CIlECgumBo/mzYQ3yyEBv+SvM3+
         qmAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iJVv6VuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13si2274331ywm.635.2018.01.02.16.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 16:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iJVv6VuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWWiy-0003iw-8s
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 19:16:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWWik-0003hc-3K
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 19:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWWii-0000Mz-M1
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 19:15:50 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:38210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eWWie-0000KA-Sh; Tue, 02 Jan 2018 19:15:45 -0500
Received: by mail-wm0-x243.google.com with SMTP id 64so18536wme.3;
	Tue, 02 Jan 2018 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=1th5gbCzCCTYKVECjLxJ2zdEiYDYgyeTm6S71ZMV5EQ=;
	b=iJVv6VuZj3l4WHnJ3nB45Qm5G+tEF0h5nrfQ0nMJnIQGnLoAKL20PNV/T76dfLDPRn
	PiE+3vWh4sG9FHip0PK72Y5jinzTyH0Tfm+BzE7UZtacIjbtugnDtHc7OWs++fyKXMiG
	13cgUHanvJKINX6+g8AIqDij4lCL/GSEb4gaYtoxnGwV5OOgTTycgvUHceL3ogm3+brv
	9MNu3LfcCKz9IQy/1KVI5PlpM1NZL4r0CxieI26GijELFK99xjqaBGlT1Ao6JnZ5Ucqb
	th+s/+hHVWMqHIOVgO1m7RsVEZHs6YYgJX6rZA0n6unmkxIWa8bYmYNiFU51wQDNoL1Q
	1QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=1th5gbCzCCTYKVECjLxJ2zdEiYDYgyeTm6S71ZMV5EQ=;
	b=J1M8DGb++ihkm6DLVyD/8GfyFyprYWkg6eA5Q/TboqipNhp1gYVDZD7B0HaPd4Wl4Y
	NRmytQjErs3XEvyuBUcoByr03/caEHopA6Djv92Qk1dJEVX/6REU/qbyCLiaRDi+LOLn
	EJrW2kYty2pSOD7ggUebKldvN2G99ypqwpv2fc3dDk549BM2Rx8a5GT0mdhj4PFWLIFY
	1/6FPYXE1lsxO9F0yz/q6H2OuWBo9s5t3e+rC2hVWPs/T82lX+ULGn0MWoCX7hO4FOqh
	v2YpcixLRp9RlPLI2PNWm/7iCSPTzh+31tPUQZw+YYQtsTlP321B3DIjdhYXUkOZ/xSA
	ZOxg==
X-Gm-Message-State: AKGB3mI3/0ivOgJd98TGZ6lNOCNPWg8AijNJER8IpO4hqqnUTd3v9XLn
	trAp0ORhc61X6RY3LtqQg9dtrk6/nSo/ryaarGM=
X-Received: by 10.28.208.198 with SMTP id h189mr45864wmg.25.1514938543795;
	Tue, 02 Jan 2018 16:15:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 2 Jan 2018 16:15:13 -0800 (PST)
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 2 Jan 2018 16:15:13 -0800
X-Google-Sender-Auth: 7gWQx84I5lk5yCD__oSH2PUS-gY
Message-ID: <CAKmqyKNDbhAQWXYPrhFnbqcCRDO_ZeBdUuC_xna9XpqCvw452g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 00/42] SDHCI: housekeeping,
 add a qtest and fix few issues
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0htG9xXYXrIl

On Fri, Dec 29, 2017 at 9:48 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Since v2:
> - more detailed 'capabilities', all boards converted to use these propert=
ies
> - since all qtests pass, removed the previous 'capareg' property
> - added Stefan/Alistair R-b
> - corrected 'access' LED behavior (Alistair's review)
> - more uses of the registerfields API
> - remove some dead code
> - cosmetix:
>   - added more comments
>   - renamed a pair of registers
>   - reordered few struct members
>
> Note, the bcm2835 seems to have 1KB minimum blocksize, however the curren=
t
> model is implemented with 512B. I didn't change the current value.
>
> Since v1:
> - addressed Alistair Francis review comments, added some R-b
> - only move register defines to "sd-internal.h"
> - fixed deposit64() arguments
> - dropped unuseful s->fifo_buffer =3D NULL
> - use a qemu_irq for the LED, restrict the logging to ON/OFF
> - fixed a trace format string error
> - included Andrey Smirnov ACMD12ERRSTS write patch
> - dropped few unuseful patches, and separate the Python polemical ones fo=
r later
>
> From the "SDHCI housekeeping" series:
> - 1: we restrict part of "sd/sd.h" into local "sd-internal.h",
> - 2,3: we somehow beautiful the code, no logical changes,
> - 4-7: we refactor the common sysbus/pci qdev code,
> - 8-10: we add plenty of trace events which will result useful later,
> - 11: we finally expose a "dma-memory" property.
> From the "SDHCI: add a qtest and fix few issues" series:
> - 12,13: fix registers
> - 14,15: boards can specify which SDHCI Spec to use (v2 and v3 so far)
> - 15-20: HCI qtest
>
> Regards,
>
> Phil.
>
> $ git backport-diff
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream pat=
ch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively
>
> 001/42:[0003] [FC] 'sdhci: clean up includes'
> 002/42:[down] 'sdhci: sort registers comments'
> 003/42:[down] 'sdhci: remove dead code'
> 004/42:[----] [--] 'sdhci: refactor same sysbus/pci properties'
> 005/42:[----] [--] 'sdhci: refactor common sysbus/pci class_init()'
> 006/42:[----] [--] 'sdhci: refactor common sysbus/pci realize()'
> 007/42:[0001] [FC] 'sdhci: refactor common sysbus/pci unrealize()'
> 008/42:[----] [--] 'sdhci: use qemu_log_mask(UNIMP) instead of fprintf()'
> 009/42:[----] [--] 'sdhci: convert the DPRINT() calls into trace events'
> 010/42:[down] 'sdhci: add a GPIO for the 'access control' LED'
> 011/42:[----] [--] 'sdhci: move MASK_TRNMOD with other SDHC_TRN* defines'
> 012/42:[down] 'sdhci: use FIELD_DP32() macro for the WRITE_PROTECT flag'
> 013/42:[down] 'sdhci: rename the SDHC_CAPAB register'
> 014/42:[0008] [FC] 'sdhci: fix CAPAB/MAXCURR registers, 64bit and read-on=
ly'
> 015/42:[----] [-C] 'sdhci: Implement write method of ACMD12ERRSTS registe=
r'
> 016/42:[down] 'sdhci: use deposit64() on admasysaddr'
> 017/42:[----] [-C] 'sdhci: add a "dma-memory" property'
> 018/42:[down] 'sdhci: add a spec_version property'
> 019/42:[down] 'sdhci: add basic Spec v1 capabilities'
> 020/42:[down] 'sdhci: add max-block-length capability (Spec v1)'
> 021/42:[down] 'sdhci: add clock capabilities (Spec v1)'
> 022/42:[down] 'sdhci: add DMA and 64-bit capabilities (Spec v2)'
> 023/42:[down] 'sdhci: default to Spec v2'
> 024/42:[down] 'sdhci: add a 'dma' shortcut property'
> 025/42:[down] 'sdhci: add BLOCK_SIZE_MASK for DMA'
> 026/42:[down] 'sdhci: Fix 64-bit ADMA2'
> 027/42:[down] 'hw/arm/exynos4210: implement SDHCI Spec v2'
> 028/42:[down] 'hw/arm/xilinx_zynq: implement SDHCI Spec v2'
> 029/42:[0022] [FC] 'sdhci: add qtest to check the SD Spec version'
> 030/42:[down] 'sdhci: check Spec v2 capabilities qtest'
> 031/42:[down] 'sdhci: add v3 capabilities'
> 032/42:[down] 'sdhci: rename the hostctl1 register'
> 033/42:[down] 'hw/arm/bcm2835_peripherals: implement SDHCI Spec v3'
> 034/42:[down] 'hw/arm/fsl-imx6: implement SDHCI Spec v3'
> 035/42:[down] 'hw/arm/xilinx_zynqmp: implement SDHCI Spec v3'
> 036/42:[down] 'sdhci: check Spec v3 capabilities qtest'
> 037/42:[down] 'sdhci: remove the deprecated 'capareg' property'
> 038/42:[0008] [FC] 'sdhci: add check_capab_readonly() qtest'
> 039/42:[0009] [FC] 'sdhci: add a check_capab_baseclock() qtest'
> 040/42:[0011] [FC] 'sdhci: add a check_capab_sdma() qtest'
> 041/42:[----] [-C] 'sdhci: add a check_capab_v3() qtest'
> 042/42:[down] 'sdhci: add Spec v4.2 register definitions'

We are making progress here. Do you think it would be worth splitting
out the earlier patches that have been reviewed so far so they can be
merged? A 42 patch series it pretty daunting and most of the first 20
are pretty straightforward and have been reviewed.

Alistair

>
> Andrey Smirnov (1):
>   sdhci: Implement write method of ACMD12ERRSTS register
>
> Philippe Mathieu-Daud=C3=A9 (40):
>   sdhci: clean up includes
>   sdhci: sort registers comments
>   sdhci: remove dead code
>   sdhci: refactor same sysbus/pci properties into a common one
>   sdhci: refactor common sysbus/pci class_init() into sdhci_class_init()
>   sdhci: refactor common sysbus/pci realize() into sdhci_realizefn()
>   sdhci: refactor common sysbus/pci unrealize() into sdhci_unrealizefn()
>   sdhci: use qemu_log_mask(UNIMP) instead of fprintf()
>   sdhci: convert the DPRINT() calls into trace events
>   sdhci: add a GPIO for the 'access control' LED
>   sdhci: move MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"
>   sdhci: use FIELD_DP32() macro for the WRITE_PROTECT flag
>   sdhci: rename the SDHC_CAPAB register
>   sdhci: fix CAPAB/MAXCURR registers, both are 64bit and read-only
>   sdhci: use deposit64() on admasysaddr
>   sdhci: add a "dma-memory" property
>   sdhci: add a spec_version property
>   sdhci: add basic Spec v1 capabilities
>   sdhci: add max-block-length capability (Spec v1)
>   sdhci: add clock capabilities (Spec v1)
>   sdhci: add DMA and 64-bit capabilities (Spec v2)
>   sdhci: default to Spec v2
>   sdhci: add a 'dma' shortcut property
>   sdhci: add BLOCK_SIZE_MASK for DMA
>   hw/arm/exynos4210: implement SDHCI Spec v2
>   hw/arm/xilinx_zynq: implement SDHCI Spec v2
>   sdhci: add qtest to check the SD Spec version
>   sdhci: check Spec v2 capabilities qtest
>   sdhci: add v3 capabilities
>   sdhci: rename the hostctl1 register
>   hw/arm/bcm2835_peripherals: implement SDHCI Spec v3
>   hw/arm/fsl-imx6: implement SDHCI Spec v3
>   hw/arm/xilinx_zynqmp: implement SDHCI Spec v3
>   sdhci: check Spec v3 capabilities qtest
>   sdhci: remove the deprecated 'capareg' property
>   sdhci: add check_capab_readonly() qtest
>   sdhci: add a check_capab_baseclock() qtest
>   sdhci: add a check_capab_sdma() qtest
>   sdhci: add a check_capab_v3() qtest
>   sdhci: add Spec v4.2 register definitions
>
> Sai Pavan Boddu (1):
>   sdhci: Fix 64-bit ADMA2
>
>  include/hw/sd/sdhci.h        |  59 ++++-
>  hw/sd/sdhci-internal.h       |  81 +++++--
>  hw/arm/bcm2835_peripherals.c |  35 ++-
>  hw/arm/exynos4210.c          |  13 +-
>  hw/arm/fsl-imx6.c            |  12 +
>  hw/arm/xilinx_zynq.c         |  64 ++++--
>  hw/arm/xlnx-zynqmp.c         |  38 +++-
>  hw/sd/sdhci.c                | 513 +++++++++++++++++++++++++------------=
------
>  tests/sdhci-test.c           | 177 +++++++++++++++
>  hw/sd/trace-events           |  15 ++
>  tests/Makefile.include       |   3 +
>  11 files changed, 718 insertions(+), 292 deletions(-)
>  create mode 100644 tests/sdhci-test.c
>
> --
> 2.15.1
>
>
