Received: by 10.25.30.65 with SMTP id e62csp815986lfe;
        Tue, 24 May 2016 09:14:39 -0700 (PDT)
X-Received: by 10.55.102.21 with SMTP id a21mr4226716qkc.69.1464106479478;
        Tue, 24 May 2016 09:14:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c69si3189048qkb.11.2016.05.24.09.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Eyc-0004iQ-Qg
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:14:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5Eya-0004iJ-26
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5EyW-0000G8-3D
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:14:35 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5EyV-0000Fd-US
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:14:32 -0400
Received: by mail-vk0-x233.google.com with SMTP id f66so28386322vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o90EsX0lanLdmtaOBU/ZOSJuRPkOa7djYUDlWfKnVWM=;
	b=Bd4fOZRFOmOrhjAppDYAqS/QjYKXBYn423jMEW4hsFo38d9sKxrZQ59NUuaI1mXuaw
	mhhDSDW1w9k2oCOfSRkWCSf30EaSGmS1dAOFv6JmAYL5sfxLHqtcitkVmxDc0FWY84rG
	hMDHkds7abJUIwffvtvmte2s2TtD3LEqKSKHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o90EsX0lanLdmtaOBU/ZOSJuRPkOa7djYUDlWfKnVWM=;
	b=jmGAwqrqUD8NiZ1NwS0QPnma/8ly00Z2GaZM/4R0d4r7o4LkzZuMLC1Tj42z/1CUWp
	Q2PkhwPWRDfpTJNmhLUYKsfaR+4nRi9rgJe3DSAogX21ModVsPUyWZx0OhjL2xoCh3Xf
	frL/zshaokG0/T/v9cveCYJM8WRnvdJTTlxQFAxeLvtPGfv0M/e5XDyPWKP/ZMTnI60t
	bZsPz+YSSuEYU4mNVIAJjk+lpW/3/PEyXFsfJXks0MussYcR732l+vrI728DxngQc6Rn
	jytkZ+vuENb17hAESeZHNAY140HATbVaHX6gskFaP81pwNdNmeC/639I9+gXaWA8eY5X
	znqA==
X-Gm-Message-State: ALyK8tIpSKteg0TrWnxsSzq+Ifl5w7tgxt9waMkoWBSf7Z+SY08SCK5MgJNb7ce8EPCvVOchcQvYbkOYVX5KZemq
X-Received: by 10.31.7.71 with SMTP id 68mr2890456vkh.92.1464106470218; Tue,
	24 May 2016 09:14:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:14:10 -0700 (PDT)
In-Reply-To: <1461670846-13196-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461670846-13196-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:14:10 +0100
Message-ID: <CAFEAcA_UyVKK_2-94UMWNi+992QF_PNQKO179HLfMPrRmCD08A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [PATCH v4 0/3] Add guest PMU in machine virt
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6m/ZsMQ2oKuQ

On 26 April 2016 at 12:40, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> KVM-ARM64 supports guest PMU now. This series add the support in machine
> virt so that guest could use PMU.
>
> The ACPI part is tested with below guest kernel patches.
> https://lkml.org/lkml/2016/4/12/755

Applied to target-arm.next, thanks (I fixed some missing
braces in patch 3 and fixed up patch 1 to apply on current
master which has moved the ARMCPU struct definition).

thanks
-- PMM
