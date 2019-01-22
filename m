Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7087742wrt;
        Tue, 22 Jan 2019 03:04:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7ORA3fz0L5r0RokkwHCTnRTumnjina/+FG0nRZt/VyCNbarwKt3+I/S4N0n0hAY7kk0f7N
X-Received: by 2002:a7b:c04e:: with SMTP id u14mr3282959wmc.113.1548155060847;
        Tue, 22 Jan 2019 03:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548155060; cv=none;
        d=google.com; s=arc-20160816;
        b=exqruhEcRN85UcBwJ9T+ZEeg4sdz9xh5RE0pe/Xg8H/ev/P9cc+pxSyE4cKNhKamWp
         HUFrCx+Ds4EO24nFs/mAilj1KRbNWkZBFnigfZ5HKhZBKL+BG1YNP0ZFRSpppSUuxnA2
         C7E/wRlSdxPvqMuveQ/De6vMDPzTyDZELRbhY05+OcPYKuA/V3Kn8U4WcgttmHtTp1VK
         dIjaU57Yn6VZvaeb4+bVp0tQ10/B1am8Su2MzXx60MZZbWeaWpJ913WKIIL8FX6tjJM5
         LhB52cLynxfohuNeUAyXaGAlYIu4jwYzWihJQIwie0hpSUuFtlB+U7/ETenITRikfxxW
         TPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=G1+lEQxXLTIIyjyHt4ZuGyDLdnOHz3DkyL5EVwa88Lo=;
        b=Q/JCK2e5jvGDriXT2bHnB3dtuFuU4+dpUeP748D1DoUyQV+J++5LcdbpWkBBL2agag
         ZanBpb/Al0NKLBZakIFrHAcfYKVpOhAl1U/M61KQXfnetoAQwt4pFo12DVvx4OOKVLXa
         KBgg209+2hUFd9tfWpiW7faFQousjnuC/I0YBmCAUTCFLAUFfEudVGjXbOfAPFDpqxI3
         BHH8SodLFKezg/HzZBlKgVnw/m9f0c5+8fNc01Yx1NzVWUSX0pV/1NDLmp5VdnkcX1P2
         QLZuhHkZjPbn1GFyDBeKL6SFo+XigMoKjnKpcRpHQtDnnxBa/IKIDVjpIHrxFlt49PzN
         5++Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k184si34493174wmk.43.2019.01.22.03.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 03:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gltqt-0006Hr-Vn
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 06:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltqV-0006EG-0U
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 06:03:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gltqT-0000Ch-V2
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 06:03:54 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gltqT-0000Bx-PG
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 06:03:53 -0500
Received: by mail-wr1-f66.google.com with SMTP id u4so26818617wrp.3
	for <qemu-devel@nongnu.org>; Tue, 22 Jan 2019 03:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G1+lEQxXLTIIyjyHt4ZuGyDLdnOHz3DkyL5EVwa88Lo=;
	b=qkgTcwguq9VCpsJ7aXYnTsuv8XzVj1lNAWk/llhG4J9HlCzV+rlkYmywpeYgBAXCQb
	muim4PC5mJuTbzqXec3+SNi6E/hzHr7JZy2BNTwd5OA8aSoegUaq913+EpMDkDLmkAK1
	u0b1TNp2Xt8wA5Q/byGNtj8jF4zmDSjDOrntCFXHWO6HyFhEcqX8Ze8CP60m3/ClH/3x
	GpDdYi+Eo7S8zoCN7c1LY0quDs7FZWNCe6MptKDo+ZZjwqcMY3s189TeFFPkKk9hVRc/
	V0h/lJhMLnWXOEIZSHTKgHsNOLy3JXLxVKtQE7HIzDniGWdgNhnm3DHXZlQaKy5ZZY3Q
	mnfw==
X-Gm-Message-State: AJcUukeLfUS2mph5itNWvbzYJt20x2gchmKN/zYqTxt1anMLq7QF/5+q
	5AF/IMksjAMZo8o3cSPZhP3rJQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr33233827wro.103.1548155032830; 
	Tue, 22 Jan 2019 03:03:52 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	z206sm60923627wmc.18.2019.01.22.03.03.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 03:03:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <74d0fff0-9d75-96a8-1d71-e495b322d7ec@redhat.com>
