Received: by 10.25.87.130 with SMTP id l124csp249393lfb;
        Mon, 5 Sep 2016 11:57:28 -0700 (PDT)
X-Received: by 10.55.74.14 with SMTP id x14mr39451859qka.102.1473101848756;
        Mon, 05 Sep 2016 11:57:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t72si18428130qka.248.2016.09.05.11.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 11:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgz5E-0005wS-3X
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 14:57:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgyQH-0003h7-Oh
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 14:15:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgyQG-0001J9-MT
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 14:15:09 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:32873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgyQF-0001IP-TP
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 14:15:08 -0400
Received: by mail-ua0-x232.google.com with SMTP id 31so31229024uao.0
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=en7qIAG8jhK4LnBqCdfltzd7PGjCq9K1czdqJonyK0M=;
	b=NLjNa7EI4XPAO1UbOrYjqUxHUZpw8DC2gNQD8RWhEFUE4lHITrhwwe49+NnHIkYdGD
	75sVVTnfdwmqDkSNdJ7Fx4tIR6kSYmhqjauzZYa7MXYSd/aBPVSyJW5Hk5lNeOd/M3Qm
	av9eJ0dGkzFFngcMC43jrEABB4hDsa8kdWJfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=en7qIAG8jhK4LnBqCdfltzd7PGjCq9K1czdqJonyK0M=;
	b=PzuIFT/Z0A6sbmGnfvpLk8BL8hhIxUzFtwgeQZ1CgI3oCN6P8TAyi7SFXa2exPyQJG
	xx6+GFStFcyk4FfXWZbB2pFBrOprHapP5W29++L8Myxnmf1RaF4zfhtE8F66mFT+YIJv
	nwTGnRmMvWqa9Qs5a5dW3gQ76VEGUJdytBOJmpTbB+ilFIBi+eSuNupQXoVaoQiKLITo
	tDWmojf/DqSPn1ETzhywS6EyDp4UONLAkmYEpdAOEN+/r/0yn65KCmv50i/9dc/GFdDU
	UQtnsjaBX5K6dll4sydkLFYudqYwfj0IabCAPDc97IXDoXfvjctwqP+CMbldpqsxGeA0
	Xv3A==
X-Gm-Message-State: AE9vXwOf1+jG37b3Hzz++BVibWO6ClTVBNoz3M3v+6EObQg/eSpmoD8g501jbolIeXRH4GfdJuIyzD9TLQo1FuM/
X-Received: by 10.176.0.120 with SMTP id 111mr10049559uai.17.1473099307544;
	Mon, 05 Sep 2016 11:15:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 11:14:47 -0700 (PDT)
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 19:14:47 +0100
Message-ID: <CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-arm] [PATCH v15 00/15] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BSghhtraWv2n

On 21 July 2016 at 15:31, Dmitry Osipenko <digetx@gmail.com> wrote:
> Hello,
>
> Currently, QEMU ARM MPTimer device model provides only a certain subset of
> the emulation behavior. This patch series is supposed to add missing parts by
> converting the MPTimer to use generic ptimer helper. It fixes some important
> ptimer bugs and provides new features that are required for the ARM MPTimer.
>
> Changelog:
>     V15: As per Peter's Maydell request: split ptimer policy patches,
>          so that first "policy" patch only sets default policy to all
>          of the timers without introducing new behaviour policies.
>
>          The "deferred trigger" ptimer policy from V14 is converted to
>          "continuous trigger" as it is more intuitive.
>
>          New ptimer policies added.
>
>          New ptimer patch "Actually stop timer in case of error".
>
>          Fixed ARM MPTimer periodic/oneshot "on the fly" mode switch
>          for the case when load = 0 and new mode has prescaler = 0.
>
>          Added QTests for each of the ptimer policies.
>
>          Added QTests for the ARM MPTimer.
>
>     V14: Set the ptimer policy in the ptimer_init() instead of adding
>          ptimer_set_policy(), keeping ptimer VMState unchanged and dropped
>          hw_error() hardening asserts as per Peter's Maydell V13 review
>          comments, addressed the rest of the review comments.
>
> Dmitry Osipenko (15):
>   hw/ptimer: Change ptimer_get_count to return "1" for the expired timer
>   hw/ptimer: Fix counter - 1 returned by ptimer_get_count for the active
>     timer
>   hw/ptimer: Actually stop timer in case of error
>   hw/ptimer: Introduce timer policy feature
>   tests: Add ptimer tests
>   hw/ptimer: Add "wraparound after one period" policy
>   tests: ptimer: Add tests for "wraparound after one period" policy
>   hw/ptimer: Add "continuous trigger" policy
>   tests: ptimer: Add tests for "continuous trigger" policy
>   hw/ptimer: Add "no immediate trigger" policy
>   tests: ptimer: Add tests for "no immediate trigger" policy
>   hw/ptimer: Add "no immediate reload" policy
>   tests: ptimer: Add tests for "no immediate reload" policy
>   arm_mptimer: Convert to use ptimer
>   tests: Add tests for the ARM MPTimer

I tried "check this compiles and passes the tests for each commit",
and what I found was that you get a lot of new warnings running
'make check' about "Timer with period zero, disabling", which were
not there before. Could you look into this and fix it, please?

thanks
-- PMM
