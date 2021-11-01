Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp1816624lfv;
        Mon, 1 Nov 2021 01:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyWv03lnxK89wcmOZhKMR9HmtUOtaENpqJbVGn+0zmoo7fs8tTwkiKXSWdH9ETEX2fErJQ
X-Received: by 2002:a05:6830:928:: with SMTP id v40mr10786397ott.223.1635756293182;
        Mon, 01 Nov 2021 01:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635756293; cv=none;
        d=google.com; s=arc-20160816;
        b=E/r1WMfalEplbUHgfyb3Oo58adY6RgbeUPN4ChLjvhoaaATS+QI1GvrjOCBzeNbfK8
         V5q32ouEqF4roZsrhLPzAtvmeDkCXUrU83HzDom2jP9lwZBywi+deeu/r5TgVYTvSFYD
         Z7holEOt9BVwRuQvzEJmJg875w7/Vh8ERbGStAZzKh0R31IAzmJ88TKdeE3m9KGTPQji
         w+DelsPLJA9UEE7fEbVtU2MClzckaT9yfpGXpVI12XdHM8lfmiyNGT6rGqq7qdFhxi+P
         iXB9P6iiY32BdWpcI65e/UN7jZhP9cAb5Vruiizb+U0Se+fs6LoXhYCA06tYwp0w0bBh
         ysVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=vuAH9C5mXgfFyNY3dgoTMQxTHok2EhE+UpMJ7rCc/Ag=;
        b=nUogZL4bJ48UQqyik3hWLl2jrFIqTpxDBjws05GKH571Ipxp+2FoPnSp0sLXFj4RMW
         +Zi3bJ/+W1WB6CEt+YkeM/9bqOSMKE4wj1hfXN8Z60e0UyOWKs04ZIkKrFzBH5GxZ1ux
         DoCvdnHj+/Ww7isKRIAqcgBwVcsnsGekmbujEyu3tukPvmHIDf3AT97HyCnLwVqSOJZl
         3h1VhEPrE1Z0fqznyiAu7bcqTfP/AwzXIVqqyYUUGzr3pFgJDgajelw4xjSC+AQg89w/
         jlFJ1/ASsH9AZ9uxOhDdIb+Ykb7jbq7HXDGEIjSyk7Auf9mY65zt6fbe7mjbKlIGjSlT
         4qNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2qeDNM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si1085420oim.157.2021.11.01.01.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 01:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2qeDNM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhSw0-0007G6-C0
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 04:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mhSvt-0007Fi-1A
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 04:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mhSvm-00075O-Ih
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 04:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635756276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuAH9C5mXgfFyNY3dgoTMQxTHok2EhE+UpMJ7rCc/Ag=;
 b=f2qeDNM3dzHj/tW5CQAWtFYFiX3QLkJG4o6MSyT4eKXOETxWyW2Eats7l7yHcYTkBM6czc
 oPaUcsClJ16DhtZGdV7Wrr26njeBo++dqia2B5A+UnxvoP1zPGTjoFBa5uapZqc3ceqUYd
 2RV2VdT+HY+7jJiFXGFoU59bD9QvLpg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-AY4mYp4qMeCheGQAXNedaw-1; Mon, 01 Nov 2021 04:44:35 -0400
X-MC-Unique: AY4mYp4qMeCheGQAXNedaw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w12-20020aa7da4c000000b003e28acbf765so2433397eds.6
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 01:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuAH9C5mXgfFyNY3dgoTMQxTHok2EhE+UpMJ7rCc/Ag=;
 b=2dWySdM9LcsVAcoHe2C+iZT5RHgfqpr9c6SBVblKGfPaIII0fNywMgi7mscvOZO237
 +4w6MixqeV9aEsX4Lz9gi+7FmJXhXj+iv09vAd8nzey1nQ7IOBqBLCSfiwma45fJhz3v
 EMZWmp7Wmp8q7oA8BeQDOhQswVPfEzMYgZm55mz+qfY4YOxCmLZJxGSLC9B20jyfXgyx
 54W4F1fujLEj3jWKnElQu6NraT/uhL00eH+QvsWPx36g5UuYAZhouXyFNUQ0L05aUpM4
 R/2mYVS3MIZm3/DvG48kua7K9AVYJkyr5g7tSlCMCqTeW7rsPgChbPTDjjY4mi1z1n5d
 50HQ==
