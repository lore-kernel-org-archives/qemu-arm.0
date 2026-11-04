Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A2E606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g7kcpY5T
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOZqh-0006Si-MP; Wed, 04 Nov 2026 07:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xOZqd-0006SE-CA
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 07:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xOZqZ-0000tz-RR
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 07:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793794325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaFd8yqxjDoiVx1rqBbqQIMCjGs2uGkKNMrp/2HoNyU=;
 b=g7kcpY5ThX2OyruOQt2vBzt9NCowHZPDsnME/rWfL2YImXuanYh7gl332NSVgBEYX17GNI
 5gD5NXgY591P90FtSirjp0zVQHc8RgQhWGWuUSQvw8QFkCLQElZTMrxeY/OC1xtosagg5+
 e6w6UHugB3/HWcBok2lDFWVnvSbUlyI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-L37qJJlXMJ2LefLT3oUtlQ-1; Wed, 04 Nov 2026 07:12:04 -0500
X-MC-Unique: L37qJJlXMJ2LefLT3oUtlQ-1
X-Mimecast-MFC-AGG-ID: L37qJJlXMJ2LefLT3oUtlQ_1793794323
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a318cd95e8so6305265e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 04:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793794323; x=1794399123;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TaFd8yqxjDoiVx1rqBbqQIMCjGs2uGkKNMrp/2HoNyU=;
 b=1toUT6HAO2ckQr/9j9NTqAZyQqh+e478HRL2w6sAfZpNnFSTM+JsqQwDlCn5QFrk6g
 fBG29XxDlFd2N7KcljR6egBzf0/8zFNKZNYZiWmqAkVEZGiRvKp+zCaJVPcmzsyG6S3g
 hrTpJI/BiysbvrWtP4Y8xljQAvOxGEca4kFtYVdixHDA3oV4Hi5zmL3kNRvRMO4Z9IMq
 P0KrCCi8PmRKODDckEMmwtvJ7slFsBMduigiMsGvZjbAFq6o6cFX2oaClpZyVmTmu947
 8XWP8zay0a/9yKaRX1XOWFaeVtuFyEGh0ogpTAmxyYUSnO1x+Zx6OM6oA+FcFpL/MJff
 oBcg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7/eH5IM/FG8mzyDur5aH5OsA918DvxMvE1XOUImL5sMnu8WAo7AYm16p6t9POJrS8LmzybMxElQ==@nongnu.org
X-Gm-Message-State: APuU4Z/Zo2E22CK8ZYbw5FOPEUwC0miAOa+tvHB1uXZz6YGyaeCFrt6u
 falUQDdyOlFd2uFIP7iUw2DtJT1UprL/eFlwrk5tqJzSvvAUfZ1tSnMGW5LSjpF4qrl1yovybOW
 fkLK9S7puvy5XAqPgTIaKjiaY0B3myOzWkWIDdh7mnlqHkRvsjvkFFQ==
X-Gm-Gg: AYBFou0naD6sgWBxwqescSU4GOwDU+PfBLGowz2e0UfBNUhAO/AHqvWs9oLpQXdyocL
 6pxbip9VZ7JdDE6l/w7YdHqYx7UUk5zfwKVxXDHjUG2roFPscPZd8E8axg22cak3WJtc2up8vQr
 QXDc6up5dWup6ZJHfi2bGCSXZLebMO4Hdcyh4vMzSoBK3S3S//oxjlvHzFmX0eNMf66KoksdGah
 GXMxZlGcHO8NIG3eDGaDPD6zIWbjHN7oP6JoOsKGtRuf8Kb9wvF7ISP4UJInG2CJf5wHUHrvvUC
 dQFSttMI5+r3S4KtPQVo8DGoSd/SGIIGYnA4tGNVoImI++RmCUn+e4VRh3JLTx0MMeKjQPR50tz
 Uwy4NW5FCAQjECkampQEEWP0H1EJwD0qrk3IpEavinw==
