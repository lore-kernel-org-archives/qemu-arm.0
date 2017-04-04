Received: by 10.25.15.230 with SMTP id 99csp174427lfp;
        Tue, 4 Apr 2017 05:11:09 -0700 (PDT)
X-Received: by 10.237.37.229 with SMTP id y34mr23294441qtc.30.1491307869090;
        Tue, 04 Apr 2017 05:11:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w23si14865872qtb.83.2017.04.04.05.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 05:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvNIi-0002Rj-H9
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 08:11:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvNH9-0001Ve-BS
	for qemu-devel@nongnu.org; Tue, 04 Apr 2017 08:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvNH8-0007cy-Eh
	for qemu-devel@nongnu.org; Tue, 04 Apr 2017 08:09:31 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:36114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cvNH8-0007cc-7R
	for qemu-devel@nongnu.org; Tue, 04 Apr 2017 08:09:30 -0400
Received: by mail-wr0-x22a.google.com with SMTP id w11so210275346wrc.3
	for <qemu-devel@nongnu.org>; Tue, 04 Apr 2017 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xtHwl/jLE8aACb9e7jHXUbvLlnzGK3Zfj/WYlvhRv0c=;
	b=OCnjpA8f0/eu1GpJq1bi6puRiAQNPWCtIEr+y8PhM/5UyGxxd3GiauTzO2M/uLS39K
	QQ3nIVN+EwiP8VboreBpZROrmke1BK1WGKZUzzhSDIuF0cpqSi9ladnxyl5CHk0ZOZnZ
	IjaH/8+ontiVmTSxDr+R7q4VuxEx8CyTZFRu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xtHwl/jLE8aACb9e7jHXUbvLlnzGK3Zfj/WYlvhRv0c=;
	b=Lg07nJ7YlDvXwPNeKbr4BRntOmXwpAMqlklIfk3NyiItP/JaX/nWuS/F4zmeaTKNC5
	oR2z7BWayunsYF187cXtsJd8qW/aUW3ofzZsMeGQvTN/bI+6GI0mpqYxM3Os1qNHslLu
	4yZo/3tLUj60IrAdA1bqeRQi1OMs2MDYQasnofzT2CFZ684ZEj2sbEuDhS0/Bf679Ibf
	oali0a3/HJt7PHcudCIqLhm9yr2UxnfsbhcnXRaGw1V1CWj2CmHkPPiE42O/JNxQe4UV
	1wclQWCqEy0q3kEJ6O1+w8uDz+FHnG/zzrGsRo/pdvvM6T4/jBI/gxuf3G4ZY/b7HZgR
	qjLA==
X-Gm-Message-State: AFeK/H0BzEgm+KtWxSwf2uXX8iZ9zMAH2QG5C3OpYnm91Y+Zn3LdQtyE
	FHrX/QY+9P4kv6HvW3fxOJIPo98XERmg
X-Received: by 10.28.167.203 with SMTP id q194mr14095966wme.111.1491307768811; 
	Tue, 04 Apr 2017 05:09:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Tue, 4 Apr 2017 05:09:08 -0700 (PDT)
In-Reply-To: <20170318192509.15499-1-krzk@kernel.org>
References: <20170318192509.15499-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2017 13:09:08 +0100
Message-ID: <CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-devel] [PATCH v2] hw/misc: Add Exynos4210 Pseudo Random
 Number Generator
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Uf9BwNVgtyb

On 18 March 2017 at 19:25, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Add emulation for Exynos4210 Pseudo Random Number Generator which could
> work on fixed seeds or with seeds provided by True Random Number
> Generator block inside the SoC.
>
> Implement only the fixed seeds part of it in polling mode (no
> interrupts).  Simple testing:
>     # echo "exynos" > /sys/class/misc/hw_random/rng_current
>     # dd if=/dev/hwrng of=/dev/null bs=1 count=16
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Use GRand-like functions to fix build on MingW32 (this adds also
>    finalize).
> 2. Add DPRINTF macro.
> 3. Use HWADDR_PRIx and family for printing values.

Is there a data sheet that describes this RNG? I had a quick google
but couldn't find anything in the 4210 manual you can get from Samsung.

In particular I'm not sure we want to use GRand here.

thanks
-- PMM
