Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3020129lfm;
        Mon, 22 Jun 2020 02:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSt1u9dLLC/4A+1+r/6IaeoSJUs0zuS/4EzskVFiVukQAzBbKqFCg9UinMU8Z84Rqt3Cbp
X-Received: by 2002:a5b:f4e:: with SMTP id y14mr26313329ybr.399.1592819177640;
        Mon, 22 Jun 2020 02:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592819177; cv=none;
        d=google.com; s=arc-20160816;
        b=LXhVasIw9yCc/KlVlfKlR1xEpXXhtYt5Ot442F9z68e1efv0Mwkvn168vmu1Xt164c
         QZUuhl2DU+XxJSD4tHNYJxpqclNNtqXqRlbg104xCR0nFACDNyKOBx3RoLxyRACD8wh5
         KIwObJDHlNOw3jGMfPHMVf0XbQJWMlUEsGSP2PBYl0OJV0S2XLcTU04zq0LkmK1FtrXD
         ZOnz8uPX+ab8YQ83c9sPFn88DtHn/JyR27rEjMe4xlVl+zcR6F1tylB17V+lsClNhxiJ
         wB4fZSpSAKI4+cjokZVpSHdoHJb8Pbu0HeeL1AiRgyLru6knkV/7hXTfHTTfU2WJPIeY
         2sxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=a4siptWoDZuGpwrrvt98Vfg4/h8SgZLNu0DV6Qu0HXA=;
        b=Tp7NFtG3q3pS4bemQDyEd43m3spWeBx4BlgJrhZQw64XNo4x8OjqbocWtcVIwibalC
         IMlqHv/ZCKIfomop+QhJxRiUXZt6B90+EbgEqZs6LJZLUHDRBoXXPS5z38DO1A/EEQT6
         W6SEKKWDXA6Vt9O0aCubKQfNmgrknNJ9q/dsA9MBg4HFquD6lBD0mgAlAH2L1kCZXCzM
         qr/YHHrUevX4mUv72lx42AHZ2AbXgOWUey5hwt1O0O5vV6bCwG9ddrsgRCa2FAfJXyhl
         CYALg/X6kAnq483eL9eofWQytPgDF5gOKpciHeLHXocJtBQ89/r/LR/Zu0x/UrYQotIM
         Tpsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QxtUzxkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si14228085ybe.344.2020.06.22.02.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 02:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QxtUzxkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnJ1s-0000qf-Ty
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 05:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyT-0001pv-BI
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 05:42:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42267
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyK-0003wV-2s
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 05:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4siptWoDZuGpwrrvt98Vfg4/h8SgZLNu0DV6Qu0HXA=;
 b=QxtUzxkXySwz5O9JtoB+NbbdBCL8+cFKFrH/bO+TGPBzukzRtJ6h4dSR85lUotxb3gJ2my
 8JGVL/2/sB53zLnbXB++Zf+ed0aErQ9Y8MOMJMfGMrX0PVsTrm3ro/0EQDJzTOhRqc31p9
 YmHFEe5cte2YZOvPLzLr0t0s54Vw9uY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-KorycQmEPdKVajFaO7nEMA-1; Mon, 22 Jun 2020 05:42:33 -0400
X-MC-Unique: KorycQmEPdKVajFaO7nEMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D358064D8;
 Mon, 22 Jun 2020 09:42:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CD75D9D5;
 Mon, 22 Jun 2020 09:42:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 222C9113847D; Mon, 22 Jun 2020 11:42:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/16] sd/pxa2xx_mmci: Don't crash on pxa2xx_mmci_init()
 error
Date: Mon, 22 Jun 2020 11:42:26 +0200
Message-Id: <20200622094227.1271650-16-armbru@redhat.com>
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
References: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 mreitz@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGB9wraM/lRG

On error, pxa2xx_mmci_init() reports to stderr and returns NULL.
Callers don't check for errors.  Machines akita, borzoi, mainstone,
spitz, terrier, tosa, and z2 crash shortly after, like this:

    $ qemu-system-aarch64 -M akita -drive if=sd,readonly=on
    qemu-system-aarch64: failed to init SD card: Cannot use read-only drive as SD card
    Segmentation fault (core dumped)

Machines connex and verdex reach the check for orphaned drives first:

    $ aarch64-softmmu/qemu-system-aarch64 -M connex -drive if=sd,readonly=on -accel qtest
    qemu-system-aarch64: failed to init SD card: Cannot use read-only drive as SD card
    qemu-system-aarch64: -drive if=sd,readonly=on: machine type does not support if=sd,bus=0,unit=0

Make pxa2xx_mmci_init() fail cleanly right away.

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/sd/pxa2xx_mmci.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3407617afc..68bed24480 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -18,7 +18,6 @@
 #include "hw/arm/pxa.h"
 #include "hw/sd/sd.h"
 #include "hw/qdev-properties.h"
-#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -483,7 +482,6 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     DeviceState *dev, *carddev;
     SysBusDevice *sbd;
     PXA2xxMMCIState *s;
-    Error *err = NULL;
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
     s = PXA2XX_MMCI(dev);
@@ -496,16 +494,9 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 
     /* Create and plug in the sd card */
     carddev = qdev_new(TYPE_SD_CARD);
-    qdev_prop_set_drive_err(carddev, "drive", blk, &err);
-    if (err) {
-        error_reportf_err(err, "failed to init SD card: ");
-        return NULL;
-    }
-    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"), &err);
-    if (err) {
-        error_reportf_err(err, "failed to init SD card: ");
-        return NULL;
-    }
+    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
+                           &error_fatal);
 
     return s;
 }
-- 
2.26.2

