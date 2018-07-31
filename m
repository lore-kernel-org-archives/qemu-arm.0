Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4806737wru;
        Tue, 31 Jul 2018 03:57:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdO2K/0xTBK4VsHZKwewqGCF3OWwKV+Rzqa0DTM9jNI7UwyQ/uO1andEX5qGzubPYPhxKf9
X-Received: by 2002:aed:23c8:: with SMTP id k8-v6mr20955887qtc.346.1533034640921;
        Tue, 31 Jul 2018 03:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533034640; cv=none;
        d=google.com; s=arc-20160816;
        b=Ml90jtyq+gxy8EDRIjgxJhGVLflfStv9wU/cPQ0rgMvytweiA9fIqRNjKY7nxj1ScO
         k6NtpojxVDdLjlVn/QCrmBeo853fSdmUWGFrwYR5PW3fP8SnNitzo3r6udRfbM4ftTH4
         UfFsPwwbBPks3gOYtr5doeUyJIDYrwjvLXGI5M+q3XNQ56XYA9pAGDJK9+3wddKn2ILu
         IuZ/FNZOh5ZnRQM3arryd9tcMiST+N/FSXGfSqNfdU4tUaw/I3PBa0/yD7MtRVq4Zz3v
         Q4B9oLvosGn+zKdc9mGF+lvObZ9i0hVIyN8KBQNXiAhnxJDhZMCMiTsJ6FMmFEucZhth
         6L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:to
         :subject:arc-authentication-results;
        bh=cSWtW3KZm4W6iQeLNebVCoXU09SK1sQJvVqSobqs+zI=;
        b=wBGrLoEQ7beZSOwYFstPisdu0sfD1UUBY0bmgajSSKx/VQQwn7/p4+v0RmYjL3wEOL
         RGR2Yr18zqPH5+T4TO7dTAAK3lABYi+CeZTiSvOC5/aOupVdKtLI6wK1eYJdhPIO07oD
         AFgtI+yZl/zv3Z7ecw+gsIoCCpZqFw5sMkIsVI+evvIaFlnbvUeLd9e/94tIuevLbeZd
         nJz6WclLWYAvJraqBgn7eCGqdpu1v1E65hY2BNpcJRRZ7hkfn3r4h3uZXkEzSw8QaJlk
         qeK8XCWszLGGWZlrop6eLErExPbXRpYs+L2gQdbZUaod6qKSErpfyd0V3p/Cc+62H1NS
         VOSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v21-v6si3134722qkb.1.2018.07.31.03.57.20;
        Tue, 31 Jul 2018 03:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 987CA408AD;
	Tue, 31 Jul 2018 06:57:20 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPJwUGKmJVyf; Tue, 31 Jul 2018 06:57:18 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CA97949F86;
	Tue, 31 Jul 2018 06:57:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 32107408AD
 for <kvmarm@lists.cs.columbia.edu>; Tue, 31 Jul 2018 06:57:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x9jYldYh070 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 31 Jul 2018 06:57:17 -0400 (EDT)
Received: from mx1.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 1894140217
 for <kvmarm@lists.cs.columbia.edu>; Tue, 31 Jul 2018 06:57:17 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5806A8790A;
 Tue, 31 Jul 2018 10:57:16 +0000 (UTC)
Received: from [10.36.116.164] (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226B21687B;
 Tue, 31 Jul 2018 10:57:08 +0000 (UTC)
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
To: Igor Mammedov <imammedo@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
 <74427c65-b860-d576-04f9-766253285210@arm.com>
 <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
 <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
 <20180731122710.142a97c4@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <577ab1f4-e644-8106-b380-14b8532989ee@redhat.com>
Date: Tue, 31 Jul 2018 12:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180731122710.142a97c4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.11.55.1]); Tue, 31 Jul 2018 10:57:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
 Tue, 31 Jul 2018 10:57:16 +0000 (UTC) for IP:'10.11.54.5'
 DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
 HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, cohuck@redhat.com, qemu-devel@nongnu.org,
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
X-TUID: ZRkHq+ge2tUN

On 31.07.2018 12:27, Igor Mammedov wrote:
> On Wed, 25 Jul 2018 14:07:12 +0100
> Marc Zyngier <marc.zyngier@arm.com> wrote:
> 
>> On 25/07/18 13:28, Andrew Jones wrote:
>>> On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:  
>>>> On 24/07/18 19:35, Maran Wilson wrote:  
>>>>> It's been a few months since this email thread died off. Has anyone 
>>>>> started working on a potential solution that would allow VCPU hotplug on 
>>>>> KVM/ARM ? Or is this a project that is still waiting for an owner who 
>>>>> has the time and inclination to get started?  
>>>>
>>>> This is typically a project for someone who would have this particular
>>>> itch to scratch, and who has a demonstrable need for this functionality.
>>>>
>>>> Work wise, it would have to include adding physical CPU hotplug support
>>>> to the arm64 kernel as a precondition, before worrying about doing it in
>>>> KVM.
>>>>
>>>> For KVM itself, particular area of interests would be:
>>>> - Making GICv3 redistributors magically appear in the IPA space
>>>> - Live resizing of GICv3 structures
>>>> - Dynamic allocation of MPIDR, and mapping with vcpu_id  
>>>
>>> I have CPU topology description patches on the QEMU list now[*]. A next
>>> step for me is to this MPIDR work. I probably won't get to it until the
>>> end of August though.
>>>
>>> [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01168.html
>>>   
>>>>
>>>> This should keep someone busy for a good couple of weeks (give or take a
>>>> few months).  
>>>
>>> :-)
>>>   
>>>>
>>>> That being said, I'd rather see support in QEMU first, creating all the
>>>> vcpu/redistributors upfront, and signalling the hotplug event via the
>>>> virtual firmware. And then post some numbers to show that creating all
>>>> the vcpus upfront is not acceptable.  
>>>
>>> I think the upfront allocation, allocating all possible cpus, but only
>>> activating all present cpus, was the planned approach. What were the
>>> concerns about that approach? Just vcpu memory overhead for too many
>>> overly ambitious VM configs?  
>>
>> I don't have any ARM-specific concern about that, and I think this is
>> the right approach. It has the good property of not requiring much
>> change in the kernel (other than actually supporting CPU hotplug).
> for x86 we allocate VCPUs dynamically (both QEMU and KVM)
> CCing ppc/s390 folks as I don't recall how it's implemented there.

s390x: also handled that way. Dynamically allocated.

Unplug: not supported by the architecture and fenced.

I remember a discussion where people said dynamically creating/deleting
VCPUs (and therefore threads) is preferred, because then there is no way
on earth a malicious guest could make use of such a CPU (in case there
would be a subtle BUG in QEMU).

-- 

Thanks,

David / dhildenb
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
