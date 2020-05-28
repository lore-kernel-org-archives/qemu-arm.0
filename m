Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp488330lfc;
        Thu, 28 May 2020 05:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrun9ODxOqGxI9BnVc117sW7nzISvM129iKaBmqfAUOMHxXYycz5erDOIBJbkTUQU9ai7k
X-Received: by 2002:a25:8094:: with SMTP id n20mr4683929ybk.304.1590669858505;
        Thu, 28 May 2020 05:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669858; cv=none;
        d=google.com; s=arc-20160816;
        b=yg+bCEzLs9pocnmiWWiUjQx5s5OLd12rBV+FS8c4KMSxmro9qc81RDP2CsYdDTVM1S
         w1pQp12QlWShNMKLdyCkHlJAXVkye3yUyW6UJsRDDMGRguUQ9vIyH36sd7s3yfhjUlZq
         A1cvmC+W9Lwfa6JEvKiDXOrJy7qz/PCyuyX5tLYOLofzmagupjlvwwqbfEchNO59l8HY
         9JobAO6MUtklTrRfgHJE1clXUuumjSpCgCbUNj/ilCgdT3Nu8AvO01nu2ajnUPxzKgYD
         NxuhBFOLr/JiBkGJtv//X4l8DZ3m84/Sw62vLhYhpaIJSdKPu5tz1t8+CuiHSj/blaRe
         2+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FTTWm2Ie3ZetkYcgR/YsLvRvE6iLrx2iZOgaTJeYsuo=;
        b=D2HoRN8Jg+/V1IKcK97cgk2Ez1E0Z8Z3BbBg//pJ+/hO74bUavaB1L9eNkM7jEm4LF
         rVc1rYf5KuEGCgSwBACBGumv1egfP4H+8PNsQ7aZM1mSh/OoSSxCkh8RAfFef0NAubYl
         6/jiW2vfcOslc2q3aApYryXsXNQmqcJeXNWWIY7yDYDTGB+dNENspi5WxnvLwjxT36Zz
         SYUUu3hdMAa9Oas0V68yd2wapvnbnR1y1sdQhPul/Q9vU+/Zszwz3Nbxgk0V+PYrycSr
         B/bEb5736MV6bKM3aO4VJF+yPgeungB+stplPRa1Z9hN9t7hCPAPnKb0S48q+342TlFs
         RMSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEtR0Yee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t60si5354436ybi.392.2020.05.28.05.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEtR0Yee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHtR-00024k-Sb
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHly-0001pJ-1w
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58853
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlr-0005Ct-NS
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTTWm2Ie3ZetkYcgR/YsLvRvE6iLrx2iZOgaTJeYsuo=;
 b=YEtR0YeeCHy33ZC7cz110CQGB4nG/VlQUNm0X4W5s+tW/+jUrZTzyGeHovQKOt5ABC0u7k
 vYADVK9KthLmEOQxY21ciGFbubwVSGiSbt7jtj9NtSZ3AdifEOrd1mimyiv9NenXw+ILXO
 YmdfRIo4XfVdEg43EZGdIwkl9+srBQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-WqQZlz30MHmC6OHdIHC5jw-1; Thu, 28 May 2020 08:36:22 -0400
X-MC-Unique: WqQZlz30MHmC6OHdIHC5jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65DD3835B40;
 Thu, 28 May 2020 12:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBBFA610AB;
 Thu, 28 May 2020 12:36:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6F089D59; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] hw/display/vmware_vga: Replace printf() calls by
 qemu_log_mask(ERROR)
Date: Thu, 28 May 2020 14:35:58 +0200
Message-Id: <20200528123609.27362-11-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNmAcYk9vvn4

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Avoid flooding stdio by converting printf() calls to
qemu_log_mask(GUEST_ERROR), which are disabled by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-11-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vmware_vga.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 58ea82e3e581..5c0fc49d9d6e 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -26,6 +26,7 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "hw/loader.h"
 #include "trace.h"
 #include "ui/vnc.h"
@@ -953,7 +954,8 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
             ret = s->scratch[s->index - SVGA_SCRATCH_BASE];
             break;
         }
-        printf("%s: Bad register %02x\n", __func__, s->index);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register %02x\n", __func__, s->index);
         ret = 0;
         break;
     }
@@ -1002,7 +1004,8 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->new_width = value;
             s->invalidated = 1;
         } else {
-            printf("%s: Bad width: %i\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad width: %i\n", __func__, value);
         }
         break;
 
@@ -1011,13 +1014,15 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->new_height = value;
             s->invalidated = 1;
         } else {
-            printf("%s: Bad height: %i\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad height: %i\n", __func__, value);
         }
         break;
 
     case SVGA_REG_BITS_PER_PIXEL:
         if (value != 32) {
-            printf("%s: Bad bits per pixel: %i bits\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad bits per pixel: %i bits\n", __func__, value);
             s->config = 0;
             s->invalidated = 1;
         }
@@ -1082,7 +1087,8 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->scratch[s->index - SVGA_SCRATCH_BASE] = value;
             break;
         }
-        printf("%s: Bad register %02x\n", __func__, s->index);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register %02x\n", __func__, s->index);
     }
 }
 
-- 
2.18.4

