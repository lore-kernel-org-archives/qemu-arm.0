Received: by 10.25.0.147 with SMTP id 141csp364052lfa;
        Thu, 2 Mar 2017 08:38:24 -0800 (PST)
X-Received: by 10.200.53.69 with SMTP id z5mr18334312qtb.120.1488472704001;
        Thu, 02 Mar 2017 08:38:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si7298033qtb.186.2017.03.02.08.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTkD-0000CE-Fw
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:38:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTk3-0000Am-Nl
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTk3-0007Be-14
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:38:11 -0500
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:34737)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTk2-0007Ae-R7
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:38:10 -0500
Received: by mail-wr0-x22b.google.com with SMTP id l37so56533990wrc.1
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QrenZLf/QZmodBdN57+iCBR3lDjeOmtO/+PYwBx2jD0=;
	b=g2TgVW09CzU2B7/T+kzOyMHVsbpMOdBlKIFYiIqGFHHy0JrcoIqYqXI0SKp6D4v8KS
	gHhof6FLDSCba0+l97Oqy6EcIaZXkUb3qd1XA/yTvyPM3ahX+d+T2hW1KMPIgwknXwMs
	duEZkokbX0PNCXI2em8vcYTLA5QHYmLhqw7Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QrenZLf/QZmodBdN57+iCBR3lDjeOmtO/+PYwBx2jD0=;
	b=kMdtbkuzujANanZf/Gj8bJ+UDCBLb9blkWK6PVGk3q3lX2sv9aiAFT66VAOUQxKrRe
	hXpEXhPbNuUa+piQKB0ghyarbwo9/3NM5CMJ2GFtThrsRBWBMn68YcboXgIvArCS+JkR
	BTYSvPHJh2LAbYMKyPcHakc/xiv/W4n5d4wtJyElR6B+ACDV72GYYoX6UcVNWQCPYfXl
	0JfKYiOMUV82s2slSOfROJlbM/tT7jg1uSNZZkr84Gm1qqCxpAGOT9vPov1bQMoHpvjc
	h9i/nzG0FPj0k9klS9+O6+iXg1mrRtF2rPJfGq/aM8pOiFlzm9M16Nsf7sgJudjmgS9r
	5Qqg==
X-Gm-Message-State: AMke39nBdf+4AsFnYFlOzZ+NCMMm9ssNncwSpZLOLJegp5+oAYCN1QE2MEK8JFHqgFq0SpxlsK6hG9mBP5fOyz73
X-Received: by 10.223.150.205 with SMTP id u71mr13170413wrb.195.1488472689771; 
	Thu, 02 Mar 2017 08:38:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:37:49 -0800 (PST)
In-Reply-To: <20170301182618.22395-3-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-3-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:37:49 +0000
Message-ID: <CAFEAcA-wgPqejWpNC-nQSG564ABP4G+J5AeVW37aEqqSa+LHmw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH 2/5] hw/intc/exynos4210_gic: Use more
 meaningful name for local variable
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kQkkk3j5g4Ku

On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> There are to SysBusDevice variables in exynos4210_gic_realize()
> function: one for the device itself and second for arm_gic device.  Add
> a prefix "gic" to the second one so it will be easier to understand the
> code.
>
> While at it, put local uninitialized 'i' variable at the end, next to
> other uninitialized ones.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/intc/exynos4210_gic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
