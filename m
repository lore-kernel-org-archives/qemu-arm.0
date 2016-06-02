Received: by 10.25.27.66 with SMTP id b63csp684300lfb;
        Thu, 2 Jun 2016 05:34:15 -0700 (PDT)
X-Received: by 10.55.15.30 with SMTP id z30mr41431930qkg.187.1464870855190;
        Thu, 02 Jun 2016 05:34:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10si12107625qgs.44.2016.06.02.05.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 05:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8RpG-00036q-HP
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 08:34:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Ro6-0002Zq-MH
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 08:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Ro4-0005pg-Kk
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 08:33:01 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8Ro3-0005oT-ML
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 08:33:00 -0400
Received: by mail-vk0-x231.google.com with SMTP id a6so68227743vkg.3
	for <qemu-devel@nongnu.org>; Thu, 02 Jun 2016 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ASSWC4HeJuW+Er1P6TZrdB6IBaVj2mcV2CNvi7kmKc0=;
	b=D+jWw0ZCyisW7390X9Y6KHymm5GnMKEGI25gEraSVtX4/BGtyUFL1LajPDSWEVYsaK
	ppAhxBmkkn0G3Go0okOt+PKscDd5rdnm36QvrTGkTTTowBTRSlsGurOE14qCQ6Di8daJ
	7aMlE2H3NC3o1xJaQ8cv/Odf8sx1RlAG52kB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ASSWC4HeJuW+Er1P6TZrdB6IBaVj2mcV2CNvi7kmKc0=;
	b=hv8qRW7XPOGF1fM+qzoeO9m+6qS91T0q+vHGBwMoV3LbREg4uxKTML4OLywdsN/Zo/
	iG8e8yxgJ7raAOr5zHUtDflwLg9j08XR32nbhEs1Ibrw7gIa2EgjvbZE2nFqKVEKUbBi
	B3sznG3baExjt20K1U6hbVcUEaqMXmw2PoMBaXl28oTwnacoryEot+g8MqrMTI+8IX/I
	wLxMHJiTAwzvEUpK2rKg4jTcix5ianzhTGInLOyK2WD5/eJPTO4oRAfZM+A1Le1wFmed
	zbGu0uPPYdQGuY2rWN8tjIhR42FMA0x0VuEX8ADeJ17Pzqp+glZyW0+s0xeO5BozVQri
	xVFg==
X-Gm-Message-State: ALyK8tJsp0U2TfsyjKCgEQvzjB1ydVqUhrTq7IIH9XmoIgPWDXwqxlpiDN7+VnFfeB4sWOrQyllLa5eBcIxULwPf
X-Received: by 10.176.0.182 with SMTP id 51mr4542057uaj.4.1464870779083; Thu,
	02 Jun 2016 05:32:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Thu, 2 Jun 2016 05:32:39 -0700 (PDT)
In-Reply-To: <1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jun 2016 13:32:39 +0100
Message-ID: <CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mwfMkDSHOF4W

On 2 June 2016 at 13:26, Bogdan Purcareata <bogdan.purcareata@nxp.com> wrote:
> A PCI device is marked either as coherent or non-coherent based on the pcie
> controller "dma-coherent" property. This is further used when configuring the
> IOMMU ops for the device DMA resources (e.g. descriptor rings, for e1000e).
>
> This dma-coherent property needs to be configured in the guest environment,
> in case there's a directly assigned VFIO PCI device. Since the guest only
> receives one emulated pcie controller bus - regardless of the host
> configuration - add this property if there's at least one host pcie host
> controller that is DMA coherent (this implies that the host interconnect
> is coherent as well).

This patch seems to change the property of the emulated PCIe controller
based on the host PCIe controller even if we're not doing any PCIe
passthrough at all. That seems definitely wrong to me.

(Should the purely-emulated case be marked DMA-coherent anyway?
I forget the fiddly details...)

thanks
-- PMM
