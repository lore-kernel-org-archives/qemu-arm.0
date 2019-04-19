Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2223040wrx;
        Fri, 19 Apr 2019 14:11:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYm9SskhGSHVZRlU5LqStUwoe4jPf4albvTgV/WE4Hlkm4ijRlH+BEvkJZKfENGypbSFKl
X-Received: by 2002:a1c:544f:: with SMTP id p15mr3838969wmi.65.1555708265210;
        Fri, 19 Apr 2019 14:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555708265; cv=none;
        d=google.com; s=arc-20160816;
        b=HYaHaAQ1UPg32vjSF0WRg5tV2d/9homTMFDSY4fVQbnBP2MbctkiAnFB4nIUItap9v
         5RVXCQMsa7plVCi8g6NsDCCuPdVVjJn81Rm4tlEoSHjOn+3/+MUcyIFoFsYylQIgPMyC
         UAfdD02Pui/m5m1RJEo+F2B4BV+asfAJDcPC2MdaMvTOjXu6MuMyQyJBj/XMPv1Vc0Pt
         nST8F0P1pW17Ea6Fp3QaijJ7XXvgdCpne6jSb/M5JrMG2i6taqP7LRxhUBjodEJVmH06
         znCU0xYD70/Vftng3koT7J30Q1YI+nGvI+/Ji9ZSOj05wss2zjnlVx9BSP0Cut6E9l1I
         68wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=8y3JnOn2sysVarRFf8sASNkXiG0BxOMAm2gvZWbagI0=;
        b=SYuRsshW1qCPvUR88nYVg/17Fy2Ejr7UNKsUrDj/mBS7n0f9d+zijsByvbABcKmEO8
         Ek4i3KO68XMBdRqmd+x5UBJaCby9AmzOmyy1DRthgWtO/STRmFEp7Ii5iC8q8UwZo0o4
         AYULIQBhZmhnXFtEdJZUjO/gX5k1Lea5SwoLGiFfvASDZo2+fZVoIEzJ4NfCmf4KRCd8
         5AYJVvMN5wbU7F+hJ8IuDlcDj6ZtLjrpLBrDAuxGmamzzsH7CDI47OaSzoa7H1CbBwHa
         WJ+Hg7YIb8biUkD01yZnXyyEVvQiXVFyvW14Pu2PIY8We+B7o/EwC19RRM3kMjskzFO4
         zKnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZjpbA6f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w129si4440012wmb.180.2019.04.19.14.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Apr 2019 14:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LZjpbA6f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:33292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHamm-00074X-B5
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 17:11:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hHalo-0006fr-4l
	for qemu-devel@nongnu.org; Fri, 19 Apr 2019 17:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hHaln-0006ad-4v
	for qemu-devel@nongnu.org; Fri, 19 Apr 2019 17:10:04 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:42289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hHalm-0006aA-Tn; Fri, 19 Apr 2019 17:10:03 -0400
Received: by mail-lj1-x244.google.com with SMTP id v22so5559562lje.9;
	Fri, 19 Apr 2019 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8y3JnOn2sysVarRFf8sASNkXiG0BxOMAm2gvZWbagI0=;
	b=LZjpbA6f062KcgcjmSdk853IYlk071eXrP37ONYNMvqGCPsg00bRd9lG99WV+iyaSn
	0fcz8TPCFrxfmYqqfW/uP18wdYgcJEGZKiFzISgrYxDqmw9JEsnWPY61mO/X4kZ3Sl5G
	/otapp+3jI5QLPinz74i3PQXpeTwQ81WEmrsy1Smzp6bEz+MEGHg8f7iXZBhpGBpidrV
	VyJxnrmWiCuVmH/ZXTd4Xaos8xfu24lMR1+Gor99+QnS12Qb0qZhLUgElkkHYONKoJJ8
	fFz79ShQCp2jPt+k+eo44An5Kmo0K9yyG3TBfd9MnhiT2FBL/+TSLyyFkQQ0yut0Tne9
	qRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8y3JnOn2sysVarRFf8sASNkXiG0BxOMAm2gvZWbagI0=;
	b=nos08m/L4A5nx9Bze+mSTzgZ8acQOd0kpavNiayy1Gryfljrz8ljDGtmjL9fwHcJHF
	KFwYJTux2Z2PClNPfLX7n/g5iII2HsGkpk7+3vXW5fJE+uPgZKnEZhTOdZcaH87oqWXs
	ClhhTZNfdEEI1vDW4PkfYAyXvdgooi/OQZhFshcpzyelc7cQfzZnmx69tPxM7v5n9379
	nLrO7CjH0oIP3MoA6TcjbKZhAH6TeI1AYLPNEaon79JhF1+8UywEw0Ox7iVRUQSlF+c4
	ImqISsZTYMAfeYLHg638IuwJm5FQxpLeISku2CSHtawR2tc/Oun+ens5vnEvEwHFK5AJ
	L/sQ==
