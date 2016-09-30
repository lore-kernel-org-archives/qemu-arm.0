Received: by 10.80.163.71 with SMTP id 65csp604296edn;
        Thu, 29 Sep 2016 17:40:02 -0700 (PDT)
X-Received: by 10.200.41.71 with SMTP id z7mr4539123qtz.107.1475196002703;
        Thu, 29 Sep 2016 17:40:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t46si10452358qtt.28.2016.09.29.17.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplru-0004jP-5k
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrn-0004hM-MJ
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrl-0007Hu-D0
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:54 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrl-0007Hl-8X
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:53 -0400
Received: by mail-vk0-x235.google.com with SMTP id y190so59143828vkd.3
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sq1QAwVuqT+7IfDK4RxetD/K1uSn+RNMco+S6FfQUMY=;
	b=PGEInrHIjk2PPNm924IOvF1TwI6i4kfzstsUjYJQ1RrL1QlENa3vuyi4mqvbDN7Fjo
	X0EQy2H7dSpVPkCtQ9N92EiPyYV0MIuXmx5ekquGxHABS5vG5bMHidmb/LJy8UPfFz/c
	VS1k+9twFj+M4YyVawsdZyueaXJUswro9t5QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sq1QAwVuqT+7IfDK4RxetD/K1uSn+RNMco+S6FfQUMY=;
	b=UphOmxmt8wC+02Cq3RAMMyTHPdGlvVPUKot5LMkLKr0n5GFBE6lDi6iCj/VrQ0vVXv
	NiQ413oGvfP3sKAijDoGK/vgwox1n6fWTtzzicXlOXVQB9/nI9U3gquelBrtqyorH70p
	OtXFqxM5tzw+5bnH+nb0Ixd+3LQCVOHcaOeivCX3xb5MJngrv85kcLoCZYPMgCVVLMkr
	4zB1JYV4dn4GbucC/2Agzfhz5/WX7Crr0B/1kOTufW823BeyH+UCLO7pJCngdhaJOknQ
	5wE6vOVaeeerDT9PA3CJcb9u6aNJ/QK0oHWkuJ4GnebBsoG+ruF1edrMiNlkx7J1gQhM
	SELg==
X-Gm-Message-State: AA6/9Rn6V+fCoXKOzDEBIJMcnjcFtpMzzowpRU7Ttman2eXnVNknfBKbXXS3pwNyB0xPohWP1pGKq08qWdaEN5Ti
X-Received: by 10.31.165.83 with SMTP id o80mr3708719vke.95.1475195992831;
	Thu, 29 Sep 2016 17:39:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:39:32 -0700 (PDT)
In-Reply-To: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:39:32 -0700
Message-ID: <CAFEAcA-dy1nN327yDB+oFAnYXTj4ucGXgadWLZK=YPMDoKW+3Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH v7 0/8] vITS support
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
X-TUID: WZ/w3cT7+cja

On 23 September 2016 at 00:43, Eric Auger <eric.auger@redhat.com> wrote:
> This series introduces support for in-kernel GICv3 ITS emulation.
>
> On dt guest the functionality is complete and was tested on Cavium ThunderX
> with virtio-net-pci and vhost-net.
>
> On ACPI guest the series was tested with virtio-net-pci only. For vhost-net,
> using MSIX we currently miss the ACPI IORT table generation linking the
> PCIe host controller with the ITS. The work is ongoing and will be submitted
> separately. Anyway the kernel ACPI IORT ITS node support is not upstreamed
> yet.
>
> The first patch is not really related to virtual ITS but advertises the KVM
> GSI routing support which goes along with MSI injection.
>
> For ACPI ITS and PCIe support, use in-flight Tomasz' series:
> - [PATCH V10 0/8] Introduce ACPI world to ITS,
>   https://lkml.org/lkml/2016/9/6/153
> - Support for ARM64 ACPI based PCI host controller,
>   https://lwn.net/Articles/690995/
>
> Git Information:
> v7: https://github.com/eauger/qemu/tree/v2.7.0-vITS-v7
> v6: https://github.com/eauger/qemu/tree/v2.7.0-vITS-v6

Applied to target-arm.next, thanks.

-- PMM
