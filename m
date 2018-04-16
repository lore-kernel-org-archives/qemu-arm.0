Received: by 10.28.4.212 with SMTP id 203csp2597196wme;
        Mon, 16 Apr 2018 05:33:59 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49quTjS0oJoR7lSAji1U0zyHJnwnqPcnL+61ezlaTTEWIBqhh/Qh235QdObbIcCaHZM+UTL
X-Received: by 10.55.65.65 with SMTP id o62mr16525416qka.270.1523882038970;
        Mon, 16 Apr 2018 05:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523882038; cv=none;
        d=google.com; s=arc-20160816;
        b=ogJPoFq8uqn4BZWeOhCRxoADG02p5xIuTkq0q6nVsTUu1wDF0HJaQ3eUxuHndmPpcl
         PgI3rQY3wtPzOeObMWLS83axBBAKZFCeXY4+0Ug8Li9w82As6syWi9FVvItK/9im6NsQ
         tmaEl39zp1iP8leB/TPc2fdbsIJlPQeu0OPpeXoEXwbRQ1V1dfcEYUqTCj28KHe8im+a
         H2e83LF5CX3jg9YGm9jTj0vShYrzfV56we8dABCXr0NX38+gGkOi4s+9osPRxhN4zaxB
         BzjPIpY51GBIKgg1X4cdEHXVMvJrb8pj99+9cIWo/RFLAlFc+t9+rixikJa66r8D8O+L
         dA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ol7y3++PJ01wBtKjrS+XVVaVwZ+Z74KhmYttOdSiRjo=;
        b=CVpEK3FbBbUdY9yhCrN8WPv6iPDB1eE50sdeDgUQ5l81qZX7wAbRe55gzVrWtm215f
         0otWajvDPrQ9E050ELjp5Mw05zwPMv9c4yd/+2j3N4mNYv03LFT2rNJ/0/r6KP7ZSA7D
         xjre3eD0aSf6kud5pMNYFhaQEYSc96oZcFmMTkJ+oqRA6Z9ilKTm2xXWink7sd6aCLSn
         u5ad+K8Jeh8klrQdcXncp+Fwq+M+LCAQ+vpfOWlodB4Puqflxev+8QL/AyngzFyALQV7
         JUMX/yVqChXL+T+0MMzoaad95F6qa7e4UA3+bX2iEtOsznCa4GP3wOLBxdphcdExkMUC
         ShRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VePKqV1Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si4103609qtp.43.2018.04.16.05.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 05:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VePKqV1Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f83KY-0006UZ-Fx
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 08:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83K5-0006Sh-7d
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 08:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83K4-00057L-9l
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 08:33:29 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f83K4-00056v-45
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 08:33:28 -0400
Received: by mail-oi0-x242.google.com with SMTP id 126-v6so14310600oig.0
	for <qemu-devel@nongnu.org>; Mon, 16 Apr 2018 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ol7y3++PJ01wBtKjrS+XVVaVwZ+Z74KhmYttOdSiRjo=;
	b=VePKqV1Q0cucP6s5b70j+euPNqpoSyA7LTezjq/dxVWjnla1ohE5oc6ZbYYHPmxquJ
	C4IGwXDyx2sFmt+d3cO5mO7wAUS57Lrd0+VzAO8Pimh1tBPUjgMyp1wyakAP0krYxWT2
	ZuN4kOljay6es7FIhGHdjxmCfcJpfospa6z1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ol7y3++PJ01wBtKjrS+XVVaVwZ+Z74KhmYttOdSiRjo=;
	b=ZYJAkmFqFxytlpH/nu2T8zG14bHohKxXWqcfUbemBX9TTaE3vGyWF+3QJ47NWJNRMl
	rlkBb5hsFfGXvSkH4MFwqajOd1SVHs53pg9pSveipzOeV4CNsXd7XJJ4FaM1SeAhLby8
	GvM5jxesn3f9hfQf/X91ALXFNKD3ZLkM0JT5a1+8BizifcG/S9V4lVILXauzDZuoRXCu
	VRMV5+mu2nh9RneymXfLSMWSWRUFBlEJ9DvMOg0cfmc019GPxWpCqC46xS4GIp9YzDHC
	1t14xxpH7FaNtDQ8myqB6M8hW435ZcIBbtmTvCBFMOQWRIGi+eg02KjgrqKQLpv2+uLA
	5tIA==
X-Gm-Message-State: ALQs6tD8mlpCjXGoya71t5nnpKoqYNy/TOm8ydnuPcN1FT6jnQ+/FVHq
	z7vmZt0Ir7undWiR0epr1ZrxMXjW5dg0FgNw9NtANQ==
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr14940343oif.12.1523882007361; 
	Mon, 16 Apr 2018 05:33:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 05:33:06
	-0700 (PDT)
In-Reply-To: <1523518688-26674-3-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 13:33:06 +0100
Message-ID: <CAFEAcA-SM6DkdpEcC6eSOvrjLOMC2cpxyaWjS3ezcp_EnvCjFA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v11 02/17] hw/arm/smmu-common: IOMMU memory
 region and address space setup
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eyi8knRxfLHr

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> We set up the infrastructure to enumerate all the PCI devices
> attached to the SMMU and create an associated IOMMU memory
> region and address space.
>
> Those info are stored in SMMUDevice objects. The devices are
> grouped according to the PCIBus they belong to. A hash table
> indexed by the PCIBus pointer is used. Also an array indexed by
> the bus number allows to find the list of SMMUDevices.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> ---
> v9 -> v10:
> - comment functions added to the header
> - g_free(name)
> - renamed smmu_find_as_from_bus_num into smmu_find_smmu_pcibus
> - add a comment about lazy init in smmu_find_smmu_pcibus
> - add a trace event when creating the smmu iommu mr
>
> v8 -> v9:
> - fix key value for lookup
>
> v7 -> v8:
> - introduce SMMU_MAX_VA_BITS
> - use PCI bus handle as a key
> - do not clear s->smmu_as_by_bus_num
> - use g_new0 instead of g_malloc0
> - use primary_bus field
> ---
>  hw/arm/smmu-common.c         | 69 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events          |  3 ++
>  include/hw/arm/smmu-common.h |  8 +++++
>  3 files changed, 80 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e086ff5..9a966bb 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -28,8 +28,69 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
>
> +/**
> + * The bus number is used for lookup when SID based invalidatation occurs.

"invalidation"

> + * In that case we lazily populate the SMMUPciBus array from the bus hash
> + * table. At the time the SMMUPciBus is created (smmu_find_add_as), the bus
> + * numbers may not be always initialized yet.
> + */


> +/* Return the stream ID of an SMMU device */
> +static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
> +{
> +    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;

I think this is PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn)
and I suspect the mask with 0xff is unneeded (compare pci_get_bdf()
and amdvi_do_translate(), which just assume the bus number is sane).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
