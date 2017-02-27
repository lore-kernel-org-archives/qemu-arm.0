Received: by 10.25.0.147 with SMTP id 141csp937799lfa;
        Mon, 27 Feb 2017 05:37:40 -0800 (PST)
X-Received: by 10.55.102.199 with SMTP id a190mr14879273qkc.277.1488202660424;
        Mon, 27 Feb 2017 05:37:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u42si2389114qte.4.2017.02.27.05.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Feb 2017 05:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciLUf-0005FU-Mc
	for alex.bennee@linaro.org; Mon, 27 Feb 2017 08:37:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciLQB-0001by-Gt
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 08:33:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciLQ9-0006pw-R2
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 08:32:59 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ciLQ9-0006pU-KS
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 08:32:57 -0500
Received: by mail-wr0-x22d.google.com with SMTP id u108so22346681wrb.3
	for <qemu-arm@nongnu.org>; Mon, 27 Feb 2017 05:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gl5XDd1/r8Wm76YOf8TASHPju3OB8mBj/2Gq+8Ty45s=;
	b=bKJXVk9xBxqk3lrgTy94SJ6gkUSIZNhoQdrWoPhBKqR/0aIqZu/86Y/VNGU7Nsx6Rd
	rF6DAUt2kBDzRZ18QGPw2pYVQ6JJf/UFva8E+pvkR/KxfDvO+4uhuka0eIqGJdsJMCfs
	tIoKysM8iWDWURQPVaY0iK+dCaFBZBkXarltw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gl5XDd1/r8Wm76YOf8TASHPju3OB8mBj/2Gq+8Ty45s=;
	b=KkxqICInp+XlhHHs7EZFbpWY0QrLdho/6EOde2UUHNtKT4qZkoHbky25MKPmOG7DFR
	C9uMm8xWAFvRvkJ5cbkbitnhH4EHQDIDmCoVqcqtnPfnIfolxZFv1p7CBuy5wAlV5uj+
	Z2YWu17eVemjERg3PxUnl/4wkMlps8vAAaaHeNqBJ6/FaSP9Yr5kS6Rk9+ZbjaciQ0FE
	I3Yh239wFv8U2ffUYqd4VF3pPRtQqxbQSfuzbQ09tHA0iXI2ogAYIdk3qkbJKQsV+66j
	e6rMXG9P1DKE42XV6KneE/B5r4ao/AKHAChNgQH+hz2wCbrUgJiEvByNarR8oRJffGyC
	psoQ==
X-Gm-Message-State: AMke39lYZIJ5btEdDXjo9ER4ZFLvaU8a54kliLRyFPNJXBMUmQPM6UMJcYsR87rkeIT2DMy1RL8n0LsA2tWJYbn3
X-Received: by 10.223.150.205 with SMTP id u71mr12843696wrb.195.1488202376548; 
	Mon, 27 Feb 2017 05:32:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 27 Feb 2017 05:32:35 -0800 (PST)
In-Reply-To: <20170226200142.31169-1-krzk@kernel.org>
References: <20170226200142.31169-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2017 13:32:35 +0000
Message-ID: <CAFEAcA8FGe3-yeDQDDqK89KDBBNzwVTGzxaEdNzE+yjBg8SbjQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH v2 1/2] hw/arm/exynos: Fix Linux kernel
 division by zero for PLLs
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYBjkpl8Vzbe

On 26 February 2017 at 20:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Without any clock controller, the Linux kernel was hitting division by
> zero during boot or with clk_summary:
> [    0.000000] [<c031054c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
> [    0.000000] [<c030ba6c>] (show_stack) from [<c05b2660>] (dump_stack+0x88/0x9c)
> [    0.000000] [<c05b2660>] (dump_stack) from [<c05b11a4>] (Ldiv0+0x8/0x10)
> [    0.000000] [<c05b11a4>] (Ldiv0) from [<c06ad1e0>] (samsung_pll45xx_recalc_rate+0x58/0x74)
> [    0.000000] [<c06ad1e0>] (samsung_pll45xx_recalc_rate) from [<c0692ec0>] (clk_register+0x39c/0x63c)
> [    0.000000] [<c0692ec0>] (clk_register) from [<c125d360>] (samsung_clk_register_pll+0x2e0/0x3d4)
> [    0.000000] [<c125d360>] (samsung_clk_register_pll) from [<c125d7e8>] (exynos4_clk_init+0x1b0/0x5e4)
> [    0.000000] [<c125d7e8>] (exynos4_clk_init) from [<c12335f4>] (of_clk_init+0x17c/0x210)
> [    0.000000] [<c12335f4>] (of_clk_init) from [<c1204700>] (time_init+0x24/0x2c)
> [    0.000000] [<c1204700>] (time_init) from [<c1200b2c>] (start_kernel+0x24c/0x38c)
> [    0.000000] [<c1200b2c>] (start_kernel) from [<4020807c>] (0x4020807c)
>
> Provide stub for clock controller returning reset values for PLLs.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---



Applied both to target-arm.next, thanks.

-- PMM
