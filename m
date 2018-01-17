Received: by 10.28.173.206 with SMTP id w197csp5406250wme;
        Wed, 17 Jan 2018 07:36:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBosw/E/uCiHHBX1gwbpZvXa+rVHtqsYp63uGkCH8Y2nJIwBbCu31FoI1S/zYFa6GjDlSwF7d
X-Received: by 10.129.114.133 with SMTP id n127mr2969964ywc.296.1516203385575;
        Wed, 17 Jan 2018 07:36:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516203385; cv=none;
        d=google.com; s=arc-20160816;
        b=jDyNyXsO2jbkaRM238em/KMuBjH99+DJUjFLaWIRaLrGQ66r7KyOKiIfeJtyTAGpGO
         Tw3EEXAEAc0P8xU3efnzZU/BuVJDyMmfuh8re/T8i8wHHRR3DOscuGeN3tP4UyXkHz6L
         NCC7lbpZ4Tmer5xdVN4KjxZrMlkR1taJNnuon4JoPQ4hInBxdNzM9W6dyzCzOKUlXPsK
         rXI0KsXQwRV44Y2kp203tSakP9kbDT+q7usBiEc+sGDvMuN6cNq8aGYAIyCiF2KdZh1e
         5CQ5bJOUOYirecNNQnpRttZoDjAfItrII8sqy9goR6mIaHf8T5MGSAAghRuc+dmmRcsy
         3Vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CZJIuA88a4g9jFFSJks3x3/AmH4525i9Ht62NR+efoo=;
        b=JfBVkYEqVaw/jdN87ZW4sAVFnWWmbBJGqVnSH3hAKM2qEPFuk2PBbICAm8/Jpuvqq1
         ZKKmVcDOEMJzkUMxXnK5UziGxIz0Q7mYJE+3nu43dFzTtsKoq2O8kUPiTk3SK4NFrk3B
         /T/AANLx3i6qReRJE8UhV8uOy+4b3Izbo9QkkdEuGU45GXD6VACWM4UavDUsNl3PN1Nf
         efcM9SGMxHZfW/u3BiKdvQkETb69QMCofTd0wtuFBKw9rT/CMcWDbiXTpDtnspYH8wJu
         N8dKZpqMK/ivQMusHfzq0K66besfnVEoCOIYzULt+n4zDj/dCgyQsM0gjtHPO+c8sV9c
         olrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KfCsj7nj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si1202236ybc.308.2018.01.17.07.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 07:36:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KfCsj7nj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebplJ-0007rV-2A
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 10:36:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebpl7-0007qJ-1l
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 10:36:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebpl1-0006ta-6M
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 10:36:13 -0500
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:44532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebpl1-0006su-1t
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 10:36:07 -0500
Received: by mail-oi0-x231.google.com with SMTP id g128so13371967oib.11
	for <qemu-arm@nongnu.org>; Wed, 17 Jan 2018 07:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CZJIuA88a4g9jFFSJks3x3/AmH4525i9Ht62NR+efoo=;
	b=KfCsj7njkniQmSEKxK3IVrvDExcQ6dW1HXCHD4yr0cW3WohiGrRHbz1MmW2FhxEG5z
	DhJyUuHbUsEDw6NFOY6fDPzsruMRyRzfI9RneSFe4A4P70riYDH0vuOHT5GhlzARuEe7
	e5FTUmiJocsT9mFwKLHYF0btdmG3SNZxZmAJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CZJIuA88a4g9jFFSJks3x3/AmH4525i9Ht62NR+efoo=;
	b=epASHH8NB5EilaS42/KyuFjlzG0CMHOrszuzlozE5+8u9A6+pqdvX27G8/P0SCgjxY
	UyQ5t9kUoOGlQ8dUV7WHKGYhKOq2TTM5S3ZINDjQrWJNTzYEhoGGb7zl3V2kIh2P5JK6
	01nBUjSxc4Nz1LV8JVyBR+STKZAeWQNJAOQ8/6h/dYJe23KUtShqlnwNwaO7aoxcJHn0
	GjTjWiJdWqtoIbdeAmHjqeHrPNrcZlHBMAPOajPGcH3v9pZDOWNidHM/38fHjGpkFQ4K
	ULMPeguB5rpVVXWa+ttMbb1A1ghQ6RwkbAhmjQ4VZ1nb8nb60LCqQcBZf/1yyiEmOc30
	vg1A==
X-Gm-Message-State: AKwxytcnTBb03Hs0VeU2Zulv6ztAT8KN9bU2hnImSXu0Wzsii036MEmA
	MfvNegigp2V/sv8lHZBJv70oj0tF/lAngnrxnxIO7g==
X-Received: by 10.84.77.6 with SMTP id v6mr1166455oix.8.1516203366138; Wed, 17
	Jan 2018 07:36:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Wed, 17 Jan 2018 07:35:45 -0800 (PST)
In-Reply-To: <b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
	<b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Jan 2018 15:35:45 +0000
Message-ID: <CAFEAcA8Ei8vgOspvy9hBbwQya+gjDq3V8o2NbV8cxvCsw6kycQ@mail.gmail.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 09/14] pci: Add support for
 Designware IP block
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YaWwkJJdpVi0

On 17 January 2018 at 15:23, Marcel Apfelbaum <marcel.apfelbaum@zoho.com> wrote:
>
> On 16/01/2018 16:34, Peter Maydell wrote:
>> On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com>
>> I'm not familiar enough with our PCI code to be able to review
>> this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
>> could one of you have a look at whether this seems to be a correct
>> implementation of a pcie host controller ?
>
>
> Sadly PCI Host bridges do not have a standard, each HW vendor
> can do pretty much what they want.
>
> That being said, if Andrey can point me to the PCI spec for the Designware
> PCI host bridge and what parts they implemented for it I can have a look,
> sure.

I'm not so worried about whether it's implementing the spec for
the hardware (I trust Andrey has done enough testing for that
side of things), but whether the code seems to be structured
the way we expect a QEMU pcie host controller to be structured,
is using the right APIs, and so on.

thanks
-- PMM
