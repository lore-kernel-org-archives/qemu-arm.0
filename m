Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2995151lfk;
        Fri, 4 Feb 2022 18:04:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZhqFcEWL+19kOTUSzH4IxeEpzEwrLVhYWSxUV1ANu5wHoc+jZmqq3oL9QWsDJUHVFKmFw
X-Received: by 2002:a05:6902:120c:: with SMTP id s12mr1991355ybu.100.1644026691095;
        Fri, 04 Feb 2022 18:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644026691; cv=none;
        d=google.com; s=arc-20160816;
        b=du9/o52NQW1I6h1vPYIEesontTBC2ZEjkiKup8/E4XEo7uvEUaWJSORVzFOcMC/dm0
         DrUHoFQ4l7GBQXiqqCAbLmHb+DNJAs4ofxLLt6npbWdW02XxaKPs2+7a8hcgS2EhVHYj
         UtQwAzvlt3GfBWV44YTsNspeR5m+zNVf2C+4YxF/34GA5Btv2OYhOlc1qOyntQmYVZEj
         zoLU89sFOtbraCxXNtu3UNLuivIPWrjYB6R/EfFxHoFqOo0QUIb25YzDwifETi6ma3te
         6Gn+fFbAsknrwTQhsSRp/kgDh4FpFXb2UMSaaKOT1P5NfkaQC3rwz+NFj+EnLlbXvJy3
         sKzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fC9KHCSiNtpEeHGAnMKTZjdHnII3b++HtWsRpnS6cZY=;
        b=T7/3G0Rcl9YouoDtEZFb6PjDyIySQ5NDCPoTYleBX0pIuPx+MnHGN+ccMfquWbAEJ3
         fgS5oU6hnzCE++Bfat8dmr1r3ApVNtf44JqfCQuswjB3iF69ylZXr/4hvJ2aKFrHSV6D
         LUmb0pSFPgjo4D9epkA08bXYBxQXTEGOVaB/FwzjpDzVcBVOl4L+yJhrEJHVt4NQFfJx
         mJnk1hA3XXe9k8d3LtaiEAF7g7UTv774UP9bIV10TfC6Fc4BmVgN2C30uvkU5R4SnngH
         8PkKSH1bfqla182R5VXfqBMgQi0VLabm7EpT1FGfd9zKi9MkYKZx3U8PcwjpiuwTEfMh
         JXhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=clxx3DdB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si2320171ybt.698.2022.02.04.18.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 18:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=clxx3DdB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGARW-0004DT-An
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 21:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7O-0003yS-Nk
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 20:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7L-0003Q4-24
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 20:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fC9KHCSiNtpEeHGAnMKTZjdHnII3b++HtWsRpnS6cZY=;
 b=clxx3DdBuvlJjf2C7f8Nogur2sJJjjcCYI+hxJ+KoLSd3kkB/tcBwQUwFHKHA/xqoLbLv9
 DgCAW645EKaty+uZqlIL6EWnr4Suhcnz6Iy5ednbgOh98GA4pZdQC+2xwx7DSdLbvQDkAE
 BykckeV6X3Kcxje9D9tHyWjNCVl2n2c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-EcheskQNOguKMQgpBWe1rw-1; Fri, 04 Feb 2022 20:43:55 -0500
X-MC-Unique: EcheskQNOguKMQgpBWe1rw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i64-20020a1c3b43000000b00352cf8b74dcso1187831wma.0
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 17:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fC9KHCSiNtpEeHGAnMKTZjdHnII3b++HtWsRpnS6cZY=;
 b=r5lXnnxhSrZnpSmHiFFNoWnxQC4gOPZ489OA3tJkTGFAeXiUWcRCTyP1kS87g6QzLA
 nywD9/1yqxnFmbKXMDpT1CE3X3hkInJQjlNTkUpd+zsQbhUUc7RC8VubI9Q1+Em01p+p
 UoPkzaZ5iSL/ueBXdwWWj0/CiDLgaMoZ7gpkcO1v+FDBl18xNsPlUHU9CHjcA5iRbjaW
 CTyobYnaZtFN398zNEi3zDtNC3X5LjUZ3+9B+LozIongWzCP/89QxYKsyv5bpzNlFxH0
 JfNyfslhUQzPjkGstSqpCfJa6VqJ6P3m5PiCQOvSVqLNutC87v9QDeM+bI028Uy6k1zU
 dupQ==
