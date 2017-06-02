Received: by 10.25.0.23 with SMTP id 23csp72749lfa;
        Fri, 2 Jun 2017 11:39:10 -0700 (PDT)
X-Received: by 10.237.42.228 with SMTP id t91mr9503971qtd.197.1496428749897;
        Fri, 02 Jun 2017 11:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496428749; cv=none;
        d=google.com; s=arc-20160816;
        b=bkj3txoZDLS7dMV4jtgxoqxFyf6a8B1qep2HMr/X0run+2nsZt7IycFkAK0Uguv3vv
         zpNFGDrQB8jcfQGj5iV/fAqCmcy7rff+7++CjTQCyKTuysNEvBTNz/WsB7jYm4FapUMy
         zGFtT42mrKUqN9NSszIzIcWhuHLq1tSKBUbkc4XAYjvQt7fpxIErYwGbcwH2gZHyXahU
         IgH/+IoxDCVkGqsKgXO8QVB3caRIoZIYhvoH3QoZBL5ThcVU0lWo7/V26U7NqjiNmR01
         +mMV8CvWmiRVIEpx2vUtQcPOdzbzuGaHt2LX6Typ9VMmpat6Yi5uYUOoggZ/G4bsxxl5
         stuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=xK2lf2hkqTepuQzpdG9v1L3FiSIh2MXoPYmdjQsZ1jc=;
        b=DZ62WTf7i8r0+xOrXh8HoAndkOsuG7/FpzRswQIwCvYMZxO7LUObJa9uWeONyrBgup
         OQe8XW98uKh3l7ah344O7KkOI6N8/8hV0/pakkRjarw9m2f3IUGJ48+xwLuSPC7LrAb7
         LTL+2IlZiyMNXn9ZRHFvNjWEzt9G+XQYvQLVCX0o/XOlL3+9bbkSdW/O6Wb8i9qDHAij
         o7FdPX0NWls2SzeqmrvZSc6HVKJypoUuwn+4cydP1R+fBtgHBUvU1x8o379TNDsT4agI
         0YDqGIa3t5VKb6koZtX+kBTwYWaPSClFXlL7LISBibpyu7sTuNK8Ku9tVbvuyeG2uyVW
         oWBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n41si5275307qtb.246.2017.06.02.11.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 11:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGrTX-0005WQ-2X
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 14:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrTR-0005Ui-Ly
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 14:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrTQ-0006mt-Ln
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 14:39:01 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrTO-0006he-77; Fri, 02 Jun 2017 14:38:58 -0400
Received: by mail-oi0-x241.google.com with SMTP id h4so13053550oib.0;
	Fri, 02 Jun 2017 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xK2lf2hkqTepuQzpdG9v1L3FiSIh2MXoPYmdjQsZ1jc=;
	b=mUvITLAq70nF/PcHmjXXAmjAY1txxRjpboH4+yvTMbIGfFptNCjp+Wx60OhPfq9yZg
	mXKjJjUTSdY8DvOlzMTHfW/xMq0s6ITr+MM8OrTKpCu+rmYcrH8lUXBxusYyYixBFkpv
	wyTe9Uh0maoixAYtXEbp8osvBmdq8wb2zBSJ01nAs/dNMtYYJvJHkItMet+V5Eh23dFv
	Y4csTOHrCKFU/3b7fD/HII7isM1i6g4W1kpnO8upPqL8Jmo+iOssaWw7N27ricvLJH3K
	AyxsVf+budaVbTTNxV2XYT/gG6TQvrOsbUb/sYB+D3M97xJI/4ojdFZTHxA5+fr04Rfl
	xZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xK2lf2hkqTepuQzpdG9v1L3FiSIh2MXoPYmdjQsZ1jc=;
	b=Pw4fyRRJ/ee+/BClK4NrzjFv2eUH8hMg6uevY+l89JVyzsyq3gWZzEnV3ytKhiBTQ2
	6hb1/5e94ju5LDb/Dd2eJBLYInha8tLftds+InsyxGNsdPm9NitFsJ4BrrOONjySWnsY
	un1JsM3nW6w4r/Qe9+dPJh+k3EpiPXgiPFs+HGcgPDgnPNcUlSBTxqIbBtm0NaX1iKHw
	mG/rlY2J9SgaDTipVQkOUGBDaplWJ+52KcMYgX84jdrESaCULP0VbY6Tii6/aBJ2tWW3
	fYIK3qAmqUpCrhZInuMV5Nb6oO/giD4YKKLISg/CqQ7g/1kx+6QTTOv4exAHa30Zf314
	QQPg==
X-Gm-Message-State: AODbwcAl4XqTBDZjD+XZOXcrHNpJ22F/amcGA7zI2klNVFyP+qbVyyKy
	536yWvlDCAHAHw==
