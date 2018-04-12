Received: by 10.28.71.155 with SMTP id m27csp2096827wmi;
        Thu, 12 Apr 2018 09:19:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/f1iyF147pIRl7T9UqgdqLxd+0qqIF5/DMHaIlU6hsD+cRyoJkpq8Oki30z4a36ODbOKJG
X-Received: by 2002:a25:3216:: with SMTP id y22-v6mr781253yby.277.1523549948956;
        Thu, 12 Apr 2018 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523549948; cv=none;
        d=google.com; s=arc-20160816;
        b=nGRmFmBtJX/wcaZWTciB6ZaBvIqgYNAzndjD5KsD6u009qy5YFEfED7FLEJ72/TjIf
         J75rvoBV45tPrnw3o+XdT3VHKFn/C0SqSAZJY6T1Zug7uRNshr2rp+SNkFpiAXdKauR5
         ASW2HgI/Bf1oiIgOHwolMjDEyRgg2C7N9fL4Y3HUCjrmoBfCOOEJ/Nnaj4twMAItVXpW
         A11Ql376P8uBXivKUwP1IQ52xcLL9RGOxbpvpvGN8ro5wwxGqyDxxDLVj/++GGxPwaoi
         /LEnBUnhaLuMAKDw5fC10qRI2z0gw+22J9+JuxAV46XiuSmYbJpF+wCvTASjeIM+7Hks
         CYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dnxVRFNQho5ffRDo2/cWgX8imzA/4mVmxKeskxAj64E=;
        b=TYo52myJITBnfJgW2hq6MLCchAhzf0naXn2O879EGCFf6v0/LzJlptj3PONI9HqA4D
         TBrQRZD3toLeFK9jMuxCuR6JUBK8SKB4B+ohKu4Biw0Xb04ZcPaWYhT0g6RtYX1Vq64J
         legLBxaYy7BTMQOMFf0XcuJ6sauyaOStzW6aGCirQciqXF9JrGgDhfPDLANy4XqfgbU7
         dQhE+Qh25DLY//CwoPQFw6a8v3A74HTaG1wyc5dBxx0gIV0Eiz19CsRthrFNOHbi580J
         j89zLqy0hgK5bnUf+ftB0acMroS81FiF3Ah5zsN10SZSjyg8llh0ksCDKCJmKDCSPPed
         U/Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eRbDwMKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m72si265361qki.29.2018.04.12.09.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eRbDwMKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6ewG-0006xP-Ft
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:19:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ew2-0006t7-6g
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ew1-0004Y4-C6
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:18:54 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:39542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6ew1-0004Xn-5Y
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:18:53 -0400
Received: by mail-ot0-x242.google.com with SMTP id a14-v6so6654516otf.6
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dnxVRFNQho5ffRDo2/cWgX8imzA/4mVmxKeskxAj64E=;
	b=eRbDwMKU6Swpp0Yov+Soe1byt2R4jgHWd1OcwHQv+bJaAWRbPorouhfJ22WjuM+m+t
	b+gOIvPL+DgDbZZApqPdDMcMqHScSgCfUNLzMd4KT2JtqcPFb52mtqNbqCUwgtU4k9kW
	ZILC/UqR0NguyGt9+BiKMy26BowCBhludCf/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dnxVRFNQho5ffRDo2/cWgX8imzA/4mVmxKeskxAj64E=;
	b=hSvcT6YqmitfysyWQok0b3rSYLDGthH6P712k+MyNvMVEBPn23bn4V7Paq8Yo3jVYQ
	4UN94IbmQrnW+j99wEfHrMUoq4HA4GClSHo9rm6Ugwkm2+YoOvrqz/h0evvWvsrecKol
	iBKBICI5ALh6g1540IwZjaN+OqTxCl+VoPluNselZJFyD+jczFKWHKS2FtaR9+DMPrbK
	pE+5h+DJFUAFvdKF8iDlwCKQkAiiizBuH2EBTf3VmDZLzs8dWxTEvcATmD4HZ9/Q+W7q
	Fuop1synm7osQH8gmHcmA1/KzIRXin1U+E2xKyeOjT55Y9Abcb+3N1t34CnCPgSCxHyL
	/SbA==
X-Gm-Message-State: ALQs6tDDlU9L3C1URXinrXEKZz5QJYvCUlxOPdy2H6NU1xvi5sZEObXt
	8bfd4wZKkkDJTqQcrEeAn7mFq1sVUkaj+QWpYP9PEQ==
X-Received: by 2002:a9d:285d:: with SMTP id
	h29-v6mr1075231otd.205.1523549932449; 
	Thu, 12 Apr 2018 09:18:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:18:32
	-0700 (PDT)
In-Reply-To: <1521232280-13089-6-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-6-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:18:32 +0100
Message-ID: <CAFEAcA9Hd5dsfPM=ggepk2MxFJdxHB1uiJzwpDy5628D7JF5ow@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3 05/22] target/arm: Reorganize PMCCNTR read, write,
 sync
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IF5JH62Q9flQ

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Split pmccntr_sync into pmccntr_op_start
> and pmccntr_op_finish, passing the clock value between the two, to avoid
> losing time between the two calls.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 101 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 56 insertions(+), 45 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5634561..6480b80 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1000,28 +1000,58 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
>
>      return true;
>  }
> -
> -void pmccntr_sync(CPUARMState *env)

If you configure your git to use the 'histogram' diff algorithm
("git config --global diff.algorithm histogram", or edit ~/.gitconfig
equivalently), does it make git format-patch make less of a mess
of this commit ?

> +/*
> + * Ensure c15_ccnt is the guest-visible count so that operations such as
> + * enabling/disabling the counter or filtering, modifying the count itself,
> + * etc. can be done logically. This is essentially a no-op if the counter is
> + * not enabled at the time of the call.
> + *
> + * The current cycle count is returned so that it can be passed into the paired
> + * pmccntr_op_finish() call which must follow each call to pmccntr_op_start().
> + */
> +uint64_t pmccntr_op_start(CPUARMState *env)
>  {
> -    uint64_t temp_ticks;
> -
> -    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +    uint64_t cycles = 0;
> +#ifndef CONFIG_USER_ONLY
> +    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
>                            ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> +#endif

Is this ifdef necessary? You have a do-nothing version of
pmccntr_op_start() for CONFIG_USER_ONLY later on, so presumably
this one is already inside a suitable ifndef.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
