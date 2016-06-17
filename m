Received: by 10.25.21.96 with SMTP id l93csp192536lfi;
        Fri, 17 Jun 2016 03:30:44 -0700 (PDT)
X-Received: by 10.140.92.176 with SMTP id b45mr1119888qge.99.1466159444350;
        Fri, 17 Jun 2016 03:30:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o202si30847663qke.46.2016.06.17.03.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDr2x-0006Gr-Pz
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr2t-0006Fj-RP
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr2o-0002nj-8B
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:30:39 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr2o-0002nX-3D
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:30:34 -0400
Received: by mail-vk0-x22a.google.com with SMTP id t129so110200257vka.1
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xjf3MUhyhR3SWXp6a1JkejTqTLkO4MvzIcDUIOauebg=;
	b=XSeeTtEOr3wd0HbYHeDIergl6NKTDQ/x5hNK9A4K57Dfj3SQq8O02Lm0SwtUMumlYO
	ZeOXO3gv/ZpWUZQJu/jwNfgdSccyg1o00yoQwprTr90Ku0f/2G4mtipCGsO4lEcWJa1N
	gVm1OIRFX2opBTzFcdX7D4mXypbbGx4zM3k0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xjf3MUhyhR3SWXp6a1JkejTqTLkO4MvzIcDUIOauebg=;
	b=HbbqGcBMa98Be8ICmjBwwBFZbxKFGKeW+lOKOgrlstjk2Rs6mXcOjthc0L/d8YbhJQ
	qO7k4UtHYodHiNcaxRgxme39GbzIqT342mlU7Cd3JeIzhNcOaEs4rWBJEEQZIIrRjNFr
	siil6z/XB9pmTrzGxQUu1SCIhFjD9bApMYem/fYbT5DfF8Fsqs68/O5cL7OXubktK5fc
	APUmH+dJC2PIS7voLSoCHMTqsMVZ9hrnPQC12zxgQ+0SBv8ATM54thTelpETttu0vOEW
	fLcfmP/2qmEm5jjWwjRXybOH/Xo+oZtI83pHFPJUSxV784oifVXlQjKF0HoXNveY5qSD
	DIng==
X-Gm-Message-State: ALyK8tIs2C5Pgz9VEk1kLDWd8icPaE2aUpZA959il0xkdibVvwGuL4HdXP+j5sNWNGxrFmnMrmC710Qlcu9pgt7V
X-Received: by 10.176.64.69 with SMTP id h63mr523879uad.125.1466159433628;
	Fri, 17 Jun 2016 03:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 03:30:14 -0700 (PDT)
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
Date: Fri, 17 Jun 2016 11:30:14 +0100
Message-ID: <CAFEAcA_N63MOjKVU3Y-2ZdAimvAEbKPkpRRXB8STMJa51JZbqw@mail.gmail.com>
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
X-TUID: 6Jlw3r3VC+Lz

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
> With this, initfn of the cpu model is called earlier and feature set is updated.
> With that I could fetch arm architecture info. Based on this we can
> choose page size.

This won't work, because machvirt_init needs to be able to specify
properties of the CPU. I think we need to solve the issues with
dynamically reinitializing and reallocating the data structures,
as rth suggests.

thanks
-- PMM
