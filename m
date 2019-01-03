Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp809130wrt;
        Thu, 3 Jan 2019 08:26:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7v0Of/IauwLwaVb/y2NEHCACLMiNbPrP3afyLQ3MAXXCDzzlBKBLKOYfSxHj+8U6yI7rHQ
X-Received: by 2002:a0c:8583:: with SMTP id o3mr47126214qva.223.1546532799019;
        Thu, 03 Jan 2019 08:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546532799; cv=none;
        d=google.com; s=arc-20160816;
        b=z8AvqFFgHI35weGnROGB2eg1BNTGwPAovxicnpum3JM8BY2JiCg1yOub27ootbg1on
         q2+TI9nCey3NN/ESgPp2oFi7zrTclNZwYx+Oqrc2fi0t9hsMIXj27qb/ra3uvOIce+JF
         xZBHJmJONQ/dxOh4tX+tzVRHoPBGb+YMvqlb1nRQ6zCN697WnupYPxlRAHPx/HzoCBwI
         +uu5z+oGkZLjvWeLqV60iXwFcMrL//Od/tX/GXwgx1P1CZZHLwJU+6iowq7uoJhiBifT
         IurtesIDmUDWSkNjzwT3NsFnaaPCXNsU6yzWFIs/gqiDhnjw9W1bsHDlZbY8vYK3klrx
         OGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsGX9Ff4NyBcKgqR87ZqfTstQZASd78xNP/AGtePL/k=;
        b=RUbEqe3VIyFcXTlDwf5hZD7BlVI+GrDpl6XQkfUOkk57t2JEXV3oltgVUV/f58Qlrg
         G/UMF34tIT5igSd0GpO5LWRp70Rz75HKAHyR1SvBq/9u4d+AzMR2acxNsvXRpGe3FdS5
         Vvdwej173jgCgrBSK3dG8gs1/u/GXWMEDuRRsMqA6N2Bi+2wwuosYJqWK2NK+f37C5AN
         XQmEC0zjoX3XO+1o6iai9m4NoKJa2q6mWu4KcJ9XRxglHdMOHUZYkNfEbMoQQnZ/eFgq
         mBb9HXSivwKe39ZqWnQCnWlgzqMx+XV838ZRXx20ZVQIwHQeVYRoI20QoIC8bRgjDb0S
         In2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fkKmsvgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b42si4294786qvh.197.2019.01.03.08.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 08:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fkKmsvgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gf5pO-0006W9-Gf
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 11:26:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf5pF-0006Vu-El
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:26:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf5pE-00074F-IT
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:26:29 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gf5pE-00071A-Au
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:26:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id f18so29771083otl.11
	for <qemu-arm@nongnu.org>; Thu, 03 Jan 2019 08:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NsGX9Ff4NyBcKgqR87ZqfTstQZASd78xNP/AGtePL/k=;
	b=fkKmsvgE7rMgfXnqErOLSonGLeR/cwFL1Y7enbe+N183I4omeFGdqpkCCoVRdxwptu
	vU3lNzhKYltA9U3Nj2SgsL5q2C+XmanFPvAgyJstOvMWcXX/QSqREC8j0V04OqCM4o2q
	0/sTSiivwFR9woHclMpmBKqkfOAua70Ge/OTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NsGX9Ff4NyBcKgqR87ZqfTstQZASd78xNP/AGtePL/k=;
	b=rw/fN5FYGhU6MNWQGEn5CNfFWDaO9L1qtPKvDCCli0NS4O8kGPpGskBJm0pDF+YZaj
	appWY6oo8t9XkiBkVB0kYK4eF1NRPAR84sUnP6u31rkGtz+eRTi2QCSNyzcW6yrD0eJC
	4Tiq9sGnKceKcuLvLIJ2O6bWSdO4D1sZ3vN94fkh3bEsH6sbKUzMQ+S5s29lw/M+0gM5
	AwRNLJ5TLq5H2b95yT3V0B0uki1cuBfAWfdylSlKHFRbDSWshNTrmzE6aowBc0EKhS+p
	1WMsKp6uptCmrVNOMvxslWLTop4mFhuKSm+s3aD+fCeYxMv/LM5ddrbzMhStAzljcv34
	zsBg==
X-Gm-Message-State: AJcUukcG/hUoWy1vsxD1tjok3j4lLyBOs5a+jqXBG3MU85wFHI4WfwzQ
	rzdxZceOyIaTyeLM44IiKc4nObM5xmQ8ozkPRRTOYw==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr34053569otb.238.1546532785585; 
	Thu, 03 Jan 2019 08:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20181211031044.27628-1-joel@jms.id.au>
	<20181211031044.27628-3-joel@jms.id.au>
In-Reply-To: <20181211031044.27628-3-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 16:26:14 +0000
Message-ID: <CAFEAcA-KoxgDuWtCfZqzGgMgQrxRiMYfwt31eU12CQOPW_pSMg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 2/2] aspeed/scu: Implement power off register
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
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8EYphFLbGxcu

On Tue, 11 Dec 2018 at 03:11, Joel Stanley <joel@jms.id.au> wrote:
>
> This register does not exist in hardware. It is here to allow the guest
> code to cause Qemu to exit when required.
>
> The register address chosen is unused in the emulated machines
> datasheets.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_scu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c8217740efc1..aa17d032ba93 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "sysemu/sysemu.h"
>  #include "crypto/random.h"
>  #include "trace.h"
>
> @@ -84,6 +85,7 @@
>  #define SRAM_DECODE_BASE1    TO_REG(0x194)
>  #define SRAM_DECODE_BASE2    TO_REG(0x198)
>  #define BMC_REV              TO_REG(0x19C)
> +#define POWEROFF             TO_REG(0x1A0)
>  #define BMC_DEV_ID           TO_REG(0x1A4)

I'm always a bit dubious about adding things to QEMU devices
which don't exist in the real hardware we're emulating. If we
do want to do that, I think we should clearly flag them up as
being QEMU-specific with suitable comments and naming of
the #define, etc.

thanks
-- PMM
