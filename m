Received: by 10.28.71.155 with SMTP id m27csp1566547wmi;
        Thu, 29 Mar 2018 04:18:52 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/PLJZ9tB60tdEAO/BfXQCQVH9pH5uSMsYU3RODOIrRIjyEL9dvGxQGpnas849mHASzV4Us
X-Received: by 10.200.54.109 with SMTP id n42mr10308939qtb.271.1522322332552;
        Thu, 29 Mar 2018 04:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522322332; cv=none;
        d=google.com; s=arc-20160816;
        b=ezBGKApVbYRxexAOP0ZYqoN9a1a7Zqnhp9UoLaJ955U1xuirk0qlcF43fX5QUfj25m
         1TgArJy+Wdn5L00Yj7I9uPi+6C2iSZitzpa3sgu5rrDRw3CP8ElopNta7VTZFO/kksg5
         xvHpS+6WrShQGmW9l/rBfvEJhoCUBSNc6K5viBeMUzgVfKYNiL1sL8nKiR0CgcdekcOL
         SOu80AxoNorWg4LLcl67Jj41bRpLkH2q6XaxtycN1ejLdM1K+WzFheYvVBlGTTUZg44u
         81C10Z0x+nmFtUpscDRR+9hvBpDI1Sa0/yydvQeWJTRaeyCzZimS+buPEtA7uFADHX1Z
         bAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=EjhcyfJupeMsrf1YQT+EAGADzSZ1bVmHesqKzisevB4=;
        b=cLtkQNqxkHut+diNWTk1XK8vpT2LUZTnCoJcjzzyhsC4sqWsvZAamRl7ZXQKNXStd9
         N1Jp+Z5KQNJK+iOxLBHIRM9FzXL6zoVsJw3nSWSZUblYbSc+2qArDBSbxtcn0MDSoFG9
         3kfsFqQmlxJlYMI0jBjbXt9uyAZ9Nl2NSzdgs7LmctKoUmOCojiv8JKsJlC4Z10hMyaD
         cHp0vr0tnhfUh+slyzeCPWlV4LxFYxzWvwfEbOxJqZfvL7WNNaRN+09ZkDuTofxNx3mO
         tQcozRnZmYwl5Q7pNd0FSUx/dp0xxZDxkaLA82NXM6LFkWFJs6Wo+zF5DWB4HzM531yx
         A3qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15si5652931qtk.215.2018.03.29.04.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 04:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f1Va0-00016q-2U
	for alex.bennee@linaro.org; Thu, 29 Mar 2018 07:18:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1f1VSZ-0002q2-56
	for qemu-arm@nongnu.org; Thu, 29 Mar 2018 07:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1f1VSU-00043v-Sn
	for qemu-arm@nongnu.org; Thu, 29 Mar 2018 07:11:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34668 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1f1VSU-00043X-Nl; Thu, 29 Mar 2018 07:11:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AE2381A6D28;
	Thu, 29 Mar 2018 11:11:06 +0000 (UTC)
Received: from work-vm (ovpn-117-104.ams2.redhat.com [10.36.117.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A698E8444F;
	Thu, 29 Mar 2018 11:11:02 +0000 (UTC)
Date: Thu, 29 Mar 2018 12:11:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180329111059.GD2982@work-vm>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
	<CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 29 Mar 2018 11:11:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 29 Mar 2018 11:11:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JVLietUCwAIL

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 23 March 2018 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> >> On 2018/3/20 19:54, Peter Maydell wrote:
> >>> Can you still successfully migrate a VM from a QEMU version
> >>> without this bugfix to one with the bugfix ?
> >>>
> >> I've tested this case. I can migrate a VM between these two versions.
> >
> > Hmm. Looking at the code I can't see how that would work,
> > except by accident. Let me see if I understand what's happening
> > here:
> >
> > In the code in master, we have QEMU data structures
> > (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
> > irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
> > for a 1-bit-per-irq bitmap:
> >  [0x00000000, irq 32, irq 33, .... ]
> >
> > When we fill in the values from KVM into these data structures,
> > we start after the unused space, because the for_each_dist_irq_reg()
> > macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
> > the offset value we use for the KVM access, so we start by
> > reading the RAZ/WI values from KVM, and the data structure
> > contents end up with:
> >  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> > (and the last irqs wouldn't get transferred).
> >
> > With this change to the code we will get the offset right and
> > the data structure will be filled as
> >  [0x00000000, irq 32, irq 33, .... ]
> >
> > But for migration from the old version, the data structure
> > we receive from the migration source will contain the old
> > broken layout of
> >  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> > so if the new code doesn't do anything special to handle
> > migration from that old version then it will write zeroes to
> > irq 32..63, and then write incorrect values for all the irqs
> > after that, won't it?
> >
> > That suggests to me that we need to have some code in the
> > migration post-load routine that identifies that the data
> > is coming from an old version with this bug, and shifts
> > all the data down in the arrays so that the code to write
> > it to the kernel can handle it.
> 
> I was thinking a bit more about how to handle this, and
> my best idea was:
> 
> (1) send something in the migration stream that says
> "I don't have this bug" (version number change?
> vmstate field that's just a "no bug" flag? subsection
> with no contents?)
> 
> (2) on the destination, if the source doesn't tell us
> it doesn't have this bug, and we are running KVM, then
> shift all the data in the arrays down to fix it up
> [Strictly what we want to know is if the source is
> running KVM, not if the destination is, but I don't
> know of a way to find that out, and in practice TCG->KVM
> migrations don't work anyway, so it's not a big deal.]
> 
> Juan, David, do you have any suggestions for the best
> mechanism for part 1; or is there some clever way to
> handle this sort of bug that I've missed?

The subsection is probably the best bet; unless that is you can find
a bit to misuse in an existing field.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
