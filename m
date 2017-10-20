Received: by 10.223.197.9 with SMTP id q9csp7459128wrf;
        Thu, 19 Oct 2017 19:58:56 -0700 (PDT)
X-Received: by 10.55.24.170 with SMTP id 42mr4646657qky.220.1508468336310;
        Thu, 19 Oct 2017 19:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508468336; cv=none;
        d=google.com; s=arc-20160816;
        b=rLQUW9bqFZih3mtTMeDwXlHDU64BEsLCcUIG9rcs3xUDRdOtOJaptCX1FZo3jYfuug
         W1xEJRwuC39eCGs7Gh7jtBYPWg0TC29NxBkB7d6WSCvqtKDRK+fs8PWVz/zfTJHZ8pJe
         KIPy8CBtd5SGa9dyNkWRP5H0gkLU8wOFVbe+QEWYZd6VD+HtCQrcPqY7OoxvDKZS6YiI
         CmHDQhT9gWEJ4SzVwreOwfCwhKomqyO6ytDcxCn/cWDPQYpVaTmQdkKZ7olAX8+HIBgp
         KE/byKslaPkjQQkRUOvAJRvVpgaf/vF4lGN1Dn7q/Eljm9bbSLhQIKKNHCIaxz6Tjaz7
         dO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=1zka256o3mijgIRICbl54m5r2jY/2kQsEL5FjRd56cM=;
        b=BZZwqQgltdKo0+ovj8h1VUGxumfVjKtKH/ZQzQW/mKIlrM9Bdlel+G1Tdmss7BZXdH
         aCgUV65aXlpT4PXxklEmQ299GTXzBfk13vy1Bkrb230wgcAJKw/uNGi8aaU+29Ce41Lk
         Lq/cvbH/lRcMIb5ufg4Q+O14F5ShK9CiMS6ICTfeUgcbznnsxFM5Z11iUyY4bQ0fhTOR
         BL0ncMrUVHW+cNLzExBOpSAvZLX0gk278+mPoTsLfkAa2v49mz3YLKwFRQ4Zm/p+xg12
         cq5V4owSPbFQ998LuMwqC20BLKOxB/XgoofwFjfn1729A38ezpQHAyr6I3fCuKzM+ufH
         rUww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b0keqW4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z74si2699283qkg.197.2017.10.19.19.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 19:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b0keqW4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5NWP-00051r-Ut
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 22:58:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NW7-0004zV-JX
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 22:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NW5-0007JL-Da
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 22:58:35 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43645)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NVz-0007Dm-4Y; Thu, 19 Oct 2017 22:58:27 -0400
Received: by mail-qk0-x243.google.com with SMTP id w134so12837693qkb.0;
	Thu, 19 Oct 2017 19:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1zka256o3mijgIRICbl54m5r2jY/2kQsEL5FjRd56cM=;
	b=b0keqW4lADVtEn5qC//4zk576iUyzi3UBuL2AEiXRMKWInXJ9dez5x8njYtGxv3jWl
	in4QH9TpK3fsnOZdIDU641eI1NtvrBrBiryuyfOHFdGnIuM0q9SCMylY2VFBGKncqQL6
	pRUiKxkh0EFjrF9yjo/CT92hqn8PzAUiYqF/wioJNTN5pdX5BALvMI35x79HyHaP1CtK
	p/heCkQdIWiRraJIyIbmCDg78jEfkQsVnDcS33z2SfEwHGy8ZH64BtIDCcg0yicrZgQk
	6vNoqTMArf5dkl7UIzVj5UIga41IPaQcFm25BLioXUmEByAymw0JRWfdqirMwOTPuQ3J
	Z8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=1zka256o3mijgIRICbl54m5r2jY/2kQsEL5FjRd56cM=;
	b=t+8Cg82xRzGlwNdMiIf7W7QIgDqzA9qpOaKAsPrzFcz6E/wyP1ZlBveHCATjdYfMzM
	ZpyDQQ6oZLmgMTHnV+QqQv7oxnnWzgfKYCLVcs0SwIDhBQF9loU/Pt0S6aLULSjCavyy
	nzSRf/YHxqIqMT8qd41GL7SmLvfftoCiCYd8ttHCMj1FAkUHsbBxqo7hXpbbtz4Zxfmz
	ak7BIqgrewat50s0WxnpESgZ0StobnO8VoifCPULVOP+2TAR0C0BuKXVFN3XHVjflnv8
	bNiAt0oRYGlEr+CosE8DPTRZjOaj2JI5Ysofpn6A3845jYrwzhRquDhfpczFAd0r8c3J
	xbkQ==