X-Gm-Message-State: AOAM531+ED92kOqSLBpHC/Im1s89uwzNTKBj220EtgEQsC39G/5/cbNc
 rlZgrksyuRwfBo6JqX1IAdQva1LwTWqRtddr3i8Zm3xQeTY/Y4D3jF9dlbaPZtbvDkkVDlN550t
 r2Y0olXB0K4nf
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr4517909wms.60.1644025434036; 
 Fri, 04 Feb 2022 17:43:54 -0800 (PST)
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr4517901wms.60.1644025433870; 
 Fri, 04 Feb 2022 17:43:53 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id n8sm12228146wmq.42.2022.02.04.17.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:51 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/6] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Message-ID: <20220204204301-mutt-send-email-mst@kernel.org>
References: <20220118203833.316741-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118203833.316741-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 jean-philippe@linaro.org, eesposit@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8j683P1VDWM6

On Tue, Jan 18, 2022 at 09:38:27PM +0100, Eric Auger wrote:
> Up to now the virt-machine node only contains a virtio-mmio
> driver node but no driver that eventually produces any pci-bus
> interface.
> 
> Hence, PCI libqos tests cannot be run with aarch64 binary.
> 
> This series brings the pieces needed to be able to run PCI tests
> with the aarch64 binary: a generic-pcihost driver node gets
> instantiated by the machine. This later contains a pci-bus-generic
> driver which produces a pci-bus interface. Then all tests
> consuming the pci-bus interface can be run with the libqos arm
> virt machine.
> 
> One of the first goal was to be able to run the virtio-iommu-pci
> tests as the virtio-iommu was initially targetting ARM and it
> was awkard to be run the test with the pc machine. This is now
> possible.
> 
> Only the tests doing hotplug cannot be run yet as hotplug is
> not possible on the root bus. This will be dealt with separately
> by adding a root port to the object tree.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/libqos-pci-arm-v2
> 
> History


I dropped this due to make check failures. Pls make sure
to make and test all targets. Thanks!

> v1 -> v2:
> - copyright updated to 2022
> - QPCIBusARM renamed into QGenericPCIBus
> - QGenericPCIHost declarations and definitions moved in the same
>   place as the generic pci implementation
> - rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
>   ARM there
> - remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
> - ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
> - new libqos_init to create generic-pcihost driver that contains
>   pci-bus-generic
> - QGenericPCIHost moved in the same place as the generic pci
>   bindings
> - collected Thomas A-b/R-b
> 
> 
> Eric Auger (6):
>   tests/qtest/vhost-user-test.c: Use vhostforce=on
>   tests/qtest/libqos/pci: Introduce pio_limit
>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>     hotpluggable
>   tests/qtest/vhost-user-blk-test: Setup MSIx to avoid error on aarch64
>   tests/qtest/vhost-user-blk-test: Factorize vq setup code
>   tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
> 
>  tests/qtest/e1000e-test.c             |   6 +
>  tests/qtest/libqos/arm-virt-machine.c |  18 +-
>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/pci-pc.c           |   1 +
>  tests/qtest/libqos/pci-spapr.c        |   1 +
>  tests/qtest/libqos/pci.c              |  78 +++++----
>  tests/qtest/libqos/pci.h              |   6 +-
>  tests/qtest/vhost-user-blk-test.c     |  39 ++++-
>  tests/qtest/vhost-user-test.c         |   2 +-
>  tests/qtest/virtio-blk-test.c         |   5 +
>  tests/qtest/virtio-net-test.c         |   5 +
>  tests/qtest/virtio-rng-test.c         |   5 +
>  14 files changed, 408 insertions(+), 44 deletions(-)
>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
> 
> -- 
> 2.26.3

