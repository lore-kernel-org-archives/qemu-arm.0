Received: by 10.25.208.211 with SMTP id h202csp1237326lfg;
        Mon, 4 Apr 2016 09:46:40 -0700 (PDT)
X-Received: by 10.141.0.8 with SMTP id b8mr14092767qhd.104.1459788400465;
        Mon, 04 Apr 2016 09:46:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b53si22906598qga.33.2016.04.04.09.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 09:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an7eC-0002il-12
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 12:46:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an7cQ-000834-Iq
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an7cP-00035m-Mw
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:44:50 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an7cO-00035D-GF
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:44:49 -0400
Received: by mail-vk0-x22b.google.com with SMTP id c4so62017668vkb.3
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 09:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IoxTClhdVKa6tBxIJu0UHBT4hOUZxmXowMnM90GHIuE=;
	b=JGcwq3IJybKpyqz09KSqwgRMr9mqhhR1Z29GPhwm6AgdmOeEgmqbzJfJ1Ja1MQyWJF
	z4fxOgzOaeujOCwecp4spzZrSf8QLbj6PUd6+NwXjaYKK4vQ1+HQ2tyQXZIdN4amiBbF
	CTNDJfKS9Llgh0m+4VEALau0nbNGYdHeKFV7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IoxTClhdVKa6tBxIJu0UHBT4hOUZxmXowMnM90GHIuE=;
	b=OSvWRktVG4BiKjGr7juO7dswJihDKRGmSF6B5UhqEsQoU5hSlaNvWBRadPk+1bydis
	Pe0ejW6jLAKwCL9UDPjZKfvs+e/m8bN5YMyZJ0UdaO72C4cliRtn1Tp0QTv3e4wgOCso
	+lC11C5+KYqP2PSPY2PROtXZTlXOdDUjrEclaeKsdciTXKljuGpB4Oxavjf3pMlAWRn8
	0GozcfZcjbhGcxI1BVyL/JhRvPxbThiAI0KilrpomfFn1yuQmtSRROW8o4GfJVqFgPWl
	3mienRzLxanKZjITrO86/u7HXw36g2oS6Jggbn/B4FXVE0yuBZm0Ec1x5xw74NIc/OVx
	oovw==
X-Gm-Message-State: AD7BkJIh5htj/1ABLmLoHNDJ7NMWVJpTt8Kv76kapN4qSYO29R15Vr+rMpBjHK4QLPpRzycA9CkRDPZ5k/D0+fPG
X-Received: by 10.159.38.3 with SMTP id 3mr4786539uag.107.1459788288006; Mon,
	04 Apr 2016 09:44:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 09:44:28 -0700 (PDT)
In-Reply-To: <CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
	<CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 17:44:28 +0100
Message-ID: <CAFEAcA8sCNFY7dF2MSZcELgEfJg9MhNERFAY2ZJrou=e1zKM5w@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] target-arm: Update page size for
	aarch64
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
X-TUID: xR7Rc6NXfYGT

On 4 April 2016 at 17:40, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Apr 4, 2016 at 7:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I agree that this would definitely improve performance (both for
>> migration and for emulated guests), but I'm afraid this breaks
>> running 32-bit ARMv5 and ARMv7M guests with this QEMU binary,
>> so we can't do this. If we want to allow the minimum page size to
>> be bigger than 1K for AArch64 CPUs then we need to make it a
>> runtime settable thing rather than compile-time (which is not
>> an entirely trivial thing).
>
> Do you mean to say that based on -cpu type qemu option
> choose the page size at runtime?

If you want to avoid defining TARGET_PAGE_SIZE to the
lowest-common-denominator 1K, then yes, you'd need to
choose it at runtime. That could be painful to implement.

thanks
-- PMM
