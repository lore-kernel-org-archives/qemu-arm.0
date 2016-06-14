Received: by 10.25.21.96 with SMTP id l93csp36898lfi;
        Tue, 14 Jun 2016 04:36:35 -0700 (PDT)
X-Received: by 10.140.81.18 with SMTP id e18mr14070157qgd.60.1465904194890;
        Tue, 14 Jun 2016 04:36:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j66si2360209qgf.11.2016.06.14.04.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 04:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCme2-00078t-A9
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 07:36:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCmdx-00078J-3o
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCmdr-0002az-Ij
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:36:28 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCmdq-0002al-FI
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:36:23 -0400
Received: by mail-vk0-x229.google.com with SMTP id t129so89125347vka.1
	for <qemu-arm@nongnu.org>; Tue, 14 Jun 2016 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h+trSUBpf3HFuZstp7TXMBII0bAurGmlDKSOUM0UalA=;
	b=QOnH+FhberziZUf9se1ccFVfISmmXfK7Kgf2/g27YupBXblqOxRMPAWnjAeFOwc0lR
	ZwOLju9nBqmPoNsX583ew3j6Pk2xzwcYtka6PmejDhunhS13uRa9moD8CGFC7FQdWo1G
	vz/lgpN+/5T7pvMiXKPYiNj+NdffJNsABTVbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h+trSUBpf3HFuZstp7TXMBII0bAurGmlDKSOUM0UalA=;
	b=QaQWYSeTFn3xtV9ohrJMRms1RtTKop95PkLwFEV7lhNH3nl/d2Tj9P5X6jnEA7zphD
	0+Gp9yKcp3I9okFA4wXCLFIqTDUjQg4GbkcMP4kuw0a6iCwdu2MeWWC/cqlXWqX+rfAh
	BR7vpLP4/2x9f2QctgWLv02J+a4Db32fRC8YWTZ2qgmWGL6sPFfaxveK0yPZQGa+rSpp
	ePxnVca4MATcKG4ciEjPuLjLIWlYl0V8W12ie58VYric2gY41v3NLLKKWXxqtu8+NmUo
	CZG95hSbkXQAbRz88uHPDAtTTpf49s/X8WfCWFiMFK37tA39QTa0QJykTWtMTOQCkwLu
	F4Tw==
X-Gm-Message-State: ALyK8tI1Vw/gUgTt5II/ddPQYjouLmNdOeaNa9kxw1A01fjPfsItl4KQxBI/NMPhwFMFjPuJdVmPvMoug3wil3V5
X-Received: by 10.31.142.202 with SMTP id q193mr8775111vkd.37.1465904181631;
	Tue, 14 Jun 2016 04:36:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Tue, 14 Jun 2016 04:36:02 -0700 (PDT)
In-Reply-To: <CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 12:36:02 +0100
Message-ID: <CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
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
X-TUID: BA0DndGJH2h+

On 14 June 2016 at 12:14, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Jun 13, 2016 at 3:40 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 13 June 2016 at 10:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 13 June 2016 at 10:08,  <vijayak@caviumnetworks.com> wrote:
>>>> +/*
>>>> + * Holds TARGET_AARCH_64_PAGE_BITS or TARGET_ARM_PAGE_BITS
>>>> + * based on the the cpu type emulated at runtime.
>>>> + */
>>>> +static uint32_t target_page_bits;
>>>
>>> The CPU page size is not specific to the 'virt' board, so this
>>> is the wrong place to do this. You should identify the
>>> page size in arm_cpu_realizefn() based on the set of feature
>>> bits the CPU has: anything with ARM_FEATURE_V7 has a 4K page
>>> table (this includes a lot of 32-bit CPUs).
>
>   cpu_init and cpu_realizefn() of required cpu model is called in
> machvirt_init(),
> which is quite late in the initialization sequence.
> The cpu_exec_init_all() which calls memory_map_init() is called very
> early stage,
> is where TARGET_PAGE_BITS information is required.
>
> In order to get feature information of CPU early, one option is to
> create cpu object
> early, initialize it. This means moving some cpu object creation and
> initalization
> code from machvirt_init().

It would be better to delay the point at which we allocate
the data structures which care about page size, rather than
moving init of the CPU earlier.

Also we should consider what happens if we have decided
the page size is X, and then a CPU is hotplugged which
requires a page size Y where Y < X.

>> Actually that should be "with ARM_FEATURE_V7 and not
>> ARM_FEATURE_MPU", or we'll break the PMSA code.
>>
>> Note that you'll also need to handle systems where the
>> different CPUs in it disagree about the preferred target
>> page size -- the xlnx-ep108 board can have both
>> Cortex-A53 (prefers 4K) and Cortex-R5 (prefers 1K) CPUs in it.
>> "Use the smallest value required by any CPU on the board"
>> is probably the best approach.
>
> How -cpu options are passed for xlnx-ep108 board in qemu command?

They aren't -- you always get the cpus the board has in real h/w.

thanks
-- PMM
