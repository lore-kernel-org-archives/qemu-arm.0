Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp792631lfc;
        Thu, 27 Aug 2020 11:28:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHt4arlGtGts98I3QUCfDCSFSVjHR8Jd+4XuMlM5iaxpkVsaJXEgvCu3Ya8SwBjj/SioUn
X-Received: by 2002:a25:c004:: with SMTP id c4mr31766428ybf.475.1598552905649;
        Thu, 27 Aug 2020 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598552905; cv=none;
        d=google.com; s=arc-20160816;
        b=hu8dl0IGJ0Q1vQvzDZSDLlqA+/2vwcryEFPUW7ybvnLCMw5A5RKsROZ7UdwdbEPNWg
         +Yv7kYZqMPtP2p6yuC5oDUB+QtLFfRncuz+4VypUYOk5/2jDGQcz3o2R+W6DjgRuWVy7
         8y1zWpzKo5VRMhJI/VvNcX8JPFMGUDdKu54OhwrnNUK0auB1vj2fgi9XDe8uqhlK5uGP
         oftBSQzGNo5g7dq0IXxfGQ6Ws5KqDBdhwwkef4Olc5+W5zlCvbCD3ggioBUaQhCvyEej
         bFzBQ0pLnbT+fXEn+Uu8eYXSwQomZwN+z/Vjdrplc/FAlOPyEzTFPJzN/cnD2QGXvlyC
         p7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xq67xF1Ah1SkuP7oFrCV75JxzXmfxpuV8L0SN/RmBDk=;
        b=eMtpGPieElJbusPg/0oX8wiTB18ly8V9WLJBb07e1YDiJ3+czBOj9a3VFL20uDnMll
         dMMfydXp4TLFXCtwKYvje/QuFELcePWwi7InYGlLTOltCEa2X19Svc3sxGjw6cngbPdO
         Jr1S8ZLIE6K+6o2zQWxoOUFNjV15xdRW3mPUbLkZwJzpCBwSdelma1NUyL5owTESif3n
         twEge6HMja/QGJMAsdGXSctBampxikPcbxmhfgX9c/X0E+HEUSSKy65wDSaGnmfdpxtB
         GihRm5DhUiMSK1Di4TrucG2Q9lwimKnX62avY0JlG30zYXcLUTrz9f8zUZUO2OhjSX4D
         5Hcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UrcTPrXf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b37si2858662ybi.484.2020.08.27.11.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 11:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UrcTPrXf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBMdN-0006Mz-2G
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 14:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBMUQ-0000WI-QI
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 14:19:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26849
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBMUL-00083Q-KT
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 14:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598552344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xq67xF1Ah1SkuP7oFrCV75JxzXmfxpuV8L0SN/RmBDk=;
 b=UrcTPrXfMF47d9Fe4smV3Ogp+Qg9KmYkxbkLVxjucpUEYmci8z/hmBFsUqr5GPNp6ZJ6++
 TzswGUs7NiHepqTfiCNvDIfX6gWeKA3aY+nYz4Y2YtUzKkQYjxczZRMpFNGPflEM9zbo8U
 +4NZNeOF6YwwhefX7goACDL4MdfCCK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-L87QBkKKNdqtVT7o2Yd_Pg-1; Thu, 27 Aug 2020 14:18:39 -0400
X-MC-Unique: L87QBkKKNdqtVT7o2Yd_Pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79FCE1074650;
 Thu, 27 Aug 2020 18:18:33 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233C35D9E8;
 Thu, 27 Aug 2020 18:18:17 +0000 (UTC)
Date: Thu, 27 Aug 2020 14:18:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/74] qom: Automated conversion of type checking
 boilerplate
Message-ID: <20200827181816.GI642093@habkost.net>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Paul Durrant <paul@xen.org>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alberto Garcia <berto@igalia.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Amit Shah <amit@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z08U0loJ/e9t

