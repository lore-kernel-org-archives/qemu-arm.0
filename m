Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp680286wru;
        Wed, 25 Jul 2018 06:07:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRSlOVOPZzpkUmW0C+ZPuX0l+7hg2w9VSHgi1xBxWzhMBDSQTVlS6T52lIJMBkf1RDZBGz
X-Received: by 2002:a0c:c993:: with SMTP id b19-v6mr19001267qvk.95.1532524041786;
        Wed, 25 Jul 2018 06:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532524041; cv=none;
        d=google.com; s=arc-20160816;
        b=mlvdVT4dO5UNTdoftaN1WfRjwsXINxj4baswTPbv++D6ycTAEtrbLGv14NDBZ55i5i
         udy/KG4X/0ERGN3Hn+Y8HMuVaeQwgGj4ewaA9ARUuwqyAB51uMsnR+FCdukABg1l+yDV
         ZvJkFDDf3u5E5AWBSeg7aZ8rKwO2FpBd+Hvfj91feMEy1ntvBO2RchTReIKdTlKZsVbg
         skAThi9E6U3HwlKl4oNPqymbsRS0eKYcFidHyy9JVMwhdFlJQnSBEZH8Djrl5wL+vBQI
         KSbYvYTDTu87YXZoG25ZPzIOU+a/dgQw57y22Nrurwf7u2uMawogdNEiGHVS5x4Zxk0h
         AAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject
         :arc-authentication-results;
        bh=HXK2MIj86v1cZHrwRyYOzfin98KKtlOeak6E1mXW8Po=;
        b=wLjQWhs4iUUSfpD6lePPEqtRyGIOLP21b3bOmYHBEmgZeJm6wbY1UdpryieQVfZCCJ
         +gdNMyuQLq5d9m7oFJDAh3Z62YA/8/M2YjSi1+GjaAHaoegh6VjtG4VybcBZ7+egSW/j
         NHi4uHHKllb277c3o2txE+yUMO4KS8KEoXuakXG5/FxT/t16xz82o0PREo3OF84E4Piu
         km4Wpm9cP76aluPgPyRRvyaqVfGLgH9qSu3ZLDLwX4lfMuoKZsjcyP5PE95CN1eotHML
         e/m4ijOtXX2FLrMMzURngFNoKbbbckRWAYIwg5/BmVYy/hrxG3xdCtOJkX+wk7yfjA2p
         zcOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h14-v6si7533894qkh.182.2018.07.25.06.07.21;
        Wed, 25 Jul 2018 06:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5B4CF4A16C;
	Wed, 25 Jul 2018 09:07:21 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NEbj-+K2M0p; Wed, 25 Jul 2018 09:07:20 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 309E34A0F7;
	Wed, 25 Jul 2018 09:07:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BF37B4A0D2
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 09:07:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIpJtuzAHgbk for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Jul 2018 09:07:16 -0400 (EDT)
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6136140493
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 09:07:16 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1EFA80D;
 Wed, 25 Jul 2018 06:07:15 -0700 (PDT)
Received: from [10.4.13.119] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 98C7E3F237; Wed, 25 Jul 2018 06:07:13 -0700 (PDT)
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
To: Andrew Jones <drjones@redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
 <74427c65-b860-d576-04f9-766253285210@arm.com>
 <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
Date: Wed, 25 Jul 2018 14:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
Content-Language: en-GB
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
X-TUID: ChR+1EqD2zqT

On 25/07/18 13:28, Andrew Jones wrote:
> On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:
>> On 24/07/18 19:35, Maran Wilson wrote:
>>> It's been a few months since this email thread died off. Has anyone 
>>> started working on a potential solution that would allow VCPU hotplug on 
>>> KVM/ARM ? Or is this a project that is still waiting for an owner who 
>>> has the time and inclination to get started?
>>
>> This is typically a project for someone who would have this particular
>> itch to scratch, and who has a demonstrable need for this functionality.
>>
>> Work wise, it would have to include adding physical CPU hotplug support
>> to the arm64 kernel as a precondition, before worrying about doing it in
>> KVM.
>>
>> For KVM itself, particular area of interests would be:
>> - Making GICv3 redistributors magically appear in the IPA space
>> - Live resizing of GICv3 structures
>> - Dynamic allocation of MPIDR, and mapping with vcpu_id
> 
> I have CPU topology description patches on the QEMU list now[*]. A next
> step for me is to this MPIDR work. I probably won't get to it until the
> end of August though.
> 
> [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01168.html
> 
>>
>> This should keep someone busy for a good couple of weeks (give or take a
>> few months).
> 
> :-)
> 
>>
>> That being said, I'd rather see support in QEMU first, creating all the
>> vcpu/redistributors upfront, and signalling the hotplug event via the
>> virtual firmware. And then post some numbers to show that creating all
>> the vcpus upfront is not acceptable.
> 
> I think the upfront allocation, allocating all possible cpus, but only
> activating all present cpus, was the planned approach. What were the
> concerns about that approach? Just vcpu memory overhead for too many
> overly ambitious VM configs?

I don't have any ARM-specific concern about that, and I think this is
the right approach. It has the good property of not requiring much
change in the kernel (other than actually supporting CPU hotplug).

vcpu memory overhead is a generic concern though, and not only for ARM.
We currently allow up to 512 vcpus per VM, which looks like a lot, but
really isn't. If we're to allow this to be bumped up significantly, we
should start accounting the vcpu-related memory against the user's
allowance...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
