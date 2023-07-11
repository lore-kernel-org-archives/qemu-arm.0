Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1982613eje;
        Tue, 11 Jul 2023 08:38:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFJV/7UV+atoOY77qbr7gEYSrlU516q7pFhUmRCW6nnu3aYc/3z6hPJlN/AdAwapP9k1EVI
X-Received: by 2002:a0c:e3cb:0:b0:626:2e70:1f9e with SMTP id e11-20020a0ce3cb000000b006262e701f9emr12262095qvl.43.1689089885159;
        Tue, 11 Jul 2023 08:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689089885; cv=none;
        d=google.com; s=arc-20160816;
        b=tWhBbZ9guO3ekKSx7BWfY632B2ryRsGY2tjBLfP/kb+yCu/o1ldkUp9A5++WP29nNZ
         yolYmONZDrkj+Fq9+7EgrfrmqsGttGdfcs2hvMNMYzwd7Q2M5+p68t414fFzC7cwXuzk
         iR5uwv6/gmMjPaTrCfOU0oxHPRgZABVZ39iPI9a4G+x0Bgqwq8OMGvJmYViD3SvkKxRt
         U0xuKqBc3+7XEEbLUhVJ1EJkPNsfFLe1C2XNLu1WMNceQPxHejuk2BrJWHLQ4Xeynfvf
         uqyyfjRoRCHMZsD+3fEEl06L4VUfTV6mMBKKB7v63fcyKb/pyuiGzjSvh4O3IG10/baB
         UX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JBX3KMRDL+j9kGd79s3lBmaWqhN5Pi3Nld7WdspJqfE=;
        fh=EoOjAfkZesDSF9reC59stfIeodNss65dHW5vS16eomQ=;
        b=MiNmiMhSRLzABF5acZ/s8CNpC0O7sROyiFPtRjN0Rs2ux/gwxNec0NMvNUvwODgUJg
         1wBVBqqJKRzaKgC1iU77Wd0b6gJhOnLxLp1zg8n6sO4o0VLkv4m1oK38/Rb5kame1ICv
         wxD27yd/uMhdl5ak9AjozVG4tXrnqIR+1lS8LFyEdCHkaQTa4D/OW0owJXsQcvgrhafh
         2ofRajsnx+1p/6zrx9aPvXSU/rrXe4ZSIgeqVKjwdVRIkvVOMtj2wc7lVybyfuEN8grs
         d9B/XXkqDAVaAFsRu8rX8KxPaKDliVTTr5luelT7NH7Jf3lPxhp6vJLl/05dGEnIwWAP
         dnoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErwpFbvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020a0ca9d3000000b006301bb7f518si893824qvb.238.2023.07.11.08.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 08:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErwpFbvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJFRC-00043b-Ik; Tue, 11 Jul 2023 11:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qJFQx-0003qp-MB
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qJFQo-0006Rw-4o
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689089856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBX3KMRDL+j9kGd79s3lBmaWqhN5Pi3Nld7WdspJqfE=;
 b=ErwpFbvP7VGYUW0dfmIbJjWJmC7UTK38q8k/p33lxmc1iaZRgndLzN6qPqJrEKH7Ylvhzc
 NPOprikungLrmjTFbvy7AQwin7rc0dk6NiQ1QrgGjSo1nhzY3WXtJmqX4ZuS5N4H2XxHIn
 0cg0XpIhAdxafmXDyP5OCqvalcH4enM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-pI7dVh5YN4GlejlKafpEqQ-1; Tue, 11 Jul 2023 11:37:33 -0400
X-MC-Unique: pI7dVh5YN4GlejlKafpEqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbfc766a78so29712695e9.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 08:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089852; x=1691681852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBX3KMRDL+j9kGd79s3lBmaWqhN5Pi3Nld7WdspJqfE=;
 b=YK9x1i002q+GBNsKO3C90dsVp3Gd2d/trhgFfmdc6VUr9aIT/0Mf2pNUoeOHhkk1zl
 /pKEVNt91UiSwcQt6FQ455RRNaROKPfcRtTZnroBSUUyzklxjD0sQMpq9YKHn5Hw0f3y
 TXC+oEqz8LHFhPzG/w6asIWWcFw0iGsGqL9eAdFFtSEOYoqhOgM5js0sfMN2vBz8B5M8
 OZwUmT9ig/BYnKjKhiTCFE1QTU3/ZNQE0/ZToy7AjXVDF2GBeK9b1dsh9ZCTJfFsATcI
 yZDRf+eTEIPKhNA/xcQUBGnHBkDCo0AMzu4UmNE8jN5suWjBXmzeg3H4ETlhJ+YnEyg4
 1Ukw==
