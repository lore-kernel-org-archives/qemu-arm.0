Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp367731lfi;
        Mon, 18 Nov 2019 09:49:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1aM3/h0PJ4n8khZAGzkrIoqUoDEtEuTr3W/CRtMNlx84LcaHsvtYKhupDr/uYiAxIr8Bs
X-Received: by 2002:a05:620a:1505:: with SMTP id i5mr25948679qkk.64.1574099355100;
        Mon, 18 Nov 2019 09:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574099355; cv=none;
        d=google.com; s=arc-20160816;
        b=npYvYuEeYfc9qYdekcY8BH0Q/xYF/8OE2tzC2oDLZcZz6Sm6PyQbbnGAJk/Pb/LHuW
         TnJKdB1Em52wJLWn3ARmIaG+hauw72VN6Pck9VwbLNM1sohFLMBqQSCjwyxQ8fB3naGs
         B5z51QVHM5UvfuWiXPymUapeJo1hE/zYJeQE7xcPNllF+UtrVGpuuhnRHRZPQBdhf+YJ
         ktGn5iqMdFkwRsKz31HuMpyAIgYCaeAuL/Cxlg4UZQJXfOtCenbQJm9scYhfcYMmRdfZ
         R9ZLCukmJZ5nVqRazCgJGD8BD9i16kiOsNP368FhMZftH/lGkkaegRHp/6Of4qB1LsiZ
         RVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8uiU4rq86oXPePs9s+kNA7up4twD58636FSWZMd0zag=;
        b=ZAyu/DV72DEB5i+3gRkH1KvnF+X/SSRAscRSGbhso+GVOzdvFeH5ezBhG724IHsV20
         saZ0ICs3tWWSqzSEEIcTwTv2LhI/WQqbLqPAMPKLEUf/7Loghs25hLLqaZH3ZDfw8Pjy
         szGNaVQO8Mt7XFshLx3JMbxje2oTdcMJzWVZiLCqDDAtUDbLHxU9BHxn1qCqXOQLpHqz
         WAilzwxN62Mun6Op2gFho2ZREd4Ng8lNtuLb3eOCJ6iTS8TxvXIO6BhcaQ3FfzhDu1pl
         xwXoNLKioNYt6OqNraN/xuOfW30kbLADlbruVUaM6H4A9GeRJWaj62Mt3cb3BAxVAY0n
         4KEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=INCkcSxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x126si7185690qke.103.2019.11.18.09.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 09:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=INCkcSxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWl9G-00080e-Gp
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 12:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWl97-0007xy-SV
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 12:49:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWl95-0003xO-CT
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 12:49:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32813
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWl95-0003xB-8d
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 12:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574099342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uiU4rq86oXPePs9s+kNA7up4twD58636FSWZMd0zag=;
 b=INCkcSxs9ibPoRidBx4hxYpsY9k5yt8IUU2zDfD20dvmoBuAjq4uVR987TSEajRA0U1Jkj
 HVOkACBB2fnOpsmUmb3wirLQpWO8FwAYIAmP/jMHnoeqdNhB9zD8RXcY6pP9gEqzHn0mS8
 3lnh5Pm4beCMcaw0P70/mT+txQLR1kA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ky6Hp8VbMDylCHA2sfZtNw-1; Mon, 18 Nov 2019 12:49:00 -0500
Received: by mail-wm1-f72.google.com with SMTP id f11so114345wmc.8
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 09:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nmpz5zZisvgmpXO3F5mGN69D+5HVCgoutUU6rqLL/Wo=;
 b=JEApWTJmgSiA94Ox2gX+gksPgxqDqY3MIa4VBWnRgftZBRnoXOF04QhHORj+PZBsN0
 4dhKojnov2s7gWPH0TsboWw92Ow8HDaEpgh3NHAWUEA2SNzqjps38kog0RdGSWYHvUec
 /bT/hiEPfKws2QLLHa1ZhcS8uvp1TLEvqe+nvAQP0VmMAiSVwT9dGKQDgJgIn/nETd6V
 70jXfPsH+bJDG0LfJ+6zbwvF5jJBeYNaBEZ41nHryDFF6H1ZdkQXDH2Ep/ofTACFu9Gx
 KGX1zfHeHoBVK+VdKTfWicmPed0PtEdng/xk4NX45O1jvGAhbY0V5HFWHTinW1WDmJrr
 sirA==
X-Gm-Message-State: APjAAAVj0jg38VkNzJzchBhCQje2a31/RSzl9cTP6bJrlq9hcylikuq+
 aWbNkSEKbSdkk5GZpDmHsEPK23V/ZaaRMX9I5on7cX6ryaiGv15R6+qz3euZgx1cpLU4rmBv1IR
 tmm+S4dbLSqru
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr30915065wrn.393.1574099338749; 
 Mon, 18 Nov 2019 09:48:58 -0800 (PST)
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr30915019wrn.393.1574099338344; 
 Mon, 18 Nov 2019 09:48:58 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id f14sm23625258wrv.17.2019.11.18.09.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 09:48:57 -0800 (PST)
