Received: by 10.28.4.212 with SMTP id 203csp4219687wme;
        Tue, 17 Apr 2018 13:04:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+M1pQ5WjlFvzt4yMn9XTqTEY+TkJdt69r7ARGmK1lQ8I+6wYCVK9xm+stNv2fNC2esjwkm
X-Received: by 10.237.43.163 with SMTP id e32mr3540310qtd.272.1523995442752;
        Tue, 17 Apr 2018 13:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523995442; cv=none;
        d=google.com; s=arc-20160816;
        b=G61zvq1XwUnLBSysNd06KkzZiqva6VVFwPgMYqgrRd5M/pNvDIjS+WSJPMO7L6jid1
         gdIu2ywXwbGgnRElsRqe4ldBuL+HcbExLmXD8F3Mu/9OYI2qTCPHHhVqvMHnXxaPKay1
         zxouZwDr7dZR+4BCk9PeedI5p4QJ1EVVUpi4lg+p7ugqN4aTN0Vsa8Bj/VE745nVy65E
         Wtdjf7eCr8wD9TgX8d8iErqQTgloY5zP85iF52fXqI2F0a2InJc9x2Sw/uW8SSyGX3Aa
         FjBKpP+bfflq2OaiOExG+DPp0vaMP/rs3oXOgFcRHXoXP5/sbW6wZXQ3lwSKzn2mTpDD
         sK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=1A2d7l8HJ/3PNFGd8464fBrEHDh9GHzsVkIGs9XxwLg=;
        b=oTUYuK/MSEr4bhVDbHWhJCczStiifKeayueEVvIPCnhOkNOXDELFtOLBoYG7Jesg96
         ErKigyB4LRmGsKkPsKGSR12FbwkRP/4gCqb8wGC89vLUAo5OzMhjeqiRgxUQqLfr9ZU3
         booLPL1a6K8W2FB+LfcVWNBB7iq6vr3+OSNZTvkHGU8rqcgebZLZa0F1U9/f+8e2n9Qr
         xon8twHtv2UGZTmP9g9gGo56GbRmnEa7G+hcEnidOgSIt0JuI5Og/SZDETZkjQ69styM
         AnA5oSf6VmcWFerkeTkkPGWjaEJzq5CW9JDd3hJYfZFEHbQFkqxxtWXv8Pj/yuk8TgVA
         lHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ESpe5zht;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=dwZug4KB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62si3822176qka.155.2018.04.17.13.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ESpe5zht;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=dwZug4KB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8Wpe-0005S9-Bz
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:04:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8WpU-0005R9-WD
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8WpR-0006pV-Pj
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:03:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8WpR-0006gm-FP; Tue, 17 Apr 2018 16:03:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 2E06B6081C; Tue, 17 Apr 2018 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523995428;
	bh=efaCTqOM2a8DBB6RuonhHsFHJjzKBnOZOq2T4smNcD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESpe5zhtpXM4+f1J2SIyZFBCKyEsK4o2o7/yckh9VK2Z7xn9qE6OknYYotisWI5aZ
	kLNhKd/K4RKd2JD8lqlmq9M0fR5hA5Mva7t24QyQY7sliPrSkG7MTHVFQDs9AvnwyD
	hUzuaBF/pi2umZ/e5KVXUFjeo9BHnJ1II+EPyX2w=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EDCA7600ED;
	Tue, 17 Apr 2018 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523995427;
	bh=efaCTqOM2a8DBB6RuonhHsFHJjzKBnOZOq2T4smNcD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwZug4KB5T0kGBnWzpVN5mmKWbzoCR1jNqoVG0qvPhhr68Ws8A1SR7gFIanU5V00J
	LKcPpvGz9tyMjUezrrdxQVU6gYHOOkEBDwyVmLRIRM+GTUpSb3PB9tJgfFzwbrDQrF
	b8acufnKGnwTGE6f//83msEInp8qF6sV/3Xg7G34=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDCA7600ED
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Apr 2018 16:03:45 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180417200344.GQ24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-13-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_UP-DgPZPL8-sMAs9TFHiUrfya8LAxAnO2U_WJAMH6yg@mail.gmail.com>
	<20180412173625.GK24561@codeaurora.org>
	<20180417152101.GP24561@codeaurora.org>
	<CAFEAcA_QdPChiMPtZt7t_aqQTUcSDweGVG0anchKYH6KtEgEYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_QdPChiMPtZt7t_aqQTUcSDweGVG0anchKYH6KtEgEYw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 12/22] target/arm: Filter cycle counter
 based on PMCCFILTR_EL0
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
X-TUID: IGTvgQsfsKCk

On Apr 17 16:37, Peter Maydell wrote:
> On 17 April 2018 at 16:21, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > On Apr 12 13:36, Aaron Lindsay wrote:
> >> On Apr 12 18:15, Peter Maydell wrote:
> >> > On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> >> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> >> > > index b0ef727..9c3b5ef 100644
> >> > > --- a/target/arm/cpu.h
> >> > > +++ b/target/arm/cpu.h
> >> > > @@ -458,6 +458,11 @@ typedef struct CPUARMState {
> >> > >           * was reset. Otherwise it stores the counter value
> >> > >           */
> >> > >          uint64_t c15_ccnt;
> >> > > +        /* ccnt_cached_cycles is used to hold the last cycle count when
> >> > > +         * c15_ccnt holds the guest-visible count instead of the delta during
> >> > > +         * PMU operations which require this.
> >> > > +         */
> >> > > +        uint64_t ccnt_cached_cycles;
> >> >
> >> > Can this ever hold valid state at a point when we need to do VM
> >> > migration, or is it purely temporary ?
> >>
> >> I believe that as of this version of the patch it is temporary and will
> >> not need to be migrated. However, I believe it's going to be necessary
> >> to have two variables to represent the state of each counter in order to
> >> implement interrupt on overflow.
> >
> > Coming back around to this, I don't see a way around using two variables
> > to hold PMCCNTR's full state to make interrupt on overflow work. I
> > haven't been able to find other examples or documentation covering state
> > needing to be updated in more than one location for a given CP register
> > - do you know of any I've missed or have recommendations about how to
> > approach this?
> 
> Can you explain the problem in more detail? In general it's a bit of
> a red flag if you think you need more state storage space than the
> hardware has, and I don't think there's any "hidden" state in the h/w here.

The critical difference between hardware and QEMU's PMU implementation
is that hardware detects overflow when the overflow actually happens,
which would be inefficient to do in software. Because QEMU stores a
delta from the 'real' count (i.e. the clock/icount) and only updates the
architectural counter values when necessary (when they're read/written),
checking for overflow is less straightforward than checking if
incrementing an individual counter by one flips the high-order bit from
1 to 0 as it happens. If the only information you have is the current
counter value, and don't know how many events have occurred since you
last checked or what the counter value was at that time, you can't tell
whether or not it overflowed.

I haven't come up with a way to correctly and reliably detect overflow
without storing additional information. I'll go ahead and post v4 with
my first-pass implementation of the overflow code and see if you see
something I'm missing or can think of a trick we can play to keep this
inside of one register value.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