Date: Tue, 22 Jan 2019 12:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 07/23] hw/arm/iotkit: Rename files to
 hw/arm/armsse.[ch]
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ak7nUp/3Xv9m

On 1/21/19 7:51 PM, Peter Maydell wrote:
> Rename the files that used to be iotkit.[ch] to
> armsse.[ch] to reflect the fact they new cover

s/new/now/?

> multiple Arm subsystems for embedded.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/Makefile.objs                  | 2 +-
>  include/hw/arm/{iotkit.h => armsse.h} | 4 ++--
>  hw/arm/{iotkit.c => armsse.c}         | 2 +-
>  hw/arm/mps2-tz.c                      | 2 +-
>  MAINTAINERS                           | 4 ++--
>  default-configs/arm-softmmu.mak       | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>  rename include/hw/arm/{iotkit.h => armsse.h} (99%)
>  rename hw/arm/{iotkit.c => armsse.c} (99%)
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 50c7b4a927d..22b7f0ed0ba 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -34,7 +34,7 @@ obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
>  obj-$(CONFIG_MPS2) += mps2-tz.o
>  obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
> -obj-$(CONFIG_IOTKIT) += iotkit.o
> +obj-$(CONFIG_ARMSSE) += armsse.o
>  obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>  obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
>  obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/armsse.h
> similarity index 99%
> rename from include/hw/arm/iotkit.h
> rename to include/hw/arm/armsse.h
> index 521d1f73757..ff512054988 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/armsse.h
> @@ -58,8 +58,8 @@
>   *  + named GPIO outputs mscexp_ns[0..15]
>   */
>  
> -#ifndef IOTKIT_H
> -#define IOTKIT_H
> +#ifndef ARMSSE_H
> +#define ARMSSE_H
>  
>  #include "hw/sysbus.h"
>  #include "hw/arm/armv7m.h"
> diff --git a/hw/arm/iotkit.c b/hw/arm/armsse.c
> similarity index 99%
> rename from hw/arm/iotkit.c
> rename to hw/arm/armsse.c
> index 7ff14fd5aef..8554be14128 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/armsse.c
> @@ -15,7 +15,7 @@
>  #include "trace.h"
>  #include "hw/sysbus.h"
>  #include "hw/registerfields.h"
> -#include "hw/arm/iotkit.h"
> +#include "hw/arm/armsse.h"
>  #include "hw/arm/arm.h"
>  
>  struct ARMSSEInfo {
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 5824335b4fb..3859f17d98b 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -46,7 +46,7 @@
>  #include "hw/misc/mps2-fpgaio.h"
>  #include "hw/misc/tz-mpc.h"
>  #include "hw/misc/tz-msc.h"
> -#include "hw/arm/iotkit.h"
> +#include "hw/arm/armsse.h"
>  #include "hw/dma/pl080.h"
>  #include "hw/ssi/pl022.h"
>  #include "hw/devices.h"
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af339b86db7..52222117d77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -625,8 +625,8 @@ F: hw/arm/mps2.c
>  F: hw/arm/mps2-tz.c
>  F: hw/misc/mps2-*.c
>  F: include/hw/misc/mps2-*.h
> -F: hw/arm/iotkit.c
> -F: include/hw/arm/iotkit.h
> +F: hw/arm/armsse.c
> +F: include/hw/arm/armsse.h
>  F: hw/misc/iotkit-secctl.c
>  F: include/hw/misc/iotkit-secctl.h
>  F: hw/misc/iotkit-sysctl.c
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491aacd..3f200157879 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -114,7 +114,7 @@ CONFIG_MPS2_SCC=y
>  CONFIG_TZ_MPC=y
>  CONFIG_TZ_MSC=y
>  CONFIG_TZ_PPC=y
> -CONFIG_IOTKIT=y
> +CONFIG_ARMSSE=y
>  CONFIG_IOTKIT_SECCTL=y
>  CONFIG_IOTKIT_SYSCTL=y
>  CONFIG_IOTKIT_SYSINFO=y
> 
