Received: by 10.25.208.211 with SMTP id h202csp2707704lfg;
        Thu, 3 Mar 2016 05:51:18 -0800 (PST)
X-Received: by 10.55.72.12 with SMTP id v12mr3054573qka.100.1457013078599;
        Thu, 03 Mar 2016 05:51:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si41129396qkh.18.2016.03.03.05.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 05:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abTev-000277-Kc
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 08:51:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTet-00024G-2p
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTer-0006xa-Vi
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:51:15 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTer-0006xP-Q6
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:51:13 -0500
Received: by mail-vk0-x235.google.com with SMTP id e185so21729308vkb.1
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9d69vhh1fb4q7627RhjBnVt7orE/VH6YmxKPbDGHyo=;
	b=fXHjK8IReaoDAOtS326l7fmiDvNQs4oXX123FFRWVps8gRkGXIkjg3qOhP76hMXWm7
	z4Rce6XUhdYz5+Dw26Jc+4tu+EM1Z4voLinqduXISbHeU9zU569cV8m/BN6It21QRhW9
	oVB2Dh1fjQ0NwwP7RFy7652OZp8TlAF8AQhMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9d69vhh1fb4q7627RhjBnVt7orE/VH6YmxKPbDGHyo=;
	b=HJc6zo7+9AQ7Lc7dHIPn4bzmhW7QNgU6dlr03Y1s9ridd0Fd62nqnvUZVoPTRdnwpJ
	zy9gtOjpPPVL/WlNVPA73WEc8Rv9LwhNQMxP/Xk32sUEivHn6xepVXw1rRdtSb2JwoZi
	SetlgKSx/uXE7TH7xUdDL0h+qtGSTfT34mf8qroIjVyzmffIVJqDEz2x5BdNeRaP7BYg
	npyUWJoymAckH4vEmnCmOjhwAGy3ruA+mty+27oE+HLTS7WGsVfMbHhQWfGkO9pyVp1r
	2LjU25kspt1D3RrornlprFCYfo6UIKqUy+KLTmGR1xQYPsZLWC/DDJb0M+2t8ylRrAiH
	8PGg==
X-Gm-Message-State: AD7BkJLQo3phvFST3tdT/1AKQBEeMdLDYJ1sBDMph+UtF+I2iVcAssTaSfBikXRHGP4HsOnOWo6DNFIjs/eE1oyV
X-Received: by 10.31.194.130 with SMTP id s124mr1955972vkf.92.1457013073087;
	Thu, 03 Mar 2016 05:51:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 05:50:52 -0800 (PST)
In-Reply-To: <56D83FA6.6090507@codeaurora.org>
References: <1457007078-31387-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA_+dZYr=m3ZYOR+qfwFsXn3QuLyMxgrcAR2_FfX8RFTrg@mail.gmail.com>
	<56D83FA6.6090507@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 13:50:52 +0000
Message-ID: <CAFEAcA9QgkXRg=wUGe+BHchE8Z0TyNb1ipEX7uGBYttMnVWF4w@mail.gmail.com>
To: Christopher Covington <cov@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] linux-user: arm: Remove ARM_cpsr and similar
	#defines
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
X-TUID: 1Zc7yZesCsZ1

On 3 March 2016 at 13:44, Christopher Covington <cov@codeaurora.org> wrote:
> On 03/03/2016 07:18 AM, Peter Maydell wrote:
>> Typoed qemu-devel email address again, sorry. I must figure out a
>> way to automate "cc the usual suspects"...
>
> git send-email ... \
>   --cc-cmd='scripts/get_maintainer.pl --norolestats' \
>   ...

I mostly don't use that because I think it ccs more people
than I would prefer. git send-email supports an alias file,
though, and so I can now say --cc=qemu rather than having to
type the address in full.

thanks
-- PMM
