Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2838922lfc;
        Wed, 13 Oct 2021 04:54:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqYkXqJcCWV8YGd3TscDvrksTvrtnEGSAPfBxB7nyrCHM6tMQ428gJDFh7ZiPYGFu8ok3Y
X-Received: by 2002:a25:217:: with SMTP id 23mr35419977ybc.205.1634126041314;
        Wed, 13 Oct 2021 04:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634126041; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDkFxlAjYfUnt35vsACQhl0z7t9Qt7dZ9Izq3lUZBxKeuChrG/jcg6l2xmgnuhI7nO
         5PLWhA4SxFzVZ+QlnB7KkkxCTTn/oDsUnGjPrXLnp90JakMGiJY6/oVqdLa0Uz5YZ19M
         GRofi4cd6eGR5/LE7ixS1inoxBUpYYzygDchqCebUXgmNF4npl13M7hjdlK9Kx8zBfQo
         PrTr/WFxD1UDfaAqYxTbOajWXn5EOzDRey5iV6m7krThkX6MuwZYBI+87Fek2XzTlzNy
         PSs+hHI0b8Nt2A+Gkoas61N2rxuvTLHg8+/sAqKeiomULH62RgNx0CHq1xarZjrcmtou
         feCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=TPonLSLegWY2yDIWUSaNmyHJpo7rXY2SPNoqBYovTvs=;
        b=fyAvG44dBu8t6C2RgeJ4d91IkyUpvZviNu+MI3Wn8I2GJuZYp0CgX7Fhh0qRZ7AjSy
         1gR7603MHgBEpBvfn7vtHgTeVaDrr6c63Kyo08prxAdiO52/l/a7ccKQiFp9heFThcbf
         s87tk+2C9BXOiYY8QCF+Pd7sJPOV00YuSnhbeybBUMw23f/MHCFbr1gQuEFoo/G8vMrS
         YDUP4+QF4xxjRHY+Tvi5PN3687dq6XX0ujq3lZSvrE9zMFGt/s0gvTe88lkHrTE1O/sE
         t+QH9IVBw8UhCjAVf0ihE1/JtBJ248dOtU34MnMBA46LjvmecnkyiEk/1JZnG7VNLZdC
         UbeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YUnKpPp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si24390167ybu.241.2021.10.13.04.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 04:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YUnKpPp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1macpc-0004YJ-Nb
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 07:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macpV-0004Y2-AQ
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 07:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macpT-0001XV-G3
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 07:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634126030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPonLSLegWY2yDIWUSaNmyHJpo7rXY2SPNoqBYovTvs=;
 b=YUnKpPp11CGgRaFd6CDenEATjCXZlJ5uHOUXm7muO9s1MuWUwOIid78AG9Ppvi8yo+ssBu
 uKkTeH7gQvC3EqI83hZ7onItTwrxylR0+66/wLQbsz0ydGASueOfhDAcl8hBDzE7mSqA/u
 7Il1K1ocSzX3OmnteO8TPIIfNiA/Fsg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-iMIzgeW5PDW3gAVQSxcgeg-1; Wed, 13 Oct 2021 07:53:49 -0400
X-MC-Unique: iMIzgeW5PDW3gAVQSxcgeg-1
Received: by mail-ed1-f69.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so1997883edq.6
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 04:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPonLSLegWY2yDIWUSaNmyHJpo7rXY2SPNoqBYovTvs=;
 b=s9E6ZWnW9wrAEpFSoREDQVUbc90k1MuI/PRgjnbIQ/EU2mVpNiBLdwFyyAO/NAuSW5
 Wif8uEGNiPsK70SBeCv1kZwAzfrIBEwEx7+xY7RzUbYxAqoDzvKLp+lLaEri0qUHaGKE
 YuIzb6Se0NM0aURJZrRRp0ZPJYbBGjI+cZDle2iZ+wp16AYaBXPU+0WBfYu1YV67LQ2M
 hJTpG6AcgSitsnreoyCK8pnEa2748eV26OrEe+BAeKS9aYn6x4GCR+cUtMoa4e1+oBbQ
 TP9eGhrGyrZT9DA/Y+HHsQU3HV74wWCN/rPbo2BwjMdfPfnpBtPpdjUgAO5n61eA9ZeZ
 e//g==
