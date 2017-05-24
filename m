Received: by 10.25.0.6 with SMTP id 6csp508328lfa;
        Wed, 24 May 2017 15:12:33 -0700 (PDT)
X-Received: by 10.200.46.217 with SMTP id i25mr37442116qta.188.1495663953789;
        Wed, 24 May 2017 15:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495663953; cv=none;
        d=google.com; s=arc-20160816;
        b=gyr7AeRjF66DN9/fjesroA7glLgYeycAGRaL/tI/jcEkTGqN8di2+KkhQDOKnDWcq6
         fjrUC77ojipzpoGNPOE0XJybbnnKa8FLpr1DDUC2JGK9Tpvx3V7fuR64pVFFI5L7gSHd
         DSQZh66gPjb0zePYFwq0m4nUpdmvMSMDj1rh2xhWoujOqbnOp53jrNaNHQXAdpKqDIg+
         qA6u3rOGSVmMYChKZXRIk5bW7RoTgwmZxBvK+X4sHWUt+UTvukX8299hHkw6TYLos1RE
         mhtKXOk0EVMYa0HCciXcaLFDGpGNVyeERUs54Lmro+DTc8O2RrStTfhp/QFlbi4PQO0p
         48sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=6dyt6hU/soS/ea0x83tvFRAHhBI/T7EwFXhSAhWsvOE=;
        b=mF5m2GxgtzS7QeOziEIr/gc9C96IA7QbptSLGY2gBcHwOmCtinfkcPVarKlUL9Wu/6
         GYiXkiaY0EasyFxQq8PVjkm1WVhWxMWfSvcpvMrjb1pyTcG3sXENdoxqlID9GnhzKDX5
         krHTR/5isYqCyb5Mv31Zap/ekK9E3hWpV407tdw7/9wLgDxysGr456+jHpvgJqAHG/TA
         WMy9o7RUeB/k5ZUDymDCsU5Z6lZ4E9dA+rfzh32MLd/cUZtUG0BGQZLcSTtaVNYbJXW6
         X09XcQqFcdptmOCqynk2H2OUa81Jd20N/AuL/gPpxfAMbafDk3FownC89qfSntT3D8Mi
         FxVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si869978qtc.277.2017.05.24.15.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 May 2017 15:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDeW9-00022r-8K
	for alex.bennee@linaro.org; Wed, 24 May 2017 18:12:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dDeW2-00021R-1d
	for qemu-arm@nongnu.org; Wed, 24 May 2017 18:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dDeVy-00080q-Pf
	for qemu-arm@nongnu.org; Wed, 24 May 2017 18:12:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dDeVy-00080O-GN; Wed, 24 May 2017 18:12:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D79B61B9D;
	Wed, 24 May 2017 22:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3D79B61B9D
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3D79B61B9D
Received: from redhat.com (ovpn-120-84.rdu2.redhat.com [10.10.120.84])
	by smtp.corp.redhat.com (Postfix) with SMTP id 74A284F9A6;
	Wed, 24 May 2017 22:12:16 +0000 (UTC)
Date: Thu, 25 May 2017 01:12:16 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Diana Craciun <diana.craciun@nxp.com>
Message-ID: <20170525011034-mutt-send-email-mst@kernel.org>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 24 May 2017 22:12:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Add global device ID in virt machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, mike.caraman@nxp.com,
	qemu-arm@nongnu.org, marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cjFIBdqLqm9v

On Tue, May 23, 2017 at 02:12:43PM +0300, Diana Craciun wrote:
> The NXP DPAA2 is a hardware architecture designed for high-speeed network
> packet processing. The DPAA2 hardware components are managed by a hardware
> component called the Management Complex (or MC) which provides an
> object-base abstraction for software drivers to use the DPAA2 hardware.
> For more details you can see: 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fsl-mc/README.txt?h=v4.10
> 
> The interrupts generated by the DPAA2 hardware components are MSIs. We will add
> support for direct assigning these DPAA2 components/objects to a virtual 
> machine. However, this will add the need to expand the MSI usage in QEMU.
> 
> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
> GIC ITS is using a device ID for interrupt translation. Currently, for
> PCI, the requester ID is used as device ID. This will not work when
> we add another entity that needs also a device ID which is supposed to
> be unique across the system.
> 
> My proposal is to add a static allocation in the virt machine. I considered
> that this allocation is specific to each machine/platform. Currently only
> virt machine has it, but other implementations may use the same mechanism
> as well.
> So, I used a static allocation with this formula:
> 
> DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000 * Constant
> 
> This formula was taken from SBSA spec (Appendix I: DeviceID generation and
> ITS groups). In case of QEMU the constant will be different for each entity.
> In this way a unique DeviceID will be generated and the device ID will be
> derived from a requesterID (in case of PCI) or other means in case of other
> entities.
> 
> The implementation is generic as there might be in the future other non-pci devices
> that are using MSIs or IOMMU. Any architecture can use it, though currently
> only the ARM architecture is using the function that retrieves the stream ID. I
> did not change all the replacements of the pci_requester_id (with pci_stream_id)
> in the code (although if the constant is 0, the stream_id is equal with requester_id).
> The other architectures (e.g. intel iommu code) assume that the ID is the
> requester ID.
> 
> Tested on NXP LS2080 platform.
> 
> History:

I am confused. I get it that non-PCI things want something else
in their requester ID, but why require it for PCI devices?
How about using Constant == 0 for PCI? This way you do
not need to touch PCI at all as DeviceID == RequesterID ...


> v1->v2
> ------
> - the stream ID was added as a field in the pci device structure in order
> not to traverse the PCI hierarchy each time a MSI is sent.
> 
> 
> Diana Craciun (2):
>   Increased the size of requester_id field from MemTxAttrs
>   Add a unique ID in the virt machine to be used as device ID
> 
>  hw/arm/virt.c                          | 26 ++++++++++++++++++++++++++
>  hw/i386/amd_iommu.c                    |  2 +-
>  hw/i386/intel_iommu.c                  |  2 +-
>  hw/intc/arm_gicv3_its_common.c         |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c            |  2 +-
>  hw/pci-host/gpex.c                     |  6 ++++++
>  hw/pci/msi.c                           |  2 +-
>  hw/pci/pci.c                           | 25 +++++++++++++++++++++++++
>  include/exec/memattrs.h                |  4 ++--
>  include/hw/arm/virt.h                  |  1 +
>  include/hw/intc/arm_gicv3_its_common.h |  2 +-
>  include/hw/pci-host/gpex.h             |  2 ++
>  include/hw/pci/pci.h                   |  8 ++++++++
>  kvm-all.c                              |  4 ++--
>  14 files changed, 78 insertions(+), 10 deletions(-)
> 
> -- 
> 2.5.5