Subject: Re: [PATCH] misc/pca9552: Add qom set and get
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20191118061757.52550-1-joel@jms.id.au>
 <42f378d5-e7ea-11ce-11d5-9589fe7194d2@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f810374-97d4-8162-c92d-a1513c1a23a0@redhat.com>
Date: Mon, 18 Nov 2019 18:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <42f378d5-e7ea-11ce-11d5-9589fe7194d2@kaod.org>
Content-Language: en-US
X-MC-Unique: ky6Hp8VbMDylCHA2sfZtNw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmM4SpEowTcj

Odd... I only received C=C3=A9dric answer, not Joel patch.

On 11/18/19 11:00 AM, C=C3=A9dric Le Goater wrote:
> On 18/11/2019 07:17, Joel Stanley wrote:
>> Following the pattern of the work recently done with the ASPEED GPIO
>> model, this adds support for inspecting and modifying the PCA9552 LEDs
>> from the monitor.
>>
>>   (qemu) qom-set  /machine/unattached/device[17] led0 on
>>   (qemu) qom-get  /machine/unattached/device[17] led0
>>   "on"
>>
>>   (qemu) qom-set  /machine/unattached/device[17] led0 off
>>   (qemu) qom-get  /machine/unattached/device[17] led0
>>   "off"
>>
>>   (qemu) qom-set  /machine/unattached/device[17] led0 pwm0
>>   (qemu) qom-get  /machine/unattached/device[17] led0
>>   "pwm0"
>>
>>   (qemu) qom-set  /machine/unattached/device[17] led0 pwm1
>>   (qemu) qom-get  /machine/unattached/device[17] led0
>>   "pwm1"
>=20
> It would be nice to revive the QOM get patchset from David.
>=20
> =09http://patchwork.ozlabs.org/patch/666458/
>=20
> Did we reach some consensus ?
>=20
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>=20
> Some comments below.
>=20
>> ---
>> The qom device in mainline qemu is a different path. Using the monitor
>> examine `info qom-tree /machine/unattached/` to discover it.
>>
>> This can be tested with a Witherspoon image.
>>
>> $ wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3Db=
uilder,target=3Dwitherspoon/lastSuccessfulBuild/artifact/deploy/images/with=
erspoon/obmc-phosphor-image-witherspoon.ubi.mtd
>>
>> $ qemu-system-arm -M witherspoon-bmc -serial pty -monitor pty -nographic=
 \
>>   -drive file=3Dobmc-phosphor-image-witherspoon.ubi.mtd,format=3Draw,if=
=3Dmtd
>> char device redirected to /dev/pts/5 (label compat_monitor0)
>> char device redirected to /dev/pts/10 (label serial0)
>>
>> $ screen /dev/pts/5
>> QEMU 4.1.91 monitor - type 'help' for more information
>> (qemu) qom-get  /machine/unattached/device[17] led0
>> "off"
>>
>> $ screen /dev/pts/19
>> root@witherspoon:~# cd /sys/class/gpio/
>> root@witherspoon:/sys/class/gpio# echo 248 > export
>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>> 0
>>
>> (qemu) qom-set  /machine/unattached/device[17] led0 on
>>
>> root@witherspoon:/sys/class/gpio# echo out > gpio248/direction
>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>> 1
>>
>> (qemu) qom-get  /machine/unattached/device[17] led0
>> "on"
>>
>> (qemu) qom-set  /machine/unattached/device[17] led0 off
>> (qemu) qom-get  /machine/unattached/device[17] led0
>> "off"
>>
>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>> 0

I am assuming this is 5.0 material.

This is a good starting point, and is useful.

However this would be useful for other boards/devices too.

What about defining a InterfaceInfo[] for external GPIOs?

Shouldn't we use the qemu_irq type for that then?

>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>   hw/misc/pca9552.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 91 insertions(+)
>>
>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>> index 73be28d9369c..0362aac8c862 100644
>> --- a/hw/misc/pca9552.c
>> +++ b/hw/misc/pca9552.c
>> @@ -15,12 +15,16 @@
>>   #include "hw/misc/pca9552.h"
>>   #include "hw/misc/pca9552_regs.h"
>>   #include "migration/vmstate.h"
>> +#include "qapi/error.h"
>> +#include "qapi/visitor.h"
>>  =20
>>   #define PCA9552_LED_ON   0x0
>>   #define PCA9552_LED_OFF  0x1
>>   #define PCA9552_LED_PWM0 0x2
>>   #define PCA9552_LED_PWM1 0x3
>>  =20
>> +static const char *led_state[] =3D {"on", "off", "pwm0", "pwm1"};

