Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp200883lfm;
        Fri, 26 Jun 2020 00:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoDPkBNEDfMotgzTzD6vBX58vcK43lgCZTstHIHzp8+B44dVgmdtOe7xQRK9ei6g1M7hL7
X-Received: by 2002:a25:44e:: with SMTP id 75mr3194721ybe.388.1593158202211;
        Fri, 26 Jun 2020 00:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593158202; cv=none;
        d=google.com; s=arc-20160816;
        b=f+71W/fvAEOA7gvLPUqFQhi65G3w3oFxzFxr7Qeqj7tmuuSQHn5iH12WUlwn4aRKGj
         HhJ8uRs9E3uFHzKL7k31niUA1cYEbc9+QPYd12iXbbKPHryb7gv/PBqMVd/+VZ/rJ3sn
         YrsE7aIESOvu6yCFl495yBR+lDfT/Bh8/2GzqP209Mo7R4maofGj4Ls7G0mxVlP9TM6U
         oMRfh0+q+UrIYhZaDcgLPWJ7C5uwod8j/94hDP0YA9yIsScgLvENnQQjpQt0KuXMHwmJ
         7Ajpe8ujyuB0rAufAXu1niKU84NZzIiQnaKYwItvNXgMUKsZis70a9Yvj2C2kRy3Hcwh
         xLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5u38E07NF7bGvPjr2vXllrKTrw+iDRsVFyrwFK7ZHfU=;
        b=ZDLHmnJp5lrcedE0g8tVDYE5O53oeSUkD38DldQwWbi5QvCDa0VBKM328xhbNuMC6H
         MXkJEU/1EHnOE1OFJeZXzh74q2dEGX6iq/V1P3K4y/BojxF0FjURg+6NyUqVmfVA+YL1
         clxJjaP8eaW0Bgev8nADMiDYVvfBAqv1YpzH0HbQsYTNI3DvMjBpuFS89Bn1WVQp2DCa
         CgMjKL1txvDYK7Y+f8kFj2VbprgnpgWq1SjkQhGWFxFzK1SpZkhGhBX1RkAVpA9bw3PG
         drPves/JN483KO6L2D6riBP7SH1pFADofP/88z0v4xUJV4zFhpzrXFsBH1O47oDDsVYp
         jo0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rnCmcQBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s74si24536977ybc.74.2020.06.26.00.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 00:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rnCmcQBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jojE1-0004NF-HB
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 03:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jojDu-0004Mr-Nv
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 03:56:34 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jojDs-0002y3-KT
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 03:56:34 -0400
Received: by mail-ed1-x542.google.com with SMTP id t21so6181185edr.12
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5u38E07NF7bGvPjr2vXllrKTrw+iDRsVFyrwFK7ZHfU=;
 b=rnCmcQBhVXmVjtSg3Ol6m05Ay4NgC77nXEUFVFrBudysDaL+3hjFO5X2aDSnoLCIfh
 JA0sETdJLDkpPGqvB1Nq4M25ztBBjgQwWrKVtnkNrkZ4MbqGhz3XUtqAJXdNAza9x3/a
 vSkZS8ZCenUR0Wx8+qDC7hf9PkCRh5de/ne1/ftpVkQ8crYonp3nAbkj/zwtzn1Z95Et
 Tbf3UGWmw9zssQmdIonQoWFQ5GbwNsPJAEopRmTj6nt+TZacFrCV4oUxEEyhVAZVV1HH
 PywqS+q06O5cx5cK590K3+mNqe4LWnEsSB0gTZNK+0y3n/Y17MgsUMMy0fIGYMfz8T39
 l+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5u38E07NF7bGvPjr2vXllrKTrw+iDRsVFyrwFK7ZHfU=;
 b=ZqtxNVKAV/vufDP4Tap9NcYEbJW1yTQiA9yddKiug9TlGxpI6xK2Y1akkxiRsbC2qE
 1ayxz0lBcKKhoQFCEsjYZjESGxdl0kNZFktcYaafCEXxypWtlD8MnaUDkgPgtIivrZb6
 zaka8FqZ0fnTeNpoL/eGfeTKU6yscaMew8L9EEMT6BQ6BTQn91Sqrui57l2NpiyONyRa
 948iQQENAFD2O80vKB5Wr8u1hSDSNeyIXcf1gQLzKUpWgKZ3mwR/wR/iBXR66OKgKNrg
 VEUzx3NXwB0ZB1MDrO71dFjRnARnwsjOx42bPYrRquuVhRGXf+x+/VRj6N8VuivGuAd2
 gKEA==
