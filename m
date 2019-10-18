Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1065519wrm;
        Fri, 18 Oct 2019 08:26:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdsClJDVnUQ3vaGniHOsZJjZmKi0OsmoTJ+DGON/XvHJmU3KxTayY2B11S1UsstoFomgoh
X-Received: by 2002:a17:906:1c87:: with SMTP id g7mr1564106ejh.189.1571412368599;
        Fri, 18 Oct 2019 08:26:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si3578130ejw.335.2019.10.18.08.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:26:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QOw6bxRN;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLU8l-0002zd-FF
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTrk-0007LN-RD
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTrj-0000V4-9c
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:08:32 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38760)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iLTrf-0000Hl-7c; Fri, 18 Oct 2019 11:08:27 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9AB0396F5A;
 Fri, 18 Oct 2019 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1571411276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmmm1sUv204rKQzphLaIVatMJToXUpbV+y87KEeCwso=;
 b=QOw6bxRN8WI12bqXgliMPPlfmn26R3JrDL9RTU1SIRdB3FTo6YOxe93AgOE1c5Nyieur49
 +6+uljuJ84lc5LhOawwXYCkW2MLK9ZNX3lcXKz2ZvKDgiCHGBYXNq3lX4WOnLQ2MIhoF09
 d6loWpNe1JuBAETWydAkYawxDxtSQkg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/13] hw/s390x/ipl: replace deprecated qdev_reset_all
 registration
Date: Fri, 18 Oct 2019 17:06:28 +0200
Message-Id: <20191018150630.31099-12-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018150630.31099-1-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1571411276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmmm1sUv204rKQzphLaIVatMJToXUpbV+y87KEeCwso=;
 b=GVBuEHQay4s75OutKcgwxDgIhk+XvNA39cJBgynayIl0iiEZ9RdwtGNSuatwEoCd670sDe
 jM2xcQslqEms1W6LlAj0Z8BBGuwa3AvffxvKLWvGJ5dOouEJKLWdfmgj4b6xM3wbCnaP7a
 63ZkoIASkOTa6o1Q5dbpMSB8LJ75wgE=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1571411276; a=rsa-sha256; cv=none;
 b=3JVYI4h0l3T/eTtkZSoGnyKM8tHH3COEUwQsNHjrCHXz5XNiwrzo18KX+A4gn6e4uFfujs
 +gz4M+0FGI3H6Abr6MKi4P959VkV8hyqMrmFEZG7pZfTzCULqSPP9bt+1t8rS4IqSiwX3W
 is3IVsChNayyXjuAdcTj4p3RAoRI/qo=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, edgari@xilinx.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uB86C66Zud3M

Replace deprecated qdev_reset_all by resettable_cold_reset_fn for
the ipl registration in the main reset handlers.

This does not impact the behavior for the following reasons:
+ at this point resettable just call the old reset methods of devices
  and buses in the same order than qdev/qbus.
+ resettable handlers registered with qemu_register_reset are
  serialized; there is no interleaving.
+ eventual explicit calls to legacy reset API (device_reset or
  qdev/qbus_reset) inside this reset handler will not be masked out
  by resettable mechanism; they do not go through resettable api.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index ca544d64c5..2689f7a017 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -237,7 +237,15 @@ static void s390_ipl_realize(DeviceState *dev, Error=
 **errp)
      */
     ipl->compat_start_addr =3D ipl->start_addr;
     ipl->compat_bios_start_addr =3D ipl->bios_start_addr;
-    qemu_register_reset(qdev_reset_all_fn, dev);
+    /*
+     * Because this Device is not on any bus in the qbus tree (it is
+     * not a sysbus device and it's not on some other bus like a PCI
+     * bus) it will not be automatically reset by the 'reset the
+     * sysbus' hook registered by vl.c like most devices. So we must
+     * manually register a reset hook for it.
+     * TODO: there should be a better way to do this.
+     */
+    qemu_register_reset(resettable_cold_reset_fn, dev);
 error:
     error_propagate(errp, err);
 }
--=20
2.23.0

