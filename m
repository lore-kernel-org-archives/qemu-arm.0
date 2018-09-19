Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1141922wrd;
        Wed, 19 Sep 2018 14:30:54 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbqOseVl4gyhvgZaTrYQadMlt6AM3ICw4WrgYaAy+Ne7qAbKDSvCUo1R+Xr6LbkQTYFMcsU
X-Received: by 2002:a37:7286:: with SMTP id n128-v6mr25266651qkc.124.1537392653949;
        Wed, 19 Sep 2018 14:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537392653; cv=none;
        d=google.com; s=arc-20160816;
        b=YC85jljjAXv5HHZjSERhnX0rPe7acKnUcM0kp0DzffpDsvZD4dS8rSpSq9RmMepA0a
         I4rKcNnBkrc8FvsZoHgUBjWmX0OfPoHVzxVGJOpfv7VnV6pdhp5nWDLfK8Hl/56Z4Mxv
         6fWKJLhhsCyI/o9nPRwlz3ALdj8DCodYrVKrWgp+Tw6n/FNNeYiP5gUoaJbWoU1Pnwcj
         V0JjonTpe3boQkwpG+HAROLJmwWdOAP8NoqSYl1S+QD2fsy7G/naOAGqj3GjegKCSUcU
         aGmKrJR5PwEw3rVlyB2GBvMg1GDD5AouYZUG5/w5MHSxslZTswjYerC+iQDHCQ9+N0oa
         7XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=uloqL7/iPHpACqsbU8LFYaEFgy5esk4GxA6OwUEPdIQ=;
        b=q5au0hT82g3TxG/P1El4T7RbQDCn/b9EKKDRMMcHsp2mVD+3w04be++fthJB2Jf7+q
         OjFRD2N80QmHvuKQ/mpSdUJfJOKNQcf9R0gq3ckv8B3suv6PyYDOILatuhMc5nPkoDRb
         L9ULYcsSJ9Muovr8UI0RwlyEexRWPMNySBZzzpUC5BUKMBxFNKnW7y51hmXmD8dIIMZe
         umwXpaXBANHMcUT2wvIMGyqvZugKW7Z5qPThALtVFpl69UTDeI/jKHNUMkrziezvsnvV
         72VCQdG5gWmpeSrPN5crbHBXxxUPAhSE52JRQnHwmaBPc4lZdmVWD7VpDasYHyEahlxn
         BtQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aPDNjn/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18-v6si468090qka.151.2018.09.19.14.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 14:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aPDNjn/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2k3h-0005Qe-GZ
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 17:30:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2k3Z-0005Pi-HR
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 17:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2k3W-0006no-S1
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 17:30:45 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2k3W-0006nB-Kj
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 17:30:42 -0400
Received: by mail-ot1-x332.google.com with SMTP id n5-v6so7301681otl.5
	for <qemu-arm@nongnu.org>; Wed, 19 Sep 2018 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uloqL7/iPHpACqsbU8LFYaEFgy5esk4GxA6OwUEPdIQ=;
	b=aPDNjn/ZFBIHIntxFLSnlF0eTVRvw//zNYhNa1lfvVCPJlY1u1Vsr6aQWr01uv793d
	TiPH662bfoX6/0WqzQwxtSA/SrHWXu0+zXEEE25uoBnYlHDZKmTc1FdRkowccnpUNfj/
	h6PTMzZQS3L/LELNdT4h/AgM+Mt8jV5UCmqqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uloqL7/iPHpACqsbU8LFYaEFgy5esk4GxA6OwUEPdIQ=;
	b=BL0LAfgYb+8F5019FRQPxfMj3e5osw28auz9HRUVjEA/jZ5GJOTqL/RwHGlv9z1AeU
	Gyv14VRZ5xJLrXesaSNyqz3dBFSEvHg7cVZQJrikWBXY0t/MXyx8lV4yd4ecm78WfPYR
	5rVZn42peztifnGDOnJV9MtvVJ+3Yj2DTka5rndIp/hxURYTrdVBO3HU+Fyj/s1r4GoE
	2vBQi7eQt1vvDFPFzzemmPMP2nQv05HVdg46f/toPKRw8E52+Ld71t8J2HGiKSF2oteK
	SHyfHuNYOkIH+HZgZmbvSISMSNn3KMZGLSJDL7u9adb0wi2VT9HOPqjFGY+hWn9/vrZK
	OHJw==
X-Gm-Message-State: APzg51AgItZcyadmKlR9PVzSK8fzNyS8XisxjJyEvMl73C4RDDwT1HK0
	vR1NuaaS6U21MJumaDgrk5BM4lN4tXYW1Y8UqaTK3Q==
X-Received: by 2002:a9d:82f:: with SMTP id
	44-v6mr20944813oty.377.1537392641643; 
	Wed, 19 Sep 2018 14:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 14:30:21
	-0700 (PDT)
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Sep 2018 14:30:21 -0700
Message-ID: <CAFEAcA-C-cDEDuioZerKpAWaXvMkMBERkU-a2hoKVeSd4Lwaug@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::332
Subject: Re: [Qemu-arm] [PATCH v4 00/10] Clock framework API.
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
X-TUID: zGAtmxH4+bYI

On 17 September 2018 at 01:40,  <damien.hedde@greensocs.com> wrote:
> Regarding the migration strategy, clocks do not hold the clock state
> internally, so there is nothing to migrate there. The consequence is that
> a device must update its output clocks in its post_load to propagate the
> migrated clock state. This allows migration from old-qemu-with-no-clock
> to new-qemu-with-clock-support: newly added clocks will be correctly
> initialized during migration.
> But it is more complex for input clocks handling: there is no order
> guarantee between a device state migration and the update of its inputs clocks
> which will occur during other device state migrations.
> I think that, for most the cases, this does not rise problems, although there
> might be some jitter/glitch during migration before hitting the right value
> (with consequences such as the baudrate of a character device changing several
> times during migration, I don't think it is a problem but may well be wrong
> here).

This doesn't seem like a good idea to me, since as you say there is
no guarantee on migration order. It breaks a general principle that
devices should migrate their own state and not do anything that
disturbs other devices.

There are several possible approaches here I think:

 (1) the "clock" object holds no internal state; if a device on the
destination end of a clock connection cares about clock state then
it keeps and updates a copy of that state when the callback is called,
and it is responsible for migrating that copy along with all its other
state. This is how qemu_irq/gpio lines work.
 (2) the "clock" object does hold internal state, and it is owned
by the source-end device, which is responsible for migrating that
state. This is how ptimer objects work -- hw/core/ptimer.c defines
a vmstate struct, but it is the devices that use a ptimer that
put a VMSTATE_PTIMER entry in their vmstate structs to migrate the data.
 (3) the "clock" object can be a fully fledged device (ie a subclass
of TYPE_DEVICE) which migrates its state entirely by itself.

I don't have a firm view currently on which would be best here,
but I guess I lean towards 2. 1 has the advantage of "just like
qemu_irq" but the disadvantage that the destination end has no
way to query the current clock value so has to manually track it
itself. 3 is probably overkill here (and also makes it hard to
retain migration backward compatibility when adding clock tree
support to an existing machine model).

> Concerning this frequency-reset port, we can obviously go back to the simple
> frequency-only one if you think it is not a good idea.

I don't really understand why reset is related here. Clock trees and
reset domains don't sit in a 1-to-1 relationship, generally. Reset
is a complicated and painful area and I think I would prefer to see
a patchset which aimed to solve the clocktree modelling problem
without dragging in the complexities of reset modelling.

thanks
-- PMM
