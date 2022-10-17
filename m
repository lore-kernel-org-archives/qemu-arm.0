Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2221874ejn;
        Mon, 17 Oct 2022 01:22:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7hmvS9PjOfg0pdALWf/XbHNVQ4sxjwevDsHG5BtBx6OGvtaLl3W7NYQe3lrkl+Q2p5YwZh
X-Received: by 2002:a05:620a:1523:b0:6ee:4780:4844 with SMTP id n3-20020a05620a152300b006ee47804844mr6932823qkk.700.1665994937731;
        Mon, 17 Oct 2022 01:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665994937; cv=none;
        d=google.com; s=arc-20160816;
        b=lLf2abetUV20o3hPcTe8Z4YSWNYt5DYFQ59SxyW4D1uuDIYLz5Lk8gUK92TjOI72r5
         3+qVkPtAGRksFEb9j/0QraCyoEA0lEdpQlQX6H/rU2uyz+ZBf96QDB7M1o+d7kgrnOqS
         HEM+jB+zmRlU4j5tLZFBgWuS3TkOkIq9y0TXUSF72tY+tNG4K0f2lXF3s/fqKsPYVljq
         yKJo6v+uh1n/gknNQa4DZ9BN27pslCiI2Xwonvwv97CQq6gqcOKv96dNx6K4PbBbtrdZ
         5aAm2kQ+JFlnF9SQ40sbetHRxk3nlbenruI3YHPwHV1NE6C+ZGCnqDISEPvigf5wiOHu
         tjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=Aa0XYyZUyNTchAB4/zY6yGvmDZvSZGzwEs6M+KGsT0I=;
        b=1DPSzGeNscwZn87NG27Cl2Gn2LQANNu4ll9XAi2KxHho0bgRZq5QA43qBUrCYvYeo0
         YCbUpNGODTAJI/fmgUoDvbNOXJfwoLQosNZ2xmyDb87LAjPYdmSEZdMO9kY2Q7O4zg+f
         rdz+YK5fEg/D3yLObFdVLgJF29rq26On3lnqNywTGAqgbMvvhK9AW52b/HmNdpnC9qKX
         JSbucMlsPN4HZIT0Fq+p1BfZVH/SV7xz/WsIgFbMLiFZytZt0uqGfB08+AOtQHhcd/Ke
         FUPa00INeDjk+DMHm07qhqh2sqdCJxEiBg2Wk8Dk5zCIf1Ix/ynjerAkJRZUxe3+HLmg
         e1Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a+RP2d0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a05620a258500b006ed8b22d71bsi5507257qko.748.2022.10.17.01.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 01:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a+RP2d0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okLO5-0007pi-4l
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 04:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1okLN2-0007lx-8o
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 04:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1okLMr-0000ze-QK
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 04:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665994860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aa0XYyZUyNTchAB4/zY6yGvmDZvSZGzwEs6M+KGsT0I=;
 b=a+RP2d0kN2SOsBRt5Fxc2ZI6xJGbGbd7YIUvdXGDbASU8N687L+e2FPzhy8cCJCliQ9jeg
 oui9/3knCj00Z3t8k0qW5F+Kwns1vVBCCJZfPyqCHgyCpK8RbXfRLStePoYyyYwDusqa4G
 YraOMJAYTLGrqtp16z0OiS1w7wv9meg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-RbPMmHxJPbuoCIhwYeCM-Q-1; Mon, 17 Oct 2022 04:19:34 -0400
X-MC-Unique: RbPMmHxJPbuoCIhwYeCM-Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 y7-20020a17090a134700b0020b1347568bso4117020pjf.7
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 01:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aa0XYyZUyNTchAB4/zY6yGvmDZvSZGzwEs6M+KGsT0I=;
 b=kDzztIh1Bozoi7Tq4yk3IJdt8SOfje1ifSQbS1wYPsfgZWd2QIqsP8beB3VmVHdsm6
 2yhcWjDhUAAbEQiFqipku4Pa8+AC1Q+gfVgJ4+xKmGo0E7qlI66Bz/pUs4+baQONwX9N
 JHGvg+zIPqwcLAQgH2Okd/cZgXjuNCfyeJe6IMPaTXBA8zMAQLifQ1HZ/gWqr64SalRk
 2nBPKqYsLJVEMHw6qtsFpX3aNIuKqSu7vQEuTdMHiOSO/elQZBO6SdU+1dDNM8u74Dro
 aWh+VucIadSpd+N2gImLHj3x2MgDV3sB4/brPZLASziPlF1W5fUK/+ZYh+T7RSAx875D
 d2ug==
X-Gm-Message-State: ACrzQf1qxEYU4zxmf+rZAJQLhhmmnwWMI0IGFXOc3BaF7HDaEzP08lmw
 acsPACSCBuZruq5wtYz41xTmJ0cq5/xbCeF+E5tnC0+1PEqNbBpiJdm2aLrnG+y+Scd7Y4Qnu8H
 20f/q8iVut1zZjPG4pTTxjpMUC/1U
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id
 u6-20020a170902a60600b0017857e4a0c1mr10694052plq.83.1665994773387; 
 Mon, 17 Oct 2022 01:19:33 -0700 (PDT)
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id
 u6-20020a170902a60600b0017857e4a0c1mr10694026plq.83.1665994772993; Mon, 17
 Oct 2022 01:19:32 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Oct 2022 01:19:32 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20221012163448.121368-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221012163448.121368-1-eric.auger@redhat.com>
Date: Mon, 17 Oct 2022 01:19:32 -0700
Message-ID: <CABJz62OCLNQqrYnenhZsH9KVk_OpExp5otDcS-RZ7dMDz5a_og@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/virtio-iommu-pci: Enforce the device is plugged
 on the root bus
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, jean-philippe@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: arqV9d8u7N1Q

On Wed, Oct 12, 2022 at 12:34:48PM -0400, Eric Auger wrote:
> In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
> topology and as long as the dt/acpi info are properly built this should
> work. However at the moment we fail to do that because the
> virtio-iommu-pci BDF is not computed at plug time and in that case
> vms->virtio_iommu_bdf gets an incorrect value.
>
> For instance if the virtio-iommu-pci is plugged onto a pcie root port
> and the virtio-iommu protects a virtio-block-pci device the guest does
> not boot.
>
> So let's do not pretend we do support this case and fail the initialize()
> if we detect the virtio-iommu-pci is plugged anywhere else than on the
> root bus. Anyway this ability is not needed.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

FYI libvirt will already reject any attempts to place the device
anywhere but directly on pcie.0, so from our point of view merging
this patch is perfectly fine.

-- 
Andrea Bolognani / Red Hat / Virtualization

