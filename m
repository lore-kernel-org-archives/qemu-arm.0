Received: by 10.25.208.211 with SMTP id h202csp298550lfg;
        Thu, 17 Mar 2016 01:48:58 -0700 (PDT)
X-Received: by 10.140.43.229 with SMTP id e92mr12324810qga.98.1458204538434;
        Thu, 17 Mar 2016 01:48:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197si6583203qhc.123.2016.03.17.01.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 01:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agTc2-00039K-2P
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 04:48:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTbw-00035O-A7
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTbv-0006U4-GZ
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:48:52 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTbv-0006Sk-Bv
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:48:51 -0400
Received: by mail-vk0-x229.google.com with SMTP id e6so93485486vkh.2
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F0uyhJ1Zw+hrnl9WCHPrrTfvbzKzkWDpvww1Ip8PzzM=;
	b=QUbjmqkQKw4/V9+rw2mZnkTl/NUILi0l5YPz9qjs8q8P8kvY8Y+y/KjaPO0DLQB+IV
	ynIXJ3nocyHKf3UoDr/gG2BSNgNlhqDxoJiUwk78EBhdXMz5kn6KcpyBsfcZcrNr9zIS
	nZ1YpRyBRv5JbK4XCecM66Sg0PjOhfPZO35eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F0uyhJ1Zw+hrnl9WCHPrrTfvbzKzkWDpvww1Ip8PzzM=;
	b=jNOGOdXh03OgXfXm515TcBjF+Cty5JJQWj/0+5P9i2bWlwPObgW+pivuUJkkCOreve
	2W4LV/WUOKJ6cDd/IM6vvLflfLktaY3ZfZX+aRMCGnnyIwkVMfqORrcM3+XdG9kQ0Wrr
	CTklAHdXZScHmo/e+6wGsGkz/OFV/4i4QYAzGCPpLlgr6FLNKSgDhOcjMY+0l2ztNKBu
	bS9lFT+h+CwA1zgdGweNHM7nM6STyuM6CZ+3X3PkK6pqfIMU+EfdCeLJFASsNKFoFWW0
	eLEmTQkGXuhybFSJczu31nhJFOdSLXaT/Q3VnaHZRaJabmRcWP4tevKrgrvYZeg4f9ZS
	5i5w==
X-Gm-Message-State: AD7BkJItF4e/oOlHBHOVC3YwcMaXlrBpBzQqeTj/O/5XFtoaSvPcak8GrRz6yNvgrSiLfoy8Vnc2IJRt23MJRtf0
X-Received: by 10.31.3.193 with SMTP id f62mr9280411vki.27.1458204529729; Thu,
	17 Mar 2016 01:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 01:48:30 -0700 (PDT)
In-Reply-To: <BLUPR0301MB2034B9E6F037E31B3AC6E3619E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA_6NvDW4LYHTmcuH3j07zQds6gH=J2FC4zV9JDg13JWwA@mail.gmail.com>
	<BLUPR0301MB2034B9E6F037E31B3AC6E3619E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 08:48:30 +0000
Message-ID: <CAFEAcA-sUK0YjH0VzNJv=ovkj6HkAYyCWUFwuSP_BqFfdNYH3Q@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 0/5] Raspberry Pi framebuffer,
	DMA and Windows support
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
X-TUID: FQB/OIDeBIM0

On 16 March 2016 at 23:01, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> However, I don't seem to be able to repro this. What exactly were
> you booting?

This was the Ubuntu kernel from the 2015-04-06-ubuntu-trusty.zip
which is linked to from https://wiki.ubuntu.com/ARM/RaspberryPi

thanks
-- PMM
