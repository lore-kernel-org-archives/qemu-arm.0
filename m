Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2674227lfc;
        Mon, 25 May 2020 23:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyltECSNGN1uL2X2lMB7RWxix3W8SEE8UPXa3ueocrgshKF5DU6xkoXgQVrTrupqSWTusP2
X-Received: by 2002:a25:b9c4:: with SMTP id y4mr48878459ybj.349.1590474322376;
        Mon, 25 May 2020 23:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474322; cv=none;
        d=google.com; s=arc-20160816;
        b=A/oqAmzJFdCs9LBsoHLRL9MbvRc581L07s/hgWQT/AQc6eJLuPiRuA9wVxEaQR99kE
         zv4GrGeTj3Hxu4ueR0YfgJl/nHVIsiZnuSUI8oNaWVNGrK7fV50r7cg/cfrrlHX8SiP6
         m+/3uZ3jAajhQ/V9vvPV8qODYzL4f03Kl/NIiizITyUckva683qGwFPebuO9bgywTkV3
         SWEYCgGw7PSgEgvoExYZ++kPYwa/SgTo63APqfaw48/VIKT0wLfXWxDetrn9zkv1hmoH
         cr7jlNhBBS4GbYyZ6nsMObNbiYaMUiroBPyz78AIKJhMr1YFCaXVhl1oejCx+TOclo03
         CEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3Mw4XoFuB+WMIXi00bK5o6APoDCeHGuoxLk+0OqrWeM=;
        b=GxwpU6Yb43EUrVxhULC8c7x5fSXQbSS+qUbVMk4EulKg7NgJlm7LeMRhOutqriejPU
         XheyUmm8n8uknXVwZGyxpUncCjHXlJhLMhxxoXQ4ilIk2s3ohWYnRhbRhXVIKELx/dlo
         pzOeKsFUZwWI/dJCTHC1AkwBholUudz/7NI1IV0B3S+FKc8KfZmArRsHBw/L5OG4hxUC
         qgHLXK36LaCXmbNMZ7U9RX4XYpY8SgkWF+5XoJbOjqIIZCEJm+apbV4BqutYV3uHkjfZ
         cnZCD84AVNCu/BmFb+ja4VQetrcwi16XsxXc3WyyJZ5aS43Z9Qf4rfaF6clR/r+RuS3K
         uWLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X1w3KNPC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128si21306128ybg.350.2020.05.25.23.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X1w3KNPC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdT1d-00020h-Lb
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzV-0006se-Oy; Tue, 26 May 2020 02:23:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzU-0002UF-Tp; Tue, 26 May 2020 02:23:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x6so5575156wrm.13;
 Mon, 25 May 2020 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Mw4XoFuB+WMIXi00bK5o6APoDCeHGuoxLk+0OqrWeM=;
 b=X1w3KNPC/efOP9Dly5RnGNrJeg9gdhY5nYvcGiOrQpMarPEln6Gw1VEAldogOakJ+q
 4TUGOmFYEqk84i0Z+T2evAsj5JAHEGPB/L+3zZoQ/2TB+jEhsFuAsoDGAhYF5+rMxF1u
 Mwexl4jkGkI5ojlmg6jqYXB//tLp+a/011pgNbBO3Ktlt/aUIc8Qo0bK/JcZRALxU/2m
 gbyFLXsr0vvP+9/nCcQGEms+VtH9VtKzL3p+DHq7AXSX7cQIV/HmJHz9pCHBIX4SvHg9
 avODktTW23EG5wjK+2qhkMiVShnS8hYTDI/3PfDIJozIMr0+4ScyWbr7yCF8l5N3vSrn
 X1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3Mw4XoFuB+WMIXi00bK5o6APoDCeHGuoxLk+0OqrWeM=;
 b=C5ipFWyiK/ShNN2M/eEFSw0GIwyC7eoiQO6WnjrvMeT3sHxj5fZJUPfTROH7fi9WdO
 a5/DunsCO9deMKxFN+r8V/wmHno3bkV+Y8j74FoQxPNpyuVeF93Vhy7sYV8YT8g0PvyJ
 h/aOtETkcgO6ViWxP9YS22mdQyk7scHSW8JbaXTwMpNJbK8Y5Lkp2lP9ucqQDSjTJnk4
 95HU8164DmS+QGUuP3JYDTOG300i3j+dgsnMqc7tZ55UdoHOy6GBCOtV6aP6SvvVd0au
 lfedohVrhYufKudmIcxmcEJkTherkq5z/5lADIH0BQuVTBehOVT5LjvSZEP3gRkb+j9+
 jo2g==
X-Gm-Message-State: AOAM530OeVeL+vbdFzm+p3Fr0Kva5CBEDLwCYQCjt3CpSez/zEuOXG2f
 +ZJ8LpjbDk2l1AIHg4SZzEY=
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr7978941wrs.234.1590474186904; 
 Mon, 25 May 2020 23:23:06 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:23:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 08/14] hw/display/dpcd: Convert debug printf()s to trace events
Date: Tue, 26 May 2020 08:22:46 +0200
Message-Id: <20200526062252.19852-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IWutqWJZzLVH

Convert DPRINTF() to trace events and remove ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/dpcd.c       | 16 +++-------------
 hw/display/trace-events |  4 ++++
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
index 0c1b7b35fb..64463654a1 100644
--- a/hw/display/dpcd.c
+++ b/hw/display/dpcd.c
@@ -32,16 +32,7 @@
 #include "hw/misc/auxbus.h"
 #include "migration/vmstate.h"
 #include "hw/display/dpcd.h"
-
-#ifndef DEBUG_DPCD
-#define DEBUG_DPCD 0
-#endif
-
-#define DPRINTF(fmt, ...) do {                                                 \
-    if (DEBUG_DPCD) {                                                          \
-        qemu_log("dpcd: " fmt, ## __VA_ARGS__);                                \
-    }                                                                          \
-} while (0)
+#include "trace.h"
 
 #define DPCD_READABLE_AREA                      0x600
 
@@ -70,8 +61,8 @@ static uint64_t dpcd_read(void *opaque, hwaddr offset, unsigned size)
                                        offset);
         ret = 0;
     }
+    trace_dpcd_read(offset, ret);
 
-    DPRINTF("read 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", ret, offset);
     return ret;
 }
 
@@ -80,8 +71,7 @@ static void dpcd_write(void *opaque, hwaddr offset, uint64_t value,
 {
     DPCDState *e = DPCD(opaque);
 
-    DPRINTF("write 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", (uint8_t)value, offset);
-
+    trace_dpcd_write(offset, value);
     if (offset < DPCD_READABLE_AREA) {
         e->dpcd_info[offset] = value;
     } else {
diff --git a/hw/display/trace-events b/hw/display/trace-events
index bb089a5f5e..72d4c9812c 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -157,3 +157,7 @@ artist_draw_line(unsigned int start_x, unsigned int start_y, unsigned int end_x,
 # cg3.c
 cg3_read(uint32_t addr, uint32_t val, unsigned size) "read addr:0x%06"PRIx32" val:0x%08"PRIx32" size:%u"
 cg3_write(uint32_t addr, uint32_t val, unsigned size) "write addr:0x%06"PRIx32" val:0x%08"PRIx32" size:%u"
+
+# dpcd.c
+dpcd_read(uint32_t addr, uint8_t val) "read addr:0x%"PRIx32" val:0x%02x"
+dpcd_write(uint32_t addr, uint8_t val) "write addr:0x%"PRIx32" val:0x%02x"
-- 
2.21.3

