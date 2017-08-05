Received: by 10.25.221.202 with SMTP id w71csp149952lfi;
        Fri, 4 Aug 2017 18:25:32 -0700 (PDT)
X-Received: by 10.237.35.237 with SMTP id k42mr6018891qtc.226.1501896332400;
        Fri, 04 Aug 2017 18:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501896332; cv=none;
        d=google.com; s=arc-20160816;
        b=yTfDek8qyeRdsZrrrrqDgHd8/u3JOfJ5tYalz3NNyvfRfYuwZgx+E8IJ8iLCKJt2Jg
         PneYSZoTIn3wjK1+xfy6uoZvKiZF63DVj0/Z0I9KBpnQ4lO55atpomCE1mYeWKGJZ60G
         C7CjNdGXZvkrVVKxLZIn8aiCb9jwF0U0hFPD/wxWU0vlJrF+jkcd97vmUCwgb+ihCnsR
         eCSYUIE5G+Qqc2Y/5UbX64ZH9UerSADFf2Sc8gIdqlb1RPdFzmj4NHZm01RzwQ1f3pMd
         Ld5ki/g7C/ECNSzy0CLWBsIFksJQPX/oIVNnC2dnKdSpc4LXfxoID6Now6rIlU4pSqrq
         AQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=iCzMouK0rE7cqPKhaHckj5lf8KO8XwVsnifh0s6z4fo=;
        b=Z1N89ymp3RVr7DaPSrw2n3zrkcNBB9MZ/enrv/AUDo1ZDiyxzKj+k+TwwwkUyU3rPM
         yrrt4gWG7R1EnHSovNYoVzFpH5y73gwp/WcE9t5LE+V8a6WasAwdCZ3BANqofmYqj41N
         fvaKpcqTfhlqpWcEgBU1i0fIWH24HHL9PYzEvSRwHNhHuMLCF0BmQNFgK0oATRaZ1LwE
         J9DByNb1w1iBbvFxsEDEE6imnaQLo5oo7yLM7+5r6hr+m+ybrMhofTMsKfS3sSDKwEaY
         dqGFLSvJhcE18eWhLNTDNOP9fVWP4SCXaKRWxuzMEj2MNsetIKLZc5tHRiwNiW1yfW2T
         F5GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ebaDtdYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m73si2277024qkm.180.2017.08.04.18.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ebaDtdYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddnqL-00081X-Ks
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:25:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnpd-0006t4-O8
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnpb-0003Bt-Gv
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:24:45 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:37869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddnpb-00039C-45; Fri, 04 Aug 2017 21:24:43 -0400
Received: by mail-lf0-x241.google.com with SMTP id x16so2023368lfb.4;
	Fri, 04 Aug 2017 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iCzMouK0rE7cqPKhaHckj5lf8KO8XwVsnifh0s6z4fo=;
	b=ebaDtdYEq4T8RyDKlYaQ4aOWUcTqgWlRr3Dt+S/UZZsK4udOJVxOLQ4r+r87iUSwY1
	hXZpqs6fJ1ody1JePbPJjY4U+yPc0KAZuoZ96SVuDsOt1OzfZJW8npPI7TVrIKjFAmPy
	K3YMTWv/IN5DtKLgU39sxX2844QM7O23Aj2n1ZZZVCxdC4CP+ByXRG0zryVdpOp5Vgic
	6GYY32OmNEhG7Gic6qD+28gYtqv58z5mEvj/zr0tZcCXFM0lBnyZY5cwqdO+2oxnswQE
	0Qyz+loIZA/6TGwM+T70OLo+ckCXr1CwLFxgM7XHC5XML5bkwBZJIq/mA1tUmsk4yyIM
	GoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iCzMouK0rE7cqPKhaHckj5lf8KO8XwVsnifh0s6z4fo=;
	b=ryYx94aBkm5Y8d0yCNnNDfYnU/sfRss6hibaWoOVrOBcGukRysWXdB4aE3dBx/pA1m
	aDNNjwEivhonIO9H7G56v1rjdwQbFYRxicBggCMYqT08dPx0Rip4O41GjFljdamP70L9
	TpZZadCONiU90Kg9NN4GyxeIsmenYK+sdBHlE5fPrtT+VMPs6iY0yVvv0fSRerKgCF1G
	vzW8q/o3VBA/XmTwtwbK5MlWTl16JPqi781WkX7S5YIG+rnKmr/NpZRutswYTyvYxWfw
	VBa1haOloQtcCV1IwX1PFcth8CkaUWnCY24Y/XrqdsrSCPt/h2v7CWL2JhuS42wcZSDQ
	pL2w==
