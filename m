Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp54685lfk;
        Wed, 10 Nov 2021 02:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwncbyNW0/Y+T8IEXMLbOGyc4UQubq+gh3lOAXbbUU2htu5M84aUQ8ecS77CC+9CkNmLojn
X-Received: by 2002:a67:ec94:: with SMTP id h20mr23114761vsp.59.1636540563727;
        Wed, 10 Nov 2021 02:36:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636540563; cv=none;
        d=google.com; s=arc-20160816;
        b=cfiO12gRLFBrRWz6J+BI2fPIvd765vLaFRk4PkDk50cW6CQusRqJkQSTIg/GYdHWmG
         HnPf2OEG19H/ZOICIxyb3laxLbSay6XdcxScpXEA9WTMaklY1lRFjH1WN+tTB8206Tly
         7TDd/1cib7CVREPfC1irRpmdszYXxZz9pF58r8gfM5K7fKSH1GUlkh3sEBiUMUhp4qZH
         lkM9+Yt6/2BJBHgK/KPaNZT7fLy8JF2wjyekBHfu24EU8UIRCukgho+pY/IGKtOVzt33
         1P+JkKAkKzgU3Bcf20AOr+NKfhqv8I2OK9LpBo799RPRTgTX7cNEqiZYVNx22fmSr6SI
         bpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=RsCjO7orokWZYdZBXF1bTpQG1pj+5G/t//QYJf4puyM=;
        b=Et2ErZ655i1auMmyGiU8aPscRkoO97NgBpvslcsXU6bMuSPIuQ7ruq3QTlC65KTHwU
         5V8Dx0Xz7nC6J8OYjpl8pHW5dfBMwRXixeeTe4FxO6CBduDr3RbERk33KfOh3dVe02iD
         dcP7mZp4VOjCDCN1FwDruh+YoUxDB0lf30I8tPKsrUSBAFMtZldWIfj/b0eKCWvkDBeV
         g3pxEWwtSG/6jeafSld3vSoUv4U0eSPhFPu+fQaBQT13TTqsteKMgT+xkr/1ZZ3CENdL
         dSMDCoQ0pI7QOoY6hiHV5MWxlf0nCwMW1KYTqjoM7ttRwxwrSARx+rIu9lAD+ETkpKYg
         IzMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NyjtHdfl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si40306288uav.156.2021.11.10.02.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Nov 2021 02:36:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NyjtHdfl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mkkxX-0005ff-2t
	for alex.bennee@linaro.org; Wed, 10 Nov 2021 05:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkkuu-00018P-2b
 for qemu-arm@nongnu.org; Wed, 10 Nov 2021 05:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkkul-0006XK-Ck
 for qemu-arm@nongnu.org; Wed, 10 Nov 2021 05:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636540390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsCjO7orokWZYdZBXF1bTpQG1pj+5G/t//QYJf4puyM=;
 b=NyjtHdflTXh3EOVK2IUYzjkvuBMTtardUKeSAbJT5zI5jruxoHkepHUHAWrAWZd9Kelyty
 Mjb4ZTh545UEPuRG+wsGfHGAfEl00ISAjYFwrbdY/lZflS5C0Zjk9lMmQOHd6EK7Mloskn
 ceB/BSIBnu5RmDm2Brn1JsXiDtzkCsg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-mZoUo5uyMdiBJlfJtmi0_g-1; Wed, 10 Nov 2021 05:33:07 -0500
X-MC-Unique: mZoUo5uyMdiBJlfJtmi0_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 x13-20020a05640226cd00b003e2bf805a02so1896101edd.23
 for <qemu-arm@nongnu.org>; Wed, 10 Nov 2021 02:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsCjO7orokWZYdZBXF1bTpQG1pj+5G/t//QYJf4puyM=;
 b=gD0WwClxqhxNJ/ZsyOANVvrdxYQXtZzdcsojqbYUdc/VkOnSGV96wxj6nHMvEWHVls
 qAE1DVJL3uKsJx8lVWLhrj1lJ5apPp6Pj72gzyLORtF1FlvYTMW+CEOsZFSgeLgXSLu8
 bCiuTnSDLXb/XEkjDOq6f23RT2VnzeIsHpthaw1iy9V7RsOk0JxGBl+ArFMuREdQaYUw
 OjS2HgoSNZpXoSSx9smWQCRO3hu+P5iYLcQMXiP9XUOw5iXAVJQEQ87ghHgZk6gLG1pX
 aC8WZeJUYfYfErbGGCGCW8ScXYX2WQdZqpy2B661k/E18HpsHBRibLwhONlBzGKumEao
 L2kw==
