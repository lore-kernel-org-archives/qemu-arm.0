Received: by 10.28.71.27 with SMTP id u27csp3221769wma;
        Mon, 22 Jan 2018 12:13:29 -0800 (PST)
X-Google-Smtp-Source: AH8x225scAsEHGyZHsJogO2M0f4pOQptU8YrcZmvtunTiTzq8bIkm67+CPIIsUFsJjgE8e68UpJJ
X-Received: by 10.37.36.69 with SMTP id k66mr68336ybk.163.1516652009568;
        Mon, 22 Jan 2018 12:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516652009; cv=none;
        d=google.com; s=arc-20160816;
        b=hvfKUo0xsBe5HpijGpNDDErnG+XNPkD9HrJogce3yYO2WMJJWuyheN1ekYQ/svyD+z
         jxJ5hKqjWYjPE8IKK9U4CEhJde9NR6u2lqmbzLfxg8Jd8baN55RHOmENM1TZCeLLe5KM
         iAB3A+A1foCP3oZ111zBooCHnzoNYkE0G6aNTWNwIxc52SH20c6NS9n7Z2t463n1LwvK
         g8rg5ufoewRUTK9kO7CZIVGu0afa5DtR5j0uBo0EzP7amQR794qnyAFmYtga0w6ekHj8
         WO6eX6sjd2QkJSDzzo+O5j2vWBwL7Bn+4zAo77zTbuL7z9YQPROD+7624J665UIgR2U+
         SV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=PyrCR1smhlcLvm+3x7taVenyD+ig+myifus3zFX63hE=;
        b=kyDxCVpyveDcNHQhFSFqYPEbT0H+0i47z8jSzm7RjnUZUroRcGCk1eLaE7MmtsWEML
         KSZttsHvvywsaBGMcjSXkOlCrhbZDISwLPn2NNiVtnANFvpSAo4dsjgvXMHTl2SbqI+T
         FLbVfECFjyCjMboIjFDdcy8dBj7Qth0eKNTwYRwP6x4cJuIUzy9QlH2w1fuKSDkfb+TZ
         Rog6JbrdxsOyUoR7TpZ4yDXPFg5gMZlMYzWlu1dN/C8beIVjWuC+C3rXxKkM6sQ+iiyK
         8IaY3MAnJG0dQNV1VrgRlWb+IKQqxVD/VG5OJufP2GMN2x7gD/ELN4sLHZf5llQeQwUW
         HpGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qAvuMByW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m204si1125201ywm.646.2018.01.22.12.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 12:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qAvuMByW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ediTB-0008EJ-24
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 15:13:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediT4-0008Dh-4h
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 15:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediT3-0003Aw-1x
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 15:13:22 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediT2-0003An-Sg; Mon, 22 Jan 2018 15:13:20 -0500
Received: by mail-qt0-x241.google.com with SMTP id x27so24094960qtm.12;
	Mon, 22 Jan 2018 12:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PyrCR1smhlcLvm+3x7taVenyD+ig+myifus3zFX63hE=;
	b=qAvuMByWofqbjnnA7JOFzWYB2pfvuOv4GaXPEP0lpmSeg9VHgW9VrmIm4885SUd3Wc
	nF7BsYR7RJelE/wihODMu4JjbwPooAqDzxuquoIsSw0NFSodCM/uQJwXJ3Dhu/RoSue7
	38Ibc8EjBBU4nV0BieeErIxlnSCDliNXVCgwhHxbslgd10Hx+slYl/rvGzn+hou1af7z
	ZNuYKf44tyxqOF4ric8SYVF5rK1GuWgEkIZ1Jc7aCQaP2/f05E7hnUv5vrawcsygp+Ko
	xJSPDHmiiNFQHFMgy0qZxdhiW+O8WSRGyQB/yXUlqQ7Zsxngsd6OImpOVtms/Av6isjJ
	pTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PyrCR1smhlcLvm+3x7taVenyD+ig+myifus3zFX63hE=;
	b=BU3aSukaBGb8d62AMjK310aM3prjasuPUYw91fyG0qfxwSIg2apPQ6SfQUoWHCXSdf
	HIkRCZSqe9Hmf3rZuN6I0T2xTlmrcnNcjaVoyFwneS88FkUqPtGg3p/zQFo5LjUlKLLI
	/vHJyji/UzulDIgg37dgVz+hvottuyevgTn32jXFgcypLwfg2V87h2bHxxcW6VJBEgzM
	7sxHLoGqeIjDUXxvDpUGHMyOp8L1O07tPgMjRK30Le9oAyO8fY0+Cjj5v/IF4uFsz5tW
	suL2+ueHZZQrAmH08kOGyM6SaUWwCgkFUOFp+0+hmuW2K0R/C99Z97nmuoQdDpFRTggu
	FpoA==
X-Gm-Message-State: AKwxytfWTcNBsZWwbW0rSqV4uDSRqrlXiWzROg7jSEabdtogSDvWWYBX
	uFT8V/B+3jqnB/wI4pfsRwwSNXax
X-Received: by 10.200.7.193 with SMTP id m1mr87665qth.50.1516652000242;
	Mon, 22 Jan 2018 12:13:20 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	c1sm12095760qta.52.2018.01.22.12.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 12:13:19 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516650109.git.alistair.francis@xilinx.com>
	<7b176d7bc8271aebdaacb4635f7f31d8fc41c078.1516650109.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <754d7340-287e-2068-4ece-b13e6da6d4f8@amsat.org>
Date: Mon, 22 Jan 2018 17:13:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <7b176d7bc8271aebdaacb4635f7f31d8fc41c078.1516650109.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 9/9] xlnx-zynqmp: Connect the
 IPI device to the ZynqMP SoC
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tJeLCdbewuPn

On 01/22/2018 04:43 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 3e6fb9b7bd..0a2b037c6b 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -28,6 +28,7 @@
>  #include "hw/ssi/xilinx_spips.h"
>  #include "hw/dma/xlnx_dpdma.h"
>  #include "hw/display/xlnx_dp.h"
> +#include "hw/intc/xlnx-zynqmp-ipi.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
>  #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
> @@ -90,6 +91,7 @@ typedef struct XlnxZynqMPState {
>      XlnxZynqMPQSPIPS qspi;
>      XlnxDPState dp;
>      XlnxDPDMAState dpdma;
> +    XlnxZynqMPIPI ipi;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..ca398c4159 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -50,6 +50,9 @@
>  #define DPDMA_ADDR          0xfd4c0000
>  #define DPDMA_IRQ           116
>  
> +#define IPI_ADDR            0xFF300000
> +#define IPI_IRQ             64
> +
>  static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
>      0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
>  };
> @@ -183,6 +186,9 @@ static void xlnx_zynqmp_init(Object *obj)
>  
>      object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
>      qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
> +
> +    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
> +    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
>  }
>  
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -454,6 +460,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>                               &error_abort);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->dpdma), 0, DPDMA_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->dpdma), 0, gic_spi[DPDMA_IRQ]);
> +
> +    object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
>  }
>  
>  static Property xlnx_zynqmp_props[] = {
> 
