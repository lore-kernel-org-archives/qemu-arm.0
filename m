Received: by 10.25.205.13 with SMTP id d13csp11538859lfg;
        Mon, 9 Jan 2017 07:09:25 -0800 (PST)
X-Received: by 10.55.212.157 with SMTP id s29mr83845433qks.240.1483974565060;
        Mon, 09 Jan 2017 07:09:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12si10050709qtb.66.2017.01.09.07.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 07:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQbZa-0006E7-Ex
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 10:09:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQbZQ-0006Cj-LD
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cQbZP-0006S1-Lw
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:09:12 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cQbZP-0006RR-8i
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:09:11 -0500
Received: by mail-vk0-x22e.google.com with SMTP id t8so10282815vke.3
	for <qemu-arm@nongnu.org>; Mon, 09 Jan 2017 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2U9EFTEbCSGRwJKuE2z9JK5Mr2xXnqozfCIewQkKWgA=;
	b=jbWTyUa6LU7CO8Cmmrl+Xnd6fK9PXpcTkzgvXQwAYvbcpQGr9mkbUGvR2kQU6xXKHP
	AAFlP3Mm+uRKZ75V8xr+Eo2pB99mb1fnWotMwaor7YQMHjbwZFdegBsdNWXQfIpoELfN
	avbEw7svjnO3FJ3WkDeXNhkL2yJG8n4JRvt/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2U9EFTEbCSGRwJKuE2z9JK5Mr2xXnqozfCIewQkKWgA=;
	b=tHQGcOOhnGyhOrHnTfhgzqtmM6t6aS+W/kkarAlhmu1lpSjCBwvGKjdUmD4A1HYiZ2
	5SD1Jq+19V86Xq0RNrYcthgEXNZUzvySIbbCbZPv9S+p2f7XwkYIJfPbageOcHY1B4uz
	9ar/Xge0P999WdSiWpB1GBhDWbIXtEKT7Em9XGJYheYwOZzAnbRH5MUBswer5XvwkcCO
	wwm+pE6eHb5Nv0Sd4P0lkfkmxqZmWyHXjtXxE50OIyyHniIqXpUG1M8n9XmBh7L2SHgg
	LlKHPPUZNaW7W4i2wATXOKA3kSZGkeXzqHzJNlhEjWKHYrjA2ogso/woOQPQ31WjBQ/c
	frbA==
X-Gm-Message-State: AIkVDXIQAQG7FTbhy0+J182snF90F1tL/scdKDrEG1VIiZ5+ksO7AwyLmtca+73p1ydRBdkOhCgfa5dG8TMNPjGU
X-Received: by 10.31.28.193 with SMTP id c184mr4794266vkc.173.1483974550607;
	Mon, 09 Jan 2017 07:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 9 Jan 2017 07:08:50 -0800 (PST)
In-Reply-To: <20161213211606.x4cssgt4knld4m4z@hawk.localdomain>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<20161213211606.x4cssgt4knld4m4z@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2017 15:08:50 +0000
Message-ID: <CAFEAcA_OcGnvGGMe+9eh1tK9HXysECLeG6+x91LD8mi0kuqEkw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] arm: Add virtualization
 to GICv3, and enable EL2 on 64-bit CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 64Qe+m3cyUoU

On 13 December 2016 at 21:16, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Dec 13, 2016 at 10:36:01AM +0000, Peter Maydell wrote:
>> This patchset adds support for the Virtualization extensions to QEMU's
>> GICv3 emulation.

> I've started some testing with this. When I boot an outer (L1) kernel
> with more than one cpu allocated I get
>
> [    3.441908] CPU: CPUs started in inconsistent modes
> [    3.442787] ------------[ cut here ]------------
> [    3.445434] WARNING: CPU: 0 PID: 1 at arch/arm64/kernel/smp.c:418 smp_cpus_done+0x80/0xa0
> ...
>
> and KVM does not init. Booting with only one cpu I see we do start in EL2
> and KVM does init.

This turns out to be a bug in QEMU's builtin PSCI implementation:
the CPU_ON call is supposed to start the new CPU in the highest
implemented-and-enabled NS exception level, but we were always
starting it in the exception level of the calling CPU. Since
Linux does its CPU_ON calls from EL1, this meant the new CPU got
started at EL1 rather than EL2.

I have a fix which I will put into v2 of the patchset (which I
will send mostly as an encouragement to further code review
since I don't think I've seen any other comments for things
I need to fix...)

thanks
-- PMM
