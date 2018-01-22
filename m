Received: by 10.28.71.27 with SMTP id u27csp3220386wma;
        Mon, 22 Jan 2018 12:11:54 -0800 (PST)
X-Google-Smtp-Source: AH8x227OezJpOx6buOBZGVq2CrpNZESXRO3zFryqY8QjIE+utHqu4JrQXt2DiYYoLo5IRP6DMpXh
X-Received: by 10.13.244.70 with SMTP id d67mr55325ywf.127.1516651914356;
        Mon, 22 Jan 2018 12:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516651914; cv=none;
        d=google.com; s=arc-20160816;
        b=06Fd2tQPUSvuse3GPZiSSCF96neopZDrz+rtf48gaKZ25V2Q2ftytOoLUnFK6WV4o4
         OeomS4TaWsr2b8gjoWZ3R8voZyKMl7JfhPDLcHeLU9L4n2FugKhJVYV6EOquDB07zuda
         DC4xQNb0P/di5wGBHLHPvzYQx7fhTf5HFoN4JkhQ7e/qtAr0gyHs88gXPZw6ZtGFQKOE
         WNPUBpIwXk3KruDDK9Q5pIi5s+i0NHUJjMV3qqlAb8DaRV3Gs0rkQUj67leRU57yM2gN
         sqKbRFFILBhX2hf3XiZC8Iq3Bgyg1sH5rAQWRpxignxsSZgjPHW+TtuX/IhCfkbAAHhz
         HPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=g45l9HsN+aoESDd/H8SZHCHXlieuV8P0uGaMlW4LOLo=;
        b=muESDwB507B9OtgU5jGm6W7ZH0sjArhJMQLAtf2HoSLEWnDeeNB8pE8BLKF2QDpP96
         SZJfMq7xDCbv3t/TpGejcyLRL225SVCGRBIQKrnz2aORdihWV/kDuQK+Om3LpzD7XKiZ
         aoqnTMJ1fQad871uCIc9yoEzEZdpwSc7zJxRxyv4TFc3NuMIkf2AE25HSGUUTRWnJjGv
         cNOS491hI96MHX2KE1EJ3k8eHr+iSSRGxURKQJ3Z73RaVXi9jVuPGOQ2/FZ95rlEW8/B
         8bT2o3MzJUbnbnNqkq1VNbV9iwdDoanXKfMzT+VqSjx1eUXt3t1FRYxZVT87DOgxo8hs
         rBSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BbOuz7Pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si2128030ybs.248.2018.01.22.12.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 12:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BbOuz7Pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ediRd-0007NI-Pr
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 15:11:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediRU-0007N3-FG
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 15:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediRR-0002Z1-6f
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 15:11:44 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ediRR-0002Xq-1O; Mon, 22 Jan 2018 15:11:41 -0500
Received: by mail-qt0-x241.google.com with SMTP id d54so24121844qtd.4;
	Mon, 22 Jan 2018 12:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g45l9HsN+aoESDd/H8SZHCHXlieuV8P0uGaMlW4LOLo=;
	b=BbOuz7PqPg5OxDVwp3rVZb46Ug2d0AaP33BCPE1mrahjLw/FgW0yD4fUcuiuaeoRIW
	7KVKvPlAE/nzYARsnWeGrqYGSzcU/d3u4FDoRuPunw2cGLXgUngUpWJs1faHvY972WFk
	0QanGWya+HX3xCVasdj3DbqVhKM0hN7PZf6jcTyqvmIAWsghB/Fe20msCkrONpOjCYuu
	W5hOkhds/o1rIPIj8E2dwhUZ7DNtPT2tS8X0f15NY79MrfLgDIvejrAkR6yas/pfZipK
	5eLs7buUv9d9gucfiTemFwEs+wOGdP0q6cpnEqcwteFTGjYQyLByH4Dqy7HFWv9oJ/Wo
	OhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=g45l9HsN+aoESDd/H8SZHCHXlieuV8P0uGaMlW4LOLo=;
	b=qTrOIZxGU95vMyJnRtiw8Pyzg3DBTlE7lXHzJJX/q/hVYl2VijoRS3M5dwcwCWOUau
	nfVzakXhKc2BfMKN79hCuVtaQSZKZSidLG4V4wIIaHkV/HfGd/NA6ls2J/aXnEgL3rsG
	bZEh5HIHdh5fuQA1fyH/lPWW6q2GxpkgsVL+4udGRnAitbsaodFxe9ldVR0vtU0zrLKW
	XHdmjXHSmAY42wxYMfBG38CYfTaD5flICsspYk7XjUrgdI0THocrl7pb4bZmPN2sj3et
	EHMdZS/XVKp7dxqKoo42Co0GZAN/aw02oj2GOsG7cfzhyVEgSFogIOvt+eWFrKjKqVcO
	ZQIw==
X-Gm-Message-State: AKwxyteMELBIoMktTjIREjowsTPvt0N2XrtFVYJshU7owAA5hfFo/DBs
	YGGUYF+3n67pFLg7TQ0WRVwUHIXP
X-Received: by 10.200.56.83 with SMTP id r19mr22362qtb.125.1516651900437;
	Mon, 22 Jan 2018 12:11:40 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id k7sm7555227qkf.35.2018.01.22.12.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 12:11:39 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516650109.git.alistair.francis@xilinx.com>
	<c7577f92c251176a04ba82a56fc088cd3609800f.1516650109.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9a6c3bdc-79bb-c119-61b2-fd4dd9fe8221@amsat.org>
Date: Mon, 22 Jan 2018 17:11:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <c7577f92c251176a04ba82a56fc088cd3609800f.1516650109.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 4/9] aarch64-softmmu.mak: Use
 an ARM specific config
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
X-TUID: o4JEJjcQuRXx

On 01/22/2018 04:43 PM, Alistair Francis wrote:
> In preperation for having an ARM and MicroBlaze ZynqMP machine let's
> split out the current ARM specific config options.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  default-configs/aarch64-softmmu.mak | 1 +
>  hw/arm/Makefile.objs                | 2 +-
>  hw/display/Makefile.objs            | 2 +-
>  hw/dma/Makefile.objs                | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 24494832cf..9ddccf855e 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -7,3 +7,4 @@ CONFIG_AUX=y
>  CONFIG_DDC=y
>  CONFIG_DPCD=y
>  CONFIG_XLNX_ZYNQMP=y
> +CONFIG_XLNX_ZYNQMP_ARM=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2794e086d6..1c896bafb4 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -13,7 +13,7 @@ obj-y += omap1.o omap2.o strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
>  obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
>  obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
> -obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-zcu102.o
> +obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
> diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
> index 551c050a6a..d3a4cb396e 100644
> --- a/hw/display/Makefile.objs
> +++ b/hw/display/Makefile.objs
> @@ -40,4 +40,4 @@ virtio-gpu.o-libs += $(VIRGL_LIBS)
>  virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
>  virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
>  obj-$(CONFIG_DPCD) += dpcd.o
> -obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
> +obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dp.o
> diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
> index 0b3a009b87..c2afecbf73 100644
> --- a/hw/dma/Makefile.objs
> +++ b/hw/dma/Makefile.objs
> @@ -9,6 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
>  common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
>  common-obj-$(CONFIG_STP2000) += sparc32_dma.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
> +obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
>  
>  obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
> 
