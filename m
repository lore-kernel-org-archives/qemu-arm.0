Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp871633wrq;
        Fri, 22 Jun 2018 07:04:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdx1jwk+4uPUUa45bSADYHzir4GhO5nplRi0WT9nYSFiWXzoGgubNVKJJHsDoAn10J74+A1
X-Received: by 2002:aed:380a:: with SMTP id j10-v6mr78813qte.223.1529676257317;
        Fri, 22 Jun 2018 07:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529676257; cv=none;
        d=google.com; s=arc-20160816;
        b=f1ZWHBcKrx2/5IZLIICuNWWfLahcR404lk/ulbFWURapyOTjfk+M9AzbTb5t1pwtmO
         o3f1CoZZ0VRXSqcUWrYsT1z+9NIgrlQiZujsoqCpzEjmi4l25XhrOjE+aqCZZWSCV6/n
         CroZrQvXTP0pTgzhs3dQtZHjk0o/QonqkZsT4swjGzIwyoQyK7Bm4Ai6jC7+Yth6Y/ii
         PVNLG7OKc+R5TEuCNNEIOtqYnjrhNvY+6X+mCiqkbgRll+ptifvkIQ5h2ITLIDte3TyS
         uVe7c5rwkgpEQBva8OoPPQW2dbT6BH/qTGXqEQuhd5i14Pq+x7/ZVHXxTk5mYx+kb0Ss
         WpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=rLNslp5OgefZzxq7vSZ6BzcibQiqO+RbweDbAOE8Fas=;
        b=GQhckl8bsWoE7tQuB5N+oLPTy6f/MIvh6WNiK36ZyXkwLNbWCbQul+RThrQR0OmgRd
         f0Idy9XFMBCPhjybcmPUQWOIzSSCnOgXd2YL+uJI9xTixOcy7FQj5SSL/xSmBoH+dCZA
         IAoatjD20uOflAy124IsiO2OIq2LJGBLg5BwNLAmb7SprepTqzi0hzfgBfasfT0OTgx1
         u/riSHWF3V11siIqFV4ZLW/V75PNvVDoluiwYUbW2L1Qy5fhT2co4c6Dg83jFrPTyb4l
         DgBpW6gtYk0VkKBsNB0ZkIhQ4sn/MwDwfCBOlj+nRQjTOOJeqddYm3hs6P2xoU2syLuo
         5IRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b="JenEY4/9";
       dkim=fail header.i=@codeaurora.org header.s=default header.b=di1SeQWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si7299914qki.277.2018.06.22.07.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 07:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b="JenEY4/9";
       dkim=fail header.i=@codeaurora.org header.s=default header.b=di1SeQWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMfg-0008C4-ID
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 10:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWMSm-0005dz-Ea
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWMSj-00088c-DT
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:50:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWMSj-00087c-3u; Fri, 22 Jun 2018 09:50:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4A81B6063F; Fri, 22 Jun 2018 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529675449;
	bh=4qJ5yXgXPa9qPj9J7u9EYN5m2nh9CmYdtFrBXUYNJGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JenEY4/91yn5l/KL9JlmUgf5brnHq4W8qIpVlyFc/tKNgd/0YVrhQn2Hx85E+Rpco
	ReQJqDmoMUOuTZmTBPUmU7d+6VgSBNcZYqCtSJzhTxJJ1YE96IRvVgQMrXQtMip/ID
	41tc8PdsVMi8L/nelP2yFgk9SwTFUDvORX+YIXYE=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AC4BC60264;
	Fri, 22 Jun 2018 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529675448;
	bh=4qJ5yXgXPa9qPj9J7u9EYN5m2nh9CmYdtFrBXUYNJGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=di1SeQWSNosww+mEU4QHIGJhOz+XOZTna50LGoie1+WBcegjmfqkuWnANJeZouzuW
	JWxf3n/WZh1pp4GcExSoXPkS4XiPCdN1QUneYOHIa/9HKBTTJRSJ16szYXFFs9gEHG
	N5Ymiq803xevLrYkAmAZSqF6JZK1Qrd/KjZ0tqFw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC4BC60264
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 22 Jun 2018 09:50:45 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180622135045.GD12424@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_g1Bb=-cj+QToHDypZPiqw_U5YioRWfDSs0Ano3PqDTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_g1Bb=-cj+QToHDypZPiqw_U5YioRWfDSs0Ano3PqDTQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
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
X-TUID: yVg+hJPn4qYK

On Apr 20 11:17, Peter Maydell wrote:
> On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > pmccntr_read and pmccntr_write contained duplicate code that was already
> > being handled by pmccntr_sync. Consolidate the duplicated code into two
> > functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> > c15_ccnt in CPUARMState so that we can simultaneously save both the
> > architectural register value and the last underlying cycle count - this
> > ensure time isn't lost and will also allow us to access the 'old'
> > architectural register value in order to detect overflows in later
> > patches.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.h    |  28 ++++++++++-----
> >  target/arm/helper.c | 100 ++++++++++++++++++++++++++++------------------------
> >  2 files changed, 73 insertions(+), 55 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 19a0c03..04041db 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -454,10 +454,20 @@ typedef struct CPUARMState {
> >          uint64_t oslsr_el1; /* OS Lock Status */
> >          uint64_t mdcr_el2;
> >          uint64_t mdcr_el3;
> > -        /* If the counter is enabled, this stores the last time the counter
> > -         * was reset. Otherwise it stores the counter value
> > +        /* Stores the architectural value of the counter *the last time it was
> > +         * updated* by pmccntr_op_start. Accesses should always be surrounded
> > +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
> > +         * architecturally-corect value is being read/set.
> >           */
> >          uint64_t c15_ccnt;
> > +        /* Stores the delta between the architectural value and the underlying
> > +         * cycle count during normal operation. It is used to update c15_ccnt
> > +         * to be the correct architectural value before accesses. During
> > +         * accesses, c15_ccnt_delta contains the underlying count being used
> > +         * for the access, after which it reverts to the delta value in
> > +         * pmccntr_op_finish.
> > +         */
> > +        uint64_t c15_ccnt_delta;
> 
> So the key question here is: how does this work for VM migration?

To be honest, I'm not sure I fully understand the things I need to be
looking out for with VM migration.

My guess, though, is that this current implementation is not sufficient.
Perhaps there needs to be logic to ensure that c15_ccnt is the current
architectural value before migration and also to setup c15_ccnt_delta to
be the delta between that architectural value and the underlying cycle
count upon inbound migration. Does that sound like an approach which
would fit well within the rest of the migration framework?

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
