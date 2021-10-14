Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4206492lfc;
        Thu, 14 Oct 2021 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO/9fpMUKZnfnQfyQM4whixeQIUHXD0mIVd1+P68Ce34G8v1vEXVEjiYbJ9Nt6ywpeqPK5
X-Received: by 2002:a05:6214:2026:: with SMTP id 6mr6074837qvf.61.1634228015005;
        Thu, 14 Oct 2021 09:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634228015; cv=none;
        d=google.com; s=arc-20160816;
        b=SSsIWGtxmDEby115CXlkIecYBMGaVfz9TzjUDqzhDqW1/4IOt4kc5cXlypKB2usXOI
         V6iuyOgOplt898crKhUyfrKYfEr63Xb6ZcwRzSDXYE9J4BSp+l4+Bcx6xdj3mLVJT5x6
         /x+WJsZSONCC2/HA5UhSWnM78qHsxQplXOn7Kn5rjwutB0Y4aWSvqtTQyXv2/wlNujOQ
         DIy30TYlOZX84lwWGFVs0BleIJBx8GXIsz8D2ISwxAPgAIgZeIHDS6wSfz5ScH3hxv6K
         ez6Q/BpR7nGDr1i1EfvsE5uPq2iZYwb9kUXA8Zl5W7fvXgSFcxz94C4AmT8pX0F4YeC1
         hWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1adBIZGKXSU5y4M0TDRr3IIogDLxARLXmixeprWkpps=;
        b=JaY9jluO5JhAn6ZyJX+z+dx3z0uYTflRhVycOSnrvoG1YRuXQoN5izSWksN4NKoMRJ
         YExKmc318lYvPPwu9fCLQhA9RVyv/J6m+7OY3AVp/MNZclG0SaCfIXmclbBuZ/Qwq98r
         2lOMR6I+i81UEmIIp6N/0042LA5FW+cKIvzLyPSWfWx6W90E1VRUcfQc4C6wJTp98aZN
         ksebWAA6yNz6S4EjIZ2ksosW3qPN2UTRBBx6hWq3PztfSnMhP7jI6xF9Px8TIgtZrp7B
         LzTQjQzsXRggRjGHuu/eyn+YDqnCLGzI7dshWtLNA6D6dJQW5Pn5i+kcq7sdwbDjV4Ms
         WSyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OunTeFy8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si2301288qvs.191.2021.10.14.09.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 09:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OunTeFy8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mb3ML-00025P-UE
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 12:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mb2mU-0008Qk-3h
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mb2mL-0007Jm-Tf
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1adBIZGKXSU5y4M0TDRr3IIogDLxARLXmixeprWkpps=;
 b=OunTeFy8BtfNsZmAMXTdBPxmYr6jQ74dFz9+aNA/KqjMsnmt/XpQkWC40jLPm3vBwzmBSz
 A0qjnVKzefZqdNX1Bu29r9j4Z5RuTtePwRsSd6ulZUYv09m9LPCnHqwcQYshKo4zZOY3dk
 dVsKW44ApphwPuFxeE97TyOwKbgMeRA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-JEqhxZMeMGuOwFUZP0rAnA-1; Thu, 14 Oct 2021 11:36:18 -0400
X-MC-Unique: JEqhxZMeMGuOwFUZP0rAnA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso4889213wrc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1adBIZGKXSU5y4M0TDRr3IIogDLxARLXmixeprWkpps=;
 b=uc15byI+11WaBbGl96fQ+abaBSjQDzKDznRRKxXIgUgG/im02NKtyL6uuiXOWNQ2hm
 IJOEIcGbrN9V/4lYsvR38P1M3Mohf9dw/gNORFZediJn6IwMpOwpUiJcqnAMAWyKulM7
 Ew2RkzEwof9/KrUFmDxKs7uVnBI2gfxc4pGq4mFKi35Xv3DEfWPaTsNKPe3DoeR3ud2M
 ew4HCE/wl0gahJvJZ+IHKrJDaUiONlVmc3nnMxq9/x9ZKLgxwSTY9YjUoqLPfj8m2/0t
 tg0+I7OF96QlQUQQ2KdOETzsEJHgLIauXXdpaE94T1Qeg8fR0Y7XWqDS6kZMLfse2s5h
 8wvw==