X-Received: by 10.157.60.119 with SMTP id j52mr5532364ote.31.1496428737268;
	Fri, 02 Jun 2017 11:38:57 -0700 (PDT)
Received: from ?IPv6:2602:30a:2c37:1a00::43? ([2602:30a:2c37:1a00::43])
	by smtp.gmail.com with ESMTPSA id
	l197sm362806oib.11.2017.06.02.11.38.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 11:38:56 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
	<20170602163618.6369-9-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81d64387-003a-2b21-9229-37b3c0feb676@amsat.org>
Date: Fri, 2 Jun 2017 15:38:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170602163618.6369-9-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 9/9] hw/misc/exynos4210_pmu: Add support
 for system poweroff
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
Cc: Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /SioENDNPD6i

On 06/02/2017 01:36 PM, Krzysztof Kozlowski wrote:
> On all Exynos-based boards, the system powers down itself by driving
> PS_HOLD signal low - eight bit in PS_HOLD_CONTROL register of PMU.
> Handle writing to respective PMU register to fix power off failure:
>
>     reboot: Power down
>     Unable to poweroff system
>     shutdown: 31 output lines suppressed due to ratelimiting
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>
>     CPU: 0 PID: 1 Comm: shutdown Not tainted 4.11.0-rc8 #846
>     Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>     [<c031050c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
>     [<c030ba6c>] (show_stack) from [<c05b2800>] (dump_stack+0x88/0x9c)
>     [<c05b2800>] (dump_stack) from [<c03d3140>] (panic+0xdc/0x268)
>     [<c03d3140>] (panic) from [<c0343614>] (do_exit+0xa90/0xab4)
>     [<c0343614>] (do_exit) from [<c035f2dc>] (SyS_reboot+0x164/0x1d0)
>     [<c035f2dc>] (SyS_reboot) from [<c0307c80>] (ret_fast_syscall+0x0/0x3c)
>
> Additionally the initial value of PS_HOLD has to be changed because
> recent Linux kernel (v4.12-rc1) uses regmap cache for this access.
> When the register is kept at reset value, the kernel will not issue a
> write to it.  Usually the bootloader sets the eight bit of PS_HOLD high
> so mimic its existence here.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/misc/exynos4210_pmu.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
> index 63a8ccd35559..0d7b64c5b3a3 100644
> --- a/hw/misc/exynos4210_pmu.c
> +++ b/hw/misc/exynos4210_pmu.c
> @@ -26,6 +26,7 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> +#include "sysemu/sysemu.h"
>
>  #ifndef DEBUG_PMU
>  #define DEBUG_PMU           0
> @@ -350,7 +351,11 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
>      {"PAD_RETENTION_MMCB_OPTION", PAD_RETENTION_MMCB_OPTION, 0x00000000},
>      {"PAD_RETENTION_EBIA_OPTION", PAD_RETENTION_EBIA_OPTION, 0x00000000},
>      {"PAD_RETENTION_EBIB_OPTION", PAD_RETENTION_EBIB_OPTION, 0x00000000},
> -    {"PS_HOLD_CONTROL", PS_HOLD_CONTROL, 0x00005200},
> +    /*
> +     * PS_HOLD_CONTROL: reset value and manually toggle high the DATA bit.
> +     * DATA bit high, set usually by bootloader, keeps system on.
> +     */
> +    {"PS_HOLD_CONTROL", PS_HOLD_CONTROL, 0x00005200 | BIT(8)},
>      {"XUSBXTI_CONFIGURATION", XUSBXTI_CONFIGURATION, 0x00000001},
>      {"XUSBXTI_STATUS", XUSBXTI_STATUS, 0x00000001},
>      {"XUSBXTI_DURATION", XUSBXTI_DURATION, 0xFFF00000},
> @@ -397,6 +402,12 @@ typedef struct Exynos4210PmuState {
>      uint32_t reg[PMU_NUM_OF_REGISTERS];
>  } Exynos4210PmuState;
>
> +static void exynos4210_pmu_poweroff(void)
> +{
> +    PRINT_DEBUG("QEMU PMU: PS_HOLD bit down, powering off\n");
> +    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +}
> +
>  static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
>                                      unsigned size)
>  {
> @@ -428,6 +439,13 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
>              PRINT_DEBUG_EXTEND("%s <0x%04x> <- 0x%04x\n", reg_p->name,
>                      (uint32_t)offset, (uint32_t)val);
>              s->reg[i] = val;
> +            if ((offset == PS_HOLD_CONTROL) && ((val & BIT(8)) == 0)) {
> +                /*
> +                 * We are interested only in setting data bit
> +                 * of PS_HOLD_CONTROL register to indicate power off request.
> +                 */
> +                exynos4210_pmu_poweroff();
> +            }
>              return;
>          }
>          reg_p++;
>
