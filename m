Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2857037lfc;
        Wed, 13 Oct 2021 05:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiLmyREiMzKU6cFB4n1Ib9UXlCinUUDV1iYGHd4z3e6T/evhH3VPhoE9Dl89TdsLA4ulI6
X-Received: by 2002:ab0:3d09:: with SMTP id f9mr29946383uax.135.1634127135836;
        Wed, 13 Oct 2021 05:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634127135; cv=none;
        d=google.com; s=arc-20160816;
        b=yRVPks1+TQb2I+eobGNWtNowdaOCSS9r5ZurAmV44vtUufonpZojqg9i0Ur3ekYkB+
         TaGI9/JAV7DQtkg4J81qYQVLtJ+VQefHX/WsAtT4cfNFDBtdcZLMvqEAx83Cj+vCim3e
         d/m4lG7IZykrtYjvKWGdSN9vMDAEuBOOb3aPQ6yWtXff+63MWXXpzd39nkEX6YVPNS3g
         mq1OTza/TEKNTxGrCVssqx149ZotTW5hLRw3OGGv7HfF5ttQiUIpuQabo4XZtgS9JqMX
         /4P4IArS67hiBDLgIgG0Vp/Scup2WHK1jD7K8KZTOXo2zVa/fulla6He/WaJVgwEa8t+
         t+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LGBooBiqsuYNIVZk11aTiZsz9nEbFDMkAIpgLwYhQp0=;
        b=g5BeHdH8p1CiYQE4+4p/kb2CC1oB9q5VV/ThHO9e2coxarKIb81ei3rRkZtTqDI+nh
         x7DLiYnjBW9QNUgCaN4tKgeplqwERrMCXM8KgAHhCgUilZHNSaxBXfjauAWLTVBgORXv
         mrAEuLaEnt7Zr9XM2sg3UtlvcKyT/cZzmP3IIgiJUXDaDb4Y/G4vdW6sSxHuAMB8UDl9
         9UylVUPeCyFdhhYIthu2xROiN/l7hotsDNci6WkbLwNT3n/UF5+koLmHiSvt7axAljbj
         hFo/PWT8Rn9H+0ZVny8nLjDWua8cbFNUPUQ3XEEjc6HJH2RLKdzZNj6lNJy0ZK0cTyjX
         J1vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UZ7A791C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si6028140vkn.91.2021.10.13.05.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 05:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UZ7A791C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mad7H-00006b-3V
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 08:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mad6j-0008Uo-RK
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 08:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mad6f-0004ub-Mf
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 08:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LGBooBiqsuYNIVZk11aTiZsz9nEbFDMkAIpgLwYhQp0=;
 b=UZ7A791CbaZfre6xbziUwakwAXpDhWfLW0r5ppeV4Nt3sbHHt6xYvRtuou2jYSSO77+Rdz
 ncmGRWzKkG1WjjNWKU1B00DBOYtitKixkq/KbvWIexaJ+EtDciHa52EtjwefvipMnTh+FG
 e/jBg/Aw9deQKjKHnyESSNmPaRteaBw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43--3Zl06DKOCm5cM39PndCeQ-1; Wed, 13 Oct 2021 08:11:35 -0400
X-MC-Unique: -3Zl06DKOCm5cM39PndCeQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z23-20020aa7cf97000000b003db7be405e1so2024181edx.13
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 05:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LGBooBiqsuYNIVZk11aTiZsz9nEbFDMkAIpgLwYhQp0=;
 b=ca1JXVOS2xwRqwwEmQIbCpR5UVBP0CMC1iyK0sFRjR7AksUUWl09cRx47WOsN+IO2U
 j3uT4zYpV9ReHjKgfPWJxaauII3RSjvHhCzsUFcjsv98xUSobuQ1LeBVjtgKaSzf0RC5
 TVPwaxfPPKSiPhBmUHJ6cHtaZO2bdhYzTPKVqHu5oT65mYSFtee+ChxXfO+nLCDjoG4S
 A0xf//ZYLEYOxjNwtMODmWNQZRbgtUD6ethu2TQPNV+lvPwPLFf1i4HvPQ/Au0FAIvAF
 wWyHB7X/B1l6dhGrOnRIy8nSrkUTJdy3WhWWOY6NTEb/Rx4ziyhjqEw8mwKrGw/nMgX1
 gPiw==
