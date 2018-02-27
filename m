Received: by 10.28.71.27 with SMTP id u27csp4817018wma;
        Tue, 27 Feb 2018 05:22:10 -0800 (PST)
X-Google-Smtp-Source: AG47ELth2FulzNark8nCQ3BuzND9tgbH8rmqZKCKzQvffvC8y+J+dbYpYrdd0BJ8bfIt0/RL5HNP
X-Received: by 10.13.210.68 with SMTP id u65mr3185735ywd.410.1519737730531;
        Tue, 27 Feb 2018 05:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519737730; cv=none;
        d=google.com; s=arc-20160816;
        b=YZqsdh+DhMJde+u25pK0e9CvELqXd4QFuvtodrnzakp7Ih4dqbcbOvIcuzqsiBDe36
         9JbuExOIoxMV9dKvi7D22A5+cm5WMo1/jITVOsOam2iVWh+eXP6s+A1hRDcWKAiWe5Wm
         ls2ojjeib2KSTKMPbjRx9ciYzAoT03aqKxsOS7CrkPnxIxlRlI8WJgsb3RWEOE5Pwso2
         a0NGghLemSRIv9vIR6aKL7g3YVwJbsDhK4D7L3DnALt40xU5jIyOp25Im9F/kqgLkEIE
         2FlVsUyvUNhe7fggJlTSzZGq1jp4aDWDHboYSAs/m52EZEohZiz77IgUKIQxVErkfOX/
         auKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=HssXNKCI/X9eEshd6OwgXVtiUZfW+5kXJWznUvj/5Gg=;
        b=lpNvwHNZWZl/8GS0BIqb3BMRiiwnMnmzrGbWbTcHVlRjooHWkZOQ3ApgdNYJ2Os+pI
         PT5JXuLRnn1k/bwU0OIyV6zuzbDW1auwtEk704ZnoC68lbFiuVWxr6VN6o/87vSpSE7N
         8ycPQ9mAp1TD42ywvEixDfTiVij78tFc1IkPrWQMFFt5BrTOQw/CLr7+JogmRLukrre4
         UlwFyB4bv6258Q67R9VABUAqbQ11CDr2bQP1wkZUO6nPTWig1CTEOrHVstTF3v2JgKzb
         aD50Ir6b/ejPVu4TmT5SXzztd589JphpggWpGHHYayvimMVBuVCRRHqb5Uh6qgt/HZQG
         nQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h124-v6si283680ybh.324.2018.02.27.05.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:22:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfCr-0004vQ-Sy
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:22:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eqfCd-0004uc-Q9
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eqfCa-0007su-Ij
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:21:55 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51824 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eqfCa-0007sM-EO; Tue, 27 Feb 2018 08:21:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 131FE40201A5;
	Tue, 27 Feb 2018 13:21:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E670112C243;
	Tue, 27 Feb 2018 13:21:33 +0000 (UTC)
Date: Tue, 27 Feb 2018 14:21:31 +0100
From: Andrew Jones <drjones@redhat.com>
To: Christoffer Dall <cdall@kernel.org>
Message-ID: <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
	<20180227104708.GA11391@cbox>
	<ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
	<20180227124604.GA2373@cbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180227124604.GA2373@cbox>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 13:21:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 13:21:41 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] VCPU hotplug on KVM/ARM
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
Cc: bthakur@codeaurora.org, Christoffer Dall <cdall@cs.columbia.edu>,
	qemu-devel@nongnu.org,
	Christoffer Dall <christofferdall@christofferdall.dk>,
	qemu-arm@nongnu.org, imammedo@redhat.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9cwm+AajE2m

On Tue, Feb 27, 2018 at 01:46:04PM +0100, Christoffer Dall wrote:
> On Tue, Feb 27, 2018 at 05:34:28PM +0530, bthakur@codeaurora.org wrote:
> > Hi Christoffer,
> > 
> > Thanks for your reply.
> > 
> > On 2018-02-27 16:17, Christoffer Dall wrote:
> > >Hi Bhupinder,
> > >
> > >On Tue, Feb 27, 2018 at 03:01:17PM +0530, bthakur@codeaurora.org wrote:
> > >>I hope it is the right forum to post my query.
> > >>
> > >>
> > >>
> > >>I am currently looking at the possibility of adding a new VCPU to a
> > >>running
> > >>guest VM in KVM/ARM. I see that currently, it is not allowed to add a
> > >>new
> > >>VCPU to a guest VM, if it is already initialized. The first check in
> > >>kvm_arch_vcpu_create() returns failure if it is already initialized.
> > >>
> > >
> > >This would require a major rework of a lot of logic surrounding the GIC
> > >and other parts of KVM initialization.
> > >
> > >>
> > >>
> > >>There was some work done in QEMU to add support for VCPU hotplug:
> > >>https://lists.gnu.org/archive/html/qemu-arm/2017-05/msg00404.html
> > >>
> > >>
> > >>
> > >>But I am looking at the KVM side for enabling adding a new VCPU. If you
> > >>can
> > >>point me to any relevant work/resources, which I can refer to then it
> > >>will
> > >>help me.
> > >>
> > >
> > >I don't have any specific pointers, but I was always told that the way
> > >we were going to do CPU hotplug would be to instantiate a large number
> > >of VCPUs, and hotplug would be equivalent to turning on a VCPU which was
> > >previously powered off.
> > >
> > >Is this not still a feasible solution?
> > It should be a feasible solution provided the guest VM is not able to
> > control the onlining/offlining of VCPUs. It should be controlled by the
> > Host.
> > 
> 
> KVM could simply refuse to turn on some of the CPUs unless given
> permission from host userspace.
> 
> > >
> > >How does VCPU hotplug work on x86?
> > On x86, you can add a vcpu through libvirt setvcpu command and it shows up
> > in the guest VM as a new CPU if you do lscpu.
> > 
> 
> Sure, but what is the mechanism, does x86 qemu actually call
> KVM_CREATE_VCPU, or is this also a question of turning on already
> created vcpus ?
>

CC'ing Igor and qemu-devel

drew
