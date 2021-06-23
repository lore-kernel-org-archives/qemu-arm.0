Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3836868lfg;
        Wed, 23 Jun 2021 01:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEYZDtO8nuL65cis7aCIhCyhddUz0+sv5zKC1IT0Ff9EMJ8+1oVj/95gfm/qGICZqxwkyu
X-Received: by 2002:ab0:5962:: with SMTP id o31mr3207902uad.89.1624435674988;
        Wed, 23 Jun 2021 01:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624435674; cv=none;
        d=google.com; s=arc-20160816;
        b=XtqUjToX/qX8ePFzHd7PcKB28gESDIySU6pGvQflH0cNssCTgwTCgnvs6Hot3vSgme
         7n7cGHyBJm84Nl3nIaI+/8HHUu0qYa6xGNYgqP7xQEGwjTT6QDj9cKKVKaQSaWoOuZ+q
         G4n20Zfrm4mLFX5oAEuZFFjfF7Vr4/yzDnMCcYALb0mCwuPjI52XxFUM3sWNe+CKkW/K
         IJvEHAPc5zoRBMOYnk1vZhOPJwsIXwTvHjJx+3rlvexkj0SILvFmY7H36jMDzNwZ2yRn
         HR4uR8TVzHKUa8N7H9yelstO4lqRD68m2Qx0eh/qG/4sCvkpthuHBflMStkhLAoSoH7Y
         Nciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=8G41tRoWTjyKvFTmOfj1s/Jr5mAId1Kv09Nm3mxHcMM=;
        b=MXAmKkd63ek5m0CxMqV6lYZyEBAJKKJyPZP0froqpiOIkt6+zk4KdKCbkVgNteoSJH
         fJlwuJBqsuLfvir7XPKCtb/c2Nat6mRfmU+3rgbZix7xncjtWnizS1Y5amsoIkZQfkQq
         KJ2jCr/gGfGnNystu0HdGYz+jkhHqeJfiK7iAjOmplHoptPHs8RgkIRZ0ZeFNMwkzf1R
         iOz4isVSxv7qVElplqfR2Z6BAuW2fNLFAbyo7ujZtpsfiR+LR/2Hv8KNO4kTjPuFZ8qT
         qlmFydxGaUXAPwvsRnutCRq/99jVVpM0pwgGTQC3T0YVb53mAk+sSi9LzQCP9CPQru7v
         3ZdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VkXpQ4yO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si1667551vsj.57.2021.06.23.01.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jun 2021 01:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VkXpQ4yO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvxvO-00066s-9x
	for alex.bennee@linaro.org; Wed, 23 Jun 2021 04:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvxvH-00066c-Ln
 for qemu-arm@nongnu.org; Wed, 23 Jun 2021 04:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvxvE-0002Jj-8S
 for qemu-arm@nongnu.org; Wed, 23 Jun 2021 04:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624435662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8G41tRoWTjyKvFTmOfj1s/Jr5mAId1Kv09Nm3mxHcMM=;
 b=VkXpQ4yOjAIll+3Od0JPBgNC+OH2Cge6An9LuTkMH9QkDFNyc4Pd75s5jVLKNeInqAOwjL
 Cg3Hw1ugCN/otwslx3ykVsubitMeJiN/3d7Km/Ga10N8//VpoYhSCZ0TIJ6NcPk9rLhAur
 Mh98reK+F3czWwyezcnGsbq+sXnVHEQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-eS3ul_KvN160Ug_LrzRAIg-1; Wed, 23 Jun 2021 04:07:39 -0400
X-MC-Unique: eS3ul_KvN160Ug_LrzRAIg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso871093edd.5
 for <qemu-arm@nongnu.org>; Wed, 23 Jun 2021 01:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8G41tRoWTjyKvFTmOfj1s/Jr5mAId1Kv09Nm3mxHcMM=;
 b=PtWBGoVy7+omvSUdJP2K+lR6t1AgVhKPYUogNv8Az3jgnYPPeZNkGrBj4ZF118S/BE
 4l/ZjoY+cz7fWOlzVZMU9INsYr+ozfSsmMStpWy8+9I8dSSRROxk1lpGRMPiPifxF3By
 oFOlGkvopWDDTzhFqc8ghdoPf8YEvfsFcj5U7mKY0RIgaoQ9eskJKIJoIc/+No/7QdD8
 H72l+iA/FW7NKxyDLQNbrkDbchA0uMX6VQMjAeMRr22FglcYHJ6Irai2F3HVLrNxXy1H
 yB7ZEdpTDZfyFMTs+KwAAZZnqt/zwv9c/5wIiUWPXeO/SGaZjMKoDA1i0q5R/Y6TYnB8
 6pJA==
