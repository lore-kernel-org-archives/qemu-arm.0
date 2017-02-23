Received: by 10.25.0.147 with SMTP id 141csp341480lfa;
        Thu, 23 Feb 2017 10:57:00 -0800 (PST)
X-Received: by 10.55.65.136 with SMTP id o130mr36637993qka.168.1487876220180;
        Thu, 23 Feb 2017 10:57:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w88si3915587qtd.312.2017.02.23.10.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 10:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyZV-0006VK-My
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 13:56:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyRP-000796-JV
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyRO-0004Bi-IE
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:48:35 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgyRO-0004BW-Ce
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 13:48:34 -0500
Received: by mail-wm0-x235.google.com with SMTP id v77so37942618wmv.1
	for <qemu-devel@nongnu.org>; Thu, 23 Feb 2017 10:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GjUQ0NEfMRmXmAdkS7BRJeHygRjPW3MKxlqA6SYN34E=;
	b=WHicn6dqRa+ZWvunlU37VHmKI/PgLLnOfReO1RtzccCx9A7XbAmKCFtQ4oAKVZLUa4
	hvW+AEby3V/AWDprkeNcfljFkTvw8WD1/veMgaswrIsSBQKgiTFOuh8Hd1KWuCRjv9LS
	rBs4WN2WEoNI2+m4oHjshe35olD0IdtUainXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GjUQ0NEfMRmXmAdkS7BRJeHygRjPW3MKxlqA6SYN34E=;
	b=U6It5UUvuqAymmwGN7zJ6AsJ3cIB5WWWBWLUXAcRAh7ZAeaNgwDwLXDOViUw6KWlOt
	6BY3K0wcCDxG+66JJ8HcWbsVW0yjYVftMtHbQ8qlkb0S8HpW1lojGnfDGvBPVx+eeYdJ
	07MS99Y4bnmD4DZcXfDOnm6vCI5V4tqn+IAUBR1f452xLETxjLcFuJf/W//d36sNwJeC
	nvHkI7PgvwJ4fIfAhkgu19rCh4f5BW79NtYEr3X93WfLNpiojypCtqRs38btCFhKR9bM
	frZSERYiKCTAwhu/fkSeDhpM5yk3IWRGG8TqcVlI0+r7w2YN9tqzEErmbPKz0jL5VYVg
	DQIQ==
X-Gm-Message-State: AMke39mpNz7FE8t8c/k2t4NIcz/+LgnCq9dkGEkO4AAFOzo5OWJvo8QRirjoU8YD5NmLhl++XuqNT63mkCbhNvEN
X-Received: by 10.28.172.68 with SMTP id v65mr3835384wme.111.1487875713285;
	Thu, 23 Feb 2017 10:48:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 10:48:12 -0800 (PST)
In-Reply-To: <20170222112338.25492-2-clement.deschamps@antfield.fr>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
	<20170222112338.25492-2-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 18:48:12 +0000
Message-ID: <CAFEAcA84OnAiAujSa-N5dtK0TO5KeCyiXxKvTwShXrqieGaxhQ@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH v2 1/3] bcm2835_sdhost: add bcm2835 sdhost
 controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0ClBiw2Ulhp

On 22 February 2017 at 11:23, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> This adds the BCM2835 SDHost controller from Arasan.
>
> Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
> ---
>  hw/sd/Makefile.objs            |   1 +
>  hw/sd/bcm2835_sdhost.c         | 429 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/sd/bcm2835_sdhost.h |  48 +++++
>  3 files changed, 478 insertions(+)
>  create mode 100644 hw/sd/bcm2835_sdhost.c
>  create mode 100644 include/hw/sd/bcm2835_sdhost.h
>
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index 31c83308f2..c2b7664264 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -6,3 +6,4 @@ common-obj-$(CONFIG_SDHCI) += sdhci.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
>  obj-$(CONFIG_OMAP) += omap_mmc.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
> +obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> new file mode 100644
> index 0000000000..03c93ddb25
> --- /dev/null
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -0,0 +1,429 @@
> +/*
> + * Raspberry Pi (BCM2835) SD Host Controller
> + *
> + * Copyright (c) 2017 Antfield SAS
> + *
> + * Authors:
> + *  Clement Deschamps <clement.deschamps@antfield.fr>
> + *  Luc Michel <luc.michel@antfield.fr>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.

GPL-2-only is OK if that's what you strongly want, but if all the
authors are OK with it we prefer GPL-2-or-later (see the note in
the LICENSE file). Similarly with the header file.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