X-Gm-Message-State: AMCzsaXr8UAPyKQTEjpJl7k0tcnZQD7WKq4SWAz4AffHMCUF/oVPvthI
	Xor8jCY0PvqXkjaYx9tYyco=
X-Google-Smtp-Source: ABhQp+QMnmnx8t8p2bjzvE/0NO3843UPK6jBQwtjJJVYDIh4xGSqniTO8WxkIfRT3kaFWQPpdHZerA==
X-Received: by 10.55.27.136 with SMTP id m8mr4970698qkh.356.1508468306153;
	Thu, 19 Oct 2017 19:58:26 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	o70sm10118448qki.35.2017.10.19.19.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 19:58:25 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171019163546.2039-1-clg@kaod.org>
	<20171019163546.2039-8-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <218244ab-1bc6-6a21-f762-1ddd9ef79011@amsat.org>
Date: Thu, 19 Oct 2017 23:58:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171019163546.2039-8-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v6 7/8] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: soFV3aVgtDAb

Hi Cédric,

On 10/19/2017 01:35 PM, Cédric Le Goater wrote:
> Specs are available here :
> 
>     https://www.nxp.com/docs/en/application-note/AN264.pdf
> 
> This is a simple model supporting the basic registers for led and GPIO
> mode. The device also supports two blinking rates but not the model
> yet.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> 
>  Changes since v3:
> 
>  - introduced auto-increment support
>  - removed the buffer collecting bytes on the bus
>  - improved reset
>  - used extract32
>  - added a unit test
> 
>  Changes since v2:
> 
>  - removed comments on the I2C buffer size, but kept the array. I did
>    not want to rewrite the buffer handling
> 
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/pca9552.c               | 259 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/pca9552.h       |  33 +++++

If you mind using scripts/git.orderfile the review'd get easier :)

>  tests/Makefile.include          |   2 +
>  tests/pca9552-test.c            | 131 ++++++++++++++++++++
>  6 files changed, 427 insertions(+)
>  create mode 100644 hw/misc/pca9552.c
>  create mode 100644 include/hw/misc/pca9552.h
>  create mode 100644 tests/pca9552-test.c
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 5059d134c816..d868d1095a6c 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -16,6 +16,7 @@ CONFIG_TSC2005=y
>  CONFIG_LM832X=y
>  CONFIG_TMP105=y
>  CONFIG_TMP421=y
> +CONFIG_PCA9552=y
>  CONFIG_STELLARIS=y
>  CONFIG_STELLARIS_INPUT=y
>  CONFIG_STELLARIS_ENET=y
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index e8f0a02f35af..e4e22880dbbc 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -7,6 +7,7 @@ common-obj-$(CONFIG_SGA) += sga.o
>  common-obj-$(CONFIG_ISA_TESTDEV) += pc-testdev.o
>  common-obj-$(CONFIG_PCI_TESTDEV) += pci-testdev.o
>  common-obj-$(CONFIG_EDU) += edu.o
> +common-obj-$(CONFIG_PCA9552) += pca9552.o
>  
>  common-obj-y += unimp.o
>  
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> new file mode 100644
> index 000000000000..70ce6f038da2
> --- /dev/null
> +++ b/hw/misc/pca9552.c
> @@ -0,0 +1,259 @@
> +/*
> + * PCA9552 I2C LED blinker
> + *
> + *     https://www.nxp.com/docs/en/application-note/AN264.pdf
> + *
> + * Copyright (c) 2017, IBM Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later. See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/hw.h"
> +#include "hw/misc/pca9552.h"
> +
> +/*
> + * Bits [0:3] are used to address a specific register.
> + */
> +#define PCA9552_INPUT0   0 /* read only input register 0 */
> +#define PCA9552_INPUT1   1 /* read only input register 1  */
> +#define PCA9552_PSC0     2 /* read/write frequency prescaler 0 */
> +#define PCA9552_PWM0     3 /* read/write PWM register 0 */
> +#define PCA9552_PSC1     4 /* read/write frequency prescaler 1 */
> +#define PCA9552_PWM1     5 /* read/write PWM register 1 */
> +#define PCA9552_LS0      6 /* read/write LED0 to LED3 selector */
> +#define PCA9552_LS1      7 /* read/write LED4 to LED7 selector */
> +#define PCA9552_LS2      8 /* read/write LED8 to LED11 selector */
> +#define PCA9552_LS3      9 /* read/write LED12 to LED15 selector */

