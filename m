Received: by 10.25.27.66 with SMTP id b63csp689889lfb;
        Thu, 2 Jun 2016 05:46:33 -0700 (PDT)
X-Received: by 10.55.197.221 with SMTP id k90mr33956428qkl.89.1464871593701;
        Thu, 02 Jun 2016 05:46:33 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j75si24049236qkh.196.2016.06.02.05.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 05:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8S1B-0008BT-0V
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 08:46:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8S02-0007hL-6P
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 08:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8S01-0000vR-7h
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 08:45:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:51072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1b8Rzv-0000uk-KF; Thu, 02 Jun 2016 08:45:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D81F1ABA6;
	Thu,  2 Jun 2016 12:45:12 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
From: Alexander Graf <agraf@suse.de>
Message-ID: <9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
Date: Thu, 2 Jun 2016 14:45:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwp1ZsdqPDxZ



On 02.06.16 14:32, Peter Maydell wrote:
> On 2 June 2016 at 13:26, Bogdan Purcareata <bogdan.purcareata@nxp.com> wrote:
>> A PCI device is marked either as coherent or non-coherent based on the pcie
>> controller "dma-coherent" property. This is further used when configuring the
>> IOMMU ops for the device DMA resources (e.g. descriptor rings, for e1000e).
>>
>> This dma-coherent property needs to be configured in the guest environment,
>> in case there's a directly assigned VFIO PCI device. Since the guest only
>> receives one emulated pcie controller bus - regardless of the host
>> configuration - add this property if there's at least one host pcie host
>> controller that is DMA coherent (this implies that the host interconnect
>> is coherent as well).
> 
> This patch seems to change the property of the emulated PCIe controller
> based on the host PCIe controller even if we're not doing any PCIe
> passthrough at all. That seems definitely wrong to me.
> 
> (Should the purely-emulated case be marked DMA-coherent anyway?
> I forget the fiddly details...)

I do too, let's involve a few people who know :). Not exposing it as
coherent is definitely wrong, but whether "dma-coherent" is the right
choice I don't know.


Alex
