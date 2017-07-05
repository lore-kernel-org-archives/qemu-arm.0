Received: by 10.25.44.15 with SMTP id s15csp1340157lfs;
        Wed, 5 Jul 2017 16:44:58 -0700 (PDT)
X-Received: by 10.55.102.201 with SMTP id a192mr9184122qkc.26.1499298298484;
        Wed, 05 Jul 2017 16:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499298298; cv=none;
        d=google.com; s=arc-20160816;
        b=aG38vs0KAzz6uOQz2J8ke+DOyNHhCJ8gga4+ib1aJFBHHiCeov0WCF9OV74/UrbI0X
         tT3d/lwZVqmmb8Hmv7sndk2qVlJ1TjlteTmdUQN3Xm0ZZIvynUmZl+x6dhWSk9V16bS7
         9MIVmoBgqQTcOylcD5z+XNr38BjE4kEG/4kv8MggfKHeIod7yr074XDkhpbjJ7ExnETh
         moJcTd27CB1fD5UPIltBgLVj2W0SaJbxUa96zo2CnJBg5MCf/p6ZcJgyliqbr/HQqp00
         fRy8tbpPG3EN5yLh9xyBKYvxSD7gl2459GwtYM4qOxxyb+XFM9X5XFy6zt3WigtMdTUy
         gN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=cRHgg6JBR5FCrC2v9t0E3Zw1Fo7nV4zTjIr+QqgpA78=;
        b=tJ39RVt/K2D4mUMH2U3qu1wYB9u5iadWRMYUNcm+pFIDABadqwpQKdg0YiGwXGkrkM
         J9h7gGV/8x2FrQJF6pBzbqDVNMbyz0irfw5VQZ0vw86Vfmeyhq4YALFD/CFLRBWEpPDf
         mHVqpNHRz8Z7Fd8rNN6W/tQ4tDvINupphPZf4Aua8BRqjiZ3KiPo0vv+vh3bxkU6cFGl
         1GugHKUzkHjW9EqtHGqKNFMA4Ml54NHxCTBsnV1kprFyBWul4lEAn+AENdc2HIC1nSiP
         iHuQ3h1S3OzKGRIFCcJW0fvSAN+CyapctXZ7M2k/k371QcamotpylqD9BE9DEXNguW3q
         S1zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si248347qkv.175.2017.07.05.16.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 16:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dStyZ-0005Dx-72
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 19:44:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dStyU-0005Dl-OU
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 19:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dStyQ-0005RG-OX
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 19:44:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dStyQ-0005Qn-Fd; Wed, 05 Jul 2017 19:44:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25B8CC057FA5;
	Wed,  5 Jul 2017 23:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 25B8CC057FA5
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 25B8CC057FA5
Received: from redhat.com (ovpn-120-237.rdu2.redhat.com [10.10.120.237])
	by smtp.corp.redhat.com (Postfix) with SMTP id BA7F45D960;
	Wed,  5 Jul 2017 23:44:40 +0000 (UTC)
Date: Thu, 6 Jul 2017 02:44:40 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Diana Madalina Craciun <diana.craciun@nxp.com>
Message-ID: <20170706023845-mutt-send-email-mst@kernel.org>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 05 Jul 2017 23:44:45 +0000 (UTC)
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EaPw/NZZ43Tu

On Wed, May 31, 2017 at 12:02:56PM +0000, Diana Madalina Craciun wrote:
> On 05/25/2017 01:12 AM, Michael S. Tsirkin wrote:
> > On Tue, May 23, 2017 at 02:12:43PM +0300, Diana Craciun wrote:
> >> The NXP DPAA2 is a hardware architecture designed for high-speeed network
> >> packet processing. The DPAA2 hardware components are managed by a hardware
> >> component called the Management Complex (or MC) which provides an
> >> object-base abstraction for software drivers to use the DPAA2 hardware.
> >> For more details you can see: 
> >> https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Ffsl-mc%2FREADME.txt%3Fh%3Dv4.10&data=01%7C01%7Cdiana.craciun%40nxp.com%7Cce2cc4d066944ce2759308d4a2f1f3f8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=CJAiTF6Qnq4gklSqon7xcRby0O1HQvytTUSdPwaHuSE%3D&reserved=0
> >>
> >> The interrupts generated by the DPAA2 hardware components are MSIs. We will add
> >> support for direct assigning these DPAA2 components/objects to a virtual 
> >> machine. However, this will add the need to expand the MSI usage in QEMU.
> >>
> >> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
> >> GIC ITS is using a device ID for interrupt translation. Currently, for
> >> PCI, the requester ID is used as device ID. This will not work when
> >> we add another entity that needs also a device ID which is supposed to
> >> be unique across the system.
> >>
> >> My proposal is to add a static allocation in the virt machine. I considered
> >> that this allocation is specific to each machine/platform. Currently only
> >> virt machine has it, but other implementations may use the same mechanism
> >> as well.
> >> So, I used a static allocation with this formula:
> >>
> >> DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000 * Constant
> >>
> >> This formula was taken from SBSA spec (Appendix I: DeviceID generation and
> >> ITS groups). In case of QEMU the constant will be different for each entity.
> >> In this way a unique DeviceID will be generated and the device ID will be
> >> derived from a requesterID (in case of PCI) or other means in case of other
> >> entities.
> >>
> >> The implementation is generic as there might be in the future other non-pci devices
> >> that are using MSIs or IOMMU. Any architecture can use it, though currently
> >> only the ARM architecture is using the function that retrieves the stream ID. I
> >> did not change all the replacements of the pci_requester_id (with pci_stream_id)
> >> in the code (although if the constant is 0, the stream_id is equal with requester_id).
> >> The other architectures (e.g. intel iommu code) assume that the ID is the
> >> requester ID.
> >>
> >> Tested on NXP LS2080 platform.
> >>
> >> History:
> > I am confused. I get it that non-PCI things want something else
> > in their requester ID, but why require it for PCI devices?
> > How about using Constant == 0 for PCI? This way you do
> > not need to touch PCI at all as DeviceID == RequesterID ...
> 
> It is not that other devices need something else in the requester ID,
> but more about finding a way to provide an unique ID across the system
> (more precisely it should be unique for all devices connected to the
> same IOMMU/ITS). The DT already offers support to describe the
> translation between stream IDs/device IDs to requester ID for PCI
> devices (iommu-map for IOMMU ([1]) and msi-map for MSIs ([2]). It will
> not change the way the requester ID is used in PCI in general, but only
> the places that need a unique ID (which are the MSIs and IOMMU).
> 
> If we are to use a value of 0 for the constant in case of PCI devices,
> what happens if we have multiple PCI controllers?

I guess we'd use the PCI Segment number for that?

> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> [2]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-msi.txt
> 
> Thanks,
> 
> Diana
> 
