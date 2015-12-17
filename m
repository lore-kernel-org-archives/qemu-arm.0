Received: by 10.182.158.201 with SMTP id ww9csp498686obb;
        Thu, 17 Dec 2015 08:35:10 -0800 (PST)
X-Received: by 10.55.79.69 with SMTP id d66mr68989752qkb.76.1450370110383;
        Thu, 17 Dec 2015 08:35:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b204si11953469qhc.70.2015.12.17.08.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 08:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:54650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9bWH-0006mc-VD
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 11:35:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a9bWD-0006h2-Uk
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 11:35:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a9bWA-0003bZ-2L
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 11:35:05 -0500
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:33923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1a9bW4-0003YN-H7; Thu, 17 Dec 2015 11:34:56 -0500
Received: by mail-oi0-x236.google.com with SMTP id o124so45567484oia.1;
	Thu, 17 Dec 2015 08:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=iaBlT/7NNBtJNOg8bEnYmI6regnYSK1rGSFlyHQo7wA=;
	b=0ziDIABCdNJUm0/ZGgkNwUzp3zsFYqIwrb9fRW/g203hBWMUZHR9vlSkRI+ccWSiQM
	sC3RDd5LmtnSf+aoEt1ovd1ozE9Og+6YUAZPCe7OFEVcVOFI03SJ4glPp3kI1aNWqAyW
	Hd6iVlf54TCYULMt+cmeEL4eS+fDvW/hd+F8V/C3wxkDVidW12b/x26ORTjdW/zZnWEd
	ND6zRR6PTa+SH4Y8YQ/QIc1MjSLPzWeFaEIu8zTPqwKg8046OSM1Jq1IuZpObTfGbf2z
	xFMWe5LXeRDzrNd/woDjsCYa3xrZT7ywzUqiPlVIpldgw46vPJ4q39PxOcaBbkCg4+A4
	7t9w==
X-Received: by 10.202.82.214 with SMTP id g205mr9202724oib.118.1450370095957; 
	Thu, 17 Dec 2015 08:34:55 -0800 (PST)
Received: from bigtime.twiddle.net (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86]) by smtp.googlemail.com with ESMTPSA id
	m2sm3026534oia.7.2015.12.17.08.34.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 08:34:54 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1450354795-31608-1-git-send-email-armbru@redhat.com>
	<1450354795-31608-2-git-send-email-armbru@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5672E424.8090008@twiddle.net>
Date: Thu, 17 Dec 2015 08:34:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450354795-31608-2-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::236
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@pond.sub.org>
Subject: Re: [Qemu-arm] [PATCH v2 01/13] hw: Don't use hw_error() for
 machine initialization errors
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
X-TUID: ykzIYVMpKUyy

On 12/17/2015 04:19 AM, Markus Armbruster wrote:
> Printing CPU registers is not helpful during machine initialization.
> Moreover, these are straightforward configuration or "can get
> resources" errors, so dumping core isn't appropriate either.  Replace
> hw_error() by error_report(); exit(1).  Matches how we report these
> errors in other machine initializations.
>
> Cc: Richard Henderson<rth@twiddle.net>
> Cc:qemu-arm@nongnu.org
> Cc:qemu-ppc@nongnu.org
> Cc: Guan Xuetao<gxt@mprc.pku.edu.cn>
> Signed-off-by: Markus Armbruster<armbru@pond.sub.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/alpha/dp264.c          | 11 ++++++-----
>   hw/arm/highbank.c         |  6 ++++--
>   hw/char/exynos4210_uart.c |  9 ++++++---
>   hw/m68k/an5206.c          |  4 +++-
>   hw/ppc/mac_newworld.c     | 11 ++++++-----
>   hw/ppc/mac_oldworld.c     | 16 +++++++++-------
>   hw/ppc/prep.c             | 11 +++++++----
>   hw/unicore32/puv3.c       | 10 +++++++---
>   8 files changed, 48 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
