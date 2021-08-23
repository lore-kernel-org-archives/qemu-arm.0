Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2319382lfg;
        Mon, 23 Aug 2021 16:53:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHkcFgkM1BU83jBGEyYEM5EL0rtLKgEoBb/vVqYeDpG7factEvvWvq0Urxaum07X36Gsmi
X-Received: by 2002:a05:6e02:4c3:: with SMTP id f3mr24863252ils.248.1629762826545;
        Mon, 23 Aug 2021 16:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629762826; cv=none;
        d=google.com; s=arc-20160816;
        b=rpRaclS2La5nGq6V9c1xg41MpK6SYCuw2ngyP72SbpCyNt7pB2ob1PoBDa0+3fpmz0
         NNQ+mxPL8RzBC0ehXt0xI3eZ9xAUYCl2o7lJgteHiRIhCqSj19hrysM3x1XY3MgdN6w8
         3tS/ofH0VwohTK2Xf7wuXNtQ5j1ss5MMyJvTz9EZh2Szu/65kaUH22sT90dhXMaQglo+
         gMHLR9RsIxDWglJLwZD74SMyw169PdCdoObVJfP8JoaMqSPQeU2qOj21LcOrgIbz9AMG
         9SwbWLLBqwjniFl+RnI5HSs5YM1V5LQhYeCUuxamixt1rjQTFoEv6zvlngeS+ZvEbp1j
         QKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Ls7wLXVkbsTfriSqO6kewBziizvzO+5axJ/GPC3RXpE=;
        b=0MDQSCMgERIEaF9DCEhVyJeLq1/ElXqlxfKVwZg6HHMM3arSxc3xc0CFyefmRKSf7X
         IQ0gDnPRKy90ge11VDA+GdgrR+yIm/7+s24uXJ5E6QfXz3j43L0ZU9jcU0M27NLnSxLO
         3SUPLMq80pbbYLdpCRlJf1M4SLBxLTWX0/vpW1GWifN9t3LqgzhdKkoeGtuqwV6hHrrQ
         f5J3kKZ9BXn16Cn0lVguVri8ax66bmBzNU0F67Q1quEFnzjaJyqCBRYGOYLqf6aiuHci
         gB0Idn8bTPzHtL1ZOnp99YQfN6aePamoKb5wEXU47arYvmsB2oVedHO1IoLJy2M97zJ3
         DicA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VpRhyT7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si14905965jao.126.2021.08.23.16.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 16:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VpRhyT7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIJlB-0000r6-SD
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 19:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJkk-0000oV-4D
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 19:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJkh-0002PA-Qb
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 19:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629762795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls7wLXVkbsTfriSqO6kewBziizvzO+5axJ/GPC3RXpE=;
 b=VpRhyT7mjI5F8jAgQ0d0igzOqcVyCSK4gwledmpbZ8pPfzOD9yI7kdR/ZM1RfxUE38H+hO
 fxVldzY81bVSNm3Bj3xdKodzLvb8AiEt5au9JTNya/hf1Nxe4tiv2m+AHEyhkvgntFeLYs
 rQOhqOmpl6MpDHrcdjJ7cRwkf+VTKbY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ghHfRQ_qOEGG03g2jFvOtw-1; Mon, 23 Aug 2021 19:53:12 -0400
X-MC-Unique: ghHfRQ_qOEGG03g2jFvOtw-1
Received: by mail-ej1-f72.google.com with SMTP id
 g15-20020a170906c18f00b005c696624511so1383505ejz.3
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 16:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ls7wLXVkbsTfriSqO6kewBziizvzO+5axJ/GPC3RXpE=;
 b=jL1uvq4fcuqkW63e+GlidA9NZhqAytsGFyCbMXC5JjKYvxM5b2ABYlqNDeSi2I20Ug
 FZYnl7EbHqnBTTPEyNPOzXhY7J7FvNeCKsGil2sL6HFdhMU2RuedLE2z0bVo0Y3FB9oA
 8gMx8wHWLNemjTyiLsj9yg6NPv3ET9G/LBFFkqgG4DoLXgeeiRzBKBAfyrJjZsZSXWvR
 0o4G4THC6k8iKn5owWRLunLbLZEGsx/uvrtfH++07qc9CmxDgTGSEcOnHgYYx90a+WI6
 yrIjxewVmYQZ7JCOZ9gA6PXoe9ZpQnLGui8SBhjsJRhBVwkyuSAWTiUsgSqJaCQdBr+l
 xPQw==
X-Gm-Message-State: AOAM530T2LoAI/+HCID9JfE8LJhMFjH3FeMV1bfw4cDuK0frQavcAH4V
 IGVx6TIoDMTPU/08r3uKqxa/oW9Z/kdTOfALvqnw8yi6/2JMfPCy26Qn5gvmJXwVghsldcaHsYi
 ibg8P5bOm9JCf
