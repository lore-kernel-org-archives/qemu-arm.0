Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2792335lfg;
        Tue, 22 Jun 2021 00:14:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrc5Xa6WSqRMJBx1i2R8RmeAp+4rVN9M1f+vsn7JCZDetpFx4fPunDKvMgSPNOLeOm0zSm
X-Received: by 2002:a9f:35e9:: with SMTP id u38mr1997862uad.131.1624346058704;
        Tue, 22 Jun 2021 00:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624346058; cv=none;
        d=google.com; s=arc-20160816;
        b=y4iL3wi/teLxgIQkbsKWTmITBsZqL5C+R6jWGSDZ5Pr8XejSCPJTs6Y39Pv2Xu7+26
         ebiGJ1l9Il0jr06x+YnJEDYrrZ23wC/UmlGmFu5j5keP6U2yHMYtbd6Llvo6jf6ODQ0T
         1by/XIV54TN2zi1AO/exQz1EXzNNpWEsCm1jEjmsB8bBLy7WrrnsIMzqusGaxCYJz+NQ
         1kk/qCdID+fZYZQzmr+POJ0R9+nzYAYFBVt//F9H6dJeKKlZO6bYh2vqSFBG0uM8uSUj
         3qSOLA6HPh8DfbFoTtaIFeBzopPaM3yyMgaYS643q8aSH6XWHJzsgSNxCDPjv10IMWFn
         t1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=3qrirkiEA2oZJUGUmrQ/3uUaqNn+95O+awrLVh9USrU=;
        b=iuF7aLaxRQOQmg8B+gSOYSHamKYqc4khSZCM9me8uloxee6iJ2ZCGW2DyekjZ/2p6f
         eGv4mzsyjssloX9/da/38VPbWGqCWzE7xkNTavHNQYRHkxZmeLD1f3T9b/L3+N/8kBnE
         EA7QaGIxklhdTC0qzf/2SDsvPTJJ4aVrBB1T7U8KDUQlWFUBKkqh52uTbliMuFz29ldt
         cm6OjkVsxi+2l2u4VUmGrXVK93nH9Sm/d0v8H0BHW6Q3s8lo7hCvlGoE0vGg/bTHAvlv
         oAia5wizcrJk/TdRV+tqW0DyhZbew5KQ/55itStb8ESq69ercU5DwQUugdC5d4aFxwh4
         3qtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F0UaWhlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si11633104vsq.20.2021.06.22.00.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 00:14:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F0UaWhlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvaby-0003DY-1H
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 03:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvabi-0003Ci-6g
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 03:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvabc-00028U-1i
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 03:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624346034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qrirkiEA2oZJUGUmrQ/3uUaqNn+95O+awrLVh9USrU=;
 b=F0UaWhlJw7IPcwjurR8WuOpzvNl1vEvvFW0B4LfEo+qeNixWwxxcX6VaTb8kKmnvFH/w6r
 ZAtZn3lAaoyrsczsXhYJQDWWvrB3sUOdr34tiCbVEKyrR9/h1ttIuAavD9doWIgG92VMIz
 UaLHB4w87QeCgZpziQ/PL/oDKXlJCjY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-gYdeV5McMFyP0neMXm9yYw-1; Tue, 22 Jun 2021 03:13:53 -0400
X-MC-Unique: gYdeV5McMFyP0neMXm9yYw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so9015899edt.23
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3qrirkiEA2oZJUGUmrQ/3uUaqNn+95O+awrLVh9USrU=;
 b=heFPHiuhMaVvhEA7teNSePNo4NAQDmoGOMFCQK79fvAXfWXTiLVFvHkU3zRf6hiqhA
 Y3RnZFRJokvhW8nkhkiGBvrhdZ1Nt7SQNDa/4D8NbEmy+TfeLqipci5QFzBPmrENAHzn
 chePNrKVeLYNfWCas0HsBubwT0tHugtKPVtM+GlWgnNAB5hfjLTAQ1KCIGWWGQeyhqkb
 CDSQwTp5VvSkHfj0Ji3ul5WnZVecZE0fuOwB4j2tb+XYmUzkGi9FsMkowsFBIr/9ZLRi
 RfSymOQ7hFQfieYGTT/ed3tBfaZsN0nMtf2CNA85WA776+vg83/DM+n8OgUtJjjAh/gG
 bUHA==
