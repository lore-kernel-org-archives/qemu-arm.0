Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1993194wrh;
        Sun, 5 May 2019 21:10:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDX3RJyAI4ZS9/oOm0YertDHXBT13RGlRhUT03c8jNdTFtchDBQZvJpIBaFnZUekQQfbc1
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr14480155wmh.86.1557115836626;
        Sun, 05 May 2019 21:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557115836; cv=none;
        d=google.com; s=arc-20160816;
        b=pr7S1a0f5qONJntoMEbyxJ/dLwh2GHGEEDd1c8AMd3n/2SPUTb7O2P4MVqrMKqcHvc
         eh86D7frxGGZQ3swnI4ao0wi95Ldx+ovUmrpq36NcozPcgMO8tGVhTw1CyuOQDH4zlLD
         yFJ9jOrCNwAOWHGm0HmDikOhCXWv+BBVSFPLZDk741AmT9ahoW28tluuaatCBcj719qM
         B6vY7lXpKZzbWZWZ7Et81R3AYlpSoCUqX6fAxv81k9JX2uDuJmWHUXDdp1TQR1srUzhW
         R2/1kCnPq10xCLPkuLWa2nmW3e8ylxgplfQeCiJtGJ/dwbqYvc2NnboIpKrFiZKOX/V9
         S8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=oIO4mohIe+CaThbtIrjWL0JLj/0wFvw8o3AmaiUwPnU=;
        b=r2WIS/v/sZrrntulgbPGYxALrgnMQL2vLrHAvM3m1dscVx/NRvelnKDCWtApLkpCNx
         lOyy5jwpmEBCXeXsdVMgepJQJY/IP1qp95zANZPpAf/TgM077BsItHS2sl++hbdgLFJ0
         HQUo3LuhEKYAQseGCbfzzeiii8Kwtv35TgpPB/13vjJb5nyQoo4wldD0J6k6vQKV83Of
         kRxc3q+SUnSVLocP/syqbq25e0Eu5LHNBK3NbSGd0QnNCsdKnjsoLYg6jjMR38YtJDSh
         5b6G7vyUL5BAuPPX3vk/dreLanHJmNVYnzypE5c0LvPgZv160oBdHjhdyFGS/P3AnRDx
         Q2ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si4254821wrs.403.2019.05.05.21.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 21:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNUxX-0001RF-Gv
	for alex.bennee@linaro.org; Mon, 06 May 2019 00:10:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNUxK-0001RA-Mb
	for qemu-arm@nongnu.org; Mon, 06 May 2019 00:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNUxI-0007o8-VM
	for qemu-arm@nongnu.org; Mon, 06 May 2019 00:10:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNUxG-0007eA-V9; Mon, 06 May 2019 00:10:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B92AC3082E55;
	Mon,  6 May 2019 04:10:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8114A5C8A4;
	Mon,  6 May 2019 04:10:08 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190505180719.31913-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <02ce0766-4464-2c71-6085-7e164d4405af@redhat.com>
Date: Mon, 6 May 2019 06:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505180719.31913-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 06 May 2019 04:10:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Compile devices not
 target-dependent as common objects
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GQ6KmHbNIl+D

On 05/05/2019 20.07, Philippe Mathieu-Daud=C3=A9 wrote:
> All these devices do not contain any target-specific code. While
> most of them are arch-specific, they are shared between different
> targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
> multiple endianess, ...).
> Put them into common-obj-y to compile them once for all targets.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/timer/Makefile.objs | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 0e9a4530f84..a92e22938cb 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysct=
l.o
>  common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
>  common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
> =20
> -obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
> -obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
> -obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
> -obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
> -obj-$(CONFIG_SH4) +=3D sh_timer.o
> -obj-$(CONFIG_DIGIC) +=3D digic-timer.o
> -obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
> +common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
> +common-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
> +common-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
> +common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
> +common-obj-$(CONFIG_SH4) +=3D sh_timer.o
> +common-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
> +common-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
> =20
>  obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> =20
> -obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> +common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> =20
>  common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o

I've checked

 grep -r TARGET hw/timer/

and this looks good to me, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>

By the way, I was surprised to see TARGET_FMT_plx there, since I first
thought that this would be a target-specific define, too. But apparently
it is not. Very confusing. I'd suggest to rename that to HWADDR_FMT_plx
instead, what do you think?

 Thomas
