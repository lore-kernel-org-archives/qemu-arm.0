Received: by 10.28.71.27 with SMTP id u27csp2121204wma;
        Sat, 17 Feb 2018 11:38:02 -0800 (PST)
X-Google-Smtp-Source: AH8x226e0D3QUhGLRSYQNJUqcKpBv0ruYUUxdbH4ULf1t8ta7MzX8aOLCKMCIcOnoIRVP1i1spr3
X-Received: by 10.37.75.133 with SMTP id y127mr7318202yba.218.1518896282423;
        Sat, 17 Feb 2018 11:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518896282; cv=none;
        d=google.com; s=arc-20160816;
        b=N9xpwOjT/s12Gn1Vd+DvzE1pdeiZCl0XDnvN96BfG59y8aN+5BV+TKt6RYmBkmzIJB
         kr3YBXXts9ANrzScI9iGk8d8jNcmkRTrYuvE8+Oj7QMtKHifs4+ZeBvTnyZx3NjOeWc5
         VAYUlGFRKhKffdIYN6jh53xXTp36HRpcx81soBcVO2vgRudcwTZV1HCMid4ica7Wf+Tm
         ZfkGA4ke3mWGGGiX6rbwB8JVrckD2XgoDquEzgpco7lzFmMcy0IA/jIhlHz6mQS2Rz4I
         kc5xjKSdxTMDAS9+vbz75q8rdkcXDPow5f3sxyta4UBR6CJY7RU7tD7JJGlPFL4utiEa
         CwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=0NcWDM+O7D3tRsWXMw0PhcMemPspzZaShDhltW9DCBw=;
        b=oMG7KGAP85RaHz6nhSjqd7ZCXh1omAoknlRSvoC6YoOHh27zMkjZHdNgWCjGb7ZROa
         6fSE50WntSWT9+Dj5gM61BLZ9jHWaEAu/mD2PPRsFCz7JPSRQ1mP8/VsQ3QWbXFre1UJ
         6sXp6nVh5WBE4ZCSAyupdL1deHIAXXgdXefSl5Uvn35GXUZ/v+RyCjI2hz6LdM8S7ojb
         zFoRpBdJSUpFjlOVm3GtFmu1peWyXQAbkKDNXL8YMug5UQHyl06VpcnUN+unRgyszGEp
         PEvxcfcFM1uN2YSOlcGWRXTsFXWtucRVvFm88gfUDFlMx6P7wJIKHzZf3Swz1PXgEJh2
         8BbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuuqAfdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y185si464543ywf.706.2018.02.17.11.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuuqAfdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8J7-0007wo-Ls
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:38:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7Hs-0008AO-3k
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:32:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7Ho-0005vs-VU
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:32:40 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7Ho-0005vk-Om; Sat, 17 Feb 2018 13:32:36 -0500
Received: by mail-qt0-x244.google.com with SMTP id f4so7710278qtj.6;
	Sat, 17 Feb 2018 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0NcWDM+O7D3tRsWXMw0PhcMemPspzZaShDhltW9DCBw=;
	b=tuuqAfdSubSVhnrcWekuAe49KNmqHvr/dTViP7vPrdh2VgLrz2t32tzdBjHhixMEkW
	0TSEs/EEyC79vT1hs2bEzHcDUFvcAn+knOt3tWC5fM2rdht6LnqMAGqPHLgmYUm4WBXk
	BIv+u6ZcVEps3x+PfqwKhr0zLJqzeu3pnY8zjkB1/g7ZLEoknqNANNGRTcYFc7o9bF0e
	elYgMIh8WKJcQhL6LkwKGwF+E6MjlK7LakfcL1wyzGoy4awGdXW+ylWx/HsXOVb0Hxoe
	dG0y2MXZyaWLqpCHXWtJ5UMsLcphvW9vBiqRtBoEzEk1qAFIoLSowzAMYEME/M+PXPbK
	q+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0NcWDM+O7D3tRsWXMw0PhcMemPspzZaShDhltW9DCBw=;
	b=HDSKxi810hM1GPKyLlBbGg3fRt1EWWyuQ8G37ktSAlWwSZRmiVPdKCfllMLx4v8eBP
	jm9Rf4luRLt6mCTMKbBW8WsqsPbyoAdKhwaRXVwbvfgK1w0D2wIgVlTir0TwCPo+Kskb
	hKEBBGZZYvzvtJ25Gme47c7ZmQALJnaigw0Zvnyiov682kvyOfqrx+JJHDAkTOwvLYYW
	CJMYiPMwMSoIdD90yNi9UcDbwSAwbxIj54OwCN/hCWoVsmXP9Wyx4WJrV/N9ow4BHyp5
	MqtkZrKwvpqAbmE7OfLdDsavPzTfyD3s+iXhAW+0Sdz411z00+REEE+x1mh9nF4jPWnB
	jfwA==