X-Received: by 2002:a7b:c8c2:0:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4aa8ac7dab1mr347004215e9.11.1793794323113; 
 Wed, 04 Nov 2026 04:12:03 -0800 (PST)
X-Received: by 2002:a7b:c8c2:0:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4aa8ac7dab1mr347003785e9.11.1793794322667; 
 Wed, 04 Nov 2026 04:12:02 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed0844c8sm3821494f8f.26.2026.11.04.04.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 04:12:01 -0800 (PST)
Date: Wed, 4 Nov 2026 07:11:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tushar Dave <tdave@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, marcel@redhat.com,
 "devel@edk2.groups.io" <devel@edk2.groups.io>,
 alwilliamson@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 3/5] hw/pci: add fixed BAR fw_cfg blob export
Message-ID: <20261104071037-mutt-send-email-mst@kernel.org>
References: <20261102181241.3077981-1-tdave@nvidia.com>
 <20261102181241.3077981-4-tdave@nvidia.com>
 <f46e21c2-a0f3-460a-a7a3-eabf19b7d9cb@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f46e21c2-a0f3-460a-a7a3-eabf19b7d9cb@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oOeiU55JlXZ6rNZ4YgKMQkMaPWuBv93pkfogcYVC9mc_1793794323
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:59:47AM +0100, Ard Biesheuvel wrote:
> 
> 
> On Mon, 2 Nov 2026, at 19:12, Tushar Dave wrote:
> > Introduce a fixed BAR fw_cfg blob exporter that serializes PCI
> > device and BAR information into the "etc/fixed-bars" fw_cfg file.
> >
> > The blob contains an entry for every PCI function with memory BARs.
> > Each entry carries the device's vendor and device ID, whether it
> > has a fixed BAR configuration, and its firmware device path. Fixed
> > BAR entries also include the configured BAR address, size, and type
> > information for each BAR.
> >
> > Document the format in docs/specs/pci-fixed-bars.rst.
> >
> > Signed-off-by: Tushar Dave <tdave@nvidia.com>
> > ---
> >  docs/specs/index.rst           |   1 +
> >  docs/specs/pci-fixed-bars.rst  |  75 ++++++++
> >  hw/pci/meson.build             |   1 +
> >  hw/pci/pci-fixed-bar-blob.c    | 308 +++++++++++++++++++++++++++++++++
> >  include/hw/pci/pci-fixed-bar.h |  63 +++++++
> >  5 files changed, 448 insertions(+)
> >  create mode 100644 docs/specs/pci-fixed-bars.rst
> >  create mode 100644 hw/pci/pci-fixed-bar-blob.c
> >  create mode 100644 include/hw/pci/pci-fixed-bar.h
> >
> ...
> > diff --git a/hw/pci/pci-fixed-bar-blob.c b/hw/pci/pci-fixed-bar-blob.c
> > new file mode 100644
> > index 0000000000..dc94debfad
> > --- /dev/null
> > +++ b/hw/pci/pci-fixed-bar-blob.c
> ...
> > +/*
> > + * EFI_INCOMPATIBLE_PCI_DEVICE_SUPPORT_PROTOCOL's CheckDevice interface
> > + * (UEFI PI Spec 1.2 Vol 5) only passes VendorId/DeviceId/RevisionId/
> > + * SubsystemVendorId/SubsystemDeviceId, no BDF — so in EDK2 we can't
> > + * match a blob entry to a specific device directly using BDF. To work
> > + * around that, we prepare the blob entries in the same order PciBusDxe
> > + * discovers devices, so matching by VID:DID inherently works.
> 
> This sounds rather fragile.
> 
> Could you elaborate on what order this is, and why it is reasonable to
> rely on that approach being stable?
> 
> 

Also, bus numbers can be changed by guest, and I don't get why
would you want to report devices without a fixed bar.


