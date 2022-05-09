Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3472850lfj;
        Mon, 9 May 2022 01:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIQJ/SlHsufZf9PpKhKiALJFmZRQPbpGzucOri21AGw6235oX8eYJdp8wIj++078XTEA3A
X-Received: by 2002:a05:622a:c4:b0:2f3:a257:b60 with SMTP id p4-20020a05622a00c400b002f3a2570b60mr13339687qtw.291.1652084320824;
        Mon, 09 May 2022 01:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652084320; cv=none;
        d=google.com; s=arc-20160816;
        b=bzUj6mKMzB3MYaaoh944Pv9T/iMElEzWzEypkQq2oek7pio9hlMv6SGU/sw9oL2Dlo
         YTKutVpf7SWYUeKxKISVB3QjNORQH8rOqprq7gh7RQJQbezTgFfVo1cYXA89v+FUavGP
         IK5WIeVgX3hsy/DWC4nlzfWBlUU94jJC/s42/UtK4HLyIlTYbghKsxcVvv0ilVprdccQ
         qo10qM39u0bH6PshR2iXFSi9hHfLU7pa/HQIQW+OONKaqeuoM8FRbTuJztVwF6u+gwGo
         INfl2LwRBDnOIdrNO46WyY7qhlNbKY0mLQ2ycg8NoM8cOh+opzu9i/4ssyPD81KwKb5v
         VsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xhMKcmi0HbN3MSLylKUabKp9ZNkm6fODYU12ttl531Y=;
        b=LuW2ZeiyLd9i7U9NUFXPmmPrd2/fC0DJa2RwOjwNaEITnuCDTgzNvKOK0ddGlbDdvG
         9Lcjm5mgwlsZqYe2eJHjcB45EM7D0hyctOmZBAp8uP3eCigfmKhV6y5TffaKvTK/a12S
         OjNBX4RtdmLdj1u57axVXdGcgYuWgRBtyHgmXzt5AxIHtlHO7lFxqp9jR1/6T22EC5KM
         /GtnvnOBxTw8uIJuTUOdwc418xD5t75ZtAeqQwSWdpwioX8RsacT1QczaORcaN83p1uy
         8XxXOrysRYdhqY/4J2cMuQNyuemqM4YZDe7FYtJ68G7csDq0omPQaOkgVPb4PHsRncQJ
         /3nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HXiBbzIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020ac85851000000b002f1ffa6fdfdsi8078382qth.109.2022.05.09.01.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 May 2022 01:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HXiBbzIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nnybI-0000uk-AM
	for alex.bennee@linaro.org; Mon, 09 May 2022 04:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nnyar-0000u8-4Y
 for qemu-arm@nongnu.org; Mon, 09 May 2022 04:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nnyao-0007Yp-Eb
 for qemu-arm@nongnu.org; Mon, 09 May 2022 04:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652084288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhMKcmi0HbN3MSLylKUabKp9ZNkm6fODYU12ttl531Y=;
 b=HXiBbzIsw4UYKCscUL0EwBasFL9EaYYjhLDluNMytPf+n9onPbdH8MAYatBsIxYG6swYki
 APE7HK2GgqRhHc9oNPOZeCLqh9mL1nh3wrJRxZ56uuxqH+3o/3JX2L08Kv3Rz8U8ezfBLF
 NkE5AodCKPWXPOQ3cR3GBOa/OYGM83s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-t0eht-coPB6DPr6gNPEW_A-1; Mon, 09 May 2022 04:18:07 -0400
X-MC-Unique: t0eht-coPB6DPr6gNPEW_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so3976076wmr.0
 for <qemu-arm@nongnu.org>; Mon, 09 May 2022 01:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xhMKcmi0HbN3MSLylKUabKp9ZNkm6fODYU12ttl531Y=;
 b=wDVwyrLXee4Z3O1bN1N+j1v0xZS1vAB/QJYUBLbW9Unew7n/pESwS++bVd4DQYgyVY
 ZlrBY6TBr8L4Sft5Fwwpvryh93Wpb9aeCzh9esM0tF2iXNqsfnERS7qNnJYm2v9KTw9O
 42N/lGAWAi1P5A9QMd5sDxLvDQM4mAM1oGPOXnM7DGqtzaO/Dz5EjBKlN8GcABW/T+xJ
 e8g1ftqyE9LDEigCqzFxgp4cWm+HpQkeOhdo4vETT94PHwMfhQtAFKsvIiEu16vFEMgu
 ibR83FX6yhnfMTCbs6MYop25Q+io2ZzkWL9+xUABASNCoWjFGkeaTqas3XtJzoTTnEYv
 pb1Q==
X-Gm-Message-State: AOAM530EcV/oOTQjU9fGJUeq68qfuOKWecUSaUd+2weYum/aSBVRV1lm
 YZtyNCt1Qknoej9siP9D8PlLIpvrmPg8ba5Zzp+FlROG9OWVWhCFNAtYvR/2MCYJ4Z1a0b6yP3M
 xnGR+fnb1LzyD
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr15110411wml.47.1652084286455; 
 Mon, 09 May 2022 01:18:06 -0700 (PDT)
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr15110381wml.47.1652084286172; 
 Mon, 09 May 2022 01:18:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c218900b0039453fe55a7sm15505155wme.35.2022.05.09.01.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:18:05 -0700 (PDT)
Message-ID: <99853fde-d02b-8099-39b7-df0ef218cee4@redhat.com>
Date: Mon, 9 May 2022 10:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/3] qtests/libqos: Allow PCI tests to be run with
 virt-machine
To: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com, stefanha@redhat.com
Cc: jean-philippe@linaro.org
References: <20220504152025.1785704-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220504152025.1785704-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aG2pFXJUGnI0

Hi,

On 5/4/22 17:20, Eric Auger wrote:
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
> was awkard to run the tests with the pc machine. This is now
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
> https://github.com/eauger/qemu/tree/libqos-pci-arm-v6

A gentle ping on this series.

Now 5b4f72f5e86 ("tests/qtest: properly initialise the vring used idx")
has landed and the all the enabled tests pass, Could someone please consider
pulling it. I have rebased it on

907b5105f1b  ("tests: move libqtest.h back under qtest")

so now I hope everything is OK

Thank you in advance

Eric

>
> History
>
> v5 -> v6:
> - change the libqtest.h header path after pull of
>   "tests: move libqtest.h back under qtest/"
>
> v4 -> v5:
> - Added Alex' R-b
> - Removed [PATCH v3 4/5] tests/qtest/vhost-user-blk-test:
>   Temporary hack to get tests passing on aarch64
>   following Alex' fix
>
> v3 -> v4:
> - handle endianess when accessing the cfg space (fix PPC64
>   BE failure). Tested on such machine.
>
> v2 -> v3:
> - force -cpu=max along with aarch64/virt
> - reduced the vhost-user-block-pci issue workaround to a
>   single guest_alloc() instead of enabling MSIs. Call for
>   help on this specific issue. The 2 tests which fail are:
>   test_basic and indirect.
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
> Eric Auger (3):
>   tests/qtest/libqos/pci: Introduce pio_limit
>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>     hotpluggable
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
>  tests/qtest/vhost-user-blk-test.c     |  10 ++
>  tests/qtest/virtio-blk-test.c         |   5 +
>  tests/qtest/virtio-net-test.c         |   5 +
>  tests/qtest/virtio-rng-test.c         |   5 +
>  13 files changed, 387 insertions(+), 35 deletions(-)
>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
>

