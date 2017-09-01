Received: by 10.223.188.70 with SMTP id a6csp683437wrh;
        Fri, 1 Sep 2017 00:37:40 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5PhV4ABObxj9MzA/WawfD+M9+fiyNXBRhYTwJgynOmHlbAGi5+sBGwBWgjI0uBhCmf97wE
X-Received: by 10.200.27.239 with SMTP id m44mr1420325qtk.206.1504251460495;
        Fri, 01 Sep 2017 00:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504251460; cv=none;
        d=google.com; s=arc-20160816;
        b=gemPnSazdV7HjjffAeFfIB25FgRWDLfYbsz3q4SQk+2L6K2vLqnC32uBrfDwAwsrm1
         Kcf+8FqjKmNRTpS3uL2rK46UkQ/0f/VwBWHlC+bTqD7NaWqVNRlfu0civhnw/9+bJta5
         /UgZ5SZJDIBuN2Z6xDKzdtEeeTdELROhA50+8Px1u9ZT6UyfASV0/AO9GaYzugXfnkbH
         V6Xk8FLixbTOzvyzDk7J/UbvvOso5UspyzeO9fGt3yg9fS3IRsk+PL+5rdYrYVNWnbRn
         TxtilN1y7IitWrLfICStaPd/I1CNSEyn0POADomapeqa3LsqbHDGICDMBZiSGNa1APtJ
         oTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=NZzs9BvDMdll6v3PbcPWilrYFjSKw7ZEPDQ1MuqBEsk=;
        b=u2+K8e1wCu0Wn4TLqH2prses2w7BI82AMjQfwmstpvN3Yji5gL20x56nCbxfJfSaIC
         UMz2cis7MKO6vsxWlLR7bJZlfPWwL9kyF/X/ZjY15+d+LTuLdpvKISr980i+vehXZmsG
         gbx5unSdMR8LHwS2ITtudZ0FLsrKlYU5A7dmx0tCMBrggiqcrQqS+qKBxmwXoNMI1sid
         mGyLWg9s3/gRl78ZX6XuP9hp34qJGL8DXrmPEJznPDtr9Zkq885rtSKdpYnh3kQXZIG0
         560F+QmEEOcBWNLQ2bGcfnbcMHIhuRz4KmxjJ0A/GUA1ilRNkD5H+8O2QrRO2C3TDdX/
         Syug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w67si9548183qkc.234.2017.09.01.00.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 00:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dngWI-00058A-6O
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 03:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dngW5-00054a-PM
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 03:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dngW1-00042W-Pf
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 03:37:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dngW1-000422-Jn; Fri, 01 Sep 2017 03:37:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BEECC047B74;
	Fri,  1 Sep 2017 07:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7BEECC047B74
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10FD26F95C;
	Fri,  1 Sep 2017 07:37:10 +0000 (UTC)
To: eric.auger.pro@gmail.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ef76ffc0-0303-9227-7b05-0325e443819f@redhat.com>
Date: Fri, 1 Sep 2017 09:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 01 Sep 2017 07:37:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RESEND v3 0/3] Generic PCIe host bridge INTx
 determination for INTx routing
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
Cc: Feng Kan <fkan@apm.com>, drjones@redhat.com, agraf@suse.de,
	christoffer.dall@linaro.org, pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C3hq0XNnSCk0

Hi,

On 09/07/2017 23:02, Eric Auger wrote:
> This series implements INTx to gsi routing for ARM VIRT/Gpex. This is
> a respin of [1] which was lost in limbo.
> 
> ARM virt uses GPEX PCIe bridge. This latter does not implement INTx
> to GSI routing. PCIe/INTx assignment works but the consequence is
> irqfd is not used along with INTx interrupts and VFIO INTx handlers
> are executed on userspace leading to an important performance degradation.
> 
> This issue is witnessed by the following messages;
> 
> qemu-system-aarch64: -device vfio-pci,host=0006:90:00.0: PCI: Bug -
> unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
> qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
> 
> So with this series, irqfd is set up for PCIe/INTx passthrough and we get
> the optimal performance. Also we get rid of the above messages.

If I haven't missed anything, I have not received any comment on this
series despite ping and resend since mid June. Now most of the 2.10 rush
is behind, please can anyone have a look?

The BUG message hits when your assign a PF and performance is largely
decreased whenever INTx are used during passthrough.

Thanks

Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.9-gpex-intx-v3
> 
> References:
> [1] Generic PCIe host bridge INTx determination for INTx routing
>    https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html
> 
> 
> Pranavkumar Sawargaonkar (3):
>   hw/pci-host/gpex: Set INTx index/gsi mapping
>   hw/arm/virt: Set INTx/gsi mapping
>   hw/pci-host/gpex: Implement PCI INTx routing
> 
>  hw/arm/virt.c              |  4 ++++
>  hw/pci-host/gpex.c         | 22 ++++++++++++++++++++++
>  include/hw/pci-host/gpex.h |  3 +++
>  3 files changed, 29 insertions(+)
> 
