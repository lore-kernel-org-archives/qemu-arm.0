Received: by 10.25.21.96 with SMTP id l93csp330680lfi;
        Thu, 16 Jun 2016 07:00:15 -0700 (PDT)
X-Received: by 10.55.71.138 with SMTP id u132mr5096017qka.1.1466085615523;
        Thu, 16 Jun 2016 07:00:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si26193345qgg.38.2016.06.16.07.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 07:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDXqB-0001qw-0t
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 10:00:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1bDXon-0001BP-He
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 09:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1bDXom-0006Sv-Fj
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 09:58:49 -0400
Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230]:34411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1bDXom-0006SO-1k
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 09:58:48 -0400
Received: by mail-io0-x230.google.com with SMTP id 5so51119198ioy.1
	for <qemu-devel@nongnu.org>; Thu, 16 Jun 2016 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8nqjRiIKX9V2Z8824VPWRwERq8C385xcizoBScqe+oE=;
	b=f8VUc1lVj2hVG3wrMaVYbAq0EbS7+US2dnATH29Mzkqbijs9i3pRWzFXep//r3begi
	CTjb2ew2tdPa0DQ1V219h14ilEqTYy0CFZz1zxaCiN/P6EC0UzTzncOl4NDp2KtWaE7c
	8b668Z/tb3dIUnzdRQFgfu7YRn+E+2i3ana4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8nqjRiIKX9V2Z8824VPWRwERq8C385xcizoBScqe+oE=;
	b=UdMZiy0BqWXttukXPRoOfxE6aq4fbwYKel0kafR67svUmg4ddnXgx47pIzBo3TCRKZ
	l8jLe9Y2jMCup1sEG4qoqKjInG0v3KhlNTCN8os2vRK73zxsGNGqQR+cTZePlpZRd0U8
	ye96mE+ZX/guPnezdXkbwYc4Q4Vl/TGuHzPDgfefLI6OP66ra94Exs4PE67YwPvOq7eB
	wX/zO++qa5P1YAJLv2X6LtSKqHfUS4t+Uox9yWT3YOigLCDeIoQEGt3+SVwwdf66ZDvW
	oSTyCT2oKvkwfGRP/IJIXSUVUxgshqFCrKkBPGlLx51fQ/6JQk4FDO8zMpazYGqXJLMQ
	XqyQ==
X-Gm-Message-State: ALyK8tKk25Q4uGG8ZhLL65almeI9viv2Pr37SI69lVlzAqO4FWJ8ncmik9Tj4FeDtQA4xlDJ7oiniUrHh7PlQJxk
X-Received: by 10.107.40.67 with SMTP id o64mr7643823ioo.183.1466085527231;
	Thu, 16 Jun 2016 06:58:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.116.146 with HTTP; Thu, 16 Jun 2016 06:58:46 -0700 (PDT)
In-Reply-To: <9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 16 Jun 2016 15:58:46 +0200
Message-ID: <CAKv+Gu-1g4FYEaqUWnO25oZVnq9inX_jd7B2RjWd+uhs34CPpw@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::230
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Eric Auger <eric.auger@linaro.org>, Will Deacon <will.deacon@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: njoDyJSoxANM

On 2 June 2016 at 14:45, Alexander Graf <agraf@suse.de> wrote:
>
>
> On 02.06.16 14:32, Peter Maydell wrote:
>> On 2 June 2016 at 13:26, Bogdan Purcareata <bogdan.purcareata@nxp.com> wrote:
>>> A PCI device is marked either as coherent or non-coherent based on the pcie
>>> controller "dma-coherent" property. This is further used when configuring the
>>> IOMMU ops for the device DMA resources (e.g. descriptor rings, for e1000e).
>>>
>>> This dma-coherent property needs to be configured in the guest environment,
>>> in case there's a directly assigned VFIO PCI device. Since the guest only
>>> receives one emulated pcie controller bus - regardless of the host
>>> configuration - add this property if there's at least one host pcie host
>>> controller that is DMA coherent (this implies that the host interconnect
>>> is coherent as well).
>>
>> This patch seems to change the property of the emulated PCIe controller
>> based on the host PCIe controller even if we're not doing any PCIe
>> passthrough at all. That seems definitely wrong to me.
>>
>> (Should the purely-emulated case be marked DMA-coherent anyway?
>> I forget the fiddly details...)
>
> I do too, let's involve a few people who know :). Not exposing it as
> coherent is definitely wrong, but whether "dma-coherent" is the right
> choice I don't know.
>

As far as I understand it, the purely emulated case should be marked
DMA coherent, since otherwise, guest drivers may perform cache
maintenance that the host is not expecting. This is especially harmful
if the guest invalidates the caches after a device to memory transfer,
which may result in data being lost if the data was only present in
the caches to begin with (which is the case for devices that are
emulated by the host)
