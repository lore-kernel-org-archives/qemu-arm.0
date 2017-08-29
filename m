Received: by 10.223.188.70 with SMTP id a6csp5370284wrh;
        Mon, 28 Aug 2017 20:43:44 -0700 (PDT)
X-Received: by 10.200.49.78 with SMTP id h14mr3676199qtb.320.1503978224211;
        Mon, 28 Aug 2017 20:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503978224; cv=none;
        d=google.com; s=arc-20160816;
        b=sEXMSLE54ZFEIrrA4lsGljOvU4j22T1oGKn0uu2xRg/2Eh5vL7azyiimBUj2gB5nWi
         9mwQQcrYKYveCHrxbG3msF1JhI8zOcLIe7MnDx2ER5fWAMljDASJkwzRCHeFITS4aDsV
         f0uV/Fv5Hc/mOOWu9pG7nTGPjs6Up9IB4sX55wzBUTr4kGKCu9+yQPrTAMudzSXaVmMZ
         0Mj8zSB9N99rTH8+Ng9eHZy/S77UPoHXdpeF68fIER3tnG2fbog69Jj2surKeUVokhvt
         QCFMMLTDW5JJXqumwd8Giveh5jT0xB6duUW+0pFyI5nUuv+1Pxk+EnRhVCXG1e8ZQvRz
         cTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=CsvcERZcjDhYik424aofr4QyF+vN+TuM42oGknpXZE0=;
        b=gzatUdwwr7EIOUW3SqyAASnB7SFWvcOElqPOxfMhxAWcBAbBGY3VL/o9d/7Xdewz8x
         21a2veKWG/hmHCcoM/6h3tpJ5v5HrDZPmFFfxyVR9iO2r2m2jYWQZz8gQEn/Sw6TCiOv
         HptbiwZZERwArtr4lDenH9Sswc9Mbmr9PYb2NqL7G3q5ROQqd1loOEJisrFjvWw1r28G
         ODUIzuoEtzUzxe7GE8cPuacOBvEFSmsxBixseiEWdrorMs2TWtE47i9jJo1qSHAtETqt
         TD2FgqcU/jSLN6tzYAA0377iGdVPH4lupMt462LITY//r0pIMJ0VWD7oStUL1IXZByTt
         DeBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11si1958308qtb.48.2017.08.28.20.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 20:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmXRG-0000Ut-3S
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 23:43:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dmXRC-0000Ul-FP
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 23:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dmXR9-00010C-9i
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 23:43:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dmXR9-0000yd-2R; Mon, 28 Aug 2017 23:43:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0A3D7E42B;
	Tue, 29 Aug 2017 03:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A0A3D7E42B
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-18.gru2.redhat.com [10.97.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC78E183D7;
	Tue, 29 Aug 2017 03:43:30 +0000 (UTC)
Date: Tue, 29 Aug 2017 00:43:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20170829034329.GV15315@localhost.localdomain>
References: <20170823221445.15243-1-ehabkost@redhat.com>
	<20170823221445.15243-5-ehabkost@redhat.com>
	<20170825193922.GN27715@localhost.localdomain>
	<8ad06170-3409-f9aa-dbaf-380c2ca35fd9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ad06170-3409-f9aa-dbaf-380c2ca35fd9@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 29 Aug 2017 03:43:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/5] pci: Add
 INTERFACE_LEGACY_PCI_DEVICE to legacy PCI devices
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
Cc: xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iZaEVZdQeN8E

On Mon, Aug 28, 2017 at 06:58:37PM -0400, John Snow wrote:
> 
> 
> On 08/25/2017 03:39 PM, Eduardo Habkost wrote:
> > CCing maintainers of affected devices (sorry for not CCing you
> > before).
> > 
> > On Wed, Aug 23, 2017 at 07:14:44PM -0300, Eduardo Habkost wrote:
> >> Add INTERFACE_LEGACY_PCI_DEVICE to all direct subtypes of
> >> TYPE_PCI_DEVICE, except:
> >>
> >> 1) The ones that already have INTERFACE_PCIE_DEVICE set:
> >>
> >> * base-xhci
> >> * e1000e
> >> * nvme
> >> * pvscsi
> >> * vfio-pci
> >> * virtio-pci
> >> * vmxnet3
> >>
> >> 2) base-pci-bridge
> >>
> >> Not all PCI bridges are legacy PCI devices, so
> >> INTERFACE_LEGACY_PCI_DEVICE is added only to the subtypes that
> >> are actually legacy PCI devices:
> >>
> >> * dec-21154-p2p-bridge
> >> * i82801b11-bridge
> >> * pbm-bridge
> >> * pci-bridge
> >>
> >> The direct subtypes of base-pci-bridge not touched by this patch
> >> are:
> >>
> >> * xilinx-pcie-root: Already marked as PCIe-only device.
> >> * pcie-port: all non-abstract subtypes of pcie-port are already
> >>   marked as PCIe-only devices.
> >>
> >> 3) megasas-base
> >>
> >> Not all megasas devices are legacy PCI devices, so the interface
> >> names are added to the subclasses registered by
> >> megasas_register_types(), according to information in the
> >> megasas_devices[] array.
> >>
> >> "megasas-gen2" already implements INTERFACE_PCIE_DEVICE, so add
> >> INTERFACE_LEGACY_PCI_DEVICE only to "megasas".
> >>
> >> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >> ---
> 
> [...]
> 
> >>  hw/ide/ich.c                        |  4 ++++
> >>  hw/ide/pci.c                        |  4 ++++
> 
> Acked-by: John Snow <jsnow@redhat.com>
> 
> 
> (Random fly-by comment without looking at the other patches: I assume
> there are reasons it's not appropriate or good to add a legacy PCI
> device parent that we inherit from, and it's instead better to manually
> add the property to all children?)

Yes, the reason I'm using interfaces instead of regular
inheritance is the existence of hybrid devices (see patch 2/5).

-- 
Eduardo
