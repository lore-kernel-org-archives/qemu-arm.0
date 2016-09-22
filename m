Received: by 10.37.35.205 with SMTP id j196csp3087855ybj;
        Thu, 22 Sep 2016 07:32:23 -0700 (PDT)
X-Received: by 10.55.18.148 with SMTP id 20mr2444168qks.210.1474554743746;
        Thu, 22 Sep 2016 07:32:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r28si1307288qkh.95.2016.09.22.07.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 07:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn531-0003Gi-6K
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 10:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4gU-0004O9-Ms
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4gR-0008Cl-PK
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:09:05 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4gR-0008CQ-9B
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:09:03 -0400
Received: by mail-vk0-x234.google.com with SMTP id 192so26513071vkl.0
	for <qemu-devel@nongnu.org>; Thu, 22 Sep 2016 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hQh14bmaLDE2PrRQB547djlzklslxW7nZZHAZaoXWUQ=;
	b=K9WKBnBtm2ZpFzVhTHvzsrmVscZL3oUk05NzpVg+Nj+oYFQZ9v3wpsZHKZ3qKqjiiY
	WegdkbMOH9Rykn9sI4pQ9Rn64O2fbN84n9ncgfT/caZl/XiLGrejJCJFg7svwJJ1uQc/
	bOdeIJ12ZBBmhwU46FHbFnfGWn6fLQwiEc9Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hQh14bmaLDE2PrRQB547djlzklslxW7nZZHAZaoXWUQ=;
	b=Spvv59qsnU6GjlcPzfO3VNBd14vPeXxgiIXl2JyFdxJKiwhJuQza2vMjOdLsWTdi1W
	zr0P/M1a9Ln+ceGDt7scDVFyTtpOeGcwpNnCSOs/7BON6+ZXrtkBgJjTiGjAHAL5EP4Y
	9wyc8kCzto5CSfLJvFwd4GCqtpWOlJnZxe13F4XwHprxDRaTFYqxmiqTsbGdyVp0N3Ym
	JvbEIQTVY2JESY4197+kZP/vnI0nmo+ccN4LNqY0fMNovbcij902NqBlXLCXgrMdJcwT
	2B93HTaHD70tpooU41BhqfonDwjBJ3YBDPPj5PSTufIBi6DmYH9yM8Lnma/AaRuZwVAz
	uwHA==
X-Gm-Message-State: AE9vXwNzSj0BqUdBKxmwYfPRPCnC4X2RVO7lJopMn8BFzlOAOxy+WRobWS98LkwR8ObtHvM7OXZY+Bu1Mx6hnX0z
X-Received: by 10.31.96.199 with SMTP id u190mr1957172vkb.175.1474553342869;
	Thu, 22 Sep 2016 07:09:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 07:08:42 -0700 (PDT)
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 15:08:42 +0100
Message-ID: <CAFEAcA9qgGw99w9HtZWLyKUwECQnK4b2U8kckmjAtA9+UF7e0A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-devel] [PATCH v6 0/8] vITS support
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJBAvzw04b//

On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
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

Patches 7 and 8 are missing your signed-off-by line...

thanks
-- PMM
