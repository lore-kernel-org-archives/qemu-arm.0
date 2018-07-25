Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp366021wru;
        Tue, 24 Jul 2018 23:45:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe16uVHpBY5Y0BLXj64Z1v7vK+ilmEKd66X280Z8xOwcShmXHKeqG1iGPjDkq33gnjs9Lum
X-Received: by 2002:ac8:8f0:: with SMTP id y45-v6mr19930695qth.408.1532501111340;
        Tue, 24 Jul 2018 23:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532501111; cv=none;
        d=google.com; s=arc-20160816;
        b=rtWhACLL9Ki6BguJzhwd2dLtk2w4JJBbAl+cLT6tOY9zM5QRfq/XultJ2iGi+cQ8yz
         IllMzk8V/sDE4IDM20bXJTi94xKZzMZPXcKWB2eGqE+yZ1lhFfC82i9eIamijY0W+Dry
         kI+tA6tFJI3bonN9aXH6Fro9ZnYY6OBO+d8dpNPk9HQBtoF3G8qXvw6j2V2QENl+RUdR
         sRAQcdqu7+szQsV/Y1SHcer8lcczU6hhoOZ15i5C9K/JI2U2z5bUIE9Iuu2XhUeINvcJ
         4L3b+J566vwoXosdzPFwCak0G41zapIdXIQa5UrNkI6//ltXqa+pL9+vZhBv6xl/a4IZ
         +Juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :arc-authentication-results;
        bh=zI08qoks3oI1sb2bgDmg4L7luyC5VYUjW7SMWOWHrwQ=;
        b=JqfBvMtRg2Ugp+gQQ0D9Q+eTmLgp8rBQ3apnqNfKNDnYIsWvjaDpPDo48tOVZ2GYnN
         nMAzsAu1/fFLhhZMVgmrg0TTiW1UJAzY4cUnvITB3fLtmrrOsK8RfxD8l5+0lDFhjPW6
         qFepo4Shy7Kk/SMzWB8t0Jkw7Xmr9Nb6zRydWnXyJ8IeV5z0qAbTZeWAq+n8A/w7eoBP
         VnQt82j+rdjQK+75x+zQVtCQNh8Q824elhzofO0ra3ogFH895QuxBnsKkYYpSEjHjiyB
         jwSklokVUSwIoEX8fvb92HAhFadZDRz8L+caD+Gg8Zo893hHQvfD/1EYAS3uENBRiEKz
         SZjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id k85-v6si11358795qkh.357.2018.07.24.23.45.10;
        Tue, 24 Jul 2018 23:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6D4A44A129;
	Wed, 25 Jul 2018 02:45:10 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWHucHfJmgsQ; Wed, 25 Jul 2018 02:45:09 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4668F4A102;
	Wed, 25 Jul 2018 02:45:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 67305404D9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 02:45:07 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q+wGqFGTwJj for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Jul 2018 02:45:06 -0400 (EDT)
Received: from mx1.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 1C74540493
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 02:45:06 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FEEC401EF0C;
 Wed, 25 Jul 2018 06:45:05 +0000 (UTC)
Received: from localhost (ovpn-204-26.brq.redhat.com [10.40.204.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFB892026D68;
 Wed, 25 Jul 2018 06:45:02 +0000 (UTC)
Date: Wed, 25 Jul 2018 08:45:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
Message-ID: <20180725084502.751106ed@redhat.com>
In-Reply-To: <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 06:45:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
 Wed, 25 Jul 2018 06:45:05 +0000 (UTC) for IP:'10.11.54.4'
 DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
 HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, marc.zyngier@arm.com, david@redhat.com,
 qemu-devel@nongnu.org, Christoffer Dall <christofferdall@christofferdall.dk>,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: e+UROUqVWpeI

On Tue, 24 Jul 2018 11:35:31 -0700
Maran Wilson <maran.wilson@oracle.com> wrote:

> It's been a few months since this email thread died off. Has anyone 
> started working on a potential solution that would allow VCPU hotplug on 
> KVM/ARM ? Or is this a project that is still waiting for an owner who 
> has the time and inclination to get started?
I'm working on QEMU side of it as time allows.

I can guide or share task if are you interested in helping out with it?


> Thanks,
> -Maran
> 
> On 2/27/2018 5:21 AM, Andrew Jones wrote:
> > On Tue, Feb 27, 2018 at 01:46:04PM +0100, Christoffer Dall wrote:  
> >> On Tue, Feb 27, 2018 at 05:34:28PM +0530, bthakur@codeaurora.org wrote:  
> >>> Hi Christoffer,
> >>>
> >>> Thanks for your reply.
> >>>
> >>> On 2018-02-27 16:17, Christoffer Dall wrote:  
> >>>> Hi Bhupinder,
> >>>>
> >>>> On Tue, Feb 27, 2018 at 03:01:17PM +0530, bthakur@codeaurora.org wrote:  
> >>>>> I hope it is the right forum to post my query.
> >>>>>
> >>>>>
> >>>>>
> >>>>> I am currently looking at the possibility of adding a new VCPU to a
> >>>>> running
> >>>>> guest VM in KVM/ARM. I see that currently, it is not allowed to add a
> >>>>> new
> >>>>> VCPU to a guest VM, if it is already initialized. The first check in
> >>>>> kvm_arch_vcpu_create() returns failure if it is already initialized.
> >>>>>  
> >>>> This would require a major rework of a lot of logic surrounding the GIC
> >>>> and other parts of KVM initialization.
> >>>>  
> >>>>>
> >>>>> There was some work done in QEMU to add support for VCPU hotplug:
> >>>>> https://lists.gnu.org/archive/html/qemu-arm/2017-05/msg00404.html
> >>>>>
> >>>>>
> >>>>>
> >>>>> But I am looking at the KVM side for enabling adding a new VCPU. If you
> >>>>> can
> >>>>> point me to any relevant work/resources, which I can refer to then it
> >>>>> will
> >>>>> help me.
> >>>>>  
> >>>> I don't have any specific pointers, but I was always told that the way
> >>>> we were going to do CPU hotplug would be to instantiate a large number
> >>>> of VCPUs, and hotplug would be equivalent to turning on a VCPU which was
> >>>> previously powered off.
> >>>>
> >>>> Is this not still a feasible solution?  
> >>> It should be a feasible solution provided the guest VM is not able to
> >>> control the onlining/offlining of VCPUs. It should be controlled by the
> >>> Host.
> >>>  
> >> KVM could simply refuse to turn on some of the CPUs unless given
> >> permission from host userspace.
> >>  
> >>>> How does VCPU hotplug work on x86?  
> >>> On x86, you can add a vcpu through libvirt setvcpu command and it shows up
> >>> in the guest VM as a new CPU if you do lscpu.
> >>>  
> >> Sure, but what is the mechanism, does x86 qemu actually call
> >> KVM_CREATE_VCPU, or is this also a question of turning on already
> >> created vcpus ?
> >>  
> > CC'ing Igor and qemu-devel
> >
> > drew
> > _______________________________________________
> > kvmarm mailing list
> > kvmarm@lists.cs.columbia.edu
> > https://lists.cs.columbia.edu/mailman/listinfo/kvmarm  
> 
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
