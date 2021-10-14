Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4150683lfc;
        Thu, 14 Oct 2021 08:15:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXIQcagdX4gMWJawngh/Nes0N/72eZLpY6g7jGkV+SaiJxJfMlLfEWbPrpzwcMOD8Yl0x3
X-Received: by 2002:a37:c43:: with SMTP id 64mr5281478qkm.389.1634224518057;
        Thu, 14 Oct 2021 08:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634224518; cv=none;
        d=google.com; s=arc-20160816;
        b=uItKKqpnmxZT8+52bcdOOvLF+fnciGtqoQ1NhIbLQQUk+DQEzqQQahbB1q/3YapD5W
         1XVhOL1JoH6V4X7Pvb79F8YaW9ZD9pkRxEojdQJkkaru+0y15p5P7T/95dwHqCYBwqox
         6dS4pOSgOTcHTsKfHUWzyilM0HrFoI0OlUg0j+0PrWvnP2ECZqYF45UIwfgQDWROM0r8
         WGH5wgbbxJpmeUp8gIQNPd82F90fjZH794smCHxLcldcUU8fW2idVAqb1UxeUNRu5dGN
         fcPl0R2Km2hjeSekD6gkk/vP30fNeiqdELMjHBMxramdnm86Q7TNkX9vjdElg0QLsMP6
         rxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=VGf40n6rnuRvz/W2E7iIH24GzDEeB0FtWbXbC+hXd3I=;
        b=GGl1tOqT15w0dUpeaeV4B/8jBhcMvijxSrsaAZjCag+vrkMdgpxAuWAlLRzmzjUFsa
         kNAPjh6aRjG6DkWbJaKq4suw9Sv6Y3Cwx0H7jCaTTgTlOH2CiFEkjqlqlPYnPq/lkhDc
         lkcuOR6RGxqIGfBsMHV4ILYsRIQfB6Qv33oMpWfp988h4j4/hvPYZ3uPYyUSviaXTxCW
         WpGoX+0qhvg35uzujqdccs8LoDAvrKotk8Nx12q8bvyWcLkqQo37M+i4qVPWkuT2DENk
         6Qo8JgxMeVVIp61as3CSO2/W2SzkCHJERMYD19d6OsS+EX0HzawUsfIcEoGaZAMwihzI
         pLqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R1/bFEe1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si4704894uav.55.2021.10.14.08.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 08:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R1/bFEe1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mb2Rv-0006C5-7s
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 11:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mb2RI-00069x-4O
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 11:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mb2R6-0004JC-9C
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 11:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634224461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGf40n6rnuRvz/W2E7iIH24GzDEeB0FtWbXbC+hXd3I=;
 b=R1/bFEe1I3zk8nZOVH29cKqDdEis/nbMWV6ImrRuAc3xReG8FCjZcGr3femmKq+AwVpQpr
 51n5P4Nu6RVz2KFdlYReieOtDxu+Pn2Mw/qJ4+UtB6qEeXG4lR4n3XLLoRJ285VwMX0Ref
 RaS0ywzpdPRej0nRgBot3wA4WO4JWqE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-hdSMxOX1PpuYBMsMBg135A-1; Thu, 14 Oct 2021 11:14:20 -0400
X-MC-Unique: hdSMxOX1PpuYBMsMBg135A-1
Received: by mail-ed1-f71.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso5432269ede.16
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 08:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGf40n6rnuRvz/W2E7iIH24GzDEeB0FtWbXbC+hXd3I=;
 b=flIJ0aHRImp4Z1yXJNRvPYmciPLit/T+K6q7U5ha77CQtSqSN0xL7kfRbIaM7cu7xJ
 M9AeQ1fTFtrNjf2uCiLusigAPgl/DnKIgvjOU/4ySPVtykja3+8g10PyfhUcj6WOf/p0
 rhoS4KUU/pB+TXf3e0Xvzb0j1Levv5ESvjU0blgfAnkDVweaxwxBXasc8oz1zvSz6j7O
 cIq8Lt3opRYEHUFKs0coXPjF708rGQ7K8TYCyITWEgFWdq8baUOVrIwBCxw8Xz4duisT
 LQ1B7PgR6EnwtoMjr+n4iM7xM7bD0Mnmw0PpW9o1eS4zTe+HQbxLLN87bthmNa8hkmEm
 krJw==
X-Gm-Message-State: AOAM530vdr/Xn3zlPRAfH2TC6Fi8nrqRtSg3j+De8khPvRWDTndJFvYU
 OaVCOk8DEjPYRCCTHyEMLcnIZzyM0RKIZ6Lg2Kz9Bjqoaczgq51iVNO8UR179tXCdd9StZxMINU
 SGtdQef9psArd
X-Received: by 2002:a05:6402:1e88:: with SMTP id
 f8mr9555360edf.86.1634224459103; 
 Thu, 14 Oct 2021 08:14:19 -0700 (PDT)
X-Received: by 2002:a05:6402:1e88:: with SMTP id
 f8mr9555329edf.86.1634224458816; 
 Thu, 14 Oct 2021 08:14:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c6sm2124324ejb.41.2021.10.14.08.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:14:18 -0700 (PDT)
Date: Thu, 14 Oct 2021 17:14:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211014171417.541c9bee@redhat.com>
In-Reply-To: <20211013122840.fi4ufle4czyzegtb@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, qemu-riscv@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tH1Lhd0pZ55J

