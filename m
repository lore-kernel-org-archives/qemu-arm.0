Received: by 10.25.150.194 with SMTP id y185csp1708408lfd;
        Mon, 28 Nov 2016 04:00:48 -0800 (PST)
X-Received: by 10.55.166.131 with SMTP id p125mr20055701qke.174.1480334448605;
        Mon, 28 Nov 2016 04:00:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v80si31829173qkv.258.2016.11.28.04.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 04:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBKc3-0007VF-DC
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 07:00:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKbx-0007Ux-D1
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKbt-0006ZJ-Ai
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:00:41 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBKbs-0006Yr-S8
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:00:37 -0500
Received: by mail-vk0-x22b.google.com with SMTP id 137so71998388vkl.0
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 04:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2fZSoRZ5dKxIk+tK+lE8YcgS0x+lwyOUO88aoL9bsaw=;
	b=VIoU2yt26WfIHqXppyk4x3REVTiDlJ07cmnxh/CPkLDiVdfaegODWtRIbt6CWoESzN
	ypeHqLSYV18lp1sE8i3rGR9pppyaUjogHbJAjfUv5yBZiptFkxuDT9Iun9G0el/zFqAW
	7ZKuNv/HRUTFrpjaL8LvUYh7wcufsUmDS2rGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2fZSoRZ5dKxIk+tK+lE8YcgS0x+lwyOUO88aoL9bsaw=;
	b=epQhraq9is09E/JSIBRb9Y6Q71d7yNnJRtrKm+8CfVMU/5GXMYfYafFIJR6SPZvD6A
	m9kMEs6qMCyZgfjGAyIpAovh6+moFUjubYwhEloQfv+X7tbeAQMcBCbFASyrUFJ9PLHM
	qvMiUabC7tC8heZeRm4yzYvHdUPITNGqEX5URzH57/N0xlCHam2Fh07bOek+zIU7VRDr
	BABIZM00ycgdAoD3rp1isfMNFG7zjI3+09eSgL2ZwVqdp7m2wrjcQjfR4LAsoXVK9MRb
	V1px8M8M14YbyEiDGoGFquqtpbHCeWVbCwMFWKnhir7Q1V1H4cL8NzFjpQT51tL4hgvp
	Te2Q==
X-Gm-Message-State: AKaTC0133QdiHO3f1/nOX2VpQV8kBfAd6/n8jkkrHd8QZ8vKzScDeSCZs+ib8lNu4LNbxk40C0Pa26LGXyjuWw6G
X-Received: by 10.31.165.202 with SMTP id o193mr7213233vke.95.1480334435655;
	Mon, 28 Nov 2016 04:00:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 04:00:15 -0800 (PST)
In-Reply-To: <1479904764-15532-3-git-send-email-vijay.kilari@gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 12:00:15 +0000
Message-ID: <CAFEAcA8qZtQ4+3h1YafVkuJqYvD31sCzpk_i66LTVsFuMxq7XA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v6 2/4] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1s1HO0cSsmOX

On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This actually implements pre_save and post_load methods for in-kernel
> vGICv3.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> [PMM:
>  * use decimal, not 0bnnn
>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>  * completely rearranged the get and put functions to read and write
>    the state in a natural order, rather than mixing distributor and
>    redistributor state together]
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> [Vijay:
>  * Update macro KVM_VGIC_ATTR
>  * Use 32 bit access for gicd and gicr
>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>    access  are changed from 64-bit to 32-bit access
>  * Add ICC_SRE_EL1 save and restore
>  * Dropped translate_fn mechanism and coded functions to handle
>    save and restore of edge_trigger and priority
>  * Number of APnR register saved/restored based on number of
>    priority bits supported]
> ---
> ---
>  hw/intc/arm_gicv3_kvm.c  | 559 ++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h |   1 +
>  2 files changed, 549 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
