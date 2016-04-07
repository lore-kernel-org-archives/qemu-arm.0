Received: by 10.25.208.211 with SMTP id h202csp451211lfg;
        Thu, 7 Apr 2016 04:45:34 -0700 (PDT)
X-Received: by 10.55.197.214 with SMTP id k83mr2887454qkl.106.1460029534906;
        Thu, 07 Apr 2016 04:45:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93si5582920qgf.62.2016.04.07.04.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 04:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao8NS-0005mM-5K
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 07:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao8NO-0005kD-Uf
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 07:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao8NK-0001OJ-R7
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 07:45:30 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao8NK-0001OB-Mr
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 07:45:26 -0400
Received: by mail-vk0-x22c.google.com with SMTP id t129so8891991vkg.2
	for <qemu-arm@nongnu.org>; Thu, 07 Apr 2016 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X4a6vOiUDjU7V458GShc7egioSMf0FgTwqLlBOnTgrg=;
	b=f6f9EIurv7fW6B85TE7GtXtW5q8aZ3sRUlS7hgEGZxCbqAvj+eHuS3CB7PcjP2o6Xm
	1smzQfuNAEeRiCxADbvOf4HLQtK0hSs1FUEjmvDmcyoaJtQ9hwhm4qjoXgdv8ld6nZlE
	mviqGYmQvL3MDFpqN9p8c1Tpey0fgLtK6UvmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X4a6vOiUDjU7V458GShc7egioSMf0FgTwqLlBOnTgrg=;
	b=IBTVjJUMU3eSdm5g7Qr1KXnVzHfz5ftR7PIeajylZtaXRBhB0iioIz5FmHggXoVZuh
	k6wEiSrhJnBn4TVQNlGu7h8QAJvFA1DmxY3wyMXwb/eHcaNeP5tECxbByB5oePg3EENT
	2VoDmThRkdp8p3G9TuZqEldZst3Z37gqb+qvWiA0+atHgn7Yb79p+9apa+Jun68MoF1s
	I+U97Xep5/jdNx7/Ie37zRT/Q6xWsU93qKV2G8tkjgQ9P1g1l7gHr03/Kz2N4TbPgoPV
	hqcySNZzY75p73pcg099Jxw2zTLLJrlx7dRuzJ6DQ92JqdUFXCPM5Y8dv/3mdhkdnye7
	uUYg==
X-Gm-Message-State: AD7BkJKiT8YdT0gKS+zsw/2lPV6Ae58aOO80No9hA+XWvU+76OMQZC/lG+9Hiry2El7FW2G330F010Lpo9poUIXD
X-Received: by 10.176.0.212 with SMTP id 78mr1172073uaj.4.1460029526090; Thu,
	07 Apr 2016 04:45:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 7 Apr 2016 04:45:06 -0700 (PDT)
In-Reply-To: <CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2016 12:45:06 +0100
Message-ID: <CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
	fetch /proc/cpuinfo
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
X-TUID: K2+v7zIoUiaZ

On 7 April 2016 at 11:56, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Thu, Apr 7, 2016 at 3:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 7 April 2016 at 10:58,  <vijayak@caviumnetworks.com> wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>>>
>>> utils cannot read target cpu information to
>>> fetch cpu information to implement cpu specific
>>> features or erratas. For this parse /proc/cpuinfo
>>> and fetch cpu information.
>>>
>>> For now this helper only fetches cpu information
>>> for arm architectures.
>>
>> As I understand it /proc/cpuinfo is intended only for
>> humans to read. Please don't write code to parse it;
>> find a different way to get this information instead
>> if you really need it.

> Also unlike x86 there is no cpuid.h where we can get cpu identification
> information for arm64.

I'm told there are kernel patches in progress to get this sort
of information in a maintainable way to userspace, which are
currently somewhat stalled due to lack of anybody who wants to
consume it. If you have a use case then you should probably
flag it up with the kernel devs.

That said, I think we should probably hold off on this
discussion until we have clearer benchmarking info that
demonstrates that doing these prefetches really does make
a significant difference. I would much prefer to have a
single aarch64 routine that works for everybody, rather
than a thunderx-only special case.

thanks
-- PMM
