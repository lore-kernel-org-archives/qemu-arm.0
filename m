Received: by 10.28.91.67 with SMTP id p64csp1632010wmb;
        Thu, 1 Mar 2018 01:51:00 -0800 (PST)
X-Google-Smtp-Source: AG47ELtUdsbG537kH7bK8AmhxUlfqKgNp+BPSK3SdekO9jyoRSN2gLTsjG0tu8y7tdbjhcVdAus6
X-Received: by 2002:a25:3dc5:: with SMTP id k188-v6mr468425yba.508.1519897860401;
        Thu, 01 Mar 2018 01:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519897860; cv=none;
        d=google.com; s=arc-20160816;
        b=C5GA951th78B3UXq4T5AAZQXVi+/4EWLCyklil/jI+E1pMpFNUL7VogdoyFK/VK8O0
         hwnn3yW4zGt71iMdotr+1/M9ZzTcKLQSZVwiaMBsz81wBFPlLyeZUr4Ap1dwfPDgQqz4
         uhdasP6JjrIe7n6k5buTJrHgns38JuSE8nMSWGwubZwDrhAkycy+lwhKb8QdFDHP0EGi
         JmFZg+1HVpC+Vj+DayFbSaO7MCi0ee4RF2aXECNyL1pses27ohlAU4qP9rUtwuOTPToO
         x6lWnypKibpZ60dC7IDLOHyKS3cTzuT2hdbvJIP8kN5LX6sHZmYgms084rL5OHud67v6
         ASYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=5rLNX0jjUzrJs0jwXoLwrLllyHoP5qtKhzrdjgv4Uug=;
        b=LhuPsTEuI1Ae8NBkUP8L3u5vTbRGB+TVsJ5AbFHk4dIYqKIpGTgxaiBXWClDQjEDiQ
         6npxzLIBGMR1FZgEPdX+r0Hyzd4b0S8XaJ1yWTwIQmIcamMNYg5xnZsjTUlZakDEzdP0
         RNPsgc+LdO0PJL9yjE9dkv3WDxvmPFpriPixisPArEU8oYkqJFktVDZpRxwGq7StUJ5s
         pHm5JGmD42AbKGQOiMqRa5i+tHGJ13bU7IBDso0TVMlB8b8d7DCERgAoyGuVXfjprpvv
         BPBhA1h6LxHVxzBtLhvMC99/LGYKa2JFEKm8dW4736fCAhaFs4forUw+KqUICAGfh9IE
         QTQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66si583068ywg.635.2018.03.01.01.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 01:51:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erKrb-0003tK-TZ
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 04:50:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1erKrP-0003pP-C6
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 04:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1erKrM-0001ip-9X
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 04:50:47 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59984 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1erKrM-0001iY-1t; Thu, 01 Mar 2018 04:50:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00D9440FB650;
	Thu,  1 Mar 2018 09:50:40 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1DB10AF9E4;
	Thu,  1 Mar 2018 09:50:31 +0000 (UTC)
Date: Thu, 1 Mar 2018 10:50:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180301105030.2b716e68@redhat.com>
In-Reply-To: <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
	<20180227104708.GA11391@cbox>
	<ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
	<20180227124604.GA2373@cbox>
	<20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 01 Mar 2018 09:50:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 01 Mar 2018 09:50:40 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] VCPU hotplug on KVM/ARM
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
	Christoffer Dall <cdall@kernel.org>, qemu-devel@nongnu.org,
	Christoffer Dall <christofferdall@christofferdall.dk>,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEKS8n8A/XBS

On Tue, 27 Feb 2018 14:21:31 +0100
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Feb 27, 2018 at 01:46:04PM +0100, Christoffer Dall wrote:
> > On Tue, Feb 27, 2018 at 05:34:28PM +0530, bthakur@codeaurora.org wrote:  
> > > Hi Christoffer,
> > > 
> > > Thanks for your reply.
> > > 
> > > On 2018-02-27 16:17, Christoffer Dall wrote:  
> > > >Hi Bhupinder,
> > > >
> > > >On Tue, Feb 27, 2018 at 03:01:17PM +0530, bthakur@codeaurora.org wrote:  
> > > >>I hope it is the right forum to post my query.
> > > >>
> > > >>
> > > >>
> > > >>I am currently looking at the possibility of adding a new VCPU to a
> > > >>running
> > > >>guest VM in KVM/ARM. I see that currently, it is not allowed to add a
> > > >>new
> > > >>VCPU to a guest VM, if it is already initialized. The first check in
> > > >>kvm_arch_vcpu_create() returns failure if it is already initialized.
> > > >>  
> > > >
> > > >This would require a major rework of a lot of logic surrounding the GIC
> > > >and other parts of KVM initialization.
> > > >  
> > > >>
> > > >>
> > > >>There was some work done in QEMU to add support for VCPU hotplug:
> > > >>https://lists.gnu.org/archive/html/qemu-arm/2017-05/msg00404.html
> > > >>
> > > >>
> > > >>
> > > >>But I am looking at the KVM side for enabling adding a new VCPU. If you
> > > >>can
> > > >>point me to any relevant work/resources, which I can refer to then it
> > > >>will
> > > >>help me.
> > > >>  
> > > >
> > > >I don't have any specific pointers, but I was always told that the way
> > > >we were going to do CPU hotplug would be to instantiate a large number
> > > >of VCPUs, and hotplug would be equivalent to turning on a VCPU which was
> > > >previously powered off.
> > > >
> > > >Is this not still a feasible solution?  
> > > It should be a feasible solution provided the guest VM is not able to
> > > control the onlining/offlining of VCPUs. It should be controlled by the
> > > Host.
> > >   
> > 
> > KVM could simply refuse to turn on some of the CPUs unless given
> > permission from host userspace.
> >   
> > > >
> > > >How does VCPU hotplug work on x86?  
> > > On x86, you can add a vcpu through libvirt setvcpu command and it shows up
> > > in the guest VM as a new CPU if you do lscpu.
> > >   
> > 
> > Sure, but what is the mechanism, does x86 qemu actually call
> > KVM_CREATE_VCPU, or is this also a question of turning on already
> > created vcpus ?
In QEMU on x86 (and I think ppc, s390 as well), we create vCPUs on demand.

It would be nice if ARM would be able to do that too,
so that it could take advantage of the same code.

 
> CC'ing Igor and qemu-devel
> 
> drew
> 

