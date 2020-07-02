Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1386064lfm;
        Thu, 2 Jul 2020 04:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF3+LUwy18rFold2nEtA9iC9wv5Svtp0iCWqYpSBOou0lviMfg5ZDllDnn19f2X9q4XXtI
X-Received: by 2002:a25:d6c1:: with SMTP id n184mr48724824ybg.303.1593689322378;
        Thu, 02 Jul 2020 04:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593689322; cv=none;
        d=google.com; s=arc-20160816;
        b=Db3zIEnfWl9uodc+EJM+uX0LMK1sPvm0Slb5zbx17yhCsNyCxjQ6mvg9qTOsdSXWE1
         /dK/L3EJ4TEK0IcOA9/HGQ2RPpBYsa/TQAr1p6dO4X5YEFUickU6YEgUpiLMoWfWSDTN
         oTEsTAUcs+FWKi+4ntKDBBt7FZnrOR4pZR3Cvn7t7aKvDySJ6ykmY6AMXqRBwdx0M95l
         duxvP4KT+gw43LtV6CHdvszXU1xu/m1ryjKr4Myh4NJQ0YcYUG5iWaOzH6n7+CGPgV+E
         3ZcESR8jBSo9Kaiwb8kNlO1moByjVv4J0NgOj+bow5id6bO5/+h2EGuYjLfY8atI59Kh
         xxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1GGrre2I4L7gxuhQn9Ve3HFQ9FQ6Kly7mSNdn0HGAPs=;
        b=TROyi2TOBh0bDAX+/EAi632FZUWCi3Jr3+kzVzkMN7FXV9V+VV6viP8xHuBr7hXaOs
         WdvxJaICP3wydI/8hHEe51JcvPtTp91KcRT2sc0qmXLQV1z7IUEeP4Z3hB1EUBhqNfW4
         v/gishzo0JS4bkA0GcgBiUmN0Vq9BmM6FmEKX8RDoVQVu2Bc/3EinTtLR+vqYAnBiMM4
         fL+wgBMzeHNAnhvkFXZdocCT5+Pt2HS5IYYYf/n9lKSm03CL9srDw6IYRv9MsOPp/tix
         Bn8LVdG9ES0+1aroWecgjZS1NvasiGC/cEMZgufANwEmbm1uKFJTeCn3m4qpRGg/Y/Rh
         FqYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flsQU3al;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si8843578ybi.147.2020.07.02.04.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 04:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flsQU3al;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqxOT-0007CG-LG
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 07:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqxFq-0006u9-MX
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:19:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30481
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jqxFn-00053J-NE
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GGrre2I4L7gxuhQn9Ve3HFQ9FQ6Kly7mSNdn0HGAPs=;
 b=flsQU3al2IsbfDz6DLlDwlkGuvT58TRY2FxsCKx7qN+YRtl/iQ9XXNkw9AY/YRZfMEt1cx
 2Lz5zrZpd74TsiX8xoxSAqUsoeooEbQsUtdyXljzr4Bkg7f3RVDj/jgP3HGtSKp4grHNVn
 pT+35vgGCtvKU1VDkUeSLiZQjZj0AkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Xx6HiP5UN4C-zZTbuSLWwQ-1; Thu, 02 Jul 2020 07:19:38 -0400
X-MC-Unique: Xx6HiP5UN4C-zZTbuSLWwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91707100CCC2;
 Thu,  2 Jul 2020 11:19:37 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E76619C66;
 Thu,  2 Jul 2020 11:19:29 +0000 (UTC)
Subject: Re: [PATCH v7 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, armbru@redhat.com,
 pbonzini@redhat.com, jean-philippe@linaro.org, bbhushan2@marvell.com,
 peterx@redhat.com
References: <20200629070404.10969-1-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <98ffd178-6240-2703-e305-730b288c791c@redhat.com>
Date: Thu, 2 Jul 2020 13:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200629070404.10969-1-eric.auger@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lqjynCqkI+cR

Hi,

On 6/29/20 9:03 AM, Eric Auger wrote:
> By default the virtio-iommu translates MSI transactions. This
> behavior is inherited from ARM SMMU. However the virt machine
> code knows where the MSI doorbells are, so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest iommu subsystem will not need to map MSIs.
> This setup will simplify the VFIO integration.
> 
> In this series, the ITS or GICV2M doorbells are declared as
> HW MSI regions to be bypassed by the VIRTIO-IOMMU.
> 
> This also paves the way to the x86 integration where the MSI
> region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> machine.  However this will be handled in a separate series
> when not-DT support gets resolved.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v7

A gentle reminder to make sure this series does not get forgotten before
the freeze.

Best Regards

Eric
> 
> History:
> 
> v6 -> v7:
> - fix the hint message
> - put the assert again on probe request
> 
> v5 -> v6:
> - do not hardcode start/end addresses of doorbells
> - check reserved region type on realize()
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
>  hw/arm/virt.c                    |  30 ++++++++
>  hw/core/qdev-properties.c        |  89 ++++++++++++++++++++++++
>  hw/virtio/virtio-iommu-pci.c     |  11 +++
>  hw/virtio/virtio-iommu.c         | 114 +++++++++++++++++++++++++++++--
>  hw/virtio/trace-events           |   1 +
>  10 files changed, 260 insertions(+), 4 deletions(-)
> 

