Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1080860njh;
        Fri, 30 May 2025 04:56:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8B48Eyj7jq6hfHnaYWm3+AF76Il4C9q0uxzFSxMOw40KGlGqnwdUcFlrtZ8y3rcwVvxPefniGXIIqtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF/88DJqURt7SAsdYe8BHQkuQV8rNpCJvDewFKufYHCemhNKK+v4fTVrCL/Q3nDw2Xxf18z
X-Received: by 2002:a05:620a:2904:b0:7d0:a0e5:87cd with SMTP id af79cd13be357-7d0a1f912e9mr499942285a.4.1748606214463;
        Fri, 30 May 2025 04:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748606214; cv=none;
        d=google.com; s=arc-20240605;
        b=XW+IkX50JDKgxQHs5hzMKaW5Q9wUsPpWm38VquhyMVe2E0X94h+3KYg4vpvKMR483h
         EvgiL9srlqF6ORgnJ36sd+PCMo7M0s1y9BCB9xLBpHZ7gRVQCt7pS3JvcmO2v/YodWc0
         3IxCsHLVQebYZ2LO96bItx9zM26MFY2swFISAMu1NktE8auWgUCJHlv3j9RCE+UZOGTr
         /HK3UUnCejrA+oRNAYECa6nfP5b9VWrDwb+QEDSM+PcdHNT0VygcnlDvXqeVK4IOvDXR
         fLVtk6lTrexZ3YcwE6KidxIiw9yrtCdRsDko5eudm6V682Q3M1ZLxxR+0xt1G2lty4FP
         wJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=VD3BjY4GHQ+mCSGlGp19ZvgTUZkqt5lpUczzmNa1moI=;
        fh=VYZkxfwQAMzb/CSJ/q3PKpNlkLl7bqBZpSI4PCsXQ1Y=;
        b=DCRdRQRlgpg0GAL/7sJbO7kdA33oj9MZf6HnY9BAq2g3xLCZqnBEZbVFnDl4877ysX
         irILz9dDhNeMZc/aNTCLvbx9wwSq9uKbYCKHwIyPRIDgLosPCl/ooAf2igFt5uF0GxGd
         J+TU1s0sTAaisKSrttaRta9lgM6NTISOeIBh/6STKL0MqdheuIiOacUSCm6dxVBy2rfu
         u6rQIr1al/EIIc7rFYx5Tlm53ChSq2dI5tnMgW9Pq5XlV2jkRtje8kUJmVFWs3h5kCar
         uHra6jHKI1ogzhQw7bX/xJEZ3Qiq3WKwIEGvPgl+c4VYaaj/WsGKks1pdO1a6ab0Lsw9
         5/8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=izfAyTW0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4358aab8csi36734021cf.140.2025.05.30.04.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 May 2025 04:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=izfAyTW0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKyLu-0003Tb-Lf; Fri, 30 May 2025 07:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyLt-0003T2-5K
 for qemu-arm@nongnu.org; Fri, 30 May 2025 07:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyLq-0003fJ-Jg
 for qemu-arm@nongnu.org; Fri, 30 May 2025 07:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748606201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VD3BjY4GHQ+mCSGlGp19ZvgTUZkqt5lpUczzmNa1moI=;
 b=izfAyTW0Xw6cc9bnW59e0+J85qqBD08H3Weg5wKIdo0huPouH62au/rvpFmxAvBSjR09pr
 +wYyH5YN/N4dcqp6u3U9Lptu+EHnvD6ZBegA41Sf1FEZvh986IbgwYtdMnovX+frRJX6uU
 3QZk/ElekNpXQGBGvTOCfalxGmyQ3P0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-aSts0kxwMreu_xV9XJv1eg-1; Fri, 30 May 2025 07:56:40 -0400
X-MC-Unique: aSts0kxwMreu_xV9XJv1eg-1
X-Mimecast-MFC-AGG-ID: aSts0kxwMreu_xV9XJv1eg_1748606199
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f8fd1856so281665f8f.2
 for <qemu-arm@nongnu.org>; Fri, 30 May 2025 04:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748606199; x=1749210999;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VD3BjY4GHQ+mCSGlGp19ZvgTUZkqt5lpUczzmNa1moI=;
 b=nx/mAfNCWdZz+KdiIFZEHhF0sKHUT6D0XnzJ9A/+a5OBBINBvvWYMPvcBB4HnYZ25f
 MUedEgPYwDJzWxb5l8hcidnC4Ue+/6cBLr5eaMYn4DeKUbDjuyeGUlGM1c6DRBU8L5M8
 /wXR06LjXeLe8S0q8YtrJ545h03ehXmEsZ8k0VdBlhWeUvgjMoDmUQBXVWohTfrFmFrE
 tR4mhtQYAGBxWbBTVpb/san82ZuJQqARZgWHqoHhuXdxtyY6hBtIwncOzn7laN9oNY/h
 fodqwsHnluSCDoJdiREj7MhWXbexLNrnL928iHmpxo7phjpwiEVo9i+pKVSOnIob1Hgw
 DZHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3qMP4mvbXM2k2mknuykSwyquGQ1t0qyHKllitMKJZYQ906bHU7Fibpj8QrWmSH1l9tzA3MaDcIg==@nongnu.org
