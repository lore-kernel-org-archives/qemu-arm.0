Received: by 10.25.208.137 with SMTP id h131csp2090667lfg;
        Tue, 10 May 2016 06:42:55 -0700 (PDT)
X-Received: by 10.55.215.137 with SMTP id t9mr12185869qkt.59.1462887775327;
        Tue, 10 May 2016 06:42:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n80si1450630qka.125.2016.05.10.06.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 06:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b07w6-0000Ao-U8
	for alex.bennee@linaro.org; Tue, 10 May 2016 09:42:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b07w3-00006n-Rv
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b07vz-0000gR-FW
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:42:50 -0400
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:34764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b07vz-0000gF-9a
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:42:47 -0400
Received: by mail-pf0-x22e.google.com with SMTP id y69so6111297pfb.1
	for <qemu-arm@nongnu.org>; Tue, 10 May 2016 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=zOAkTimslpsHWmcE3bO4hcEOjwpuKZlso2+yiNM8iOg=;
	b=fOvLohyPHk16Gm86G04PIcn3e7Rw3uvUGZWQ2m17DccjDx1jvvHa9CudJZsWthu3/N
	HgNEqZTRgs4IurFnBp58Llv7nA7qAdm7EJ643GMdoMnVUI8V1cXfOWai1VM08TAGqSja
	KsMvjQiuBJd1UjSkafCMiU1muZ94b1A6Rjah0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zOAkTimslpsHWmcE3bO4hcEOjwpuKZlso2+yiNM8iOg=;
	b=B/Tm5Q9SkZWZTGXWbnNRd32AB0yUx96Iae6q7bmyc+gvXUd32kHiJ6m6KWuXuMnWMN
	+Wl+Mz53PJFbMnBML2kOtWUk4Z+phR/licIT5s57IjTMMedLKvj28UCXLHyRsVlYCaNF
	wquCediiPUIymPnTIP+Yd67cGM+Ugth72ohEeKuNBm0Pq00B57UCuSaNOkPYyRr9hdap
	GDg8zxEePhoyyDXCI/y2C0JJBJGpW+SvAAUip84qzMOJKusu1p2F2JkA+lm3vCwd1F7h
	vXCOQDMSnvoCrenRyH7XqWySmeeiK72qga1dyKOEANVaCMgHKvNV9KlfT08a8ZpgQaMu
	jRow==
X-Gm-Message-State: AOPr4FUtoj2yZejgPWdEUlXyDHyA/2fRUpnSm8nzo56zvqtHLGY7aTqhu2RGoP6NKEvc6JFY
X-Received: by 10.98.30.132 with SMTP id e126mr12844332pfe.109.1462887765768; 
	Tue, 10 May 2016 06:42:45 -0700 (PDT)
Received: from [10.16.1.154] ([167.160.116.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm4767365pfc.57.2016.05.10.06.42.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 06:42:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-4-git-send-email-peter.maydell@linaro.org>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <5731E54E.2060006@linaro.org>
Date: Tue, 10 May 2016 21:42:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462814989-24360-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22e
Subject: Re: [Qemu-arm] [PATCH 03/23] target-arm: Define new
 arm_is_el3_or_mon() function
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
Cc: Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iGs0v27EMVhZ

On 2016年05月10日 01:29, Peter Maydell wrote:
> The GICv3 system registers need to know if the CPU is AArch64
> in EL3 or AArch32 in Monitor mode. This happens to be the first
> part of the check for arm_is_secure(), so factor it out into a
> new arm_is_el3_or_mon() function that the GIC can also use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 066ff67..6ffc13b 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -960,8 +960,8 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
>      }
>  }
>  
> -/* Return true if the processor is in secure state */
> -static inline bool arm_is_secure(CPUARMState *env)
> +/* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
> +static bool arm_is_el3_or_mon(CPUARMState *env)
inline?

>  {
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
> @@ -973,6 +973,15 @@ static inline bool arm_is_secure(CPUARMState *env)
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

Thanks,
-- 
Shannon
