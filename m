Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp847282ejb;
        Thu, 22 Jun 2023 22:59:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6N2GqitbD2nIhkZS2eQNFnBjSVWGRDuUUZ+1Il4ik0jmphEZJ7V4xMN82FZlx/B9zgiygh
X-Received: by 2002:a05:622a:1a9a:b0:3f9:b187:9c63 with SMTP id s26-20020a05622a1a9a00b003f9b1879c63mr28834382qtc.12.1687499972850;
        Thu, 22 Jun 2023 22:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687499972; cv=none;
        d=google.com; s=arc-20160816;
        b=RWvfPpWxTie5b7DbicarmBwm3c/MbnQH7F0ZGPpe3D3KeBsD2dUEPbpUzsws9XdmoE
         r0lI7Xv4eGTJMfTbjqX0uUk9/fIU9/Bb899+xXs0eGNaN+MP5lY9ayR6eAeTNzqarpWE
         HGMUc8Z+Jm7I+AI3ruvXUB/2Pyr0u0xEQW0faCFsMLXlZpRRmIwQJMH2pRxcyfvtmJWS
         eao4ai6nZKxCHjeNcQ/Rpf8KIQFsjcvf8x5lZ2E37cDBqHR+BtUMNbkHgeYrTcUhcP+e
         C0pNmmn8KH1I+a6py9McE9N/HfyKDMxgl28m24F7CTBXRXdCXja5LwyA2gNcsDEtCojT
         658w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=s0rg4toHcIOekD0NUmSceylkzCBwF+0TVsgA23XXFhU=;
        b=q7nMZZhffXq9zqQ61e3nLhsfEgEsIgdsWf98DPVxZPnGxgjXqHyby2/fwTRJWti8oZ
         KRha/FkvmSUP2h6nvc9TaYIbiTo72UB9ZXaiZkTbNKiwxBrrLXBNBc188ph2s36F3SFJ
         YVAduWgAHi8YtTOHkL9vSGkz4EDvMfRFRKgeBOUnk02U5gczw4yKTxh124idEIOEYowy
         GVFRtbszGC9CqyPlpg8Maa3hVDThoGKK2s0iAFj4BEdSWKg3J5rrsU59OPfmFyJ2l6gr
         vpeujEt/n8WKqjdK2t74TKGV9GlSeMlimJQoNOlKcTvq1ag0G9hBjQqz8DHaLmVY5SGo
         LVYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHj4DFSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac8598b000000b003f0a4a28477si3174968qte.79.2023.06.22.22.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 22:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHj4DFSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCZpA-0003x2-9T; Fri, 23 Jun 2023 01:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCZp5-0003wF-HN
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 01:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCZp3-0006nF-SW
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 01:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687499945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0rg4toHcIOekD0NUmSceylkzCBwF+0TVsgA23XXFhU=;
 b=dHj4DFSuE/6zlw9n+egkUcGukNBGOLgTBqkK6MCUVyic/O0UNugTp/wjgu9IlhKk3Q2CKE
 /3H2WH4WmL+40XvWuIU0qU7wLU5jGiLS508arYP2XHKXOx7KksgdnSZk5E6qW+1wCN/iTh
 Vn66EWz/MXj4J+22JkzUzDfTWy4pL2g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-n98rAoerOf-1pMm8f_lssA-1; Fri, 23 Jun 2023 01:59:01 -0400
X-MC-Unique: n98rAoerOf-1pMm8f_lssA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31283f4d22fso130651f8f.2
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 22:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687499941; x=1690091941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0rg4toHcIOekD0NUmSceylkzCBwF+0TVsgA23XXFhU=;
 b=cfpgR0eFOLjnBjvCNm3tk1+vY7xQvtM6TPQ6qbC4zs+mculq/sEBIq+1s//hxwibCF
 u7NH33SJnWPEAHpDtLE0XevUitm3wzdnbHkaJFuqoxkwKkDq2ScXkhx8l9pWzzFSbgAY
 xKNCKuwaPP9gdM/Uac+B3RHuBZE8ehtOE0Pa33mYN44SwMjaf+EGYFZasU7pA+cJeY5n
 g2nTfjthc2FNR0Hlzju7pV5+6WG9k1JfSD/da82gJ3w+eoggoV1BD3mJmawzz0RmH+r+
 JXe8NequTCZD8VNFRcTI5+dpcZ0X8dsRdqRHQ7mpkoR0AdtZaegr99egmyNsc+rpkVa9
 B8VA==
X-Gm-Message-State: AC+VfDyUUenk1YnfXRUQidpG2rQ7JlnmL/PHqysHlracbuxzjkWHhZma
 Rh985NjesahAcBSlChoCGIZN/sRdUp78hFbTn4xs+X0Jb90bvfurhWmrQK9BIrry9SgaAM49qLi
 zBu9BFThvzif+
X-Received: by 2002:a5d:44c6:0:b0:30f:c7f1:30e9 with SMTP id
 z6-20020a5d44c6000000b0030fc7f130e9mr15752994wrr.5.1687499940879; 
 Thu, 22 Jun 2023 22:59:00 -0700 (PDT)
X-Received: by 2002:a5d:44c6:0:b0:30f:c7f1:30e9 with SMTP id
 z6-20020a5d44c6000000b0030fc7f130e9mr15752985wrr.5.1687499940623; 
 Thu, 22 Jun 2023 22:59:00 -0700 (PDT)
Received: from redhat.com ([2.52.149.110]) by smtp.gmail.com with ESMTPSA id
 p8-20020adfe608000000b0030ae849c70csm8659216wrm.37.2023.06.22.22.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 22:58:59 -0700 (PDT)
Date: Fri, 23 Jun 2023 01:58:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v1 0/5] virtio-mem: Device unplug support
Message-ID: <20230623015740-mutt-send-email-mst@kernel.org>
References: <20230613150210.449406-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230613150210.449406-1-david@redhat.com>
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
X-TUID: Sd+pLR/FrCXL

On Tue, Jun 13, 2023 at 05:02:05PM +0200, David Hildenbrand wrote:
> One limitation of virtio-mem is that we cannot currently unplug virtio-mem
> devices that have all memory unplugged from the VM.
> 
> Let's properly handle forced unplug (as can be triggered by the VM) and
> add support for ordinary unplug (requests) of virtio-mem devices that are
> in a compatible state (no legacy mode, no plugged memory, no plug request).
> 
> Briefly tested on both, x86_64 and aarch64.
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

Lots of duplication pc/arm. Which is not new but do we have to keep
growing this?  Can't we put at least the new common code somewhere?

What do ARM maintainers think about it?


> David Hildenbrand (5):
>   pc: Properly handle unplug of virtio based memory devices
>   arm/virt: Properly handle unplug of virtio based memory devices
>   virtio-mem: Prepare for unplug support of virtio-mem-pci devices
>   pc: Support unplug of virtio-mem-pci devices
>   arm/virt: Support unplug of virtio-mem-pci devices
> 
>  hw/arm/virt.c                  | 60 +++++++++++++++++++++++++++++--
>  hw/i386/pc.c                   | 66 ++++++++++++++++++++++++++++++----
>  hw/virtio/virtio-mem-pci.c     | 42 ++++++++++++++++++++--
>  hw/virtio/virtio-mem-pci.h     |  2 ++
>  hw/virtio/virtio-mem.c         | 24 +++++++++++++
>  include/hw/virtio/virtio-mem.h |  2 ++
>  6 files changed, 183 insertions(+), 13 deletions(-)
> 
> -- 
> 2.40.1

