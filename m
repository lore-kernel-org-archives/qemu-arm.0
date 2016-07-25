Received: by 10.25.21.156 with SMTP id 28csp1251380lfv;
        Mon, 25 Jul 2016 09:07:11 -0700 (PDT)
X-Received: by 10.13.255.134 with SMTP id p128mr15208251ywf.72.1469462831353;
        Mon, 25 Jul 2016 09:07:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si18316009qka.311.2016.07.25.09.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiPO-0000TY-OR
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiPJ-0000Qq-5L
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiPH-0008Ob-67
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:07:04 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRiPH-0008OU-1z
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:07:03 -0400
Received: by mail-vk0-x22c.google.com with SMTP id x130so250416351vkc.0
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LK9sO02fGe0K9iRwVDIfyh2tJLg2YG0ZdTgv6V09wZw=;
	b=EeEF3H7G7aCbc4ZkU7H1Ytb8l8ifthO8IjLdlLq2hHKVvlNIFXvHJZoQ1zdWHfUcXi
	mh3wveA7YMujI2EjTuIoDr/nhofVdl5P7UDZLxOXSJPhcij6YFlk6kZW4TPh6GsU3+yU
	YC1lsJBsEXt1vdPT3UwSeQYs+WBZ6c+EWw9O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LK9sO02fGe0K9iRwVDIfyh2tJLg2YG0ZdTgv6V09wZw=;
	b=f7KiNmgcKcAQpv82cuR0jQvx6hrtBfnmri53I1VPoO2tQ8fou9KcVRt16WDEhlHAAk
	VfbWPGB3tK9mKQI50dtm5eo/wDUYB63JdcG43shETxWz+h0RELOzRv1guIbrgqqtgo7F
	sCxMj+NXQoP1f0Fg2ZcioeyoCA2BEN+w1zvJUPjXXCUchr2e5uScU1QzWZCOuGgM+OQw
	An9f2hSCNrIt8iz+nRJ+6uij/IY3XxQFhdockh0Rjk/b1V/udsBq51v1ftlM8VKd+5fw
	9tFWjXr5xLL6TIeCu176hr+p5jEswzDnCMOpJlwDwFKuR+oSdSJTziNs6fv9+B+S8AXU
	6HRw==
X-Gm-Message-State: AEkoousdZeUnXWH2uG2os2NtwaUYasjOA2KKX8DTuYq7RyKH5AGrg230EJimZTd4GaIrQBx+kaYGL9P4mNsjQvfN
X-Received: by 10.31.218.198 with SMTP id r189mr8632554vkg.30.1469462822714;
	Mon, 25 Jul 2016 09:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 09:06:43 -0700 (PDT)
In-Reply-To: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 17:06:43 +0100
Message-ID: <CAFEAcA-GZpj-Rb_zU4guGVsdAXYekQc+Yix0yfc8xCA9BtO=ZQ@mail.gmail.com>
To: Kwangwoo Lee <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [RFC PATCH 0/3] add nvdimm support on AArch64 virt
 platform
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Woosuk Chung <woosuk.chung@sk.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Hyunchul Kim <hyunchul3.kim@sk.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RAOfLyunuZia

On 20 July 2016 at 01:49, Kwangwoo Lee <kwangwoo.lee@sk.com> wrote:
> This patch series add an evaluation environment of NVDIMM on AArch64
> virt platform. Three parts need to be implemented to make this feature
> working properly.
>
> 1. memory hotplug on arm virt platform
> 2. configurable ACPI IO base and size both for i386 and arm platform
> 3. enable NVDIMM on arm virt platform
>
> The memory hotplug is required to recognize DIMM type memory and this
> is also used for NVDIMM device recognition.
>
> The ACPI IO base and size need to be changed on creating ACPI NFIT
> because arm platform uses memory-mapped IO which is different from
> i386 platform. Thus, this patch set includes the changes of setting
> ACPI IO base and size during NVDIMM initialization.
>
> The last part enables NVDIMM on arm virt platform. The feature is
> disabled by default. So explicit option - nvdimm=on - is required to
> enable the feature.

Thanks for this patchset. Could you provide a brief summary of
why this is interesting/useful for the benefit of people who don't
know what an NVDIMM is, please?

thanks
-- PMM
