Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp129021lfi;
        Tue, 3 Mar 2020 01:13:14 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt3f3DKlrjE+g+Rv732raVQCP5X6n60DLKY3uiIJrR/ZHwYJfEZwJCZlEF34jO31ELUSsMR
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr3227476qvp.176.1583226794010;
        Tue, 03 Mar 2020 01:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583226794; cv=none;
        d=google.com; s=arc-20160816;
        b=mb43VC9mOeFl97t50UmGSUs5TPea7CBDAEod7NnjyoqNBAqcKbLX1G0UaoVxPsGlzt
         NAnusfAooeOkzbm8+ORwsiYNvy/wqOZD2O597vUU90MBMysPGb3CII9E4k6pOYFpV8aN
         Eq5vRN0Tl4gGgmRuNxfPOwcF2anBRRjv5i0gulRohmdmUqIXKFzV1Qla3VgyF9weqS9A
         FVJbOVQYHHHNu5Rr3zcDJqoejyr+RX+pft4K50vte73YbfgAfhUmou9QjXox5DtwGC4E
         opOYuFQ3O7VjQ7ND5PjiI+XCaorliMB4Jw3lCobTMYLNs3yU0LPCPASeoiHxMawsMSOe
         l1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:date:subject:to:from:dkim-signature;
        bh=lD8sQW93kFH95IHAUQhhA3jFVbVgxvW2GcfHIpTgy5I=;
        b=e8SSjCx+qRdDs8C8AQk0YQjR1NBllxria47oMjWpUSpJoFbOTNjzVcF5oMfb4TZIPm
         7Zul77U2cbTnGDFr2k+Jxjb4JQrxGoFpLXIwO4V/oKlZpMVzqyOnRYq/IMdH6pLmd+7V
         Vm2lH6VBk/pB6/S69u0NUo2s0uL9V2aL2XAfSJWaywuKpYlEVQUCFdE3ycP5XeQ8mn9V
         Unyhac6e5pj0C8niJECxdZA2ftO1M1YmeesQCl9XiLPlKwfuMV9bNA8wWaoV/MZ+8mGU
         fryJGRF9r5pGM1hypw5Qt0uW0XEB3FLyDbByuvI/tJ4loElmjkjnLXfYOXp+n/aZLH3h
         FN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXzSFyDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee3si1757556qvb.207.2020.03.03.01.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 01:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXzSFyDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j93c1-0001Fx-Fp
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 04:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j93bt-0001Fo-48
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:13:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j93bq-0003PP-Vl
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:13:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43248
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j93bq-0003Ow-Ms
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 04:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583226781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lD8sQW93kFH95IHAUQhhA3jFVbVgxvW2GcfHIpTgy5I=;
 b=cXzSFyDn9qVZEE2ukGbGB2BDaiEBJXelWvn+vdXoyDSf9SdYAmxIQR6i6PmEyv3RWMd5Zc
 6VArvRwC8afab3mbVqVBzE8tW+GwKjkEjJaFVUpunU3BZzbYii963uwqYdZXkiSTPQEVcl
 CTZNF023T2lw8zzUzdrMA6/zstLwBQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-z-_7_u8-O76xxr0oCn_vKA-1; Tue, 03 Mar 2020 04:13:00 -0500
X-MC-Unique: z-_7_u8-O76xxr0oCn_vKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFDD618C35A1;
 Tue,  3 Mar 2020 09:12:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A050F5C3FA;
 Tue,  3 Mar 2020 09:12:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/cubieboard: make sure SOC object isn't leaked
Date: Tue,  3 Mar 2020 04:12:54 -0500
Message-Id: <20200303091254.22373-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, drjones@redhat.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4uT/m3rSjRrt

SOC object returned by object_new() is leaked in current code.
Set SOC parent explicitly to board and then unref to SOC object
to make sure that refererence returned by object_new() is taken
care of.

The SOC object will be kept alive by its parent (machine) and
will be automatically freed when MachineState is destroyed.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reported-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/cubieboard.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 089f9a30c1..12f8ac798d 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -30,9 +30,14 @@ static struct arm_boot_info cubieboard_binfo =3D {
=20
 static void cubieboard_init(MachineState *machine)
 {
-    AwA10State *a10 =3D AW_A10(object_new(TYPE_AW_A10));
+    AwA10State *a10;
     Error *err =3D NULL;
=20
+    a10 =3D AW_A10(object_new(TYPE_AW_A10));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(a10),
+                              &error_abort);
+    object_unref(OBJECT(a10));
+
     object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set phy address: ");
--=20
2.18.1

