Received: by 10.80.163.71 with SMTP id 65csp74187edn;
        Thu, 22 Sep 2016 09:39:27 -0700 (PDT)
X-Received: by 10.237.53.29 with SMTP id a29mr3091519qte.4.1474562367361;
        Thu, 22 Sep 2016 09:39:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w3si1687863qta.144.2016.09.22.09.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 09:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn71y-0006kE-Of
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 12:39:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6Nz-0003AN-D6
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6Nx-0000Ix-Ml
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:58:06 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6Nx-0000Ia-G0
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:58:05 -0400
Received: by mail-vk0-x22e.google.com with SMTP id u196so28833644vkd.1
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nhZGzFLDeKcAI/xOH2fG2Ql2zIOSqmIyqilgRHT7io0=;
	b=YlbIx4D7+9hxrEdpdxqUVbTJ1TXzuaB3mkEgMiL9FJ6MlmAkwSjy+XvxWXqKi3pnz+
	THLvQXt6/tBbUkbIwOJFm0IHAaP7CvKapSmNSQCwmqnpmrr8ZLSjeo0/vTYnp77xUh6M
	xvXv4rsmgil2/9t8d17VRzxBbJo24XVQytu5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nhZGzFLDeKcAI/xOH2fG2Ql2zIOSqmIyqilgRHT7io0=;
	b=cvUWj5Vu3QNeOmB9QseTVE0WsFys+OZCgKA1xwSUdNd+7wkc3YMk4QeVCrOCZM+rxM
	HM5xqpav4H36K6sJWbCjjY7U8gaPP8cvFsygWneLvLq80N3HGRnaVsVKVikCZ38wl88l
	4nnyhuRmXY75I7kgvRrAtxFKvaQA1yNUmggy9ePx7U55CaPTLJunD1TZ1YNJRi/LBmLe
	Y0x8oiX1VGMw44dsyarUdMeFv45tTQlOMSWwXU96B9/o+HR0B5fwGDaoyips6ZecYeZw
	G7Tur/ZFCnOCF2ONbyZR4jVyijAklmDPwDHnd4Dv8//piDPGuIGr5ec0wXSZk3OVUveZ
	PztA==
X-Gm-Message-State: AE9vXwNuQWGwlKRXbFkY1k7SUOwNocJ9emcCQeEvR8sbRxvyV+WFvXnvVM4IfM/vQGLLXgcGuKTrDS+VxOKNKAEL
X-Received: by 10.31.51.70 with SMTP id z67mr1879445vkz.170.1474559884651;
	Thu, 22 Sep 2016 08:58:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 08:57:43 -0700 (PDT)
In-Reply-To: <fdf21190-62cd-dd76-e31e-d32010c9418b@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9qgGw99w9HtZWLyKUwECQnK4b2U8kckmjAtA9+UF7e0A@mail.gmail.com>
	<fdf21190-62cd-dd76-e31e-d32010c9418b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 16:57:43 +0100
Message-ID: <CAFEAcA8nS0Ao5b5_rvWeokAm2wKAKE5ggncGK3BQ-morLQFoHQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/8] vITS support
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8jNKYG2fwez

On 22 September 2016 at 16:53, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 22/09/2016 16:08, Peter Maydell wrote:
>> On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
>>> This series introduces support for in-kernel GICv3 ITS emulation.
>>>
>>> On dt guest the functionality is complete and was tested on Cavium ThunderX
>>> with virtio-net-pci and vhost-net.
>>>
>>> On ACPI guest the series was tested with virtio-net-pci only. For vhost-net,
>>> using MSIX we currently miss the ACPI IORT table generation linking the
>>> PCIe host controller with the ITS. The work is ongoing and will be submitted
>>> separately. Anyway the kernel ACPI IORT ITS node support is not upstreamed
>>> yet.
>>>
>>> The first patch is not really related to virtual ITS but advertises the KVM
>>> GSI routing support which goes along with MSI injection.
>>
>> Patches 7 and 8 are missing your signed-off-by line...
>
> Sure I will add them on top of Shannon's ones. Most credit must be given
> to him though.

Yep; you just need to add yours since the patches have passed
through you as well.

thanks
-- PMM