On Wed, 13 Oct 2021 14:28:40 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Oct 13, 2021 at 02:11:25PM +0200, Andrew Jones wrote:
> > On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:  
> > > On Wed, 13 Oct 2021 13:35:44 +0200
> > > Andrew Jones <drjones@redhat.com> wrote:
> > >   
> > > > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:  
> > > > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > > > Gavin Shan <gshan@redhat.com> wrote:
> > > > >     
> > > > > > The following option is used to specify the distance map. It's
> > > > > > possible the option isn't provided by user. In this case, the
> > > > > > distance map isn't populated and exposed to platform. On the
> > > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > > > but their NUMA IDs should be included in the "/distance-map"
> > > > > > device-tree node, so that kernel can probe them properly if
> > > > > > device-tree is used.
> > > > > > 
> > > > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > > 
> > > > > > This adds extra check after the machine is initialized, to
> > > > > > ask for the distance map from user when empty nodes exist in
> > > > > > device-tree.
> > > > > > 
> > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > ---
> > > > > >  hw/core/machine.c     |  4 ++++
> > > > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > > > >  include/sysemu/numa.h |  1 +
> > > > > >  3 files changed, 29 insertions(+)
> > > > > > 
> > > > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > > > index b8d95eec32..c0765ad973 100644
> > > > > > --- a/hw/core/machine.c
> > > > > > +++ b/hw/core/machine.c
> > > > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > > > >      machine_class->init(machine);
> > > > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > > > +
> > > > > > +    if (machine->numa_state) {
> > > > > > +        numa_complete_validation(machine);
> > > > > > +    }
> > > > > >  }
> > > > > >  
> > > > > >  static NotifierList machine_init_done_notifiers =
> > > > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > > > index 510d096a88..7404b7dd38 100644
> > > > > > --- a/hw/core/numa.c
> > > > > > +++ b/hw/core/numa.c
> > > > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > > > >      }
> > > > > >  }
> > > > > >  
> > > > > > +/*
> > > > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > > > + * be included in the distance map. So we need provide pairs of distances
> > > > > > + * in this case.
> > > > > > + */
> > > > > > +void numa_complete_validation(MachineState *ms)
> > > > > > +{
> > > > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > > > +    int i;
> > > > > > +
> > > > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {    
> > > > > 
> > > > > also skip check/limitation when VM is launched with ACPI enabled?    
> 
> On second thought, I guess it's a good idea to not error out when ACPI is
> enabled. There's no point in burdening the ACPI user.
> 
> > > > 
> > > > Even with ACPI enabled we generate a DT and would like that DT to be as
> > > > complete as possible. Of course we should generate a SLIT table with  
> > > 
> > > Guest will work just fine without distance map as SRAT describes
> > > all numa nodes.
> > > You are forcing VM to have SLIT just for the sake of 'completeness'
> > > that's practically unused.
> > > 
> > > I'm still unsure about pushing all of this in generic numa code,
> > > as this will be used only by ARM for now. It's better to keep it
> > > ARM specific, and when RISCV machine will start using this, it
> > > could be moved to generic code.  
> 
> I think RISCV could start using it now. Linux shares the mem/numa DT
> parsing code between Arm and RISCV. If RISCV QEMU wanted to start
> exposing NUMA nodes, then they might as well support empty ones from
> the start.

When RISCV will start using memory-less nodes, we can move this check to
generic code.
So far 2/2 takes care of ARM only, as result I don't see
a good reason to generalize it now. (CCing RISCV folks to see if
there is any plans to impl. that)
 

> > I don't see a problem in providing this DT node / ACPI table to guests
> > with empty NUMA nodes. I don't even see a problem with providing the
> > distance information unconditionally. Can you explain why we should
> > prefer not to provide optional HW descriptions?  
> 
> I'm still curious why we should be so reluctant to add HW descriptions.
> I agree we should be reluctant to error out, though.

If distance map were the only way to figure out present node-ids,
I wouldn't mind making it non-optional.

However guest can already get node-ids from mem/cpu/pci nodes
with current device-tree that QEMU generates and
forcing optional distance-map (with duplicate info) on user
creates non must-have CLI requirements/inconvenience that
will eventually propagate to higher layers, I'd rather avoid
that if possible.

So question is if an idea of fetching numa-ids from cpu nodes
in addition to memory nodes (which should cover QEMU needs)
have been considered and why it didn't work out?

> So, when ACPI is
> enabled, let's skip the enforcement of the SLIT table generation, even
> if there are empty nodes, as you suggest.
> 
> Thanks,
> drew
> 
> > 
> > Thanks,
> > drew 
> >   
> > >   
> > > > the distance information the user provides on the command line in order
> > > > to satisfy the check, and we will, since we already have that code in
> > > > place.  
> > > 
> > >   
> > > > 
> > > > Thanks,
> > > > drew
> > > >   
> > > > >     
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > > > +            error_report("Empty node %d found, please provide "
> > > > > > +                         "distance map.", i);
> > > > > > +            exit(EXIT_FAILURE);
> > > > > > +        }
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > >  void parse_numa_opts(MachineState *ms)
> > > > > >  {
> > > > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > > > index 4173ef2afa..80f25ab830 100644
> > > > > > --- a/include/sysemu/numa.h
> > > > > > +++ b/include/sysemu/numa.h
> > > > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > > > >                             Error **errp);
> > > > > >  void numa_complete_configuration(MachineState *ms);
> > > > > > +void numa_complete_validation(MachineState *ms);
> > > > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > > > >  extern QemuOptsList qemu_numa_opts;
> > > > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,    
> > > > >     
> > > >   
> > >   
> 
> 

