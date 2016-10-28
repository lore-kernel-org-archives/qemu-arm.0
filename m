Received: by 10.80.166.35 with SMTP id d32csp1056473edc;
        Fri, 28 Oct 2016 02:04:04 -0700 (PDT)
X-Received: by 10.55.66.76 with SMTP id p73mr10978112qka.284.1477645444323;
        Fri, 28 Oct 2016 02:04:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n128si7553744qka.16.2016.10.28.02.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 02:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c0351-0001FG-5P
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 05:04:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c034w-0001Dw-CP
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 05:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c034v-0000dB-AJ
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 05:03:58 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c034u-0000b9-SN
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 05:03:57 -0400
Received: by mail-vk0-x22a.google.com with SMTP id y123so49861792vka.3
	for <qemu-arm@nongnu.org>; Fri, 28 Oct 2016 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DQBDw0Es1qkyZ7I0QE4waQJaxHrHFbll+PTb4Qyc2H4=;
	b=k2gdcru8EGH0K6Vi48soWSApzwAWvCvHiPviiRGQLzEI1QXZYo5LlRvSNQUMRvMACN
	87UU0sLt2U3W1XN/AJTJTNvqKV6ttkY31jslwhZbYHeZBvAzw0VT86t4HeYQNcbchbcx
	CSkYeApi2FGfKQCDIGjZwEAUG3i6jHcSpR7eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DQBDw0Es1qkyZ7I0QE4waQJaxHrHFbll+PTb4Qyc2H4=;
	b=kU10kCOqBPTNcBfatxidzWZ1w+6Uw0oizK19/7dTjDZPXYOPiFGLQoVGxFr12/IUEm
	6AXu1YIH6U3V5v8TFj3qyuKpRSS65lfE1CQCADEMiZxx8YPLfdCs/gIXkNsJ3uquZMaZ
	xVXDg22pXWJYOxtI+UUDy40hJ1ehtrOw3ZyL6ZK9WkTKUdsKUH3eGgXe6CFVrgvbbTcf
	Q8kt7XCNFXuG77EZE7insXthnaljrY6SSwmBQNa/+1ofQJ5vavQZngA9g6hJwSlR6/cK
	8ki9EpZkcRBj5UjI3aCpYZ/mMMLs5zJO6jUxZPO6t3zy8ry4UgYQurAvMzqVimcbwAtz
	eJzA==
X-Gm-Message-State: ABUngve69hiAAbLEBk7X9Tz5voeLJnGPdU6DqPE7uG/GH1lamaAe92F2VIIO2TLTzuIjGk/mHWjOlcwiqXL+vj+U
X-Received: by 10.31.16.36 with SMTP id g36mr3533566vki.170.1477645435556;
	Fri, 28 Oct 2016 02:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 28 Oct 2016 02:03:35 -0700 (PDT)
In-Reply-To: <CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
	<CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2016 10:03:35 +0100
Message-ID: <CAFEAcA_AFW-N5siUp1+kM3Z2+ixwKbD35YK+97tCX-g3ENXpPA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-TUID: F0lyag3+bjjU

On 28 October 2016 at 08:00, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Thu, Oct 27, 2016 at 9:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> Add helper API to read MIDR_EL1 registers to fetch
>>> cpu identification information. This helps in
>>> adding errata's and architecture specific features.
>>>
>>> This is implemented only for arm architecture.
>>>
>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

>>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>>> index 36c7dcc..d14a455 100644
>>> --- a/util/Makefile.objs
>>> +++ b/util/Makefile.objs
>>> @@ -37,3 +37,4 @@ util-obj-y += log.o
>>>  util-obj-y += qdist.o
>>>  util-obj-y += qht.o
>>>  util-obj-y += range.o
>>> +util-obj-y += aarch64-cpuid.o

>>
>>> +#include "qemu/cutils.h"
>>> +#include "qemu/aarch64-cpuid.h"
>>> +
>>> +#if defined(__aarch64__)
>>> +static uint64_t qemu_read_aarch64_midr_el1(void)
>>> +{
>>> +#ifdef CONFIG_LINUX
>>
>> When will CONFIG_LINUX not be defined but __aarch64__ is?
>   The contents of this file is compiled only for aarch64

Your makefile change compiles it for everything.

> and hence
> all the contents are under this __aarch64__.
> Also the code is only for linux, have added CONFIG_LINUX.

...and you haven't answered the question: in what
circumstances could __aarch64__ be defined but
CONFIG_LINUX is not, ie why is there any point in
checking both defines?

thanks
-- PMM
