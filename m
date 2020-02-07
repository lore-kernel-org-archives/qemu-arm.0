Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp388113lfp;
        Fri, 7 Feb 2020 02:06:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyXdeTi68KmXmPeLdRnQlMh0a4SMep9c11qE8yGF1PEaWV7RntKJIDTmGPm274C/1CwbmoK
X-Received: by 2002:ac8:198c:: with SMTP id u12mr6768280qtj.225.1581069960186;
        Fri, 07 Feb 2020 02:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581069960; cv=none;
        d=google.com; s=arc-20160816;
        b=xwFU3O4YmZf17iKBmLaTD4ULDbIlFifLkJO2WFoDyzsa3dTYwmWEyO+1xXDYd7mRfN
         Bq7YYRdAKsvrFVTiz/1lrsgGgeZ+QgHJ1BnSU3CYsKlnHPP3L2QprkmGPyT1GXuQy2fY
         SETtUdbvCUiGOTvPbZPfXJAn1gxeh+E4t5EgixEn2Vft0EbJvzGV1Aaxdnily8d163UW
         D5He83PqEBYLYIxatIhlRrhK0xWKN6MndgBLxinw4OiQxoLgWtbt6+OffqkXWCqmnC9u
         AlwIhkRxGaj2cwzb3OOcCv4BMExLfUUgNh4mn8WSAZJzIW7fqcIT74LIpOGqoBc/+rUD
         zU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CkNISUU2YEwgtDbE7wGrX6zHwwImz3m8DQldgou+fwU=;
        b=0boFr3QTPdFpmrhrdW38Cp+sKL6Ml4dH6uacIKarsI768MwDDjCIdvtC4zePwsIbhG
         Rx13DmKG31N1FLu9k/h2l8vUexp1S0wQo9Kk2IOpO+obBeB/mY9AiY+6WWae1Et8qFAx
         6IO/DmVNgXwP1ifzA/pAXwuAuh4X2CuwFR/WjRDS2I4M0eRvGtL+luZswUfKwpyh0ltn
         3eQxYF/At+O9VB36E7nzWlUIsQGcRqWyr1NIi7oUPRf9RUgMEQmzTvn6EyV9gaEaaNah
         IF3eeRrBr0CymvEiw4UaGX0nKT9ra5X6GUcGvbU2K6Pz0uZgjRf+luTsYsNg2pdrdAe4
         3i+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m7zTvBpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si1127773qkq.5.2020.02.07.02.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m7zTvBpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00WN-0004mA-Ls
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1j00WG-0004kq-Oa
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:05:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1j00WF-0001Ss-B5
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:05:52 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1j00WF-0001JV-1U
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:05:51 -0500
Received: by mail-wr1-x443.google.com with SMTP id c9so1904077wrw.8
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CkNISUU2YEwgtDbE7wGrX6zHwwImz3m8DQldgou+fwU=;
 b=m7zTvBpXxHV6nlyseiblGba2cS5Y9ANFNqUZyf5aRhLssqPPJTvGnv/RGQw3ipxKL1
 WqcxUFRL8RfjkkV8eCaZ8qDc1uhpWISvzA2sPq1bIL+Td3Hdoo9hsM9Rjr2I6vgWA2y8
 ZVWK7Tfq1HOwTr91reCVv6fLsW/vzeeKTthjrEOnrb6LmvstJr2jJgBb2Y7y9mk1/nLX
 LkdPGsl8ckCPPYU9S6lKHT21qO4JkNBbFe+zmoBZKRBCHjT8z33mgnnWDGQRhgUEFIP2
 iQ2CofwI6btDQDVNcvOHbCWj4SoeRM2KgOA+Ju0lFfdvdLaiw4QeKze7FVhSwuSlag7+
 NZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CkNISUU2YEwgtDbE7wGrX6zHwwImz3m8DQldgou+fwU=;
 b=g2ltMmTEUgqkFhvpvdLUSk0ZG0LbV+mxQIhsLVRWEniMC36sRNwo6K/1zvdV2vBk8k
 H8XylmYpdDwnBMlzmBpLFdpczDcDKTeMn5hOCBapC0OzYb+CxkILC6XM0JXKsycnWhhM
 749/+3Gp7FsxpdjBxssJaL9L6O6vuG7TZwLer9YmBXpIknGOHxq43dtV3UjTnDhPHzok
 VGx3vO+Uc/6YZbK0TvoiG+fS3JXFk7q79meXd2RYFMT8G3CvOrak+iAdgL7FWmvk6JnT
 9a/9SEcR+L3EcAxxtrr5ekm6P7We+AljwbJURdGen8GhfmrOB/BUfqFkZVfTQzlDOekr
 puag==
X-Gm-Message-State: APjAAAVobKoqWF3Rm6aWz2euyyWDHvD0RH2KVhKqpKMDJoT1XisDIpDS
 VRBEuMiVeDC54zA9mWHg7mqaWw==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr4005701wrl.117.1581069949332; 
 Fri, 07 Feb 2020 02:05:49 -0800 (PST)
Received: from myrica ([2001:171b:c9ad:af70:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 18sm2672839wmf.1.2020.02.07.02.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 02:05:48 -0800 (PST)
Date: Fri, 7 Feb 2020 11:05:40 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200207100540.GA1999431@myrica>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207093203.3788-9-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t4izldA+DXH0

Hi Eric,

On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> At the moment, the kernel only supports device tree
> integration of the virtio-iommu. DT bindings between the
> PCI root complex and the IOMMU must be created by the machine
> in conformance to:
> 
> Documentation/devicetree/bindings/virtio/iommu.txt.
> 
> To make sure the end-user is aware of this, force him to use the
> temporary device option "x-dt-binding" and also double check the
> machine has a hotplug handler for the virtio-iommu-pci device.
> This hotplug handler is in charge of creating those DT bindings.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
[...]
> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>      DeviceState *vdev = DEVICE(&dev->vdev);
>  
> +    if (!dev->dt_binding) {
> +        error_setg(errp,
> +                   "Instantiation currently only is possible if the machine "
> +                   "creates device tree iommu-map bindings, ie. ACPI is not "
> +                   "yet supported");
> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");

"use -device virtio-iommu-pci,x-dt-binding"?

Can the option be safely removed as soon as we implement a topology
description for the remaining platforms?  Or will we need to carry it
forever for backward-compatibility (ie. ensure that an old command-line
invocation that contains this option still works)?

Thanks,
Jean
