Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp434746lfm;
        Wed, 24 Jun 2020 06:49:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAaGibnJcESFalqLtrFeae5fnFP3CYgAJ1MobtHxmu82Dxf+zNoMNZmRjuWjjfLBagiXkK
X-Received: by 2002:a25:4cc6:: with SMTP id z189mr42506433yba.153.1593006567974;
        Wed, 24 Jun 2020 06:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593006567; cv=none;
        d=google.com; s=arc-20160816;
        b=HC8oBGX8j/rQvLIXW+rqHJKuPc8tv7AInBa2UYv67sOMdulLVEzlX8ae9zyUv6qhMU
         JQ1Nd4vWvsC3GWEaLRINfVzo0WNQir2C0A9RWzFgx5dUjb+T7J3uhQup8tdPon/RnKVj
         eY9lO8RPl5S8DXpymByBnbPsDJB1phIYyOv9prSn5tIcihcnhIFxDbYn0EXnKoI1hSLB
         hm3yPhqOkotGRUDioJMtSAqYSqWjkSOqdyI17PhvMN5eloia/aFYfipdTsFUY4AsEfUz
         rvH1P4AxdBQKVbzqObW7k5H5mJour7qZjKjmYnbo6Lp9oTJlX3Ykpf3IGbuCbVJwtPZ9
         rCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QvkNWk5+sDNjcLWQTCoB546+AqfVB2tWU7hl+BStmuU=;
        b=U+GlvGeRj2vhF51XyZe2UdhQIgRY0EtsUCAhYzCkzW6rfR99boIfWh3uYrZFOyZKn4
         nV443Z0EfRdtU/DbwzLH7Pyp82b8lnUmjJg+U2fElm4kK38Io+ev399SN/LJNXdaRPMM
         8gEezbEWhRczsrd8glW74uLhhWRko/+BX0J4Hx+VvKli2yI5nMx8Itsd6e3tIuzTBWjd
         4UeSecjOS4Tn37PZqgarKT8Lq5DZdnzLF6y7Pnt5VE94NVIr7DNGVRM/TcxkPAarnHTm
         C4YwL6WT8tgAapxltZfpyDO/AZC5UCzhNdswcvKZP82zPhLwThjE8nVKldt4i8v03eeO
         oKyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aAkdzGKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si18201092ybd.161.2020.06.24.06.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 06:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aAkdzGKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo5mJ-0000Ex-Bo
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 09:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jo5l6-0008Cg-53
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:48:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41674
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jo5l3-0002lz-7q
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593006488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QvkNWk5+sDNjcLWQTCoB546+AqfVB2tWU7hl+BStmuU=;
 b=aAkdzGKU1XkVuT6mkY4DOgRXDu1C6+e2+Wmvu8Xynabi+1/T09NSPTxe6bFMPKB7hvE/as
 +6NptVzpQUPOPQQHltF0GOP0ZRxmVTciAw5bUfWzCcTazG169I2cLK+uilSdi5CPlkgTjG
 bggCtvxmMOg6iEtfztnrQ88es0zP8+M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-L2b1KFZDPsa8BqNNb7Jp_g-1; Wed, 24 Jun 2020 09:48:07 -0400
X-MC-Unique: L2b1KFZDPsa8BqNNb7Jp_g-1
Received: by mail-wr1-f71.google.com with SMTP id y16so2941202wrr.20
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2020 06:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QvkNWk5+sDNjcLWQTCoB546+AqfVB2tWU7hl+BStmuU=;
 b=FfErsjNwsD90EfUD7zfYRaODIRQyfRZm1MZx4oe/lKNG3seEtfJikJqGTU/TLh2Ky5
 m00eQWBP2OfmJ/fy3Vhqj4EvW23c76Bx8QSJBaTLG3ZPgjoPDzUSWUnyQ6vgPib4R6Gx
 7azJMB19DO5vQMcE1eZYpI9VJo80WtGfwfUZ1JplYFwSLlfX/1OaLdkCfp8YVFZY4CA/
 16X8So8K1Rvt/wLLioGy9dAvDKgXPPvNZtEvaCreRLUen5QFpC1u8h7hWVNCv2zqfKcR
 8qZ8RAHpRn6brAfuJO05MexvBomJDMuXxdhstUlbWccWUEsO2XMaRrgweyuSRRvNNF2f
 yP3g==
