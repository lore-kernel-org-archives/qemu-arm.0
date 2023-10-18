Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4751267ejc;
        Wed, 18 Oct 2023 09:12:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI4A9Yn+PoZys0Pqaptu1Cj1In0iYOMYQFHbheH2YHR9aQTvnoW77QoEk2CEK5FsyysRpp
X-Received: by 2002:a67:cb92:0:b0:458:3bc1:8941 with SMTP id h18-20020a67cb92000000b004583bc18941mr4549418vsl.22.1697645537050;
        Wed, 18 Oct 2023 09:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697645537; cv=none;
        d=google.com; s=arc-20160816;
        b=G4Mp7C+8/lJ4TB0n7UnDlYwJ9aCeQBR4QfKfRe1zi2chdRk5diVHH5BKy10P9qjhMi
         x/0L7Yo+neTdCvzOUJAN53dKFi0GuKuP+3G9GlPvRjA0wRoNKbdPx8/fOAi3ZMWC5M7M
         Ru+bIvnz5q/Samt0487mJoIK0I6PPY8JSo2PcB0/pzdNVwOR/PIZHGeMsN9bCtI62EiH
         FRnpSNo0Gd4E4n0poFzPXp4hFvTFVHgNTbcMAiiyq4FmNOeQ1gOoK3CEtwSy6ZLghWVi
         ZWSbs7sM1VQFmSBRhNvzRlOPbr4DCzTyFwoUqzu01wYYWHh4zP1RTy8Rrv2kp563jMTj
         9rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=uBZnjW/8vQpfn0jhw5gIDcURmZFDghp5ubZuiktXkoc=;
        fh=GVNLksklfF38B3AlFCUWANvxmJx+IVjMHGdnZZJQBpo=;
        b=e3FLpN9yUK9KCcgB67sskTE/0Y+jO8WMgVbCU2/3bijzOEiFcsKWj9JmpHtp40DDgw
         eXHT/T3JDxOYomkX0dulyKcXX7rZMuigRQ0kALacuCJCdTqslGMsnyW2tAsZqM2MEMHg
         GfCUnq67TERaEA/SCpfxIz1reed5vHpFlp54BHrn91k7FzxOPJN5uf1RuxGr4nr+sUSk
         GcXOFIHGMGd0DtFSVFW+S5IZzunhu+vgHZPr61yS9XlMZDqkVmqZoHf4xAzMtYk2ezWW
         7b+8cKFnkjVIsfIkoosb8QiWmDzmgTcU6LnNMQpB3q3MUSggKvInHzVu6cQplnKzS/Ag
         EnxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kt4oBf8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26-20020a056102321a00b00452d953e84asi362528vsf.222.2023.10.18.09.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kt4oBf8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt99P-0007MW-M3; Wed, 18 Oct 2023 12:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qt99M-0006vO-9V
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 12:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qt99K-00028Z-Mu
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 12:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697645518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBZnjW/8vQpfn0jhw5gIDcURmZFDghp5ubZuiktXkoc=;
 b=Kt4oBf8jQaioRD6cA2xpUhdIBwPhgkuObb0QpB0lgYrMY6rAws1ArxVSYCjswWU1Yec5MH
 gGwe5NnHcaOJLVC7RSZH4pjMTgoaWvPN9r+5xE41OBevFkUa5Vk4IxsCkg7NJxhpgYHezL
 krN8W2tqZe/auQGH90Jsn2DZnQAK4hA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-SNh4wg1bOdabBBgr07tKrA-1; Wed, 18 Oct 2023 12:11:32 -0400
