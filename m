Received: by 10.25.27.66 with SMTP id b63csp1796236lfb;
        Mon, 6 Jun 2016 20:40:06 -0700 (PDT)
X-Received: by 10.233.239.18 with SMTP id d18mr19850127qkg.41.1465270806695;
        Mon, 06 Jun 2016 20:40:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y144si8580260qha.38.2016.06.06.20.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 20:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA7s6-00016v-1W
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 23:40:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA7ox-00072v-9H
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 23:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA7ot-0006hK-2o
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 23:36:50 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:59489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA7os-0006fy-EC; Mon, 06 Jun 2016 23:36:47 -0400
Received: from 172.24.1.137 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCU83938; Tue, 07 Jun 2016 11:32:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	11:32:39 +0800
Message-ID: <5756404A.2070203@huawei.com>
Date: Tue, 7 Jun 2016 11:32:26 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-2-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.57564064.000E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: dfe5b0a5f4013f9096bbd2ca66696ff8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-devel] [PATCH v2 01/22] migration: Define
 VMSTATE_UINT64_2DARRAY
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
X-TUID: i39jz1F30eKi



On 2016/5/26 22:55, Peter Maydell wrote:
> Define a VMSTATE_UINT64_2DARRAY macro, to go with the ones we
> already have for other type sizes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  include/migration/vmstate.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 30ecc44..aec9531 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -846,6 +846,12 @@ extern const VMStateInfo vmstate_info_bitmap;
>  #define VMSTATE_UINT64_ARRAY(_f, _s, _n)                              \
>      VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
>  
> +#define VMSTATE_UINT64_2DARRAY(_f, _s, _n1, _n2)                      \
> +    VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, 0)
> +
> +#define VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, _v)                 \
> +    VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint64, uint64_t)
> +
>  #define VMSTATE_INT16_ARRAY_V(_f, _s, _n, _v)                         \
>      VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_int16, int16_t)
>  
> 

-- 
Shannon

