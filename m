Received: by 10.28.71.27 with SMTP id u27csp1859980wma;
        Thu, 22 Feb 2018 03:47:34 -0800 (PST)
X-Google-Smtp-Source: AH8x22567zQlxqzE5mmwiWYL6NXJED9fwDINzeZOUxKZfWsd4qVKmWkR4W13pPlfK0uTeb/ZXg4C
X-Received: by 10.13.207.4 with SMTP id r4mr4541894ywd.454.1519300054475;
        Thu, 22 Feb 2018 03:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519300054; cv=none;
        d=google.com; s=arc-20160816;
        b=LJv5j4a0bKixlmRt51sl7HHe3yP65j3ZjmPxd1UjV6aFvPRShLEDgSi/myJJYy1xUA
         UcUOWOa9ymTgkjNy9dE0wtv+lNKcdEJ6DxaS+zqaiqHnAQ0FBZoAnKaObSpV5Lrcj2MD
         jH3AiUVOdq9yOSnfKPIZ/GfhlQPagZm2y85/KUjh0nNCV/61HLB4rBZF++RA/NowHTJX
         C/y0Tk+eMdWJLr/iLqpHoP+GEZlpWSAy00lOndWQX+afToWV4zfen9zlbw2RhjuHLk9G
         4AuD9XT/M5fe898L3CTZdTt2lazHVZxbixyuxCmwb/MOajOA0SC26QUeZHVF1h0iHEdw
         ZFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Av9o/ZkS1vkBmjU0E/IiNERL8OZev7Yk4pteGgZo8gE=;
        b=SZmEZ1me8iD5WO75DA0iB6ZhxloC8E4SAbxbXkbnk9DxY/5LO8Heruu8edz5+qGOgQ
         YvQ8twwQ5kxazqtXD0v1vCYvc9svEPMmiq4/Zii4xM/F+dXcWxiaFsXq+cS3w2pP2gOA
         +wRQkrk4iPldVf6FAmqf+dfsdeWri7iK2IA2VjtNo9a/ttXZ1Mjyk/IHdZL+4WFnR4zM
         NdzixbAs5saoF9SAwY6oTN7O7Y28GLgRX7x9FQoUgdLShBjeRSU2vBJUk0kiq0xuVqD9
         5r/S7cc0T/c98/4uN+xIexYAHlEY61n8o4BAJrqHdSttiNWb8i1QBWTK3U2oV1xWyPbu
         1CNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WUiNSgEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si172606ywf.320.2018.02.22.03.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 03:47:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WUiNSgEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eopLZ-000161-QB
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 06:47:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eopLK-00014E-Bc
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 06:47:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eopLI-0006A4-Ue
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 06:47:17 -0500
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:35875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eopLI-00069K-Pm
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 06:47:16 -0500
Received: by mail-oi0-x22d.google.com with SMTP id 24so3474452oij.3
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 03:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Av9o/ZkS1vkBmjU0E/IiNERL8OZev7Yk4pteGgZo8gE=;
	b=WUiNSgEiMRNtPDIvH0kWSvVbBtngaS8RUf50NSLDxkTBk9iPslrqHgloYCnDLaV1Bm
	e5eNPRTOZ2fi1Zrqv1GfNTSUutNghCDPmQkZRTuT6OLYrx1J4eqrzqfj4w3+bKoLYpV2
	utyDj28Xz6D0UYAj7PUUB9vOSR+V/pc9kBRCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Av9o/ZkS1vkBmjU0E/IiNERL8OZev7Yk4pteGgZo8gE=;
	b=cN5px7LD0TC8KXjDR0zUIqzNms2G/GPuuUM5oFGY/2Ok+et/XC2X8gjbvwmcuhb2YY
	lXQY7ADjXYivhbNyCkuhEHpfF/1sJmMEP/tWbDjAf4n3jBaXzfrWV9q36ZpAhTqH6Prv
	4dWokaP4WMrgmujdSE/X5hKZhc30SXDAb8QsBYplmZLw+LXQrMGkledMzwU1Ql6Hztov
	1KOvcNvvS1e8WVk4MREB/UwFaefFKG59ImEmWMhBQozsnQXocAL+RGJgZ7mddZ0VOoX1
	v+bDP3saT/sLXypcDkgeWfE2lUYpOXBdkFMgqjbUSPJifDqkd7j3wWRHtyibH7KCfFqC
	ctUQ==
X-Gm-Message-State: APf1xPAD8+ylnW5JFYebRtENkN0j339BrV2kZLviBeYdasYggqWUCdGt
	TAVHqbuZ91avWgVSY6U4FS4P8IoqUF6Iqvu/Prfh7g==
X-Received: by 10.202.177.136 with SMTP id a130mr4335109oif.252.1519300035680; 
	Thu, 22 Feb 2018 03:47:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 03:46:55 -0800 (PST)
In-Reply-To: <20180216022933.10945-6-f4bug@amsat.org>
References: <20180216022933.10945-1-f4bug@amsat.org>
	<20180216022933.10945-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 11:46:55 +0000
Message-ID: <CAFEAcA_9L=FZoyvHpOPQH=kA36=W2ZAx7RukJb3_S0Vr0TNt2A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [RFC PATCH v3 5/7] hw/sd/pl181: expose a SDBus and
 connect the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TIwnltKih8y+

On 16 February 2018 at 02:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> using the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>
> RFC because how pl181_sdbus_create_inplace() doing class_init(SDBus) in
> realize(pl181) seems weird...

In the two other places where we set the set_inserted and set_readonly
methods for the SDBus class (pxa2xx_mmci.c and sdhci.c), we do it by
defining a subclass of TYPE_SD_BUS, whose class init function can then
set up the method pointers. Is there a reason not to do pl181 the
same way as those two examples?

thanks
-- PMM
