Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D937C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 07:19:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzUO6-0004dZ-SV; Thu, 27 Aug 2026 03:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1wzUO4-0004co-GN
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 03:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1wzUO3-0005r8-0X
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 03:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787815138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz9PYIKiSbQfktflGVqtTlQ+I/WSLSvihO2Aml5Kg8o=;
 b=QA6MUn0gXFXD9SZzP8vkKG9Mua4KnyVC4mQ7sHLDBnBtgkcLr99iZsfmhCWPaw0v/wQ3QS
 aDS5fRopF9WmPGDDsYh4nuLYLhc2uXoavoKDKqRFryrj++8yCOg/SNkybAJ6FAy22gXpPd
 pg9iTXER949bvexes4UC/Auqv8HPn7s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-KmDVqTvDNBarhQrcZpNAZA-1; Thu,
 27 Aug 2026 03:18:54 -0400
X-MC-Unique: KmDVqTvDNBarhQrcZpNAZA-1
X-Mimecast-MFC-AGG-ID: KmDVqTvDNBarhQrcZpNAZA_1787815132
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8AD431835AC7; Thu, 27 Aug 2026 07:18:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.48.5])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B44637D6; Thu, 27 Aug 2026 07:18:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B6DE1800781; Thu, 27 Aug 2026 09:18:50 +0200 (CEST)
Date: Thu, 27 Aug 2026 09:18:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, alwilliamson@nvidia.com, jgg@nvidia.com, 
 skolothumtho@nvidia.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, devel@edk2.groups.io
Subject: Re: [RFC PATCH v2 0/5] hw/pci, hw/arm/virt: fixed PCI BAR placement
Message-ID: <ao_fX3cYersq6TRd@sirius.home.kraxel.org>
References: <20260827004024.598351-1-tdave@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260827004024.598351-1-tdave@nvidia.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 6B8Be_f20VIo2RiGJo33vd2lceKf8YKNe2TJ7pwLxZ0_1787815132
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

  Hi,

> Following the feedback, RFC v2 keeps PCI enumeration and resource
> assignment in firmware. QEMU only validates the user-provided fixed
> BAR configuration and provides the required metadata to firmware
> through the "etc/fixed-bars" fw_cfg file.

qemu already has vendor-specific pci capabilities.  They are used to
pass hints for the bridge window sizes of pci bridges (including pcie
root ports) with hotplug support.  See OvmfPkg/PciHotPlugInitDxe/ for
the firmware side support.

I'd strongly recommend to do the same for the fixed bars:  Add a pci
capability to pass that information.  All the logic you have today to
link the information in the fw_cfg file to the correct pci device is
simply not needed any more then.

> * fixed-bar=on on a PCIe root port marks its subordinate hierarchy for
>   fixed BAR placement. Every device with memory BARs in that hierarchy
>   must provide a complete pci-bars= configuration.

Why is this needed?

> * pci-bars=barN@<addr>[,barM@<addr>]... on a PCI endpoint specifies the
>   required address for each memory BAR. All memory BARs on the device
>   must have an explicitly assigned address.

fixed-bar-<nr>=<addr> ?

> On the firmware side, a new DXE driver, QemuFixedBarsDxe, installs
> EFI_INCOMPATIBLE_PCI_DEVICE_SUPPORT_PROTOCOL before PciBusDxe starts.
> When PciBusDxe calls CheckDevice() for a discovered PCI function, the
> driver returns ACPI address descriptors with _MIF|_MAF set for fixed
> BARs. Two small changes to PciBusDxe preserve these fixed addresses and
> program them into the BAR registers during BAR programming.

Expecting PciBusDxe respecting AddrRangeMin looks sensible to me ...

> After PciEnumerationComplete, QemuFixedBarsDxe walks each fixed
> root-port hierarchy and programs the bridge memory windows to cover
> the fixed BAR ranges assigned to endpoint devices.

... but changing things after-the-fact in platform code is a complete
non-starter.  PciBusDxe needs to do that, i.e. take care that the bridge
window assigned actually cover the fixed pci bars.

take care,
  Gerd