BTW "pwm0/pwm1" as "state" is confuse, but I understand this is how the=20
PCA9552 datasheet describes it.

>> +
>>   static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
>>   {
>>       uint8_t reg   =3D PCA9552_LS0 + (pin / 4);
>> @@ -169,6 +173,84 @@ static int pca9552_event(I2CSlave *i2c, enum i2c_ev=
ent event)
>>       return 0;
>>   }
>>  =20
>> +static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
>> +                            void *opaque, Error **errp)
>> +{
>> +    PCA9552State *s =3D PCA9552(obj);
>> +    int led, rc, reg;
>> +    char *str;
>> +    uint8_t state;
>> +
>> +    rc =3D sscanf(name, "led%2d", &led);
>> +    if (rc !=3D 1) {
>> +        error_setg(errp, "%s: error reading %s", __func__, name);
>> +        return;
>> +    }
>> +    if (led < 0 || led > s->nr_leds) {
>> +        error_setg(errp, "%s invalid led %s", __func__, name);
>> +        return;
>> +    }
>> +    /*
>> +     * Get the LSx register as the qom interface should expose the devi=
ce
>> +     * state, not the modeled 'input line' behaviour which would come f=
rom
>> +     * reading the INPUTx reg
>> +     */
>> +    reg =3D PCA9552_LS0 + led / 4;
>> +    state =3D (pca9552_read(s, reg) >> (led % 8)) & 0x3;
>=20
> Could we add accessors to extract the register fields and to clarify
> the layout ?
>=20
>> +    str =3D g_strdup(led_state[state]);
>> +    visit_type_str(v, name, &str, errp);
>> +}
>> +
>> +/*
>> + * Return an LED selector register value based on an existing one, with
>> + * the appropriate 2-bit state value set for the given LED number (0-3)=
.
>> + */
>> +static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int s=
tate)
>> +{
>> +        return (oldval & (~(0x3 << (led_num << 1)))) |
>> +                ((state & 0x3) << (led_num << 1));
>> +}
>> +
>> +static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
>> +                            void *opaque, Error **errp)
>> +{
>> +    PCA9552State *s =3D PCA9552(obj);
>> +    Error *local_err =3D NULL;
>> +    int led, rc, reg, val;
>> +    uint8_t state;
>> +    char *state_str;
>> +
>> +    visit_type_str(v, name, &state_str, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +    rc =3D sscanf(name, "led%2d", &led);
>> +    if (rc !=3D 1) {
>> +        error_setg(errp, "%s: error reading %s", __func__, name);
>> +        return;
>> +    }
>> +    if (led < 0 || led > s->nr_leds) {
>> +        error_setg(errp, "%s invalid led %s", __func__, name);
>> +        return;
>> +    }
>> +
>> +    for (state =3D 0; state < ARRAY_SIZE(led_state); state++) {
>> +        if (!strcmp(state_str, led_state[state])) {
>> +            break;
>> +        }
>> +    }
>> +    if (state >=3D ARRAY_SIZE(led_state)) {
>> +        error_setg(errp, "%s invalid led state %s", __func__, state_str=
);
>> +        return;
>> +    }
>> +
>> +    reg =3D PCA9552_LS0 + led / 4;
>> +    val =3D pca9552_read(s, reg);
>> +    val =3D pca955x_ledsel(val, led % 4, state);
>> +    pca9552_write(s, reg, val);
>> +}
>> +
>>   static const VMStateDescription pca9552_vmstate =3D {
>>       .name =3D "PCA9552",
>>       .version_id =3D 0,
>> @@ -204,6 +286,7 @@ static void pca9552_reset(DeviceState *dev)
>>   static void pca9552_initfn(Object *obj)
>>   {
>>       PCA9552State *s =3D PCA9552(obj);
>> +    int led;
>>  =20
>>       /* If support for the other PCA955X devices are implemented, these
>>        * constant values might be part of class structure describing the
>> @@ -211,6 +294,14 @@ static void pca9552_initfn(Object *obj)
>>        */
>>       s->max_reg =3D PCA9552_LS3;
>>       s->nr_leds =3D 16;
>> +
>> +    for (led =3D 0; led < s->nr_leds; led++) {
>> +        char *name;
>> +
>> +        name =3D g_strdup_printf("led%d", led);
>> +        object_property_add(obj, name, "bool", pca9552_get_led, pca9552=
_set_led,
>> +                            NULL, NULL, NULL);
>=20
> It misses a :
>=20
>     g_free(name)
>=20
> C.
>=20
>> +    }
>>   }
>>  =20
>>   static void pca9552_class_init(ObjectClass *klass, void *data)
>>
>=20
>=20

