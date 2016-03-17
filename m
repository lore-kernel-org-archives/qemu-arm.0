Received: by 10.25.208.211 with SMTP id h202csp333302lfg;
        Thu, 17 Mar 2016 03:05:39 -0700 (PDT)
X-Received: by 10.55.33.102 with SMTP id h99mr12625307qkh.18.1458209139081;
        Thu, 17 Mar 2016 03:05:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si7250693qge.68.2016.03.17.03.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 03:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agUoE-0007Mv-If
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 06:05:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agUo6-0007Fp-Fw
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 06:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agUo5-0004ZU-HM
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 06:05:30 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agUo4-0004ZE-9z
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 06:05:29 -0400
Received: by mail-vk0-x231.google.com with SMTP id k1so95711098vkb.0
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Nrzvvq7RGozLMcQ6PvDHXMPwcDHofG6S6bkF7DBdqc=;
	b=X4t5tLLfrbuYLW0qHr3u7jSqEw8D/ESuD5PuR5kmG5ZEeRuu2n9hhXw/M9CD9828/M
	zURvpqamQRJv0evAZ/VW5KsQ36Xpb/KftOUccmqSnT57R37U7Edj4s6FvIoXKfFTDX8K
	TNUA5b8DMWCDsv14umP9g7YMwhBauql9G0YqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Nrzvvq7RGozLMcQ6PvDHXMPwcDHofG6S6bkF7DBdqc=;
	b=Pu0+yxVrQZdKf4XCTkaiBivIeE/XMqu0mMI3WKfuoevS/T7epp2tY96BPHWYFK3nJp
	xoRCTdw4xpuYgCxcFkcTlZvWJE2rTc/0XjxwWDBjwF+Rm0undYcCheg9I0/wE33/nSDd
	BBtVPa/JmQo+I1ojdKThb4LWE0SEO5ro7DnlnUmmG2HEAW/rRMK+/4JOQn0yaiGyMzOw
	lDozfES4cQi8xEGkOvMjBEPO/EigLjYXhly43u6xf40zvtaOkyK77FOlyFy7s6IFgP1j
	fkzRDB533/mldWRLXEG1uP6GGB1+jRxBJvyNXYwIHFwq02Erz1LP0oKcHQWzM0yU+NdW
	TsmQ==
X-Gm-Message-State: AD7BkJJLBRx9/J+3MIasOHMCV8nK43MRrqzbqzZ0Bi8XY/wCg24Y9Ms9BBKRfagD0EhN+QUuGuKqUt9fhvi+tA+p
X-Received: by 10.31.141.2 with SMTP id p2mr10584570vkd.37.1458209127750; Thu,
	17 Mar 2016 03:05:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 03:05:08 -0700 (PDT)
In-Reply-To: <BLUPR0301MB2034E6D47DF99360913C5AA99E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <20160316223950.Horde.KwhTM79StVPD_tK29LK3XzF@www.quantumachine.net>
	<BLUPR0301MB20345CF84190AF36081E3C579E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<20160316232331.Horde.17881eG_ZrMF5c2qIT3qgCa@www.quantumachine.net>
	<BLUPR0301MB2034E6D47DF99360913C5AA99E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 10:05:08 +0000
Message-ID: <CAFEAcA-TmZoOUW__7m19JmSWXMBNa-xL_VA4S_sDEvjEQMurrw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Antonio_Huete_Jim=C3=A9nez?= <tuxillo@quantumachine.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] Timer interrupts for -M raspi2
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
X-TUID: cBHR3t3pJYhW

On 16 March 2016 at 23:40, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> Yes, that should work. Bits 0 and 3 are wired up to what qemu refers to as
> GTIMER_PHYS and GTIMER_VIRT respectively. (The other two timers aren't
> currently connected; I can't remember if that's because they weren't
> modelled by core QEMU when I was implementing the device model, or just
> because I wasn't sure how to route them and never came back to fix it.)

Probably we hadn't got round to modelling the other two timers yet.
You want
 GTIMER_PHYS -> cntpnsirq
 GTIMER_VIRT -> cntvirq
 GTIMER_HYP -> cnthpirq
 GTIMER_SEC -> cntpsirq

Currently we have the virt timer wired up right but we've connected the
phys timer to the secure-phys-timer interrupt line, which will be why
it doesn't appear to work. The code in hw/arm/bcm2836.c:bcm2836_realize()
needs fixing.

thanks
-- PMM