On Tue, Aug 25, 2020 at 03:19:56PM -0400, Eduardo Habkost wrote:
> git tree for this series:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert
> 
> This is an extension of the series previously submitted by
> Daniel[1], including a script that will convert existing type
> checker macros automatically.
> 
> [1] https://lore.kernel.org/qemu-devel/20200723181410.3145233-1-berrange@redh=
> at.com/

I'm queueing the following patches on machine-next:

[PATCH v3 01/74] e1000: Rename QOM class cast macros
[PATCH v3 02/74] megasas: Rename QOM class cast macros
[PATCH v3 03/74] vmw_pvscsi: Rename QOM class cast macros
[PATCH v3 04/74] pl110: Rename pl110_version enum values
[PATCH v3 05/74] allwinner-h3: Rename memmap enum constants
[PATCH v3 06/74] aspeed_soc: Rename memmap/irqmap enum constants
[PATCH v3 07/74] opentitan: Rename memmap enum constants
[PATCH v3 10/74] aspeed_timer: Fix ASPEED_TIMER macro definition
[PATCH v3 11/74] versatile: Fix typo in PCI_VPB_HOST definition
[PATCH v3 12/74] virtio-ccw: Fix definition of VIRTIO_CCW_BUS_GET_CLASS
[PATCH v3 13/74] hvf: Add missing include
[PATCH v3 14/74] hcd-dwc2: Rename USB_*CLASS macros for consistency
[PATCH v3 15/74] tulip: Move TulipState typedef to header
[PATCH v3 16/74] throttle-groups: Move ThrottleGroup typedef to header
[PATCH v3 17/74] pci: Move PCIBusClass typedef to pci.h
[PATCH v3 18/74] i8254: Move PITCommonState/PITCommonClass typedefs to i8254.h
[PATCH v3 19/74] hvf: Move HVFState typedef to hvf.h
[PATCH v3 20/74] mcf_fec: Move mcf_fec_state typedef to header
[PATCH v3 21/74] s390_flic: Move KVMS390FLICState typedef to header
[PATCH v3 22/74] can_emu: Delete macros for non-existing typedef
[PATCH v3 23/74] nubus: Delete unused NUBUS_BRIDGE macro
[PATCH v3 24/74] platform-bus: Delete macros for non-existing typedef
[PATCH v3 25/74] armsse: Rename QOM macros to avoid conflicts
[PATCH v3 26/74] xen-legacy-backend: Add missing typedef XenLegacyDevice
[PATCH v3 27/74] spapr: Move typedef SpaprMachineState to spapr.h
[PATCH v3 28/74] s390x: Move typedef SCLPEventFacility to event-facility.h
[PATCH v3 29/74] vhost-user-gpu: Move QOM macro to header
[PATCH v3 30/74] ahci: Move QOM macros to header
[PATCH v3 31/74] i8257: Move QOM macro to header
[PATCH v3 32/74] ahci: Move QOM macro to header
[PATCH v3 33/74] pckbd: Move QOM macro to header
[PATCH v3 34/74] vmbus: Move QOM macros to vmbus.h
[PATCH v3 35/74] virtio-serial-bus: Move QOM macros to header
[PATCH v3 36/74] piix: Move QOM macros to header
[PATCH v3 37/74] auxbus: Move QOM macros to header
[PATCH v3 38/74] rocker: Move QOM macros to header
[PATCH v3 39/74] pxa2xx: Move QOM macros to header
[PATCH v3 40/74] mptsas: Move QOM macros to header
[PATCH v3 41/74] kvm: Move QOM macros to kvm.h
[PATCH v3 42/74] vfio/pci: Move QOM macros to header
[PATCH v3 43/74] nubus: Rename class type checking macros
[PATCH v3 48/74] s390-virtio-ccw: Rename S390_MACHINE_CLASS macro
[PATCH v3 49/74] swim: Rename struct SWIM to Swim
[PATCH v3 50/74] migration: Rename class type checking macros

-- 
Eduardo

