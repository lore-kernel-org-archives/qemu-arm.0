Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1302449wrt;
        Tue, 27 Nov 2018 05:57:31 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U1YiDuELflmcHAoaYaSzRv3Sjjd276b5lsNE7/bEfjRVnYlTtFNO4GwC0VhpER/FrQHmeR
X-Received: by 2002:a25:ad11:: with SMTP id y17-v6mr32819595ybi.341.1543327051846;
        Tue, 27 Nov 2018 05:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543327051; cv=none;
        d=google.com; s=arc-20160816;
        b=oFyAr8fH8AO1mf9dkKuj3myuDAyFqbCzZiasnwsWNCmksVV5M1W6POUjMvy4HfVNcr
         QsfrBXOSu0ZyuCyzeNzcWLKq8R+UhyZZkzgzgzRK1wx9Z5bdz0FEYtrRuoLKHUkYlFgl
         KuaJoQSwioJXXBnIrmgFyzY65Q9WTHb7ZJJ2tQFtNcH7uArbqjC/JsHwKXK/bzjxz03r
         8oxVkbSMOAf6soQ7Ue/OHahtelWqvwXNHEKT7qrOVvuuXG4a1og4w/UMqDPnKFp2Euwx
         dSTKCywzaGkr/pP0C/RN4WO2N1/sGZI3TzrOnAo3t2UhDXgDm7KOEmONF10ldRUWo9Pu
         DT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cDCHBjBvPm7bHIyfGrWvI5EUGrTyMgKvBW0SnpyRN/E=;
        b=vokhfkUSid9FfgOu76QzhMO17v1Su8pmWQyS6PtKthbjuoggMUefW40CYfZwG+hVT1
         +AdW2e25J0DAjqhcNkSVxOsmo6q8NqvsM/VngCXMoHrnM5w81mob4noFkItMZJEvrD4B
         jK5XM6F+2BuBkfpxlpOqm3JuYvciFkWhcm8VdjfCLQpW8Lwdys2U8SgWkgXJp7vqAeEz
         YpyJ3ncX352DdN004tTVoFXUrqSFyYdfQ2ZFwtcyo8rvwZhzWLB2PFuwFtSJosfxfcuw
         IvV4gZSFHufKc+2wr5gfNK++z+34pW6oPjXKPAXi1RUoYvFmGwttXeO4+4yLUxKItiqE
         n5dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si2607137ywd.420.2018.11.27.05.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:57:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRdrn-0007I6-8T
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:57:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRdp3-0005Ed-UD
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:54:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRdp2-0008OX-Da
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:54:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRdov-0008FK-MW; Tue, 27 Nov 2018 08:54:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB66231256A8;
	Tue, 27 Nov 2018 13:54:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86B20105B1EF;
	Tue, 27 Nov 2018 13:54:17 +0000 (UTC)
Date: Tue, 27 Nov 2018 14:54:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127145415.17b49d64@redhat.com>
In-Reply-To: <20181121232106.GB4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-13-sameo@linux.intel.com>
	<20181115133658.2cdbd918@redhat.com>
	<20181121232106.GB4450@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 27 Nov 2018 13:54:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 12/24] hw: acpi: Export the MCFG getter
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ObJhQM8oBZsF

On Thu, 22 Nov 2018 00:21:06 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Hi Igor,
> 
> On Thu, Nov 15, 2018 at 01:36:58PM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:35 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > From: Yang Zhong <yang.zhong@intel.com>
> > > 
> > > The ACPI MCFG getter is not x86 specific and could be called from
> > > anywhere within generic ACPI API, so let's export it.  
> > So far it's x86 or more exactly q35 specific thing,  
> It's property based, and it's using a generic PCIE property afaict.
> So it's up to each machine type to define those properties.
> I'm curious here: What's the idiomatic way to define a machine
> setting/attribute/property, let each instance define it or not, and
> make it available at run time?
> Would you be getting the PCI host pointer from the ACPI build state and
> getting that information back from there?

Cleaner way would be make arm/virt board set PCIE_HOST_MCFG_BASE/
PCIE_HOST_MCFG_SIZE properties and then use common build_mcfg()(in aml-build.c).
Something like this:
  acpi_setup_reduced()
     AcpiMcfgInfo mcfg_info = {
       .base = object_property_get_uint(pcie, PCIE_HOST_MCFG_BASE, NULL),
       .size = object_property_get_uint(pcie, PCIE_HOST_MCFG_SIZE, NULL)
     };
     acpi_build() {
         build_mcfg("MCFG", &info);
     }
  }
and for legacy q35
  acpi_build() {
     if (pcie) {
        AcpiMcfgInfo mcfg_info = {
          .base = object_property_get_uint(pcie, PCIE_HOST_MCFG_BASE, NULL),
          .size = object_property_get_uint(pcie, PCIE_HOST_MCFG_SIZE, NULL)
        };
        if (mcfg_info.base != PCIE_BASE_ADDR_UNMAPPED)
            build_mcfg("MCFG", &info);
        else
            /* move comment here why we are doing it */
            build_mcfg("QEMU", &info);
     }
  }

The thing I don't like about acpi_get_mcfg() is that it
does lookup acpi_get_i386_pci_host() each time it's called
and judges if it's PCI-E host by presence of properties.

I'd rather be explicit where PCI host be fetched once somewhere
in acpi_setup() or possibly passed down from the board as an argument
and board telling to i386/acpi_setup() if it's PCI or PCI-E host
so we don't have to guess it in acpi code.


> Cheers,
> Samuel.