X-Gm-Message-State: AOAM531xs0Bn0GKhV1DyqUcWv3ua2VP2vy4xJgqvEeOiz+rEVWZuwROY
 JPaFUldfebjUaGYB6b61yT62c5nVMCdd3xDvMgl8rDIG5ZpUvowKQyggeJ7Dv+Pza8uUnwoTSTO
 HMYW3QSs9SIrh
X-Received: by 2002:a17:906:2dc2:: with SMTP id
 h2mr8539041eji.479.1624435658654; 
 Wed, 23 Jun 2021 01:07:38 -0700 (PDT)
X-Received: by 2002:a17:906:2dc2:: with SMTP id
 h2mr8539026eji.479.1624435658421; 
 Wed, 23 Jun 2021 01:07:38 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v5sm1308832edt.55.2021.06.23.01.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 01:07:38 -0700 (PDT)
Date: Wed, 23 Jun 2021 10:07:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210623080736.ds6pptd7bogrxy4j@gator.home>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
 <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
 <20210622071349.ibni4btfjrb2v2p2@gator>
 <707a90ca-4a12-5813-4834-6ed5c77200b5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <707a90ca-4a12-5813-4834-6ed5c77200b5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jz3kuPTEq7/p

On Wed, Jun 23, 2021 at 02:43:49PM +1000, Gavin Shan wrote:
> Hi Drew,
> 
> On 6/22/21 5:13 PM, Andrew Jones wrote:
> > On Tue, Jun 22, 2021 at 06:53:41PM +1000, Gavin Shan wrote:
> > > On 6/3/21 2:48 PM, Gavin Shan wrote:
> > > > On 6/2/21 9:36 PM, Andrew Jones wrote:
> > > > > On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
> > > > > > On 6/1/21 5:50 PM, Andrew Jones wrote:
> > > > > > > On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> > > > > > > > We possibly populate empty nodes where memory isn't included and might
> > > > > > > > be hot added at late time. The FDT memory nodes can't be created due
> > > > > > > > to conflicts on their names if multiple empty nodes are specified.
> > > > > > > > For example, the VM fails to start with the following error messages.
> > > > > > > > 
> > > > > > > >      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
> > > > > > > >      -accel kvm -machine virt,gic-version=host                        \
> > > > > > > >      -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
> > > > > > > >      -object memory-backend-ram,id=mem0,size=512M                     \
> > > > > > > >      -object memory-backend-ram,id=mem1,size=512M                     \
> > > > > > > >      -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
> > > > > > > >      -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
> > > > > > > >      -numa node,nodeid=2                                              \
> > > > > > > >      -numa node,nodeid=3                                              \
> > > > > > > >        :
> > > > > > > >      -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> > > > > > > > 
> > > > > > > >      qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
> > > > > > > >                           FDT_ERR_EXISTS
> > > > > > > > 
> > > > > > > > This fixes the issue by using NUMA node ID or zero in the memory node
> > > > > > > > name to avoid the conflicting memory node names. With this applied, the
> > > > > > > > VM can boot successfully with above command lines.
> > > > > > > > 
> > > > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > > > ---
> > > > > > > >     hw/arm/boot.c | 7 ++++++-
> > > > > > > >     1 file changed, 6 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > > > > > > index d7b059225e..3169bdf595 100644
> > > > > > > > --- a/hw/arm/boot.c
> > > > > > > > +++ b/hw/arm/boot.c
> > > > > > > > @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> > > > > > > >         char *nodename;
> > > > > > > >         int ret;
> > > > > > > > -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> > > > > > > > +    if (numa_node_id >= 0) {
> > > > > > > > +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> > > > > > > > +    } else {
> > > > > > > > +        nodename = g_strdup("/memory@0");
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > >         qemu_fdt_add_subnode(fdt, nodename);
> > > > > > > >         qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > > > > > > >         ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> > > 
> > > [...]
> > > 
> > > > 
> > > > I've sent one separate mail to check with Rob Herring. Hopefully he have
> > > > ideas as he is maintaining linux FDT subsystem. You have been included to
> > > > that thread. I didn't find something meaningful to this thread after doing
> > > > some google search either.
> > > > 
> > > > Yes, I agree with you we need to follow the specification strictly. It seems
> > > > it's uncertain about the 'physical memory map' bus binding requirements.
> > > > 
> > > 
> > > I didn't get expected answers from device-tree experts.
> > 
> > What response did you get? Can you please provide a link to the discussion?
> > 
> 
> Sorry about the confusion. I meant "no response" by "expected answers". Here
> is the mail sent to Rob before, no reply so far:
> 
> https://lkml.org/lkml/2021/6/2/1446
> 
> > > After rethinking about it,
> > > I plan to fix this like this way, but please let me know if it sounds sensible
> > > to you.
> > > 
> > > The idea is to assign a (not overlapped) dummy base address to each memory
> > > node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
> > > The 'length' of the 'reg' property in the device-tree nodes, corresponding
> > > to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
> > > until memory is added to these nodes.

Since we don't know of any other established way to do this, then
proposing a solution makes sense. However, QEMU isn't the place to put it
first. Please write a Documentation/devicetree/bindings/ document and post
the patch to the kernel. If it gets accepted, then we can implement what
you've documented there.

Hopefully you'll get more interest and activity on your patch than on your
inquiry.

Thanks,
drew

> > > 
> > > I had the temporary patch for the implementation. It works fine and VM can
> > > boot up successfully.
> > 
> > I would like to be sure that the kernel developers for NUMA, memory
> > hotplug, and devicetree specifications are all happy with the approach
> > before adding it to QEMU.
> > 
> 
> As I understood, it won't break anything from perspectives of NUMA
> and device-tree specification. First of all, NUMA cares the so-called
> distance map and 'numa-node-id' property in the individual device-tree
> nodes. The device-tree specification doesn't say 'length' in 'reg'
> property of memory node can't be zero. Also, the linux device-tree
> implementation has the check on 'length', the memory block won't be
> added if it's zero.
> 
> Documentation/devicetree/bindings/numa.txt has more details about
> the required device-tree NUMA properties.
> 
> I'm not sure about memory hotplug. I tried memory hot add and it seems
> working finely. Memory hot-add/remove are working without issues:
> 
> /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
> -accel kvm -machine virt,gic-version=host               \
> -cpu host -smp 4,sockets=2,cores=2,threads=1            \
> -m 4096M,slots=16,maxmem=64G                            \
> -object memory-backend-ram,id=mem0,size=2048M           \
> -object memory-backend-ram,id=mem1,size=2048M           \
> -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
> -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
> -numa node,nodeid=2                                     \
> -numa node,nodeid=3
>    :
> 
> Memory hot-add
> ===============
> 
> # cat /proc/meminfo  | grep MemTotal
> MemTotal:        4027472 kB
> # cat /sys/devices/system/node/node2/meminfo | grep MemTotal
> Node 2 MemTotal:       0 kB
> 
> (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
> (qemu) device_add pc-dimm,id=dimm0,memdev=hp-mem0,node=3
> 
> # cat /proc/meminfo  | grep MemTotal
> MemTotal:        5076048 kB
> # cat /sys/devices/system/node/node2/meminfo | grep MemTotal
> Node 2 MemTotal: 1048576 kB
> 
> Memory hot-remove
> =================
> 
> (qemu) device_del dimm0
> (qemu) object_del hp-mem0
> 
> # cat /proc/meminfo  | grep MemTotal
> MemTotal:        4027472 kB
> # cat /sys/devices/system/node/node2/meminfo | grep MemTotal
> cat: can't open '/sys/devices/system/node/node2/meminfo': No such file or directory
> 
> After this point, the memory can be added again without issues with
> "object_add" and "device_add". So it sounds reasonable to remove
> the empty NUMA node during memory hot-remove.
> 
> Thanks,
> Gavin
> 

