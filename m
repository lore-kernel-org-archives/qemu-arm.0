Received: by 10.25.27.66 with SMTP id b63csp1873415lfb;
        Tue, 7 Jun 2016 00:57:22 -0700 (PDT)
X-Received: by 10.200.43.195 with SMTP id n3mr5733299qtn.72.1465286241588;
        Tue, 07 Jun 2016 00:57:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 86si13358169qkq.217.2016.06.07.00.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 00:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bABt3-0006gP-0n
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 03:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bABrY-0005pj-W2
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 03:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bABrV-0006Ys-Oh
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 03:55:49 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:4708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bABrV-0006Yh-2o; Tue, 07 Jun 2016 03:55:45 -0400
Received: from 172.24.1.137 (EHLO SZXEML423-HUB.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCV13651; Tue, 07 Jun 2016 15:55:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML423-HUB.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	15:55:18 +0800
Message-ID: <57567DE5.2030001@huawei.com>
Date: Tue, 7 Jun 2016 15:55:17 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-6-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090201.57567DF5.008A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 530c63b31ac402038ed3b7271b065d60
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-devel] [PATCH v2 05/22] target-arm: Add mp-affinity
 property for ARM CPU class
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
X-TUID: k5LfzK78dIv6



On 2016/5/26 22:55, Peter Maydell wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
> 
> This allows to override default affinity IDs on a per-machine basis, and
> possibility to retrieve IDs will be used by vGICv3 live migration code.
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  target-arm/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 0eaa907..ce8b8f4 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1415,6 +1415,7 @@ static Property arm_cpu_properties[] = {
>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
> +    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> 

-- 
Shannon

