Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4782666wru;
        Tue, 31 Jul 2018 03:27:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcA7ukwkd9mJ1wHVpu/oC68+IgzOOx+0aGrIlyDIEEDGdrQ9heG2R3rkfMellXik2AOePXs
X-Received: by 2002:a37:7fc7:: with SMTP id a190-v6mr18439459qkd.247.1533032841531;
        Tue, 31 Jul 2018 03:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533032841; cv=none;
        d=google.com; s=arc-20160816;
        b=HzcXWOkfPdAP9ylqG+GklMhXgE2kiBDjEwPQAIIR11H4eukhu6TKBnPZwoL4cJ4I9B
         fSx6byRw7HEChRZZbS3S5jtjY6z3a+JIE1AIzwT8zFg4VLl6NGjtIuo7VZfgfaTDzuOV
         7VOrs9Owqs9iddGfatV7GHgFCIBTJKNsIfN2p7ZIoplIprHYi7vxJFZCP7x+iAfsd9VB
         y932wJW9xf+44zczL4nsbPcmfG7id6Y9uBQBalcI5NVx5+4l8E2XPKEOXo6/SKrqzZD5
         so0C4f2NEB1GGSGt0c5Kg1fw7ZEI+vyR/OL+J7hZcsRONJMxBbQhHG/pyZL0rSpkq20N
         8ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :arc-authentication-results;
        bh=v9hf18RVRa6FQFFRskyagylMtdpxoBevVCzgIbf9phY=;
        b=L4zbzuPlLxrcN/pre9uxTegcEAUhZZ+l1z1yD3w9sUM5UjESTfBfdgezM//+BjSoeT
         ICPhL57L74jJmO5Y1JYDxoP4FWBFGV54YjHTM9TNOVvOudIXXF75jjSlyy6zJu/ZXErv
         mrHuSG7hsDwdq7H+Y5cbNRXmDEB0aQ3U4TBakXpJbX6JgA5pMxv+Ze7cqOI9dYqc+hoT
         N5qYTsWCRbsF5h3+YspEteySx9nH89LPTyEeKPQ7/hrbwJ5Orj3QwLwHycShtW4Se8Hx
         78OoxT6Xbb//OV9hSXVWlTGXD5iTHzEd/OwxFLmClQQXHInh8lrf75+up/2aHQ9D99JJ
         0Arg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m82-v6si5471842qki.213.2018.07.31.03.27.21;
        Tue, 31 Jul 2018 03:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 00E72408AD;
	Tue, 31 Jul 2018 06:27:21 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRb25iljEuqg; Tue, 31 Jul 2018 06:27:20 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 174264A0E7;
	Tue, 31 Jul 2018 06:27:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 8C99A408AD
 for <kvmarm@lists.cs.columbia.edu>; Tue, 31 Jul 2018 06:27:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48msHxnckhpa for <kvmarm@lists.cs.columbia.edu>;
 Tue, 31 Jul 2018 06:27:17 -0400 (EDT)
Received: from mx1.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 6304A40217
 for <kvmarm@lists.cs.columbia.edu>; Tue, 31 Jul 2018 06:27:17 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C517B7C6A9;
 Tue, 31 Jul 2018 10:27:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA7B1102E22;
 Tue, 31 Jul 2018 10:27:11 +0000 (UTC)
Date: Tue, 31 Jul 2018 12:27:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
Message-ID: <20180731122710.142a97c4@redhat.com>
In-Reply-To: <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
 <74427c65-b860-d576-04f9-766253285210@arm.com>
 <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
 <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.11.55.2]); Tue, 31 Jul 2018 10:27:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
 Tue, 31 Jul 2018 10:27:16 +0000 (UTC) for IP:'10.11.54.3'
 DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
 HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Cc: Christoffer Dall <cdall@cs.columbia.edu>, cohuck@redhat.com,
 Christoffer Dall <cdall@kernel.org>, david@redhat.com, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, Christoffer Dall <christofferdall@christofferdall.dk>,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 David Gibson <david@gibson.dropbear.id.au>
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
X-TUID: DrDEEY5xCQ58

On Wed, 25 Jul 2018 14:07:12 +0100
Marc Zyngier <marc.zyngier@arm.com> wrote:

> On 25/07/18 13:28, Andrew Jones wrote:
> > On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:  
> >> On 24/07/18 19:35, Maran Wilson wrote:  
> >>> It's been a few months since this email thread died off. Has anyone 
> >>> started working on a potential solution that would allow VCPU hotplug on 
> >>> KVM/ARM ? Or is this a project that is still waiting for an owner who 
> >>> has the time and inclination to get started?  
> >>
> >> This is typically a project for someone who would have this particular
> >> itch to scratch, and who has a demonstrable need for this functionality.
> >>
> >> Work wise, it would have to include adding physical CPU hotplug support
> >> to the arm64 kernel as a precondition, before worrying about doing it in
> >> KVM.
> >>
> >> For KVM itself, particular area of interests would be:
> >> - Making GICv3 redistributors magically appear in the IPA space
> >> - Live resizing of GICv3 structures
> >> - Dynamic allocation of MPIDR, and mapping with vcpu_id  
> > 
> > I have CPU topology description patches on the QEMU list now[*]. A next
> > step for me is to this MPIDR work. I probably won't get to it until the
> > end of August though.
> > 
> > [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01168.html
> >   
> >>
> >> This should keep someone busy for a good couple of weeks (give or take a
> >> few months).  
> > 
> > :-)
> >   
> >>
> >> That being said, I'd rather see support in QEMU first, creating all the
> >> vcpu/redistributors upfront, and signalling the hotplug event via the
> >> virtual firmware. And then post some numbers to show that creating all
> >> the vcpus upfront is not acceptable.  
> > 
> > I think the upfront allocation, allocating all possible cpus, but only
> > activating all present cpus, was the planned approach. What were the
> > concerns about that approach? Just vcpu memory overhead for too many
> > overly ambitious VM configs?  
> 
> I don't have any ARM-specific concern about that, and I think this is
> the right approach. It has the good property of not requiring much
> change in the kernel (other than actually supporting CPU hotplug).
for x86 we allocate VCPUs dynamically (both QEMU and KVM)
CCing ppc/s390 folks as I don't recall how it's implemented there.

but we do not delete vcpus in KVM after they were created
(as it deemed to be too complicated), we are just deleting QEMU part
of it and keep kvm's vcpu for reuse with future hotplug.

> vcpu memory overhead is a generic concern though, and not only for ARM.
> We currently allow up to 512 vcpus per VM, which looks like a lot, but
> really isn't. If we're to allow this to be bumped up significantly, we
> should start accounting the vcpu-related memory against the user's
> allowance...
> 
> Thanks,
> 
> 	M.

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
