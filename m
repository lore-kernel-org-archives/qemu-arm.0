Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1170576wrt;
        Wed, 23 Jan 2019 13:26:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6b7bgteYvrb9QTQdWvI1CqjFrJJwCsON+PFhZ6H3DGCP8Jsl82ggWJyQojNleA1cxUrzGE
X-Received: by 2002:a1c:ab87:: with SMTP id u129mr4289560wme.104.1548278773799;
        Wed, 23 Jan 2019 13:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548278773; cv=none;
        d=google.com; s=arc-20160816;
        b=y1ZZvEd+vTa81RJ/nPNrohU23+YhPn4TtMizAKRKskmyBR+l4wyLhf74RPqpvKNIqC
         yCTz79RnPNs4LILNADhYWpjOeOmjVQ0E54NWNrT/o7sOOJMfrsdcB4zb09ENUjf/zR2p
         yOlweCChZ/k+2weibK4b52+7oczmXZy0jHVi7CArStSsyTy0CeYDI9odHPntg1Iotf1Y
         AbWKm5WwqiurmPti/Ur7XapkEzrjly6PIoL7dX6PfDS0k5pAdq7rgZu5jPmWmJt3QVKB
         xzTmuh9l0yhSLo44WBY8SeSWFStPRaEmCp5g2k7OR3lxWG0+tAI0vjKAClY66VBQudKu
         eWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QRGUrCh5s1qhBz0bil2qXX1NYU9v2uwIICifXsCNKlA=;
        b=S0EG4asXhvAG+vSCBY9oOdW/rxdgwtZhHFpH1IhGglNT58HIJjMvLFfYZLtEqztOrw
         N/81eH95SwHy4SnVsVWVf0AwWZHH/Vsl6chuRrM05tq4F0v60UTxq5yHhsbGv3mviRCg
         +rj4RqyYwtwak6rKJwVaY+dCk7MRyd1XKKc36VM79S+LQBxUdpeSXfimK3UABeF10tKa
         dofIMDGVS9WZbLna0uTtucQzdNx4YpwyrAwWYBQGa7+TUSYPkctTIlfg6mhP6F0Vqcvf
         r15PuAyzoN0S57hpA8+K3GuLOdXCgK4BI7NB+UCQ5I+kNtcpUPE20T4PEAhgHde2Chdr
         Dkeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si35279832wrm.46.2019.01.23.13.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ2G-00006I-OA
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:26:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzQ-0006DD-OW
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzP-0001o7-QW
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gmPzN-0001lJ-Vs; Wed, 23 Jan 2019 16:23:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C2B19D43E;
	Wed, 23 Jan 2019 21:23:12 +0000 (UTC)
Received: from localhost (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D056C65F72;
	Wed, 23 Jan 2019 21:23:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 21:22:31 +0000
Message-Id: <20190123212234.32068-3-stefanha@redhat.com>
In-Reply-To: <20190123212234.32068-1-stefanha@redhat.com>
References: <20190123212234.32068-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 23 Jan 2019 21:23:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/5] pflash: flush rom device memory region
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DGzCnT2rxChR

pflash devices should mark the memory region dirty and invalidate TBs
after directly writing to the RAM backing the ROM device.

Note that pflash_cfi01_get_memory() is used by several machine types to
populate ROM contents directly.  Callers are untouched by this patch
because they only modify memory before the guest is started.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/pflash_cfi01.c | 5 +++++
 hw/block/pflash_cfi02.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index bffb4c40e7..5301c11c18 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -446,6 +446,7 @@ static inline void pflash_data_write(pflash_t *pfl, h=
waddr offset,
         break;
     }
=20
+    memory_region_flush_rom_device(&pfl->mem, offset, width);
 }
=20
 static void pflash_write(pflash_t *pfl, hwaddr offset,
@@ -482,6 +483,8 @@ static void pflash_write(pflash_t *pfl, hwaddr offset=
,
             if (!pfl->ro) {
                 memset(p + offset, 0xff, pfl->sector_len);
                 pflash_update(pfl, offset, pfl->sector_len);
+                memory_region_flush_rom_device(&pfl->mem, offset,
+                                               pfl->sector_len);
             } else {
                 pfl->status |=3D 0x20; /* Block erase error */
             }
@@ -763,6 +766,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
             error_setg(errp, "failed to read the initial flash content")=
;
             return;
         }
+
+        memory_region_flush_rom_device(&pfl->mem, 0, total_len);
     }
=20
     /* Default to devices being used at their maximum device width. This=
 was
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 0f8b7b8c7b..d04572eca4 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -378,6 +378,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offse=
t,
                     pflash_update(pfl, offset, 4);
                     break;
                 }
+
+                memory_region_flush_rom_device(&pfl->orig_mem, offset, w=
idth);
             }
             pfl->status =3D 0x00 | ~(value & 0x80);
             /* Let's pretend write is immediate */
@@ -426,6 +428,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offse=
t,
             if (!pfl->ro) {
                 memset(pfl->storage, 0xFF, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
+                memory_region_flush_rom_device(&pfl->orig_mem, 0,
+                                               pfl->chip_len);
             }
             pfl->status =3D 0x00;
             /* Let's wait 5 seconds before chip erase is done */
@@ -441,6 +445,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offse=
t,
             if (!pfl->ro) {
                 memset(p + offset, 0xFF, pfl->sector_len);
                 pflash_update(pfl, offset, pfl->sector_len);
+                memory_region_flush_rom_device(&pfl->orig_mem, offset,
+                                               pfl->sector_len);
             }
             pfl->status =3D 0x00;
             /* Let's wait 1/2 second before sector erase is done */
@@ -590,6 +596,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
             error_setg(errp, "failed to read the initial flash content")=
;
             return;
         }
+
+        memory_region_flush_rom_device(&pfl->orig_mem, 0, chip_len);
     }
=20
     pflash_setup_mappings(pfl);
--=20
2.20.1

