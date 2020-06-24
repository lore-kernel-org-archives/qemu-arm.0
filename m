Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp498893lfm;
        Wed, 24 Jun 2020 08:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXcxpc3lLfOXlWGxSalYRqjXv5fDx7NVD9GLsIqv8a9rXN7TfHYVKMuEnIVbNl5dVeVVm7
X-Received: by 2002:a25:7a06:: with SMTP id v6mr46151836ybc.152.1593011827418;
        Wed, 24 Jun 2020 08:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593011827; cv=none;
        d=google.com; s=arc-20160816;
        b=LhHBiPDJw3HPnUpY+NZjilYKJnQk1tFCjScYOvtRbdHFJqDhQCETYd5Hqtzrl3bNb4
         kn6tuyJDchCpshidRGG+D3A4B3V7PSQI21cdjKltGG8fwD6fdiQaeLOfkhlRtFOMI040
         6KdpKhCcZb78KAP+ksXZBA0lxdHuhb4EUbFp1q/cCRR3YolXdnNShiBazThh3xWxpAnq
         FOTdm7DWavXzKdGGDoqyZDNlOy6WEXMnyt2AJGDp8qm0hfiyw3Ks4xsPFz+QqbUc7z5s
         XKQHIxon0zrufKGL6ZXP63IDnyJ7FgF11Gaqk29vK02/YfeyDoLEAQY1FfriJTWSS3z4
         3gEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OXF8hF1OIIcBhPCW44xt8ui/Pt3p7jUHb6xTAexUjw0=;
        b=NPooEMe4Kkc4w/cFw7oHLkBVds9LUfk3r6hyCE0NF5dAIynmk7robMkzo3gjHYFavq
         6CKicSexPmhz5pflhaA66X8J2ZYQDfY04/ocFnaJS7G+Rlirnnikh6uWe9s0FcDQ8sGp
         mFNLh5BiUBDC+zIS6+ztkxFxO47HkutATFqMuIKfThfKmX6WM7Wg1VBart7ziPGZZB/0
         E6qLHlXuAYMYWTe7TDEU4NpB1kuIR8kVghw82BwxPgYwjtHJIX47YwnLZbEH3O0gwCmN
         v9LgXip71vCBWI5SRbjCrdWWXkJZBTWk7QHKMOJnh/js1WAaik6rQrTimtHHzbXUBBgV
         cecg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dFUdOEip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si20210484ybc.177.2020.06.24.08.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 08:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dFUdOEip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo798-000706-SA
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 11:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jo791-0006zq-Ah
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 11:16:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24314
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jo78z-0003fN-Cm
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 11:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593011816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXF8hF1OIIcBhPCW44xt8ui/Pt3p7jUHb6xTAexUjw0=;
 b=dFUdOEipS9GSeKfhoZqdN0R1sYANjhJO20vQ6sj5kUzdlgcvoIa6vUCd14EpccXOLugbSN
 U99YlYJjCwOT1Q+NcKc5wtU9Zct0bDUOLUAD0CQ+4HllquxPN/dac0g9A2tFh5eWXbIm2W
 I0gulOo7tsXFIx90i60YEmZ1oipfQdg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Gq0fwRaDMey1c5EGL1InAw-1; Wed, 24 Jun 2020 11:16:53 -0400
X-MC-Unique: Gq0fwRaDMey1c5EGL1InAw-1
Received: by mail-wr1-f69.google.com with SMTP id p10so3078141wrn.19
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2020 08:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OXF8hF1OIIcBhPCW44xt8ui/Pt3p7jUHb6xTAexUjw0=;
 b=RlfKrX6KLyO21LAoSZv8yCXTypVklMbULPVdbY3r+4BFCUa9wwGiG6NnYk5ibtAA2t
 2JER2dJ00IYu+Opw3ELlUqyAfyvuUvHmktr332ndTfJ27nlveHpdkXe6Sd9MpXI9yxry
 EE2lSHkuiTmfd0Z3xO3mGQG//X7pwEq9WUYXARqcsnOr8MQT7FrFT6Hw6SgMPUhbzAMt
 aV6dTpxcK0D44S0xFEKZRyoDu2P3U1BZmQHFIlUBX05sM9pNhwCWVJiJNViwRsSVAe6x
 CmcD4JMm2TBsKVYqIN/W6UsCFZ4gCsCbamGtIICyQorll8h/xP3EyUxOp+R91wwW3B53
 jiFA==
X-Gm-Message-State: AOAM532e+Y184ODhUbvRBJl6NilIpWyjz0Vwe9fFzDODw3JXSnL0SQ73
 TJUiuugncsvzAFKy35iJ5ydwacqor5uQYU7zOY2EsllsqoRdojnb0bqFd3zG5vw4K1IJUzbYDlC
 NrWGCz2ooLk2Q
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr30192344wrp.378.1593011811902; 
 Wed, 24 Jun 2020 08:16:51 -0700 (PDT)
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr30192314wrp.378.1593011811630; 
 Wed, 24 Jun 2020 08:16:51 -0700 (PDT)
Received: from redhat.com ([82.166.20.53])
 by smtp.gmail.com with ESMTPSA id a16sm26728208wrx.8.2020.06.24.08.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:16:50 -0700 (PDT)
Date: Wed, 24 Jun 2020 11:16:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
Message-ID: <20200624111624-mutt-send-email-mst@kernel.org>
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
X-TUID: CvHYwbzx+SrT

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
> 
> This also paves the way to the x86 integration where the MSI
> region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> machine.  However this will be handled in a separate series
> when not-DT support gets resolved.
> 
> Best Regards
> 
> Eric


Virtio bits look OK:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Who's merging this? ARM tree?

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

