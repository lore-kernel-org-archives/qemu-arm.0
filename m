Received: by 10.25.159.19 with SMTP id i19csp1408567lfe;
        Mon, 8 Feb 2016 07:56:15 -0800 (PST)
X-Received: by 10.55.79.207 with SMTP id d198mr34302283qkb.49.1454946975416;
        Mon, 08 Feb 2016 07:56:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s9si30939059qhc.72.2016.02.08.07.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:56:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSoAg-00072Z-W7
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:56:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSoAe-0006zi-HM
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSoAZ-00056d-FF
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:56:12 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSoAZ-00056Y-2T; Mon, 08 Feb 2016 10:56:07 -0500
Received: by mail-lf0-x243.google.com with SMTP id h198so5291476lfh.3;
	Mon, 08 Feb 2016 07:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=dm4aKCkSAOn4oNRhtk+5oWjGdJBjhStX0Qsgq4fsyME=;
	b=SOpHVgPIcEnSQP3lOtv3GuohE5IBonzxpX+NKNr7S1yrQJN/Xj3e66ELQpoKMoTjVD
	8bTbq26FCkMKekEcLmu1/7dZiTFnJ5M6hixKe+BiVPQwGr1HlF4QLhXdezJzKp23LEA3
	pBylIhVRbuAa6hC/Lk14oA8Dim4dHCV9ip9wvrZFZs8A5+aFrNPYNFvMrcBIpVcqOevc
	N2lJTt4lSoC4i8PgCvdI+PfRkL8wvsAfhPUQuIylu1VfhRmhdGh+olBE7qhK9kh+so0N
	j654A4+nM8mjZ3nniNwLncuNo/fdPxMmz8s6h9ernP7oIlAwHQ+5DCKv6aBqBc977DHP
	F2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dm4aKCkSAOn4oNRhtk+5oWjGdJBjhStX0Qsgq4fsyME=;
	b=i3SrUfhkX85XxbzmhyCGNLxEucwe1pQNf4S21cb87BKqOwP8vXVtp207Ob72ukyPjs
	Wdoj49OYxizyV/OSdMJFLtFSkjsjnPH4lFILPr6IWJjcxPO9q4K+uTVuFMF009w/MOFD
	NK00Eu2DHKOGIXnb1ZVpu6la/Ykp9k9QayOon1cZIUNHsN7aPEowz8nV+9VYcaJTh8JG
	tJQ8uJoJsAjFyiDENlMxWJGGuO9ce3pnqgGNCOulhIcvWMmfgFKe7o5D/4gGHoPq09rv
	1TgUfriE9JHsvUM60klKOvaD11eOzN0v4Lk5aYvwrOf8iP4kVBXOuXAiC3s5svPzqfOX
	Zvog==
X-Gm-Message-State: AG10YOSgONhtkeUy1D6S7JvutroA3vq2Ix9Rj1PdT8MDBusdRlv5VeIXwEM845NYNYHmTQ==
X-Received: by 10.25.19.217 with SMTP id 86mr9881762lft.27.1454946966151;
	Mon, 08 Feb 2016 07:56:06 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	x5sm4054407lbb.30.2016.02.08.07.56.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 07:56:04 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-5-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8BA93.202@gmail.com>
Date: Mon, 8 Feb 2016 18:56:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] target-arm: Implement
 MDCR_EL2.TDRA traps
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
X-TUID: wD1c56ly8kGL

On 05.02.2016 19:45, Peter Maydell wrote:
> Implement trapping of the "debug ROM" registers, which are controlled
> by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 18e85fd..8c2adbc 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -402,6 +402,24 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>  
> +/* Check for traps to "debug ROM" registers, which are controlled
> + * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
> + */
> +static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                  bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDRA)
> +        && !arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -3774,12 +3792,15 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       * accessor.
>       */
>      { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
> -      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
> +      .access = PL0_R, .accessfn = access_tdra,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
>        .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
> -      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
> +      .access = PL1_R, .accessfn = access_tdra,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
> -      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
> +      .access = PL0_R, .accessfn = access_tdra,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
>      { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
>        .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,

