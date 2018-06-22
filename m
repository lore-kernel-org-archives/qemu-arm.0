Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp686543wrq;
        Fri, 22 Jun 2018 03:59:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ+ZgSAPDxsuljSBvNlWVEUDQ3tW2D7dvnw6CMqrpQdbOqtcbHfjYXTzdnLPHGDs3jxCW6O
X-Received: by 2002:ac8:2be8:: with SMTP id n37-v6mr864070qtn.293.1529665182432;
        Fri, 22 Jun 2018 03:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529665182; cv=none;
        d=google.com; s=arc-20160816;
        b=Ur/2mKCziRRRJ367eet/ZoCokgZRRZQG/P6OJnfRYKPr7yG6a44GgEfDwJ3fsgNMwi
         qQIf6Vo/PQIu8LMbcr8mRRJDvplP+//BG2FROlsBAcT49TZW3GDwKJJ9WiNlmMw5FaOO
         HbJiWW1UaXkFcw8hdiU0Ra4Te7KHOiSM3Cm+GOqkusOSng9/mDLvM1Ljve++1KDICUF6
         DI/+vFX6nrRwE+IfowCYHX9ADxGhXA4zKUihMFGWSEVkqa+hZ0ReylNm4nW+ZqCqa348
         Xm3dVvspnfIJoYwJ97hvJZTO/+gLTk1l5PZq4PmTwijqOjhjXdzcHV/XJsKFPsTkflJ3
         ZHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6XNB8qjzTowp8SdL+Vx0FpdzcUZAaneWZ4cP1Luu2bI=;
        b=eRGZiZ1itMjteYlemn3uc7X8trYvb13qX+wqQcgoBvWGsWaqmZu+SziveGKiLUszmx
         jgH3H4QkQXSXJkxzSTEM4jU0QIFtkbBJjC2ffBFTzRQAY2NMrl+5zl8dbNulfbK6XuJZ
         MTFHPijRxWkMSOP+QYiVmPMhVDPrCKv7In2n/H8djuyzLRrhUTS+nHbjDalANQDJwVRA
         G32DJx1LzRim8UhkwWy96d64/CcWgjKI1AtAH3q7COX7w1ZFOSjmNYxprb8cRwmAI/Z5
         ZHXasfTL4spO455p7tjcXb+l0zFtJwyVlX9Ayjgw0Rn/7iMibYxJvYD7YD0xNEJg7i79
         KKkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dZ/XxIWD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3-v6si6490405qva.235.2018.06.22.03.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dZ/XxIWD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJn3-0003cW-UR
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWJZK-0000UE-3G
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWJZJ-00082M-BG
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:45:30 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWJZJ-000823-5t
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:45:29 -0400
Received: by mail-ot0-x244.google.com with SMTP id w13-v6so6984392ote.11
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6XNB8qjzTowp8SdL+Vx0FpdzcUZAaneWZ4cP1Luu2bI=;
	b=dZ/XxIWDFPZbGD9GcgKK6hIaU5X7F13FAvLQ/Dak6eNXs8UnTL4mgfnFovpUWKxlEA
	K2/oj4lceVzTsmrNhQJ6ULATTjBwlEIEKGM7mwIXu44pG/keb9AkA8O2NO3F92khyoSq
	u/QSYJIdoof3nBdEbqqSmYSGF6mDtxV8Felyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6XNB8qjzTowp8SdL+Vx0FpdzcUZAaneWZ4cP1Luu2bI=;
	b=flg1RPLmlGQWrAOHvMLbtY7A7SffZbgl/8jAX5r3n1HzbXoe3IKwZb9x4Y7HauETao
	4j4MykhOOvVm1q5aBPsgeWc2govvq6BAhOxOVPFmCAJqa82Nb65JPlCMEwc5tnzU4jdm
	umejEfuFSLhrKwp8LuPAI9hBWXGk99qLSLmpvioMnAbJLk1Au2zY630sZCE4AcskqlHh
	wRzORHEOQ/dOMUzOBHdG6AgGimoZf1I374oV4EwOmzZKtm7fcMtviOyvOZEd960B6aMf
	ggwsS1QhiqFP/oYdUzHfVNhxX6/tFM+uCnKVoUBkSTCdSX7m+vESpJ2GKRzgX0Jl88R9
	GTdg==
X-Gm-Message-State: APt69E0f5Z9bw9lHbrAQMnRlsCt2I1e7xq8UtQj6hAOXxPGqPY6NLguV
	xnmcGhabMYXqQSVjhSDi2CSOn+QrFwP3fiOCoFUwiw==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr536828ote.205.1529664328381; 
	Fri, 22 Jun 2018 03:45:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 03:45:07
	-0700 (PDT)
In-Reply-To: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
References: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 11:45:07 +0100
Message-ID: <CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j4BaX0jTNQt/

On 22 June 2018 at 11:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> When QEMU_PSCI_CONDUIT_DISABLED is set, it doesn't mean all the PSCI
> conduits are totally disabled, it only mean the QEMU built-in PSCI
> support is disabled, in such a case, e.g. EL3 is enabled and external
> firmware (it is usually Arm Trusted Firmware) is loaded, SMC should be
> used for the guest to trigger PSCI functions.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 74f5744..e5b4947 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -715,7 +715,11 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>
>      switch (vms->psci_conduit) {
>      case QEMU_PSCI_CONDUIT_DISABLED:
> -        fadt.arm_boot_arch = 0;
> +        /* This case means QEMU's internal EL3 implementation is disabled,
> +         * but when firmware is loaded, the guest can still use SMC as PSCI
> +         * conduit to call external firmware PSCI services
> +         */
> +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
>          break;
>      case QEMU_PSCI_CONDUIT_HVC:
>          fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |

I think this means we end up reporting different things for ACPI
and DT in this case, doesn't it?

I think that if QEMU isn't providing the PSCI implementation it
shouldn't advertise it in the ACPI tables. It would seem more
logical that the firmware itself does that (QEMU can't know if
it really does provide PSCI, after all...)

thanks
-- PMM
