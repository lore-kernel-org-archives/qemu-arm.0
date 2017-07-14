Received: by 10.25.44.15 with SMTP id s15csp1139886lfs;
        Fri, 14 Jul 2017 09:24:32 -0700 (PDT)
X-Received: by 10.55.203.156 with SMTP id u28mr13370024qkl.187.1500049472022;
        Fri, 14 Jul 2017 09:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500049472; cv=none;
        d=google.com; s=arc-20160816;
        b=kDMxmeCZRTxJwISqsd17w7VrgsOTmaQC96CNrtuWx2e0leAc40AHJOHZe2VXAndaXE
         fEu0cxVsJrBSVgga06ZCPnQNlclKHj2aPFrEZulYGAnSA9mm4qjEawmJhdbAT0BAOyG1
         wOQ/HGsHi47UNYRrQDgZtL4ZlK3W6tRkCnyuV9BgjJ7w+xvNs+r3ZJA1ffvGzEGfvrOm
         CNTsaNYIR1hLZCr0j2PLOVfRz0Q5V/pgbAULv2Av7OEZUsYGXo7ACJ0xsci7B9pQVUL8
         /T2Y1lunrbMkQr584mpzDQ4s9bteXdsJzydMH7Ko+rnWYgQLFvsGzuXTEf+qgzjCHyIf
         iqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=pntsdFN7xtWxQMmRFK1GyAFabznS5LA0xYylOO3pxxI=;
        b=teImkSxrYDPEwEmXDBjQpQ+qIythQR96eF9RkRc6Sh3cjL4zaxYAMlwwfLDunLLg3W
         Yxkox8fISl6y5HPErIuA1zWEavdl3CNfypot+tovSV2+hwunKAgDkdTe4dgaAvLbUvzK
         9ux0z8NIwgHaxQQyoEZmeIXCjBaVOCRHXdLXOPG+Mrqdh0oheYmYI8a/mdUuGZzjV+lC
         GaP9dTAE+GdBgw+TKfifJaUXiP6Y6irF6xam2WAq+XywQRvZlx4rp94YK3I1zTWL1pQI
         dxNsT5g37ak1c10HRMM3uEnaHuuJftCU5Z9fXpf1pqebFRY+EfeBaCYFAT7tUkW58Aac
         PFww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vCJ+FZmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q49si8209840qte.104.2017.07.14.09.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 09:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vCJ+FZmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW3OH-0001vi-3W
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 12:24:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3OB-0001sz-Si
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3OB-0007Ni-1Z
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:24:23 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3O7-0007M6-66; Fri, 14 Jul 2017 12:24:19 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so12694031qki.1;
	Fri, 14 Jul 2017 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pntsdFN7xtWxQMmRFK1GyAFabznS5LA0xYylOO3pxxI=;
	b=vCJ+FZmN98z6+o5ReKRu6j694dTr5lsyyk7mRCC8HXRfkKBN87jdmClCj0fW7QQluh
	n59gMm7XmLonZlT4yP8b+4sRpOzmnTHK6hpTSn/6L/QSvcJEWpu309NBpYcPmvg7vVjM
	hb14G/awopsBwpqGPncIns7cKYMGvfm/XE+cyh3Tbr1OQdQMfru7DYYeJtDgSlGx+kDD
	wB6Yr0T2zXskCsbIwp8TTCBvHlr+NEi7AT5rXkRHwo+kiK8SMHfUUnfoRWPp5enhSk2X
	CtU2nNXnl6Wn4zJnVb5gnfaH22Rv46Is0Ewb/i65XteehjuAazuuEum+EdqaYgwVglHf
	XwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pntsdFN7xtWxQMmRFK1GyAFabznS5LA0xYylOO3pxxI=;
	b=qN5oGx8GEfef9g7KqYJYH/pOU2C3iRMbCZliDQfckpmw/1nkwZZFGc17Kn8Yacz1Xd
	I4byNxmYdzPJSUBm9v6GZlMa7IOEPqbq1JpXMMFKcLf4+bC8UixNUpk2aMNe9Q7q31Y3
	OTPWfcVJCGpb9o51E9AlSgSXYQS7vVAnargsw4gFsSDiPV9hZLftI+ltKLyr43hLAVfS
	qSvxJhuKIeSu10qSK5eDE87vWY/mIoZflsGvojmJkUMdD9L5YWkJUDt2Lo33uceIa16F
	dP7cgPAz4GFjIoGLdE/lRZbNa2tJVmNLd8Ys0lN3kXl527xHqPrxmD4I1cQpHGM+oVf+
	qZ/Q==
X-Gm-Message-State: AIVw110nsl22A30B2JyvTWgCjfV+giBNdR9Y9S2vMlCVbdW+WLotODT3
	/5/hg6p519Xf843Ssh4=
X-Received: by 10.55.132.135 with SMTP id g129mr12951664qkd.36.1500049458672; 
	Fri, 14 Jul 2017 09:24:18 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id e15sm7769604qte.3.2017.07.14.09.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 09:24:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
	<1500029487-14822-10-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f84687b9-0c64-dbfd-6823-948bf0c20755@amsat.org>
Date: Fri, 14 Jul 2017 13:24:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500029487-14822-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v2 9/9] MAINTAINERS: Add entries for MPS2
 board
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
Cc: Alistair Francis <alistair.francis@xilinx.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /PuQF39ST9OU

On 07/14/2017 07:51 AM, Peter Maydell wrote:
> Add entries to the MAINTAINERS file for the new MPS2
> board and devices.
> 
> Since the CMSDK devices are not specific to the MPS2 board,
> extend the existing 'PrimeCell' section to cover CMSDK
> devices as well; in both cases these are devices implemented
> by ARM and provided as RTL that may be used in multiple
> SoCs and boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   MAINTAINERS | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9529c94..10f5cd6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -380,7 +380,7 @@ F: hw/*/allwinner*
>   F: include/hw/*/allwinner*
>   F: hw/arm/cubieboard.c
>   
> -ARM PrimeCell
> +ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
>   S: Maintained
> @@ -394,6 +394,10 @@ F: hw/intc/pl190.c
>   F: hw/sd/pl181.c
>   F: hw/timer/pl031.c
>   F: include/hw/arm/primecell.h
> +F: hw/timer/cmsdk-apb-timer.c
> +F: include/hw/timer/cmsdk-apb-timer.h
> +F: hw/char/cmsdk-apb-uart.c
> +F: include/hw/char/cmsdk-apb-uart.h
>   
>   ARM cores
>   M: Peter Maydell <peter.maydell@linaro.org>
> @@ -455,6 +459,14 @@ S: Maintained
>   F: hw/arm/integratorcp.c
>   F: hw/misc/arm_integrator_debug.c
>   
> +MPS2
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/mps2.c
> +F: hw/misc/mps2-scc.c
> +F: include/hw/misc/mps2-scc.h
> +
>   Musicpal
>   M: Jan Kiszka <jan.kiszka@web.de>
>   L: qemu-arm@nongnu.org
> 
