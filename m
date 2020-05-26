Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2673097lfc;
        Mon, 25 May 2020 23:23:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUL6g/dGL1Mf2ej+/fevEISGw/I+M/l+LzGvugmwXnsMHejBAejLDm+WKH9FvlJWTONWz1
X-Received: by 2002:a05:6902:508:: with SMTP id x8mr48168882ybs.206.1590474202942;
        Mon, 25 May 2020 23:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474202; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYYaBfclFINGiADf4wUGcTTNnZ4HfRr0KOXGzPbSnl9kUR3ne+z5z922E8bu3JbK6e
         2gmGnb8FgmUQCTDqCoMJsWVtb3UQgZOyXHJZUMJAv4bE0l5dgnstd7xBE1kcx6rOzFML
         rAePKwvOFerXwiZcZs7a0JPp3fPboRTw9baz14DtMG4kx7KbMUHMGFZijSqIB19DVsFP
         7mM3yg6itEB51IZpcuzZcbo1ysSGQTWxSOheEOO19Hz7fqFdOqyVsIHo8D8b38BvzlIK
         drvJEe/fyo8se+YqFuVwEOocx3+v8Q1kFLDZYcX7ZYrNnpozBKkkGs3DLERAaT+ceTDY
         tIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cAS9vKi2N/HAp/t/0K9X49WNII1M7/uVCyjiDB52u+M=;
        b=iA5Db+YESY51y4n3Dh+yIR9pQznDyK0K2tYOi9w9bzHcs4zkSyO++3FaLbq6OBVDtJ
         7xF8POWwziea4vcetR/jDAEePDrideNkEPVEyzLIBkYS1jJabursu0edd/RNKuBcxVRP
         J9V96gOS9iRKV9bbZzRjnBjTN5C3zf7q8YB79lJ7FuO+3kziHRRwxPaQhWctB8Jhv6Kc
         Byxn5PcF5lJYQx3Qh7baRmkJ506hVmiI8Io9xcSJzOD4WKQgrIVUPifXrOCF7nDVknE0
         f2unI0yUfuK9xpA6UGOD/n1HGY+K1UaPSqbdNrxOMeucAcMwTIadmeMh93uY47V7BORY
         cZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TyjTa/Dj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s66si12415752yba.220.2020.05.25.23.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TyjTa/Dj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdSzi-000784-9m
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzP-0006bj-R8; Tue, 26 May 2020 02:23:03 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzP-0002TG-1q; Tue, 26 May 2020 02:23:03 -0400
Received: by mail-wr1-x442.google.com with SMTP id j10so3583918wrw.8;
 Mon, 25 May 2020 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAS9vKi2N/HAp/t/0K9X49WNII1M7/uVCyjiDB52u+M=;
 b=TyjTa/DjX6XKXLJv2jKOeTH3KRs9IkO/poDsu5k8Nndv2RPiiuNSCKRpy1lZcp/O+a
 ip3X+CMdZqolqMlTCEd5t+MMAFL60vkDnI+IWyk+q2p4507J2UNSNcNHbMvB9RYukDPL
 +5qErcgg0ZJ1Zk441ZHSOoxdWuaaO0ltFZp0mk74VQOkfqfh4LhZcHXfskrXQeVnnW3C
 9Lh7GwTNDX0wJruOSYc671TIN7yvi3NOx46n7eKrUV/LhuxiNzW64dDHS9hjzEc78dBr
 kex5/yYV/C7C7XdOQpSDhZsimB1OjaejlHa0eicWy/HZT18WrahpGlJx5AOTFMmdR4SP
 MTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cAS9vKi2N/HAp/t/0K9X49WNII1M7/uVCyjiDB52u+M=;
 b=SI3KYVstngmFv/DF7vg489PyUxEY8PMDk6VIDVcOYIN6U1EkfazZPiAYQKopjPOxOr
 29PEKxXQdEggI8uQq0UsNsTcaavdOuY9iNSZI0BmCwmk5mXb4SU7J+z8/twNGy5+avST
 /TpTSYdj6REl/ZoYm81JLrdt7V0SZTtf1nBRguxe+ppEpkw5NzHW0KfumydMPHsgl7+5
 dcjDSo8TrFsErweBAKE8Dn66PbGz6fchFhL/Xh2FiLdWnl2S1c8Gj71D+cc2T+JU5k8o
 2GRL+4bm0WuLl8v9C8ygDNSksxq8yA5bZV5VoG6+k5c/9Vy0PacxxsJLg3GBDiSQqMvO
 0zGQ==
X-Gm-Message-State: AOAM531ivOhFQ9iDEJxECBD66Ne/gAZtO5ejkbG5LKks+GH4u3z+rjfn
 kmBVEzA97SJ8bIwfzC3M3BCqYNpYVvQ=
X-Received: by 2002:adf:ea11:: with SMTP id q17mr16484093wrm.75.1590474181081; 
 Mon, 25 May 2020 23:23:01 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:23:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/display/cirrus_vga: Use qemu_log_mask(UNIMP) instead
 of debug printf
Date: Tue, 26 May 2020 08:22:42 +0200
Message-Id: <20200526062252.19852-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xs/0pTDD87ip

Replace some debug printf() calls by qemu_log_mask(LOG_UNIMP),
and add a new one in cirrus_linear_bitblt_read().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/cirrus_vga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 33ccdde000..f9f837b850 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -35,6 +35,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
+#include "qemu/log.h"
 #include "sysemu/reset.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -905,9 +906,8 @@ static int cirrus_bitblt_cputovideo(CirrusVGAState * s)
 static int cirrus_bitblt_videotocpu(CirrusVGAState * s)
 {
     /* XXX */
-#ifdef DEBUG_BITBLT
-    printf("cirrus: bitblt (video to cpu) is not implemented yet\n");
-#endif
+    qemu_log_mask(LOG_UNIMP,
+                  "cirrus: bitblt (video to cpu) is not implemented\n");
     return 0;
 }
 
@@ -989,9 +989,8 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
 	 cirrus_blt_mode & (CIRRUS_BLTMODE_MEMSYSSRC |
 			    CIRRUS_BLTMODE_MEMSYSDEST))
 	== (CIRRUS_BLTMODE_MEMSYSSRC | CIRRUS_BLTMODE_MEMSYSDEST)) {
-#ifdef DEBUG_BITBLT
-	printf("cirrus: bitblt - memory-to-memory copy is requested\n");
-#endif
+        qemu_log_mask(LOG_UNIMP,
+                      "cirrus: bitblt - memory-to-memory copy requested\n");
 	goto bitblt_ignore;
     }
 
@@ -2412,6 +2411,9 @@ static uint64_t cirrus_linear_bitblt_read(void *opaque,
 
     /* XXX handle bitblt */
     (void)s;
+    qemu_log_mask(LOG_UNIMP,
+                  "cirrus: linear bitblt is not implemented\n");
+
     return 0xff;
 }
 
-- 
2.21.3