X-Gm-Message-State: AOAM532/fsdhPrGpGG5x7vRnIJlKaKCUdWmrF8eORpjEDYBQgLxOfeoE
 JaE1vv1Mx6APUAr+mpM1Rt+HCA==
X-Received: by 2002:a50:ee84:: with SMTP id f4mr2016506edr.183.1593158190313; 
 Fri, 26 Jun 2020 00:56:30 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n16sm9714204ejo.54.2020.06.26.00.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 00:56:29 -0700 (PDT)
Date: Fri, 26 Jun 2020 09:56:17 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
Message-ID: <20200626075617.GB2107508@myrica>
References: <20200624132625.27453-1-eric.auger@redhat.com>
 <20200624094510-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624094510-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kXg9suv88d3I

On Wed, Jun 24, 2020 at 09:47:59AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 24, 2020 at 03:26:20PM +0200, Eric Auger wrote:
> > By default the virtio-iommu translates MSI transactions. This
> > behavior is inherited from ARM SMMU. However the virt machine
> > code knows where the MSI doorbells are, so we can easily
> > declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> > setting the guest iommu subsystem will not need to map MSIs.
> > This setup will simplify the VFIO integration.
> > 
> > In this series, the ITS or GICV2M doorbells are declared as
> > HW MSI regions to be bypassed by the VIRTIO-IOMMU.
> 
> 
> > This also paves the way to the x86 integration where the MSI
> > region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> > machine.  However this will be handled in a separate series
> > when not-DT support gets resolved.
> 
> What's going on with that btw?
> I think the next step is to put the spec up for virtio tc vote,
> then we can merge that, right? acpi parts will need to be
> ratified by the acpi sig.

Yes I'm being unreasonably slow on this. I'll look at both the virtio spec
and ACPI after coming back from Holiday in July. I'm afraid the situation
for the built-in description will be the same on the Linux side (asked to
use ACPI instead), but it's worth retrying as we have some progress on
ACPI support.

Thanks,
Jean

> 
> > Best Regards
> > 
> > Eric
> > 
> > This series can be found at:
> > https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v5
> > 
> > History:
> > 
> > v4 -> v5:
> > - Take into account some additional comments from Markus:
> >   - reserved region type becomes an unsigned + some comment/desc
> >     rewording
> >   - assert if the type is not RESERVED or MSI
> > 
> > v3 -> v4:
> > - collected Jean and markus's R-bs
> > - tool into account all Markus' comments in [1/5] (except removal of
> >   goto)
> > - use ':' as delimitor instead of commas
> > - add example in 4/5 commit message as suggested by Markus
> > 
> > v2 -> v3:
> > - Introduce VIRT_MSI_CTRL_NONE in VirtMSIControllerType
> > - do not fill the remainder of the probe buffer
> > 
> > v1 -> v2:
> > - check which MSI controller is in use and advertise the
> >   corresponding MSI doorbell
> > - managed for both ITS and GICv2M
> > - various fixes spotted by Peter and Jean-Philippe, see
> >   individual logs
> > 
> > v1: Most of those patches were respinned from
> >   [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
> >   except the last one which is new
> > 
> > 
> > Eric Auger (5):
> >   qdev: Introduce DEFINE_PROP_RESERVED_REGION
> >   virtio-iommu: Implement RESV_MEM probe request
> >   virtio-iommu: Handle reserved regions in the translation process
> >   virtio-iommu-pci: Add array of Interval properties
> >   hw/arm/virt: Let the virtio-iommu bypass MSIs
> > 
> >  include/exec/memory.h            |   6 ++
> >  include/hw/arm/virt.h            |   7 ++
> >  include/hw/qdev-properties.h     |   3 +
> >  include/hw/virtio/virtio-iommu.h |   2 +
> >  include/qemu/typedefs.h          |   1 +
> >  hw/arm/virt.c                    |  18 +++++
> >  hw/core/qdev-properties.c        |  89 ++++++++++++++++++++++++
> >  hw/virtio/virtio-iommu-pci.c     |   3 +
> >  hw/virtio/virtio-iommu.c         | 112 +++++++++++++++++++++++++++++--
> >  hw/virtio/trace-events           |   1 +
> >  10 files changed, 238 insertions(+), 4 deletions(-)
> > 
> > -- 
> > 2.20.1
> 
