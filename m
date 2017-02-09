Received: by 10.25.77.65 with SMTP id a62csp92355lfb;
        Thu, 9 Feb 2017 09:53:07 -0800 (PST)
X-Received: by 10.55.87.194 with SMTP id l185mr3936772qkb.209.1486662786875;
        Thu, 09 Feb 2017 09:53:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si8533441qtz.93.2017.02.09.09.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 09:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbsu0-0003qO-8x
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 12:53:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbssQ-0002Sz-9t
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 12:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbssP-0001NV-Fv
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 12:51:26 -0500
Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232]:35961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1cbssP-0001NE-C0
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 12:51:25 -0500
Received: by mail-io0-x232.google.com with SMTP id j13so22981600iod.3
	for <qemu-devel@nongnu.org>; Thu, 09 Feb 2017 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sn581BTBnSEp5AHuQ5HH1+wfaX/qPEaAIgLePGqpV+A=;
	b=M+YQ5psrM3gyQbhV24ARN6lRPr2/4vLLY0DD3XYpWLaoIfWFUS/HkNyc3+trqlHmHg
	tkcl1Qq791AiuFOdxtFEdqxcajDW2gOWf81Xdbth/tui+w9Q0PDz8Ss55shQjK6VWTBo
	l8rymim4VwTYUeV7hQKiWJhMufZNLJ++kNHrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sn581BTBnSEp5AHuQ5HH1+wfaX/qPEaAIgLePGqpV+A=;
	b=R3mkzRK8SbUy+tLMbaWWSX1PRSuzmpxpqPxni+ElFUVRqcSY7CaFYVC8L8aBPY+iCP
	zUNk1J59epF1kJj2xNldLoK7OxPmzE4fqihGpqp0DwRfmTRG6IAeB1Hlsg7LRUx26roG
	X3al8q2GEryCkORXl5eUQge0o7GrbzmdNk+YKAVlE8DAHOCZ4qiImSip4s56XfES80oH
	EQWw0oJaHmgcWExLhZMSuY/vOLddzXklmrj7So8TEo+L8xGknGktH5IGS19vbbubUmHk
	dQSZmJLi+7kVf0h+UBRGHEtTx7AQIhVBHbetEXk1+xqSmZHpPve026zS3U0IRAYoHvDr
	jYrw==
X-Gm-Message-State: AMke39ngC6/PKOnTdDHObhMw3mXI/WwdwrGL6b8ZQOYVtSOebDms3hwZWIs0U2LQftBOg7R+8kAz6MiF5kzmWT2l
X-Received: by 10.107.53.17 with SMTP id c17mr4159440ioa.45.1486662682911;
	Thu, 09 Feb 2017 09:51:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.144.139 with HTTP; Thu, 9 Feb 2017 09:51:22 -0800 (PST)
In-Reply-To: <1486644810-33181-1-git-send-email-agraf@suse.de>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 9 Feb 2017 17:51:22 +0000
Message-ID: <CAKv+Gu_jrB4eJiR-j+no3OcHi68wusne5HosVL+Ri_y2Mowe_g@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::232
Subject: Re: [Qemu-devel] [PATCH v2 0/4] target-arm: Add some omitted dma
 cache coherency flags
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
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXMQnm+yaMNV

On 9 February 2017 at 12:53, Alexander Graf <agraf@suse.de> wrote:
> ARM is amazing when it comes to cache coherency and VMs. While any sane
> architecture allows the host to override the guest's caching attributes,
> that's very hard to do on ARM.
>
> That means that the guest may directly access guest memory bypassing the
> cache while QEMU happily writes to / reads from cache. The end result is
> very nasty, because both sides see very different views of the world.
>
> That means that we need to be very cautious to tell guests that devices
> that QEMU emulates are going to use data in the cache rather than directly
> on memory.
>
> We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark the PCIe
> host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/virt-
> acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio or
> fw-cfg in DT or ACPI tables.
>
> This patch set adds the respective cache coherency flags for them in both DT and
> ACPI.
>
> Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken because of
> this. Upstream realized quickly enough that every user of virtio-mmio out there
> describes its cache coherency incorrectly and reverted the patch that would
> require said dma coherency flag. But we should be safe for the future and "do
> the right thing".
>
> Alexander Graf (4):
>   target-arm: Declare virtio-mmio as dma-coherent in dt
>   hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
>   hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
>   hw/arm/virt: Declare fwcfg as dma cache coherent in dt
>

This looks correct to me.

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
