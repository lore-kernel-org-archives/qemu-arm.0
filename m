Received: by 10.25.77.65 with SMTP id a62csp523472lfb;
        Fri, 10 Feb 2017 07:02:01 -0800 (PST)
X-Received: by 10.176.76.68 with SMTP id d4mr4735128uag.105.1486738920961;
        Fri, 10 Feb 2017 07:02:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i14si579074vka.217.2017.02.10.07.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 07:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccChy-0003Cz-HJ
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 10:01:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCge-0002ad-3u
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCgd-0000pC-CJ
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:00:36 -0500
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:35471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ccCgc-0000ow-Tg
	for qemu-devel@nongnu.org; Fri, 10 Feb 2017 10:00:35 -0500
Received: by mail-wr0-x233.google.com with SMTP id 89so109880512wrr.2
	for <qemu-devel@nongnu.org>; Fri, 10 Feb 2017 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sRs9rF29xOoh4UL971RPJcP7SWOj/pVbSpuxkKGKQsM=;
	b=dAbMH8+mdR0DNalpdT/4lFJuvkxIWTFIRiREZ/UNIRl3SNhsGIjQz7HmQM5N6cb5/d
	QljDYLTgDkf3q/hELQnO9DAJMln9Gv0j3Iodsd8ua8TR+eGHW69scYKbMGS5mG8kO5jH
	OSw34JdFkdP4SZcmtEIxhXnHIW7y3NobF2Eso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sRs9rF29xOoh4UL971RPJcP7SWOj/pVbSpuxkKGKQsM=;
	b=JyLYwVxErCtKA1MjHd6BSzYFwFlNKRdCWiYLvABb7wQ8pUMWmlQdsmYwVvgx4kHkdp
	WQlSE1tmJ51eOcXyrjv5HZw1mg2N7cZD6i5IjqoaqL4aTwYrZIyMm+P5WT6DCVKEUSHo
	q+G92L6jS217xH0cNp6nF0dut6CjTj5mlkt9Y3HTXpj2dKp4HqquqUgXo1nR+S2850um
	urxQyRobYz/pnSjj9GFEFAYiw6CFOTbe+YG+O3XWr/lkbc6bdZEsl1IpSnI5hakdX3z6
	C4F6DjtctDHRp9PDpEBT4myaLBSkWr7pNK80fkwGNCxHyt2+eJ5SRfzi2p7CvdxTm5SI
	aX3w==
X-Gm-Message-State: AMke39md8IiCkN0R/6AtizrH7BJ7z+VOLH4sEEwrA2T2M9/lO48dYHQ3KEDa0LlNe1FS7t8OZ5YwEAWoPqypnk6q
X-Received: by 10.223.136.152 with SMTP id f24mr7858200wrf.187.1486738833644; 
	Fri, 10 Feb 2017 07:00:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 07:00:13 -0800 (PST)
In-Reply-To: <1486504171-26807-1-git-send-email-wei@redhat.com>
References: <1486504171-26807-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 15:00:13 +0000
Message-ID: <CAFEAcA8+3+ZwOeA0cNXF_BRs-kivTye5bj7pcRsDAsJ4S1HwTg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-devel] [PATCH V3 0/4] Add vPMU vPMU support under TCG mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kN+1RM1rKIM3

On 7 February 2017 at 21:49, Wei Huang <wei@redhat.com> wrote:
> QEMU has implemented cycle count support for guest VM under TCG mode.
> But this feature is not complete. In fact using perf inside a
> 64-bit Linux guest VM (under TCG) can cause the following kernel panic
> because some PMU registers are not implemented.
>
> [  329.445970] [<fffffe000009e600>] armv8pmu_enable_event+0x58/0x8c
> [  329.446713] [<fffffe0000621e74>] armpmu_start+0x4c/0x74
>
> This patchset solves the problem by adding support for missing vPMU
> registers. Basic perf test can work (both ACPI and DT) now under TCG
> by applying this patchset.
>
> address@hidden ~]# perf stat ls
>  Performance counter stats for 'ls':
>
>         226.740256      task-clock (msec)         #    0.312 CPUs utilized
>                 76      context-switches          #    0.335 K/sec
>                  0      cpu-migrations            #    0.000 K/sec
>                 64      page-faults               #    0.282 K/sec
>        186,031,410      cycles                    #    0.820 GHz      (36.40%)
>    <not supported>      stalled-cycles-frontend
>    <not supported>      stalled-cycles-backend
>      <not counted>      instructions               (0.00%)
>    <not supported>      branches
>      <not counted>      branch-misses              (0.00%)
>
> V2->V3:
>  * Remove PMXEVCNTR_EL0 support
>  * Add read access support for PMXEVTYPER and change the CONSTRAINED
>    UNPREDICTABLE behavior of PMXEVTYPER to RAZ/WI.
>
> V1->V2:
>   * Change most PMU registers to 64bit and the behavior of PMXEVTYPER
>   * Add support for PMXEVCNTR_EL0
>   * Misc fixes (DT, ID_AA64DFR0_EL1, ...) under TCG mod

Applied to target-arm.next, thanks.

-- PMM