X-Gm-Message-State: AOJu0YynEp6qsFTAFDQUW9E7UyWagNFRCfOXEhKhjbqoMqfas880oAQQ
 wZVhk0UN07U4U+oAUqnJj453VZPYM3D0nDgoukkIeXZD3bNmiySu3Sbb4OzgPN+vUpwHi+ALnuk
 PAF4Gqrr4Rs9E3Uu7mnTxdBFjVJUArZeNFPgi5dBdxK3+B9iIrE32dQ==
X-Gm-Gg: ASbGncvztIrGSP0FZk4DEWgFDJrj2DjJDZWLRKtkGBcIZ1t1YWZgJbgta2gjBmQ1eDl
 m7x6/qunEA7t54arAsPrtKqNuc7Dm992L0OrE6+IWGwhKJ4RXd/GzmN/RIPnjP+DPmAOLpPvLTW
 4KVvJb3wIFmWpOrSax1iVJyzjhD7XeqQbXJQk0heKgI68dRwz3fC4tSfkvJBRcXnazdY+JLxVoc
 l3nw59yizWhv///gYvaUHvs3+HvQtDnsyttI71gGqlSUj0DFLddCGxwFdRTrKu8neGSM5juj79n
 sshiBQZoaX/oJ6Mx
X-Received: by 2002:a05:6000:2404:b0:3a4:d02e:84af with SMTP id
 ffacd0b85a97d-3a4f7ac4d55mr2381592f8f.58.1748606198996; 
 Fri, 30 May 2025 04:56:38 -0700 (PDT)
X-Received: by 2002:a05:6000:2404:b0:3a4:d02e:84af with SMTP id
 ffacd0b85a97d-3a4f7ac4d55mr2381562f8f.58.1748606198494; 
 Fri, 30 May 2025 04:56:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009748fsm4570952f8f.80.2025.05.30.04.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 04:56:37 -0700 (PDT)
Date: Fri, 30 May 2025 07:56:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, anisinha@redhat.com,
 armbru@redhat.com, berrange@redhat.com, dapeng1.mi@linux.intel.com,
 eric.auger@redhat.com, farman@linux.ibm.com,
 gustavo.romero@linaro.org, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, linuxarm@huawei.com,
 mtosatti@redhat.com, peter.maydell@linaro.org, philmd@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 yangyicong@hisilicon.com, zhao1.liu@intel.com
Subject: Re: [PATCH v11 0/6] Specifying cache topology on ARM
Message-ID: <20250530075601-mutt-send-email-mst@kernel.org>
References: <20250519153632.537-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20250519153632.537-1-alireza.sanaee@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gSRaPVocMCELexs9jyoQ9N0oOSdofxt1YORgf-Mo3NM_1748606199
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3v9eU28vkohK

On Mon, May 19, 2025 at 04:36:26PM +0100, Alireza Sanaee wrote:
> Specifying the cache layout in virtual machines is useful for
> applications and operating systems to fetch accurate information about
> the cache structure and make appropriate adjustments. Enforcing correct
> sharing information can lead to better optimizations. Patches that allow
> for an interface to express caches was landed in the prior cycles. This
> patchset uses the interface as a foundation.  Thus, the device tree and
> ACPI/PPTT table, and device tree are populated based on
> user-provided information and CPU topology.


Not sure why doesn't this apply anymore. Can you rebase and repost pls?

