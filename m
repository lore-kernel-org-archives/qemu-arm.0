Received: by 10.25.21.156 with SMTP id 28csp127317lfv;
        Mon, 11 Jul 2016 18:33:59 -0700 (PDT)
X-Received: by 10.200.46.122 with SMTP id s55mr10732156qta.80.1468287239362;
        Mon, 11 Jul 2016 18:33:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67si709589qkc.143.2016.07.11.18.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 18:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMmaE-00031n-T5
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 21:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bMma8-00030F-IV
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 21:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bMma7-0000v0-JU
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 21:33:52 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:57937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bMma1-0000t5-0S; Mon, 11 Jul 2016 21:33:45 -0400
Received: from 172.24.1.47 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DKB77902; Tue, 12 Jul 2016 09:33:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 12 Jul 2016 09:33:15 +0800
Message-ID: <578448D5.4020208@huawei.com>
Date: Tue, 12 Jul 2016 09:33:09 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1468261372-17508-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1468261372-17508-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090203.578448E5.0002, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bdfa14b5965cf2d4af6cc30a4146cfa8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm_gicv3: Add assert()s to
 tell Coverity that offsets are aligned
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tqk1Vb5ucYZ5



On 2016/7/12 2:22, Peter Maydell wrote:
> Coverity complains that the GICR_IPRIORITYR case in gicv3_readl()
> can overflow an array, because it doesn't know that the offsets
> passed to that function must be word aligned. Add some assert()s
> which hopefully tell Coverity that this isn't possible.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't have any way to test this except getting it into master
> and seeing if Coverity still complains, but if it does then
> I'll happily just mark the error as a false positive...
> 
Since the codes are correct, maybe it could ignore the original complain
at Coverity instead of adding the assert(). But anyway I'm fine with
this patch.

>  hw/intc/arm_gicv3_redist.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 2f60096..77e5cfa 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -420,6 +420,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
>      MemTxResult r;
>      int cpuidx;
>  
> +    assert((offset & (size - 1)) == 0);
> +
>      /* This region covers all the redistributor pages; there are
>       * (for GICv3) two 64K pages per CPU. At the moment they are
>       * all contiguous (ie in this one region), though we might later
> @@ -468,6 +470,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>      MemTxResult r;
>      int cpuidx;
>  
> +    assert((offset & (size - 1)) == 0);
> +
>      /* This region covers all the redistributor pages; there are
>       * (for GICv3) two 64K pages per CPU. At the moment they are
>       * all contiguous (ie in this one region), though we might later
> 

-- 
Shannon