Since you use those in your test, can you move them to "hw/misc/pca9552.h"?

> +
> +/*
> + * Bit [4] is used to activate the Auto-Increment option of the
> + * register address
> + */
> +#define PCA9552_AUTOINC  (1 << 4)

ditto

> +
> +#define PCA9552_LED_ON   0x0
> +#define PCA9552_LED_OFF  0x1
> +#define PCA9552_LED_PWM0 0x2
> +#define PCA9552_LED_PWM1 0x3
> +
> +static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
> +{
> +    uint8_t reg   = PCA9552_LS0 + (pin / 4);
> +    uint8_t shift = (pin % 4) << 1;
> +
> +    return extract32(s->regs[reg], shift, 2);
> +}
> +
> +static void pca9552_update_pin_input(PCA9552State *s)
> +{
> +    int i;
> +
> +    for (i = 0; i < s->nr_leds; i++) {
> +        uint8_t input_reg = PCA9552_INPUT0 + (i / 8);
> +        uint8_t input_shift = (i % 8);
> +        uint8_t config = pca9552_pin_get_config(s, i);
> +
> +        switch (config) {
> +        case PCA9552_LED_ON:
> +            s->regs[input_reg] |= 1 << input_shift;
> +            break;
> +        case PCA9552_LED_OFF:
> +            s->regs[input_reg] &= ~(1 << input_shift);
> +            break;
> +        case PCA9552_LED_PWM0:
> +        case PCA9552_LED_PWM1:
> +            /* TODO */
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
> +{
> +    switch (reg) {
> +    case PCA9552_INPUT0:
> +    case PCA9552_INPUT1:
> +    case PCA9552_PSC0:
> +    case PCA9552_PWM0:
> +    case PCA9552_PSC1:
> +    case PCA9552_PWM1:
> +    case PCA9552_LS0:
> +    case PCA9552_LS1:
> +    case PCA9552_LS2:
> +    case PCA9552_LS3:
> +        return s->regs[reg];
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected read to register %d\n",
> +                      __func__, reg);
> +        return 0xFF;
> +    }
> +}
> +
> +static void pca9552_write(PCA9552State *s, uint8_t reg, uint8_t data)
> +{
> +    switch (reg) {
> +    case PCA9552_PSC0:
> +    case PCA9552_PWM0:
> +    case PCA9552_PSC1:
> +    case PCA9552_PWM1:
> +        s->regs[reg] = data;
> +        break;
> +
> +    case PCA9552_LS0:
> +    case PCA9552_LS1:
> +    case PCA9552_LS2:
> +    case PCA9552_LS3:
> +        s->regs[reg] = data;
> +        pca9552_update_pin_input(s);
> +        break;
> +
> +    case PCA9552_INPUT0:
> +    case PCA9552_INPUT1:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected write to register %d\n",
> +                      __func__, reg);
> +    }
> +}
> +
> +/*
> + * When Auto-Increment is on, the register address is incremented
> + * after each byte is sent to or received by the device. The index
> + * rollovers to 0 when the maximum register address is reached.
> + */
> +static void pca9552_autoinc(PCA9552State *s)
> +{
> +    if (s->pointer != 0xFF && s->pointer & PCA9552_AUTOINC) {
> +        uint8_t reg = s->pointer & 0xf;
> +
> +        reg = (reg + 1) % (s->max_reg + 1);
> +        s->pointer = reg | PCA9552_AUTOINC;
> +    }
> +}
> +
> +static int pca9552_recv(I2CSlave *i2c)
> +{
> +    PCA9552State *s = PCA9552(i2c);
> +    uint8_t ret;
> +
> +    ret = pca9552_read(s, s->pointer & 0xf);
> +
> +    /*
> +     * From the Specs:
> +     *
> +     *     Important Note: When a Read sequence is initiated and the
> +     *     AI bit is set to Logic Level 1, the Read Sequence MUST
> +     *     start by a register different from 0.
> +     *
> +     * I don't know what should be done in this case, so throw an
> +     * error.
> +     */
> +    if (s->pointer == PCA9552_AUTOINC) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Autoincrement read starting with register 0\n",
> +                      __func__);
> +    }
> +
> +    pca9552_autoinc(s);
> +
> +    return ret;
> +}
> +
> +static int pca9552_send(I2CSlave *i2c, uint8_t data)
> +{
> +    PCA9552State *s = PCA9552(i2c);
> +
> +    /* First byte sent by is the register address */
> +    if (s->len == 0) {
> +        s->pointer = data;
> +        s->len++;
> +    } else {
> +        pca9552_write(s, s->pointer & 0xf, data);
> +
> +        pca9552_autoinc(s);
> +    }
> +
> +    return 0;
> +}
> +
> +static int pca9552_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    PCA9552State *s = PCA9552(i2c);
> +
> +    s->len = 0;
> +    return 0;
> +}
> +
> +static const VMStateDescription pca9552_vmstate = {
> +    .name = "PCA9552",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(len, PCA9552State),
> +        VMSTATE_UINT8(pointer, PCA9552State),
> +        VMSTATE_UINT8_ARRAY(regs, PCA9552State, PCA9552_NR_REGS),
> +        VMSTATE_I2C_SLAVE(i2c, PCA9552State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void pca9552_reset(DeviceState *dev)
> +{
> +    PCA9552State *s = PCA9552(dev);
> +
> +    s->regs[PCA9552_PSC0] = 0xFF;
> +    s->regs[PCA9552_PWM0] = 0x80;
> +    s->regs[PCA9552_PSC1] = 0xFF;
> +    s->regs[PCA9552_PWM1] = 0x80;
> +    s->regs[PCA9552_LS0] = 0x55; /* all OFF */
> +    s->regs[PCA9552_LS1] = 0x55;
> +    s->regs[PCA9552_LS2] = 0x55;
> +    s->regs[PCA9552_LS3] = 0x55;
> +
> +    pca9552_update_pin_input(s);
> +
> +    s->pointer = 0xFF;
> +    s->len = 0;
> +}
> +
> +static void pca9552_initfn(Object *obj)
> +{
> +    PCA9552State *s = PCA9552(obj);
> +
> +    /* If support for the other PCA955X devices are implemented, these
> +     * constant values might be part of class structure describing the
> +     * PCA955X device
> +     */
> +    s->max_reg = PCA9552_LS3;

Looks a bit weird, why not use PCA9552_NR_REGS here so pca9552_autoinc()
becomes simply:

    reg += 1;
    reg %= s->max_reg;

?

> +    s->nr_leds = 16;
> +}
> +
> +static void pca9552_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->event = pca9552_event;
> +    k->recv = pca9552_recv;
> +    k->send = pca9552_send;
> +    dc->reset = pca9552_reset;
> +    dc->vmsd = &pca9552_vmstate;
> +}
> +
> +static const TypeInfo pca9552_info = {
> +    .name          = TYPE_PCA9552,
> +    .parent        = TYPE_I2C_SLAVE,
> +    .instance_init = pca9552_initfn,
> +    .instance_size = sizeof(PCA9552State),
> +    .class_init    = pca9552_class_init,
> +};
> +
> +static void pca9552_register_types(void)
> +{
> +    type_register_static(&pca9552_info);
> +}
> +
> +type_init(pca9552_register_types)
> diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> new file mode 100644
> index 000000000000..5df8d6407ca7
> --- /dev/null
> +++ b/include/hw/misc/pca9552.h
> @@ -0,0 +1,33 @@
> +/*
> + * PCA9552 I2C LED blinker
> + *
> + * Copyright (c) 2017, IBM Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later. See the COPYING file in the top-level directory.
> + */
> +#ifndef PCA9552_H
> +#define PCA9552_H
> +
> +#include "hw/i2c/i2c.h"
> +
> +#define TYPE_PCA9552 "pca9552"
> +#define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
> +
> +
> +#define PCA9552_NR_REGS 10

This could be an enum (or not, matter of taste).

> +
> +typedef struct PCA9552State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +    /*< public >*/
> +
> +    uint8_t len;
> +    uint8_t pointer;
> +
> +    uint8_t regs[PCA9552_NR_REGS];
> +    uint8_t max_reg;
> +    uint8_t nr_leds;
> +} PCA9552State;
> +
> +#endif
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 4ca15e681703..8ac2595c8512 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -347,6 +347,7 @@ check-qtest-sparc64-y = tests/endianness-test$(EXESUF)
>  check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
>  
>  check-qtest-arm-y = tests/tmp105-test$(EXESUF)
> +check-qtest-arm-y += tests/pca9552-test$(EXESUF)
>  check-qtest-arm-y += tests/ds1338-test$(EXESUF)
>  check-qtest-arm-y += tests/m25p80-test$(EXESUF)
>  gcov-files-arm-y += hw/misc/tmp105.c
> @@ -739,6 +740,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
>  	tests/boot-sector.o tests/acpi-utils.o $(libqos-obj-y)
>  tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-obj-y)
>  tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
> +tests/pca9552-test$(EXESUF): tests/pca9552-test.o $(libqos-omap-obj-y)
>  tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
>  tests/m25p80-test$(EXESUF): tests/m25p80-test.o
>  tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
> diff --git a/tests/pca9552-test.c b/tests/pca9552-test.c
> new file mode 100644
> index 000000000000..53414452a12e
> --- /dev/null
> +++ b/tests/pca9552-test.c
> @@ -0,0 +1,131 @@
> +/*
> + * QTest testcase for the PCA9552 LED blinker
> + *
> + * Copyright (c) 2017, IBM Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +

#include "hw/misc/pca9552.h"

> +#include "libqtest.h"
> +#include "libqos/i2c.h"
> +
> +#define PCA9552_INPUT0   0 /* read only input register 0 */
> +#define PCA9552_INPUT1   1 /* read only input register 1  */
> +#define PCA9552_PSC0     2 /* read/write frequency prescaler 0 */
> +#define PCA9552_PWM0     3 /* read/write PWM register 0 */
> +#define PCA9552_PSC1     4 /* read/write frequency prescaler 1 */
> +#define PCA9552_PWM1     5 /* read/write PWM register 1 */
> +#define PCA9552_LS0      6 /* read/write LED0 to LED3 selector */
> +#define PCA9552_LS1      7 /* read/write LED4 to LED7 selector */
> +#define PCA9552_LS2      8 /* read/write LED8 to LED11 selector */
> +#define PCA9552_LS3      9 /* read/write LED12 to LED15 selector */
> +
> +#define PCA9552_AUTOINC  (1 << 4)
> +
> +
> +#define OMAP2_I2C_1_BASE 0x48070000

