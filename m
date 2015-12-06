Received: by 10.182.158.201 with SMTP id ww9csp1583838obb;
        Sat, 5 Dec 2015 21:25:49 -0800 (PST)
X-Received: by 10.140.88.212 with SMTP id t78mr28613614qgd.82.1449379549487;
        Sat, 05 Dec 2015 21:25:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x202si13107979qka.101.2015.12.05.21.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Dec 2015 21:25:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5RpV-0003CR-4V
	for alex.bennee@linaro.org; Sun, 06 Dec 2015 00:25:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5RpS-000394-T6
	for qemu-arm@nongnu.org; Sun, 06 Dec 2015 00:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5RpR-0003UA-Qa
	for qemu-arm@nongnu.org; Sun, 06 Dec 2015 00:25:46 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:33212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a5RpP-0003TX-Oq; Sun, 06 Dec 2015 00:25:43 -0500
Received: by wmec201 with SMTP id c201so124174403wme.0;
	Sat, 05 Dec 2015 21:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RvVFsgMaiKMJ9Lwjuh8itTT5kmD4G4s3Y0KklMn7Dn4=;
	b=g/znhf9dia2Eth18XhypPq0dYcSEramcYBkNLNmKUly/3R6IhSZkUjXKxceGk5fHSM
	MrsaCG4GRxK9cuUhtdhcit//FeYny83DQ/7sf+N/eYn4T+pcAl2cI2ywuL+b8kVyvA3z
	P8hPZoy0TGtx1JyDWoEi9OABMXLhQbWGM7d18i3bNPfh8ltyUt/13x1TvTVWChuTDgo6
	oJd7GNyFOsyqbCyC349rEf+BwNV1I4IY7omU2NrVOhtpgygHgg7sIhXeqiWYZkRRH20u
	+lHB/6Yn5AbQhOedryn5LC6v0Gzl3/2PlPAgZAoLq5ZYmQ1IQcakHJ+i5jU4MW+lOCIk
	+Mmw==
MIME-Version: 1.0
X-Received: by 10.194.204.166 with SMTP id kz6mr1589738wjc.174.1449379543231; 
	Sat, 05 Dec 2015 21:25:43 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sat, 5 Dec 2015 21:25:43 -0800 (PST)
In-Reply-To: <1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
Date: Sat, 5 Dec 2015 21:25:43 -0800
Message-ID: <CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
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
X-TUID: O4BrqQyqwA3L

On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/sd/Makefile.objs          |   1 +
>  hw/sd/bcm2835_emmc.c         | 800 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/sd/bcm2835_emmc.h |  56 +++
>  3 files changed, 857 insertions(+)
>  create mode 100644 hw/sd/bcm2835_emmc.c
>  create mode 100644 include/hw/sd/bcm2835_emmc.h
>
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index f1aed83..b9cb9b8 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -6,3 +6,4 @@ common-obj-$(CONFIG_SDHCI) += sdhci.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
>  obj-$(CONFIG_OMAP) += omap_mmc.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
> +obj-$(CONFIG_RASPI) += bcm2835_emmc.o
> diff --git a/hw/sd/bcm2835_emmc.c b/hw/sd/bcm2835_emmc.c
> new file mode 100644
> index 0000000..46628b5
> --- /dev/null
> +++ b/hw/sd/bcm2835_emmc.c
> @@ -0,0 +1,800 @@
> +/*
> + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "sysemu/blockdev.h"
> +#include "hw/sd/bcm2835_emmc.h"
> +
> +/*
> + * Controller registers
> + */
> +
> +#define SDHCI_DMA_ADDRESS   0x00
> +#define SDHCI_ARGUMENT2     SDHCI_DMA_ADDRESS
> +

Is this IP just SDHCI? We already model SDHCI in QEMU, see
hw/sd/sdhci.c. If there are RPi specific features to the SDHCI
implementation they should be added as optional extensions (probabably
via subclassing) to the existing SDHCI model.

Regards,
Peter
