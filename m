Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1071561qvm;
        Tue, 14 Apr 2020 09:43:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqMDE2a1/6anJ6QuHnPyZYM7gc1tnI8XWZyssgZ0wC8u8FPF/LqpZRa7eegCdw9mYbQxvX
X-Received: by 2002:ac8:4e45:: with SMTP id e5mr17276831qtw.101.1586882619336;
        Tue, 14 Apr 2020 09:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882619; cv=none;
        d=google.com; s=arc-20160816;
        b=Hob5gqaViuTsuImwP6XNXjSgFaTGcxqjayWVNoU6anR6Tl6Pbjy3Ntg3Bf91uEQK9c
         WMZnmgXJ5WgRQuIF3N5iNjAfTelWEex16e4NLEk7TZCDubz8rSjgkiorFhp556mh2rqx
         CytRH4YLheR0hQRZbBRWIrk4Nr/OB+MyZE/wR50QtviggnRM+saBBjgiwRnvD62cHXZn
         vG/Vb8p058dHf68Q2LLyHzp/JH3J30H8bUBPLLmOnMhYNpQZ7cd5qDCaaAnnM81mqugG
         cEiUkYcFBMoqFSrQ+eGdDhGtiXCKuugyAdwKkQquXyGiLiA67b5fkLC5pIkgIw8r9im3
         L2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=paXjZbPCkV37DDf2O1tNOwKJgrQ4LCbjZD9did5UhGw=;
        b=ojTSQVTyXIfsJQ58QGosZr09VuPVTbfeYxln2StYAMIKZkmTwIugKhV9MX9xcbdGGq
         iqoXrJqOcwpP3feb4b+wWFVi8sTG1IjUpfuTZUXM6CZQvV9lfVJ37L87f84s2NOPVaCg
         i6l66P9HiqgPfNVgsZUo0Ar1E7NnAjzCBoi0FB7oR7stVSCdWSw4V6C5Qxjk1M3Jqctm
         nH+k9tYNOwisw/IiW8KH0sagTcNvabz0sQcQ7JXEp+DJesGVG9e3DKLlyQkeOQrkeOeY
         69CDDla2avIFoYKZEzEfKfyvX5VIA5uOmYTz0/lFLfaC60ae2lvbeee8113HGQ3zU8fS
         LGlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eg+R9WFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d44si7935125qtk.291.2020.04.14.09.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eg+R9WFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34651 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOew-0002jR-Nn
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOaU-0002Oc-Rg
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOaT-0004xJ-N7
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:39:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLfM-0008Mr-4L
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paXjZbPCkV37DDf2O1tNOwKJgrQ4LCbjZD9did5UhGw=;
 b=Eg+R9WFPGxx+loBv0n5QqxQCZHNQb7e+ks6q1oZksaUgFtur8SxAAZnnVIYjw0dn/vWPYw
 wD5c/NiLWxJzYMTYyBaxThqk29uNUd91eQq8S0XABAiFWtIUP4pzdNpnWoUGA8mSGQQvLM
 1u95JW5DKmNfOBVcf/nIb03CW2XeXk8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-FSwERMEgPWK9IB7ecCP4TA-1; Tue, 14 Apr 2020 09:31:48 -0400
X-MC-Unique: FSwERMEgPWK9IB7ecCP4TA-1
Received: by mail-wr1-f70.google.com with SMTP id j12so8644056wrr.18
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKuurj9MXRedKfmA5ryNgu9rBKfxRZmPvNByOLPGMI4=;
 b=IEyVXXG7tjq8LrItQr9n3urhGhtEljLyVerYirMCuSnFgqapNmNvQjoGibqW/pG+Lo
 2holMj1dbEbDeRwzB9Np98FNfgA9O6qUnULcQ50/aCTDCKp0WpfuHQhHq3Eb4deFXLjj
 F608ptXvgR0Bdbeskr0tVLRiswy892Kw7eODH1EEyQfLVmeJy5DmSuFQWVhrMvukZRmg
 4A7f5g3r+qF/HxF1nTUUTBH3fKHh2gF/Nz8BZ3Ij/9OFVee1gpvouVRhbpO00j6ugtxZ
 PWT+AcGmyO96K7lPXmdCAxd77nYoreItvgpjAeElis2uaL4rFZg7KOmE7YQ293cZujD/
 bTwg==
X-Gm-Message-State: AGi0Puaec7MePbezBTwRQfMpCIf5ADeaXx74Ge6jq2lZw5d5xxWdsvxj
 pMMZLgKQgm+7VFa28PPfXHCGlYRoSdH+Jvs7+enuQW4flj3xFzSu/BVFvkU0vJoQuKMpl+ZXjRJ
 1I8lHLrRgE7XB
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr22998494wmf.141.1586871107031; 
 Tue, 14 Apr 2020 06:31:47 -0700 (PDT)
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr22998457wmf.141.1586871106571; 
 Tue, 14 Apr 2020 06:31:46 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id n6sm19582479wrs.81.2020.04.14.06.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 10/12] hw/block/pflash: Check return value of
 blk_pwrite()
Date: Tue, 14 Apr 2020 15:30:50 +0200
Message-Id: <20200414133052.13712-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mansour Ahmadi <mansourweb@gmail.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MEi+/Y14AIrZ

From: Mansour Ahmadi <mansourweb@gmail.com>

When updating the PFLASH file contents, we should check for a
possible failure of blk_pwrite(). Similar to commit 3a688294e.

Signed-off-by: Mansour Ahmadi <mansourweb@gmail.com>
Message-Id: <20200408003552.58095-1-mansourweb@gmail.com>
[PMD: Add missing "qemu/error-report.h" include and TODO comment]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 8 +++++++-
 hw/block/pflash_cfi02.c | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 24f3bce7ef..be1954c5d8 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -42,6 +42,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
@@ -399,13 +400,18 @@ static void pflash_update(PFlashCFI01 *pfl, int offse=
t,
                           int size)
 {
     int offset_end;
+    int ret;
     if (pfl->blk) {
         offset_end =3D offset + size;
         /* widen to sector boundaries */
         offset =3D QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end =3D QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
+        ret =3D blk_pwrite(pfl->blk, offset, pfl->storage + offset,
                    offset_end - offset, 0);
+        if (ret < 0) {
+            /* TODO set error bit in status */
+            error_report("Could not update PFLASH: %s", strerror(-ret));
+        }
     }
 }
=20
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 12f18d401a..c6b6f2d082 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -37,6 +37,7 @@
 #include "hw/block/flash.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/bitmap.h"
 #include "qemu/timer.h"
 #include "sysemu/block-backend.h"
@@ -393,13 +394,18 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
 static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
 {
     int offset_end;
+    int ret;
     if (pfl->blk) {
         offset_end =3D offset + size;
         /* widen to sector boundaries */
         offset =3D QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end =3D QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
+        ret =3D blk_pwrite(pfl->blk, offset, pfl->storage + offset,
                    offset_end - offset, 0);
+        if (ret < 0) {
+            /* TODO set error bit in status */
+            error_report("Could not update PFLASH: %s", strerror(-ret));
+        }
     }
 }
=20
--=20
2.21.1

