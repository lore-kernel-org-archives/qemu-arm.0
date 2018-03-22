Received: by 10.28.71.155 with SMTP id m27csp411442wmi;
        Thu, 22 Mar 2018 07:24:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs/fF+0ZPBzy6hzNZFHOaatKsTYh3YlLlqxZTpLoMSMcLhKEgO1w54ov8Ptf88ViTaan9wJ
X-Received: by 10.237.56.226 with SMTP id k89mr25317107qte.264.1521728655864;
        Thu, 22 Mar 2018 07:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521728655; cv=none;
        d=google.com; s=arc-20160816;
        b=dKKgwn6J+eC5OQWCDznod9Uwt82YKaZ+FZiIep9aTUS0XeFgSmnolSCXtxFclzOR+/
         cCfyGaMtrFgOuSd8A4SIPn++HoW9ydhgcuxtENcS3Z4xk8qhYXJsHBLBXP5Q1lUmbIdj
         imTduycbv6ZPTnzLmSTDuW81ycXEVYwD4cGyrygXVsjntK2VKlHM4DbETj2Z3s24pfhn
         eAbsrR7P86DUDhCEapwhsjVm4GjtIgVEGHHuqAcgl3SdqB9UhnF7mKSmn0YmXWMocaeC
         17mHjXK9SVlV6tTC7qRrtWXERfBEvDbo67OD7xGSpqBLhq06kiHFOY6UI/I4JYtohp6f
         kZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+oxxtqMojZzF5WrQeah8R3a+vE5rY8KW86FG3WLRmww=;
        b=a0qw8wwhQFGgi7mIZ3gN9Cfy9S0Oj3dS58NVfAvo/AEmghySYW+3UxvF3bCOeSa8P7
         30wCVRdVoqxLGKhMOC2zkX7FuaCuSYROkI90ns+8AZz2rsL7cTV0KsZYgxPpim7dOZYk
         NZ6mSRy9eGmxbx9UyZ73V/gdK+MZuX8E+DSPy5/xSStrPw4dSEA/mCcmdRs7syGtPqBd
         U0qF+PghIxUCI9RL3B7Qjd1c3UmzhBLKAQ96uxTHWkthVyFw/cJZXQgwq+Good6/afcT
         JNl+EQBEwPACb9SYCVtMZoFBX8qXbirQ8cDyp9gmciUEwDWjqSY+03M0UHItLZmZ98HJ
         MRog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si7048100qtk.145.2018.03.22.07.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 07:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez18Z-0004Ao-A5
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 10:24:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ez18K-00045u-EO
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 10:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ez18G-0000M5-EY
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 10:23:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59108 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ez18G-0000LT-AP; Thu, 22 Mar 2018 10:23:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8B17406E96B;
	Thu, 22 Mar 2018 14:23:50 +0000 (UTC)
Received: from hawk.localdomain (unknown [10.40.205.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B688442E;
	Thu, 22 Mar 2018 14:23:45 +0000 (UTC)
Date: Thu, 22 Mar 2018 15:23:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180315133441.24149-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 14:23:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 14:23:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
X-TUID: 4+11bKlrR/9w

On Thu, Mar 15, 2018 at 01:34:41PM +0000, Peter Maydell wrote:
> If the GIC has the security extension support enabled, then a
> non-secure access to ICC_PMR must take account of the non-secure
> view of interrupt priorities, where real priorities 0..0x7f
> are secure-only and not visible to the non-secure guest, and
> priorities 0x80..0xff are shown to the guest as if they were
> 0x00..0xff. We had the logic here wrong:

0x00..0x7f

>  * on reads, the priority is in the secure range if bit 7
>    is clear, not if it is set
>  * on writes, we want to set bit 7, not mask everything else
> 
> Our ICC_RPR read code had the same error as ICC_PMR.
> 
> (Compare the GICv3 spec pseudocode functions ICC_RPR_EL1
> and ICC_PMR_EL1.)
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1748434
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 5cbafaf497..26f5eeda94 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -836,7 +836,7 @@ static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          /* NS access and Group 0 is inaccessible to NS: return the
>           * NS view of the current priority
>           */
> -        if (value & 0x80) {
> +        if ((value & 0x80) == 0) {
>              /* Secure priorities not visible to NS */
>              value = 0;
>          } else if (value != 0xff) {
> @@ -871,7 +871,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>              /* Current PMR in the secure range, don't allow NS to change it */
>              return;
>          }
> -        value = (value >> 1) & 0x80;
> +        value = (value >> 1) | 0x80;
>      }
>      cs->icc_pmr_el1 = value;
>      gicv3_cpuif_update(cs);
> @@ -1609,7 +1609,7 @@ static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      if (arm_feature(env, ARM_FEATURE_EL3) &&
>          !arm_is_secure(env) && (env->cp15.scr_el3 & SCR_FIQ)) {
>          /* NS GIC access and Group 0 is inaccessible to NS */
> -        if (prio & 0x80) {
> +        if ((prio & 0x80) == 0) {
>              /* NS mustn't see priorities in the Secure half of the range */
>              prio = 0;
>          } else if (prio != 0xff) {
> -- 
> 2.16.2
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
