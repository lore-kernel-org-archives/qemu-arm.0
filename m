Received: by 10.28.4.212 with SMTP id 203csp3945627wme;
        Tue, 17 Apr 2018 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+m+aXMR+iOFPOwezbHOddW3vq31K0Xq4q1WHWNac+jV9jVaPcBh6KN5MdTB09eWsAQaXti
X-Received: by 10.129.52.201 with SMTP id b192mr1608127ywa.120.1523978484530;
        Tue, 17 Apr 2018 08:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523978484; cv=none;
        d=google.com; s=arc-20160816;
        b=Dbtaarm/imzWKgvXSV+TdQfqYff0gezxWfSfOMipzN3oP+Fi+U6pgBQzwuxRfd7+Iq
         +R4Y66e2wTix4s0B8uA5P8AJBZnm0mXsgjrYbJ+DZO+/9fHxgjyzEtEScR37kFuHghEb
         U3BsFp3srgj5DVllvxWgeHmOe7ftIdqLVrzf7xkLRazHwsPFKmi1Phfd7kGLl8r8wJYx
         wsFlUAUGW8XyM0g+KVNgqgW+I6BQIHw8qTJIOkULZiEEpRAg/n3Yzj25oN4QNYbzeL3B
         uurmjpVPnZcACV15cuG1U5NqDE29RYU03kgKMFy7EXpM+O1EFtL/Yzl86z8laH1aDcxF
         xmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=yK0wH9Le7lOvab4rDS5eIdgAlHqXYf7cl5BNveEDbSY=;
        b=l7Is27xMNqlvYDtz6q5WLnzmvChHWdrdIQDQjg/LlS8Cm6JZK31iOGISxr52XDZAb4
         V2ULc8VEF6zoSQd4M16ouf+WIGrUk1saiMzBd1H0EaaRjg4Ti3vKGhsSNuc9iVZjdcDu
         3E8L0O8r08Wh9imCSWUa+HYJuCPnnIymtKa0/+PGoRmJEMspgjOXwzrCu9A2DqZx7OG1
         I59uGB7Ns/RN8lip2cWxy1IlGCjwWlkI/ripCQWvvfCm2uUF81pRhKLuTnS19nrmecI/
         uiXejOdbUQKFufFDCHjNSd+2awYNPnHutqYjPHeyuy7YD5+o2roftLfds0m+nww+GEhW
         9o2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XvlA51Iw;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NGw14yX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c73si1335932qka.162.2018.04.17.08.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 08:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XvlA51Iw;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NGw14yX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8SQ7-00028n-VE
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 11:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8SPv-00024d-Np
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8SPp-00021q-Pi
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:21:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8SPp-00021J-G0; Tue, 17 Apr 2018 11:21:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5C245606AC; Tue, 17 Apr 2018 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523978464;
	bh=jhiTXO5xKxIrdKTEPq6B9i2CZVvxRnULFI6I3wvZv+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvlA51IwfPsg4Vl/bbQXLtk0weLtASezzejxHJ87+a8dfx+5ME20Pr5RlNlPvuTi0
	Qz1Bbf9n3ORH206gXhdgSKpnML5de3jkl+CjfCjFGVMoiSiDoQcwhs+daw2vfErONE
	L9XPxWAan1rI3lFGeHKGK0iS3Miz9ZJBJLDR3mO8=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EDE52606AC;
	Tue, 17 Apr 2018 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523978463;
	bh=jhiTXO5xKxIrdKTEPq6B9i2CZVvxRnULFI6I3wvZv+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGw14yX7zBQv2k4iKOntf7xw++Blfkdxy59lLb5Iejm2qSOFyhebzY3/IJ+a8fWIr
	FmPwYeo/i3+UL+5o7OMdzQQg9uJ/mxACWfk1jo+dE4SAyBhzq9juUfah6EMQWOP39B
	qwgglPiBSXKh1q3TAYChVeNj0vUcmxJai3rmpNFw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDE52606AC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Apr 2018 11:21:01 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180417152101.GP24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-13-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_UP-DgPZPL8-sMAs9TFHiUrfya8LAxAnO2U_WJAMH6yg@mail.gmail.com>
	<20180412173625.GK24561@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180412173625.GK24561@codeaurora.org>
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
X-TUID: Ep495mWsOn8K

On Apr 12 13:36, Aaron Lindsay wrote:
> On Apr 12 18:15, Peter Maydell wrote:
> > On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > index b0ef727..9c3b5ef 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -458,6 +458,11 @@ typedef struct CPUARMState {
> > >           * was reset. Otherwise it stores the counter value
> > >           */
> > >          uint64_t c15_ccnt;
> > > +        /* ccnt_cached_cycles is used to hold the last cycle count when
> > > +         * c15_ccnt holds the guest-visible count instead of the delta during
> > > +         * PMU operations which require this.
> > > +         */
> > > +        uint64_t ccnt_cached_cycles;
> > 
> > Can this ever hold valid state at a point when we need to do VM
> > migration, or is it purely temporary ?
> 
> I believe that as of this version of the patch it is temporary and will
> not need to be migrated. However, I believe it's going to be necessary
> to have two variables to represent the state of each counter in order to
> implement interrupt on overflow. 

Coming back around to this, I don't see a way around using two variables
to hold PMCCNTR's full state to make interrupt on overflow work. I
haven't been able to find other examples or documentation covering state
needing to be updated in more than one location for a given CP register
- do you know of any I've missed or have recommendations about how to
approach this?

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
