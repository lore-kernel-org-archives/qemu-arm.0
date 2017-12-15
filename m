Received: by 10.223.159.74 with SMTP id f10csp7055413wrg;
        Thu, 14 Dec 2017 18:31:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBotIVukcp4mvUgYQbguXqg5KaZm0qVBLuQmwTeqm7jS28ZyrwNW+HQ1ItDwy1o5A/pqG5G1F
X-Received: by 10.37.118.8 with SMTP id r8mr5951836ybc.381.1513305104651;
        Thu, 14 Dec 2017 18:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513305104; cv=none;
        d=google.com; s=arc-20160816;
        b=H+MpgoFgFoSzeqZEz3gotFo4VUGFJgRZ89ZFhCZhT646MA6iwRe3JxKG8PPJF1CWwT
         YnzkR6lMxazIpw0RguHmp8SIF6OkGe7GxaYp/8XWZ02h/t1m78Sv0rcvLtP3XDrpbwSu
         oe0rqYIY47BSxj/qmiRcMzSobbXJKyo9ltCwRIcolfnpmw4nKAShnPrsVBXBESGQaxvg
         /4yf/OOaNfY3pxrGuU7Xi2vz1BRJeflIbvycRJAWx4GkXQ91lxgElUb94GSpso5XADra
         wJh6/Pm0BvOFepXBT4gVMfOVisaQu8jZ9yeq0G7mVt61AqW3fX60uZ03aDc2ieMohdRe
         cUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=c9ikINKLsw0Qm3gHzW4qROBQHjcdEUq95NFjH5x0d/Q=;
        b=XgeDcf5IrZ/cESxvDf/fSLl/B+GuBTiyaLB3AKewtLUq5VgGOdILnKJv/Q9I5J1cEK
         rGR9ZFMBpuE0ic/LiarBPAJQFjlkXqR35G6wlmLLBUv3aSpyBk2703Nf6cjSBQ2g09En
         COrekCXDMb8vfy7B3sdmDsw36XsCt9wubHTpkcquJGdt2gPnm7BRtfAj96dZ0HbTAG/v
         pAJ7o7XBpwFQfnl6eOzh4eua86zxcpbhsq2Y7k6jBsQ/ixyOsBM0wO46HCzHO4CxdJv/
         LKQEgW/Ay/4ER/XISFV15Ywp0DQxwbcQrTB6cc8Sh6+3+9EHl0JRX9fH+uc1c3Y326U+
         Z/nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O8aJsN8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x84si1090795ywd.657.2017.12.14.18.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 18:31:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O8aJsN8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePfmq-0006ZJ-33
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 21:31:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfmb-0006W8-Mh
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 21:31:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfma-0002nW-1G
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 21:31:29 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:33262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePfmT-0002iM-Mx; Thu, 14 Dec 2017 21:31:21 -0500
Received: by mail-qt0-x22b.google.com with SMTP id e2so10521588qti.0;
	Thu, 14 Dec 2017 18:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=c9ikINKLsw0Qm3gHzW4qROBQHjcdEUq95NFjH5x0d/Q=;
	b=O8aJsN8L5LDXbJO2TBpOp7bB/z/fbJ1yUuc01N0bLAG5ne0qxaY/wrunpkrMXbV5/0
	CMTffAlAzT5ZbuOEbZq8knN0amOL3B2DKeYSLFSa2gP0KygH9hDsSeVOoBncBi8QqLNs
	T+Jn9JUQZF3dUG3zBwNuEcAIDxgdZW7eCbV8IvejWyPBNO4yXp06iWJnSct2GDc9Gkl4
	VH+JLsVCgvweUZgd4eJFcawb/nmcJcdMoozy2SnjIXXooEypxsPNtlDcMlLabC3oy463
	+31R+Yb0FOJTyvvxBjZduNUembTLudPeHHwx+08HfU8qrvjraieqW8MfshUaBXvVORr5
	GvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=c9ikINKLsw0Qm3gHzW4qROBQHjcdEUq95NFjH5x0d/Q=;
	b=SqVmOUxZ4mBcOwSqWcwMZEM25Hkrb+0o/TZqPvVu6Yu87p9OgSxpQ8khGYrHP1WKiK
	ZvvU9rjWdJNUCQgg67e+hv58djfcxQHB7Rmaf0dsRw8YItuACjld+pmW/xi46vUZHmYW
	AqF16hYDl9e9YovuEAyN1DiWWppr9/saYce2cwOEGFtwdAbrqppAvHp5Foyx86OGklfY
	xxWhGgsudoagV5jCYz4JwfU05fED+RJpz2ZGJ4ySqTEoMIFAm+zOhAUnx+e149ZHc1St
	K6PbmHkMvcbB30WSpPtKwdhLLjXps16vd6zE+14JXna5p/O+qU8g3yqRsUGU4cK08GeD
	lJCw==
