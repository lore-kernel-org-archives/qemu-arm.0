Received: by 10.25.21.156 with SMTP id 28csp2633365lfv;
        Mon, 1 Aug 2016 06:33:20 -0700 (PDT)
X-Received: by 10.200.43.47 with SMTP id 44mr87542492qtu.66.1470058400289;
        Mon, 01 Aug 2016 06:33:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si19949986qki.72.2016.08.01.06.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 06:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUDLL-0003zn-NN
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 09:33:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUDLH-0003ym-UL
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUDLF-0001hX-UF
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:33:14 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUDLF-0001hP-9A
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:33:13 -0400
Received: by mail-vk0-x22b.google.com with SMTP id w127so99290006vkh.2
	for <qemu-arm@nongnu.org>; Mon, 01 Aug 2016 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Kd6EfsvXSdMpaqh9+2y5d3bk0LUi5Pw6UaXD4rHmCQ=;
	b=b9uVE8dadZ2EtzReapeMhJXsAHWNjMovoF308IKIB4IGbAPhLn1KzOL+GtotrbPCVR
	WuImE7gx9fWaq0we8Elp8WeGwKVz7YRAC75onbEibHNkmtzhgGcZUuDzfXKSADkARw2C
	6hFKYNltB/8ae+WXh3soCftQQjhBvCu/i0sEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Kd6EfsvXSdMpaqh9+2y5d3bk0LUi5Pw6UaXD4rHmCQ=;
	b=mXuzVnuBQ2CUK3M+aRMp6MS2NeTFfVmkACoDQ5gwNncC1xmxJQooUIjIEwdGjRTch4
	22YSDlwg0WB7GSUZXHvRb7UQ8YSV8XML9/NXaEBM0uyHmW2tr6uF2lMRukdVHAqMMBqc
	s+KhvMokscjhzALzEzOW6aqRjxPD6Qry9kiGvCNW7q+xc7sxPpKbFta8dDX7idvHtA2D
	bismXeBkdAIpWZ4SbQVO4XeSu75w+wlE/zI/J032vHGNCifbznT6xypj/bdU2w+QBUcY
	iAeq1yt+a/mwcY32GgDUErzvCmkrqR0YmY9XWLyUPwlBOLEphPw9Texsx3cZqkKrgE9A
	TJtg==
X-Gm-Message-State: AEkoouuOUIF/2rV4X186ohPQEekqNJLNcpnYgXFbVcFLKKVvYvt7s3Hbije7dmBqSmSiEugjyVo4csv852o7r8Lx
X-Received: by 10.31.7.8 with SMTP id 8mr25626555vkh.157.1470058391682; Mon,
	01 Aug 2016 06:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 1 Aug 2016 06:32:52 -0700 (PDT)
In-Reply-To: <1470058019.3971.13.camel@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
	<1470058019.3971.13.camel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2016 14:32:52 +0100
Message-ID: <CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5k7OY6A+Vkz

On 1 August 2016 at 14:26, Andrea Bolognani <abologna@redhat.com> wrote:
> On Mon, 2016-08-01 at 15:08 +0200, Andrew Jones wrote:
>> > I'm not sure a warning is enough: if I start a guest and
>> > explicitly ask for a PMU, I expect it to be there, or for
>> > the guest not to start at all. How does x86 behave in this
>> > regard?
>>
>> Peter had a good suggestion for this. We need to wrap the property
>> addition in an arm_feature check like the has_el3 property. That will
>> remove it from all cpu types that don't support it.
>
> Wouldn't that mean that you'd be unable to use
>
>   -cpu foo,pmu=off
>
> if CPU model 'foo' doesn't support a PMU? I'd expect that
> to work.

The current precedent (has_el3) doesn't work like that: if
foo isn't a CPU which can support EL3 then the property doesn't
exist, and it's an error to try to set it.

thanks
-- PMM