X-Gm-Message-State: AOAM530QDSYDhLE1z9Sn/RqtJGbGtll4SuxiTqaRdDDoTxfUHP6ZB+Ks
 JNeIkosUj7wvMbgJ/whIMbwiUhw8Gfy5U4LJblyNpGG796VgMF1RRyUV0vnGZcSwWy5qDg6PBGK
 2ECbFRQEBXj/J
X-Received: by 2002:a17:906:2c09:: with SMTP id
 e9mr40515085ejh.410.1634126028722; 
 Wed, 13 Oct 2021 04:53:48 -0700 (PDT)
X-Received: by 2002:a17:906:2c09:: with SMTP id
 e9mr40515043ejh.410.1634126028428; 
 Wed, 13 Oct 2021 04:53:48 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b19sm4643084ejc.107.2021.10.13.04.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:53:48 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:53:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013135346.3a8f6c9a@redhat.com>
In-Reply-To: <20211013113544.4xrfagduw4nlbvou@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r+GgHkeFj98q

On Wed, 13 Oct 2021 13:35:44 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
> > On Wed, 13 Oct 2021 12:58:04 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> > > The following option is used to specify the distance map. It's
> > > possible the option isn't provided by user. In this case, the
> > > distance map isn't populated and exposed to platform. On the
> > > other hand, the empty NUMA node, where no memory resides, is
> > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > nodes, their corresponding device-tree nodes aren't populated,
> > > but their NUMA IDs should be included in the "/distance-map"
> > > device-tree node, so that kernel can probe them properly if
> > > device-tree is used.
> > > 
> > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > 
> > > This adds extra check after the machine is initialized, to
> > > ask for the distance map from user when empty nodes exist in
> > > device-tree.
> > > 
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > ---
> > >  hw/core/machine.c     |  4 ++++
> > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > >  include/sysemu/numa.h |  1 +
> > >  3 files changed, 29 insertions(+)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index b8d95eec32..c0765ad973 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > >      machine_class->init(machine);
> > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > +
> > > +    if (machine->numa_state) {
> > > +        numa_complete_validation(machine);
> > > +    }
> > >  }
> > >  
> > >  static NotifierList machine_init_done_notifiers =
> > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > index 510d096a88..7404b7dd38 100644
> > > --- a/hw/core/numa.c
> > > +++ b/hw/core/numa.c
> > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > >      }
> > >  }
> > >  
> > > +/*
> > > + * When device-tree is used by the machine, the empty node IDs should
> > > + * be included in the distance map. So we need provide pairs of distances
> > > + * in this case.
> > > + */
> > > +void numa_complete_validation(MachineState *ms)
> > > +{
> > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > +    int i;
> > > +
> > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {  
> > 
> > also skip check/limitation when VM is launched with ACPI enabled?  
> 
> Even with ACPI enabled we generate a DT and would like that DT to be as
> complete as possible. Of course we should generate a SLIT table with

Guest will work just fine without distance map as SRAT describes
all numa nodes.
You are forcing VM to have SLIT just for the sake of 'completeness'
that's practically unused.

I'm still unsure about pushing all of this in generic numa code,
as this will be used only by ARM for now. It's better to keep it
ARM specific, and when RISCV machine will start using this, it
could be moved to generic code.

> the distance information the user provides on the command line in order
> to satisfy the check, and we will, since we already have that code in
> place.


> 
> Thanks,
> drew
> 
> >   
> > > +        return;
> > > +    }
> > > +
> > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > +            error_report("Empty node %d found, please provide "
> > > +                         "distance map.", i);
> > > +            exit(EXIT_FAILURE);
> > > +        }
> > > +    }
> > > +}
> > > +
> > >  void parse_numa_opts(MachineState *ms)
> > >  {
> > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > index 4173ef2afa..80f25ab830 100644
> > > --- a/include/sysemu/numa.h
> > > +++ b/include/sysemu/numa.h
> > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > >                             Error **errp);
> > >  void numa_complete_configuration(MachineState *ms);
> > > +void numa_complete_validation(MachineState *ms);
> > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > >  extern QemuOptsList qemu_numa_opts;
> > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,  
> >   
> 