X-Gm-Message-State: APjAAAXgzo72/IcVFQ8TbPI0/sRwzYSGXmWom7U/ozm547YiSmkrJ75E
	YcRnZydhFhmO6GpOx+VmOYab6DJocmPl1bNT0I8=
X-Received: by 2002:a2e:895a:: with SMTP id b26mr3259208ljk.89.1555708201361; 
	Fri, 19 Apr 2019 14:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-14-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-14-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Apr 2019 14:09:34 -0700
Message-ID: <CAKmqyKObGO3+s6QsF7TQBTxEx4DRm-GjM9gorv+tvJzC=YsTqQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH for-QEMU-4.1 v5 13/29] hw/arm: Express
 dependencies of xilinx-zynq with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yang Zhong <yang.zhong@intel.com>, Rob Herring <robh@kernel.org>,
	Qemu-block <qemu-block@nongnu.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uj0NVWAOH1UZ

On Thu, Apr 18, 2019 at 11:18 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Add Kconfig dependencies for the xilinx-zynq-a9 board.
> This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/arm-softmmu.mak |  7 +------
>  hw/arm/Kconfig                  | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index f39a854f2e..af78e7c892 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -19,6 +19,7 @@ CONFIG_STELLARIS=3Dy
>  CONFIG_REALVIEW=3Dy
>  CONFIG_VERSATILE=3Dy
>  CONFIG_VEXPRESS=3Dy
> +CONFIG_ZYNQ=3Dy
>  CONFIG_MAINSTONE=3Dy
>  CONFIG_GUMSTIX=3Dy
>  CONFIG_SPITZ=3Dy
> @@ -38,16 +39,11 @@ CONFIG_VIRTIO_MMIO=3Dy
>
>  CONFIG_NETDUINO2=3Dy
>
> -CONFIG_PL330=3Dy
> -CONFIG_CADENCE=3Dy
>  CONFIG_FRAMEBUFFER=3Dy
> -CONFIG_XILINX_SPIPS=3Dy
> -CONFIG_ZYNQ_DEVCFG=3Dy
>
>  CONFIG_DIGIC=3Dy
>  CONFIG_MPS2=3Dy
>  CONFIG_RASPI=3Dy
> -CONFIG_ZYNQ=3Dy
>  CONFIG_STM32F2XX_TIMER=3Dy
>  CONFIG_STM32F2XX_USART=3Dy
>  CONFIG_STM32F2XX_SYSCFG=3Dy
> @@ -100,7 +96,6 @@ CONFIG_SMBUS_EEPROM=3Dy
>  CONFIG_GPIO_KEY=3Dy
>  CONFIG_MSF2=3Dy
>  CONFIG_FW_CFG_DMA=3Dy
> -CONFIG_XILINX_AXI=3Dy
>  CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
>
>  CONFIG_STRONGARM=3Dy
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 101de74260..785e383411 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -201,6 +201,18 @@ config VEXPRESS
>
>  config ZYNQ
>      bool
> +    select A9MPCORE
> +    select CADENCE # UART
> +    select PFLASH_CFI02
> +    select PL330
> +    select SDHCI
> +    select SSI_M25P80
> +    select USB_EHCI_SYSBUS
> +    select XILINX # UART
> +    select XILINX_AXI
> +    select XILINX_SPI
> +    select XILINX_SPIPS
> +    select ZYNQ_DEVCFG
>
>  config ARM_V7M
>      bool
> --
> 2.21.0
>
>
