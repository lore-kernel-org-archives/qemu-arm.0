Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1255975wrq;
        Fri, 22 Jun 2018 13:43:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfpr0zu+I7Ini77HqmHAe6fIVZBC6q56hfzAa35GilopRSRaM4bsD0YnH5RzL69gB0E7dEr
X-Received: by 2002:a37:444c:: with SMTP id r73-v6mr2677431qka.351.1529700193180;
        Fri, 22 Jun 2018 13:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529700193; cv=none;
        d=google.com; s=arc-20160816;
        b=LI/ZXffHUl3f67hsA70xnwT/M4vLmCPFIionFmsRIjfheeOjnESXg5inTJbcqpHb1H
         nT+QWwcW0knTV6TI6Rq2JfTK6D3VIM+gVAbArboX9dME/RbpSkOyJ8T1nO63tIPMdb5g
         2LM49Ex3sSe9/gqzM0Y7TN8f1pLzzaQ3WhC6UkDforOoptFsGzlBift1jkyTZ/fwAzSc
         uA9yF4QcTPqGVMjBNUcPR+E3eHKYLmR0jvpfppouOVe6REXhag5GqqIZrG8R76CSTgil
         3XR9bPAMPKrJ850xIlz7ne+/wfer/rHW5iQ3bKhhAVFQTeMRMdizYfYhzPhSVO8d5RPW
         ZhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Fa9twDyBdROuyQAtZApslVX2TJyPLhXycP+Qi/VH4KE=;
        b=M8TzGAxfflLRlbzpFeZ1Ibu9DzsBE21U3KTi2+Guui0If9EnPRJ8ppV4H3BQCzZJSV
         4600xVGJcV8ZoimvcJSqNibrdUa3Xy5Iy9KnNU84VZBphjKjGjpf1mUrw7KldQaAS9D0
         1xfyzpCb0RyMGiqB8lqQh/gLTNvp5NnxP7UHaxv/aj1vvHMVm/WnEhb4/iNZBXnSIoQH
         D/BbB05aldR7UTFDEMW0/9xIv+xyULD2srqFbQnGx3qRzd3pYDj+Pn6Ey3gVmsw/B8Hf
         zHmTaxtT4OhKVt6l9H5Byyit1h+LiUh3vRw4P9Fcm4A5wkpCIsUSbW7DMyF7ZSVZAFhs
         R0/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HSpKgZUe;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=SMfDbSFF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o19-v6si1390945qki.30.2018.06.22.13.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HSpKgZUe;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=SMfDbSFF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWStk-0001h6-HJ
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:43:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSmy-00050p-Dp
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 16:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSmx-0006En-9t
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 16:36:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSmu-0006DS-9s; Fri, 22 Jun 2018 16:36:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5042D60274; Fri, 22 Jun 2018 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699767;
	bh=ONYykrPPvkbwWTiDf65qEkSVz99ErDBXmdq0ZmWaR2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSpKgZUeixdigyLH5KdwXfq2ZUjf03zbLz1rhp9AOz9aphMVDVEZYAuAljSNFYOTK
	VNKgzqx25N7fv09N2T3oOZ03Z+0W2Ozw8nGf+k6HtFWgFN93wNITTVeLVsdqUmJ+4U
	IRIFJ6+8YZ8WSxyL8Suu8lTi7QMY242Vn2ZE8WrA=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D1916063F;
	Fri, 22 Jun 2018 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699766;
	bh=ONYykrPPvkbwWTiDf65qEkSVz99ErDBXmdq0ZmWaR2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMfDbSFFoqoQ3eOTk1OBc8PkNnTKtQjB+CXaKtiOilWSiTbUky+J4dR39DJ7dgDuV
	VvVhT32akzMZBkF9f9xwrTfXa8XSFytzt3ej4RkcnSOHPbbk3qFbL8UqvPAYCxZSJr
	wlOC/WRAvCnbPfwJdXFZhw3QLh6vO5vHZzSzUF8I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D1916063F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 22 Jun 2018 16:36:04 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180622203604.GE12424@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_g1Bb=-cj+QToHDypZPiqw_U5YioRWfDSs0Ano3PqDTQ@mail.gmail.com>
	<20180622135045.GD12424@codeaurora.org>
	<CAFEAcA_EEXRQQjXDsei0Y6mQB6EVTtJB5=EFHFsT7kbZk5iv6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_EEXRQQjXDsei0Y6mQB6EVTtJB5=EFHFsT7kbZk5iv6Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-devel] [PATCH v4 03/21] target/arm: Reorganize PMCCNTR
 accesses
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuJiZVJ8qubT

On Jun 22 15:08, Peter Maydell wrote:
> On 22 June 2018 at 14:50, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > On Apr 20 11:17, Peter Maydell wrote:
> >> On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> >> > pmccntr_read and pmccntr_write contained duplicate code that was already
> >> > being handled by pmccntr_sync. Consolidate the duplicated code into two
> >> > functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> >> > c15_ccnt in CPUARMState so that we can simultaneously save both the
> >> > architectural register value and the last underlying cycle count - this
> >> > ensure time isn't lost and will also allow us to access the 'old'
> >> > architectural register value in order to detect overflows in later
> >> > patches.
> >> >
> >> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> 
> >> > -        /* If the counter is enabled, this stores the last time the counter
> >> > -         * was reset. Otherwise it stores the counter value
> >> > +        /* Stores the architectural value of the counter *the last time it was
> >> > +         * updated* by pmccntr_op_start. Accesses should always be surrounded
> >> > +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
> >> > +         * architecturally-corect value is being read/set.
> >> >           */
> >> >          uint64_t c15_ccnt;
> >> > +        /* Stores the delta between the architectural value and the underlying
> >> > +         * cycle count during normal operation. It is used to update c15_ccnt
> >> > +         * to be the correct architectural value before accesses. During
> >> > +         * accesses, c15_ccnt_delta contains the underlying count being used
> >> > +         * for the access, after which it reverts to the delta value in
> >> > +         * pmccntr_op_finish.
> >> > +         */
> >> > +        uint64_t c15_ccnt_delta;
> >>
> >> So the key question here is: how does this work for VM migration?
> >
> > To be honest, I'm not sure I fully understand the things I need to be
> > looking out for with VM migration.
> >
> > My guess, though, is that this current implementation is not sufficient.
> > Perhaps there needs to be logic to ensure that c15_ccnt is the current
> > architectural value before migration and also to setup c15_ccnt_delta to
> > be the delta between that architectural value and the underlying cycle
> > count upon inbound migration. Does that sound like an approach which
> > would fit well within the rest of the migration framework?
> 
> You need to deal with two different situations:
>  (1) migration from an older QEMU which doesn't have this patchset
>  (2) migration from a QEMU with this patchset to one with this patchset
> 
> Either:
>  (a) all the architectural state can be expressed in our existing
> state fields in whatever the previous format was -- in this case
> you just need to ensure that cpu_pre_save() and cpu_post_load()
> put the state there and unpack it again
>  (b) we were missing some architectural state and really do need
> to transfer more over the wire than we were before -- in this case
> you need to add a new subsection to the vmstate which has the fields
> that contain that new state, and give the subsection a suitable 'needed'
> function to indicate when the subsection should be transferred plus
> pre_load and post_load functions that allow us to cope correctly with
> the case of the older QEMU that doesn't send the subsection.

Okay, thanks! I didn't manage to get to this before v5, but look into it
more for v6.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
