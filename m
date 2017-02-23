Received: by 10.25.0.147 with SMTP id 141csp345987lfa;
        Thu, 23 Feb 2017 11:06:25 -0800 (PST)
X-Received: by 10.200.41.230 with SMTP id 35mr40652348qtt.239.1487876785093;
        Thu, 23 Feb 2017 11:06:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si3928555qkm.316.2017.02.23.11.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 11:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyic-0007Ur-Cn
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 14:06:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyHN-0004oR-M2
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:38:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyHM-0000zo-Su
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:38:13 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgyHM-0000zX-MO
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:38:12 -0500
Received: by mail-wm0-x235.google.com with SMTP id v77so37706928wmv.1
	for <qemu-devel@nongnu.org>; Thu, 23 Feb 2017 10:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S1PoQV7+z8IWatG5Vb1w9gUvibTe+cyx/QWZj22CnbA=;
	b=jVtbcQV2QefmkJQMJQS2p8CBQ/Olm+P8GaG32XLIkdiV26uyp55rzYYJmNqtjp6OPo
	cXuFXDM0z4EUCsqEpNpPyyOdIK3mSBKOUmy0kickEjKDWBG0XqO1LER8q5ArMQI2FUgs
	y1/IAVpchZaekDhLqomSCCTaMZztK/phTQtLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S1PoQV7+z8IWatG5Vb1w9gUvibTe+cyx/QWZj22CnbA=;
	b=TDdcuN9tCQQ8zQ076545zW5n0/zawDIZfAM9toY4OAFldrBahqYL6YMzd46/mJ51T+
	09kUwE0ffwotgR4lv1RjqkP8tezKnyo30TWcGH0eVEE7Sv7m6ty1+5Dj74QXi03e2t/E
	r7D3a9EahGM0WL1MebHv/zr4vnrIjBsYHEp0GDeg1RJ38pctz1fMJGQJiO+cSIdIGKT9
	XCbSm0zzWz0q36fLslUme8z2TEs6P51s2t4VuJl86uMuc60AdcPyICsBNz8bCHhzlCBN
	JeNpXP5JFksKPljmk7Pv02srHJGbFhmvHzl7vJ57Pa1jA3qkbwdsEob/VYVY9+B+aQd6
	Jswg==
X-Gm-Message-State: AMke39msY9bdWFjw6yI06KegGNeDb5uT+aotOmTUvjt7+OFjFZKM/sVv56XqBylw6dbCN4cT89eNpgHm/AVIh2ZY
X-Received: by 10.28.4.10 with SMTP id 10mr6514542wme.142.1487875091701; Thu,
	23 Feb 2017 10:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 10:37:51 -0800 (PST)
In-Reply-To: <1487850673-26455-6-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-6-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 18:37:51 +0000
Message-ID: <CAFEAcA-wQwM=g-geopcn+9Y28UL22ugTWKwUOqmdbV=YD5Q1Rg@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH v9 5/5] hw/intc/arm_gicv3_kvm: Reset GICv3
 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9g3CGa4ae9XR

On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Reset CPU interface registers of GICv3 when CPU is reset.
> For this, ARMCPRegInfo struct is registered with one ICC
> register whose resetfn is called when cpu is reset.
>
> All the ICC registers are reset under one single register
> reset function instead of calling resetfn for each ICC
> register.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
