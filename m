Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp47216wrq;
        Thu, 14 Jun 2018 14:54:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLpg2oOMaP1KUCHFvTDPN+9kaHORqS5rm09xmrkOceQ8TFZZsm9n0FtpEK3wA5WEcmrqEyu
X-Received: by 2002:aed:3ec9:: with SMTP id o9-v6mr3951282qtf.242.1529013292793;
        Thu, 14 Jun 2018 14:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529013292; cv=none;
        d=google.com; s=arc-20160816;
        b=z19m2D3+1YVsZ6Gd1LctRKK1+YQlHgwitiHyj8JT+n/I0QojkZofSqKSNMPH2H5Rqb
         9fP9iGldWp8LsaGXbkx25yt85YvzLLDR16+pbxy5VK39Em6MUBxyWyFNOBKh2ix+geYi
         G2MgK9q0YVIk9wzJsMD1YpmCyFWNz9dS/hgVX1vLLXCXod3CETe660d3DmV0a5wO486V
         VV6p2NhJO34+JJoBnXGWrCnm9roWy3X0OzkjzTJD9GADFKQhO4jG9nJhqgW3fQBoQj/v
         3FobQezpvpEzLptFBTj3MENVJiY/IAOABn+CyPhGFJGaRvMBByEq9u5DcYxlwnsKkipw
         93eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent
         :content-disposition:mime-version:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=mCO19KF3BxaT0CNa5HIuOcy7GrlZ9z0Q2XvkQr3NBAU=;
        b=VkWKS6ZyqObeodlhTdoeJhI7j1sjLMsu2aJONhQLB+2g/4/KiqcTxkvOKQO0fWcbvM
         p0JCYVNVobfLMXPSIaOyMFDc8D9tdA04+t4jwYYadgZrL/MJ6eiiq0qJdSVX+RF/ObvC
         KxHAvMT7UEltjh7610KxHnq27zKmx57oIY6t3EUY+PmfwmGm0Z/NnfQIyismgaEz23LM
         tvOFKWGAwq/SlyywEYIZHXZIMnTXHjmO/n6a3a3lxikvgeiXxSXP4OYYnuuFQoQLH39j
         9qleRUQ5SQODJZYMiVvNUq6XyKZ/R49+xlvHYCBLysn0+fjYI1vdHNxiVlh8+q6582MQ
         bkkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=PdFBglIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a17-v6si3884966qkc.297.2018.06.14.14.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 14:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=PdFBglIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTaCi-00024o-AU
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 17:54:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTaCV-00023d-92
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 17:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fTaCR-0005sv-EA
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 17:54:39 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:34084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>) id 1fTaCR-0005iO-6x
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 17:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
	To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mCO19KF3BxaT0CNa5HIuOcy7GrlZ9z0Q2XvkQr3NBAU=;
	b=PdFBglIJ1otD+FGD8irsWk4Wp2
	Z8vtcElbr/cmWQIjkptpiHAvrYdbN/wVPz8RD5IaWNBq4r/4eyrP1wB9D9kjyox4ez/RlRUujj3qx
	G/57Trjz90K6nNcKY0RBv9l8pOA8W+U4dUl+y7TUTGPaboOIrA9X9JNsJa6y/nPxIY7aWrTM3LdaO
	dO29LvbSOGVPWzZ2lDIQNiKVXMV0ZGWgRh6o7svNnN8U1GFCPFkJI7EVQ+agM1bX84Op2/fP4wbWI
	6dJwsmss5uQJcIYvowhW7eEfvUO8cRrd+7eXr8xfJgRjVSYj/5k43m7NldsChOTWsj2s9QpLEZv6I
	0+Vw2vpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:40782 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fTaCF-003Cdb-BM; Thu, 14 Jun 2018 21:54:23 +0000
Date: Thu, 14 Jun 2018 14:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-arm@nongnu.org
Message-ID: <20180614215422.GA29690@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Subject: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fgifUE9SmzFN

Hi,

qemu supports a number of boards with Cortex-M3 CPU. One board supported
by both qemu and Linux is an385.

As part of my kernel testing effort, it would be great to be able to boot
a non-MMU kernel. However, nothing I tried works.

Is it possible to boot a Cortex-M3 Linux kernel with qemu ? If yes, does
anyone happen to know how to do it ?

Thanks,
Guenter
