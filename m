Received: by 10.25.21.96 with SMTP id l93csp199010lfi;
        Fri, 17 Jun 2016 03:49:42 -0700 (PDT)
X-Received: by 10.237.37.8 with SMTP id v8mr1368004qtc.28.1466160582439;
        Fri, 17 Jun 2016 03:49:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m71si6757671qki.262.2016.06.17.03.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDrLJ-0007Kn-QU
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDrF1-00023I-3D
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 06:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDrEs-0005gn-7x
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 06:43:11 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDrEs-0005gd-34
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 06:43:02 -0400
Received: by mail-vk0-x232.google.com with SMTP id j2so110430352vkg.2
	for <qemu-devel@nongnu.org>; Fri, 17 Jun 2016 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8zXiY14Hxu+RwDZz4SVkUNXlRGgZk1rMLTBqs74lJbg=;
	b=evuYlBQ+lpgnqkQFckIx78MefeJidFlyJAZtEYnP/ij3QD4os+IfygNcS4clZLuCKF
	l6ucVjhx3UcFN5iMNmNSmie1TSpzW9CsJp+r64E/cBb7HRStKrck3jEWhxLuKI3sZvnu
	g9T9ZxgeoQZgDRQb1nsNMYmTY0ksdJDH0pRU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8zXiY14Hxu+RwDZz4SVkUNXlRGgZk1rMLTBqs74lJbg=;
	b=l+dap5DyrXvzSXu4/zvN4yLWEhMaDTCdpDVbVNFvRIZq6f5iUGzJ6MQWR+kskKGbQY
	UwvOz3wVdMGOn3p9wCZRtVYzr/aBcPbn2ZbNBQdhd93zCqlptDDrKV8T7rgYlUZdMpWT
	DtDprTs2sknQl2aGqeHhiTvdVFulDGkjQ0fBNR1yUym+9htgVG9ccamJ6Kk1p1JOffc8
	ySa/xqYFHnezmgKv5IYa1/FB8r0w9HnADXZBPw0LVZrFSNmVaoGER0ZXX4fNCoPfIQ/w
	sM3CPex6uVU03t3LxgaSLW4OFavrhcHEJlK3a+AQvU0jgL4NoTt3+lE9p3Z0gTcWIJBA
	X7bA==
X-Gm-Message-State: ALyK8tLzuReZQLMko8VpWCM8tsHZzr4T1fwA59rmJAXK++QoKjWREcZe9gT5imX3h3iV91VN5myLn3OB6VIkX8/o
X-Received: by 10.31.158.197 with SMTP id h188mr822492vke.6.1466160181596;
	Fri, 17 Jun 2016 03:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 03:42:42 -0700 (PDT)
In-Reply-To: <CALicx6sUbLd4wigLHH55R+3DgoyWKcgUs0F0_vf-s_54yDfJng@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
	<CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
	<c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
	<CALicx6tuVFbUxqv9Jjj35w51PmkB2eVAPg-bbBPLgFavGTAs5A@mail.gmail.com>
	<CAFEAcA_N63MOjKVU3Y-2ZdAimvAEbKPkpRRXB8STMJa51JZbqw@mail.gmail.com>
	<CALicx6sUbLd4wigLHH55R+3DgoyWKcgUs0F0_vf-s_54yDfJng@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 11:42:42 +0100
Message-ID: <CAFEAcA_j5raQYCghXcZL+1OR5Qmkx0HuerEyMJa1rMg5Lm9i3A@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <vijayak@cavium.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CNIN2aPtQY3B

On 17 June 2016 at 11:39, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Fri, Jun 17, 2016 at 4:00 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This won't work, because machvirt_init needs to be able to specify
>> properties of the CPU. I think we need to solve the issues with
>> dynamically reinitializing and reallocating the data structures,
>> as rth suggests.
>
> In early init, only cpu object is created and does not specify
> properties of the CPU.
> machvirt_init will reuse already created cpu object and specify
> properties of the CPU.

You don't know how many CPUs to create, though, and some of the
properties defined by the machine init function include those
which tell you whether the page size should be 1K or 4K.

thanks
-- PMM