X-Gm-Message-State: AKGB3mLf693J9huJF6/bnAgghCE9xDhvA6dM0E1wcldtC7Qttj4qobcm
	8CrPIy1rAS1MEOV5hRyiFcQ=
X-Received: by 10.200.27.200 with SMTP id m8mr19075381qtk.102.1513305081105;
	Thu, 14 Dec 2017 18:31:21 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id p7sm3431869qkd.14.2017.12.14.18.31.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 18:31:20 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-13-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c0810d46-60df-2239-fab6-6c1c11f1c274@amsat.org>
Date: Thu, 14 Dec 2017 23:31:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214145255.31545-13-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [PATCH v2 12/15] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNm/mWU3fIdw

Hi Andrey, Peter.

I rather disagree with this patch, however I applied it on top of my
current tree and plan to refactor it. But if it is applied before, I can
survive :) Not a strong NACK.

See comment inlined.

On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
> IP block found on several generations of i.MX family does not use
> vanilla SDHCI implementation and it comes with a number of quirks.
> 
> Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
> support unmodified Linux guest driver.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/sd/sdhci-internal.h |  19 +++++
>  hw/sd/sdhci.c          | 228 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/sd/sdhci.h  |  14 +++
>  3 files changed, 259 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 161177cf39..b86ac0791b 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -85,12 +85,18 @@
>  
>  /* R/W Host control Register 0x0 */
>  #define SDHC_HOSTCTL                   0x28
> +#define SDHC_CTRL_LED                  0x01
>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>  #define SDHC_CTRL_SDMA                 0x00
>  #define SDHC_CTRL_ADMA1_32             0x08
>  #define SDHC_CTRL_ADMA2_32             0x10
>  #define SDHC_CTRL_ADMA2_64             0x18
>  #define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
> +#define SDHC_CTRL_4BITBUS              0x02
> +#define SDHC_CTRL_8BITBUS              0x20
> +#define SDHC_CTRL_CDTEST_INS           0x40
> +#define SDHC_CTRL_CDTEST_EN            0x80
> +
>  
>  /* R/W Power Control Register 0x0 */
>  #define SDHC_PWRCON                    0x29
> @@ -229,4 +235,17 @@ enum {
>  
>  extern const VMStateDescription sdhci_vmstate;
>  
> +
> +#define ESDHC_MIX_CTRL                  0x48
> +#define ESDHC_VENDOR_SPEC               0xc0
> +#define ESDHC_DLL_CTRL                  0x60
> +
> +#define ESDHC_TUNING_CTRL               0xcc
> +#define ESDHC_TUNE_CTRL_STATUS          0x68
> +#define ESDHC_WTMK_LVL                  0x44
> +
> +#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
> +#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
> +
> +
>  #endif
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 6d6a791ee9..758af067f9 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -265,7 +265,8 @@ static void sdhci_send_command(SDHCIState *s)
>              }
>          }
>  
> -        if ((s->norintstsen & SDHC_NISEN_TRSCMP) &&
> +        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
> +            (s->norintstsen & SDHC_NISEN_TRSCMP) &&
>              (s->cmdreg & SDHC_CMD_RESPONSE) == SDHC_CMD_RSP_WITH_BUSY) {
>              s->norintsts |= SDHC_NIS_TRSCMP;
>          }
> @@ -1191,6 +1192,8 @@ static void sdhci_initfn(SDHCIState *s)
>  
>      s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
>      s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
> +
> +    s->io_ops = &sdhci_mmio_ops;
>  }
>  
>  static void sdhci_uninitfn(SDHCIState *s)
> @@ -1347,7 +1350,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
>      sysbus_init_irq(sbd, &s->irq);
> -    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
> +    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
>              SDHC_REGISTERS_MAP_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
> @@ -1386,11 +1389,232 @@ static const TypeInfo sdhci_bus_info = {
>      .class_init = sdhci_bus_class_init,
>  };
>  
> +static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    SDHCIState *s = SYSBUS_SDHCI(opaque);
> +    uint32_t ret;
> +    uint16_t hostctl;
> +
> +    switch (offset) {
> +    default:
> +        return sdhci_read(opaque, offset, size);
> +
> +    case SDHC_HOSTCTL:
> +        /*
> +         * For a detailed explanation on the following bit
> +         * manipulation code see comments in a similar part of
> +         * usdhc_write()
> +         */
> +        hostctl = SDHC_DMA_TYPE(s->hostctl) << (8 - 3);
> +
> +        if (s->hostctl & SDHC_CTRL_8BITBUS) {
> +            hostctl |= ESDHC_CTRL_8BITBUS;
> +        }
> +
> +        if (s->hostctl & SDHC_CTRL_4BITBUS) {
> +            hostctl |= ESDHC_CTRL_4BITBUS;
> +        }
> +
> +        ret  = hostctl;
> +        ret |= (uint32_t)s->blkgap << 16;
> +        ret |= (uint32_t)s->wakcon << 24;
> +
> +        break;
> +
> +    case ESDHC_DLL_CTRL:
> +    case ESDHC_TUNE_CTRL_STATUS:
> +    case 0x6c:
> +    case ESDHC_TUNING_CTRL:
> +    case ESDHC_VENDOR_SPEC:
> +    case ESDHC_MIX_CTRL:
> +    case ESDHC_WTMK_LVL:
> +        ret = 0;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void
> +usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
> +{
> +    SDHCIState *s = SYSBUS_SDHCI(opaque);
> +    uint8_t hostctl;
> +    uint32_t value = (uint32_t)val;
> +
> +    switch (offset) {
> +    case ESDHC_DLL_CTRL:
> +    case ESDHC_TUNE_CTRL_STATUS:
> +    case 0x6c:
> +    case ESDHC_TUNING_CTRL:
> +    case ESDHC_WTMK_LVL:
> +    case ESDHC_VENDOR_SPEC:
> +        break;
> +
> +    case SDHC_HOSTCTL:
> +        /*
> +         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
> +         *
> +         *       7         6     5      4      3      2        1      0
> +         * |-----------+--------+--------+-----------+----------+---------|
> +         * | Card      | Card   | Endian | DATA3     | Data     | Led     |
> +         * | Detect    | Detect | Mode   | as Card   | Transfer | Control |
> +         * | Signal    | Test   |        | Detection | Width    |         |
> +         * | Selection | Level  |        | Pin       |          |         |
> +         * |-----------+--------+--------+-----------+----------+---------|
> +         *
> +         * and 0x29
> +         *
> +         *  15      10 9    8
> +         * |----------+------|
> +         * | Reserved | DMA  |
> +         * |          | Sel. |
> +         * |          |      |
> +         * |----------+------|
> +         *
> +         * and here's what SDCHI spec expects those offsets to be:
> +         *
> +         * 0x28 (Host Control Register)
> +         *
> +         *     7        6         5       4  3      2         1        0
> +         * |--------+--------+----------+------+--------+----------+---------|
> +         * | Card   | Card   | Extended | DMA  | High   | Data     | LED     |
> +         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Control |
> +         * | Signal | Test   | Transfer |      | Enable | Width    |         |
> +         * | Sel.   | Level  | Width    |      |        |          |         |
> +         * |--------+--------+----------+------+--------+----------+---------|
> +         *
> +         * and 0x29 (Power Control Register)
> +         *
> +         * |----------------------------------|
> +         * | Power Control Register           |
> +         * |                                  |
> +         * | Description omitted,             |
> +         * | since it has no analog in ESDHCI |
> +         * |                                  |
> +         * |----------------------------------|
> +         *
> +         * Since offsets 0x2A and 0x2B should be compatible between
> +         * both IP specs we only need to reconcile least 16-bit of the
> +         * word we've been given.
> +         */
> +
> +        /*
> +         * First, save bits 7 6 and 0 since they are identical
> +         */
> +        hostctl = value & (SDHC_CTRL_LED |
> +                           SDHC_CTRL_CDTEST_INS |
> +                           SDHC_CTRL_CDTEST_EN);
> +        /*
> +         * Second, split "Data Transfer Width" from bits 2 and 1 in to
> +         * bits 5 and 1
> +         */
> +        if (value & ESDHC_CTRL_8BITBUS) {
> +            hostctl |= SDHC_CTRL_8BITBUS;
> +        }
> +
> +        if (value & ESDHC_CTRL_4BITBUS) {
> +            hostctl |= ESDHC_CTRL_4BITBUS;
> +        }
> +
> +        /*
> +         * Third, move DMA select from bits 9 and 8 to bits 4 and 3
> +         */
> +        hostctl |= SDHC_DMA_TYPE(value >> (8 - 3));
> +
> +        /*
> +         * Now place the corrected value into low 16-bit of the value
> +         * we are going to give standard SDHCI write function
> +         *
> +         * NOTE: This transformation should be the inverse of what can
> +         * be found in drivers/mmc/host/sdhci-esdhc-imx.c in Linux
> +         * kernel
> +         */
> +        value &= ~UINT16_MAX;
> +        value |= hostctl;
> +        value |= (uint16_t)s->pwrcon << 8;
> +
> +        sdhci_write(opaque, offset, value, size);
> +        break;
> +
> +    case ESDHC_MIX_CTRL:
> +        /*
> +         * So, when SD/MMC stack in Linux tries to write to "Transfer
> +         * Mode Register", ESDHC i.MX quirk code will translate it
> +         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
> +         * order to get where we started
> +         *
> +         * Note that Auto CMD23 Enable bit is located in a wrong place
> +         * on i.MX, but since it is not used by QEMU we do not care.
> +         *
> +         * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
> +         * here becuase it will result in a call to
> +         * sdhci_send_command(s) which we don't want.
> +         *
> +         */
> +        s->trnmod = value & UINT16_MAX;
> +        break;
> +    case SDHC_TRNMOD:
> +        /*
> +         * Similar to above, but this time a write to "Command
> +         * Register" will be translated into a 4-byte write to
> +         * "Transfer Mode register" where lower 16-bit of value would
> +         * be set to zero. So what we do is fill those bits with
> +         * cached value from s->trnmod and let the SDHCI
> +         * infrastructure handle the rest
> +         */
> +        sdhci_write(opaque, offset, val | s->trnmod, size);
> +        break;
> +    case SDHC_BLKSIZE:
> +        /*
> +         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
> +         * Linux driver will try to zero this field out which will
> +         * break the rest of SDHCI emulation.
> +         *
> +         * Linux defaults to maximum possible setting (512K boundary)
> +         * and it seems to be the only option that i.MX IP implements,
> +         * so we artificially set it to that value.
> +         */
> +        val |= 0x7 << 12;
> +        /* FALLTHROUGH */
> +    default:
> +        sdhci_write(opaque, offset, val, size);
> +        break;
> +    }
> +}
> +
> +
> +static const MemoryRegionOps usdhc_mmio_ops = {
> +    .read = usdhc_read,
> +    .write = usdhc_write,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +        .unaligned = false
> +    },
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};

