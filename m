Received: by 10.25.0.144 with SMTP id 138csp767983lfa;
        Mon, 10 Apr 2017 01:45:45 -0700 (PDT)
X-Received: by 10.237.44.229 with SMTP id g92mr50925826qtd.204.1491813945515;
        Mon, 10 Apr 2017 01:45:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si12901904qtu.197.2017.04.10.01.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 01:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxUxD-0002ng-2A
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 04:45:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUx6-0002m6-Vb
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cxUx3-0003zy-Sv
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 04:45:36 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:32841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cxUx3-0003za-LD; Mon, 10 Apr 2017 04:45:33 -0400
Received: by mail-lf0-x243.google.com with SMTP id r36so10765018lfi.0;
	Mon, 10 Apr 2017 01:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uRbLXPmyHgmZlxPrgz1zJ2Y5fcI/PVE7j2NTjhAsueU=;
	b=IJrEx7Lews+vTav9T04KxPl8LSESPuxwJMd3hxiAPJ96sSSCVl70C/q31Lcr1efaYD
	7gQubmpYEqqo7V6ZTD7fBNccSS5XFcez9rHDt06WmjHNgWF+qjPdvuEmjjFUSatKT3o+
	JQ80CWS8/gdztDGRhhmkuZAG7rYy4HozZCTN+7No29AgIlZylfRu8wTfeWPc852h5zuI
	/ApSb2KGPMTZ/rVTmPyajBczvvkn4MCueWtKqUSOXRvzcGa0t1UQyW7SVKt55+yV0q28
	zLudn4lFF+HPLJBLYrS2jlGjZwoczvF2RDd8Yqk7JqUX2vVAGcSu8dOUJRcEH5QCF/tR
	Xhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uRbLXPmyHgmZlxPrgz1zJ2Y5fcI/PVE7j2NTjhAsueU=;
	b=TRKKfUJ3lBNk9pnNwKFK9EE0Giy19hnyvwswxjCgs1Nqsr4mIxmRlMdHhGYsfR7M5R
	GrrG3W5aLN4tWBwtaYNHsN+s8RyavBKHJ7kd8Zd2Kt43WGF8nxcNHAno+N//UjujomLH
	Dq4STms2/1JC51nx7MuvATzDED2hAjShQ9OZVEWlYWxV1MLQRFxiqXvuyS5eZPd5OT9B
	F9yn06npbStHPQ6A+ma3UTV6GVGz3wCa3xHe8Y7Ois+czcoBIz/Y7zwbCAWBTBne7wvu
	tHLzeiSHOHO5ZZ2+rmtHuuwVFpY5oh2nDxVKC+zdLEZzIp4plD5xWlRXHL6cpOPZZgW+
	GgUw==
X-Gm-Message-State: AN3rC/4YYucCK9D5nzWPjjq8a39aZ9W0LY7G1nJuZBMJOjkp5vq6/MapKqvgAKcipAVqpQ==
X-Received: by 10.25.233.70 with SMTP id g67mr225973lfh.131.1491813932381;
	Mon, 10 Apr 2017 01:45:32 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	m203sm2700854lfm.28.2017.04.10.01.45.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 01:45:31 -0700 (PDT)
Date: Mon, 10 Apr 2017 10:45:30 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170410084530.GC19103@toto>
References: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH] target/arm: Add missing entries to
 excnames[] for log strings
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
X-TUID: IHXGafi0Dawn

On Thu, Apr 06, 2017 at 02:45:40PM +0100, Peter Maydell wrote:
> Recent changes have added new EXCP_ values to ARM but forgot
> to update the excnames[] array which is used to provide
> human-readable strings when printing information about the
> exception for debug logging. Add the missing entries, and
> add a comment to the list of #defines to help avoid the mistake
> being repeated in future.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/cpu.h       | 1 +
>  target/arm/internals.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a8aabce..e6f05e2 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -58,6 +58,7 @@
>  #define EXCP_SEMIHOST       16   /* semihosting call */
>  #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
>  #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
> +/* NB: new EXCP_ defines should be added to the excnames[] array too */
>  
>  #define ARMV7M_EXCP_RESET   1
>  #define ARMV7M_EXCP_NMI     2
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index f742a41..97ca034 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -70,6 +70,8 @@ static const char * const excnames[] = {
>      [EXCP_VIRQ] = "Virtual IRQ",
>      [EXCP_VFIQ] = "Virtual FIQ",
>      [EXCP_SEMIHOST] = "Semihosting call",
> +    [EXCP_NOCP] = "v7M NOCP UsageFault",
> +    [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
>  };
>  
>  /* Scale factor for generic timers, ie number of ns per tick.
> -- 
> 2.7.4
> 
> 
