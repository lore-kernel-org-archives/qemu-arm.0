Received: by 10.25.85.209 with SMTP id j200csp1058533lfb;
        Mon, 13 Jun 2016 00:22:42 -0700 (PDT)
X-Received: by 10.237.37.8 with SMTP id v8mr13046726qtc.28.1465802562850;
        Mon, 13 Jun 2016 00:22:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si14373771qka.166.2016.06.13.00.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 00:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCMCo-0001bb-8c
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 03:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMCB-00011y-OI
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMCA-0005uq-K5
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:22:03 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:34729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCMC4-0005u8-F5; Mon, 13 Jun 2016 03:21:56 -0400
Received: from 172.24.1.47 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDE01586; Mon, 13 Jun 2016 15:20:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 15:19:55 +0800
Message-ID: <575E5E9A.1030000@huawei.com>
Date: Mon, 13 Jun 2016 15:19:54 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-14-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.575E5EA9.0147, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6b232d31e925c6b4d97bece8d122239b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 13/22] hw/intc/arm_gicv3:
 Wire up distributor and redistributor MMIO regions
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cZbKEAjMeDxk



On 2016/5/26 22:55, Peter Maydell wrote:
> Wire up the MMIO functions exposed by the distributor and the
> redistributor into MMIO regions exposed by the GICv3 device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/intc/arm_gicv3.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 7c4bee6..e8f6766 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -324,6 +324,19 @@ static void arm_gicv3_post_load(GICv3State *s)
>      gicv3_cache_all_target_cpustates(s);
>  }
>  
> +static const MemoryRegionOps gic_ops[] = {
> +    {
> +        .read_with_attrs = gicv3_dist_read,
> +        .write_with_attrs = gicv3_dist_write,
> +        .endianness = DEVICE_NATIVE_ENDIAN,
> +    },
> +    {
> +        .read_with_attrs = gicv3_redist_read,
> +        .write_with_attrs = gicv3_redist_write,
> +        .endianness = DEVICE_NATIVE_ENDIAN,
> +    }
> +};
> +
>  static void arm_gic_realize(DeviceState *dev, Error **errp)
>  {
>      /* Device instance realize function for the GIC sysbus device */
> @@ -337,7 +350,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, NULL);
> +    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
>  }
>  
>  static void arm_gicv3_class_init(ObjectClass *klass, void *data)
> 

-- 
Shannon

