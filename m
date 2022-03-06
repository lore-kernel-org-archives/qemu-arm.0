Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp708290lfo;
        Sun, 6 Mar 2022 02:50:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzZMwbCk+PMdLZ46sqg6VORnrpt56TlIJOcFndGBJSvP2izJCtDG26wEebWq8pM9TvVKgt
X-Received: by 2002:ac8:5e4d:0:b0:2e0:6007:2a26 with SMTP id i13-20020ac85e4d000000b002e060072a26mr3581587qtx.134.1646563859242;
        Sun, 06 Mar 2022 02:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646563859; cv=none;
        d=google.com; s=arc-20160816;
        b=F3QK/SxhqXuhjWg2sGttIojhoxAuyNiIT/s8OdfvEJdU02qy09TWT3csYGC48Zp5aC
         MBWDV4Jf7rbomMTX09Fs8R1OUNVIz8bffQoNNFYkf2Z6A5iqgmiOxuHPpF9fkUdRSdL5
         CSTelPz6MtX3svCgW2XX2uXQrN66xMCwu7m+Swa24F9Sj3Z0FxrT6KSSp8dk4Kz/daC3
         7AyWhu0aKCBaz80Rt/Yzg1Bss0WJz9P55j6XkGCDBVvNCYo/9bMUYsGuXigxKbaaluqB
         QrR5fqZih7HSq/G4ui7bRKpQA5Ugs59Bv+CjUOprF+T7r3wFXiFBBzArbqEDhf/Cw/7W
         A2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xEPibcsY0rD2sw2sNqWWu16MLbTcWrqLWLCnuAdeQ40=;
        b=MWF+RsGJrth3bimhWsHNaiWDdxkO8hFjKn5AYl14fcuMLLjh3CusaubzO4dPliupk9
         /te3U01jAhKKyGbFYheOg0S+JmpgUNesJ0U3wE/ktDxV1NO1yE7thUNsjUh9mJxnpsef
         uFzmvOlWJXJWjwcldDhFlUgdO1lMtjWLEsxIHIDD5tlVr0Iyr8Fec9clO6fxjOjWq9dQ
         e6OlrtnJm8GlmSdmJReakZJlW+CicH2dPSE7Y0lSOEijedQ27eyy6Z1X1exQpJd7Sad3
         QXhAKeFuxwR791JC/EmOUTRQ/Ln5HUCIHOVsEHuQSjJc4Ami4kUgF7x9XfPSPrz4gnkg
         KKyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iJYAvicy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br9-20020a05622a1e0900b002de2d707d26si3723760qtb.627.2022.03.06.02.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 02:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iJYAvicy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQoTa-0004nU-Na
	for alex.bennee@linaro.org; Sun, 06 Mar 2022 05:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoTC-0004kk-ER
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:50:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoT8-0004Tg-SH
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646563829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xEPibcsY0rD2sw2sNqWWu16MLbTcWrqLWLCnuAdeQ40=;
 b=iJYAvicyBSriL4anq5iSiGj8wJKbnAN16mX711XvguOw+H/0vE3dbnyokPMAhkSyn6QDQX
 YuiLYPsm+c0m2s+WYsnN+SxivQ8V42WRPlZsu649YSsup7w7dhgSjX91l7PHNkd0EZ4RHe
 4SNyW3F75WmImVF5JL5YW6vXuO7jvt4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-cN2C26mgPj6Hr2BMFK9cvg-1; Sun, 06 Mar 2022 05:50:27 -0500
X-MC-Unique: cN2C26mgPj6Hr2BMFK9cvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso4218867wmq.6
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 02:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xEPibcsY0rD2sw2sNqWWu16MLbTcWrqLWLCnuAdeQ40=;
 b=GTEA65q7caVtqZYyoNg1lUdEeU9+adKO44lD83w5vaqIN3VNm4uF1FbnByywnzQ1+D
 ifcx/vqDsLxH/TG0yjY9+WiLTBQdgshiNApXkMGIFKM+UXKkGhVc16Vc1n+B/rOLjgBS
 gebjCN9BqphtKM+Im35FZjQ0HBXhhP3ZPL9VO+cxojnu5bhwi569ELBKO5i7JLDM/lKE
 WAoy9Lfy7ynC7XgZXbd6NYI5jXX0Ml9oJn2eqvlNxnHkYmv6eOLuLkTjNsBFvnpqxztX
 /Bt2c+HClsF/dAZM1oVHndHlyGYsXU4USFS7jr/FuFCZxF2FG4jZRApURh2gelFuo2mR
 pWvQ==
