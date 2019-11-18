Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2639140lfq;
        Mon, 18 Nov 2019 02:00:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaPp7Gom3WVbEz4yELALNvCEfpfTqzMiIlDgMOsucN6lga6aDyJ1SBVJQhrpH2THWi62tX
X-Received: by 2002:a17:906:69cb:: with SMTP id g11mr25283144ejs.328.1574071243743;
        Mon, 18 Nov 2019 02:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574071243; cv=none;
        d=google.com; s=arc-20160816;
        b=pXqmX8c9UDaR4hG90Na0rAaY52yhGhkkjuyrsvP6t41K30Q8Ji7Fg93U7SSR16nTel
         Vhkeh0mb6ZdvffMXOrm9D9RF/vG7UkSf417PdUed36VJduuiqdr/auFWlZ3Mi7iGEV3y
         k4yqb5oPzcFSbBpdAb3CBYXA8RZy+NnbDRXKFpY76gS8/JT8k5C1Q5qGPpccMwM2tUuj
         OvCSJg3EzrCe3cvF37ndU3LspnPlgHYhgKSyoznhwcrNXyPMcvmNvE+lEnV6LD86VBA+
         42OohDKVr2v+Y8JjxZ0Wwq3mP+riFIAKu5sHSmkCEZjeyJcgxR8+U/We8ogpG7BUGllG
         +Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=3MEZE2eqlr9YgeRNB9PbgULCKy1g57IB8IDxGW6MLQ4=;
        b=UwqxU4sfq4QQjx45OpLMk5Y/+/6OFw1gZGnhK1gCM4ZHreE+iAQ5EgJdvYTZ8YvzD4
         2aInBh6tjJ+n4uis7cRP/9ANNczYJXzXraHigcp6HwO3uJZH9DuKxU8/9LlE1imPcjsy
         A6FCav9iMxA98BnhEkI+FSFTNnrcBFKumDHehtHem3iOifsiSEkPAy+u53rIJfVRT4LI
         ggv6rohIPf9G/5Dfd9YuF5BIdi3W3A8oa+fN6Y0e4erxVlKsln73JQe4aJB1Qjfj7yzP
         g0BAIOdm9Oitstjcs4r15hGXcpwdnKeoJSte1uUdr/U6cGMef9qjhm3GYLd/NONxbWvJ
         LUww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si10854176ejr.327.2019.11.18.02.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 02:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWdpq-0005iD-Io
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 05:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWdpc-0005hs-TI
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 05:00:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWdpb-0004oV-5u
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 05:00:28 -0500
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:49404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWdpa-0004nE-TW
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 05:00:27 -0500
Received: from player793.ha.ovh.net (unknown [10.108.54.9])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C97541AFA6F
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 11:00:23 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id 3FEC9C32F05A;
 Mon, 18 Nov 2019 10:00:15 +0000 (UTC)
Subject: Re: [PATCH] misc/pca9552: Add qom set and get
To: Joel Stanley <joel@jms.id.au>
References: <20191118061757.52550-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <42f378d5-e7ea-11ce-11d5-9589fe7194d2@kaod.org>
Date: Mon, 18 Nov 2019 11:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118061757.52550-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7761672485206723345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeghedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludejmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehophgvnhhpohifvghrrdighiiipdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.53.149
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Rashmica Gupta <rashmica.g@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sgiLJChYZXwX

On 18/11/2019 07:17, Joel Stanley wrote:
> Following the pattern of the work recently done with the ASPEED GPIO
> model, this adds support for inspecting and modifying the PCA9552 LEDs
> from the monitor.
> 
>  (qemu) qom-set  /machine/unattached/device[17] led0 on
>  (qemu) qom-get  /machine/unattached/device[17] led0
>  "on"
> 
>  (qemu) qom-set  /machine/unattached/device[17] led0 off
>  (qemu) qom-get  /machine/unattached/device[17] led0
>  "off"
> 
>  (qemu) qom-set  /machine/unattached/device[17] led0 pwm0
>  (qemu) qom-get  /machine/unattached/device[17] led0
>  "pwm0"
> 
>  (qemu) qom-set  /machine/unattached/device[17] led0 pwm1
>  (qemu) qom-get  /machine/unattached/device[17] led0
>  "pwm1"

It would be nice to revive the QOM get patchset from David. 

	http://patchwork.ozlabs.org/patch/666458/

Did we reach some consensus ? 

> Signed-off-by: Joel Stanley <joel@jms.id.au>

Some comments below.