> Example:
> 
> 
> +----------------+                            +----------------+
> |    Socket 0    |                            |    Socket 1    |
> |    (L3 Cache)  |                            |    (L3 Cache)  |
> +--------+-------+                            +--------+-------+
>          |                                             |
> +--------+--------+                            +--------+--------+
> |   Cluster 0     |                            |   Cluster 0     |
> |   (L2 Cache)    |                            |   (L2 Cache)    |
> +--------+--------+                            +--------+--------+
>          |                                             |
> +--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
> |   Core 0         | |   Core 1        |    |   Core 0        |  |   Core 1    |
> |   (L1i, L1d)     | |   (L1i, L1d)    |    |   (L1i, L1d)    |  |   (L1i, L1d)|
> +--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
>          |                   |                       |                   |
> +--------+              +--------+              +--------+          +--------+
> |Thread 0|              |Thread 1|              |Thread 1|          |Thread 0|
> +--------+              +--------+              +--------+          +--------+
> |Thread 1|              |Thread 0|              |Thread 0|          |Thread 1|
> +--------+              +--------+              +--------+          +--------+
> 
> 
> The following command will represent the system relying on **ACPI PPTT tables**.
> 
> ./qemu-system-aarch64 \
>  -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
>  -cpu max \
>  -m 2048 \
>  -smp sockets=2,clusters=1,cores=2,threads=2 \
>  -kernel ./Image.gz \
>  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
>  -initrd rootfs.cpio.gz \
>  -bios ./edk2-aarch64-code.fd \
>  -nographic
> 
> The following command will represent the system relying on **the device tree**.
> 
> ./qemu-system-aarch64 \
>  -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
>  -cpu max \
>  -m 2048 \
>  -smp sockets=2,clusters=1,cores=2,threads=2 \
>  -kernel ./Image.gz \
>  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=off" \
>  -initrd rootfs.cpio.gz \
>  -nographic
> 
> Failure cases:
>     1) There are scenarios where caches exist in systems' registers but
>     left unspecified by users. In this case qemu returns failure.
> 
>     2) SMT threads cannot share caches which is not very common. More
>     discussions here [1].
> 
> Currently only three levels of caches are supported to be specified from
> the command line. However, increasing the value does not require
> significant changes. Further, this patch assumes l2 and l3 unified
> caches and does not allow l(2/3)(i/d). The level terminology is
> thread/core/cluster/socket right now. Hierarchy assumed in this patch:
> Socket level = Cluster level + 1 = Core level + 2 = Thread level + 3;
> 
> TODO:
>   1) Making the code to work with arbitrary levels
>   2) Separated data and instruction cache at L2 and L3.
>   3) Additional cache controls.  e.g. size of L3 may not want to just
>   match the underlying system, because only some of the associated host
>   CPUs may be bound to this VM.
> 
> [1] https://lore.kernel.org/devicetree-spec/20250203120527.3534-1-alireza.sanaee@huawei.com/
> 
> Change Log:
>   v10->v11:
>    * Fix some coding style issues.
>    * Rename some variables.
> 
>   v9->v10:
>    * PPTT rev down to 2.
> 
>   v8->v9:
>    * rebase to 10
>    * Fixed a bug in device-tree generation related to a scenario when
>         caches are shared at core in higher levels than 1.
>   v7->v8:
>    * rebase: Merge tag 'pull-nbd-2024-08-26' of https://repo.or.cz/qemu/ericb into staging
>    * I mis-included a file in patch #4 and I removed it in this one.
> 
>   v6->v7:
>    * Intel stuff got pulled up, so rebase.
>    * added some discussions on device tree.
> 
>   v5->v6:
>    * Minor bug fix.
>    * rebase based on new Intel patchset.
>      - https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
> 
>   v4->v5:
>     * Added Reviewed-by tags.
>     * Applied some comments.
> 
>   v3->v4:
>     * Device tree added.
> 
> Depends-on: Building PPTT with root node and identical implementation flag
> Depends-on: Msg-id: 20250423114130.902-1-alireza.sanaee@huawei.com
> 
> Alireza Sanaee (6):
>   target/arm/tcg: increase cache level for cpu=max
>   arm/virt.c: add cache hierarchy to device tree
>   bios-tables-test: prepare to change ARM ACPI virt PPTT
>   hw/acpi/aml-build.c: add cache hierarchy to pptt table
>   tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
>   Update the ACPI tables according to the acpi aml_build change, also
>     empty bios-tables-test-allowed-diff.h.
> 
>  hw/acpi/aml-build.c                        | 220 ++++++++++++-
>  hw/arm/virt-acpi-build.c                   |   8 +-
>  hw/arm/virt.c                              | 359 +++++++++++++++++++++
>  hw/cpu/core.c                              |  92 ++++++
>  hw/loongarch/virt-acpi-build.c             |   2 +-
>  include/hw/acpi/aml-build.h                |   4 +-
>  include/hw/arm/virt.h                      |   5 +
>  include/hw/cpu/core.h                      |  27 ++
>  target/arm/tcg/cpu64.c                     |  13 +
>  tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
>  tests/qtest/bios-tables-test.c             |   4 +
>  11 files changed, 724 insertions(+), 10 deletions(-)
> 
> -- 
> 2.43.0