X-Received: by 2002:a05:6402:1907:: with SMTP id
 e7mr12009696edz.201.1629762790988; 
 Mon, 23 Aug 2021 16:53:10 -0700 (PDT)
X-Received: by 2002:a05:6402:1907:: with SMTP id
 e7mr12009680edz.201.1629762790870; 
 Mon, 23 Aug 2021 16:53:10 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id q21sm8078367ejs.43.2021.08.23.16.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:53:10 -0700 (PDT)
Date: Mon, 23 Aug 2021 19:53:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v5 0/5] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210823195243-mutt-send-email-mst@kernel.org>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210805123921.62540-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tdvppSXFWJtc

On Thu, Aug 05, 2021 at 08:39:16PM +0800, Yanan Wang wrote:
> Hi,
> 
> This is a new version (v5) of the series [1] that I posted to introduce
> support for generating cpu topology descriptions to virt machine guest.
> 
> Once the view of an accurate virtual cpu topology is provided to guest,
> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> e.g., the scheduling performance improvement. See Dario Faggioli's
> research and the related performance tests in [2] for reference.
> 
> This patch series introduces cpu topology support for ARM platform.
> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> topology information. And we only describe the topology information
> to 6.2 and newer virt machines, considering compatibility.

ACPI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

pls merge through ARM tree.

> [1] https://lore.kernel.org/qemu-devel/20210622093413.13360-1-wangyanan55@huawei.com/
> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> -friend-or-foe-dario-faggioli-suse
> 
> Some tests:
> 1) -smp 16,sockets=2,cores=4,threads=2,maxcpus=16
> lscpu:
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              16
> On-line CPU(s) list: 0-15
> Thread(s) per core:  2
> Core(s) per socket:  4
> Socket(s):           2
> NUMA node(s):        1
> Vendor ID:           ARM
> Model:               2
> Model name:          Cortex-A72
> Stepping:            r0p2
> BogoMIPS:            100.00
> NUMA node0 CPU(s):   0-15
> 
> cat /sys/devices/system/cpu/present  -->  0-15
> cat /sys/devices/system/cpu/possible -->  0-15
> 
> 2) -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
> lscpu:
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  4
> Socket(s):           1
> NUMA node(s):        1
> Vendor ID:           ARM
> Model:               2
> Model name:          Cortex-A72
> Stepping:            r0p2
> BogoMIPS:            100.00
> NUMA node0 CPU(s):   0-7
> 
> cat /sys/devices/system/cpu/present  -->  0-7
> cat /sys/devices/system/cpu/possible -->  0-7
> 
> ---
> 
> Changelogs:
> 
> v4->v5:
> - drop the added -smp "expose=on|off" parameter and only describe topology
>   for 6.2 and newer machines
> - rebased the code on patch series [3] which has introduced some fix and
>   improvement for smp parsing
> - [3]: https://lore.kernel.org/qemu-devel/20210803080527.156556-1-wangyanan55@huawei.com/
> 
> v3->v4:
> - add new -smp parameter "expose=on|off" for users to enable/disable the feature
> - add stricter -smp cmdline parsing rules on "expose=on" case
> - move build_pptt to generic aml-build.c
> - add default cluster node in the cpu-map
> - rebase on top of latest upstream master
> - v3: https://lore.kernel.org/qemu-devel/20210516102900.28036-1-wangyanan55@huawei.com/
> 
> v2->v3:
> - address comments from David, Philippe, and Andrew. Thanks!
> - split some change into separate commits for ease of review
> - adjust parsing rules of virt_smp_parse to be more strict
>   (after discussion with Andrew)
> - adjust author credit for the patches
> 
> v1->v2:
> - Address Andrew Jones's comments
> - Address Michael S. Tsirkin's comments
> 
> ---
> 
> Andrew Jones (2):
>   hw/arm/virt: Add cpu-map to device tree
>   hw/acpi/aml-build: Generate PPTT table
> 
> Yanan Wang (3):
>   hw/arm/virt: Only describe cpu topology to guest since virt 6.2
>   device_tree: Add qemu_fdt_add_path
>   hw/acpi/aml-build: Add Processor hierarchy node structure
> 
>  hw/acpi/aml-build.c          | 76 ++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c     |  8 +++-
>  hw/arm/virt.c                | 62 ++++++++++++++++++++++++-----
>  include/hw/acpi/aml-build.h  |  7 ++++
>  include/hw/arm/virt.h        |  4 +-
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 44 ++++++++++++++++++++-
>  7 files changed, 188 insertions(+), 14 deletions(-)
> 
> -- 
> 2.19.1