I think the usdhc_mmio_ops can be avoided.

> +
> +static void imx_usdhc_init(Object *obj)
> +{
> +    SDHCIState *s = SYSBUS_SDHCI(obj);
> +
> +    s->io_ops = &usdhc_mmio_ops;
> +    s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
> +}
> +
> +static const TypeInfo imx_usdhc_info = {
> +    .name = TYPE_IMX_USDHC,
> +    .parent = TYPE_SYSBUS_SDHCI,
> +    .instance_init = imx_usdhc_init,
> +};

there is no need to add yet another device. You can achieve the same
using a property bit (like the "pending-insert-quirk" one).

I think the correct way is to add a DEFINE_PROP_BIT64("quirks*").

>  static void sdhci_register_types(void)
>  {
>      type_register_static(&sdhci_pci_info);
>      type_register_static(&sdhci_sysbus_info);
>      type_register_static(&sdhci_bus_info);
> +    type_register_static(&imx_usdhc_info);
>  }
>  
>  type_init(sdhci_register_types)
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 0f0c3f1e64..b56836a2fc 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -39,6 +39,7 @@ typedef struct SDHCIState {
>      };
>      SDBus sdbus;
>      MemoryRegion iomem;
> +    const MemoryRegionOps *io_ops;
>  
>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>      QEMUTimer *transfer_timer;
> @@ -83,8 +84,19 @@ typedef struct SDHCIState {
>      /* Force Event Auto CMD12 Error Interrupt Reg - write only */
>      /* Force Event Error Interrupt Register- write only */
>      /* RO Host Controller Version Register always reads as 0x2401 */
> +
> +    uint32_t quirks;
>  } SDHCIState;
>  
> +/*
> + * Controller does not provide transfer-complete interrupt when not
> + * busy.
> + *
> + * NOTE: This definition is taken out of Linux kernel and so the
> + * original bit number is preserved
> + */
> +#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
> +
>  #define TYPE_PCI_SDHCI "sdhci-pci"
>  #define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
>  
> @@ -92,4 +104,6 @@ typedef struct SDHCIState {
>  #define SYSBUS_SDHCI(obj)                               \
>       OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
>  
> +#define TYPE_IMX_USDHC "imx-usdhc"
> +
>  #endif /* SDHCI_H */
> 