X-Gm-Message-State: AOAM533OI03udsQHqL/1uyuJWvLwF99kuMJTXfxYZ8OaXOqp5+6vBuv0
 bh5XvqVsWmkVh5iuPLh3u++x6kIc+0/VNUp2yYJuWVPVnGiZw9pVOjJhC8x3xwOCAVq27866CFr
 y36MydoMeEmpN
X-Received: by 2002:a17:907:98f9:: with SMTP id
 ke25mr40797060ejc.381.1634127093775; 
 Wed, 13 Oct 2021 05:11:33 -0700 (PDT)
X-Received: by 2002:a17:907:98f9:: with SMTP id
 ke25mr40796998ejc.381.1634127093393; 
 Wed, 13 Oct 2021 05:11:33 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id q14sm6501211eji.63.2021.10.13.05.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:11:32 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:11:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013121125.sdewyrxcipsi3o22@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211013135346.3a8f6c9a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZnQH2sCZNBEe

On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:
> On Wed, 13 Oct 2021 13:35:44 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
> > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > Gavin Shan <gshan@redhat.com> wrote:
> > >   
> > > > The following option is used to specify the distance map. It's
> > > > possible the option isn't provided by user. In this case, the
> > > > distance map isn't populated and exposed to platform. On the
> > > > other hand, the empty NUMA node, where no memory resides, is
> > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > but their NUMA IDs should be included in the "/distance-map"
> > > > device-tree node, so that kernel can probe them properly if
> > > > device-tree is used.
> > > > 
> > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > 
> > > > This adds extra check after the machine is initialized, to
> > > > ask for the distance map from user when empty nodes exist in
> > > > device-tree.
> > > > 
> > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > ---
> > > >  hw/core/machine.c     |  4 ++++
> > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > >  include/sysemu/numa.h |  1 +
> > > >  3 files changed, 29 insertions(+)
> > > > 
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index b8d95eec32..c0765ad973 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > >      machine_class->init(machine);
> > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > +
> > > > +    if (machine->numa_state) {
> > > > +        numa_complete_validation(machine);
> > > > +    }
> > > >  }
> > > >  
> > > >  static NotifierList machine_init_done_notifiers =
> > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > index 510d096a88..7404b7dd38 100644
> > > > --- a/hw/core/numa.c
> > > > +++ b/hw/core/numa.c
> > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > >      }
> > > >  }
> > > >  
> > > > +/*
> > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > + * be included in the distance map. So we need provide pairs of distances
> > > > + * in this case.
> > > > + */
> > > > +void numa_complete_validation(MachineState *ms)
> > > > +{
> > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > +    int i;
> > > > +
> > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {  
> > > 
> > > also skip check/limitation when VM is launched with ACPI enabled?  
> > 
> > Even with ACPI enabled we generate a DT and would like that DT to be as
> > complete as possible. Of course we should generate a SLIT table with
> 
> Guest will work just fine without distance map as SRAT describes
> all numa nodes.
> You are forcing VM to have SLIT just for the sake of 'completeness'
> that's practically unused.
> 
> I'm still unsure about pushing all of this in generic numa code,
> as this will be used only by ARM for now. It's better to keep it
> ARM specific, and when RISCV machine will start using this, it
> could be moved to generic code.

I don't see a problem in providing this DT node / ACPI table to guests
with empty NUMA nodes. I don't even see a problem with providing the
distance information unconditionally. Can you explain why we should
prefer not to provide optional HW descriptions?

Thanks,
drew 

> 
> > the distance information the user provides on the command line in order
> > to satisfy the check, and we will, since we already have that code in
> > place.
> 
> 
> > 
> > Thanks,
> > drew
> > 
> > >   
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > +            error_report("Empty node %d found, please provide "
> > > > +                         "distance map.", i);
> > > > +            exit(EXIT_FAILURE);
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > >  void parse_numa_opts(MachineState *ms)
> > > >  {
> > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > index 4173ef2afa..80f25ab830 100644
> > > > --- a/include/sysemu/numa.h
> > > > +++ b/include/sysemu/numa.h
> > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > >                             Error **errp);
> > > >  void numa_complete_configuration(MachineState *ms);
> > > > +void numa_complete_validation(MachineState *ms);
> > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > >  extern QemuOptsList qemu_numa_opts;
> > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,  
> > >   
> > 
> 

