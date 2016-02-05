Received: by 10.25.159.19 with SMTP id i19csp1032146lfe;
        Fri, 5 Feb 2016 05:03:07 -0800 (PST)
X-Received: by 10.141.2.68 with SMTP id e65mr17092530qhd.64.1454677387023;
        Fri, 05 Feb 2016 05:03:07 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id w201si15773642qka.0.2016.02.05.05.03.06;
        Fri, 05 Feb 2016 05:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 94D31497E0;
	Fri,  5 Feb 2016 07:57:33 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bv1obvSkAKsh; Fri,  5 Feb 2016 07:57:27 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 946784977A;
	Fri,  5 Feb 2016 07:57:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C80F64965E
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 07:57:26 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqwui-O3Iras for <kvmarm@lists.cs.columbia.edu>;
 Fri,  5 Feb 2016 07:57:20 -0500 (EST)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4C68348531
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 07:57:20 -0500 (EST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 714563A1;
 Fri,  5 Feb 2016 05:02:05 -0800 (PST)
Received: from [10.1.209.129] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B77EF3F213; Fri,  5 Feb 2016 05:02:49 -0800 (PST)
Subject: Re: MPIDR Aff0 question
To: Andrew Jones <drjones@redhat.com>
References: <20160204183801.GF3890@hawk.localdomain>
 <56B39D9A.7000008@arm.com> <20160205092353.GA3873@hawk.localdomain>
 <56B47B76.3070402@arm.com> <20160205120300.GD3873@hawk.localdomain>
From: Marc Zyngier <marc.zyngier@arm.com>
X-Enigmail-Draft-Status: N1110
Organization: ARM Ltd
Message-ID: <56B49D78.9020709@arm.com>
Date: Fri, 5 Feb 2016 13:02:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160205120300.GD3873@hawk.localdomain>
Cc: andre.przywara@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
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
X-TUID: HlyNnnFcu+p3

On 05/02/16 12:03, Andrew Jones wrote:
> On Fri, Feb 05, 2016 at 10:37:42AM +0000, Marc Zyngier wrote:
>> On 05/02/16 09:23, Andrew Jones wrote:
>>> On Thu, Feb 04, 2016 at 06:51:06PM +0000, Marc Zyngier wrote:
>>>> Hi Drew,
>>>>
>>>> On 04/02/16 18:38, Andrew Jones wrote:
>>>>>
>>>>> Hi Marc and Andre,
>>>>>
>>>>> I completely understand why reset_mpidr() limits Aff0 to 16, thanks
>>>>> to Andre's nice comment about ICC_SGIxR. Now, here's my question;
>>>>> it seems that the Cortex-A{53,57,72} manuals want to further limit
>>>>> Aff0 to 4, going so far as to say bits 7:2 are RES0. I'm looking
>>>>> at userspace dictating the MPIDR for KVM. QEMU tries to model the
>>>>> A57 right now, so to be true to the manual, Aff0 should only address
>>>>> four PEs, but that would generate a higher trap cost for SGI broadcasts
>>>>> when using KVM. Sigh... what to do?
>>>>
>>>> There are two things to consider:
>>>>
>>>> - The GICv3 architecture is perfectly happy to address 16 CPUs at Aff0.
>>>> - ARM cores are designed to be grouped in clusters of at most 4, but
>>>> other implementations may have very different layouts.
>>>>
>>>> If you want to model something matches reality, then you have to follow
>>>> what Cortex-A cores do, assuming you are exposing Cortex-A cores. But
>>>> absolutely nothing forces you to (after all, we're not exposing the
>>>> intricacies of L2 caches, which is the actual reason why we have
>>>> clusters of 4 cores).
>>>
>>> Thanks Marc. I'll take the question of whether or not deviation, in
>>> the interest of optimal gicv3 use, is OK to QEMU.
>>>
>>>>
>>>>> Additionally I'm looking at adding support to represent more complex
>>>>> topologies in the guest MPIDR (sockets/cores/threads). I see Linux
>>>>> currently expects Aff2:socket, Aff1:core, Aff0:thread when threads
>>>>> are in use, and Aff1:socket, Aff0:core, when they're not. Assuming
>>>>> there are never more than 4 threads to a core makes the first
>>>>> expectation fine, but the second one would easily blow the 2 Aff0
>>>>> bits alloted, and maybe even a 4 Aff0 bit allotment.
>>>>>
>>>>> So my current thinking is that always using Aff2:socket, Aff1:cluster,
>>>>> Aff0:core (no threads allowed) would be nice for KVM, and allowing up
>>>>> to 16 cores to be addressed in Aff0. As it seems there's no standard
>>>>> for MPIDR, then that could be the KVM guest "standard".
>>>>>
>>>>> TCG note: I suppose threads could be allowed there, using
>>>>> Aff2:socket, Aff1:core, Aff0:thread (no more than 4 threads)
>>>>
>>>> I'm not sure why you'd want to map a given topology to a guest (other
>>>> than to give the illusion of a particular system). The affinity register
>>>> does not define any of this (as you noticed). And what would Aff3 be in
>>>> your design? Shelve? Rack? ;-)
>>>
>>> :-) Currently Aff3 would be unused, as there doesn't seem to be a need
>>> for it, and as some processors don't have it, it would only complicate
>>> things to use it sometimes.
>>
>> Careful: on a 64bit CPU, Aff3 is always present.
> 
> A57 and A72 don't appear to define it though. They have 63:32 as RES0.

