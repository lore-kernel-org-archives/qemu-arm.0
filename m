Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10797083wrt;
        Thu, 6 Dec 2018 08:05:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VnEDeqt8vH5uJMahA6DDyjdKjsex3LR5dkqN9iTgPDAd73Koy5nm0jJ7/v2UG8/fArl1sJ
X-Received: by 2002:ac8:53c6:: with SMTP id c6mr28547990qtq.278.1544112353270;
        Thu, 06 Dec 2018 08:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544112353; cv=none;
        d=google.com; s=arc-20160816;
        b=JIa8utNkOBwle4/D94C4Ixj5KB8eJloqrpjvN7CUCSDHHmr5Ol1boJxCCJw/f3sQSZ
         rYijWrWm7KOul6Tr8oXkaYWXNPoYh4JPKyyQGhiBlb1C70qpPJZowRBpfLrw8lBlKG81
         kLu3u0Ae+TDNAp+0mztPNBKOUDbzxvunf7vELRy6R/mq6LxjOam8ku1DpPpXtSQarEnh
         zFSnqZNY4CSA06npJWziAvH7HOC2kJqakT8mMLY5GVn2GLDO/bBJXHiRiIG/wL/OvvKb
         3dHoUiGCvexxy5jDWF9Qx4migfzXGQ/+GUnCrd+Wz+yjD8PfI0IChj++u1IjbRDAQkBn
         LNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bn1CLy7xdsS1vn07zpX7Qg40xGqRWdXzAnNAQ2Y03hs=;
        b=hWIXCd+s/pS3To4+9hxNXvHQA5GHgOypTeH1x+biSf4mIiRQI55H+3mal0Mp9UKIhf
         dqghS3uLOiW1ufbA7CQ3jjcWnvmGLlo/d3iLEMMGApLY1AImv0UePgSOQgl6TiIKUmAB
         9chI6l3sd/fWsOvmC0pEOm287aNobhpDzE7sUMW57it5qG/+nnXTvdu27QHwjib1j7S0
         MO+ynmJiVqgR775xwzDgjAd3DDrfWTb3hD8p3psRYJTGSLVrRdcC4LsP1icu8BPO1vFn
         UuwpMt+O2GYsJYTjuoIUlrzAiYv+3IEZWuu60wZL5F82BsU8GxSR5aO85+bTSkLZ/n/b
         3CXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cLEVIM2e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 49si501362qts.164.2018.12.06.08.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 08:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cLEVIM2e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUw9w-0002qP-P7
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 11:05:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw8H-0002AM-BG
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 11:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUw8D-0003qf-1o
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 11:04:09 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUw8C-0003pq-OT
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 11:04:04 -0500
Received: by mail-oi1-x241.google.com with SMTP id x202so765752oif.13
	for <qemu-devel@nongnu.org>; Thu, 06 Dec 2018 08:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bn1CLy7xdsS1vn07zpX7Qg40xGqRWdXzAnNAQ2Y03hs=;
	b=cLEVIM2etWHqf4ZZCh5XD6wtu7qAaCCy7UqDcfpFxVSyyVt1dm+DyOxZumO8GTjV3c
	x/QY+mtjwnnPwQujhmPFbvZMkFNKlzqarxLwFEol/l1l9FzUsF6ezsi8ES6agUZZi9vr
	Cc0UxxbLjJqn6rmTIfBcy1Kbp2ZSe82MRuSQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bn1CLy7xdsS1vn07zpX7Qg40xGqRWdXzAnNAQ2Y03hs=;
	b=NtBmvotGkDIrNmlu61f0ORDO8ok70Ty8IDR2lIdEd2RDRVuNyVs5qFfCK7uQFATevB
	gY2hWj6AS+j8p9aSkFbXCgcR/DfXaPDEh6xnX6HSCh3CbDwcpRY5d+Z+bNx08zf3f3hd
	Pls5MhKJVT4Sy79p0czyQ5/FxzTazKcwKaHtjoNRA31n7lmd3qsRLsa9IqJyhO7AEvqe
	oHtHK6gUsUz1zJDv3jDECu5occhpWwOMt8FP5ocB0dxqhGL7pOi3LAhOLjZrCAsvPOis
	dbE6hhe2gVXdcU+JT3HYgV2oSq4HTIuyEwUohlHHvNuFeghkZ1LwwFcFotwQyOTEaHsE
	I48w==
X-Gm-Message-State: AA+aEWaEq297/LTCLAeI0M2m9cpK2/r5yxcvp30FJkVfx3YUDZe1HhDd
	+u4Q4K55+2tUZRa7eEhLRw5mZbZBv6IJa3P+/5ziOw==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr18607263oic.332.1544112243944;
	Thu, 06 Dec 2018 08:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-15-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-15-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Dec 2018 16:03:51 +0000
Message-ID: <CAFEAcA8Tt3ygYCZO7ZYkZPwmPQniBu6fLnr+RjNUAmgZdTT0kA@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v9 14/14] target/arm: Send interrupts on
 PMU counter overflow
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUxgSHl1XS0O

On Wed, 5 Dec 2018 at 13:44, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Setup a QEMUTimer to get a callback when we expect counters to next
> overflow and trigger an interrupt at that time.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.c    |  12 +++++
>  target/arm/cpu.h    |   7 +++
>  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 139 insertions(+), 6 deletions(-)
>
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -733,6 +733,8 @@ struct ARMCPU {
>
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> +    /* Timer used by the PMU */
> +    QEMUTimer *pmu_timer;

We don't seem to migrate this timer state. Is that OK? If so,
a brief comment somewhere with the rationale would be helpful.

thanks
-- PMM