X-Gm-Message-State: AOAM531OHG439Qh/yO4KeN3GAWf+IXE4Sqjt/eOEMtYU2D0HgpKTRhqr
 sL64r4S3YEg7SVujIerPZBxlZlRGlxf+ScBTvIg6Hfrk1d3Ru3ljNwXarMLB0x6STr/BFtgexl/
 m2rB4u76zBZqX
X-Received: by 2002:a1c:9802:: with SMTP id a2mr28580858wme.64.1593006483088; 
 Wed, 24 Jun 2020 06:48:03 -0700 (PDT)
X-Received: by 2002:a1c:9802:: with SMTP id a2mr28580823wme.64.1593006482818; 
 Wed, 24 Jun 2020 06:48:02 -0700 (PDT)
Received: from redhat.com ([82.166.20.53])
 by smtp.gmail.com with ESMTPSA id n8sm23986121wrj.44.2020.06.24.06.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 06:48:02 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:47:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
Message-ID: <20200624094510-mutt-send-email-mst@kernel.org>
References: <20200624132625.27453-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200624132625.27453-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: upwHDXr032HG

On Wed, Jun 24, 2020 at 03:26:20PM +0200, Eric Auger wrote:
> By default the virtio-iommu translates MSI transactions. This
> behavior is inherited from ARM SMMU. However the virt machine
> code knows where the MSI doorbells are, so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest iommu subsystem will not need to map MSIs.
> This setup will simplify the VFIO integration.
> 
> In this series, the ITS or GICV2M doorbells are declared as
> HW MSI regions to be bypassed by the VIRTIO-IOMMU.


> This also paves the way to the x86 integration where the MSI
> region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> machine.  However this will be handled in a separate series
> when not-DT support gets resolved.

What's going on with that btw?
I think the next step is to put the spec up for virtio tc vote,
then we can merge that, right? acpi parts will need to be
ratified by the acpi sig.

> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v5
> 
> History:
> 
> v4 -> v5:
> - Take into account some additional comments from Markus:
>   - reserved region type becomes an unsigned + some comment/desc
>     rewording
>   - assert if the type is not RESERVED or MSI
> 
> v3 -> v4:
> - collected Jean and markus's R-bs
> - tool into account all Markus' comments in [1/5] (except removal of
>   goto)
> - use ':' as delimitor instead of commas
> - add example in 4/5 commit message as suggested by Markus
> 
> v2 -> v3:
> - Introduce VIRT_MSI_CTRL_NONE in VirtMSIControllerType
> - do not fill the remainder of the probe buffer
> 
> v1 -> v2:
> - check which MSI controller is in use and advertise the
>   corresponding MSI doorbell
> - managed for both ITS and GICv2M
> - various fixes spotted by Peter and Jean-Philippe, see
>   individual logs
> 
> v1: Most of those patches were respinned from
>   [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
>   except the last one which is new
> 
> 
> Eric Auger (5):
>   qdev: Introduce DEFINE_PROP_RESERVED_REGION
>   virtio-iommu: Implement RESV_MEM probe request
>   virtio-iommu: Handle reserved regions in the translation process
>   virtio-iommu-pci: Add array of Interval properties
>   hw/arm/virt: Let the virtio-iommu bypass MSIs
> 
>  include/exec/memory.h            |   6 ++
>  include/hw/arm/virt.h            |   7 ++
>  include/hw/qdev-properties.h     |   3 +
>  include/hw/virtio/virtio-iommu.h |   2 +
>  include/qemu/typedefs.h          |   1 +
>  hw/arm/virt.c                    |  18 +++++
>  hw/core/qdev-properties.c        |  89 ++++++++++++++++++++++++
>  hw/virtio/virtio-iommu-pci.c     |   3 +
>  hw/virtio/virtio-iommu.c         | 112 +++++++++++++++++++++++++++++--
>  hw/virtio/trace-events           |   1 +
>  10 files changed, 238 insertions(+), 4 deletions(-)
> 
> -- 
> 2.20.1

