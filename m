Received: by 10.25.27.66 with SMTP id b63csp1847076lfb;
        Mon, 6 Jun 2016 23:37:36 -0700 (PDT)
X-Received: by 10.55.148.130 with SMTP id w124mr20164026qkd.203.1465281456778;
        Mon, 06 Jun 2016 23:37:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u125si4171597qkf.102.2016.06.06.23.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 23:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAAds-0003EW-AY
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 02:37:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bAAd3-0002vJ-IK
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 02:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bAAcx-0004e1-NN
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 02:36:44 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bAAcx-0004cz-1U; Tue, 07 Jun 2016 02:36:39 -0400
Received: from 172.24.1.60 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCV02107; Tue, 07 Jun 2016 14:32:56 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	14:32:45 +0800
Message-ID: <57566A70.80304@huawei.com>
Date: Tue, 7 Jun 2016 14:32:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.57566A9B.0007, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ddc16940d1fb2a1032ab2879fe3213cc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-devel] [PATCH v2 03/22] target-arm: Define new
 arm_is_el3_or_mon() function
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
X-TUID: IuME5Ha1oBHH



On 2016/5/26 22:55, Peter Maydell wrote:
> The GICv3 system registers need to know if the CPU is AArch64
> in EL3 or AArch32 in Monitor mode. This happens to be the first
> part of the check for arm_is_secure(), so factor it out into a
> new arm_is_el3_or_mon() function that the GIC can also use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  target-arm/cpu.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index c741b53..2fa1f41 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1133,8 +1133,8 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
>      }
>  }
>  
> -/* Return true if the processor is in secure state */
> -static inline bool arm_is_secure(CPUARMState *env)
> +/* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
> +static inline bool arm_is_el3_or_mon(CPUARMState *env)
>  {
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
> @@ -1146,6 +1146,15 @@ static inline bool arm_is_secure(CPUARMState *env)
>              return true;
>          }
>      }
> +    return false;
> +}
> +
> +/* Return true if the processor is in secure state */
> +static inline bool arm_is_secure(CPUARMState *env)
> +{
> +    if (arm_is_el3_or_mon(env)) {
> +        return true;
> +    }
>      return arm_is_secure_below_el3(env);
>  }
>  
> 

-- 
Shannon