X-Gm-Message-State: ABy/qLZ0bLsp5SSeDGuIOt+yGC9UYLPGht5yFlqGuwtrNONiKJnyHPYE
 DpPC9DswMnJ7AK6B22vzuaA9/osMwLrl5y+Nkrm8zzEairbQahPXaP7VhpY/vjFJLUkt4He+tdT
 LVRuZna0s3VvV
X-Received: by 2002:a05:600c:378b:b0:3fb:ffa8:6d78 with SMTP id
 o11-20020a05600c378b00b003fbffa86d78mr11004913wmr.36.1689089851915; 
 Tue, 11 Jul 2023 08:37:31 -0700 (PDT)
X-Received: by 2002:a05:600c:378b:b0:3fb:ffa8:6d78 with SMTP id
 o11-20020a05600c378b00b003fbffa86d78mr11004895wmr.36.1689089851568; 
 Tue, 11 Jul 2023 08:37:31 -0700 (PDT)
Received: from redhat.com ([2.52.3.112]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b003fa96fe2bebsm2809870wmj.41.2023.07.11.08.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 08:37:30 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:37:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: Re: [PATCH v4 0/7] virtio-mem: Device unplug support
Message-ID: <20230711113716-mutt-send-email-mst@kernel.org>
References: <20230711153445.514112-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230711153445.514112-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gzq0ahJS5Lfe

On Tue, Jul 11, 2023 at 05:34:38PM +0200, David Hildenbrand wrote:
> One limitation of virtio-mem is that we cannot currently unplug virtio-mem
> devices that have all memory unplugged from the VM.
> 
> Let's properly handle forced unplug (as can be triggered by the VM) and
> add support for ordinary unplug (requests) of virtio-mem devices that are
> in a compatible state (no legacy mode, no plugged memory, no plug request).
> 
> Briefly tested on both, x86_64 and aarch64.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


feel free to merge.

> v3 -> v4:
> - "pc: Factor out (un)plug handling of virtio-md-pci devices"
>  -> Add stubs to fix arm64 compilation under mingw
> - Added Tested-by's
> 
> v2 -> v3:
> - "virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci"
>  -> Add MAINTAINERS entry
> 
> v1 -> v2:
> - Reduce code duplication and implement it in a cleaner way using a
>   new abstract virtio-md-pci parent class
> - "virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci"
>  -> Added, use a new aprent type like virtio-input-pci
> - "pc: Factor out (un)plug handling of virtio-md-pci devices"
>  -> Added, factor it cleanly out
> - "arm/virt: Use virtio-md-pci (un)plug functions"
>  -> Added, reduce code duplciation
> - "virtio-md-pci: Handle unplug of virtio based memory devices"
>  -> More generic without any device-specifics
> - "virtio-md-pci: Support unplug requests for compatible devices"
>  -> More generic without any device-specifics
> - "virtio-mem: Prepare for device unplug support"
>  -> Use callback, separated from virtio-mem-pci device change
> - "virtio-mem-pci: Device unplug support"
>  -> Use callback, separated from virtio-mem device change
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Mario Casquero <mcasquer@redhat.com>
> 
> David Hildenbrand (7):
>   virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci
>   pc: Factor out (un)plug handling of virtio-md-pci devices
>   arm/virt: Use virtio-md-pci (un)plug functions
>   virtio-md-pci: Handle unplug of virtio based memory devices
>   virtio-md-pci: Support unplug requests for compatible devices
>   virtio-mem: Prepare for device unplug support
>   virtio-mem-pci: Device unplug support
> 
>  MAINTAINERS                       |   7 ++
>  hw/arm/virt.c                     |  81 +++-------------
>  hw/i386/pc.c                      |  90 +++---------------
>  hw/virtio/Kconfig                 |   8 +-
>  hw/virtio/meson.build             |   1 +
>  hw/virtio/virtio-md-pci.c         | 151 ++++++++++++++++++++++++++++++
>  hw/virtio/virtio-mem-pci.c        |  54 +++++++++--
>  hw/virtio/virtio-mem-pci.h        |   6 +-
>  hw/virtio/virtio-mem.c            |  25 +++++
>  hw/virtio/virtio-pmem-pci.c       |   5 +-
>  hw/virtio/virtio-pmem-pci.h       |   6 +-
>  include/hw/virtio/virtio-md-pci.h |  44 +++++++++
>  include/hw/virtio/virtio-mem.h    |   1 +
>  stubs/meson.build                 |   1 +
>  stubs/virtio-md-pci.c             |  24 +++++
>  15 files changed, 337 insertions(+), 167 deletions(-)
>  create mode 100644 hw/virtio/virtio-md-pci.c
>  create mode 100644 include/hw/virtio/virtio-md-pci.h
>  create mode 100644 stubs/virtio-md-pci.c
> 
> -- 
> 2.41.0