X-Gm-Message-State: AOAM532RbK27CJVrI2voYhuJ47g0ZjqrLk3B6SpEB6nC1NUHDJqBMkij
 BElgoT0MrlFeI8LdFkOF8C4Kj9jnRXq3gBJZEVKdm8B1N33W+wSmlvhCmimnf5DEltPEv0mrrOs
 RH30HwbT7KWGU
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr2394398ejf.360.1624346032437; 
 Tue, 22 Jun 2021 00:13:52 -0700 (PDT)
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr2394362ejf.360.1624346032074; 
 Tue, 22 Jun 2021 00:13:52 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b8sm1100013edr.42.2021.06.22.00.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 00:13:51 -0700 (PDT)
Date: Tue, 22 Jun 2021 09:13:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210622071349.ibni4btfjrb2v2p2@gator>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
 <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8PkD0PvVt0M

On Tue, Jun 22, 2021 at 06:53:41PM +1000, Gavin Shan wrote:
> Hi Drew,
> 
> On 6/3/21 2:48 PM, Gavin Shan wrote:
> > On 6/2/21 9:36 PM, Andrew Jones wrote:
> > > On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
> > > > On 6/1/21 5:50 PM, Andrew Jones wrote:
> > > > > On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> > > > > > We possibly populate empty nodes where memory isn't included and might
> > > > > > be hot added at late time. The FDT memory nodes can't be created due
> > > > > > to conflicts on their names if multiple empty nodes are specified.
> > > > > > For example, the VM fails to start with the following error messages.
> > > > > > 
> > > > > >     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
> > > > > >     -accel kvm -machine virt,gic-version=host                        \
> > > > > >     -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
> > > > > >     -object memory-backend-ram,id=mem0,size=512M                     \
> > > > > >     -object memory-backend-ram,id=mem1,size=512M                     \
> > > > > >     -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
> > > > > >     -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
> > > > > >     -numa node,nodeid=2                                              \
> > > > > >     -numa node,nodeid=3                                              \
> > > > > >       :
> > > > > >     -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> > > > > > 
> > > > > >     qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
> > > > > >                          FDT_ERR_EXISTS
> > > > > > 
> > > > > > This fixes the issue by using NUMA node ID or zero in the memory node
> > > > > > name to avoid the conflicting memory node names. With this applied, the
> > > > > > VM can boot successfully with above command lines.
> > > > > > 
> > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > ---
> > > > > >    hw/arm/boot.c | 7 ++++++-
> > > > > >    1 file changed, 6 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > > > > index d7b059225e..3169bdf595 100644
> > > > > > --- a/hw/arm/boot.c
> > > > > > +++ b/hw/arm/boot.c
> > > > > > @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> > > > > >        char *nodename;
> > > > > >        int ret;
> > > > > > -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> > > > > > +    if (numa_node_id >= 0) {
> > > > > > +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> > > > > > +    } else {
> > > > > > +        nodename = g_strdup("/memory@0");
> > > > > > +    }
> > > > > > +
> > > > > >        qemu_fdt_add_subnode(fdt, nodename);
> > > > > >        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > > > > >        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> 
> [...]
> 
> > 
> > I've sent one separate mail to check with Rob Herring. Hopefully he have
> > ideas as he is maintaining linux FDT subsystem. You have been included to
> > that thread. I didn't find something meaningful to this thread after doing
> > some google search either.
> > 
> > Yes, I agree with you we need to follow the specification strictly. It seems
> > it's uncertain about the 'physical memory map' bus binding requirements.
> > 
> 
> I didn't get expected answers from device-tree experts.

What response did you get? Can you please provide a link to the discussion?

> After rethinking about it,
> I plan to fix this like this way, but please let me know if it sounds sensible
> to you.
> 
> The idea is to assign a (not overlapped) dummy base address to each memory
> node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
> The 'length' of the 'reg' property in the device-tree nodes, corresponding
> to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
> until memory is added to these nodes.
> 
> I had the temporary patch for the implementation. It works fine and VM can
> boot up successfully.

I would like to be sure that the kernel developers for NUMA, memory
hotplug, and devicetree specifications are all happy with the approach
before adding it to QEMU.

Thanks,
drew

