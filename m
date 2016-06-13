Received: by 10.25.85.209 with SMTP id j200csp1155123lfb;
        Mon, 13 Jun 2016 04:49:13 -0700 (PDT)
X-Received: by 10.233.237.14 with SMTP id c14mr13188714qkg.88.1465818553611;
        Mon, 13 Jun 2016 04:49:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si3384945qka.76.2016.06.13.04.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQMj-00004w-2Y
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:49:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCQJV-00062c-UX
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 07:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCQJQ-0005wJ-4r
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 07:45:52 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:13083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCQJP-0005vI-HT; Mon, 13 Jun 2016 07:45:48 -0400
Received: from 172.24.1.60 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DIP25266; Mon, 13 Jun 2016 19:42:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 19:42:18 +0800
Message-ID: <575E9BA9.5010307@huawei.com>
Date: Mon, 13 Jun 2016 19:40:25 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-21-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-21-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.575E9C24.0120, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 72d0e8efcbca7072452a2ccfb2f7e3b6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-devel] [PATCH v2 20/22] target-arm/monitor.c: Advertise
 emulated GICv3 in capabilities
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
X-TUID: kAq9uq2rS3ok



On 2016/5/26 22:55, Peter Maydell wrote:
> Now we have an emulated GICv3 we should advertise it via the
> capabilities in the monitor protocol.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  target-arm/monitor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target-arm/monitor.c b/target-arm/monitor.c
> index 1ee59a2..299cb80 100644
> --- a/target-arm/monitor.c
> +++ b/target-arm/monitor.c
> @@ -72,8 +72,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>      GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
>  
>      v2->emulated = true;
> -    /* TODO: we'd change to true after we get emulated GICv3. */
> -    v3->emulated = false;
> +    v3->emulated = true;
>  
>      gic_cap_kvm_probe(v2, v3);
>  
> 

-- 
Shannon