> ---
> The qom device in mainline qemu is a different path. Using the monitor
> examine `info qom-tree /machine/unattached/` to discover it.
> 
> This can be tested with a Witherspoon image.
> 
> $ wget https://openpower.xyz/job/openbmc-build/distro=ubuntu,label=builder,target=witherspoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/obmc-phosphor-image-witherspoon.ubi.mtd
> 
> $ qemu-system-arm -M witherspoon-bmc -serial pty -monitor pty -nographic \
>  -drive file=obmc-phosphor-image-witherspoon.ubi.mtd,format=raw,if=mtd
> char device redirected to /dev/pts/5 (label compat_monitor0)
> char device redirected to /dev/pts/10 (label serial0)
> 
> $ screen /dev/pts/5
> QEMU 4.1.91 monitor - type 'help' for more information
> (qemu) qom-get  /machine/unattached/device[17] led0
> "off"
> 
> $ screen /dev/pts/19
> root@witherspoon:~# cd /sys/class/gpio/
> root@witherspoon:/sys/class/gpio# echo 248 > export
> root@witherspoon:/sys/class/gpio# cat gpio248/value
> 0
> 
> (qemu) qom-set  /machine/unattached/device[17] led0 on
> 
> root@witherspoon:/sys/class/gpio# echo out > gpio248/direction
> root@witherspoon:/sys/class/gpio# cat gpio248/value
> 1
> 
> (qemu) qom-get  /machine/unattached/device[17] led0
> "on"
> 
> (qemu) qom-set  /machine/unattached/device[17] led0 off
> (qemu) qom-get  /machine/unattached/device[17] led0
> "off"
> 
> root@witherspoon:/sys/class/gpio# cat gpio248/value
> 0
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/pca9552.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index 73be28d9369c..0362aac8c862 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -15,12 +15,16 @@
>  #include "hw/misc/pca9552.h"
>  #include "hw/misc/pca9552_regs.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
>  
>  #define PCA9552_LED_ON   0x0
>  #define PCA9552_LED_OFF  0x1
>  #define PCA9552_LED_PWM0 0x2
>  #define PCA9552_LED_PWM1 0x3
>  
> +static const char *led_state[] = {"on", "off", "pwm0", "pwm1"};
> +
>  static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
>  {
>      uint8_t reg   = PCA9552_LS0 + (pin / 4);
> @@ -169,6 +173,84 @@ static int pca9552_event(I2CSlave *i2c, enum i2c_event event)
>      return 0;
>  }
>  
> +static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    PCA9552State *s = PCA9552(obj);
> +    int led, rc, reg;
> +    char *str;
> +    uint8_t state;
> +
> +    rc = sscanf(name, "led%2d", &led);
> +    if (rc != 1) {
> +        error_setg(errp, "%s: error reading %s", __func__, name);
> +        return;
> +    }
> +    if (led < 0 || led > s->nr_leds) {
> +        error_setg(errp, "%s invalid led %s", __func__, name);
> +        return;
> +    }
> +    /*
> +     * Get the LSx register as the qom interface should expose the device
> +     * state, not the modeled 'input line' behaviour which would come from
> +     * reading the INPUTx reg
> +     */
> +    reg = PCA9552_LS0 + led / 4;
> +    state = (pca9552_read(s, reg) >> (led % 8)) & 0x3;

Could we add accessors to extract the register fields and to clarify 
the layout ? 

> +    str = g_strdup(led_state[state]);
> +    visit_type_str(v, name, &str, errp);
> +}
> +
> +/*
> + * Return an LED selector register value based on an existing one, with
> + * the appropriate 2-bit state value set for the given LED number (0-3).
> + */
> +static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int state)
> +{
> +        return (oldval & (~(0x3 << (led_num << 1)))) |
> +                ((state & 0x3) << (led_num << 1));
> +}
> +
> +static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    PCA9552State *s = PCA9552(obj);
> +    Error *local_err = NULL;
> +    int led, rc, reg, val;
> +    uint8_t state;
> +    char *state_str;
> +
> +    visit_type_str(v, name, &state_str, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    rc = sscanf(name, "led%2d", &led);
> +    if (rc != 1) {
> +        error_setg(errp, "%s: error reading %s", __func__, name);
> +        return;
> +    }
> +    if (led < 0 || led > s->nr_leds) {
> +        error_setg(errp, "%s invalid led %s", __func__, name);
> +        return;
> +    }
> +
> +    for (state = 0; state < ARRAY_SIZE(led_state); state++) {
> +        if (!strcmp(state_str, led_state[state])) {
> +            break;
> +        }
> +    }
> +    if (state >= ARRAY_SIZE(led_state)) {
> +        error_setg(errp, "%s invalid led state %s", __func__, state_str);
> +        return;
> +    }
> +
> +    reg = PCA9552_LS0 + led / 4;
> +    val = pca9552_read(s, reg);
> +    val = pca955x_ledsel(val, led % 4, state);
> +    pca9552_write(s, reg, val);
> +}
> +
>  static const VMStateDescription pca9552_vmstate = {
>      .name = "PCA9552",
>      .version_id = 0,
> @@ -204,6 +286,7 @@ static void pca9552_reset(DeviceState *dev)
>  static void pca9552_initfn(Object *obj)
>  {
>      PCA9552State *s = PCA9552(obj);
> +    int led;
>  
>      /* If support for the other PCA955X devices are implemented, these
>       * constant values might be part of class structure describing the
> @@ -211,6 +294,14 @@ static void pca9552_initfn(Object *obj)
>       */
>      s->max_reg = PCA9552_LS3;
>      s->nr_leds = 16;
> +
> +    for (led = 0; led < s->nr_leds; led++) {
> +        char *name;
> +
> +        name = g_strdup_printf("led%d", led);
> +        object_property_add(obj, name, "bool", pca9552_get_led, pca9552_set_led,
> +                            NULL, NULL, NULL);

It misses a :

   g_free(name)

C.

> +    }
>  }
>  
>  static void pca9552_class_init(ObjectClass *klass, void *data)
> 

