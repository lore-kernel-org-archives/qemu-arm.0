Received: by 10.25.21.96 with SMTP id l93csp28765lfi;
        Tue, 14 Jun 2016 04:14:36 -0700 (PDT)
X-Received: by 10.200.42.68 with SMTP id l4mr18588960qtl.73.1465902876654;
        Tue, 14 Jun 2016 04:14:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si18003972qtb.131.2016.06.14.04.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 04:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCmIm-0002RK-1g
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 07:14:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bCmIg-0002Qf-9M
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bCmIf-0006Qa-30
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:14:30 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:35078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bCmIe-0006QT-U3; Tue, 14 Jun 2016 07:14:29 -0400
Received: by mail-oi0-x229.google.com with SMTP id w5so171728217oib.2;
	Tue, 14 Jun 2016 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g22QBVZw6waniQ6kCpZUjwACt2W4FQU6d0L2WKQ9bzM=;
	b=gO8advWymubRK6JZcTSQ+KHN/v5UFigSa/LvHgMo1CySaFymCV34TweOaMZY2wsqQn
	BYK9HO03LhoSKyAVzU5f5PphiCkhbVgWc/a41+hEKBW3/x+cI6XdHe9lhFEKGehR8SMZ
	yWsRyTYbTlucbV8pj66Juv0fnu7Yc7QUs8rVd9OiSMkeCU0Fxj3cfohQbDDciQJFQ0Jr
	Q2c6A90LsnRXfuT+TrMbFsviyT0vL4kCdPvW5DxDYbWLLtzwO+CgGHY/kuxADkpELqzY
	zeK81eVUYMSkIE3rrSYf/MlMCdTiKlvR4ScwlCGEXsjmSk8H9KBVi20Um9BsxzJkls7W
	Z0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g22QBVZw6waniQ6kCpZUjwACt2W4FQU6d0L2WKQ9bzM=;
	b=UP479P0xTbNhiCi7NsYwkWdEEMKFPaw8UaF6DQs3AUbyHpHzTpthQnEAf3rLMFSvsr
	ZHkw7yalohDqrNSyyDyelFHy+N0T6PARufAurJHKp72T1AYnqP1CyL1sQUV1qrjZQw7H
	q+YHAf2FVnT/FYtlgHcGJAFDkuKmqlZ6zECsq4YmNXtaH9JTAaDeln804kKfjyKPMp+j
	jCCRzoRhK49xqk1Kjg9oeGx3qy2tiTY12TOUbJzS9l+XCzUW0WHoU7rL8WwZDZk6X6TR
	4JsdPH7pNG14OnVmmHkfM0lNQDfVh7txd7tZrjxkofXc+hF/bovZ1dVJu7iO5oSPgNTh
	JGYw==
X-Gm-Message-State: ALyK8tIuzpOYPr9OThPa81lVVKjV4bZU6k1nKjjyU28yHn+/FVJTRLjwvMINRpUKDmZu/nKDobDGbgewDiPLOA==
X-Received: by 10.157.7.11 with SMTP id 11mr9088423ote.145.1465902868032; Tue,
	14 Jun 2016 04:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Tue, 14 Jun 2016 04:14:27 -0700 (PDT)
In-Reply-To: <CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 14 Jun 2016 16:44:27 +0530
Message-ID: <CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
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
Cc: Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BVO67chCXBTz

On Mon, Jun 13, 2016 at 3:40 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 June 2016 at 10:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 13 June 2016 at 10:08,  <vijayak@caviumnetworks.com> wrote:
>>> +/*
>>> + * Holds TARGET_AARCH_64_PAGE_BITS or TARGET_ARM_PAGE_BITS
>>> + * based on the the cpu type emulated at runtime.
>>> + */
>>> +static uint32_t target_page_bits;
>>
>> The CPU page size is not specific to the 'virt' board, so this
>> is the wrong place to do this. You should identify the
>> page size in arm_cpu_realizefn() based on the set of feature
>> bits the CPU has: anything with ARM_FEATURE_V7 has a 4K page
>> table (this includes a lot of 32-bit CPUs).

  cpu_init and cpu_realizefn() of required cpu model is called in
machvirt_init(),
which is quite late in the initialization sequence.
The cpu_exec_init_all() which calls memory_map_init() is called very
early stage,
is where TARGET_PAGE_BITS information is required.

In order to get feature information of CPU early, one option is to
create cpu object
early, initialize it. This means moving some cpu object creation and
initalization
code from machvirt_init().

>
> Actually that should be "with ARM_FEATURE_V7 and not
> ARM_FEATURE_MPU", or we'll break the PMSA code.
>
> Note that you'll also need to handle systems where the
> different CPUs in it disagree about the preferred target
> page size -- the xlnx-ep108 board can have both
> Cortex-A53 (prefers 4K) and Cortex-R5 (prefers 1K) CPUs in it.
> "Use the smallest value required by any CPU on the board"
> is probably the best approach.

How -cpu options are passed for xlnx-ep108 board in qemu command?.

>
> thanks
> -- PMM
