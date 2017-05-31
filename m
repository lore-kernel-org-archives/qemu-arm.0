Received: by 10.25.0.6 with SMTP id 6csp222023lfa;
        Wed, 31 May 2017 01:59:18 -0700 (PDT)
X-Received: by 10.55.41.146 with SMTP id p18mr23846202qkp.74.1496221158634;
        Wed, 31 May 2017 01:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496221158; cv=none;
        d=google.com; s=arc-20160816;
        b=UcPjkOLErDUU8wbb0NJz4D7C5KKtlKgaNFroeiYo5swBWDHoiC+4KCxGaNdMuAJJ9y
         gC7waqgoQ45FOafQTWCHm3y2knvkbGvz/ZKPrNS30hEAkWiTMfu+e9QiWZ7JiQqkbv/G
         hwig6Ku05R419mkQ2yVUWtfajhEgsfbesQS75dHQAc7CV4fimdDgTtR5F70h5ryouXQV
         lNbLgB5MRj8+y2uh+LKRv/5iR3esd+J3KHvwIAleuT08BT4s9YEbeyj3Yq4KxED8rLLD
         jeENubveP2rwLzUu/CVc9zxefNcLzWpjxfFwEYrhLNuV392gomq78z7eoxzS+cYtHkHa
         jsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dmarc-filter
         :arc-authentication-results;
        bh=4k0vwWmled3HHqituB2/di7GhCypmR+wc8i514wT5Gc=;
        b=iubciCgam+UPosyPzEUaz4KOKwO6DunwH3MhsXONuN4Wwzv/iaCiWCQZkYinuNcMY/
         c2BsTp3bcM9IGqRgok895MTsuCkgHHBgpBB2Q1FjTSmgEVt1eIjmYyVF7wqJNds9w9wI
         2R1mUPpxY3aX8HsPu9zTSyFDjmWRKi9+jYAeBNAmG436YcEFpTMNaSszG45ta7Uduukd
         BuUPWorjEclOoO0+IblxWvxqc9kTutpRsno9Bhmzc2AdfwVXHyTsypTQ8uf8qq6BIVB5
         zCQ7QMky+TlIAHNxbsqALTVMZ6anIXAaeUFLfN4XdP0vQ0vJLTlMlKUYPxtuA+vQ9hHa
         eTWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l187si15708276qkc.143.2017.05.31.01.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 01:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFzTH-0002AG-PV
	for alex.bennee@linaro.org; Wed, 31 May 2017 04:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dFzT5-000269-0R
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:59:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dFzSz-0005tf-5w
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:59:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:38168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dFzSy-0005tL-W5; Wed, 31 May 2017 04:58:57 -0400
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6AD1023A19;
	Wed, 31 May 2017 08:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD1023A19
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
Received: by mail-it0-f42.google.com with SMTP id g126so7786338ith.0;
	Wed, 31 May 2017 01:58:55 -0700 (PDT)
X-Gm-Message-State: AODbwcAJIwnIvRy3hxJCb1qvgmRH5TWvbME1VGDS4phRN8kxe0ZdNC8Z
	VLKw0eQyPpyxo7FYLoSjSk/pmuCeww==
X-Received: by 10.36.86.134 with SMTP id o128mr6286419itb.44.1496221134795;
	Wed, 31 May 2017 01:58:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.50.81 with HTTP; Wed, 31 May 2017 01:58:54 -0700 (PDT)
In-Reply-To: <CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
References: <20170521152949.15338-1-krzk@kernel.org>
	<CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 31 May 2017 10:58:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
Message-ID: <CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary
 CPU, QOM-ify Soc, other improvements
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYPXJWdZuNe/

On Tue, May 30, 2017 at 2:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 21 May 2017 at 16:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> This is a collection of three already sent patchsets [1] [2] [3].
>>
>>
>> Changes since previous versions (v2):
>> 1. Patch 11/11: set BIT(8) in PS_HOLD to fix power off on Linux v4.12-rc1.
>> 2. Add reviewed-by tags.
>>
>>
>> The first patch in set is a bugfix which also exposes problem of cpuidle.
>> Kernel compiled with disabled CPU_IDLE works fine (two CPUs, coming SGIs,
>> poweroff working) but with CPU_IDLE it behaves bad due to low-power
>> mode (AFTR). This was discussed at [1].
>
> So is this a regression compared to our current model? I was
> under the impression from the previous thread that it was,
> which is why I didn't apply that patchset.

It depends how wide understanding of regression you have. :)
1. Before this patch, second CPU could not boot. System was usable but
worked on only one CPU.
2. Before this patch, kernel's IRQ work is broken. None of IRQ work
are executed which is mostly visible during poweroff - system hangs on
syncing IRQ works.
3. With this patch, second CPU boots and IRQ works properly (so
poweroff is possible).
4. However with this patch, Linux kernel with cpuidle enabled (which
is also included in many kernel defconfigs), the system is very
unresponsive.

So overall... a lot of things were broken already. This patches fixes
them... but breaks different thing.

Best regards,
Krzysztof
