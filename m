Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1270805wrq;
        Wed, 23 Oct 2019 11:50:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMoaUdr34KCwBeeZczpAKSL5bOrn9KBmqi45C4/YDWuUKHCpA9Cq35IzEHGwI1i5EeO8Dx
X-Received: by 2002:a17:907:2118:: with SMTP id qn24mr34002985ejb.141.1571856649041;
        Wed, 23 Oct 2019 11:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571856649; cv=none;
        d=google.com; s=arc-20160816;
        b=ojRvRf3u1967lap12/vm5A2oSXCxO7/JWtwSMvlwo4eLnGsoaDxI6SuN5DDuXVKaDs
         xnAEv1QNzjdlBCSxN1wfN9L3YuU7M3jitVFzu7Ok8/3td4h8uDngPmzf1+/frw8mi//e
         JiEeCl3FlpMpbdlLdA05S7rN5uoZZk5k4nPsZnEieVX3sf5GT0hLEc4xSbc5teRCUSAm
         SelGfXu6xZQwpoGE9bO5TtxqdnKMYn9RKunaDoFXHyZkHeXmG5N9tpJcI11LpVHdipKb
         6VCK1/zvd09Q7NN5ZZSgsYC9ESGLQg2GaWz5EBHstVZWcYWrGiMgfViGutNdbGGPkyWj
         zctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CuZ5SUzdpmMCqJbsDvqIHkAvfyUA4Ds20xJsF4SzYxI=;
        b=sfM9xHo0efSIBR4rEVdB55kaTslKloHOlKEirl8C8tOMU7Jvq47jRXX2IoHG8ew2W8
         AIfb9RZLYArC6tv+Ajy/MLVEzEOpOlzI8qHD/64I2uR+Cc82pWBuOVpRrmxby5Jf90OM
         bKc68taKLTJMEhw65iXjx1BQig6KSnQ1EynSjgNi1rGO0G9uhVThzQjFcv0bZzBlH6uS
         9yc1Ogx9WyAkC6aOdcKp+gHdq47Fqu5qRJAPy0wLaOh3d/+vC909aJFOgPrsAekc/bnm
         /OFdruvlhvFwXwlG/wewxU1/JqCqdFzjA55fTq86ykKs2k8628ZG5msGIYyrMMekcIbh
         stSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RGo7VMua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m33si15350749edc.94.2019.10.23.11.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 11:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RGo7VMua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNLia-00017U-1M
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 14:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKUj-0003IE-2O
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKUh-0001Ss-2X
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:32:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34952
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKUg-0001Ro-Ui
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571851939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuZ5SUzdpmMCqJbsDvqIHkAvfyUA4Ds20xJsF4SzYxI=;
 b=RGo7VMuaaU03/X+Yi5RJHq2T3MmM8EH5R6urK4iSvynSacJFYbIdeEIK8y60QlLkFqoYHF
 c3OgHcvFA44XXjtadv7sx27TJGmBOXqmz0KUNyWRlL2zh7iwqNYjrC5nB+1GO+Jb/lEr4J
 yn+YaEAUhpd3ezYcLt6t3Ll5W+dgro8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-BDx2WK7xNfWRUADhv51G2A-1; Wed, 23 Oct 2019 13:32:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A824107AD33;
 Wed, 23 Oct 2019 17:32:13 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A12521001B20;
 Wed, 23 Oct 2019 17:32:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/33] qdev: remove unused qdev_prop_int64
Date: Wed, 23 Oct 2019 19:31:22 +0200
Message-Id: <20191023173154.30051-2-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: BDx2WK7xNfWRUADhv51G2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: myWZ2oF/wv+P

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev-properties.c    | 32 --------------------------------
 include/hw/qdev-properties.h |  3 ---
 2 files changed, 35 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ac28890e5a..be4cb01f0b 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -409,31 +409,6 @@ static void set_uint64(Object *obj, Visitor *v, const =
char *name,
     visit_type_uint64(v, name, ptr, errp);
 }
=20
-static void get_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
-{
-    DeviceState *dev =3D DEVICE(obj);
-    Property *prop =3D opaque;
-    int64_t *ptr =3D qdev_get_prop_ptr(dev, prop);
-
-    visit_type_int64(v, name, ptr, errp);
-}
-
-static void set_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
-{
-    DeviceState *dev =3D DEVICE(obj);
-    Property *prop =3D opaque;
-    int64_t *ptr =3D qdev_get_prop_ptr(dev, prop);
-
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
-    visit_type_int64(v, name, ptr, errp);
-}
-
 const PropertyInfo qdev_prop_uint64 =3D {
     .name  =3D "uint64",
     .get   =3D get_uint64,
@@ -441,13 +416,6 @@ const PropertyInfo qdev_prop_uint64 =3D {
     .set_default_value =3D set_default_value_uint,
 };
=20
-const PropertyInfo qdev_prop_int64 =3D {
-    .name  =3D "int64",
-    .get   =3D get_int64,
-    .set   =3D set_int64,
-    .set_default_value =3D set_default_value_int,
-};
-
 /* --- string --- */
=20
 static void release_string(Object *obj, const char *name, void *opaque)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index c6a8cb5516..690ff07ae2 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -13,7 +13,6 @@ extern const PropertyInfo qdev_prop_uint16;
 extern const PropertyInfo qdev_prop_uint32;
 extern const PropertyInfo qdev_prop_int32;
 extern const PropertyInfo qdev_prop_uint64;
-extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
 extern const PropertyInfo qdev_prop_chr;
@@ -164,8 +163,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_int32, int32_t)
 #define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint64, uint64_t)
-#define DEFINE_PROP_INT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_int64, int64_t)
 #define DEFINE_PROP_SIZE(_n, _s, _f, _d)                       \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
--=20
2.23.0.606.g08da6496b6

