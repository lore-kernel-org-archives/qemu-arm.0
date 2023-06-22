Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp660394ejb;
        Thu, 22 Jun 2023 13:14:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O6yoMNFriIOoJxriNHMnOW2wmxY9tQDH9KEQ0875JAa5H3drFml5aCQnz7oZf4b4YPLAf
X-Received: by 2002:a05:620a:372b:b0:75d:4a80:68a1 with SMTP id de43-20020a05620a372b00b0075d4a8068a1mr22697116qkb.22.1687464853263;
        Thu, 22 Jun 2023 13:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687464853; cv=none;
        d=google.com; s=arc-20160816;
        b=JIezPaLn+NzjnaFGmLkSLrMLfayWgCuqna4kRswUwJo99v1Sn2qmzSfQtGVhuDEEZ2
         6Xv3fEe6A3xPb0wnWfnyHdcTTDOGO5GpVM5qwbty7Teevuy8p2wsy/22f6lZo4p/9+ea
         su58TQ0y2dfu09jKWXcoy/RYAwWM0tduWuPhGwmOH1ZRKy308pbvM3W11gel9DPL3CvL
         km2orcx8+N/Hx/sjB++KDv2NrW4tu+St1MsBarHf1I0tPRmDHsQMhKB9WObrOe0uXUET
         PFbyNhWcyOlbpotgZVwnYpYRJ7UXMFeRGCa6ZbFncJxwqXkU4SEr7kVIRRmf71B0cuq6
         7g8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XubY0rqvt0/p6OB1uA8q+9GRjQII2pVurqbY7EUIcZ8=;
        b=nLvI0QTixz6SOVdY6ua7DGymkkonsN1YQzZyw8En/z+AYk5o3puLLLxzXcQYHeHlk7
         mVpuLH+unO7nlpWzr4NacWW9MnzH94K56x/VYdDSHRMYeV5R9jsiJF2KWRw8GkhCAs1r
         l6RIyVvv8u+GBN0xXKo5vxDEbQWu9pR+tvcaYWYlO91R6aaaZ8tWHTGFobTUG+6zbjQ4
         nIdFbMCOb/x1oCCf4AFaDVX0adHyEmjiI7iDqAGP68UwA5kn7TJjo6vK5L9Ut2+GhdKa
         hxhBZk3wYxK6Jg8O0U6tqYBbiijbepVZc9uJGKTdJijYnDx57wc2QhOj5Khat2z2b7gk
         oRaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R28My3pU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt14-20020a05620a478e00b0076214ccb868si2970422qkb.747.2023.06.22.13.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 13:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R28My3pU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCQgi-0005z2-2k; Thu, 22 Jun 2023 16:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCQgg-0005xq-TO
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 16:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCQgf-0007EN-Cn
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 16:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687464828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XubY0rqvt0/p6OB1uA8q+9GRjQII2pVurqbY7EUIcZ8=;
 b=R28My3pUXrlRp3nQIxpo9SWIlQYGTTycIpnDH56pAWYjsHfAlFA+OjKj3L1omKyxxtp/tW
 jhyqZv1wC+EPOFu/1jNArcpFqGS+nM3PHRg5LLZQgO2jncjCBYnd/vfg7gOcnmYXbwQdYN
 QHUrSai3UfwE87hfncVYpwtfhmflU0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-vwv6VAtvPVeVtoLngT8-5Q-1; Thu, 22 Jun 2023 16:13:41 -0400
X-MC-Unique: vwv6VAtvPVeVtoLngT8-5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f814f78af2so35832665e9.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 13:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687464819; x=1690056819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XubY0rqvt0/p6OB1uA8q+9GRjQII2pVurqbY7EUIcZ8=;
 b=iLnKAAUxfSFhnr3fmzBUfq6svEUCpXKd2SetlVrOwixWD2ASoToq2240/noJt+miNh
 Gi1W8GDymKsCYaqEpq85vPffEV1BgfGq0CyLWEGBDfrnt+A+ig5ao5/iOP8Lbk2bKesv
 F9yZNc7Xdo0T9dnWK+boaVv8cs49glu/n1XCUTWPUuFiRo5JJ9WkqDZvcS3Ikm697+Tv
 l7TDb/EPZ+vS7y/IAdM9lgGJENmxgIvdWjmXYfiXp1ednc100+wmO7AtwzyYHC/yxA8w
 1RPiiIzwGi2o5u3POY25zWqkAd1/5Q0Jmsrtgg/lYvETZ5nffhW51RF+bh8ngDDh/j4Y
 eJeQ==
X-Gm-Message-State: AC+VfDy9HuHkODAS5IOyEyj+c8qluAwCAER8NqqXfJQRpcxeSGfqsdRI
 THfsfPP+io1XpinpHKviNZSinPvGRJDhSydkFj9OVuld74hUQ89E9SuWy/uCmME1e4EUb+QNDf1
 ECSrIo+tJFJNB
X-Received: by 2002:a05:6000:1008:b0:311:1501:ba53 with SMTP id
 a8-20020a056000100800b003111501ba53mr13990339wrx.49.1687464819301; 
 Thu, 22 Jun 2023 13:13:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1008:b0:311:1501:ba53 with SMTP id
 a8-20020a056000100800b003111501ba53mr13990310wrx.49.1687464819009; 
 Thu, 22 Jun 2023 13:13:39 -0700 (PDT)
Received: from redhat.com ([2.52.149.110]) by smtp.gmail.com with ESMTPSA id
 e10-20020a5d65ca000000b002f28de9f73bsm7752224wrw.55.2023.06.22.13.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:13:38 -0700 (PDT)
Date: Thu, 22 Jun 2023 16:13:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: Re: [PATCH 00/10] memory-device: Some cleanups
Message-ID: <20230622161320-mutt-send-email-mst@kernel.org>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7aFdWHStC9O8

On Tue, May 30, 2023 at 01:38:28PM +0200, David Hildenbrand wrote:
> Working on adding multi-memslot support for virtio-mem (teaching memory
> device code about memory devices that can consume multiple memslots), I
> have some preparatory cleanups in my queue that make sense independent of
> the actual memory-device/virtio-mem extensions.

pc/acpi things:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> v1 -> v2:
> - Allocate ms->device_memory only if the size > 0.
> - Split it up and include more cleanups
> 
> David Hildenbrand (10):
>   memory-device: Unify enabled vs. supported error messages
>   memory-device: Introduce memory_devices_init()
>   hw/arm/virt: Use memory_devices_init()
>   hw/ppc/spapr: Use memory_devices_init()
>   hw/loongarch/virt: Use memory_devices_init()
>   hw/i386/pc: Use memory_devices_init()
>   hw/i386/acpi-build: Rely on machine->device_memory when building SRAT
>   hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
>   memory-device: Refactor memory_device_pre_plug()
>   memory-device: Track used region size in DeviceMemoryState
> 
>  hw/arm/virt.c                  |  9 +----
>  hw/i386/acpi-build.c           |  9 ++---
>  hw/i386/pc.c                   | 36 +++---------------
>  hw/loongarch/virt.c            | 14 ++-----
>  hw/mem/memory-device.c         | 69 +++++++++++++++-------------------
>  hw/ppc/spapr.c                 | 37 +++++++++---------
>  hw/ppc/spapr_hcall.c           |  2 +-
>  include/hw/boards.h            |  2 +
>  include/hw/i386/pc.h           |  1 -
>  include/hw/mem/memory-device.h |  2 +
>  10 files changed, 68 insertions(+), 113 deletions(-)
> 
> -- 
> 2.40.1

