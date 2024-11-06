Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3340493njc;
        Tue, 5 Nov 2024 23:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEF98mDhcSTT5IuChtT0cDKqkfY0pUPgVgEiW4v0YTCPd3ctQplNI7ECvKufj/sYLuIOyh43eitOJARA==@linaro.org
X-Google-Smtp-Source: AGHT+IFpI2/7vQETsd9mUHssvdCyUNoGnhPo5Iswcha1pVCMcU1AO4VrqQ3jf82Fnk2G6V/rfIwL
X-Received: by 2002:a05:620a:4547:b0:7b1:4cd4:469c with SMTP id af79cd13be357-7b2fb9cc305mr2311161085a.51.1730877644581;
        Tue, 05 Nov 2024 23:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730877644; cv=none;
        d=google.com; s=arc-20240605;
        b=YjF23bizYTkT4DR/eloYfl01/+5Nldxjm3MMwYRa0vGefEIeL5ItavmJEKn2cDuFNS
         A2AJBah9rL+2Ub5LVi+XXXl/0lZvzLk3c0EnGfKcPjh4VU8P+mGi3cTpLWHqhKRZUBF0
         x9MOEXeO5Ey6cFI5rax5+DN0GFEiGDnauQ1y2DM3boAr8gYLW/CFcbtiwBJgJ5caZPPJ
         A/lDxeEXActkVXuSrl6UTfWP/+KNWlzLubNVEnbFlmO3GJRp0/JaKNcGNH1/LauqtKRg
         YOIy0oGlswgtl2HAYlnU90/cqPQOMHRTuxJjYBUHjIqrVpVBVr/08leFFXhW85uIgLRH
         AFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yWFwvOlyH6K6JITpy++vRurgHpvJM/Pup3QsymDL3AU=;
        fh=bAzEthHJ1uUwxRM9c+FLy1JnxpDYMS48uBCmITyRV6A=;
        b=AJ+XuR5f66+WpUAJPvzkxmgA6mA6sEYfumY3Xx95FKn3xD4ZJZR2Kju8EzReaPgxkm
         lOw5kE2Yb+pqcN8ksmyGTnlpTdf5TnTAdndyadU990Ca4x17BKQEnuExJUjAY1WQJTcV
         di0+AhRQ1rkO4s5+JahDz7Bfh8A1zoV4EK87est4O8R8ey7Wr9a3/F5jQY+csGNXZBsL
         I4y8HX2XyxHYilztc/qRtJ73ZZyIdNlV3UMimYhhs+5l7QavGLdmGVSJaCOMEgNdKV1R
         vvnPABbJCYhLONQyI8fqA+N6vAnxarmrPtntPmKtk/rRSc4Eq8xpd+dUcbUXmTfpI6g3
         T2tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IG3G/aM4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a812ffsi1516567285a.241.2024.11.05.23.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 23:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IG3G/aM4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8aLD-0007Vn-KJ; Wed, 06 Nov 2024 02:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t8aLB-0007VI-Nh
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 02:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t8aL8-0007dj-Hm
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 02:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730877627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWFwvOlyH6K6JITpy++vRurgHpvJM/Pup3QsymDL3AU=;
 b=IG3G/aM4AZYjTJh7B9P7xi0Gt0beUz3e5fuT23bNHIgmoD2z9N56Rp5Bnhuj1+nv0TwxLw
 RGzAwlXv+Qjm6Qam8I/b/TcUngQ6GfhWVLmzdFPAiQjwN25HmZ0vdTw7tVumnw0V+qzSEw
 UTs4PPdJQIXiSE/8q9Jsnm/up+jox7A=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-JiwgLl06N32wjSKcOYJH7w-1; Wed, 06 Nov 2024 02:20:23 -0500
X-MC-Unique: JiwgLl06N32wjSKcOYJH7w-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539fbf73a2fso4052559e87.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 23:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730877622; x=1731482422;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yWFwvOlyH6K6JITpy++vRurgHpvJM/Pup3QsymDL3AU=;
 b=ouBIjHk9R7PC5DddUTawKq+JHbzaA5mXwUlX3/0tKHgJodUS3jvNmBa+9wHhT8t+xS
 Bo+01OK8Qfi1d9gyo6D0l+2s0aIJ+d59QLAQnJS1NFgEOAw106CqJLh0WL57+hu9y60y
 llV1duPyAq1+5rRcG7aGt68eLLIMNC/1SQDNvaFP3CCv7x0Rx0FkoI0wpU/Lekkx91Yb
 auhmgoT6VDCiRyjMUCOs0OzCfLBGxhNs/sXZrSfH3bYif8yasM6CTG/OmwRkczoQJRmx
 y5/sHYiCBOWPDX0NtHB0gCkjqOIoz83xJPRCodNG/xwoDdNdR7XRAiTA5cALgnslF/og
 sVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW1zJiHNvBUPc6XyK50iUwSxL6s77b/iUqNWJ4O83237CdVbqtyWmzmeRqDV4QzkFFruf1aneWMw==@nongnu.org
