Received: by 10.25.21.156 with SMTP id 28csp1399458lfv;
        Fri, 29 Jul 2016 08:26:22 -0700 (PDT)
X-Received: by 10.13.220.1 with SMTP id f1mr19924761ywe.289.1469805982223;
        Fri, 29 Jul 2016 08:26:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c123si12521176qkd.17.2016.07.29.08.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 08:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT9g5-0008Bi-KF
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 11:26:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9g1-0008AF-GY
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9fz-0008Uy-IA
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:26:16 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:35925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT9fy-0008Ua-VF
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:26:15 -0400
Received: by mail-ua0-x234.google.com with SMTP id j59so64154885uaj.3
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MEwwzMgvBW/5R6s8hKeYx1x9EemWsyGUVqAtkuTHAKI=;
	b=aB9H+xuKaDRkIc3q6ydnYcKUfBT5vbAvuDsTLGbxk/1ys7JrIFlQBk7Du9o6NRCvqv
	XwW8uhJi62TcbqOADKW7+7OPtKeW9KL4fhb5SMnGYGS1ae3xt3dpXXOSXF2NDBHqwQvm
	R0WduZQn+ddJbESgeaClqzik0fZeGnCRMQVVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MEwwzMgvBW/5R6s8hKeYx1x9EemWsyGUVqAtkuTHAKI=;
	b=fHzqfDf9+KrLUov6p7CZLOsgIDZdwAfdXqs8xVuyAS0WaBJ54iNop8K9mIJBrs9kfV
	iFiLl3r/TH0LVzcl6Qcys/okrf+Tz143UpOP3Oex5EXJeIxqOqwBn4BIivvfLjZh23BX
	yhLjr5X/6tSKAL9V3mSOTaFP8l2BEX9GcWUDK0FzDbh7cFuVRf7/dd+X6hZqlXNpdhGh
	z0iScN9SQGVcM+z5yIJEMhvdWaWfsQ2W1vieFtq8sUnIF9zJAEYsQ6nLi0E7ajnsBTOM
	CssQz5VeL1KEO5hM59nJTY1uRoc7i1R85DT7AbLUqutvQG+vnPT2fRR4Gdl4gZ6CFRlR
	BIdQ==
X-Gm-Message-State: AEkoouupvfalfVZyObAFokvUXGi6mpgTQUxPRYQY8MnfEoaNll/kF+9kvsMjJU9692lUUepwtdR+S4m3L9k4/FlD
X-Received: by 10.176.0.208 with SMTP id 74mr19533722uaj.64.1469805973356;
	Fri, 29 Jul 2016 08:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 08:25:53 -0700 (PDT)
In-Reply-To: <cc1a272c-c410-88f5-8a63-2258e358ae43@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<CAFEAcA_x+4KesFxPfc-B=m1BF0f-yfVg=xYQLNE-XJUiXNFh=A@mail.gmail.com>
	<cc1a272c-c410-88f5-8a63-2258e358ae43@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 16:25:53 +0100
Message-ID: <CAFEAcA9tMKSONuT_2DiP=w_ZBqWpjyYTQvwUZq+KQoXb=sr=1A@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-arm] [PATCH RFC 1/1] arm64: add an option to turn on/off
 vpmu support
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ihn/Am7xYnuG

On 29 July 2016 at 16:08, Wei Huang <wei@redhat.com> wrote:
>
>
> On 07/29/2016 02:57 AM, Peter Maydell wrote:
>> On 28 July 2016 at 17:38, Wei Huang <wei@redhat.com> wrote:
>>> This patch adds a pmu=[on/off] option to enable/disable vpmu support
>>> in guest vm. There are several reasons to justify this option. First
>>> vpmu can be problematic for cross-migration between different SoC as
>>> perf counters is architecture-dependent. It is more flexible to
>>> have an option to turn it on/off. Secondly it matches the -cpu pmu
>>> option in libivrt. This patch has been tested on both DT/ACPI modes.
>>
>>
>> What particular two systems are you trying to migrate between?
>
> One example: APM's Mustang has 5 perf counters while AMD's Seattle has 7
> counters.

Right; this is a cross-implementation migration, which isn't
supposed to work at the moment, and more will be required for
it to work than just pmu on/off.

thanks
-- PMM
