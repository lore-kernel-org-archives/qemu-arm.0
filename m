Received: by 10.25.208.211 with SMTP id h202csp2754934lfg;
        Thu, 3 Mar 2016 07:26:12 -0800 (PST)
X-Received: by 10.140.151.4 with SMTP id 4mr3706942qhx.35.1457018772286;
        Thu, 03 Mar 2016 07:26:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n73si41347468qhc.34.2016.03.03.07.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abV8l-0006qH-N9
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:26:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV8f-0006iA-FK
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:26:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV8e-0006Go-9G
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:26:05 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abV8e-0006Gj-4p
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:26:04 -0500
Received: by mail-vk0-x233.google.com with SMTP id e6so24689660vkh.2
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 07:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oR0cnD1N6NKRtOXKA3GZSiePn0OLrlig22VztazWPjQ=;
	b=ZNdPvAnbzTW/PsB1JsWIaz5iyXndz9tN11jHr/39koKegGMFgUNGGvR1WhsCHoc/pU
	NCzE5oGeZ7y+a2jW6xAJtP8YuR4X3ttGy2IyTI5V3H3SdiMQk3uhqTlK2rQN4CAho4Ef
	Qzubo+lB4Na8GdtbRE0LdjlfRme6c8m5M6LHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oR0cnD1N6NKRtOXKA3GZSiePn0OLrlig22VztazWPjQ=;
	b=C6oEyEwWlaJr8ltTxTMVivCw03UfnWmfhBOrJyqF/wrMVYCWiCq3uv0rfnK8TMArjE
	HYRHle3T47BdVLCE2jXwMm5peIPCIIKr7kYcplBJ7aA7JQguA6CBhpvPbO+SEWWHXWty
	UhgCwzHahczJhRxJk2ke0Wvm3IhcnN9VLfshhovJKWkRvEv9Q0V9c//kFAN9TLDj9MwE
	8wBBU7FMjdkwQz6k78ERjRXId7yN54NG5lIbi56GqDDJOuWJoCaPRMm/wNQaflqMkdNt
	dztb2w/OT7h3CsA0Av6J7Kmp8ujzDAhNNfmQRElAhlpTwAnJTMEsGr6lT8GzC1+g3vVX
	sLcQ==
X-Gm-Message-State: AD7BkJJkjBnhTD8h59EluXCCaOiyzWzqm2ifTlq4I7FgEtIIh3XRynsrobGuKASic9XNek+FpAFEsbTfUm6ZKc/b
X-Received: by 10.31.1.6 with SMTP id 6mr1977071vkb.139.1457018763881; Thu, 03
	Mar 2016 07:26:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 07:25:44 -0800 (PST)
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 15:25:44 +0000
Message-ID: <CAFEAcA_YGFn41uV6pykizk=28513yv1+=speOxK6u4H1PmbiEg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/18] ARM big-endian and setend support
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
X-TUID: lHWd0VIrMv03

On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
> Hi All,
>
> This patch series adds system-mode big-endian support for ARM. It also
> implements the setend instruction, and loading of BE binaries even in
> LE emulation mode.
>
> Based on Paolo's original work.
>
> I have tested all of LE, BE8 and BE32 in both linux-user mode (for
> regressions) and system mode (BE8 and BE32 are new here).
> My test application is here, the README gives some example command
> lines you can run:
>
> https://github.com/pcrost/arm-be-test
>
> Regards,
> Peter
>
> Changed since v1:
> Addressed PMM review
> Added doc comments to new/changed loader.h APIs

Thanks for the respin. For the remaining patches:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since there were only a couple of comment typos I'm planning to
apply this series to target-arm.next (and send a pullreq tomorrow
I expect).

thanks
-- PMM
