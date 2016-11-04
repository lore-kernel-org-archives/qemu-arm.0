Received: by 10.80.166.35 with SMTP id d32csp1203695edc;
        Fri, 4 Nov 2016 07:54:20 -0700 (PDT)
X-Received: by 10.202.235.143 with SMTP id j137mr14122545oih.62.1478271260127;
        Fri, 04 Nov 2016 07:54:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h22si8400864ote.268.2016.11.04.07.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Nov 2016 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2fso-0003an-RE
	for alex.bennee@linaro.org; Fri, 04 Nov 2016 10:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c2fsi-0003ad-Lh
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 10:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c2fsh-0000VL-QM
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 10:54:12 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:36805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c2fsh-0000Tr-IX; Fri, 04 Nov 2016 10:54:11 -0400
Received: by mail-vk0-x244.google.com with SMTP id w194so3269586vkw.3;
	Fri, 04 Nov 2016 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yJH3kr6IlKXP3qC8rksZP64zL0k8GQFnL2MwvHy/VFU=;
	b=qzThYnJmC/0cBs0KekfQbKlhQwGSPTLjJijDVww2/OnqMs2FPYwRUNoUcCzU1UYdxy
	kgxX4EF534K/roikqRNnRR4wtP0ufVw9/v81GD8lxytenKiMwsHHLpBNP3v7zrOkyaX2
	wNdTkcNDfm1/Z3SI8Y4Zuqh1QWMk8aLap0/5CjYcfUkS+agWQy+KrYDMc40Xay3165Fj
	ewC6DL18e4QOXn7b4f+HfiDXkE0tA02kyfy3LPPVUsTVCZN1HqRb2lC+8rEXldDLD87C
	yMPaR991f2jS4RJnr3SfBGbWfw5z6BOMcrUxVvhdIwMFFh3vwqkoKuM4mRWhoj9Qs6a8
	WoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yJH3kr6IlKXP3qC8rksZP64zL0k8GQFnL2MwvHy/VFU=;
	b=Rno/GUHntqPLbkRMizW8TDVYu8MWoEr2wICW0BNrOlyK/1lgcMin/26BN2RRogGzVe
	VSVjdZyUad0o0NlvDHBJs3Xdn0VTjpPHUKmjrm03Pu58TRFLYMpgPON1VmdpNlgD5Fua
	AgI7Z5tJRiTyuYd2Lo3AvDHLMbbyG2RCTuHZT5M3KMxYGRR8qdER+gE6j41mB/OCGfRy
	5JXCYxwsMYSwCJgLrW6Lth+qBpRQrbi4rFvD+bB7Ud4oysQXgmvGw2Oed9I+jEDUAnHR
	gDXEb2RwkKJDR/SBMLnj8Gmg01qBTWYRGYXmCx9r6bYRq1pzFcQKAEIPs1EocboTf10T
	XvQw==
X-Gm-Message-State: ABUngvfUQWHAdXf1TQbg0W2/ranJnmVzCYRUSz2QfCtrLlZeoqt8Ty6axi7xXvanv4YCzlZcg7IfaS/yGEJTOQ==
X-Received: by 10.31.8.72 with SMTP id 69mr10419064vki.159.1478271249664; Fri,
	04 Nov 2016 07:54:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Fri, 4 Nov 2016 07:54:09 -0700 (PDT)
In-Reply-To: <CALicx6sgPM_qBnnYGCsRk8XUarKZSiOJEJGTgjYOppzquAj70A@mail.gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
	<CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
	<CAFEAcA_AFW-N5siUp1+kM3Z2+ixwKbD35YK+97tCX-g3ENXpPA@mail.gmail.com>
	<CALicx6sgPM_qBnnYGCsRk8XUarKZSiOJEJGTgjYOppzquAj70A@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 4 Nov 2016 20:24:09 +0530
Message-ID: <CALicx6sH_owFkb19odpL77-Nr16aqVKvmTKYaW-HyYR8+vERAg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::244
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
X-TUID: QwZx6ojNhiYk

Hi Peter

On Fri, Oct 28, 2016 at 3:39 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Fri, Oct 28, 2016 at 2:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 28 October 2016 at 08:00, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> On Thu, Oct 27, 2016 at 9:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
>>>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>>>
>>>>> Add helper API to read MIDR_EL1 registers to fetch
>>>>> cpu identification information. This helps in
>>>>> adding errata's and architecture specific features.
>>>>>
>>>>> This is implemented only for arm architecture.
>>>>>
>>>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>>>>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>>>>> index 36c7dcc..d14a455 100644
>>>>> --- a/util/Makefile.objs
>>>>> +++ b/util/Makefile.objs
>>>>> @@ -37,3 +37,4 @@ util-obj-y += log.o
>>>>>  util-obj-y += qdist.o
>>>>>  util-obj-y += qht.o
>>>>>  util-obj-y += range.o
>>>>> +util-obj-y += aarch64-cpuid.o
>>
>>>>
>>>>> +#include "qemu/cutils.h"
>>>>> +#include "qemu/aarch64-cpuid.h"
>>>>> +
>>>>> +#if defined(__aarch64__)
>>>>> +static uint64_t qemu_read_aarch64_midr_el1(void)
>>>>> +{
>>>>> +#ifdef CONFIG_LINUX
>>>>
>>>> When will CONFIG_LINUX not be defined but __aarch64__ is?
>>>   The contents of this file is compiled only for aarch64
>>
>> Your makefile change compiles it for everything.
>>
>>> and hence
>>> all the contents are under this __aarch64__.
>>> Also the code is only for linux, have added CONFIG_LINUX.
>>
>> ...and you haven't answered the question: in what
>> circumstances could __aarch64__ be defined but
>> CONFIG_LINUX is not, ie why is there any point in
>> checking both defines?
>
> Ok. You mean __aarch64__ and __linux__ both are defined by gcc.
> we can rely on __aarch64__ define  here?.
>
> AFAIK, the caller of this function bufferiszero.c is compiled
> for everything, I case of bufferiszero.c is compiled for other than
> linux for aarch64, compilation might fail. In such case, the header file
> needs to have dummy/empty functions.

What do you suggest for this?.

Regards
Vijay
