Received: by 10.25.21.96 with SMTP id l93csp1904180lfi;
        Tue, 21 Jun 2016 04:56:14 -0700 (PDT)
X-Received: by 10.55.8.2 with SMTP id 2mr27596003qki.200.1466510174734;
        Tue, 21 Jun 2016 04:56:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si142615qtb.97.2016.06.21.04.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 04:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFKHu-0006lL-38
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 07:56:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKHM-0006HL-Lb
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKHL-0001dU-LN
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:55:40 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKHL-0001dP-Dr
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:55:39 -0400
Received: by mail-vk0-x22a.google.com with SMTP id d185so16889226vkg.0
	for <qemu-arm@nongnu.org>; Tue, 21 Jun 2016 04:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e4EA3tFVE/FCqq/AxiX9zUBuMfzrWk2i8+65EUiiD1k=;
	b=LK6yqmNuYSx5OssodwPz6MxmPLhQBMWC/8TS4Klx+f+21plLyaSuy7nevdtA2kAz+B
	hjwgUe1LGBcKzD8PGmfDY6f63SotrzntRxlJf7KkwaZ685MfNW1USlpNVugGdeWhBnnG
	z4aafN1IGRy2cdKIbv79UzUmzJ85qFanYpKjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e4EA3tFVE/FCqq/AxiX9zUBuMfzrWk2i8+65EUiiD1k=;
	b=J41QUG3cc35KR5tF3bkSEwyU+r+k2PYzbUeGzqs89JQwvbVVKynvcqj3d0sfO5dtII
	JvWphxVAv6S86JsJw3paazO81FHrqScMaCOeMyiNN5rIY+hojYSjZ/efaUAoFqly3RyU
	MufYB+6qLR3M9v5TZAnPinQCR29K1rY5MxDonpM3bxrRQyX0bSU2DVmSdoXtvciwlAos
	sH7NukkedyjUww8XfUUHpmL/Z7xG2JkrJFXxMX3mB1LhTswVuFaAGe3gx41ORhfkElbf
	qcBWEH7UJ4hCf9wjLcxZJPo0iELP/koYXlDinVXYAYJIYP0eKWOQd4n5KwfgQpH21Zx5
	L8LQ==
X-Gm-Message-State: ALyK8tJsuwxu1dbYfRPcFV6i04288YywX8Uh/5pnHh6oFhF8X6AHjW6B3AmTsDOwbdk257OiEolrbj6LFcHAJSUs
X-Received: by 10.31.79.198 with SMTP id d189mr9223067vkb.47.1466510138835;
	Tue, 21 Jun 2016 04:55:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.50.140 with HTTP; Tue, 21 Jun 2016 04:55:19 -0700 (PDT)
In-Reply-To: <CALicx6tuVFbUxqv9Jjj35w51PmkB2eVAPg-bbBPLgFavGTAs5A@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
	<CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
	<c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
	<CALicx6tuVFbUxqv9Jjj35w51PmkB2eVAPg-bbBPLgFavGTAs5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 12:55:19 +0100
Message-ID: <CAFEAcA_+B09XSj6A0XzpR-onL-akJ=UeEfx-d1Y=rmoNoP4_uA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v1 4/4] target-arm: Compute
 page size based on ARM target cpu type
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
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <vijayak@cavium.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gRzo9aJdOngZ

On 17 June 2016 at 11:20, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Fri, Jun 17, 2016 at 1:12 AM, Richard Henderson <rth@twiddle.net> wrote:
>> On 06/14/2016 04:36 AM, Peter Maydell wrote:
>>> It would be better to delay the point at which we allocate
>>> the data structures which care about page size, rather than
>>> moving init of the CPU earlier.
>>
>> It would be *best* if we could re-initialize and re-allocate these data
>> structures so that we can follow the current page size as it changes.
>>
>> Yes, this might require flushing just about everything, but it's the kind of
>> thing that's likely to happen only at system startup.  After that, everything
>> benefits from having the correct (larger) page size.
>
> I tried shuffling the memory initialization code after cpu initialization.
> but it was full mess. So could not proceed further.
>
> However, I tried early creation cpu objects instead of doing it from
> machvirt_init.

I'm going to have a go at this and see if I can come up with a
nice looking arrangement. Will try to send some patches by the
end of the week...

thanks
-- PMM
