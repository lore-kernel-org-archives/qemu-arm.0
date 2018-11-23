Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1854872wrt;
        Fri, 23 Nov 2018 03:04:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5cAqJ+atG7g00sax8DAXgdpOSeNzQGpfup2IXe4wKNii5NKu0jPi6fFXG7OhtzEKdP7eHMU
X-Received: by 2002:aed:23c5:: with SMTP id k5mr13812532qtc.39.1542971077322;
        Fri, 23 Nov 2018 03:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542971077; cv=none;
        d=google.com; s=arc-20160816;
        b=qpXv35/L6lRXonScDJDg7KEnIp04Jz2cuMLTaHf4HG6SDC51jNVqAgPBl5l+mlHvh9
         uOuxEVJlFXR+U659v/5D2urw5Xpk9s+nGOAoijgd0R9poB2THyGuw/LIoZDnLvr9N2kD
         FdqEgwjqTUb+toBgStjS9HoZVNN3HvvxvvX2Wc6Hm/4Bepdckc1eXp2PVnFPQqN7FBBJ
         EDNRsuBozl8o+lcfDcQbGq4OXt/1Q5DKvq8AjtlB+RUu1E3c+Ixakdw6RVQdli+h4h54
         rEYiN+qH2K6d44PN10lml608/lT5gZd10JsxFbaWJGmDVIoWoVv+S3C8w0s34Ar3DXWo
         /SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=f255J9trikByGhKOgZdaT226yS1zCW9q77muEEQ9fGs=;
        b=xuyfUThXmg53TvpLttxEaN8YK+CFYVbG3uFhkpqgH7awrSs1DmQvDxy2v4f7+poelK
         74zuqqeMqLVOt+Yb69VIklVW0XrC+dD/8REkhsX7yoBPhMRoCJJ3oFke+tBbIpESSF67
         9gJbPM+G4uSjvnTZ/UjDMu7O0ebvkWRlvuvybpG9Hk0krVWAi3fT2uJtDwWMugPFBWBV
         hb2vf0U2hyCIZ5Kqik0rQqjK87SbtTotXSJdVPgnTBtWwH8BnUeBxLU22jhJ6sa80+hK
         Bfc9mhA6O+3izfbo+FWJIwL58ucZOJ66dw2S3iE4UxwhQcMrqtRE8U1Q1lzEXV7dqs1r
         WUzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f196si7729860qka.61.2018.11.23.03.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 03:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ9GG-00083v-Lt
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 06:04:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQ9Fv-0007yM-BS
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 06:04:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQ9Fr-0005eS-94
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 06:04:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50424)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gQ9Fq-0005bm-VB; Fri, 23 Nov 2018 06:04:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 289C836807;
	Fri, 23 Nov 2018 11:04:10 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 543B15D763;
	Fri, 23 Nov 2018 11:04:07 +0000 (UTC)
Date: Fri, 23 Nov 2018 12:04:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181123120405.4b94a220@redhat.com>
In-Reply-To: <20181121231217.GA4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-12-sameo@linux.intel.com>
	<20181114115537.3357921b@redhat.com>
	<20181121231217.GA4450@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 23 Nov 2018 11:04:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/24] hw: acpi: Export and
 generalize the PCI host AML API
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Rob Bradford <robert.bradford@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PHc9p1FoCRWb

On Thu, 22 Nov 2018 00:12:17 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Hi Igor,
> 
> On Wed, Nov 14, 2018 at 11:55:37AM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:34 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > From: Yang Zhong <yang.zhong@intel.com>
> > > 
> > > The AML build routines for the PCI host bridge and the corresponding
> > > DSDT addition are neither x86 nor PC machine type specific.
> > > We can move them to the architecture agnostic hw/acpi folder, and by
> > > carrying all the needed information through a new AcpiPciBus structure,
> > > we can make them PC machine type independent.  
> > 
> > I'm don't know anything about PCI, but functional changes doesn't look
> > correct to me.
> >
> > See more detailed comments below.
> > 
> > Marcel,
> > could you take a look on this patch (in particular main csr changes), pls?
> >   
> > > 
> > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > Signed-off-by: Rob Bradford <robert.bradford@intel.com>
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  include/hw/acpi/aml-build.h |   8 ++
> > >  hw/acpi/aml-build.c         | 157 ++++++++++++++++++++++++++++++++++++
> > >  hw/i386/acpi-build.c        | 115 ++------------------------
> > >  3 files changed, 173 insertions(+), 107 deletions(-)
> > > 
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index fde2785b9a..1861e37ebf 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -229,6 +229,12 @@ typedef struct AcpiMcfgInfo {
> > >      uint32_t mcfg_size;
> > >  } AcpiMcfgInfo;
> > >  
> > > +typedef struct AcpiPciBus {
> > > +    PCIBus *pci_bus;
> > > +    Range *pci_hole;
> > > +    Range *pci_hole64;
> > > +} AcpiPciBus;  
> > Again, this and all below is not aml-build material.
> > Consider adding/using pci specific acpi file for it.
> > 
> > Also even though pci AML in arm/virt is to a large degree a subset
> > of x86 target and it would be much better to unify ARM part with x86,
> > it probably will be to big/complex of a change if we take on it in
> > one go.
> > 
> > So not to derail you from the goal too much, we probably should
> > generalize this a little bit less, limiting refactoring to x86
> > target for now.  
> So keeping it under i386 means it won't be accessible through hw/acpi/,
> which means we won't be able to have a generic hw/acpi/reduced.c
> implementation. From our perspective, this is the problem with keeping
> things under i386 because we're not sure yet how much generic it is: It
> still won't be shareable for a generic hardware-reduced ACPI
> implementation which means we'll have to temporarily have yet another
> hardware-reduced ACPI implementation under hw/i386 this time.
> I guess this is what Michael meant by keeping some parts of the code
> duplicated for now.
> 
> I feel it'd be easier to move those APIs under a shareable location, to
> make it easier for ARM to consume it even if it's not entirely generic yet.
> But you guys are the maintainers and if you think we should restric the
> generalization to x86 only for now, we can go for it.
If code is generic (you can reuse it with arm/virt in the same series)
then place it in hw/acpi otherwise if it's semi-generic put to hw/i386.
If it would be a separate file it would be easier to move it to generic
place when we are able to resuse it with arm/virt.

 
> Cheers,
> Samuel.

