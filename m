Received: by 10.25.27.66 with SMTP id b63csp1873728lfb;
        Tue, 7 Jun 2016 00:58:19 -0700 (PDT)
X-Received: by 10.55.27.202 with SMTP id m71mr20447821qkh.151.1465286299286;
        Tue, 07 Jun 2016 00:58:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p94si13363518qkp.93.2016.06.07.00.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 00:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bABty-0007Ry-Lp
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 03:58:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bABre-0005tI-L1
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 03:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bABra-0006ZY-D0
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 03:55:53 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:8371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bABrZ-0006Z0-On; Tue, 07 Jun 2016 03:55:50 -0400
Received: from 172.24.1.60 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DIH90818; Tue, 07 Jun 2016 15:52:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	15:51:52 +0800
Message-ID: <57567D17.9070505@huawei.com>
Date: Tue, 7 Jun 2016 15:51:51 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-7-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.57567D26.00B1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1c1b05bcb103d39f6cac94a15d808ceb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-devel] [PATCH v2 06/22] hw/intc/arm_gicv3: Add state
 information
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4Tn8h5tYVj8



On 2016/5/26 22:55, Peter Maydell wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
> 
> Add state information to GICv3 object structure and implement
> arm_gicv3_common_reset().
> 
> This commit includes accessor functions for the fields which are
> stored as bitmaps in uint32_t arrays.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> [PMM: significantly overhauled:
>  * Add missing qom/cpu.h include
>  * Remove legacy-only state fields (we can add them later if/when we add
>    legacy emulation)
>  * Use arrays of uint32_t to store the various distributor bitmaps,
>    and provide accessor functions for the various set/test/etc operations
>  * Add various missing register offset #defines
>  * Accessor macros which combine distributor and redistributor behaviour
>    removed
>  * Fields in state structures renamed to match architectural register names
>  * Corrected the reset value for GICR_IENABLER0 since we don't support
>    legacy mode
>  * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel in
>    non-secure" so that we can fake up the firmware-mandated reconfiguration
>    only when we need it
> ]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
[...]
> +#define GIC_BIT_MASK(nr) (1U << ((nr) % 32))
> +#define GIC_BIT_WORD(nr) ((nr) / 32)
> +#define GIC_BIT(nr) (1U << (nr))
It seems the GIC_BIT(nr) is not used.

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

-- 
Shannon