X-Gm-Message-State: AHYfb5g/l9jnZLIij2T61fc8s1ZTZjdc/SycCdiE9L/ewKljmh3XWuth
	2uQSgLvSLCYcuriA
X-Received: by 10.25.40.147 with SMTP id o141mr1156837lfo.262.1501896281447;
	Fri, 04 Aug 2017 18:24:41 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	y10sm1382259lja.49.2017.08.04.18.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:24:40 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:24:40 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805012440.GD4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-6-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-6-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH 5/8] hw/arm: Set
 ignore_memory_transaction_failures for most ARM boards
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLs/jBqzXxn1

On Fri, Aug 04, 2017 at 06:20:46PM +0100, Peter Maydell wrote:
> Set the MachineClass flag ignore_memory_transaction_failures
> for almost all ARM boards. This means they retain the legacy
> behaviour that accesses to unimplemented addresses will RAZ/WI
> rather than aborting, when a subsequent commit adds support
> for external aborts.
> 
> The exceptions are:
>  * virt -- we know that guests won't try to prod devices
>    that we don't describe in the device tree or ACPI tables
>  * mps2 -- this board was written to use unimplemented-device
>    for all the ranges with devices we don't yet handle
> 
> New boards should not set the flag, but instead be written
> like the mps2.

For the Xilinx boards:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/aspeed.c         | 3 +++
>  hw/arm/collie.c         | 1 +
>  hw/arm/cubieboard.c     | 1 +
>  hw/arm/digic_boards.c   | 1 +
>  hw/arm/exynos4_boards.c | 2 ++
>  hw/arm/gumstix.c        | 2 ++
>  hw/arm/highbank.c       | 2 ++
>  hw/arm/imx25_pdk.c      | 1 +
>  hw/arm/integratorcp.c   | 1 +
>  hw/arm/kzm.c            | 1 +
>  hw/arm/mainstone.c      | 1 +
>  hw/arm/musicpal.c       | 1 +
>  hw/arm/netduino2.c      | 1 +
>  hw/arm/nseries.c        | 2 ++
>  hw/arm/omap_sx1.c       | 2 ++
>  hw/arm/palm.c           | 1 +
>  hw/arm/raspi.c          | 1 +
>  hw/arm/realview.c       | 4 ++++
>  hw/arm/sabrelite.c      | 1 +
>  hw/arm/spitz.c          | 4 ++++
>  hw/arm/stellaris.c      | 2 ++
>  hw/arm/tosa.c           | 1 +
>  hw/arm/versatilepb.c    | 2 ++
>  hw/arm/vexpress.c       | 1 +
>  hw/arm/xilinx_zynq.c    | 1 +
>  hw/arm/xlnx-ep108.c     | 2 ++
>  hw/arm/z2.c             | 1 +
>  27 files changed, 43 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0c5635f..ab895ad 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -270,6 +270,7 @@ static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo palmetto_bmc_type = {
> @@ -302,6 +303,7 @@ static void ast2500_evb_class_init(ObjectClass *oc, void *data)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo ast2500_evb_type = {
> @@ -326,6 +328,7 @@ static void romulus_bmc_class_init(ObjectClass *oc, void *data)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo romulus_bmc_type = {
> diff --git a/hw/arm/collie.c b/hw/arm/collie.c
> index 2e69531..8830192 100644
> --- a/hw/arm/collie.c
> +++ b/hw/arm/collie.c
> @@ -64,6 +64,7 @@ static void collie_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Sharp SL-5500 (Collie) PDA (SA-1110)";
>      mc->init = collie_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("collie", collie_machine_init)
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index b98e1c4..32f1edd 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -86,6 +86,7 @@ static void cubieboard_machine_init(MachineClass *mc)
>      mc->init = cubieboard_init;
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 520c8e9..9f11dcd 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -155,6 +155,7 @@ static void canon_a1100_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Canon PowerShot A1100 IS";
>      mc->init = &canon_a1100_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("canon-a1100", canon_a1100_machine_init)
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 7c03ed3..f1441ec 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -189,6 +189,7 @@ static void nuri_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Samsung NURI board (Exynos4210)";
>      mc->init = nuri_init;
>      mc->max_cpus = EXYNOS4210_NCPUS;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo nuri_type = {
> @@ -204,6 +205,7 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Samsung SMDKC210 board (Exynos4210)";
>      mc->init = smdkc210_init;
>      mc->max_cpus = EXYNOS4210_NCPUS;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo smdkc210_type = {
> diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
> index d59d9ba..092ce36 100644
> --- a/hw/arm/gumstix.c
> +++ b/hw/arm/gumstix.c
> @@ -128,6 +128,7 @@ static void connex_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Gumstix Connex (PXA255)";
>      mc->init = connex_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo connex_type = {
> @@ -142,6 +143,7 @@ static void verdex_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Gumstix Verdex (PXA270)";
>      mc->init = verdex_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo verdex_type = {
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 20e60f1..0d222fe 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -410,6 +410,7 @@ static void highbank_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->max_cpus = 4;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo highbank_type = {
> @@ -427,6 +428,7 @@ static void midway_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->max_cpus = 4;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo midway_type = {
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 7d42c74..9f3ee14 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -148,6 +148,7 @@ static void imx25_pdk_machine_init(MachineClass *mc)
>  {
>      mc->desc = "ARM i.MX25 PDK board (ARM926)";
>      mc->init = imx25_pdk_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("imx25-pdk", imx25_pdk_machine_init)
> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> index d9530ed..d603af9 100644
> --- a/hw/arm/integratorcp.c
> +++ b/hw/arm/integratorcp.c
> @@ -681,6 +681,7 @@ static void integratorcp_machine_init(MachineClass *mc)
>  {
>      mc->desc = "ARM Integrator/CP (ARM926EJ-S)";
>      mc->init = integratorcp_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index 3ed6577..f9c2228 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -142,6 +142,7 @@ static void kzm_machine_init(MachineClass *mc)
>  {
>      mc->desc = "ARM KZM Emulation Baseboard (ARM1136)";
>      mc->init = kzm_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("kzm", kzm_machine_init)
> diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
> index fb268e6..637f52c 100644
> --- a/hw/arm/mainstone.c
> +++ b/hw/arm/mainstone.c
> @@ -196,6 +196,7 @@ static void mainstone2_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Mainstone II (PXA27x)";
>      mc->init = mainstone_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("mainstone", mainstone2_machine_init)
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 7e8ab31..fcf6224 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1718,6 +1718,7 @@ static void musicpal_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Marvell 88w8618 / MusicPal (ARM926EJ-S)";
>      mc->init = musicpal_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("musicpal", musicpal_machine_init)
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 3cfe332..9d34d4c 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -45,6 +45,7 @@ static void netduino2_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Netduino 2 Machine";
>      mc->init = netduino2_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("netduino2", netduino2_machine_init)
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 503a3b6..a32ac82 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1425,6 +1425,7 @@ static void n800_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Nokia N800 tablet aka. RX-34 (OMAP2420)";
>      mc->init = n800_init;
>      mc->default_boot_order = "";
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo n800_type = {
> @@ -1440,6 +1441,7 @@ static void n810_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Nokia N810 tablet aka. RX-44 (OMAP2420)";
>      mc->init = n810_init;
>      mc->default_boot_order = "";
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo n810_type = {
> diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
> index 9809106..4535617 100644
> --- a/hw/arm/omap_sx1.c
> +++ b/hw/arm/omap_sx1.c
> @@ -223,6 +223,7 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Siemens SX1 (OMAP310) V2";
>      mc->init = sx1_init_v2;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo sx1_machine_v2_type = {
> @@ -237,6 +238,7 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Siemens SX1 (OMAP310) V1";
>      mc->init = sx1_init_v1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo sx1_machine_v1_type = {
> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> index 64cf8ca..bf070a2 100644
> --- a/hw/arm/palm.c
> +++ b/hw/arm/palm.c
> @@ -274,6 +274,7 @@ static void palmte_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Palm Tungsten|E aka. Cheetah PDA (OMAP310)";
>      mc->init = palmte_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("cheetah", palmte_machine_init)
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 32cdc98..5941c9f 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -168,5 +168,6 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_cdrom = 1;
>      mc->max_cpus = BCM2836_NCPUS;
>      mc->default_ram_size = 1024 * 1024 * 1024;
> +    mc->ignore_memory_transaction_failures = true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 76ff557..f1b261f 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -396,6 +396,7 @@ static void realview_eb_class_init(ObjectClass *oc, void *data)
>      mc->desc = "ARM RealView Emulation Baseboard (ARM926EJ-S)";
>      mc->init = realview_eb_init;
>      mc->block_default_type = IF_SCSI;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo realview_eb_type = {
> @@ -412,6 +413,7 @@ static void realview_eb_mpcore_class_init(ObjectClass *oc, void *data)
>      mc->init = realview_eb_mpcore_init;
>      mc->block_default_type = IF_SCSI;
>      mc->max_cpus = 4;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo realview_eb_mpcore_type = {
> @@ -426,6 +428,7 @@ static void realview_pb_a8_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "ARM RealView Platform Baseboard for Cortex-A8";
>      mc->init = realview_pb_a8_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo realview_pb_a8_type = {
> @@ -441,6 +444,7 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
>      mc->desc = "ARM RealView Platform Baseboard Explore for Cortex-A9";
>      mc->init = realview_pbx_a9_init;
>      mc->max_cpus = 4;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo realview_pbx_a9_type = {
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index 4e7ac8c..ee140e5 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -122,6 +122,7 @@ static void sabrelite_machine_init(MachineClass *mc)
>      mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex A9)";
>      mc->init = sabrelite_init;
>      mc->max_cpus = FSL_IMX6_NUM_CPUS;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("sabrelite", sabrelite_machine_init)
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 7f588ce..6406421 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -983,6 +983,7 @@ static void akitapda_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Sharp SL-C1000 (Akita) PDA (PXA270)";
>      mc->init = akita_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo akitapda_type = {
> @@ -998,6 +999,7 @@ static void spitzpda_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Sharp SL-C3000 (Spitz) PDA (PXA270)";
>      mc->init = spitz_init;
>      mc->block_default_type = IF_IDE;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo spitzpda_type = {
> @@ -1013,6 +1015,7 @@ static void borzoipda_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Sharp SL-C3100 (Borzoi) PDA (PXA270)";
>      mc->init = borzoi_init;
>      mc->block_default_type = IF_IDE;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo borzoipda_type = {
> @@ -1028,6 +1031,7 @@ static void terrierpda_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Sharp SL-C3200 (Terrier) PDA (PXA270)";
>      mc->init = terrier_init;
>      mc->block_default_type = IF_IDE;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo terrierpda_type = {
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 408c1a1..b3aad23 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1453,6 +1453,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Stellaris LM3S811EVB";
>      mc->init = lm3s811evb_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo lm3s811evb_type = {
> @@ -1467,6 +1468,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Stellaris LM3S6965EVB";
>      mc->init = lm3s6965evb_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo lm3s6965evb_type = {
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 8b757ff..1134cf7 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -263,6 +263,7 @@ static void tosapda_machine_init(MachineClass *mc)
>      mc->desc = "Sharp SL-6000 (Tosa) PDA (PXA255)";
>      mc->init = tosa_init;
>      mc->block_default_type = IF_IDE;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("tosa", tosapda_machine_init)
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index b0e9f5b..76664e4 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -403,6 +403,7 @@ static void versatilepb_class_init(ObjectClass *oc, void *data)
>      mc->desc = "ARM Versatile/PB (ARM926EJ-S)";
>      mc->init = vpb_init;
>      mc->block_default_type = IF_SCSI;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo versatilepb_type = {
> @@ -418,6 +419,7 @@ static void versatileab_class_init(ObjectClass *oc, void *data)
>      mc->desc = "ARM Versatile/AB (ARM926EJ-S)";
>      mc->init = vab_init;
>      mc->block_default_type = IF_SCSI;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static const TypeInfo versatileab_type = {
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 528c65d..9be1833 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -750,6 +750,7 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
>      mc->desc = "ARM Versatile Express";
>      mc->init = vexpress_common_init;
>      mc->max_cpus = 4;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  static void vexpress_a9_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 6b11a75..9883215 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -324,6 +324,7 @@ static void zynq_machine_init(MachineClass *mc)
>      mc->init = zynq_init;
>      mc->max_cpus = 1;
>      mc->no_sdcard = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> index 860780a..c339cd4 100644
> --- a/hw/arm/xlnx-ep108.c
> +++ b/hw/arm/xlnx-ep108.c
> @@ -122,6 +122,7 @@ static void xlnx_ep108_machine_init(MachineClass *mc)
>      mc->init = xlnx_ep108_init;
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("xlnx-ep108", xlnx_ep108_machine_init)
> @@ -132,6 +133,7 @@ static void xlnx_zcu102_machine_init(MachineClass *mc)
>      mc->init = xlnx_ep108_init;
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("xlnx-zcu102", xlnx_zcu102_machine_init)
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 1607cbd..417bc1a 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -370,6 +370,7 @@ static void z2_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Zipit Z2 (PXA27x)";
>      mc->init = z2_init;
> +    mc->ignore_memory_transaction_failures = true;
>  }
>  
>  DEFINE_MACHINE("z2", z2_machine_init)
> -- 
> 2.7.4
> 
> 