X-MC-Unique: SNh4wg1bOdabBBgr07tKrA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4064b38dc63so37478335e9.1
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 09:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645484; x=1698250284;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBZnjW/8vQpfn0jhw5gIDcURmZFDghp5ubZuiktXkoc=;
 b=AnkG0JDEYhPEvCjmjTTDZUW9Y75ZHX1+ZfOBPt+YtImB2PWPhuLH2Lw0L6DKdhAgtW
 ZsqxmdveGL+typ3SO52BEv8NMQtnyAQzGYPA/tJmG4ZqGPOQjOEB1FIVH1JM54xPuAZr
 Stc5lt6RjC6vtjn7Q7Bg2Y6cajdq2idIqHtp6e9XGqCOVFF73PdJjF4zx/KAN5vXvsZ1
 DOKGlKMWCP6F5VMMk8gq6V/rpb0LPIYV5LWMx7GHaLmE/SDDMCm/LDiFYqGFvKlInGSO
 gKb8D1XJPaMg/Bznit4hpJtLXwBkd/yzQvaafBwnFKgigFtHUFao15TenvZchDp5jR5B
 vOdA==
X-Gm-Message-State: AOJu0YxaBSdyEJTLcMgeMUTNM8jAiTv+WB15CHAcdGMxa5db2kXkloWJ
 AI+0sUyo1mqvCdOhzIKt/0HjanAJsMwsLmDg1IKLPnClGjurQ/Vd8U9JdTc9vUDpaTGSCNZ6Z0M
 9Mbyo3MkoIvlYA2g=
X-Received: by 2002:a05:600c:6cf:b0:408:37aa:774a with SMTP id
 b15-20020a05600c06cf00b0040837aa774amr4225896wmn.17.1697645484411; 
 Wed, 18 Oct 2023 09:11:24 -0700 (PDT)
X-Received: by 2002:a05:600c:6cf:b0:408:37aa:774a with SMTP id
 b15-20020a05600c06cf00b0040837aa774amr4225872wmn.17.1697645484078; 
 Wed, 18 Oct 2023 09:11:24 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:2037:f34:d61b:7da0:a7be])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b0040841e79715sm478977wmq.27.2023.10.18.09.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:11:23 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:11:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/12] hw: Strengthen SysBus & QBus API
Message-ID: <20231018121106-mutt-send-email-mst@kernel.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mMHAGMnrdh6q

On Wed, Oct 18, 2023 at 04:11:38PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series ensure:
> 
> - qbus_new() and sysbus_init_mmio() are called *before*
>   a device is realized,
> - sysbus_mmio_map() is called *after* it is realized.
> 
> First we fix some abuse, then we enforce in qdev/sysbus
> core code.


pc things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> Philippe Mathieu-Daudé (12):
>   hw/i386/amd_iommu: Do not use SysBus API to map local MMIO region
>   hw/i386/intel_iommu: Do not use SysBus API to map local MMIO region
>   hw/misc/allwinner-dramc: Move sysbus_mmio_map call from init ->
>     realize
>   hw/misc/allwinner-dramc: Do not use SysBus API to map local MMIO
>     region
>   hw/pci-host/bonito: Do not use SysBus API to map local MMIO region
>   hw/acpi: Realize ACPI_GED sysbus device before accessing it
>   hw/arm/virt: Realize ARM_GICV2M sysbus device before accessing it
>   hw/isa: Realize ISA BUS sysbus device before accessing it
>   hw/s390x/css-bridge: Realize sysbus device before accessing it
>   hw/qdev: Ensure parent device is not realized before adding bus
>   hw/sysbus: Ensure device is not realized before adding MMIO region
>   hw/sysbus: Ensure device is realized before mapping it
> 
>  hw/arm/virt.c                 |  5 ++---
>  hw/core/bus.c                 |  7 +++++++
>  hw/core/sysbus.c              | 13 +++++++++++++
>  hw/i386/amd_iommu.c           |  5 ++---
>  hw/i386/intel_iommu.c         |  5 ++---
>  hw/i386/microvm.c             |  2 +-
>  hw/isa/isa-bus.c              | 11 +++++++++--
>  hw/loongarch/virt.c           |  2 +-
>  hw/misc/allwinner-r40-dramc.c | 20 +++++++++-----------
>  hw/pci-host/bonito.c          | 29 ++++++++++++++---------------
>  hw/s390x/css-bridge.c         |  7 +++----
>  11 files changed, 63 insertions(+), 43 deletions(-)
> 
> -- 
> 2.41.0

