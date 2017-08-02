Received: by 10.25.44.15 with SMTP id s15csp6409698lfs;
        Wed, 2 Aug 2017 10:40:31 -0700 (PDT)
X-Received: by 10.55.138.67 with SMTP id m64mr30292392qkd.6.1501695631373;
        Wed, 02 Aug 2017 10:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501695631; cv=none;
        d=google.com; s=arc-20160816;
        b=wzTCRxgPNiCsx/JK8a+ctlG4J6Y1A7pVekQEWeagcBfDjzfWExsP8P1LeToAGVyTHz
         4PH7DwLE3vSxdg5lNThCz9vb9aCC3JIJt7GJc3JKCvQPu6+Iev1sLa3S/AdILumyerM/
         oGAW9U1oRLUncDLeMtmCqsJDwDqNmk8/teXLBbMJXzTMUi9gzuXJHwqVK71c1XrgFn2H
         7WeZgQI7ZOhqVjXAuoklRRAZOFLex+d4JtD5w4wzvRySa/bIHpzWYicY2NIJHlXCTeuQ
         ZvjlWy8avcOCc/e8xUZxSOFCOvAzL4qc5D5Zo2LHU8WiDgVIt8sylYho3YWXxV1vSyqN
         AFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=DBZh92mIC/gLH4WMXKrZMIf6ekzbF/beIQz5o2I0rdU=;
        b=ZmzedW+fn/b20AC3JfcA6dTVCOo5fIhKpygc53pk+JMvGKjrNDfbBWD+7gffRqwXfj
         CGPv7ucHRTj+DLimQU7ehUwM6bDAL1MRE2pbZRjjIQWtaEuW8cJRr9QxEcqPfnTMIsyM
         H3vKliVJ1Sy+uO+6cx/WkVC1nWbHcIUri3T5eCkbk4frqzzXcuzA/wBRrb1Ry4wxgV7a
         3yw98bRK+526TBzI9IkmMrhLQXjuh+nO5ibfOeB4SNq36U7nJzf+6XRSi7ztyEQ1exSD
         sg+8CM0SquIVvkE1ZdkUpN2hhL0XAK2bw5bxqWJIMpMjygfBXK86MdbF7eSOtt0rKZSq
         LPpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Qc+XqBSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n33si18920521qtn.149.2017.08.02.10.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 10:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Qc+XqBSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcxdE-00030F-Lw
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 13:40:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxdA-000308-Je
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxd7-00015U-Fx
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:40:24 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:37567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcxd7-00014g-7n; Wed, 02 Aug 2017 13:40:21 -0400
Received: by mail-lf0-x241.google.com with SMTP id x16so4219252lfb.4;
	Wed, 02 Aug 2017 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DBZh92mIC/gLH4WMXKrZMIf6ekzbF/beIQz5o2I0rdU=;
	b=Qc+XqBSE7iv69yueJeqwg7oQrOWSVC4fCaV5iZP20T/ofv3HirYQ7zjU0EvVC/4RX3
	FlcX5sk1eLvX7NK1LzFnd0joQr7L/zo8aMggxIFOWPTfiI1pm0qHtDvRQKrv10zglE4H
	LLz5iljSqGyQXdq5YMjXnUwPAdsAE6nTRyexs1Q8KRq0gnu4RRjD5V4UyxIhfy0zyWyj
	bpBQ3EAhI4Tc0n3DIGaGow1YQpgH6jYmRT/pNV2f+/PU0C3m+FEI2tVD64hX8FLPYKyq
	OR7V5D9w9sopjD0HY0Npoj6/LmK3hdys5BodeKJtNLpqIbOND8Nq0bzWC/s69X0evbKs
	aiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DBZh92mIC/gLH4WMXKrZMIf6ekzbF/beIQz5o2I0rdU=;
	b=PW4Qr00p5+A0ratC53EiwlmUNUqetFIrtvP7rsmKveXX+pUgau6UhnvleVyShzyGgT
	cA8Es0H2rwuofKGo7ELrKsCt5UfClus8DR0B8COjGU7sfpeaBfgQvp+ezvayHb752P98
	9n4Mn8cUtF2GYV1q7WLjdS6NnRuIM3t1IikhmsGjmo08A2oCV3oqFp4eEirNQ6XNnUt6
	kZiVXjx/y9j8xCgbLAY25DIpy+E2PjvsgFdjeZGv7f0kWDdcmJGrKrmcJvwM6+xv4f1x
	FbNHZPowX2r9XBGQ3SBH+YhCWBslUvhawt7BKDOR69s0PlVTHdLSPSPQZu+Z2pin7CeE
	d5iA==
