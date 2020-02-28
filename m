Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp455423lfg;
        Fri, 28 Feb 2020 01:36:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6sGrs77d3BB/oIczF/Vi36j9C6EmQaucV1xa0svYLEEbMoIxh+8LFphdNMT0m5EuYmK/Q
X-Received: by 2002:a37:aac4:: with SMTP id t187mr3889249qke.258.1582882617292;
        Fri, 28 Feb 2020 01:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582882617; cv=none;
        d=google.com; s=arc-20160816;
        b=uhyZuhZWz8hzxzPaS2/+/BqFqHKxlZG/oAj9NfvohmLSW9DqEfmTNc0XkbbcAd1bAL
         Au+HEZ0IBwI7kuJ8xJP1VK/nntaivenlCptaJA5T6YstPRkZ8c5IrdQrdH8kg0//EDuE
         Hka31puAXsp++BUmDbPQYoJ5nxlUnM6ZL/8nC+tB1jHR5h+cUQ/irf3MqfY1mIgbZ3+O
         RmVJvDaQgEeJir6g3H3tdvk7HPu9YF0ZIggSZbnd785XElWt1v7fSZKxKUDRyqYQl0rI
         NmnU2VGIXLBcQVMV8smUC7i1tFWgNs0ilB+f4IkeCAPycianwdZhIJIpp7acnFpDhjcI
         RerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HP8A3+C66u8HbtY/yUcAxtdPrN7FNKfQYdzMxvL5bqs=;
        b=g7wahavZV/V9dxm5J6Cl9kB1jrauaOdl3uRVh2gG7t0WrWHR2ZYjXU2WVDfOh/YrEe
         kM7yMwfetN0ELIsdGu53W44Ofwrhr6I7fcz0EfmHcM4T0tvomxWf7NkpjVenOfnbnPGI
         X0ApKKFA+K1lXkTxnuS9rednE6rZyn/xDk3YtEE0SXNUp19p/ABl2/rPrCOb3+2cI2oc
         EEvgza/rIK/uHuolVVBffaD0IiArD4lNAFYjqZMsBHTKLbUr2n2g14xAV3UxvSpfrOrF
         7rTZiV/X1JFv/pmu5B6UnrRFOpratb/ERwvNjZddaHa7jkj0Z1BRwtJjFznp1k0kHsq6
         J7+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ODcGa/3z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si1187711qtj.61.2020.02.28.01.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 01:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ODcGa/3z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7c4m-0005KL-PH
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 04:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7c4f-0005K8-Pu
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 04:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7c4e-0008A5-Ha
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 04:36:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7c4e-00089X-El
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 04:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582882607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HP8A3+C66u8HbtY/yUcAxtdPrN7FNKfQYdzMxvL5bqs=;
 b=ODcGa/3ztFjyuWtdzNreGT0GCrn2migpsv0qyPvhBz0V+RNE/JnQY3TMpC3dNO08bIyJuS
 GyFXKho5ueqofRSD/EsezNELaVElJVWomHfph/k9JGioSwn11D7h0DZJ26N6goV+kfDYu7
 ffFfXT88JvHAKciM9CFFmNZzPEY6XE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-vhHdnjwyPRy8xDoAhMRWrg-1; Fri, 28 Feb 2020 04:36:42 -0500
X-MC-Unique: vhHdnjwyPRy8xDoAhMRWrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABCDA8014CA;
 Fri, 28 Feb 2020 09:36:40 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDB4B5C28E;
 Fri, 28 Feb 2020 09:36:29 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration
To: Bharat Bhushan <bharatb.linux@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>, Tomasz Nowicki <tnowicki@marvell.com>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "linu.cherian@cavium.com" <linu.cherian@cavium.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2a788c05-cd9b-1e69-14dd-864633a1df95@redhat.com>
Date: Fri, 28 Feb 2020 10:36:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181127064101.25887-1-Bharat.Bhushan@nxp.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jd5otHQ9s+qT

Hi Bharat,

On 11/27/18 7:52 AM, Bharat Bhushan wrote:
> This patch series integrates VFIO with virtio-iommu. This is
> tested with assigning 2 pci devices to Virtual Machine.
> 
> This version is mainly about rebasing on v9 version on
> virtio-iommu device framework from Eric Augur.
> 
> This patch series allows PCI pass-through using virtio-iommu.
> 
> This series is based on:
>  - virtio-iommu kernel driver by Jean-Philippe Brucker
>     [PATCH v5 0/7] Add virtio-iommu driver
>     git://linux-arm.org/kvmtool-jpb.git virtio-iommu/v0.9
> 
>  - virtio-iommu device emulation by Eric Augur.
>    [RFC,v9,00/17] VIRTIO-IOMMU device
>    https://github.com/eauger/qemu/tree/v3.1.0-rc2-virtio-iommu-v0.9

Now we have the driver and the base qemu device upstream we may resume
this activity to complete the VFIO integration. Do you intend the
respin? Otherwise let me know if you want me to help.

Thanks

Eric
> 
> v4->v5:
>  - Rebase to v9 version from Eric
>  - PCIe device hotplug fix
>  - Added Patch 1/5 from Eric previous series (Eric somehow dropped in
>    last version.
>  - Patch "Translate the MSI doorbell in kvm_arch_fixup_msi_route"
>    already integrated with vsmmu3
> 
> v3->v4:
>  - Rebase to v4 version from Eric
>  - Fixes from Eric with DPDK in VM
>  - Logical division in multiple patches
> 
> v2->v3:
>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>    Which is based on top of v2.10-rc0 that
>  - Fixed issue with two PCI devices
>  - Addressed review comments
> 
> v1->v2:
>   - Added trace events
>   - removed vSMMU3 link in patch description
> 
> Bharat Bhushan (4):
>   virtio-iommu: Add iommu notifier for iommu-map/unmap
>   virtio-iommu: Call iommu notifier on attach/detach
>   virtio-iommu: add virtio-iommu replay
>   virtio-iommu: handle IOMMU Notifier flag changes
> 
> Eric Auger (1):
>   hw/vfio/common: Do not print error when viommu translates into an mmio
>     region
> 
>  hw/vfio/common.c                 |   2 -
>  hw/virtio/trace-events           |   5 +
>  hw/virtio/virtio-iommu.c         | 190 ++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-iommu.h |   6 +
>  4 files changed, 198 insertions(+), 5 deletions(-)
> 

