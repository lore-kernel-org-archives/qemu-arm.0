Received: by 10.25.159.19 with SMTP id i19csp1394364lfe;
        Mon, 8 Feb 2016 07:27:53 -0800 (PST)
X-Received: by 10.55.197.6 with SMTP id p6mr28553901qki.75.1454945273500;
        Mon, 08 Feb 2016 07:27:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si30880331qgl.121.2016.02.08.07.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:27:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSnjF-0000fX-0f
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:27:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSnh1-0005SE-2h
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:25:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSngw-0006Ie-Qv
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:25:34 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSngw-0006IC-Ao; Mon, 08 Feb 2016 10:25:30 -0500
Received: by mail-lb0-x242.google.com with SMTP id zr1so4579886lbb.3;
	Mon, 08 Feb 2016 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ICZqAwV/cAF5sNDGmeBF30tUPlp3oe7Bo38VRa95awI=;
	b=Ic1agOk+O0rh7bjVdiVAGW52VEBHVo2aCnYS+royEkZdKrSXdinc+aScX/WzVS76YD
	p6SD7DfRuC0kRDkb/ZAiq8RjjI+5i4KTELBMxU6JPYeRY/mJFDRrM7Vmydb9anzj7mu4
	HnLVUTZaLNDnZoMMZEstcPv5IxpA8mwjYaRfCMCXbuM60UXdbQB4OO6r3zlWLpXhMVhT
	oI1maVxUQYzS4iQAG2ZX7kXakLkOLwzqcsYIscQAey4ali9o9QiL01PKcodbW8tA0sZn
	HoQSWgddA+LtiBT4JqZ4PIxYzNOvl3HfONSJCzyZbmjvF3GHzyCbrMPtzBy1n4DQBfG0
	QlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ICZqAwV/cAF5sNDGmeBF30tUPlp3oe7Bo38VRa95awI=;
	b=N8/bTVu8gO7GXddPrBWTgG8s57F7DLoCvX9Lxno9SEezLQZPeNOKvQq908EtbpWA88
	o0YaWXO4/4RPmAfR5zdBWmmse+e99VkVjQxEyNS+2I9xbFR8EKcR0Ner2OWlF5E2v+/S
	eX+mZg/aYXwjdN+G8RJfCIU8t6L07oO/v1EnPS7JA+A37MZcvdQBdiG61pELEwQdRTQM
	SA6t0j9qvMlzrgxdpeCd0YWD5g3xg4SZNuOtVTiaeH/K9PWkSkv6+O7EPxhSRJOaL/PR
	8/uDZ6DcQ9G6MzNIY0a+UO1RN9KU1GfXEU9YJbKZzAGcqq0hSYknRsZ++LerE6AAQMVI
	DgiQ==
X-Gm-Message-State: AG10YOTODmwXt6/FUe9lFfvCukY6+157VgcZvmLc3JFkk3Gn3Ls0+7dlebnNmCTirQjWhg==
X-Received: by 10.112.13.8 with SMTP id d8mr11518459lbc.110.1454945129120;
	Mon, 08 Feb 2016 07:25:29 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rx3sm3938037lbb.35.2016.02.08.07.25.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 07:25:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8B366.1040203@gmail.com>
Date: Mon, 8 Feb 2016 18:25:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] target-arm: correct CNTFRQ
	access rights
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XX+Q/aIcgVpg

On 05.02.2016 19:44, Peter Maydell wrote:
> Correct some corner cases we were getting wrong for
> CNTFRQ access rights:
>  * should UNDEF from 32-bit Secure EL1
>  * only writable from the highest implemented exception level,
>    which might not be EL1 now
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 7a8881a..082701a 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -1217,9 +1217,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
>  static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                         bool isread)
>  {
> -    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
> -    if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
> -        return CP_ACCESS_TRAP;
> +    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
> +     * Writable only at the highest implemented exception level.
> +     */
> +    switch (arm_current_el(env)) {
> +    case 0:
> +        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
> +            return CP_ACCESS_TRAP;
> +        }
> +        /* EL0 reads are forbidden by the .access fields */

s/reads/writes/ ?

> +        break;
> +    case 1:
> +        if (!isread && (arm_feature(env, ARM_FEATURE_EL2)
> +                        || arm_feature(env, ARM_FEATURE_EL3))) {
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +        if (!isread && ri->state == ARM_CP_STATE_AA32 &&
> +            arm_is_secure_below_el3(env)) {
> +            /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +        break;
> +    case 2:
> +        if (!isread && arm_feature(env, ARM_FEATURE_EL3)) {
> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
> +        }
> +        break;
> +    case 3:
> +        break;
>      }
>      return CP_ACCESS_OK;
>  }

Maybe calculating "the highest implemented exception level" could
simplify reading of the code a bit? E.g.:

    int highest_el = arm_feature(env, ARM_FEATURE_EL3) ? 3 :
                     arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;

We would probably want to have a dedicated static inline function for
this similar to HighestEL() from ARMv8 ARM pseudocode.

Kind regards,
Sergey