Can you define that in "hw/arm/omap.h" ?

> +
> +#define PCA9552_TEST_ID   "pca9552-test"
> +#define PCA9552_TEST_ADDR 0x60
> +
> +static I2CAdapter *i2c;
> +
> +static uint8_t pca9552_get8(I2CAdapter *i2c, uint8_t addr, uint8_t reg)
> +{
> +    uint8_t resp[1];
> +    i2c_send(i2c, addr, &reg, 1);
> +    i2c_recv(i2c, addr, resp, 1);
> +    return resp[0];
> +}
> +
> +static void pca9552_set8(I2CAdapter *i2c, uint8_t addr, uint8_t reg,
> +                         uint8_t value)
> +{
> +    uint8_t cmd[2];
> +    uint8_t resp[1];
> +
> +    cmd[0] = reg;
> +    cmd[1] = value;
> +    i2c_send(i2c, addr, cmd, 2);
> +    i2c_recv(i2c, addr, resp, 1);
> +    g_assert_cmphex(resp[0], ==, cmd[1]);
> +}
> +
> +static void receive_autoinc(void)
> +{
> +    uint8_t resp;
> +    uint8_t reg = PCA9552_LS0 | PCA9552_AUTOINC;
> +
> +    i2c_send(i2c, PCA9552_TEST_ADDR, &reg, 1);
> +
> +    /* PCA9552_LS0 */
> +    i2c_recv(i2c, PCA9552_TEST_ADDR, &resp, 1);
> +    g_assert_cmphex(resp, ==, 0x54);
> +
> +    /* PCA9552_LS1 */
> +    i2c_recv(i2c, PCA9552_TEST_ADDR, &resp, 1);
> +    g_assert_cmphex(resp, ==, 0x55);
> +
> +    /* PCA9552_LS2 */
> +    i2c_recv(i2c, PCA9552_TEST_ADDR, &resp, 1);
> +    g_assert_cmphex(resp, ==, 0x55);
> +
> +    /* PCA9552_LS3 */
> +    i2c_recv(i2c, PCA9552_TEST_ADDR, &resp, 1);
> +    g_assert_cmphex(resp, ==, 0x54);
> +}
> +
> +static void send_and_receive(void)
> +{
> +    uint8_t value;
> +
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_LS0);
> +    g_assert_cmphex(value, ==, 0x55);
> +
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_INPUT0);
> +    g_assert_cmphex(value, ==, 0x0);
> +
> +    /* Switch on LED 0 */
> +    pca9552_set8(i2c, PCA9552_TEST_ADDR, PCA9552_LS0, 0x54);
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_LS0);
> +    g_assert_cmphex(value, ==, 0x54);
> +
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_INPUT0);
> +    g_assert_cmphex(value, ==, 0x01);
> +
> +    /* Switch on LED 12 */
> +    pca9552_set8(i2c, PCA9552_TEST_ADDR, PCA9552_LS3, 0x54);
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_LS3);
> +    g_assert_cmphex(value, ==, 0x54);
> +
> +    value = pca9552_get8(i2c, PCA9552_TEST_ADDR, PCA9552_INPUT1);
> +    g_assert_cmphex(value, ==, 0x10);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s = NULL;
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_start("-machine n800 "
> +                    "-device pca9552,bus=i2c-bus.0,id=" PCA9552_TEST_ID
> +                    ",address=0x60");
> +    i2c = omap_i2c_create(OMAP2_I2C_1_BASE);
> +
> +    qtest_add_func("/pca9552/tx-rx", send_and_receive);
> +    qtest_add_func("/pca9552/rx-autoinc", receive_autoinc);
> +
> +    ret = g_test_run();
> +
> +    if (s) {
> +        qtest_quit(s);
> +    }
> +    g_free(i2c);
> +
> +    return ret;
> +}
> 

If Peter accept to queue 1-6, I'd appreciate if you can address my few
suggestions then resend 7-8; else if you don't have time:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
