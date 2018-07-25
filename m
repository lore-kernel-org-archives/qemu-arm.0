Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp642524wru;
        Wed, 25 Jul 2018 05:28:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfItiDocfrK1OIPSZRy6B+A3V5cIxho5GkJ0h5eJIl9hCUQD7mUhtLqmc/ibZfzSnDAdBtw
X-Received: by 2002:ac8:13c7:: with SMTP id i7-v6mr21035229qtj.134.1532521697651;
        Wed, 25 Jul 2018 05:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532521697; cv=none;
        d=google.com; s=arc-20160816;
        b=UojogZfUl9odlyXrBu5Ea1ZGFDdwuQke/6/HjEES4moq5pixgR+8WJY1oDH7o7ZzdU
         Usbhiu7If+L86a+/ECG+HjAplphNhBbVjM/xc1y0zp/0CWy1tVAHO2IckdIjthCBrRqe
         MnprOnOg0YDmkVPYW0DEo1HceQNtQs8AgPNhycufcOqj6bYCeEMEHhTfwLoeatRotGBd
         PX6ndL3l8YBe7ISTvdMlnBvpEjwWbawnsvaJ84A4oX/k6Vvn7BJlM0GhzVT4EromIXEE
         Yr6qv84YksaeRducPxHXAHjjFCRE3PDgXoqsvg8oMx+zQKC7O8fzjkG+jz53RLg3BGzr
         hpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:arc-authentication-results;
        bh=mi03zPLRJXeZliyDHMH8NiKtkv8eWCxilnOhtNGPfmA=;
        b=tQNQbzOFjNanxLvr6O0vyXbR6taS6IUQM+cyQHRTGnPWfEgwffE4eFKywziRSJ+6ai
         NN1RwVY+ELLt2ebiGBsyqoI7rf3+t5lPdw+Ez65alqDR8Vk9t894QBqb682wnZLDplVs
         OOmDbGhmtOEK5u5+Zd3jRsx7s/F92R7zpzQ9DKY4tpMtXvKM+pZI57ESBWO4e9E0MbHh
         x2iOtEgXCm82wr3NjdygqDVugOL7mxhylGXtIkz6mku8ZFyFawqdvnyN9WHNWLelvyue
         JuetoZl2oCNUkKuOB2BAuuFKf4Y64y7fRFXsi6fdqnQ3dB8vFl6k/fToHKXG/sAainrq
         cCzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q1-v6si7182691qki.306.2018.07.25.05.28.17;
        Wed, 25 Jul 2018 05:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4A1884A15E;
	Wed, 25 Jul 2018 08:28:17 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wxEbirkxqSy; Wed, 25 Jul 2018 08:28:16 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7A46A40A67;
	Wed, 25 Jul 2018 08:28:16 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 40D3A40A67
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 08:28:15 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bi3ZYrgUhIIT for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Jul 2018 08:28:14 -0400 (EDT)
Received: from mx1.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2DFF04045F
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 08:28:14 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DEA70B6324;
 Wed, 25 Jul 2018 12:28:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E571687E;
 Wed, 25 Jul 2018 12:28:08 +0000 (UTC)
Date: Wed, 25 Jul 2018 14:28:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
Message-ID: <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
 <74427c65-b860-d576-04f9-766253285210@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74427c65-b860-d576-04f9-766253285210@arm.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.11.55.2]); Wed, 25 Jul 2018 12:28:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
 Wed, 25 Jul 2018 12:28:12 +0000 (UTC) for IP:'10.11.54.5'
 DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
 HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, david@redhat.com, qemu-devel@nongnu.org,
 Christoffer Dall <christofferdall@christofferdall.dk>, qemu-arm@nongnu.org,
 imammedo@redhat.com, kvmarm@lists.cs.columbia.edu
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
X-TUID: ea+dHFZMgDI2

On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:
> On 24/07/18 19:35, Maran Wilson wrote:
> > It's been a few months since this email thread died off. Has anyone 
> > started working on a potential solution that would allow VCPU hotplug on 
> > KVM/ARM ? Or is this a project that is still waiting for an owner who 
> > has the time and inclination to get started?
> 
> This is typically a project for someone who would have this particular
> itch to scratch, and who has a demonstrable need for this functionality.
> 
> Work wise, it would have to include adding physical CPU hotplug support
> to the arm64 kernel as a precondition, before worrying about doing it in
> KVM.
> 
> For KVM itself, particular area of interests would be:
> - Making GICv3 redistributors magically appear in the IPA space
> - Live resizing of GICv3 structures
> - Dynamic allocation of MPIDR, and mapping with vcpu_id

I have CPU topology description patches on the QEMU list now[*]. A next
step for me is to this MPIDR work. I probably won't get to it until the
end of August though.

[*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01168.html

> 
> This should keep someone busy for a good couple of weeks (give or take a
> few months).

:-)

> 
> That being said, I'd rather see support in QEMU first, creating all the
> vcpu/redistributors upfront, and signalling the hotplug event via the
> virtual firmware. And then post some numbers to show that creating all
> the vcpus upfront is not acceptable.

I think the upfront allocation, allocating all possible cpus, but only
activating all present cpus, was the planned approach. What were the
concerns about that approach? Just vcpu memory overhead for too many
overly ambitious VM configs?

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
