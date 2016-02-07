Received: by 10.25.159.19 with SMTP id i19csp846697lfe;
        Sun, 7 Feb 2016 04:48:55 -0800 (PST)
X-Received: by 10.140.100.244 with SMTP id s107mr3413514qge.19.1454849335868;
        Sun, 07 Feb 2016 04:48:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si26177372qhc.9.2016.02.07.04.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Feb 2016 04:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSOlr-0007mY-Di
	for alex.bennee@linaro.org; Sun, 07 Feb 2016 07:48:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSOlo-0007mJ-Q7
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 07:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSOln-0000u2-LK
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 07:48:52 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSOln-0000tx-D1
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 07:48:51 -0500
Received: by mail-vk0-x235.google.com with SMTP id e6so80920580vkh.2
	for <qemu-arm@nongnu.org>; Sun, 07 Feb 2016 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=irZHaDU51Gm0vrNzp8kZbwq1fqFTds608PctMZcuA3Y=;
	b=db6T5idoiU8EGOpG1r872a0tp/dJalUh0Qx3fvwOannQ9NTEjVHLb04ocJd5tC98fN
	CQoa9aBKJ1n4sNha24UBXgsJSHWQ8OCH0LlNb6tlV7OgPSUlylV3WHh4bhPVt4AOXuS2
	G5rPDKpUdorEYsuHysaG58JY1VqH1a8oD4Uww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=irZHaDU51Gm0vrNzp8kZbwq1fqFTds608PctMZcuA3Y=;
	b=cPK+Zq2T2G/ha333GoTsynYeTYpnxHCmmBYb6Iy9iN0jvHDEf6PFObz7aOca2dZiFY
	0nZKiLx+Uimqsu8k7wXhDeYhd7eNhuON97A9kNNoqjN3K/JvkI2CLOuaQUYfIV4SWURX
	2F9XBNiCmzcg1VlBvskgimqP5P+1PhEJGkWLPLOX7jZmbpCLHWbUCT3f/U2F8zpYrtgZ
	8exdfy4palwdq8NYi2vq9Hig2BjEVfeX04XQTvTluNuSqjKa4VdySviGNM+/mfb7cScV
	yqhbCYtNU8oVgA6cTUIhyg1YAQ8H7AIhwcGkQ4cJ1w7PyjIx4O6MR8TjKjwABOzYcquP
	4RzQ==
X-Gm-Message-State: AG10YOSANV+w9vNUy3l9CNQUdxphySJ3nzpVVCTg7ONpprpzqylIrQK4E5nP63kjYG8V6uZ9nGFhd+2RvyXORfTW
X-Received: by 10.31.52.147 with SMTP id b141mr16532796vka.82.1454849330777;
	Sun, 07 Feb 2016 04:48:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sun, 7 Feb 2016 04:48:31 -0800 (PST)
In-Reply-To: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
References: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 Feb 2016 12:48:31 +0000
Message-ID: <CAFEAcA__AOHfYdfSXGMZWYNo_iMBmSf9ZrSz2rzuejWZK8tdkg@mail.gmail.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: implement "get board
	revision" query
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
X-TUID: BZLJcfEYW6aP

Hi; you forgot to cc qemu-devel (all patches must be cc'd there).

thanks
-- PMM

On 7 February 2016 at 05:09, Stephen Warren <swarren@wwwdotorg.org> wrote:
> Return a valid value from the BCM2835 property mailbox query "get board
> revision". This query is used by U-Boot. Implementing it fixes the first
> obvious difference between qemu and real HW.
>
> The value returned is currently hard-coded to match the RPi2 I own. Other
> values are legal, e.g. different board manufacturer field values are
> likely to exist in the wild. When support for other RPi models is added,
> the value can be made dynamic.
>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> This looks like the only non-video-related mailbox request used by U-Boot
> that wasn't implemented by qemu.
>
> The only other feature required for U-Boot to get to its command prompt
> is the BCM2835 timer.
>
> Andrew, I assume you're actively working on mainlining all the features
> in your github branch? I look forward to U-Boot working on qemu:-)
> ---
>  hw/arm/bcm2835_peripherals.c       | 9 +++++++++
>  hw/misc/bcm2835_property.c         | 4 ++--
>  include/hw/misc/bcm2835_property.h | 1 +
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 18b72ecb696c..5fed6c90b048 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -148,6 +148,15 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    /* When multiple Pi revisions are supported, this hard-coded number should
> +     * be selected by the various raspi*_machine_init().
> +     */
> +    object_property_set_int(OBJECT(&s->property), 0xa21041, "board-rev", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index e42b43e72d56..45bd6c18ce90 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -43,8 +43,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen = 4;
>              break;
>          case 0x00010002: /* Get board revision */
> -            qemu_log_mask(LOG_UNIMP,
> -                          "bcm2835_property: %x get board revision NYI\n", tag);
> +            stl_phys(&s->dma_as, value + 12, s->board_rev);
>              resplen = 4;
>              break;
>          case 0x00010003: /* Get board MAC address */
> @@ -258,6 +257,7 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
>  }
>
>  static Property bcm2835_property_props[] = {
> +    DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
>      DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
> diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
> index fcf5f3decafc..df889eaa08b5 100644
> --- a/include/hw/misc/bcm2835_property.h
> +++ b/include/hw/misc/bcm2835_property.h
> @@ -23,6 +23,7 @@ typedef struct {
>      MemoryRegion iomem;
>      qemu_irq mbox_irq;
>      MACAddr macaddr;
> +    uint32_t board_rev;
>      uint32_t ram_size;
>      uint32_t addr;
>      bool pending;
> --
> 1.9.1
>
