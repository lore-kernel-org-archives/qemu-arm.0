Received: by 10.182.158.201 with SMTP id ww9csp2598826obb;
        Tue, 15 Dec 2015 10:03:31 -0800 (PST)
X-Received: by 10.140.27.238 with SMTP id 101mr52554940qgx.4.1450202611754;
        Tue, 15 Dec 2015 10:03:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si2115582qki.94.2015.12.15.10.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 10:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8twh-0005Ls-EL
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 13:03:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8twc-0005Gq-7e
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8twb-0007zF-17
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:03:26 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8twa-0007z3-SP
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:03:24 -0500
Received: by mail-vk0-x236.google.com with SMTP id a188so10965337vkc.0
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4bnfAJuU5SseF5WIonrkafgy6gnBeXpA8e8mVwEDQ7Y=;
	b=HbvjquP6yPTAvNMf0DVFGf7XWmHBmAtyY7F6rgpc2aswb1VIJbtQ6sUwpnLpuA4Bih
	BKjNko3F5Who3jEQ/+bdkIjXuluc8buFqXBnBjBSyZuFaKD2uxipXteuGSzUrTiy+on/
	352yk37P+FVOHSu4YeFKDZf19hip/gmCN5szI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4bnfAJuU5SseF5WIonrkafgy6gnBeXpA8e8mVwEDQ7Y=;
	b=QHBWQsq/ctc0BvqgVjjH1Xkf2tk9IuBYCl1Jj4hM0CRYNswq1nYpWPfclBdFZHyYz0
	M5m8UmK8oQJ3X5GmAYVLqYdwfolougjWxrJdh7moWyLUiQpkJ7kjAibz6zgEj+pT+E/j
	gQJK3R3JRFOZec6Mn0dXghgDjm9pgsTva+ykMvviI7akPwfx773apllPQh3tbajglYnb
	3ycMXdwJfIHzPuGNp6oBEJuhoM1AMjtV+UC6CUULgVfaD3mEMG5pvnZ8E9vlsFs4seKJ
	ecglj2zZLFM7rQ91q613MnIIrTWlmLM36kIdRx0dgVsXbezEvu6/gqynWBWcBWm7GRdO
	Xczw==
X-Gm-Message-State: ALoCoQmfeTDCm3YJ0sEcZJ+9tkD/eD4nhzqJW+EdPyiMQij1iNOoJYWYJK63nY7gz+i5hjRt55XOFZABRCFLp1EaYW9Q1HtBmlCB9NeQgn7SKniGAHq4z6E=
X-Received: by 10.31.52.211 with SMTP id b202mr30282132vka.82.1450202604408;
	Tue, 15 Dec 2015 10:03:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Dec 2015 10:03:05 -0800 (PST)
In-Reply-To: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
References: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 18:03:05 +0000
Message-ID: <CAFEAcA-=+VumX_kH=Jyk5J3jXOW=Fdf61Rv-6Zf5QoxJ6w_6mA@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix and improve AA32 singlestep
 translation completion code
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
X-TUID: bmshXOCWerjx

On 25 November 2015 at 18:02, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> The AArch32 translation completion code for singlestep enabled/active
> case was a way more confusing and too repetitive then it needs to be.
> Probably that was the cause for a bug to be introduced into it at some
> point. The bug was that SWI/HVC/SMC exception would be generated in
> condition-failed instruction code path whereas it shouldn't.
>
> This patch rewrites the code in a way similar to the non-singlestep
> case.
>
> In the condition-passed/unconditional instruction code path we need to:
>  - Write the condexec bits back to the CPU state
>  - Advance the singlestep state machine and generate a corresponding
>    exception in case of SWI/HVC/SMC
>  - Write the PC back to the CPU state if it hasn't already been written
>    and generate an appropriate singlestep exception otherwise
>
> In the condition-failed instruction code path we need to:
>  - Set a TCG label to jump to it if the condition is failed
>  - Write the condexec bits back to the CPU state
>  - Write the PC back to the CPU state since it hasn't been written in
>    this case
>  - Generate an appropriate singlestep exception
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>

This looks much clearer than the code we had, and the parallel
between the singlestep code and the non-singlestep code is nice.

Applied to target-arm.next, thanks.

-- PMM