X-Gm-Message-State: AOAM530i1mQIx/3ILJZR34BEne/kqmTDCAJLOhsECi+N0cOuF5wBU2Js
 M7T9rLaqW+KtucfbYNQ481W6DHP14kFgQ+FsS0kyJXQaruKQA6aLn4zS4yKmusnPsEAvNCznvcR
 mY8VYkfS4ImDh
X-Received: by 2002:a17:906:f24d:: with SMTP id
 gy13mr14617239ejb.282.1635756273718; 
 Mon, 01 Nov 2021 01:44:33 -0700 (PDT)
X-Received: by 2002:a17:906:f24d:: with SMTP id
 gy13mr14617200ejb.282.1635756273371; 
 Mon, 01 Nov 2021 01:44:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v10sm8369424edt.24.2021.11.01.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 01:44:32 -0700 (PDT)
Date: Mon, 1 Nov 2021 09:44:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211101094431.71e1a50a@redhat.com>
In-Reply-To: <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b6GvQPYwQOpH

On Thu, 28 Oct 2021 22:32:09 +1100
Gavin Shan <gshan@redhat.com> wrote:

> On 10/28/21 2:40 AM, Igor Mammedov wrote:
> > On Wed, 27 Oct 2021 13:29:58 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> The empty NUMA nodes, where no memory resides, aren't exposed
> >> through ACPI SRAT table. It's not user preferred behaviour because
> >> the corresponding memory node devices are missed from the guest
> >> kernel as the following example shows. It means the guest kernel
> >> doesn't have the node information as user specifies. However,
> >> memory can be still hot added to these empty NUMA nodes when
> >> they're not exposed.
> >>
> >>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
> >>    -accel kvm -machine virt,gic-version=host               \
> >>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
> >>    -m 1024M,slots=16,maxmem=64G                            \
> >>    -object memory-backend-ram,id=mem0,size=512M            \
> >>    -object memory-backend-ram,id=mem1,size=512M            \
> >>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
> >>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
> >>    -numa node,nodeid=2                                     \
> >>    -numa node,nodeid=3                                     \
> >>       :
> >>    guest# ls /sys/devices/system/node | grep node
> >>    node0
> >>    node1
> >>    (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
> >>    (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
> >>    guest# ls /sys/devices/system/node | grep node
> >>    node0
> >>    node1
> >>    node2
> >>    guest# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
> >>    Node 2 MemTotal:    1048576 kB
> >>
> >> This exposes these empty NUMA nodes through ACPI SRAT table. With
> >> this applied, the corresponding memory node devices can be found
> >> from the guest. Note that the hotpluggable capability is explicitly
> >> given to these empty NUMA nodes for sake of completeness.
> >>
> >>    guest# ls /sys/devices/system/node | grep node
> >>    node0
> >>    node1
> >>    node2
> >>    node3
> >>    guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
> >>    Node 3 MemTotal:    0 kB
> >>    (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
> >>    (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
> >>    guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
> >>    Node 3 MemTotal:    1048576 kB  
> > 
> > I'm still not sure why this is necessary and if it's a good idea,
> > is there a real hardware that have such nodes?
> > 
> > SRAT is used to assign resources to nodes, I haven't seen it being
> > used  as means to describe an empty node anywhere in the spec.
> > (perhaps we should not allow empty nodes on QEMU CLI at all).
> > 
> > Then if we really need this, why it's done for ARM only
> > and not for x86?
> >   
> 
> I think this case exists in real hardware where the memory DIMM
> isn't plugged, but the node is still probed.
Then please, provide SRAT table from such hw
(a lot of them (to justify it as defacto 'standard')?
since such hw firmware could be buggy as well).

BTW, fake memory node doesn't have to be present to make guest
notice an existing numa node. it can be represented by affinity
entries as well (see chapter:System Resource Affinity Table (SRAT)
in the spec).

At the moment, I'm totally unconvinced that empty numa nodes
are valid to provide.


> Besides, this patch
> addresses two issues:
> 
> (1) To make the information contained in guest kernel consistent
>      to the command line as the user expects. It means the sysfs
>      entries for these empty NUMA nodes in guest kernel reflects
>      what user provided.
-numa/SRAT describe boot time configuration.
So if you do not specify empty nodes on CLI, then number of nodes
would be consistent.

> (2) Without this patch, the node number can be twisted from user's
>      perspective. As the example included in the commit log, node3
>      should be created, but node2 is actually created. The patch
>      reserves the NUMA node IDs in advance to avoid the issue.
> 
>      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>         :
>      -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>      -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>      -numa node,nodeid=2                                     \
>      -numa node,nodeid=3                                     \
>      guest# ls /sys/devices/system/node | grep node
>      node0  node1
>      (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>      (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>      guest# ls /sys/devices/system/node | grep node
>      node0  node1  node2

The same node numbering on guest side and QEMU CLI works only
by accident not by design. In short numbers may not match
(in linux kernel case it depends on the order the nodes
are enumerated), if you really want numbers to match then fix
guest kernel to use proximity domain for numbering.

The important thing here is that resources are grouped
together, according to proximity domain.

> We definitely need empty NUMA nodes from QEMU CLI. One case I heard
> of is kdump developer specify NUMA nodes and corresponding pc-dimm
> objects for memory hot-add and test the memory usability.

Question is if the node has to be absolutely empty for this?
It should be possible to use a node that has CPUs assigned to it.

Or add pc-dimm at runtime, which should dynamically create
a numa node for it if the node wasn't described before.

> I'm not
> familiar with ACPI specification, but linux kernel fetches NUMA
> node IDs from the following ACPI tables on ARM64. It's possible
> the empty NUMA node IDs are parsed from GENERIC_AFFINITY or SLIT
> tables if they exist in the corresponding ACPI tables.
> 
>      ACPI_SRAT_TYPE_MEMORY_AFFINITY
>      ACPI_SRAT_TYPE_GENERIC_AFFINITY
any possible entry type can be a source for numa node,
if guest doesn't do this it's guest's bug to fix.

>      ACPI_SIG_SLIT                          # if it exists
that's a recent addition tied to [1].
1) https://www.mail-archive.com/qemu-devel@nongnu.org/msg843453.html
If I recall correctly, related QEMU patch was dropped.

> So I think other architectures including x86 needs similar mechanism
> to expose NUMA node IDs through ACPI table. If you agree, I can post
> additional patches to do this after this one is settled and merged.

I do not agree to bogus entries approach at all.
Sometimes, we merge 'out of spec' changes but that should be
baked by 'must have' justification and tested with wide
range of guest OSes (if Windows (with its more strict ACPI impl.)
boots on virt-arm machine it should be tested as well).

So far I don't see 'must have' aspect in bogus nodes,
only a convenience one (with 'works by accident' caveat).

I'm sorry for being stingy about out of spec things,
but that is typical source of regressions on ACPI side
which is noticed too late when users come back with broken
guest after release.

> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> Reviewed-by: Andrew Jones <drjones@redhat.com>
> >> ---
> >> v2: Improved commit log as suggested by Drew and Igor.
> >> ---
> >>   hw/arm/virt-acpi-build.c | 14 +++++++++-----
> >>   1 file changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 674f902652..a4c95b2f64 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>       const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
> >>       AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
> >>                           .oem_table_id = vms->oem_table_id };
> >> +    MemoryAffinityFlags flags;
> >>   
> >>       acpi_table_begin(&table, table_data);
> >>       build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> >> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   
> >>       mem_base = vms->memmap[VIRT_MEM].base;
> >>       for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> >> -        if (ms->numa_state->nodes[i].node_mem > 0) {
> >> -            build_srat_memory(table_data, mem_base,
> >> -                              ms->numa_state->nodes[i].node_mem, i,
> >> -                              MEM_AFFINITY_ENABLED);
> >> -            mem_base += ms->numa_state->nodes[i].node_mem;
> >> +        if (ms->numa_state->nodes[i].node_mem) {
> >> +            flags = MEM_AFFINITY_ENABLED;
> >> +        } else {
> >> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
> >>           }
> >> +
> >> +        build_srat_memory(table_data, mem_base,
> >> +                          ms->numa_state->nodes[i].node_mem, i, flags);  
> > that will create 0 length memory range, which is "Enabled",
> > I'm not sure it's safe thing to do.
> > 
> > As side effect this will also create empty ranges for memory-less
> > nodes that have only CPUs, where it's not necessary.
> > 
> > I'd really try avoid adding empty ranges unless it hard requirement,
> > described somewhere or fixes a bug that can't be fixed elsewhere.
> >   
> 
> It's safe to Linux at least as I tested on ARM64. The (zero) memory
> block doesn't affect anything. Besides, the memory block which has
> been marked as hotpluggable won't be handled in Linux on ARM64
> actually.
> 
> Yes, the empty NUMA nodes are meaningless to CPUs until memory is
> hot added into them.
> 
> >> +        mem_base += ms->numa_state->nodes[i].node_mem;
> >>       }
> >>   
> >>       if (ms->nvdimms_state->is_enabled) {  
> >   
> 
> Thanks,
> Gavin
> 

