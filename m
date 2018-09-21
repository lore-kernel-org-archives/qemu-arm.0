Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3180861wrd;
        Fri, 21 Sep 2018 07:02:34 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYjw+1wt/M7Us/X/8jC4yzDSA6uO1WGVZD/6Ehdb3ya4ACDFhKdyBUJ50wWfsK5G5uV8BZn
X-Received: by 2002:ac8:3575:: with SMTP id z50-v6mr5978349qtb.272.1537538554897;
        Fri, 21 Sep 2018 07:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537538554; cv=none;
        d=google.com; s=arc-20160816;
        b=NKgecMXaxWMMAQk79iQZSnc9o4EKyZ/51s5jjUkMXZxStpuWHHNUP6HOfboBnQJrU8
         LmfhC7Ldt1eISmWOTTai30TBKAFhds27RsHxxX1HX59KHusZKORmu15KZ+3FbH5QXtCv
         8ujgsgkDHRzeDoLOizoo8NeavQx3Z/Za+POHoSG728gkUpROwceh88ycKNi0KvACoNHX
         l1x1RRPNUvwePNNVmWmgTu1xiMgfVDYZ75GsMLfXaFZ4VPeFDbHoEG8Nq8c3D1cOIEzP
         VbdtIwYCPArFWjs91siSWNA9OOSMw0ic/1FmSoIKX3tL0Afg6N6Qt1DuC4n7B2qlgfET
         iSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=3AwXvKqh+EbG2LuVh5aUtN07nX4Ww6xunaDg444g1Jo=;
        b=wHlqi/3oDV9Ih7gV/XxzkWcOSVivRiRZF9wrBitv65sGBa5Uhn8pyQ7ahL9SsfGPle
         0o5rjhNN/hZwhLIT/FFdV/Cakg5uNCK3QZmKHOuHB7jAzF60wtRLmxVN1ns8Ycb1i1pd
         Bod/QzH2czRU0hRaO4srgQ3uT4SXUkDvq3JY9QZD/sE+qN4nNXmabJmf1PD19acnMWLJ
         lvCOtXM5a+uoFjcd4xWhdQVpm+7Iq/qN+C5jjhzV1LCDb5uCEOYaovHyoBqRaXK7R4w+
         AsGZvrNEJ+QkJWYlcDCSSCBfZInTPXo3rU6esrArBMMDeaVppq5w3s0G1OSUq7eSoD8i
         V95g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=K8nxOk4E;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NaSzAR5X;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NaSzAR5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f55-v6si218045qtc.65.2018.09.21.07.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 07:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=K8nxOk4E;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NaSzAR5X;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NaSzAR5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3M0w-0008JE-Ga
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 10:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g3M0o-0008AB-Lq
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 10:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g3M0l-0005yn-Ad
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 10:02:26 -0400
Received: from greensocs.com ([193.104.36.180]:53339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g3M0k-0005pG-Tc; Fri, 21 Sep 2018 10:02:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 18FE64F7672;
	Fri, 21 Sep 2018 16:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537538528;
	bh=wHnnBPdQzf9h6hVEiYwyyCD+S9CQ2lc2YiLsg7K56tI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=K8nxOk4ETFlxBN3Kf/gPIAZ+/QA2ocAk/w3qsYSiII9OHKr2fTRqhn7inj5SEPIzY
	ecgG1kDnSRwKZaGqTacZ4ap1kM7fsihOrD2uQQNoNy+gjmjfWp2iJVIrxOwFx5Z4eZ
	XpOAIWF6+mLFpsm9U4Mk0sg0tkPr4ixyX/oV+9Ok=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NaSzAR5X;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NaSzAR5X
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6KtVgAD-9g0; Fri, 21 Sep 2018 16:02:02 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 559CB4F7676; Fri, 21 Sep 2018 16:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537538522;
	bh=wHnnBPdQzf9h6hVEiYwyyCD+S9CQ2lc2YiLsg7K56tI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=NaSzAR5XnfPswyRvXNs/iD/yBg1igAU7GOBEanG+nNiEggHrnmHemqxEB4yOPCMy3
	wDdS2UKlUFJx1uSWeQ2S89YidElqz7aYBJy5hYJ1bS2TZ9KTiE3gq16s5JbqFH9SFL
	D1zZerfkqC9YrApdGT9eXssQeWaFjkkKgIqR/j0I=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E31B34F7672;
	Fri, 21 Sep 2018 16:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537538522;
	bh=wHnnBPdQzf9h6hVEiYwyyCD+S9CQ2lc2YiLsg7K56tI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=NaSzAR5XnfPswyRvXNs/iD/yBg1igAU7GOBEanG+nNiEggHrnmHemqxEB4yOPCMy3
	wDdS2UKlUFJx1uSWeQ2S89YidElqz7aYBJy5hYJ1bS2TZ9KTiE3gq16s5JbqFH9SFL
	D1zZerfkqC9YrApdGT9eXssQeWaFjkkKgIqR/j0I=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<CAFEAcA-C-cDEDuioZerKpAWaXvMkMBERkU-a2hoKVeSd4Lwaug@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <24eb48d7-a8f4-6dd3-d786-941dc227b881@greensocs.com>
Date: Fri, 21 Sep 2018 16:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-C-cDEDuioZerKpAWaXvMkMBERkU-a2hoKVeSd4Lwaug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 00/10] Clock framework API.
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qm2YUT/2KCev