X-Gm-Message-State: AOAM5311bGTUnbdvSYk5+uKbI/90g/S0v6ocpfKZMcWGiAIEyrIbcMyZ
 2l7Kz6vD7puZtZbln8qZMGfus3RUid+q+IDISroPpi6Gi6kRQRq3nbBQbs9GuY+KdQcZFN7szw7
 rTzO9ZDE43UCgMGQ=
X-Received: by 2002:adf:ef81:0:b0:1f0:95f:30a7 with SMTP id
 d1-20020adfef81000000b001f0095f30a7mr4824541wro.636.1646563825961; 
 Sun, 06 Mar 2022 02:50:25 -0800 (PST)
X-Received: by 2002:adf:ef81:0:b0:1f0:95f:30a7 with SMTP id
 d1-20020adfef81000000b001f0095f30a7mr4824520wro.636.1646563825693; 
 Sun, 06 Mar 2022 02:50:25 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm9821479wmh.31.2022.03.06.02.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 02:50:24 -0800 (PST)
Date: Sun, 6 Mar 2022 05:50:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/5] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Message-ID: <20220306054927-mutt-send-email-mst@kernel.org>
References: <20220210145254.157790-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210145254.157790-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eesposit@redhat.com, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, stefanha@redhat.com,
 pbonzini@redhat.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3iGOWQSUMHpf

On Thu, Feb 10, 2022 at 03:52:49PM +0100, Eric Auger wrote:
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
> Also I have some trouble with 2 of the vhost-user-blk-tests. I am
> obliged to hack them in "tests/qtest/vhost-user-blk-test: Temporary
> hack to get tests passing on aarch64". Looks like a memory
> allocation issue, which at first sight seems unrelated to the
> aarch64 pci libqos enablement but we are never sure. Calling for
> help on this issue, if some vhost-user specialists can dedicate
> some cycles on this. Otherwise I will try my best to further debug.
> 
> To reproduce the issue, revert the above hack and run
> 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=build/storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=build/aarch64-softmmu/qemu-system-aarch64 build/tests/qtest/qos-test
> 
> you should get:
> 
>     ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
>     assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>     Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
>     assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/libqos-pci-arm-v3

Seems to cause issues when run on a powerpc host (see Peter's
response to the pull request).
Dropped from pull for now.


> History
> 
> v2 -> v3:
> - force -cpu=max along with aarch64/virt
> - reduced the vhost-user-block-pci issue workaround to a
>   single guest_alloc() instead of enabling MSIs. Call for
>   help on this specific issue. The 2 tests which fail otherwise
>   are: test_basic and indirect.
> 
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
> Eric Auger (5):
>   tests/qtest/vhost-user-test.c: Use vhostforce=on
>   tests/qtest/libqos/pci: Introduce pio_limit
>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>     hotpluggable
>   tests/qtest/vhost-user-blk-test: Temporary hack to get tests passing
>     on aarch64
>   tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
> 
>  tests/qtest/e1000e-test.c             |   6 +
>  tests/qtest/libqos/arm-virt-machine.c |  19 ++-
>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/pci-pc.c           |   1 +
>  tests/qtest/libqos/pci-spapr.c        |   1 +
>  tests/qtest/libqos/pci.c              |  78 +++++----
>  tests/qtest/libqos/pci.h              |   6 +-
>  tests/qtest/vhost-user-blk-test.c     |  16 ++
>  tests/qtest/vhost-user-test.c         |   2 +-
>  tests/qtest/virtio-blk-test.c         |   5 +
>  tests/qtest/virtio-net-test.c         |   5 +
>  tests/qtest/virtio-rng-test.c         |   5 +
>  14 files changed, 394 insertions(+), 36 deletions(-)
>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
> 
> -- 
> 2.26.3

