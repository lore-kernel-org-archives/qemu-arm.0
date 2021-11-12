Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1697255lfk;
        Fri, 12 Nov 2021 05:28:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuvxdapa9hoLwQnvWW2e2IVYLacsprNE7BuGUndBXWscZMTE86VnLBVjPpwR4pT5MHSdwq
X-Received: by 2002:a9f:3d85:: with SMTP id c5mr22713645uai.12.1636723690674;
        Fri, 12 Nov 2021 05:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636723690; cv=none;
        d=google.com; s=arc-20160816;
        b=n2YW4IdOEZNflI2A9oHLikz5Eh7z8LQjNV60T7FdVfHtVOXKE3AhaS1gTenyX33wnp
         KQ7FjERrrUeDMv3S0Sc/tfOVPQgCEnePQp7oDZ4C5gMDjrSUQB7fPWLoNtULcqrDjcmO
         u7OGtnwRmwaihf29P9VF5O+7vT+wgOlw4nE7j7KhWZ1w7Jf5AEcNfTl+rJGCEBs45Q/T
         X7OGAJuBO/RCKsd65Adm8f9CMwmPtYhWQjUGTea1hC/kZ7D8fddSBFmATr8SBk/U7cq/
         IIvryOon/VriH43TqDGr3L9iyWTbhdjYw4s5kSeM4xBcH9k1zYEHM31+4glxKHtzgEX2
         3XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=dFzVPbMHKlplAqZ9XZ7dRJkRoxUC1hib/gV8XU6YgKs=;
        b=aGniK6OWSVpwUM/CLaH+5UsyW4FrCsC3SewyEG0xnPkwyv2nzXiRT9GwalQ3hkYGBs
         QnPyX8auSUqUNCEkmy4Ckjkhg9LScaHKke6H1hJ23I8uuGUAuWBuLFbnunqp1yNysVah
         S/HakeHfF6t7JcjnySDCqDnolPnQB4NDiAfj6Kq4x2dXP1dwBOfNBPGLw8YKbo12VUrF
         +JBo98CMf7HR5whmMmYSbBxkD1rziBi8JWbtxvGgSJOB2rXqsdC1qKxVEHwBUWV9TlRA
         NEXw4LKCrFjKN690NUTdNslnk4j3UVoEPhHpnj3dolIxAoEW06a5rvZtrrAcCGRaEuKo
         mpDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GWW4KmS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si13443783vsh.67.2021.11.12.05.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Nov 2021 05:28:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GWW4KmS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mlWbC-00042t-0l
	for alex.bennee@linaro.org; Fri, 12 Nov 2021 08:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlWb1-000411-OC
 for qemu-arm@nongnu.org; Fri, 12 Nov 2021 08:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlWaz-00010q-0l
 for qemu-arm@nongnu.org; Fri, 12 Nov 2021 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFzVPbMHKlplAqZ9XZ7dRJkRoxUC1hib/gV8XU6YgKs=;
 b=GWW4KmS5GLHtK1skBvOUOBnns+JJBg7wTyr5L61oGYPSO3B/dnze4eaZ8K2SSZjNu1vZcz
 Or5b5bDKZiUVDaqiH2BuvK4UdjmLYClZJdXtJ9v4PWcj44b3UD/ctfK1kMkjLsGEESnVpw
 nxeqTK6jMiEyOCcILKPlONgDMLFz1yQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-FQhyrnNdO8KT7r0edL9Lqg-1; Fri, 12 Nov 2021 08:27:55 -0500
X-MC-Unique: FQhyrnNdO8KT7r0edL9Lqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so8198223edl.17
 for <qemu-arm@nongnu.org>; Fri, 12 Nov 2021 05:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dFzVPbMHKlplAqZ9XZ7dRJkRoxUC1hib/gV8XU6YgKs=;
 b=5vKnZtA4tgw0omnQu6eh37XeVi2A7mhoQKFnl5GnLQysPO2420RAS5xhXmzi+JogMZ
 H7Lujl4XgUscJYXE4InLHjPfUwpa/AzWUT3GVWwj25MZW6moZqK1pvbUfPlvaXO8poyx
 L7svH/e06uACSdK5lNk4XojB31bhHE8w8qAnepxCuj7MQ0r3ugOu3Tp9bbfm23vWohXu
 uFW0un9bSRgV6exhctfNGHFt+Nkem7U3hEuHM4XXYFK9n/TFf4kQGnxZ2bJoc0u1WSGZ
 kpsphODow1vO/JbDiK4e9Jh0VLoKDTwLnMmPy0lblw4I+AcdnnqQlpPcIvA4hgDLW/Ts
 8xaw==