On 09/19/2018 11:30 PM, Peter Maydell wrote:
> On 17 September 2018 at 01:40,  <damien.hedde@greensocs.com> wrote:
>> Regarding the migration strategy, clocks do not hold the clock state
>> internally, so there is nothing to migrate there. The consequence is that
>> a device must update its output clocks in its post_load to propagate the
>> migrated clock state. This allows migration from old-qemu-with-no-clock
>> to new-qemu-with-clock-support: newly added clocks will be correctly
>> initialized during migration.
>> But it is more complex for input clocks handling: there is no order
>> guarantee between a device state migration and the update of its inputs clocks
>> which will occur during other device state migrations.
>> I think that, for most the cases, this does not rise problems, although there
>> might be some jitter/glitch during migration before hitting the right value
>> (with consequences such as the baudrate of a character device changing several
>> times during migration, I don't think it is a problem but may well be wrong
>> here).
> 
> This doesn't seem like a good idea to me, since as you say there is
> no guarantee on migration order. It breaks a general principle that
> devices should migrate their own state and not do anything that
> disturbs other devices.
> 
> There are several possible approaches here I think:
> 
>  (1) the "clock" object holds no internal state; if a device on the
> destination end of a clock connection cares about clock state then
> it keeps and updates a copy of that state when the callback is called,
> and it is responsible for migrating that copy along with all its other
> state. This is how qemu_irq/gpio lines work.
>  (2) the "clock" object does hold internal state, and it is owned
> by the source-end device, which is responsible for migrating that
> state. This is how ptimer objects work -- hw/core/ptimer.c defines
> a vmstate struct, but it is the devices that use a ptimer that
> put a VMSTATE_PTIMER entry in their vmstate structs to migrate the data.
>  (3) the "clock" object can be a fully fledged device (ie a subclass
> of TYPE_DEVICE) which migrates its state entirely by itself.
> 
> I don't have a firm view currently on which would be best here,
> but I guess I lean towards 2. 1 has the advantage of "just like
> qemu_irq" but the disadvantage that the destination end has no
> way to query the current clock value so has to manually track it
> itself. 3 is probably overkill here (and also makes it hard to
> retain migration backward compatibility when adding clock tree
> support to an existing machine model).

I agree with you on doing approach 2. If the clock state needs to be at
the end, it seems best to put in inside the clock object. It will save
codelines in devices. Thanks for the tips about ptimer.

I don't see how approach 3 solves the problem since the clock state will
still be migrated by another object (instead of begin the device which
generate the clock, it is now the clock input object). So a device (with
an input clock) has no guarantee on the clock value being correct when
it will handle its own migration. I think the clock vmstate entry needs
to be present in the device's vmsd (or am I missing something ?).

Regarding backward compatibility on migration, I think we have 2 options:
(A) keep updating outputs clocks in post_load.
(B) rely on device with an input clock to setup a "good" default value
to unmigrated input clocks.

(A) has the advantage of ensuring an unmigrated input clock have right
value just at the end of backward migration. But there's still the
migration order jitter. (B) does not have the jitter, but unmigrated
input clocks will be at their default values after the migration and
will be updated maybe later on.

Given your statement about disturbing other devices, (B) seems the way
to go.

>
>> Concerning this frequency-reset port, we can obviously go back to the simple
>> frequency-only one if you think it is not a good idea.
> 
> I don't really understand why reset is related here. Clock trees and
> reset domains don't sit in a 1-to-1 relationship, generally. Reset
> is a complicated and painful area and I think I would prefer to see
> a patchset which aimed to solve the clocktree modelling problem
> without dragging in the complexities of reset modelling.

OK.

Do you think I should do a reroll right now with this 2 modifications
without waiting further review ?

Thanks,
--
Damien
