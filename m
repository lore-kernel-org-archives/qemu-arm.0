Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3787646lfm;
        Tue, 30 Jun 2020 02:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq7HMm2XvwmOwR7T73xmIKmMVQijxnei6ebjrj6DISZPvE/jpvNNVNL8WbIkm83+AhbzZS
X-Received: by 2002:a25:c483:: with SMTP id u125mr29555355ybf.298.1593509930782;
        Tue, 30 Jun 2020 02:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593509930; cv=none;
        d=google.com; s=arc-20160816;
        b=J+oT7uHQWTHrJm3VZaV7M1s77SG6OZT0UY90COge0PHCJ5r8nWDmOMYIgsIWVww6ZG
         x4H59rGYwYOKLzieyMOJX23e+D+rNObjCSfsg/0aUXS9R9PQ3dUcKZc8PDxVBu4NhP5P
         LT876hQIi4HHDoQeZXuQv4n5Byulzmzf33Mykg4nh8cQmx9xYOJIXIky4ECpRQ0IZP8q
         +Pwx/DH/Hpm96Re4i5PEID4969g4TDQMynSSGGlumL2ymMf0HevfHtirhEj45vHXbyrK
         pMLnV+DJxzgUsbmMdcnv3otyn2aJ225pbETybM1cq9YcUci6M+BwjpLH8aZGHL/RpRp/
         isvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=h/X4dkra4te4TNqf8Arh+j26kU0iw19IffM3irc8a3Q=;
        b=BQHss150Ceu+ahXuebRXEzkqcSKML19DU1u+a/56Ga95RvULra5NT4GvzSchLdx0+J
         Nn14e2kljhVAQdacPrRiWfYc7l4DrAgF13MTdBnF01pMa62ghBEgP4SLSkWB15b266sq
         N3R5AQP503bDfC3OqHhiS3j5qSh2bTiufFacVHlD95PDcHp2UJ91Pt4qfI+k9SnN5vIF
         TZOSrMCQEC5nS39o/bCpQL5nEcB9dbPD27bNqvyRiPr0qsbUBJrqFlRF2od7CPnKj61W
         DNUYaxk01gzflVizGl9IWJtT2cuZKH9wDu+HIaYmKyQy0HGmEPwkil15wCgrcdXilD7N
         r7kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W75LhCmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si2270326ybv.66.2020.06.30.02.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W75LhCmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCj4-00021P-5V
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCiK-0000rg-Q3
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:38:04 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37281
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCiI-0000KW-3F
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593509881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/X4dkra4te4TNqf8Arh+j26kU0iw19IffM3irc8a3Q=;
 b=W75LhCmg/IcNBPy6T8SlVcP/h83c94rEwwv24XbY4Zttgcouq7OpSuFFov66uh8GpyZPRf
 VJ2OC8J73mQrUJmoTce+ySXiQyfKDSpE971eFaTGCYEq3CM+pd9BVTW3yzq58okMZbemgd
 whmfHU8yXthuAwfuIUYkUYYoJQR+hyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-5C-LmIbuM3WTW0fhTiiRwA-1; Tue, 30 Jun 2020 05:37:51 -0400
