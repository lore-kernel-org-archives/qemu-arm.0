Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp892723wrq;
        Fri, 22 Jun 2018 07:23:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIVWxT+7uqlUslJWaqBYchGy4lXUT5JfRdYB9phZNbp16Fbrk3nr55/3YMF/Yo9TCyiJ+Q5
X-Received: by 2002:aed:3766:: with SMTP id i93-v6mr1574869qtb.277.1529677396796;
        Fri, 22 Jun 2018 07:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529677396; cv=none;
        d=google.com; s=arc-20160816;
        b=Xk14ynMn/iewtyJRUbN2kpx1aoU7z7jVqNDXZxY6CPYgt6yxa2y6n9UOGcODMoEUBN
         25rNC3CrQCR6DDLV0e56FGrMeAa9tnZZjLIMxyc71CHEq5T9FKsKdxkd+AfYzJA2+DgI
         TIJdXCJ6xTU45oUxwH/BBeJ+sD+12J/1I8zQ06RI4m4QKBAyLE4XPVzwPrfzEkETNPV3
         XqYlvOgAkY9Fetua1nx3hgopZq4J6FuzMVKXbFOIe/HG5YOWUce/P9eF4Q3EYoZSs255
         cG4K+JynWy9kGBwsZf8ABFONv6ceSf6G0VX4ljn5eC6UMEzJKzflgBNw6GS5HTIVLF/T
         Dz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dCwKCmfxcqGwaBA03MWOxNPewon9cMCzcVxujpIPlDk=;
        b=wOvldF7ZANqVIVr2qoOZMRWzyWbc/fCbF9KWeHRJBRwieHBIZRc9o6rYlEbkOBhPIJ
         zPJHB+HVP6lh740xhOX+zqq7sDiq5ZFIo1qtYyMGWU9I0deEOWKOMtAxOzHe+24UJuTc
         udDZfG9nAxojVz99jK1z4vtBciUoI9OCT+Yw706eybVR8cW+YszwSkWA5I53WvUMH62w
         YYDXL1xiZStjYAHFuVzH15mqLPYrzwG+8HvomVRHhc+3F6o4SsOJ7vbwceK07hcHMq8H
         ia7IhDGD9HXbqVw0b8rLaT2slOCJPKfv5Rtn037Hos/0ALC77U60eeMAoNvRaWNrqiq5
         +29g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoJjovyn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6-v6si416334qvf.88.2018.06.22.07.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 07:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoJjovyn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMy4-0006fs-2k
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 10:23:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWMkC-0003KH-9M
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 10:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWMkB-000527-8I
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 10:08:56 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:46632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWMkB-000520-2C
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 10:08:55 -0400
Received: by mail-ot0-x243.google.com with SMTP id v24-v6so7602240otk.13
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dCwKCmfxcqGwaBA03MWOxNPewon9cMCzcVxujpIPlDk=;
	b=UoJjovynVRGcvAu3Nrd7U0AutQboVVF5cdqpPsbSZk9SfzdgDU2ieRCZjjs7g2OsPU
	4BvcR9vZCH5dIsEMP1t0NrgOhn7E2TUwylDd0F/NbXVIOkPPog+/3zrHOLa5zTsojm0e
	aX3aS5/DzZKzJB8TQ2IM4XfDgphSn2h/zE7j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dCwKCmfxcqGwaBA03MWOxNPewon9cMCzcVxujpIPlDk=;
	b=t2a7pFkzcMqSkc+ZMCguP0MzodGspodWlWeZL+fWrYmtsk5mcZmWxy95G6UosahTOk
	GWGUQ2gmirxh6vmxbho3NTAoukYtaavXgRi0rHmFnm63Y2uDtivDhvYgdQhxFIjzkchx
	LPYk6kGcOX75NFxM/wdTubFvSgd/GxAAySDvcqcQRO5g9ERAmi2HsgADl2+c1+OitB3P
	tNC11I8QvEpKmTtEy9Tm7yyY/Pr2ne0E1p2+jx0qhAkNrlRmDmN1KR9kAxIZ2XiPtgLE
	FVCTBmLMHa1NbAS/rm+CumvrX8stP1lZcKgiXlpYyKZw8FMg0FLpBO/AXs/d03QRuWJH
	6Szw==
