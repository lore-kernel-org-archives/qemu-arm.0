Received: by 10.25.208.211 with SMTP id h202csp1350161lfg;
        Mon, 11 Apr 2016 03:41:17 -0700 (PDT)
X-Received: by 10.140.16.133 with SMTP id 5mr27178015qgb.50.1460371276990;
        Mon, 11 Apr 2016 03:41:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189si431543qhd.2.2016.04.11.03.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Apr 2016 03:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apZHQ-0002xF-Jz
	for alex.bennee@linaro.org; Mon, 11 Apr 2016 06:41:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1apZGq-0001ZY-Nk
	for qemu-devel@nongnu.org; Mon, 11 Apr 2016 06:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1apZGp-0000DL-P1
	for qemu-devel@nongnu.org; Mon, 11 Apr 2016 06:40:40 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1apZGp-0000DC-CR
	for qemu-devel@nongnu.org; Mon, 11 Apr 2016 06:40:39 -0400
Received: by mail-vk0-x231.google.com with SMTP id e185so206566476vkb.1
	for <qemu-devel@nongnu.org>; Mon, 11 Apr 2016 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pf6cE/u5siHNgLfx+ZTQW8SFIX4m3awt/0xqcyjLb5E=;
	b=Aem3ph9b50G/lY4A3tzb5SuNXxDDyEzG/8HCWkNMNUsjik6NHzuAI2dS6gUFu3xVgo
	eAAIUioIXnnYTm0t6R5UZO0EmBAPpN2fjcor71oU0F8am/fK4nZ0WgD0n+YmHc4/0FyZ
	oyZQTiZJ01ZX7nECwz1ED0lUXf48oBXI74sXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pf6cE/u5siHNgLfx+ZTQW8SFIX4m3awt/0xqcyjLb5E=;
	b=U3qOe4uixgbUVuSNbVl79ACiWUZpCTSqy1SdP86LAsIbWTwSL9IDSJ4+aLWn4klC2n
	E5NSlZZsso/bGs9f+w99U/yQZ7tZV/mHxkMd9nIUzay2C5oLWqdSDCiwE/acQK3OtaTC
	QXCw0p++MuzwmJ/bfcit85i0+zqDJPXsSAYQyf+ALrewBYlis9EHURI9S4bHRXv9kVJV
	Un/ckgqQ5ydDHLpl3eNrTuMXk4xbnrnqakMo/Was0XB22eu0G+KgH1gFRlYlTO7R5IXj
	dFnvnz3dKTM5apb+kwUyFOYPnjz50keAp7stPH/Fl3845UmQ8Q9imywbeg1bwxpi3RmZ
	Y0Sg==
X-Gm-Message-State: AD7BkJIYkwDc3xgcMAwVMDuYnocWtzqy4wM1U1q6blRsaCddlgboe85MifmCMjihT6m+/geWF38VpUSE6DImMZkH
X-Received: by 10.31.8.17 with SMTP id 17mr9678248vki.139.1460371238727; Mon,
	11 Apr 2016 03:40:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 11 Apr 2016 03:40:19 -0700 (PDT)
In-Reply-To: <57098617.1020308@twiddle.net>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
	<57098617.1020308@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2016 11:40:19 +0100
Message-ID: <CAFEAcA8Rm9Ntu-bmAEMOcKBs6db8biez-mThw8iDP9szD1L4xQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [RFC PATCH v2 1/3] target-arm: Use Neon for zero
 checking
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijay <vijayak@cavium.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MrEVq3NYiMRg

On 9 April 2016 at 23:45, Richard Henderson <rth@twiddle.net> wrote:
> On 04/07/2016 02:58 AM, vijayak@caviumnetworks.com wrote:
>>
>> +#elif defined __aarch64__
>> +#include "arm_neon.h"
>
>
> A better test is __NEON__, which asserts that neon is available at compile
> time (which will be true basically always for aarch64), and then you don't
> need a runime test for neon.

You don't need a runtime test for neon on aarch64 anyway, because
it will always be present.

> You also get support for armv7 with neon.

But if you do care about armv7 then you do need a runtime test,
because the defacto standard compile options are for armhf which
has FP but doesn't assume Neon.

Personally I think we should not worry about armv7 here, because
it's not actually a likely virtualization server platform, and
we shouldn't include code in QEMU we're not even compile testing.
So I think __aarch64__ here is fine.

thanks
-- PMM
