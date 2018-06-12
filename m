Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5153045wrq;
        Tue, 12 Jun 2018 03:45:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJsRwJ5bmHfXe3+jT7uANGxg5qyTuf6TIFTqiL2gi/MiqyU90ZVvjj5mXc8y/9noe7Gnr3L
X-Received: by 2002:ac8:25f2:: with SMTP id f47-v6mr2951800qtf.12.1528800345585;
        Tue, 12 Jun 2018 03:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800345; cv=none;
        d=google.com; s=arc-20160816;
        b=fGZwyLsagh06fnpEhiS+QEyhCKs1SaluQLuoroc0SufUjrAoyNBbEtl8chHy07exo2
         b6aecdRQ06zF9rINTmQpABVhF/eJsTDsVBwf06VTn/lmitqROmd8c7G8np+bDHTPFzF/
         o9Hy9Z/iNXr42rD0OClcgQOGEsJzSos4e0zpvJ+0hJsKEkM9Qx5vOdz8ZfGkU5CNYRQR
         wMaZqFtc5nWuVQbX0bE39joRGEXHsUlvXCyQzn4aB8Iu0g7dsEW8vT/0ZiUcnWai3S0e
         e+ImB6HhZizcshQokycYC8FC/9lAs6zEAl6BtYarRVGJfnxWdDxMT3eA461jIk/M1TV5
         eEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4w6ous40wYTTv7nkDx/JQm33VcGQP6+MleTWEuJAMYA=;
        b=KBx1lzezKzV7IjN9Mp1CRBxsulBzdSuyjwKBfqVr5hyk652j5KjjRq5o6qkDDDqBdy
         uLJvPmXiNS9JoipBMtKZZlwhwTAMLuHHd6tIkao23iHAU9FkFMLqVS5zMgPYMbnHeEJw
         8f2zSG+uVxie+PSSdJAhhftsnnN6Cmsse7aJWuU0KpcogWhnjJK7eUezIfyV/KaSNHRi
         RmwSbpc3SrrVtwafjYiM2V0Q5cApNH/NIo4URobNVzbI510A03Ku6mCtg1zMqU0Gbmj8
         DKk6ulE97D/WZW2c0zilMIeb4pvAYjae/j5DLI8UdxPHTw/6O50U8UtP0VEyxd/K15eQ
         mHpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55-v6si616188qts.128.2018.06.12.03.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgo5-0003do-0P
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002na-5b
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmv-0007ra-6O
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmv-0007r0-0Q; Tue, 12 Jun 2018 06:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4144177886;
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25B862024CA2;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8FA50409E4; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:26 +0200
Message-Id: <20180612104430.25745-5-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 4/8] bus: do not unref the added child bus on
 realize
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UIsMORrazZx+

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

When the parent bus removes the child property, it takes care of
removing the added reference, in object_finalize_child_property().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20180531195119.22021-2-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/core/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 4651f24486..ad0c9df335 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -102,7 +102,6 @@ static void qbus_realize(BusState *bus, DeviceState *=
parent, const char *name)
         QLIST_INSERT_HEAD(&bus->parent->child_bus, bus, sibling);
         bus->parent->num_child_bus++;
         object_property_add_child(OBJECT(bus->parent), bus->name, OBJECT=
(bus), NULL);
-        object_unref(OBJECT(bus));
     } else if (bus !=3D sysbus_get_default()) {
         /* TODO: once all bus devices are qdevified,
            only reset handler for main_system_bus should be registered h=
ere. */
--=20
2.9.3