X-Gm-Message-State: AOJu0YzixatJpMAuOnicEZicqEV6mv+qkWPFIBWa+ZyFhjFiSLIXPGJx
 q6Lvh+l4uSGPbJuqp1fJ+RCSqBhwNZX8+29R1UFeQ+E0n2Qz/05engh84EO/JuAyBjWP3hAylDu
 JI8bcTwuW2CT7FAuTobbf0EnQy8OAtBPIRPkBk/d6/Bu9wMrZgA==
X-Received: by 2002:a05:6512:31c3:b0:53b:1526:3a63 with SMTP id
 2adb3069b0e04-53d65e26c49mr8624654e87.56.1730877621792; 
 Tue, 05 Nov 2024 23:20:21 -0800 (PST)
X-Received: by 2002:a05:6512:31c3:b0:53b:1526:3a63 with SMTP id
 2adb3069b0e04-53d65e26c49mr8624639e87.56.1730877621307; 
 Tue, 05 Nov 2024 23:20:21 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:e74:5fcf:8a69:659d:f2b2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ad6fsm18139872f8f.98.2024.11.05.23.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 23:20:20 -0800 (PST)
Date: Wed, 6 Nov 2024 02:20:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Huang, Ying" <ying.huang@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PULL 12/65] hw/acpi: Generic Port Affinity Structure support
Message-ID: <20241106022000-mutt-send-email-mst@kernel.org>
References: <cover.1730754238.git.mst@redhat.com>
 <a82fe82916432091ca6fcbd7f357cccf35f6e80d.1730754238.git.mst@redhat.com>
 <ZyngEiwmYeZ-DvCy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZyngEiwmYeZ-DvCy@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 69iBxTJ03nta

On Tue, Nov 05, 2024 at 09:06:26AM +0000, Daniel P. Berrangé wrote:
> On Mon, Nov 04, 2024 at 04:06:16PM -0500, Michael S. Tsirkin wrote:
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > These are very similar to the recently added Generic Initiators
> > but instead of representing an initiator of memory traffic they
> > represent an edge point beyond which may lie either targets or
> > initiators.  Here we add these ports such that they may
> > be targets of hmat_lb records to describe the latency and
> > bandwidth from host side initiators to the port.  A discoverable
> > mechanism such as UEFI CDAT read from CXL devices and switches
> > is used to discover the remainder of the path, and the OS can build
> > up full latency and bandwidth numbers as need for work and data
> > placement decisions.
> > 
> > Acked-by: Markus Armbruster <armbru@redhat.com>
> > Tested-by: "Huang, Ying" <ying.huang@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Message-Id: <20240916174122.1843197-1-Jonathan.Cameron@huawei.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  qapi/qom.json                       |  41 ++++++++++
> >  include/hw/acpi/aml-build.h         |   3 +
> >  include/hw/acpi/pci.h               |   2 +-
> >  include/hw/pci/pci_bridge.h         |   1 +
> >  hw/acpi/aml-build.c                 |  39 ++++++++++
> >  hw/acpi/pci.c                       | 116 +++++++++++++++++++++++++++-
> >  hw/arm/virt-acpi-build.c            |   2 +-
> >  hw/i386/acpi-build.c                |   2 +-
> >  hw/pci-bridge/pci_expander_bridge.c |   1 -
> >  9 files changed, 202 insertions(+), 5 deletions(-)
> > 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 321ccd708a..a8beeabf1f 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -844,6 +844,45 @@
> >    'data': { 'pci-dev': 'str',
> >              'node': 'uint32' } }
> >  
> > +##
> > +# @AcpiGenericPortProperties:
> > +#
> > +# Properties for acpi-generic-port objects.
> > +#
> > +# @pci-bus: QOM path of the PCI bus of the hostbridge associated with
> > +#     this SRAT Generic Port Affinity Structure.  This is the same as
> > +#     the bus parameter for the root ports attached to this host
> > +#     bridge.  The resulting SRAT Generic Port Affinity Structure will
> > +#     refer to the ACPI object in DSDT that represents the host bridge
> > +#     (e.g.  ACPI0016 for CXL host bridges).  See ACPI 6.5 Section
> > +#     5.2.16.7 for more information.
> > +#
> > +# @node: Similar to a NUMA node ID, but instead of providing a
> > +#     reference point used for defining NUMA distances and access
> > +#     characteristics to memory or from an initiator (e.g. CPU), this
> > +#     node defines the boundary point between non-discoverable system
> > +#     buses which must be described by firmware, and a discoverable
> > +#     bus.  NUMA distances and access characteristics are defined to
> > +#     and from that point.  For system software to establish full
> > +#     initiator to target characteristics this information must be
> > +#     combined with information retrieved from the discoverable part
> > +#     of the path.  An example would use CDAT (see UEFI.org)
> > +#     information read from devices and switches in conjunction with
> > +#     link characteristics read from PCIe Configuration space.
> > +#     To get the full path latency from CPU to CXL attached DRAM
> > +#     CXL device:  Add the latency from CPU to Generic Port (from
> > +#     HMAT indexed via the the node ID in this SRAT structure) to
> > +#     that for CXL bus links, the latency across intermediate switches
> > +#     and from the EP port to the actual memory.  Bandwidth is more
> > +#     complex as there may be interleaving across multiple devices
> > +#     and shared links in the path.
> > +#
> > +# Since: 9.1
> 
> This is outdated, we're in the 9.2 dev cycle currently.


Jonathan can you fix this up pls?

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