X-Gm-Message-State: AOAM533J0qeXknwtWzLSdvAhqghsQHbXVBLTeh/jr3kxi0oMlQXnqwb8
 IxtG/7/MgWyUXrMHRcFKSvV4kc1wGStMlOYyEfmRJzNoupyfV7bJlhXRqYdjd5oIZoBbntL+ckH
 vxnZjBZpAkP4g
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr18891889ejc.547.1636723673931; 
 Fri, 12 Nov 2021 05:27:53 -0800 (PST)
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr18891853ejc.547.1636723673651; 
 Fri, 12 Nov 2021 05:27:53 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id jg32sm2673956ejc.43.2021.11.12.05.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:27:52 -0800 (PST)
Date: Fri, 12 Nov 2021 14:27:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211112142751.4807ab50@redhat.com>
In-Reply-To: <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /yoy9g4rlv1u

On Wed, 10 Nov 2021 12:01:11 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 10.11.21 11:33, Igor Mammedov wrote:
> > On Fri, 5 Nov 2021 23:47:37 +1100
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> Hi Drew and Igor,
> >>
> >> On 11/2/21 6:39 PM, Andrew Jones wrote:  
> >>> On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:    
> >>>>
> >>>> Yeah, I agree. I don't have strong sense to expose these empty nodes
> >>>> for now. Please ignore the patch.
> >>>>    
> >>>
> >>> So were describing empty numa nodes on the command line ever a reasonable
> >>> thing to do? What happens on x86 machine types when describing empty numa
> >>> nodes? I'm starting to think that the solution all along was just to
> >>> error out when a numa node has memory size = 0...  
> > 
> > memory less nodes are fine as long as there is another type of device
> > that describes  a node (apic/gic/...).
> > But there is no way in spec to describe completely empty nodes,
> > and I dislike adding out of spec entries just to fake an empty node.
> >   
> 
> There are reasonable *upcoming* use cases for initially completely empty
> NUMA nodes with virtio-mem: being able to expose a dynamic amount of
> performance-differentiated memory to a VM. I don't know of any existing
> use cases that would require that as of now.
> 
> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
> this memory is exposed via cpu-less, special nodes. In contrast to real
> HW, the memory is hotplugged later (I don't think HW supports hotplug
> like that yet, but it might just be a matter of time).

I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
some by MEMORY entries. Or nodes created dynamically like with normal
hotplug memory.


> The same should be true when using DIMMs instead of virtio-mem in this
> example.
> 
> >   
> >> Sorry for the delay as I spent a few days looking into linux virtio-mem
> >> driver. I'm afraid we still need this patch for ARM64. I don't think x86  
> > 
> > does it behave the same way is using pc-dimm hotplug instead of virtio-mem?
> > 
> > CCing David
> > as it might be virtio-mem issue.  
> 
> Can someone share the details why it's a problem on arm64 but not on
> x86-64? I assume this really only applies when having a dedicated, empty
> node -- correct?
> 
> > 
> > PS:
> > maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
> > and describe it as PCI device (we don't do that yet if I'm no mistaken).  
> 
> virtio-mem exposes the PXM itself, and avoids exposing it memory via any
> kind of platform specific firmware maps. The PXM gets translated in the
> guest accordingly. For now there was no need to expose this in SRAT --
> the SRAT is really only used to expose the maximum possible PFN to the
> VM, just like it would have to be used to expose "this is a possible node".
> 
> Of course, we could use any other paravirtualized interface to expose
> both information. For example, on s390x, I'll have to introduce a new
> hypercall to query the "device memory region" to detect the maximum
> possible PFN, because existing interfaces don't allow for that. For now
> we're ruinning SRAT to expose "maximum possible PFN" simply because it's
> easy to re-use.
> 
> But I assume that hotplugging a DIMM to an empty node will have similar
> issues on arm64.
> 
> >   
> >> has this issue even though I didn't experiment on X86. For example, I
> >> have the following command lines. The hot added memory is put into node#0
> >> instead of node#2, which is wrong.  
> 
> I assume Linux will always fallback to node 0 if node X is not possible
> when translating the PXM.

I tested how x86 behaves, with pc-dimm, and it seems that
fc43 guest works only sometimes.
cmd:
  -numa node,memdev=mem,cpus=0 -numa node,cpus=1 -numa node -numa node

1: hotplug into the empty last node creates a new node dynamically 
2: hotplug into intermediate empty node (last-1) is broken, memory goes into the first node

We should check if it possible to fix guest instead of adding bogus SRAT entries.

