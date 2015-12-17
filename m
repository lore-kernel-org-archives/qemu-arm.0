Received: by 10.182.158.201 with SMTP id ww9csp315769obb;
        Thu, 17 Dec 2015 03:31:06 -0800 (PST)
X-Received: by 10.140.80.166 with SMTP id c35mr38851995qgd.20.1450351866797;
        Thu, 17 Dec 2015 03:31:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w193si10918905qhw.84.2015.12.17.03.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 03:31:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9Wm2-0008Ol-DF
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 06:31:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Wlv-0008N1-0Q
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 06:31:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Wlp-0006D9-Dk
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 06:30:58 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Wlp-0006Cq-Ac
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 06:30:53 -0500
Received: by mail-vk0-x234.google.com with SMTP id a188so45055427vkc.0
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 03:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ITa9C3aCufq7FUUsD7/dwACt1gWJT/W3X0v5BzdaY9g=;
	b=DXdzp0rAvSLsnNptDTVMB22a497sBsand0q4p+JwtQWSD7+ypPDDgmUszzYoeSJl5R
	xqMxeyOpneaPVkgb/It4OaRuj137OsgSjKtgeEYbHaK3OdesvbzKoeYFCpL4cdGZlwqj
	LzgIej7FSEoTst2rIK1yw9VgwFyaYY8qYaIqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ITa9C3aCufq7FUUsD7/dwACt1gWJT/W3X0v5BzdaY9g=;
	b=K0etyiInMhqTgyOVitL+Tv0DCkBHi3AWlKl84BLDs2mwTk3ZxHvUXMdGBL3NJkasj0
	1gi4QLhckbjkC0RNfL/8RNKibO/rBOs1wJF6Nc9osO9yTsy82m3ZMHNbJtt4jcSOWggz
	TNYySJit/eYhooQ5cXwUsggZTS9U6H89WXf4hycuoWUcOSXTzrzNMH11hjXgFeWQGRMw
	evre54d/P3agcpo13dBpbH095h6uK+UjyM89BQiP6Gz7KHxHxwlGDPBa/w/01vRNUCN0
	JZsJHrzKs8P81N6CJwTvGjnDoPV4+tM8TB5H6j+hSdrYMVFMqB0uVm+C4aUNB/kHqQm7
	Fmaw==
X-Gm-Message-State: ALoCoQmeQdGV8fAXM8nKWaQ/CxTYCgAcLSii4AWMDSgR8kJV7IQXYs6q2QtvDnD5pohTxLUpUqK8Y+b1SDed3lQ58xK7x5faGCJK+t+oNVJRcmv0uPVbJjo=
X-Received: by 10.31.107.138 with SMTP id k10mr17207202vki.27.1450351851815;
	Thu, 17 Dec 2015 03:30:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 03:30:32 -0800 (PST)
In-Reply-To: <cover.1449528242.git.jcd@tribudubois.net>
References: <cover.1449528242.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 11:30:32 +0000
Message-ID: <CAFEAcA9REvSHt7LRMu-HAjXNJg-OOCWkKSF0m7H7h__5LGj7kA@mail.gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v6 0/5] Add an i.MX25 specific CCM driver
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
X-TUID: kXmUpbNKesK2

On 7 December 2015 at 22:53, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
> i.MX25 SOC has a different CCM device than i.MX31.
>
> Qemu i.MX25 emulation was built with i.MX31 CCM driver. This allows
> Linux to work on top of the i.MX25 emultion but this is not correct.
>
> Furthermore, other SOC we could emulate like i.MX6 have yet a different
> implementation of the CCM device.
>
> So we split the i.MX31 into a generic base class and a specific i.MX31
> class.
>
> We then add an i.MX25 specific CCM Device and have the i.MX25 SOC use it.
>
> Jean-Christophe Dubois (5):
>   i.MX: Fix i.MX31 default/reset configuration.
>   i.MX: rename i.MX CCM get_clock() function and CLK ID enum names
>   i.MX: Split the CCM class into an abstact base class and a concrete
>     class.
>   i.MX: Add an i.MX25 specific CCM class/instance.
>   i.MX: move i.MX31 CCM object to register array.

At Peter C's suggestion I've applied 1-4 to target-arm.next; 5
is still awaiting Peter's review.

thanks
-- PMM
