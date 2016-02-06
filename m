Received: by 10.25.159.19 with SMTP id i19csp509546lfe;
        Sat, 6 Feb 2016 08:17:08 -0800 (PST)
X-Received: by 10.140.228.69 with SMTP id y66mr25221522qhb.78.1454775428915;
        Sat, 06 Feb 2016 08:17:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a26si21763170qka.5.2016.02.06.08.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 08:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS5Xo-0003SA-BD
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 11:17:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS5Xl-0003PP-QC
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS5Xk-0007vd-TI
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 11:17:05 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS5Xe-0007ua-TQ; Sat, 06 Feb 2016 11:16:59 -0500
Received: by mail-pf0-x244.google.com with SMTP id 71so1592749pfv.1;
	Sat, 06 Feb 2016 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PfkwoAgzHWtTTxFd6pYut8Wdkyzo5GIuWX13+EDwOMY=;
	b=PVvNQz/yel6WN4ETID3xnAsei+ED5pQMFQzcGRpGDAmNrZ1XV+tPfu5vuS5IiFniVC
	JjTGDpHpluZ8S76sfZSxd/GijjaO5XzmNK4pA9F1h2XcQo1vE4p7NOr23Fcj/vy2rp6a
	GjzUFjfoA9Wxs6XIvUtOAgqxPjNrd6RWTT+Y40BpaUDeWJsn/Eu3TbOyKRghtQKdGsPA
	I6UATCeJ/XrLyfZ3QAotH05S4NoUYptICSYgt8w8UGj0DBeVbznPa6Rfbm1jwp7IifHm
	OaziPMZ6AcVx26UsVZAt/0Z2XKnLAmorLbXjs/C40tGrG8xnemIWgSlj+pTKP8U7MMYQ
	kqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=PfkwoAgzHWtTTxFd6pYut8Wdkyzo5GIuWX13+EDwOMY=;
	b=K0/gIS8geIT534TKjO4p5nCndWv9n3Xmx/hrZSY4F4wI2N8/ca5cZddNqyObbT1MtW
	RoM3NHEgNfqTBrm3JdGg7hGEstoGALH5Z4wD2HEgfc9lqIUZeidI/C7lT4QC8cFY2RhE
	6z0anGVl+6j6JhXU6Axz4WM/SmKkKI/IHjisx+YLn6K+RUCzy+5fcucla5WV7A4YfPaR
	nli+gPMLg/WF5+BVSapYumpWTt9Ob7EUMSXeGI1H8C7SsLtwlX4LvbpUgipqcWPRWEIW
	9DDxVdS3NQ9f6BbweQQg2QLmfgsCf+G6L/J+R7I9gFkq4/h9GOHSOgWE2uuNyUj7CLdd
	1p/g==
X-Gm-Message-State: AG10YOR1Ao7OoAOzs6lfHnBMB2Fw4CHvUAFmTuN5X8ePkd5VnrSp1sRRtkLL4Ty4JQqDCA==
X-Received: by 10.98.0.135 with SMTP id 129mr28784098pfa.156.1454775418175;
	Sat, 06 Feb 2016 08:16:58 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	u84sm32217485pfa.57.2016.02.06.08.16.56
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 08:16:57 -0800 (PST)
Date: Sat, 6 Feb 2016 17:10:20 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206161020.GE3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/7] target-arm: Use access_trap_aa32s_el1()
 for SCR and MVBAR
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
X-TUID: fDcxQlP1Dvno

On Wed, Feb 03, 2016 at 01:38:37PM +0000, Peter Maydell wrote:
> The registers MVBAR and SCR should have the behaviour of trapping to
> EL3 if accessed from Secure EL1, but we were incorrectly implementing
> them to UNDEF (which would trap to EL1).  Fix this by using the new
> access_trap_aa32s_el1() access function.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8b96b80..d85b04f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3547,7 +3547,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .resetvalue = 0, .writefn = scr_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
> -      .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
>      { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> @@ -3569,7 +3570,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL3_W | PL1_R, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
>      { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
> -      .access = PL3_RW, .writefn = vbar_write, .resetvalue = 0,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .writefn = vbar_write, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
>      { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */
> -- 
> 1.9.1
> 
