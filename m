Received: by 10.25.208.137 with SMTP id h131csp1371463lfg;
        Mon, 16 May 2016 10:47:24 -0700 (PDT)
X-Received: by 10.55.181.67 with SMTP id e64mr9059880qkf.112.1463420844569;
        Mon, 16 May 2016 10:47:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a31si24010961qga.41.2016.05.16.10.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 10:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2Mc0-0005xW-32
	for alex.bennee@linaro.org; Mon, 16 May 2016 13:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2MYS-0006Ht-LZ
	for qemu-arm@nongnu.org; Mon, 16 May 2016 13:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2MYQ-0004aY-Mx
	for qemu-arm@nongnu.org; Mon, 16 May 2016 13:43:43 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2MYP-0004ZL-Ia
	for qemu-arm@nongnu.org; Mon, 16 May 2016 13:43:42 -0400
Received: by mail-vk0-x22b.google.com with SMTP id s184so222044919vkb.3
	for <qemu-arm@nongnu.org>; Mon, 16 May 2016 10:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HynaPS4n4nZlBzij4GqcK8qx6HGjRadTqXhjP4kmMDo=;
	b=cB3Vp5Z2UCvRj6tymPXQLoAGVvHijMnO4ul4RNYvRq2LpB+igBvduAC0uqTNPum/1G
	RF4dxsB7z0HgMp+lhxkbouPx9Mji1V+LElk+wdHAk88se8eJg0elvHPdMrSRmCjRB74U
	KpmpLMBjSAoCibVDgginz9kDkan9EWBowyIUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HynaPS4n4nZlBzij4GqcK8qx6HGjRadTqXhjP4kmMDo=;
	b=XHQkporkO5OdoVxWmq+WlAe7U0jZ18RWifpCChAbbwuC+dv9tn/m213JGLgEyjO7W9
	dvlyF1mZQt0Wf/kBNx+lqRU0F1unSlnUrNoHKdXYySk6UZLmXoZf4NySPh7OjdAPCK4i
	gmCAKXBs3RmfqoyRSmYkI3+l0Ior0kIRhTkQpHBtYSLPUfyRKE3AMalkUIcmZ3WlkeYz
	hazZ/yvDfCag6H+vSTQ0Zz9n66wnfk7kawOh07f1CdjGksUDYAOwuUVxQ4MZ/mVsnhr9
	LXSsJ8RU0uVCw7RqQEmBeElUsZbMSTT3sFoRo+f62uI95kxTnd7HZ98wB9OuM3+1dVPb
	k+zw==
X-Gm-Message-State: AOPr4FWHfc9NPOAbJHccY/q8JUwTxK6sKg3iFEh64gf6pvqrYZyooP9YRC8m+WkRUq8msulTu7fHqwRDrRnSsE1P
X-Received: by 10.176.6.100 with SMTP id f91mr13526956uaf.38.1463420620482;
	Mon, 16 May 2016 10:43:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 16 May 2016 10:43:19 -0700 (PDT)
In-Reply-To: <ea5aae4b10283de4705b864fe9d4bd2eaddaacae.1463174342.git.alistair.francis@xilinx.com>
References: <ea5aae4b10283de4705b864fe9d4bd2eaddaacae.1463174342.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2016 18:43:19 +0100
Message-ID: <CAFEAcA9HJwJqrmJeF7yD6juO4gmt2fqQ_Wo9cVhh7c=Vp1AWcA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v2 1/1] target-arm: Add the HSTR_EL2 register
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 62QqmI+DdBiN

On 13 May 2016 at 22:28, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Add the Hypervisor System Trap Register for EL2.
>
> This register is used early in the Linux boot and without it the kernel
> aborts with a "Synchronous Abort" error.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