That's because they do support AArch32, which only has Aff2-0. On a pure
64bit CPU, Aff3 would definitely have an Aff3 (though it is most likely
to be 0 for a while).

>>
>>>>
>>>> What would the benefit of defining a "socket"?
>>>
>>> That's a good lead in for my next question. While I don't believe
>>> there needs to be any relationship between socket and numa node, I
>>> suspect on real machines there is, and quite possibly socket == node.
>>> Shannon is adding numa support to QEMU right now. Without special
>>> configuration there's no gain other than illusion, but with pinning,
>>> etc. the guest numa nodes will map to host nodes, and thus passing
>>> that information on to the guest's kernel is useful. Populating a
>>> socket/node affinity field seems to me like a needed step. But,
>>> question time, is it? Maybe not. Also, the way Linux currently
>>> handles non-thread using MPIDRs (Aff1:socket, Aff0:core) throws a
>>> wrench at the Aff2:socket, Aff1:"cluster", Aff0:core(max 16) plan.
>>> Either the plan or Linux would need to be changed.
>>
>> What I'm worried of at that stage is that we hardcode a virtual topology
>> without the knowledge of the physical one. Let's take an example:
> 
> Mark's pointer to cpu-map was the piece I was missing. I didn't want to
> hardcode anything, but thought we had to at least agree on the meanings
> of affinity levels. I see now that the cpu-map node allows us to describe
> the meanings.
> 
>>
>> I (wish I) have a physical system with 2 sockets, 16 cores per socket, 8
>> threads per core. I'm about to run a VM with 16 vcpus. If we're going to
>> start pinning things, then we'll have to express that pinning in the
>> VM's MPIDRs, and make sure we describe the mapping between the MPIDRs
>> and the topology in the firmware tables (DT or ACPI).
>>
>> What I'm trying to say here is that there is you cannot really enforce a
>> partitioning of MPIDR without considering the underlying HW, and
>> communicating your expectations to the OS running in the VM.
>>
>> Do I make any sense?
> 
> Sure does, but, just be to be sure; so it's not crazy to want to do
> this; we just need to 1) pick a topology that makes sense for the
> guest/host (that's the user's/libvirt's job), and 2) make sure we
> not only assign MPIDR affinities appropriately, but also describe
> them with cpu-map (or the ACPI equivalent).
> 
> Is that correct?

I believe so. That way, you can describe to the guest OS what are the
constraints you have put on the VM from the host, and it itself can make
an informed decision on task placement and such.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
