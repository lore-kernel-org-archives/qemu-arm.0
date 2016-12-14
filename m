Received: by 10.103.86.15 with SMTP id k15csp261394vsb;
        Wed, 14 Dec 2016 09:27:25 -0800 (PST)
X-Received: by 10.55.19.159 with SMTP id 31mr1823251qkt.22.1481736445267;
        Wed, 14 Dec 2016 09:27:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n1si30392932qte.22.2016.12.14.09.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 09:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHDKs-0005jx-EQ
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 12:27:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHD8C-00074H-UD
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:14:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHD88-00023J-R4
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:14:16 -0500
Received: from mail-vk0-f44.google.com ([209.85.213.44]:35695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHD88-000239-N8
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:14:12 -0500
Received: by mail-vk0-f44.google.com with SMTP id w194so37465723vkw.2
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 09:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XORUMlVIJJTGM8W32c84ZuTweO1Azh6Xkx4TZqrrAKQ=;
	b=QIo/ClLcGfa5BrdEcZz3k9KbB2G7GbM/t6GFvupEkRf9pREO2dMAvQNZZsLyCG9rjh
	mlGLmVHHUbVcWEoKWlVIZn2qlnT/v98hkH5XNM+Auw6dRyTzudepOBu5KBWP5npPVaGE
	r0r0LZRMT1sbI7Q5ZMSIH192T4Si6wh9jA8Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XORUMlVIJJTGM8W32c84ZuTweO1Azh6Xkx4TZqrrAKQ=;
	b=rEG4Ysp3f9xUAUrnr/rieLk3E7mq8EZYcuCZeuW/noIP8ripsvqW2M/nFZbBBqEc5C
	08dqwA2aE6KZ3xWM7kF/Gd9o48YCL0srwR+UihyT2tGi9/MGAJ+fefPwkEt9VlWNsvSz
	+NnatAjVSyhW73t8l0EocDqIGWW/j0BoWHXzP84sLDPqyqItdALsHf9eleLGRpXswhDW
	e6yKLeibIW/DzYb6xFYm85ZwLOlh7LMNYynQ9KJf5gNZc9pgPBjby0QNNPzBiw7VZ0su
	5oWdzZKsgGjQaQmx61B4+EIAD3DyHS1sNvsutzbMAZFjN4frrsKbpuwnIlvZYN4o1yB/
	SWdw==
X-Gm-Message-State: AKaTC01afuCdAxAIQTRPw1vxdorsBc2tQAB093eYwLKWutW5bQuJ7VBB3XrYG2ao4BAZeZ3zYT+p4SB+3EFNQkZ5
X-Received: by 10.176.83.12 with SMTP id x12mr89664343uax.131.1481735592034;
	Wed, 14 Dec 2016 09:13:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 09:12:51 -0800 (PST)
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 17:12:51 +0000
Message-ID: <CAFEAcA96OTfgO9agwKT10XHAPLA1cfme7syA0wTAu5t=zKgyHQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.44
Subject: Re: [Qemu-arm] [PATCH for-2.9 00/30] Aspeed SoC fixes and model
 improvements
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5LTDFQbH9QdT

On 29 November 2016 at 15:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Here is a collection of fixes and improvements on existing models for
> the Aspeed SoCs

I have taken into target-arm.next for 2.9 patches 2-13:

>   m25p80: add support for the mx66l1g45g
>   aspeed: QOMify the CPU object and attach it to the SoC
>   aspeed: remove cannot_destroy_with_object_finalize_yet
>   aspeed: attach the second SPI controller object to the SoC
>   aspeed: extend the board configuration with flash models
>   aspeed: add support for the romulus-bmc board
>   aspeed: add a memory region for SRAM
>   aspeed: add the definitions for the AST2400 A1 SoC
>   aspeed: change SoC revision of the palmetto-bmc machine
>   aspeed/scu: fix SCU region size
>   aspeed/smc: improve segment register support
>   aspeed/smc: set the number of flash modules for the FMC controller

which should at least reduce the size of this patchset for the
next round.

thanks
-- PMM
