Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp919508wrq;
        Fri, 13 Jul 2018 10:13:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcfMnLFdQOHIcy/Na4EiGXH0jC0c0P9WnSzMp6zVwmaefurTj1zlkL2i9PoCbepnoU6GIIZ
X-Received: by 2002:ac8:318e:: with SMTP id h14-v6mr6818738qte.36.1531502028644;
        Fri, 13 Jul 2018 10:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531502028; cv=none;
        d=google.com; s=arc-20160816;
        b=IAlRkhXcusBEe17XENpuWbyrR8vzSE0AC2aNW2S4Rg3IiUa5Fd1fTiFRWZspg4zTRj
         f4CpGHlIVFi1GbZWSk7QOtqVez7jGw4nwHFf05656vZanEXnNqK31y7/+UBYmQ8/Npvk
         ptUUkYVmWVXck1alHfALgbpXaZ+d99/nW1AP+852AZepbTmD0Gj704VRe45TM6Vcce9Y
         ibntQRbn1qbA+0MjGQpac1ZLuZXZb2U2+3Pm2ff3Dz5UrMsU7WJaJ362ED97PlR00dKn
         jqHi6IJr5aL8rKXuchTEokg02pO9ekyQlr4Ac8d9vVpWb3E3gJ3jSe4AhpnbhWKnrxw/
         Osig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=bY8tKQMns+PzcEbrqQhqxJ2rBFPy4UcAfOI929vz9ZQ=;
        b=tQFSpQTFi9mo6sK2KPG1Mh2Jq1aT4AE5D9rTtk/mVGitcUrRy/EJZ4wTxBkjkYYy2+
         LN9zvYuaoeQp5uBsDjtKQf6XTQEFbxeHXl/kA7eMI+T9rhuG5yGHdVfhfcCXMPL0zoyb
         HGr/vAGDTzsOaxIaSYBrux2uUcg8XvTk98x+tHsEQoIqwJ3PutKZsPqhMH7O1JxVXpcP
         iIJUkxVhl3PXLZNt0kC20WGxGoGiVM1kONZ44LzySahvUWF63keSM90Pq4gyU08sCZfa
         kOcap+kOYXq1sbCUW9yW8qCXzVCIG+zS5oK4GEgsbw+9OvdFelVcqBiWOjZ39YbL0lu4
         vbJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q50-v6si14675986qtj.253.2018.07.13.10.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 10:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe1dc-0003Wd-3C
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 13:13:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fe1dU-0003WX-W9
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 13:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fe1dQ-00018P-17
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 13:13:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58886 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fe1dP-00017x-RD; Fri, 13 Jul 2018 13:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6FA140583DB;
	Fri, 13 Jul 2018 17:13:34 +0000 (UTC)
Received: from [10.36.117.240] (ovpn-117-240.ams2.redhat.com [10.36.117.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3542026D6B;
	Fri, 13 Jul 2018 17:13:30 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-7-git-send-email-thuth@redhat.com>
	<d76b1a42-e232-f8a3-48dc-d71238403c94@redhat.com>
	<49dcf89e-6f5a-7497-e5fd-e54d4fcd59eb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9133dc89-5f24-0802-caa6-bf73b2c229d1@redhat.com>
Date: Fri, 13 Jul 2018 19:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <49dcf89e-6f5a-7497-e5fd-e54d4fcd59eb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 13 Jul 2018 17:13:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 13 Jul 2018 17:13:34 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 06/16] hw/display/xlnx_dp: Move
 problematic code from instance_init to realize
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ygg7QIzCkcsH

On 13/07/2018 17:59, Thomas Huth wrote:
> Your patch looks good at a first quick glance, but it seems not to work=
 as expected: When I now run QEMU like this:
>=20
> echo "{'execute':'qmp_capabilities'}" \
>  "{'execute':'device-list-properties'," \
>  "'arguments':{'typename':'xlnx,zynqmp'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M none,accel=3Dqtest -qmp stdio
>=20
> then QEMU ends up in an endless loop and I've got to kill it.

There are two more bugs that my patch makes un-latent, where the
objects are created but not added as children.  Therefore when
you call object_unparent on them, nothing happens.

In particular dpcd and edid give you an infinite loop in bus_unparent,
because device_unparent is not called and does not remove them from
the list of devices on the bus.

The following incremental changes fix everything for me.  Note that
aux_create_slave/qdev_create already do the unref for you.

Thanks,

Paolo

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 589ef59dfd..6439bd05ef 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1235,8 +1235,11 @@ static void xlnx_dp_init(Object *obj)
      * Initialize DPCD and EDID..
      */
     s->dpcd =3D DPCD(aux_create_slave(s->aux_bus, "dpcd"));
+    object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd), NULL);
+
     s->edid =3D I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "i2=
c-ddc"));
     i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
+    object_property_add_child(OBJECT(s), "edid", OBJECT(s->edid), NULL);
=20
     fifo8_create(&s->rx_fifo, 16);
     fifo8_create(&s->tx_fifo, 16);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 2fe807d42f..0e56d9a8a4 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -32,6 +32,7 @@
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
 #include "monitor/monitor.h"
+#include "qapi/error.h"
=20
 #ifndef DEBUG_AUX
 #define DEBUG_AUX 0
@@ -63,9 +64,14 @@ static void aux_bus_class_init(ObjectClass *klass, voi=
d *data)
 AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 {
     AUXBus *bus;
+    Object *auxtoi2c;
=20
     bus =3D AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
-    bus->bridge =3D AUXTOI2C(qdev_create(BUS(bus), TYPE_AUXTOI2C));
+    auxtoi2c =3D object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c"=
,
+                                     &error_abort, NULL);
+    qdev_set_parent_bus(DEVICE(auxtoi2c), BUS(bus));
+
+    bus->bridge =3D AUXTOI2C(auxtoi2c);
=20
     /* Memory related. */
     bus->aux_io =3D g_malloc(sizeof(*bus->aux_io));
