Received: by 10.80.166.35 with SMTP id d32csp1081434edc;
        Fri, 28 Oct 2016 03:09:50 -0700 (PDT)
X-Received: by 10.55.44.135 with SMTP id s129mr9943744qkh.7.1477649390576;
        Fri, 28 Oct 2016 03:09:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v37si1100157qtc.86.2016.10.28.03.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 03:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c046f-0005lG-Ay
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 06:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c046a-0005jp-3y
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 06:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c046Z-0005BQ-4h
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 06:09:44 -0400
Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244]:33496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c046Y-0005A2-Ti; Fri, 28 Oct 2016 06:09:43 -0400
Received: by mail-ua0-x244.google.com with SMTP id 20so2440657uak.0;
	Fri, 28 Oct 2016 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4ICDilqtAK7W0fFZoK4lQnWcEakmNEwIu9PqNERCQh0=;
	b=ttB7nJbEmOuoxt3RzprBC/hHnHEFf7V9pLBCkG/Ac8WizqGPJWFTkBYbQc52+nljyf
	yMkMyxejdRbopNolm14ofYsM7Bl+WkzwG1nEK7+Oa0pCXhEUDehB1/GWdu534axvR6Mz
	Di2cuBVJuSB/m8pc3a1hzJAhpeLQqNGRxdZt1v0wbbnqYtqjQjRa7LQiGCykifdbFnTE
	RPSAdl6oH59H83CAly9I/ENf0ifW0nLfg6w5SgrbcC16CM6PqtFLa4Qkre6dnjqRio/B
	Hiy+YnFOobkPyCaljmH5Kl5aAW4tbDqKuKZ2s12J8Q1mfJzRd1T3FqlG3GWYaQ4nmNtN
	Fmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4ICDilqtAK7W0fFZoK4lQnWcEakmNEwIu9PqNERCQh0=;
	b=XOpndRjrKTFodybmBblappaOMSYiYfbZs+Dj6+6YObFvppbO1REA8ynHD4JUadX98/
	27usnAG2bvP33WT4F2xfAsgYm5Fquo7VS27LZ+ErEw3cg7PWzGCOCf0mJ2L3Othhq7Rz
	Oj1cW7uGMsGHneVXk3r2pB//uLeZy5jlzXhN0I1WIKFIMQRLPvVqsaPJ0wyONlpahoHT
	MGRgZO97aYxsrfuVaICW8nRjaI6EZlMmhskElsGejcWbXlxjedd4cWUHx78gwhgxcfEn
	NPVBT1/+A2pHXZkxww8aJbY2nr6x/mXeA3cr5y1xRfX3Bni4k3rs2omCgkdckcHYOd0E
	cNWg==
X-Gm-Message-State: ABUngvekMvFt0VP3OO9T96q43DviKw8i7n2Q6d/lmFCg8yhAym7nrkAXh4umxjgrmxCZqLOztLC7P8aAwR+9xg==
X-Received: by 10.159.55.229 with SMTP id q92mr10113905uaq.89.1477649381679;
	Fri, 28 Oct 2016 03:09:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Fri, 28 Oct 2016 03:09:40 -0700 (PDT)
In-Reply-To: <CAFEAcA_AFW-N5siUp1+kM3Z2+ixwKbD35YK+97tCX-g3ENXpPA@mail.gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
	<CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
	<CAFEAcA_AFW-N5siUp1+kM3Z2+ixwKbD35YK+97tCX-g3ENXpPA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 28 Oct 2016 15:39:40 +0530
Message-ID: <CALicx6sgPM_qBnnYGCsRk8XUarKZSiOJEJGTgjYOppzquAj70A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::244
Subject: Re: [Qemu-arm] [PATCH v4 2/3] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: em3aKw2y69i+

On Fri, Oct 28, 2016 at 2:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 October 2016 at 08:00, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Thu, Oct 27, 2016 at 9:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
>>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>>
>>>> Add helper API to read MIDR_EL1 registers to fetch
>>>> cpu identification information. This helps in
>>>> adding errata's and architecture specific features.
>>>>
>>>> This is implemented only for arm architecture.
>>>>
>>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
>>>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>>>> index 36c7dcc..d14a455 100644
>>>> --- a/util/Makefile.objs
>>>> +++ b/util/Makefile.objs
>>>> @@ -37,3 +37,4 @@ util-obj-y += log.o
>>>>  util-obj-y += qdist.o
>>>>  util-obj-y += qht.o
>>>>  util-obj-y += range.o
>>>> +util-obj-y += aarch64-cpuid.o
>
>>>
>>>> +#include "qemu/cutils.h"
>>>> +#include "qemu/aarch64-cpuid.h"
>>>> +
>>>> +#if defined(__aarch64__)
>>>> +static uint64_t qemu_read_aarch64_midr_el1(void)
>>>> +{
>>>> +#ifdef CONFIG_LINUX
>>>
>>> When will CONFIG_LINUX not be defined but __aarch64__ is?
>>   The contents of this file is compiled only for aarch64
>
> Your makefile change compiles it for everything.
>
>> and hence
>> all the contents are under this __aarch64__.
>> Also the code is only for linux, have added CONFIG_LINUX.
>
> ...and you haven't answered the question: in what
> circumstances could __aarch64__ be defined but
> CONFIG_LINUX is not, ie why is there any point in
> checking both defines?

Ok. You mean __aarch64__ and __linux__ both are defined by gcc.
we can rely on __aarch64__ define  here?.

AFAIK, the caller of this function bufferiszero.c is compiled
for everything, I case of bufferiszero.c is compiled for other than
linux for aarch64, compilation might fail. In such case, the header file
needs to have dummy/empty functions.
