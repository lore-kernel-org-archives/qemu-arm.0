Received: by 10.25.208.211 with SMTP id h202csp1456292lfg;
        Tue, 16 Feb 2016 10:28:18 -0800 (PST)
X-Received: by 10.140.18.172 with SMTP id 41mr28767766qgf.7.1455647298795;
        Tue, 16 Feb 2016 10:28:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si41801317qkb.35.2016.02.16.10.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkME-0004lk-5E
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:28:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkHo-0007y4-Th
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:23:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkHn-0000uR-UJ
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:23:44 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkHn-0000uG-Q4
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:23:43 -0500
Received: by mail-vk0-x235.google.com with SMTP id k196so141788937vka.0
	for <qemu-arm@nongnu.org>; Tue, 16 Feb 2016 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CkGgjiqbKzxsm8RMqel/WjlRTJOlyneCEQZN/dFam/o=;
	b=FuTInPXdg9sRYtRQ6qe6M9veVDW3BbCiZcftz7Baktg93GjYSspW3jFx1thOkZVOdg
	qDiSnmhkH7Pe6o7zixndYLuhka0IyuEjs0cm85vwzxG9FvLQ591tCiC0oIxxVIcusr4b
	FZxa/5b2sbMfEEeKO1iAWeRrE5Fdjdv0ubhTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CkGgjiqbKzxsm8RMqel/WjlRTJOlyneCEQZN/dFam/o=;
	b=THqQwLHrAwqEW613fWJKnIs6jcDvWyo9SDkSi+dxkAz4f8ejYA18yOipuacHeHUV0u
	fH8UuHuYHTFy4mjICM/RreYTDBzCISPA23ZHdNgd+ZnNcSflTYK9ZNB5TDuy2BtrsHLr
	+tw6zf2nNsCrpKKBysnsr8u6pgPWdqS4zkN/l64a5rR1+6EHMSn/fHc06wAbt+tgVGT1
	qoFyvyDDgw2BRfg5qPaX86icF7fyk0P9FLahw8DaqPg1GkBq8ETU4Sy5KMqCSy61Wx/u
	ll8Pu16O8o28TcxItUO4Mhxy0Gq6vfr5pqA+k3RpxpMSQusW47O3DnS+GSG+C3HWlg4d
	v0UA==
X-Gm-Message-State: AG10YORnzipiu9/VMRFqHTo6bB3tH31UwmpxVm3//MXi+9cyW8X01/pNkY15iHtj5ZCVMse9hDJFbWf5r2rCCjk3
X-Received: by 10.31.180.85 with SMTP id d82mr16792954vkf.83.1455647023431;
	Tue, 16 Feb 2016 10:23:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:23:24 -0800 (PST)
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:23:24 +0000
Message-ID: <CAFEAcA-3Nw_Hca6Ub7pKCYDSVHesArQ=hkrnuxR-Ve8OHG8QKg@mail.gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 0/8] KVM PCI/MSI passthrough with mach-virt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H7rbkhpBKnQL

On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
> This series enables KVM PCI/MSI passthrough with mach-virt.
>
> A new memory region type is introduced (reserved iova). On
> vfio_listener_region_add this IOVA region is registered to the kernel with
> VFIO_IOMMU_MAP_DMA (using the new VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA flag).
>
> The host VFIO PCI driver then can use this IOVA window to map some host
> physical addresses, accessed by passthrough'ed PCI devices, through the IOMMU.
> The first goal is to map host MSI controller frames (GICv2M, GITS_TRANSLATER).
>
> mach-virt currently instantiates a 16x64kB reserved IOVA window. This
> provisions for future usage. Most probably this exceeds MSI binding needs.
> To avoid wasting guest PA, we now map the reserved region onto the
> platform bus MMIO.
>
> The series includes Pranav/Tushar' series:
> QEMU, [v2 0/2] Generic PCIe host bridge INTx determination for INTx routing
> ((https://lists.nongnu.org/archive/html/qemu-devel/2015-04/msg04361.html))
>
> Those patches are not mandated for PCI/MSI passthrough to work but without
> those, the following warning is observed and can puzzle the end-user:
> "qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)"

I've replied with comments about the parts I care about; I'm leaving
the rest of the review to others (VFIO related, etc).

thanks
-- PMM
