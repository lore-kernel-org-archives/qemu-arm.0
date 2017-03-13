Received: by 10.25.77.4 with SMTP id a4csp1286789lfb;
        Mon, 13 Mar 2017 11:39:54 -0700 (PDT)
X-Received: by 10.200.48.209 with SMTP id w17mr37133529qta.179.1489430394742;
        Mon, 13 Mar 2017 11:39:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y184si1076986qkc.101.2017.03.13.11.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnUsq-0007wf-1L
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:39:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cnUsm-0007vu-2L
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:39:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1cnUsi-0001D6-6l
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:39:48 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1cnUsi-0001C0-0c; Mon, 13 Mar 2017 14:39:44 -0400
Received: by mail-wm0-f65.google.com with SMTP id v190so11330251wme.3;
	Mon, 13 Mar 2017 11:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WH7FdQW61ixSRIXEAdqbH6A4ywgtX/dNvyHUS4vI99s=;
	b=iUoW7K9ud7r7qeUWzpzzQdftyFqoaIa+JiQVUgVCSW9ZMrXGQObA3s9SZ7RWzZI1fE
	nbWivl+1lWILF+EdHeLHJiny9ltT88sSxqT7ubPKFdsBnYboYCfnMlPUKA5dgwmFTtQQ
	+SuIlo2YBdVhF4EAZzSEVix98iQlQ1Zf8SZoa0cM/6g86lB3JFhGL9S6VAgW52kIW9Bw
	1GwDUbeFN7eOfve5SOZOtsZAiMydZgleIN8+75kKt4cL/L/OdOXDj4lim5aKTktaEJoo
	7/Fyr/C+or/6iejym7YFXLGU/ckNiwl++1GzKI5pLtxTGX2Pkpq1MF1H3rRSNzgRI5p8
	5Qxg==
X-Gm-Message-State: AFeK/H2Av4oWdb4kFd/5S5wdNjxmEmR5S8YpRC1cOZ9I9iG/OrV+zqlR1/sNpXMvzfVoUg==
X-Received: by 10.28.129.83 with SMTP id c80mr11038721wmd.82.1489430381344;
	Mon, 13 Mar 2017 11:39:41 -0700 (PDT)
Received: from kozik-lap (bzq-79-180-56-222.red.bezeqint.net. [79.180.56.222])
	by smtp.googlemail.com with ESMTPSA id
	d42sm26072476wrd.37.2017.03.13.11.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 11:39:40 -0700 (PDT)
Date: Mon, 13 Mar 2017 20:39:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170313183937.ony4fukk6iny3gop@kozik-lap>
References: <20170313183557.23195-1-krzk@kernel.org>
	<20170313183557.23195-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170313183557.23195-2-krzk@kernel.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/arm/exynos: Convert fprintf to
 error_report()
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
Cc: eblake@redhat.com,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wpiZiGefWZ7c

On Mon, Mar 13, 2017 at 08:35:55PM +0200, Krzysztof Kozlowski wrote:
> error_report() is preferred over fprintf() for logging errors.  Also
> remove square brackets [] and additional new line characters in printed
> messages.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/arm/exynos4_boards.c   |  6 +++---
>  hw/timer/exynos4210_mct.c |  5 +++--
>  hw/timer/exynos4210_pwm.c | 11 +++++------
>  hw/timer/exynos4210_rtc.c | 16 +++++++---------
>  4 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 0efa19405409..0a352815b86d 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -22,6 +22,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "sysemu/sysemu.h"
> @@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>  
>      if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
> -        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring smp_cpus"
> -                " value.\n",
> -                mc->name, EXYNOS4210_NCPUS);
> +        error_report("%s board supports only %d CPU cores, ignoring smp_cpus value",
> +                     mc->name, EXYNOS4210_NCPUS);
>      }
>  
>      exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 6069116942a4..48041ab036a6 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -53,6 +53,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu/main-loop.h"
> @@ -1364,8 +1365,8 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>      case L0_TCNTO: case L1_TCNTO:
>      case L0_ICNTO: case L1_ICNTO:
>      case L0_FRCNTO: case L1_FRCNTO:
> -        fprintf(stderr, "\n[exynos4210.mct: write to RO register "
> -                TARGET_FMT_plx "]\n\n", offset);
> +        error_report("exynos4210.mct: write to RO register " TARGET_FMT_plx,
> +                     offset);

Ahh, I missed Philippe's suggestions here and other places. Sorry for
the mess, I'll fix it and resend v3.

Best regards,
Krzysztof

