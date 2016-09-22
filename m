Received: by 10.37.35.205 with SMTP id j196csp3097607ybj;
        Thu, 22 Sep 2016 07:50:44 -0700 (PDT)
X-Received: by 10.55.21.198 with SMTP id 67mr2417204qkv.206.1474555844063;
        Thu, 22 Sep 2016 07:50:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s127si1364891qkc.40.2016.09.22.07.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 07:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn5Kh-0005nM-SW
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 10:50:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4uk-0002cJ-2I
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4uf-0004Fc-69
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:23:48 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:35816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4uf-0004FD-27
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 10:23:45 -0400
Received: by mail-ua0-x232.google.com with SMTP id 107so1160126uah.2
	for <qemu-devel@nongnu.org>; Thu, 22 Sep 2016 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h9mpLvUezFzeF3zTxIOjF4z0Q/smPm2zyTOag4NbHqE=;
	b=XyIySIxd8qdM7yiEyoTNby4xO1OSvTJIjL83gh38rseMAYvHlCWUt0H9uqw45Ly2f6
	EYbNF+CCXeljY3Hkz+GY6REKDrmx6Lel/YF/BLX26wIaZ1ygvLuli2V3nex6ca4ssnEg
	F8zCBgLkWwejgbUu6ZdEwmK4dKAowJ2ue2t8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h9mpLvUezFzeF3zTxIOjF4z0Q/smPm2zyTOag4NbHqE=;
	b=DlbxNatRtucteoxeoCXVuo+LYqCCejYs2c4Y7Qkz5t4Dw5dB8jivwWD3mkhn7zPoRe
	mcbt1VHKtjeNniVrK2d0+F3UvqWziUSCXXs+ussLrVp58PAhpmiGeBLut8CRZNXo2zrf
	6wUA5l2p8roye1DRpNCpwwGG81dFwQCl+r89EzDtXVUsZoZaOUhds2t4/grBb4zlczWv
	2vVswJOrp6w9xX+rUKFJm63i1GK1a9bfuDY+PY66KL3tyeL2nXQ/RIiSgB02DRuV6/De
	DqzkDM1Jo6TWVl4wb19mUEZPw+CNpVPQJD9BjeljfTimW2IjmxbV1EFy4eB0K0B8Awha
	fCig==
X-Gm-Message-State: AE9vXwMgQpPNj8YsxuwarQtvEEEe3xr831u+P9hvWwyy2IBj80UzSEXuoqNoA53NDCtzHL2XroOLEg/t3TyZCsW4
X-Received: by 10.159.35.105 with SMTP id 96mr189073uae.26.1474554224349; Thu,
	22 Sep 2016 07:23:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 07:23:23 -0700 (PDT)
In-Reply-To: <1473442237-3746-2-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 15:23:23 +0100
Message-ID: <CAFEAcA94xNpUDz2LyoViDB6jx6C9ZzgZspYNzuaNWX=qCOZ4FQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-devel] [PATCH v6 1/8] hw/intc/arm_gic(v3)_kvm: Initialize
 gsi routing
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
X-TUID: ZlbxzRwcymmO

On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
> From: Eric Auger <eric.auger@linaro.org>
>
> Advertise gsi routing and set up irqchip routing entries for
> GIC SPIs.
>
> This is not mandated as long as MSI routing is not used
> (because the kernel sets a default irqchip routing table).
> However once MSI routing gets used (for VIRTIO-PCI vhost for
> example), the first call to KVM_SET_GSI_ROUTING overrides the
> kernel default irqchip table.
>
> If no routing entry exists for the GSI, any IRQFD signaling for
> this GSI will fail.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