X-Gm-Message-State: AIVw111gry8rvwP/wSkcy3KUsY8QV9vm8FJSjb4OZEowE7M5diP5hD+u
	v2n1K++JnaYE0g==
X-Received: by 10.46.83.81 with SMTP id t17mr8334824ljd.187.1501695619745;
	Wed, 02 Aug 2017 10:40:19 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	x133sm6202877lfd.58.2017.08.02.10.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:40:18 -0700 (PDT)
Date: Wed, 2 Aug 2017 19:40:18 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170802174018.GI4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] target/arm: Consolidate
 PMSA handling in get_phys_addr()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hFq2TnL7mn4

On Wed, Aug 02, 2017 at 05:43:49PM +0100, Peter Maydell wrote:
> Currently get_phys_addr() has PMSAv7 handling before the
> "is translation disabled?" check, and then PMSAv5 after it.
> Tidy this up by making the PMSAv5 code handle the "MPU disabled"
> case itself, so that we have all the PMSA code in one place.
> This will make adding the PMSAv8 code slightly cleaner, and
> also means that pre-v7 PMSA cores benefit from the MPU lookup
> logging that the PMSAv7 codepath had.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b78d277..fd83a21 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8423,6 +8423,13 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>      uint32_t base;
>      bool is_user = regime_is_user(env, mmu_idx);
>  
> +    if (regime_translation_disabled(env, mmu_idx)) {
> +        /* MPU disabled.  */
> +        *phys_ptr = address;
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return false;
> +    }
> +
>      *phys_ptr = address;
>      for (n = 7; n >= 0; n--) {
>          base = env->cp15.c6_region[n];
> @@ -8572,16 +8579,20 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>          }
>      }
>  
> -    /* pmsav7 has special handling for when MPU is disabled so call it before
> -     * the common MMU/MPU disabled check below.
> -     */
> -    if (arm_feature(env, ARM_FEATURE_PMSA) &&
> -        arm_feature(env, ARM_FEATURE_V7)) {
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          bool ret;
>          *page_size = TARGET_PAGE_SIZE;
> -        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> -                                   phys_ptr, prot, fsr);
> -        qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
> +
> +        if (arm_feature(env, ARM_FEATURE_V7)) {
> +            /* PMSAv7 */
> +            ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> +                                       phys_ptr, prot, fsr);
> +        } else {
> +            /* Pre-v7 MPU */
> +            ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
> +                                       phys_ptr, prot, fsr);
> +        }
> +        qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
>                        " mmu_idx %u -> %s (prot %c%c%c)\n",
>                        access_type == MMU_DATA_LOAD ? "reading" :
>                        (access_type == MMU_DATA_STORE ? "writing" : "execute"),
> @@ -8594,21 +8605,16 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>          return ret;
>      }
>  
> +    /* Definitely a real MMU, not an MPU */
> +
>      if (regime_translation_disabled(env, mmu_idx)) {
> -        /* MMU/MPU disabled.  */
> +        /* MMU disabled. */
>          *phys_ptr = address;
>          *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          *page_size = TARGET_PAGE_SIZE;
>          return 0;
>      }
>  
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        /* Pre-v7 MPU */
> -        *page_size = TARGET_PAGE_SIZE;
> -        return get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
> -                                    phys_ptr, prot, fsr);
> -    }
> -
>      if (regime_using_lpae_format(env, mmu_idx)) {
>          return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
>                                    attrs, prot, page_size, fsr, fi);
> -- 
> 2.7.4
> 
> 