X-Gm-Message-State: AOAM531OU3AnkxWLfGAW6FscUatuIDwKgeqqEWeAjVDvXbf78qIrNqYc
 c4t6PkFpAupwGkRei1TMPE1iQsPc/O+G3klm70EZKa4IlGfSx5EYovsRKG9BfIrEaHFidirjPZJ
 EZSdEoG+a0Qj3
X-Received: by 2002:a17:906:58c9:: with SMTP id
 e9mr19061929ejs.181.1636540386550; 
 Wed, 10 Nov 2021 02:33:06 -0800 (PST)
X-Received: by 2002:a17:906:58c9:: with SMTP id
 e9mr19061884ejs.181.1636540386185; 
 Wed, 10 Nov 2021 02:33:06 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id ga1sm11436310ejc.100.2021.11.10.02.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:33:05 -0800 (PST)
Date: Wed, 10 Nov 2021 11:33:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211110113304.2d713d4a@redhat.com>
In-Reply-To: <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 ehabkost@redhat.com, David Hildenbrand <david@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXkSRUV78+pb

On Fri, 5 Nov 2021 23:47:37 +1100
Gavin Shan <gshan@redhat.com> wrote:

> Hi Drew and Igor,
> 
> On 11/2/21 6:39 PM, Andrew Jones wrote:
> > On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:  
> >>
> >> Yeah, I agree. I don't have strong sense to expose these empty nodes
> >> for now. Please ignore the patch.
> >>  
> > 
> > So were describing empty numa nodes on the command line ever a reasonable
> > thing to do? What happens on x86 machine types when describing empty numa
> > nodes? I'm starting to think that the solution all along was just to
> > error out when a numa node has memory size = 0...

memory less nodes are fine as long as there is another type of device
that describes  a node (apic/gic/...).
But there is no way in spec to describe completely empty nodes,
and I dislike adding out of spec entries just to fake an empty node.


> Sorry for the delay as I spent a few days looking into linux virtio-mem
> driver. I'm afraid we still need this patch for ARM64. I don't think x86

does it behave the same way is using pc-dimm hotplug instead of virtio-mem?

CCing David
as it might be virtio-mem issue.

PS:
maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
and describe it as PCI device (we don't do that yet if I'm no mistaken).

> has this issue even though I didn't experiment on X86. For example, I
> have the following command lines. The hot added memory is put into node#0
> instead of node#2, which is wrong.
> 
> There are several bitmaps tracking the node states in Linux kernel. One of
> them is @possible_map, which tracks the nodes available, but don't have to
> be online. @passible_map is sorted out from the following ACPI table.
> 
>    ACPI_SRAT_TYPE_MEMORY_AFFINITY
>    ACPI_SRAT_TYPE_GENERIC_AFFINITY
>    ACPI_SIG_SLIT                          # if it exists when optional distance map
>                                           # is provided on QEMU side.
> 
> Note: Drew might ask why we have node#2 in "/sys/devices/system/node" again.
> hw/arm/virt-acpi-build.c::build_srat() creates additional node in ACPI SRAT
> table and the node's PXM is 3 ((ms->numa_state->num_nodes - 1)) in this case,
> but linux kernel assigns node#2 to it.
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=512M            \
>    -object memory-backend-ram,id=mem1,size=512M            \
>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>    -numa node,nodeid=2 -numa node,nodeid=3                 \
>    -object memory-backend-ram,id=vmem0,size=512M           \
>    -device virtio-mem-pci,id=vm0,memdev=vmem0,node=2,requested-size=0 \
>    -object memory-backend-ram,id=vmem1,size=512M           \
>    -device virtio-mem-pci,id=vm1,memdev=vmem1,node=3,requested-size=0
>       :
>    # ls  /sys/devices/system/node | grep node
>    node0
>    node1
>    node2
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1003104 kB
>    # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
>    Node 0 MemTotal: 524288 kB
> 
>    (qemu) qom-set vm0 requested-size 512M
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1527392 kB
>    # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
>    Node 0 MemTotal: 1013652 kB
> 
> Try above test after the patch is applied. The hot added memory is
> put into node#2 correctly as the user expected.
> 
>    # ls  /sys/devices/system/node | grep node
>    node0
>    node1
>    node2
>    node3
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1003100 kB
>    # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
>    Node 2 MemTotal: 0 kB
> 
>    (qemu) qom-set vm0 requested-size 512M
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1527388 kB
>    # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
>    Node 2 MemTotal: 524288 kB
> 
> Thanks,
> Gavin
> 
> 
>    
> 

