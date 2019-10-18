Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1096463wrm;
        Fri, 18 Oct 2019 08:51:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrzHof9Y+bc+6FXCkCSbabTXUdjk0KUXnnY9pMwjDmg/Vk+hO4DRI+MRKH8QBi1fNQoPeL
X-Received: by 2002:aa7:df0b:: with SMTP id c11mr10399954edy.101.1571413901603;
        Fri, 18 Oct 2019 08:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413901; cv=none;
        d=google.com; s=arc-20160816;
        b=tdc/yiS4FoLEqjrRYhjBws7+U+TCUCcHYA+4XKCDCddsysudwym76LGqoyIjLKpO8E
         1ygG7pMidRi0Zp86cCiI8PBETGx2VPBuJZIFYGFHSWIG0Qr6UYjb22fV9kEvDU/Ax7cu
         sLPLSBu5o40AqOQM+SpnRQAYPyFB8B3aPxGR6k9iZ2fK60ud7VH+sTn8stW8+d/eJZjQ
         C38e/W8GRtXknm0UXgbyPLOKc4/hYLOZjz1YXJOJwty8LgXvHzOIFDnG2/vEttAFSybN
         4i2drIwvVTw05t8FneFPNjOFv9PdZDBM2CLdHeMOGOavVJ2K95zjMl/4Zg8Nwgp/tR4h
         /RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=AUbN2H8W+PVR/5E4thsx0hmiuePRLyRt84CW0bCYuLQ=;
        b=vsN1JG3qqFykO/IIIgMEPU0MH+1qwPAywYN+3oIF/k15dybODVMzxr5uKgbcLFYdBH
         7bTd+VofnOR/R78jhpi0ufv5s0SLO421N1ZWfweBVc2CjQeqdfsDA3WRiPYAjV/3io71
         XUzrVPyEFoT3H1p39RgSdoeJztSR0o+x9GHhwXGqI4kiV6Q/ILJ6d2e/YTnUnqCOW9Nt
         FcjBvMSDE+gn4xlgt28/3t69P4NrJkTksMaQ3EVqG0QcLJEOkAOIcdEHAZ/TStbbdp5Q
         9J0wUVW+eOnZby9fue2mk66VvKN2q1TH54DZk9T55WLiyH1QzCU7pb7pDXusNmzYsPtt
         WSPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30si4248128edd.137.2019.10.18.08.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUXU-000070-6n
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQH-0002AY-A4
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:44:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQF-0007tH-Vf
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:44:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUQD-0007qX-7B; Fri, 18 Oct 2019 11:44:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 407B810DCC9F;
 Fri, 18 Oct 2019 15:44:08 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27CBF5D9CA;
 Fri, 18 Oct 2019 15:44:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] Remove QDEV_PROP_PTR
Date: Fri, 18 Oct 2019 17:42:12 +0200
Message-Id: <20191018154212.13458-15-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 15:44:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nFfUTKpOxFwJ

No longer used in the tree. The comment about user_creatable is still
quite relevant, but there is already a similar comment in qdev-core.h.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev-properties.c    | 18 ------------------
 include/hw/qdev-properties.h | 22 ----------------------
 2 files changed, 40 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ac28890e5a..6ca7697599 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -501,13 +501,6 @@ const PropertyInfo qdev_prop_string =3D {
     .set   =3D set_string,
 };
=20
-/* --- pointer --- */
-
-/* Not a proper property, just for dirty hacks.  TODO Remove it!  */
-const PropertyInfo qdev_prop_ptr =3D {
-    .name  =3D "ptr",
-};
-
 /* --- mac address --- */
=20
 /*
@@ -1165,17 +1158,6 @@ void qdev_prop_set_enum(DeviceState *dev, const ch=
ar *name, int value)
                             name, &error_abort);
 }
=20
-void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value)
-{
-    Property *prop;
-    void **ptr;
-
-    prop =3D qdev_prop_find(dev, name);
-    assert(prop && prop->info =3D=3D &qdev_prop_ptr);
-    ptr =3D qdev_get_prop_ptr(dev, prop);
-    *ptr =3D value;
-}
-
 static GPtrArray *global_props(void)
 {
     static GPtrArray *gp;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 16837ab5dd..a90a9cec80 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -18,7 +18,6 @@ extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
 extern const PropertyInfo qdev_prop_chr;
 extern const PropertyInfo qdev_prop_tpm;
-extern const PropertyInfo qdev_prop_ptr;
 extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_on_off_auto;
 extern const PropertyInfo qdev_prop_losttickpolicy;
@@ -171,25 +170,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
=20
-/*
- * Please avoid pointer properties.  If you must use them, you must
- * cover them in their device's class init function as follows:
- *
- * - If the property must be set, the device cannot be used with
- *   device_add, so add code like this:
- *   |* Reason: pointer property "NAME-OF-YOUR-PROP" *|
- *   DeviceClass *dc =3D DEVICE_CLASS(class);
- *   dc->user_creatable =3D false;
- *
- * - If the property may safely remain null, document it like this:
- *   |*
- *    * Note: pointer property "interrupt_vector" may remain null, thus
- *    * no need for dc->user_creatable =3D false;
- *    *|
- */
-#define DEFINE_PROP_PTR(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, qdev_prop_ptr, void*)
-
 #define DEFINE_PROP_CHR(_n, _s, _f)             \
     DEFINE_PROP(_n, _s, _f, qdev_prop_chr, CharBackend)
 #define DEFINE_PROP_STRING(_n, _s, _f)             \
@@ -262,8 +242,6 @@ void qdev_prop_set_drive(DeviceState *dev, const char=
 *name,
 void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
-/* FIXME: Remove opaque pointer properties.  */
-void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
=20
 void qdev_prop_register_global(GlobalProperty *prop);
 int qdev_prop_check_globals(void);
--=20
2.23.0.606.g08da6496b6

