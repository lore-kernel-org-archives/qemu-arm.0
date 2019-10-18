Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1085727wrm;
        Fri, 18 Oct 2019 08:42:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzr74OrAt1t+Hf67yw51HeypYF3cimYVylNTgstpwzqjgsa0P4oO+mL7n/p4aDriwqbryRd
X-Received: by 2002:a37:6353:: with SMTP id x80mr4414447qkb.52.1571413358220;
        Fri, 18 Oct 2019 08:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413358; cv=none;
        d=google.com; s=arc-20160816;
        b=N0BbB4E39FOq/RCiz7vV0kOy6Hk2XQlZoHnzUCKXEF8bfbp5fem1LkFjlXg+T3uSyi
         G14WX6UEBp/OhaYS1W8HKZBD8orrmb4MDnBfwVkpOp8VfW2Cm9dKumlKF2vTxAc+3bL7
         q05J9L1YRDXekKZkXmF9ljWffWsXqVMjwISc4NudgoVqqDPY98fDD2mvzDbY7gNFFpLC
         i1XP/xG+36yn4bXwvCw95YwRvPoRS7AAij3gBGWxSIWyqJKogqjEh3/eBF6DcFwe3qSm
         ybMlVBCZ5dZRit4femwbxMP+UoHy6/HNdha85ntY63i8WhvrCg8UWGjoeqFzNHW5DSC1
         dAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=r1pAGWK7Yvosax5uLkqYWEK/T8ZjyRO7Bglk9jACw5k=;
        b=lE/j1KbcaOOoSJED8zfikV0krhlJLd8RKvvnS4MpKYqMsMBqPEN0cyDf8JZaZ/eRSk
         Z70jhLBDZ9apZcxVGEqCAD2N4pWX3ZOODqrYVDg2oOE1dkWx5WWwVAoj4nK7J2xDTlQW
         i1Kvgfe1a9nOiIxqITkTIMWfgef2ws2rQ+rOygzoAjoc9Rcc2km98SoybpRDtAKSKxTz
         QQvSByGprREyzDDjFPyyGZbWoHAsDncSNqiI6Wukoz9lVkO+RBZ8uNByuwjYlLigqcqe
         gk7C12d0K0+bDS5oetft0UNU19rEeqLYdkBo/Ko17X6QNGn6RVzQkUrJFSyVlPDXuHqj
         4F+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si5956628qvf.39.2019.10.18.08.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUOj-0008C4-72
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOa-0008Bt-JG
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOZ-00068p-LW
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:42:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUOZ-00068A-GQ; Fri, 18 Oct 2019 11:42:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C39C10DCC9F;
 Fri, 18 Oct 2019 15:42:26 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F7D7987;
 Fri, 18 Oct 2019 15:42:22 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] sm501: replace PROP_PTR with PROP_LINK
Date: Fri, 18 Oct 2019 17:41:59 +0200
Message-Id: <20191018154212.13458-2-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 15:42:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uvxa/3pIrrC9

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/display/sm501.c | 5 +++--
 hw/sh4/r2d.c       | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 1f33c87e65..a87d18efab 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1930,7 +1930,7 @@ typedef struct {
     SM501State state;
     uint32_t vram_size;
     uint32_t base;
-    void *chr_state;
+    Chardev *chr_state;
 } SM501SysBusState;
=20
 static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
@@ -1968,7 +1968,8 @@ static void sm501_realize_sysbus(DeviceState *dev, =
Error **errp)
 static Property sm501_sysbus_properties[] =3D {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
-    DEFINE_PROP_PTR("chr-state", SM501SysBusState, chr_state),
+    DEFINE_PROP_LINK("chr-state", SM501SysBusState, chr_state,
+                     TYPE_CHARDEV, Chardev *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index ee0840f380..5780ee85d9 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -272,7 +272,8 @@ static void r2d_init(MachineState *machine)
     busdev =3D SYS_BUS_DEVICE(dev);
     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
     qdev_prop_set_uint32(dev, "base", 0x10000000);
-    qdev_prop_set_ptr(dev, "chr-state", serial_hd(2));
+    object_property_set_link(OBJECT(dev), OBJECT(serial_hd(2)),
+                             "chr-state", &error_abort);
     qdev_init_nofail(dev);
     sysbus_mmio_map(busdev, 0, 0x10000000);
     sysbus_mmio_map(busdev, 1, 0x13e00000);
--=20
2.23.0.606.g08da6496b6

