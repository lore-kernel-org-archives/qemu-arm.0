Received: by 10.223.197.9 with SMTP id q9csp1696439wrf;
        Fri, 6 Oct 2017 07:13:59 -0700 (PDT)
X-Received: by 10.200.4.39 with SMTP id v39mr2945756qtg.15.1507299239453;
        Fri, 06 Oct 2017 07:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507299239; cv=none;
        d=google.com; s=arc-20160816;
        b=Lz3SU6yo8HinIwWXtTtT3wMOcQBZr5+apgmoLKPAdNUsbNu8blPTpFJ5JJ9C2I5aM8
         Ia8loCGSldcF3oQBxSvMz5BrYUapyajLWY/nXOXd44K40RwPoMxIxzy2oHRm0ZlseitX
         ud4VfXCMuImnhJyKo07OiDtRDJRBj3Ae9axi/oTNvvHb99CsecIi39HzUNRDQ1bUlKR0
         ppN+j9FumasCPoe7p7yCbds8uvTzh1hfcq/Jg/5wDVneB51zaQ3zyXdtO3Nn9pG+Dvon
         FG3eXCW3Ai1ev/jLvcrJwejk4uMU1fw8KJ8mbThYdnuzuotJQJb407ueCDU0YDHCN1vB
         GzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jIUdAZsohlT6IArq/xp7IW3ebzb4rd+B6ky7VRJUgpY=;
        b=ZDq2UxRI+JqEvMW6jnTZ/UIZSRWIhsX02xpTjNv7kyef6W0WkljLZNMejVQ+DEyNnZ
         2L/ZYxq8XkJckqYWvI0Yv3zDp74tnGyo/u3GkxfSRYMFNphnxYQtR/ZImpByF51cJqeW
         QFSigj+XNJeSgc8LCigRuVA1Qi6Ufd1jFfD5p5SSCzuduEgor+gN4llEPiKg9monKz/u
         Rs61eEqLFQzH9P5pUJmRHwEIckEayoofKsYA9ZfQWjq+dhX04GXipXYBfHd57QiOuCGk
         N8i1nFq8gILdC656RzPhLr+2u3uMWEQhHcdScZvcDZ2yyvIEL686qnyiLgXutlYPuxos
         +6Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R2qpvpe5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m53si99552qta.78.2017.10.06.07.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R2qpvpe5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TO3-0004Ea-0K
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:13:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TNq-0004C6-3b
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TNp-0005cS-8K
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:13:46 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:57115)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TNp-0005ba-1h
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:13:45 -0400
Received: by mail-wm0-x235.google.com with SMTP id l68so8196111wmd.5
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jIUdAZsohlT6IArq/xp7IW3ebzb4rd+B6ky7VRJUgpY=;
	b=R2qpvpe5OaJIpSIuVSMejtaHNm2zbAkRAYbMewINC26pZsUNLgYr4EnqR4ZVccZ59U
	7bspEsNnHFTTMHM2czXp9gjZyRYCcX5LuSgp7Onjy8WgXc55GkXCcuSitm3YyPz35s7U
	EzkIxcZKHJeJB1TkojPpelcxT/qiCtGQ3WDyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jIUdAZsohlT6IArq/xp7IW3ebzb4rd+B6ky7VRJUgpY=;
	b=OoCtHNI8NfunejZfY+2PeP2zLxPTEd4WMoqNbN0Kgag6ZdYPkphw3Vrbz4Gl9i9OLA
	69BB204zbQ252ku5a+MX/BkpsVSAdst/rKGDCtA30O7KfsbDNaiJqUOnJl0Id+g5Rg5d
	JG8umM+XZvZ2K7M4GygMPSXLKm54LyZMc+OXJg//+72wK+9keu2ocBPBhNbr378dBxBz
	GYxuk6Fwi2f5U5puUOfdd6wwLqdqDeefRF49leE11BgD6X4YwooLDAl0MUFN1JZykhD3
	Kc/L7BHQmVVjMgnz4gu+kSLw8cJKQh9ft2Q11Ak1HU2yd5C/xC1qKLPfwJAgmRUXgu6S
	4InQ==
X-Gm-Message-State: AMCzsaVvhnzec9RLYW+W5RABBXPAAd5A+O3M1fWL10MPLUbcIpA/foxe
	9/IbrnzyoAIcj57ataq0doIQKJmxEpsBWA4AWvlDKQ==
X-Google-Smtp-Source: AOwi7QDbDj66+CCpCcubvSBzlRrjKRDxDQdbc5xBk/eLSWsSWySA/AxhuEGEnUBKZ9pG2f9YD0umxHRQbb+iBe811HQ=
X-Received: by 10.28.236.203 with SMTP id h72mr1999849wmi.147.1507299222809;
	Fri, 06 Oct 2017 07:13:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:13:22 -0700 (PDT)
In-Reply-To: <20170918195100.17593-16-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-16-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:13:22 +0100
Message-ID: <CAFEAcA_3vf8=0VhZVWX=1RQBqshvWNgHn=LrUw8BBtkUtDig0Q@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [PATCH 15/17] include/qemu: Add sizes.h from Linux
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+35f3M9Z6M4

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Add sizes.h from Linux to have a more readable way of specifying
> MemoryRegion sizes.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  include/qemu/sizes.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 include/qemu/sizes.h
>
> diff --git a/include/qemu/sizes.h b/include/qemu/sizes.h
> new file mode 100644
> index 0000000000..9aedb9f8f6
> --- /dev/null
> +++ b/include/qemu/sizes.h
> @@ -0,0 +1,47 @@
> +/*
> + * Copy of include/linux/sizes.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

Not really convinced of the utility, and it's gpl-2-only, so no thanks.

-- PMM
