Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1509844ivh;
        Tue, 3 Jul 2018 11:50:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcxHQs0mQYrBmLf6a2bmUmohruirbTywt57vHxxjaeV1iX1l2paoGZ83yrxzlalmVlHsTRH
X-Received: by 2002:ac8:1090:: with SMTP id a16-v6mr2494866qtj.307.1530643852546;
        Tue, 03 Jul 2018 11:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530643852; cv=none;
        d=google.com; s=arc-20160816;
        b=UKAuzr8D4uK+XJZtmJTMa03IFRHvb2DldbhXtf59w84WbkwaTIUbfXxfzTNYT05eLX
         vVEF2S3p70z1X555CKuH2qNCh0g6mHeYhj2KpkNalj+UTd/dOrxaIDCucTupALhK/KAo
         +GN8kgzdYBzcEtLoe/tzDmcqXpgH7BIZr3eOt6incbFJrInKBKiCUbx2N21KioMfw3nV
         8Hh6bV6Qxi+vLUFJfJrDFkVyPeqnvCHIdKgPH/ce+u7a78/BcqTfRMZdBhVlKwqYtz7F
         xVbTBic7IyZMXHSfJCwzSmt5sTi7/wGInU0Mn1Un2xrkjTgp7lBx6zPA6s4o041ubYLX
         biRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=DCe2oTGDKiuq7NF9Pjs/mrYQ/zRgKA1n0A7GwtzDXTc=;
        b=QD5kr5PPLo0X99HXxLDyC0AQ1ZtkCbYwIwbzx2ZNm00h2UNuDsBpUc3jNZCP9bXQ9u
         qo7VpjU6yijmzgQ1SFUFgOHFq0FKH14Yjcww7963ypgp2Ee9qX4HmEsIgIWVoVnVXTkJ
         xMpPcaNyQq9R6dhLEx0CCxAr9esiUoPkupqaMQSp5/hkg8hk4aD56DpqGx7VvTCESkkH
         oZWi+/ah7xqf5cSdtdXHJacUPlpQv3lITPrkHpT+nMXqJRHnSk5nWnLr3+AoK2ejsg4K
         8JHBz9MvnXT4WSnJLkteIakxLR62cXt6MgqudS6a04KBAHUyAZ6eUYiaL9yhWSzSvanl
         6PGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=KVgd7blN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12-v6si790823qvn.38.2018.07.03.11.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 11:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=KVgd7blN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faQO4-0004Ww-5v
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 14:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1faQNv-0004VQ-GE
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1faQNq-0005Hx-KX
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:50:43 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:35042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1faQNq-0005H5-Dd; Tue, 03 Jul 2018 14:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DCe2oTGDKiuq7NF9Pjs/mrYQ/zRgKA1n0A7GwtzDXTc=;
	b=KVgd7blNvhmYOPCettxFN8kDxZ
	3lbo5rlA6ETGQlXxPhrhPqtrs6wU2fquiLVakUcW25diT785qk6vFYxeMPzVDoh26N+w34bxPQ8Aq
	L0VeK7myUPK88D1tXMzVaaytYHdhhNnIEJd3Pwj6sAkxwdHactUGMI9TB6hlqPwo/qxamO5ogiq3I
	Dm24Zgw4DUK6CHJZRJ0HkfU0HieK9w91rYwAtbhXED6xY7XKktvwsCbrz380UYKZw5X9Qqi8BJF4L
	+QmyJOTD+HpawP8B+uxO0WlFHcdlE6XBt5SUYaSUf2kftLwtdTLB549SRz8WuQHhF4uqBpcRg0AYh
	aNgbfsew==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:39298 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1faQNo-006XOo-Pp; Tue, 03 Jul 2018 18:50:37 +0000
Date: Tue, 3 Jul 2018 11:50:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180703185035.GB14422@roeck-us.net>
References: <20180703171044.9503-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: Re: [Qemu-arm] [PATCH for-3.0 0/4] cmsdk-apb-timer: various bugfixes
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
X-TUID: Dzs/4MZyftyv

On Tue, Jul 03, 2018 at 06:10:40PM +0100, Peter Maydell wrote:
> This patchseries includes Guenter's recent patch to suppress
> warning messages from the ptimer layer that otherwise occur
> from the way the Linux driver for this timer device operates.
> 
> The other patches here fix more obscure things:
>  * the timer interrupt is only supposed to trigger when the
>    counter counts down from 1 to 0, not if it is at 0 for
>    some other reason like a direct write of 0 to the VALUE register.
>    Handling this requires adding a new policy option to the ptimer
>    code, which is what patch 1 does.
>  * we were incorrectly setting the NO_IMMEDIATE_TRIGGER
>    ptimer policy, which meant we would trigger the interrupt
>    one timer clock too late (when we did the timer reload,
>    rather than on the 1-to-0 counter transition)
>  * if the ptimer had already disabled itself because it was
>    in one-shot mode and had expired, writing to RELOAD or
>    VALUE needs to cause it to start counting again
> 
> Tested with a uCLinux/mps2 kernel and buildroot initfs.
> 

For the series:

Tested-by: Guenter Roeck <linux@roeck-us.net>

also with uCLinux/mps2 kernel and buildroot initfs.

Thanks,
Guenter

> thanks
> -- PMM
> 
> Guenter Roeck (1):
>   hw/timer/cmsdk-apb-timer: Correctly identify and set one-shot mode
> 
> Peter Maydell (3):
>   ptimer: Add TRIGGER_ONLY_ON_DECREMENT policy option
>   hw/timer/cmsdk-apb-timer: Correct ptimer policy settings
>   hw/timer/cmsdk-apb-timer: run or stop timer on writes to RELOAD and
>     VALUE
> 
>  include/hw/ptimer.h        |  9 +++++++++
>  hw/core/ptimer.c           | 22 +++++++++++++++++++++-
>  hw/timer/cmsdk-apb-timer.c | 20 ++++++++++++++++++--
>  tests/ptimer-test.c        | 25 +++++++++++++++++++------
>  4 files changed, 67 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1
> 
