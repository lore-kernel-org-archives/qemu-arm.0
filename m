Received: by 10.25.159.19 with SMTP id i19csp409498lfe;
        Sat, 6 Feb 2016 03:55:52 -0800 (PST)
X-Received: by 10.140.163.6 with SMTP id j6mr24192645qhj.36.1454759752367;
        Sat, 06 Feb 2016 03:55:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e204si939789qhc.130.2016.02.06.03.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 03:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS1Sx-0000wr-VZ
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 06:55:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1Sv-0000u1-PF
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 06:55:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1Su-0001np-UU
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 06:55:49 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS1Sp-0001nJ-PO; Sat, 06 Feb 2016 06:55:43 -0500
Received: by mail-pf0-x243.google.com with SMTP id 66so6446873pfe.2;
	Sat, 06 Feb 2016 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yGgC99SU7H6z7xyv14nwcdATI8x1nRej67eYzKiGti4=;
	b=supOre7T8j7ldXXWtfAZ4EF4ecND7h5ftHF3KA2HGlcFMlygsQcH+tu5NDIBFHhwYm
	YLQDdd05PoEptEaE8ExPnbtf7T68U2hYK9D+qJTU9b0mLuo/S0d5GOj9qlvMbhSaquqT
	BU8bi3H1WYmuRC4MvqnFBCekqO5L/O3obPxOcg5zvctfLHS72jgBvbsLpS5x7EgmX5MB
	3TfBuCdNennhtuMR3pFaC9xf10NCY0fPZ+XKQWvMQs0hIYhzuhr1cC9VlvoQ+GG/k9Dt
	ijo8JYpLCcvz9AehjSMF/W9gQu2LvPONbWG7DdTGEcoZh8usG9c90+unx5wVOBL4Dp8J
	1R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=yGgC99SU7H6z7xyv14nwcdATI8x1nRej67eYzKiGti4=;
	b=eyP4FFAXJLdTm6iNGJZjxyH3bXMJRCJVGcs04+gIGc3oPe598SoDMkpJauNZPLita9
	mYOwSt6sAbKtJ9c+0x/f3hp+4jn30b3ipagORqAYYuj13turguu3A/2gm6s0zLmN46hp
	gMYZ67JcWy7uXvVvEXUa+JQbhBZTCHrArA68aEke3nFLj6F3IRXV2ILyZQBPst5hm9Hp
	hypZkjCXfjd+QgIgrw1u23rFo78laNnfMjZdIRWdt5LS4rLPGtDrOYzVfKNYZMr9lr9H
	+USwzk9iWid86+dD50XSlKZfVzfoUxpf7TsUDC0vP3siYhqy+2iQveOA7stnVDPD34Bw
	UQNA==
X-Gm-Message-State: AG10YOSCUbXXcza+IkQWzGj/bQTmKL59nGpto51262TsJltigvxeM8iiiIIJj1SrV+6j8Q==
X-Received: by 10.98.12.133 with SMTP id 5mr27317493pfm.20.1454759742341;
	Sat, 06 Feb 2016 03:55:42 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	f12sm30829397pfd.87.2016.02.06.03.55.40
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 03:55:41 -0800 (PST)
Date: Sat, 6 Feb 2016 12:49:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206114946.GA3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/7] target-arm: Fix typo in comment in
 arm_is_secure_below_el3()
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
X-TUID: E3sBWKvxmGBi

On Wed, Feb 03, 2016 at 01:38:35PM +0000, Peter Maydell wrote:
> Fix a typo where "EL2" was written but "EL3" intended.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index b8b3364..52284e9 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -931,7 +931,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          return !(env->cp15.scr_el3 & SCR_NS);
>      } else {
> -        /* If EL2 is not supported then the secure state is implementation
> +        /* If EL3 is not supported then the secure state is implementation
>           * defined, in which case QEMU defaults to non-secure.
>           */
>          return false;
> -- 
> 1.9.1
> 