X-Gm-Message-State: AOAM530Mc1++h8RqQyXNdrzBrYB59Sz/IDYHResf9fplR3MjSrqnudgP
 YSlTWF3ppHjqB1Hy82IIiAcRUY9ZCYgw045bc0l4l1yHeAeW6XgDl8R44xGDCipsBDnszbNP6pK
 xnkT9waA+huPkP7w=
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr19973153wmc.69.1634225776872; 
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr19973122wmc.69.1634225776578; 
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id k17sm2573270wrc.93.2021.10.14.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
Date: Thu, 14 Oct 2021 17:36:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211014153609.pzndx7um3dfdgelo@gator>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014171417.541c9bee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAPmsdCsKttz

On Thu, Oct 14, 2021 at 05:14:17PM +0200, Igor Mammedov wrote:
> On Wed, 13 Oct 2021 14:28:40 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Wed, Oct 13, 2021 at 02:11:25PM +0200, Andrew Jones wrote:
> > > On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:  
> > > > On Wed, 13 Oct 2021 13:35:44 +0200
> > > > Andrew Jones <drjones@redhat.com> wrote:
> > > >   
> > > > > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:  
> > > > > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > > > > Gavin Shan <gshan@redhat.com> wrote:
> > > > > >     
> > > > > > > The following option is used to specify the distance map. It's
> > > > > > > possible the option isn't provided by user. In this case, the
> > > > > > > distance map isn't populated and exposed to platform. On the
> > > > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > > > > but their NUMA IDs should be included in the "/distance-map"
> > > > > > > device-tree node, so that kernel can probe them properly if
> > > > > > > device-tree is used.
> > > > > > > 
> > > > > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > > > 
> > > > > > > This adds extra check after the machine is initialized, to
> > > > > > > ask for the distance map from user when empty nodes exist in
> > > > > > > device-tree.
> > > > > > > 
> > > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > > ---
> > > > > > >  hw/core/machine.c     |  4 ++++
> > > > > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > > > > >  include/sysemu/numa.h |  1 +
> > > > > > >  3 files changed, 29 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > > > > index b8d95eec32..c0765ad973 100644
> > > > > > > --- a/hw/core/machine.c
> > > > > > > +++ b/hw/core/machine.c
> > > > > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > > > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > > > > >      machine_class->init(machine);
> > > > > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > > > > +
> > > > > > > +    if (machine->numa_state) {
> > > > > > > +        numa_complete_validation(machine);
> > > > > > > +    }
> > > > > > >  }
> > > > > > >  
> > > > > > >  static NotifierList machine_init_done_notifiers =
> > > > > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > > > > index 510d096a88..7404b7dd38 100644
> > > > > > > --- a/hw/core/numa.c
> > > > > > > +++ b/hw/core/numa.c
> > > > > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > > > > >      }
> > > > > > >  }
> > > > > > >  
> > > > > > > +/*
> > > > > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > > > > + * be included in the distance map. So we need provide pairs of distances
> > > > > > > + * in this case.
> > > > > > > + */
> > > > > > > +void numa_complete_validation(MachineState *ms)
> > > > > > > +{
> > > > > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > > > > +    int i;
> > > > > > > +
> > > > > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {    
> > > > > > 
> > > > > > also skip check/limitation when VM is launched with ACPI enabled?    
> > 
> > On second thought, I guess it's a good idea to not error out when ACPI is
> > enabled. There's no point in burdening the ACPI user.
> > 
> > > > > 
> > > > > Even with ACPI enabled we generate a DT and would like that DT to be as
> > > > > complete as possible. Of course we should generate a SLIT table with  
> > > > 
> > > > Guest will work just fine without distance map as SRAT describes
> > > > all numa nodes.
> > > > You are forcing VM to have SLIT just for the sake of 'completeness'
> > > > that's practically unused.
> > > > 
> > > > I'm still unsure about pushing all of this in generic numa code,
> > > > as this will be used only by ARM for now. It's better to keep it
> > > > ARM specific, and when RISCV machine will start using this, it
> > > > could be moved to generic code.  
> > 
> > I think RISCV could start using it now. Linux shares the mem/numa DT
> > parsing code between Arm and RISCV. If RISCV QEMU wanted to start
> > exposing NUMA nodes, then they might as well support empty ones from
> > the start.
> 
> When RISCV will start using memory-less nodes, we can move this check to
> generic code.
> So far 2/2 takes care of ARM only, as result I don't see
> a good reason to generalize it now. (CCing RISCV folks to see if
> there is any plans to impl. that)
>  
> 
> > > I don't see a problem in providing this DT node / ACPI table to guests
> > > with empty NUMA nodes. I don't even see a problem with providing the
> > > distance information unconditionally. Can you explain why we should
> > > prefer not to provide optional HW descriptions?  
> > 
> > I'm still curious why we should be so reluctant to add HW descriptions.
> > I agree we should be reluctant to error out, though.
> 
> If distance map were the only way to figure out present node-ids,
> I wouldn't mind making it non-optional.
> 
> However guest can already get node-ids from mem/cpu/pci nodes
> with current device-tree that QEMU generates and
> forcing optional distance-map (with duplicate info) on user
> creates non must-have CLI requirements/inconvenience that
> will eventually propagate to higher layers, I'd rather avoid
> that if possible.
> 
> So question is if an idea of fetching numa-ids from cpu nodes
> in addition to memory nodes (which should cover QEMU needs)
> have been considered and why it didn't work out?

Thinking about it some more. I think we only need patch 2/2 of this
series. We should double check, but if when Linux generates its
default distance-map it already generates a map using the numa-ids
in the cpu nodes of the DT, then I guess the resulting Linux generated
distance-map will be sufficient to represent the empty NUMA nodes and
could be used for DT memory hotplug if Linux ever tried to implement
that.

Gavin, can you check if we can just drop patch 1/2 and then when
booting a DT guest with empty numa nodes we get the distance
map we wanted to enforce anyway?

Thanks,
drew

> 
> > So, when ACPI is
> > enabled, let's skip the enforcement of the SLIT table generation, even
> > if there are empty nodes, as you suggest.
> > 
> > Thanks,
> > drew
> > 
> > > 
> > > Thanks,
> > > drew 
> > >   
> > > >   
> > > > > the distance information the user provides on the command line in order
> > > > > to satisfy the check, and we will, since we already have that code in
> > > > > place.  
> > > > 
> > > >   
> > > > > 
> > > > > Thanks,
> > > > > drew
> > > > >   
> > > > > >     
> > > > > > > +        return;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > > > > +            error_report("Empty node %d found, please provide "
> > > > > > > +                         "distance map.", i);
> > > > > > > +            exit(EXIT_FAILURE);
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +}
> > > > > > > +
> > > > > > >  void parse_numa_opts(MachineState *ms)
> > > > > > >  {
> > > > > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > > > > index 4173ef2afa..80f25ab830 100644
> > > > > > > --- a/include/sysemu/numa.h
> > > > > > > +++ b/include/sysemu/numa.h
> > > > > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > > > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > > > > >                             Error **errp);
> > > > > > >  void numa_complete_configuration(MachineState *ms);
> > > > > > > +void numa_complete_validation(MachineState *ms);
> > > > > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > > > > >  extern QemuOptsList qemu_numa_opts;
> > > > > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,    
> > > > > >     
> > > > >   
> > > >   
> > 
> > 
> 