X-MC-Unique: 5C-LmIbuM3WTW0fhTiiRwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C977BAC;
 Tue, 30 Jun 2020 09:37:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 085DA7BEDB;
 Tue, 30 Jun 2020 09:37:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 899E611384A6; Tue, 30 Jun 2020 11:37:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/5] hw/i2c: Rename i2c_try_create_slave() as
 i2c_slave_new()
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-3-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2006292333540.63145@zero.eik.bme.hu>
Date: Tue, 30 Jun 2020 11:37:46 +0200
In-Reply-To: <alpine.BSF.2.22.395.2006292333540.63145@zero.eik.bme.hu>
 (BALATON Zoltan's message of "Mon, 29 Jun 2020 23:37:05 +0200 (CEST)")
Message-ID: <87mu4khp1x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UjMRADS+ogpB

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 29 Jun 2020, Philippe Mathieu-Daud=C3=A9 wrote:
>> We use "new" names for functions that allocate and initialize
>> device objects: pci_new(), isa_new(), usb_new().
>> Let's call this one i2c_slave_new(). Since we have to update
>> all the callers, also let it return a I2CSlave object.
>
> All the callers now need a cast due to change to I2CSlave * instead of

Actually, all but one; I'll mark it inline.

> what they expect. Does that really worth it? Also this introduces
> inconsistency between i2c_create_slave and i2c_new so not sure about

For what it's worth, this inconsistency is healed in PATCH 4.

> that part but I don't really mind either way. Maybe return what most
> callers expect so the calls are simple and don't need an additional
> cast in most of the cases?

I'd prefer consistency with similar FOO_new() functions for abstract
devices plugging into a FOOBus: pci_new(), isa_new(), usb_new().

> Regards,
> BALATON Zoltan
>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> include/hw/i2c/i2c.h | 2 +-
>> hw/arm/aspeed.c      | 4 ++--
>> hw/i2c/core.c        | 9 ++++-----
>> 3 files changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
>> index d6e3d85faf..18efc668f1 100644
>> --- a/include/hw/i2c/i2c.h
>> +++ b/include/hw/i2c/i2c.h
>> @@ -79,8 +79,8 @@ int i2c_send_recv(I2CBus *bus, uint8_t *data, bool sen=
d);
>> int i2c_send(I2CBus *bus, uint8_t data);
>> uint8_t i2c_recv(I2CBus *bus);
>>
>> +I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
>> DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r);
>> -DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
>> bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
>>
>> /* lm832x.c */
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 1285bf82c0..54ca36e0b6 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -513,7 +513,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSt=
ate *bmc)
>>     /* Bus 3: TODO bmp280@77 */
>>     /* Bus 3: TODO max31785@52 */
>>     /* Bus 3: TODO dps310@76 */
>> -    dev =3D i2c_try_create_slave(TYPE_PCA9552, 0x60);
>> +    dev =3D DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>>     qdev_prop_set_string(dev, "description", "pca1");
>>     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
>>                           &error_fatal);
>> @@ -531,7 +531,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSt=
ate *bmc)
>>
>>     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
>>                           eeprom_buf);
>> -    dev =3D i2c_try_create_slave(TYPE_PCA9552, 0x60);
>> +    dev =3D DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>>     qdev_prop_set_string(dev, "description", "pca0");
>>     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
>>                           &error_fatal);
>> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
>> index acf34a12d6..6eacb4a463 100644
>> --- a/hw/i2c/core.c
>> +++ b/hw/i2c/core.c
>> @@ -267,13 +267,13 @@ const VMStateDescription vmstate_i2c_slave =3D {
>>     }
>> };
>>
>> -DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>> +I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
>> {
>>     DeviceState *dev;
>>
>>     dev =3D qdev_new(name);
>>     qdev_prop_set_uint8(dev, "address", addr);
>> -    return dev;
>> +    return I2C_SLAVE(dev);
>> }
>>
>> bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
>> @@ -283,10 +283,9 @@ bool i2c_realize_and_unref(DeviceState *dev, I2CBus=
 *bus, Error **errp)
>>
>> DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
>> {
>> -    DeviceState *dev;
>> +    DeviceState *dev =3D DEVICE(i2c_slave_new(name, addr));
>>
>> -    dev =3D i2c_try_create_slave(name, addr);
>> -    i2c_realize_and_unref(dev, bus, &error_fatal);
>> +    i2c_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
>>
>>     return dev;
>> }

Fewer casts:

   DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
   {
        I2CSlave *dev =3D i2c_slave_new(name, addr );

        i2c_realize_and_unref(dev, bus, &error_fatal);
        return DEVICE(dev);
   }

It's all the same after PATCH 4.  You decide whether to polish the
intermediate state.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