X-Gm-Message-State: APf1xPAICXt5nGzADnsBjxNQJ2t+G0cH91g/WkjBtent3O6M9noZyLrG
	4VGzmTEancPkT72/JxSQ6URa3Jje
X-Received: by 10.200.25.134 with SMTP id u6mr15570757qtj.221.1518892356051;
	Sat, 17 Feb 2018 10:32:36 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	w18sm11365466qkw.35.2018.02.17.10.32.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Feb 2018 10:32:35 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
Date: Sat, 17 Feb 2018 15:32:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180217140051.22731-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbJ1hz9H3arh

Hi Linus,

On 02/17/2018 11:00 AM, Linus Walleij wrote:
> This adds support for emulating the Silicon Image SII9022 DVI/HDMI
> bridge. It's not very clever right now, it just acknowledges
> the switch into DDC I2C mode and back. Combining this with the
> existing DDC I2C emulation gives the right behavior on the Versatile
> Express emulation passing through the QEMU EDID to the emulated
> platform.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  hw/display/Makefile.objs |   1 +
>  hw/display/sii9022.c     | 185 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 186 insertions(+)
>  create mode 100644 hw/display/sii9022.c
> 
> diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
> index d3a4cb396eb9..3c7c75b94da5 100644
> --- a/hw/display/Makefile.objs
> +++ b/hw/display/Makefile.objs
> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_VGA_CIRRUS) += cirrus_vga.o
>  common-obj-$(CONFIG_G364FB) += g364fb.o
>  common-obj-$(CONFIG_JAZZ_LED) += jazz_led.o
>  common-obj-$(CONFIG_PL110) += pl110.o
> +common-obj-$(CONFIG_SII9022) += sii9022.o
>  common-obj-$(CONFIG_SSD0303) += ssd0303.o
>  common-obj-$(CONFIG_SSD0323) += ssd0323.o
>  common-obj-$(CONFIG_XEN) += xenfb.o
> diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
> new file mode 100644
> index 000000000000..d6f3cdc04293
> --- /dev/null
> +++ b/hw/display/sii9022.c
> @@ -0,0 +1,185 @@
> +/*
> + * Silicon Image SiI9022
> + *
> + * This is a pretty hollow emulation: all we do is acknowledge that we
> + * exist (chip ID) and confirm that we get switched over into DDC mode
> + * so the emulated host can proceed to read out EDID data. All subsequent
> + * set-up of connectors etc will be acknowledged and ignored.
> + *
> + * Copyright (c) 2018 Linus Walleij
> + *
> + * This code is licensed under the GNU GPL v2.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "hw/i2c/i2c.h"
> +
> +#define DEBUG_SII9022 0
> +
> +#define DPRINTF(fmt, ...) \
> +    do { \
> +        if (DEBUG_SII9022) { \
> +            printf("sii9022: " fmt, ## __VA_ARGS__); \
> +        } \
> +    } while (0)

Can you replace DPRINTF() by trace events?

Except that, patch looks fine.

Regards,

Phil.

> +
> +#define SII9022_SYS_CTRL_DATA 0x1a
> +#define SII9022_SYS_CTRL_PWR_DWN 0x10
> +#define SII9022_SYS_CTRL_AV_MUTE 0x08
> +#define SII9022_SYS_CTRL_DDC_BUS_REQ 0x04
> +#define SII9022_SYS_CTRL_DDC_BUS_GRTD 0x02
> +#define SII9022_SYS_CTRL_OUTPUT_MODE 0x01
> +#define SII9022_SYS_CTRL_OUTPUT_HDMI 1
> +#define SII9022_SYS_CTRL_OUTPUT_DVI 0
> +#define SII9022_REG_CHIPID 0x1b
> +#define SII9022_INT_ENABLE 0x3c
> +#define SII9022_INT_STATUS 0x3d
> +#define SII9022_INT_STATUS_HOTPLUG 0x01;
> +#define SII9022_INT_STATUS_PLUGGED 0x04;
> +
> +#define TYPE_SII9022 "sii9022"
> +#define SII9022(obj) OBJECT_CHECK(sii9022_state, (obj), TYPE_SII9022)
> +
> +typedef struct sii9022_state {
> +    I2CSlave parent_obj;
> +    uint8_t ptr;
> +    bool addr_byte;
> +    bool ddc_req;
> +    bool ddc_skip_finish;
> +    bool ddc;
> +} sii9022_state;
> +
> +static const VMStateDescription vmstate_sii9022 = {
> +    .name = "sii9022",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_I2C_SLAVE(parent_obj, sii9022_state),
> +        VMSTATE_UINT8(ptr, sii9022_state),
> +        VMSTATE_BOOL(addr_byte, sii9022_state),
> +        VMSTATE_BOOL(ddc_req, sii9022_state),
> +        VMSTATE_BOOL(ddc_skip_finish, sii9022_state),
> +        VMSTATE_BOOL(ddc, sii9022_state),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    sii9022_state *s = SII9022(i2c);
> +
> +    switch (event) {
> +    case I2C_START_SEND:
> +        s->addr_byte = true;
> +        break;
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_FINISH:
> +        break;
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static int sii9022_rx(I2CSlave *i2c)
> +{
> +    sii9022_state *s = SII9022(i2c);
> +    uint8_t res = 0x00;
> +
> +    switch (s->ptr) {
> +    case SII9022_SYS_CTRL_DATA:
> +        if (s->ddc_req) {
> +            /* Acknowledge DDC bus request */
> +            res = SII9022_SYS_CTRL_DDC_BUS_GRTD | SII9022_SYS_CTRL_DDC_BUS_REQ;
> +        }
> +        break;
> +    case SII9022_REG_CHIPID:
> +        res = 0xb0;
> +        break;
> +    case SII9022_INT_STATUS:
> +        /* Something is cold-plugged in, no interrupts */
> +        res = SII9022_INT_STATUS_PLUGGED;
> +        break;
> +    default:
> +        break;
> +    }
> +    DPRINTF("%02x read from %02x\n", res, s->ptr);
> +    s->ptr++;
> +
> +    return res;
> +}
> +
> +static int sii9022_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    sii9022_state *s = SII9022(i2c);
> +
> +    if (s->addr_byte) {
> +        s->ptr = data;
> +        s->addr_byte = false;
> +        return 0;
> +    }
> +
> +    switch (s->ptr) {
> +    case SII9022_SYS_CTRL_DATA:
> +        if (data & SII9022_SYS_CTRL_DDC_BUS_REQ) {
> +            s->ddc_req = true;
> +            if (data & SII9022_SYS_CTRL_DDC_BUS_GRTD) {
> +                s->ddc = true;
> +                /* Skip this finish since we just switched to DDC */
> +                s->ddc_skip_finish = true;
> +                DPRINTF("switched to DDC mode\n");
> +            }
> +        } else {
> +            s->ddc_req = false;
> +            s->ddc = false;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    DPRINTF("%02x written to %02x\n", data, s->ptr);
> +    s->ptr++;
> +
> +    return 0;
> +}
> +
> +static void sii9022_reset(DeviceState *dev)
> +{
> +    sii9022_state *s = SII9022(dev);
> +
> +    s->ptr = 0;
> +    s->addr_byte = false;
> +}
> +
> +static void sii9022_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->event = sii9022_event;
> +    k->recv = sii9022_rx;
> +    k->send = sii9022_tx;
> +    dc->reset = sii9022_reset;
> +    dc->vmsd = &vmstate_sii9022;
> +}
> +
> +static const TypeInfo sii9022_info = {
> +    .name          = TYPE_SII9022,
> +    .parent        = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(sii9022_state),
> +    .class_init    = sii9022_class_init,
> +};
> +
> +static void sii9022_register_types(void)
> +{
> +    type_register_static(&sii9022_info);
> +}
> +
> +type_init(sii9022_register_types)
> 