X-Gm-Message-State: APt69E0fngxnc4eKj0cmcqZy1XdGUctSpLQPF5QgSWqhRyYkU+QfrX1j
	ZLMB7m04+2flFvHp9EGRuu16cn/cZ8B22sGw2wYLzA==
X-Received: by 2002:a9d:64c3:: with SMTP id
	n3-v6mr1121607otl.210.1529676534328; 
	Fri, 22 Jun 2018 07:08:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 07:08:33
	-0700 (PDT)
In-Reply-To: <20180622135045.GD12424@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_g1Bb=-cj+QToHDypZPiqw_U5YioRWfDSs0Ano3PqDTQ@mail.gmail.com>
	<20180622135045.GD12424@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 15:08:33 +0100
Message-ID: <CAFEAcA_EEXRQQjXDsei0Y6mQB6EVTtJB5=EFHFsT7kbZk5iv6Q@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v4 03/21] target/arm: Reorganize PMCCNTR
 accesses
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
X-TUID: Wcwtno+JlVbU

On 22 June 2018 at 14:50, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 20 11:17, Peter Maydell wrote:
>> On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
>> > pmccntr_read and pmccntr_write contained duplicate code that was already
>> > being handled by pmccntr_sync. Consolidate the duplicated code into two
>> > functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
>> > c15_ccnt in CPUARMState so that we can simultaneously save both the
>> > architectural register value and the last underlying cycle count - this
>> > ensure time isn't lost and will also allow us to access the 'old'
>> > architectural register value in order to detect overflows in later
>> > patches.
>> >
>> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>

>> > -        /* If the counter is enabled, this stores the last time the counter
>> > -         * was reset. Otherwise it stores the counter value
>> > +        /* Stores the architectural value of the counter *the last time it was
>> > +         * updated* by pmccntr_op_start. Accesses should always be surrounded
>> > +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
>> > +         * architecturally-corect value is being read/set.
>> >           */
>> >          uint64_t c15_ccnt;
>> > +        /* Stores the delta between the architectural value and the underlying
>> > +         * cycle count during normal operation. It is used to update c15_ccnt
>> > +         * to be the correct architectural value before accesses. During
>> > +         * accesses, c15_ccnt_delta contains the underlying count being used
>> > +         * for the access, after which it reverts to the delta value in
>> > +         * pmccntr_op_finish.
>> > +         */
>> > +        uint64_t c15_ccnt_delta;
>>
>> So the key question here is: how does this work for VM migration?
>
> To be honest, I'm not sure I fully understand the things I need to be
> looking out for with VM migration.
>
> My guess, though, is that this current implementation is not sufficient.
> Perhaps there needs to be logic to ensure that c15_ccnt is the current
> architectural value before migration and also to setup c15_ccnt_delta to
> be the delta between that architectural value and the underlying cycle
> count upon inbound migration. Does that sound like an approach which
> would fit well within the rest of the migration framework?

You need to deal with two different situations:
 (1) migration from an older QEMU which doesn't have this patchset
 (2) migration from a QEMU with this patchset to one with this patchset

Either:
 (a) all the architectural state can be expressed in our existing
state fields in whatever the previous format was -- in this case
you just need to ensure that cpu_pre_save() and cpu_post_load()
put the state there and unpack it again
 (b) we were missing some architectural state and really do need
to transfer more over the wire than we were before -- in this case
you need to add a new subsection to the vmstate which has the fields
that contain that new state, and give the subsection a suitable 'needed'
function to indicate when the subsection should be transferred plus
pre_load and post_load functions that allow us to cope correctly with
the case of the older QEMU that doesn't send the subsection.

thanks
-- PMM
