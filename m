Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5501466lfc;
        Mon, 15 Feb 2021 02:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2lmY9qx/MXuIwB0z46cNBPEVbXwWOOTgcJauggUZKHq+YBDCi4vusx3g3i1Gjhq1id4YQ
X-Received: by 2002:a25:c50a:: with SMTP id v10mr22897120ybe.186.1613385178824;
        Mon, 15 Feb 2021 02:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385178; cv=none;
        d=google.com; s=arc-20160816;
        b=kGLhVdFxq3GKA7M6nGYGe+Sckz0LK0OCaBZiWWpQ3nyHmUct2JzUsFAgrSrVIPyozq
         Zv0NZn3ifshDER4W5unsCbFB0xJmDK+2FM3RAbj0gBXbNqG/njqDjgOzKwkItyaOSFpa
         0xbGT49pmsagBvTmUBOSk/Q8R/8PESOzyehfXyJWjBCwreJoayuuzbowxefnXRJhd2gf
         gBdQogipSUkdFy9vL1tk1zk9FpKrsTC7TC8N8O5pjKwKd4wCiXiJmbXwu2akE64bfAIx
         uwl/nFClkUIVtRyVBytf4XVSugM4tiHiLYEp5mnUtn2l9oOsiV9H/z1T6czXZRBk9oUd
         cATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9bceLBdb3iGzpfJ2NpcGXJpz+JJSn554nq+lipt4b8U=;
        b=gY9fwFhc5OgNm25bkL7fqrlo6oJc6TyJj1UWOQW6Of9rrF9amC/36j/VuhuQcBF0Sg
         lOT5KQwwRsVR5BNc+LWhZTfj0CT762tPn093mPnuUk5sNae+zDD9XEokll5gqFbVvfUq
         mSkFwBbEc4VR8OXdx7qBi/vi9lL9JXMVRyQfGiHaxCwYgnleKZqXDbjjHgRYnBSTpRHw
         6uG8rCuH/zvvqArSigC1jvOHQLDLVXRXFr5w+ylVi0moaCzJCU64laimLo6UgD6w10HM
         YWrmHyi+CFJ5HguhSPV3WCu7q1ZaGMWShcdhI2K27qdQjCWkCW/j8XYleIzgOu+2RXfz
         FM7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSxolL9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si19416057ybj.81.2021.02.15.02.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:32:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSxolL9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbBa-0004R6-2E
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB5-0004KC-7L
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAz-0001gy-Fr
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id g6so8207792wrs.11
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bceLBdb3iGzpfJ2NpcGXJpz+JJSn554nq+lipt4b8U=;
 b=WSxolL9dBqJYDnTcboOhCriAiAv+qWe5xEakY2FqT2MDmz7K9m4YOpuUygqbUhEgKM
 SSoqvKddfiNOcvK+5LdxsasvEWt5v6KeLXWRQWy3+FWtF3pcR3Of4z0H03vnrxf8e5hO
 s01wPzgQpv4KKBjxep13VJSy4HgsS2ptzuH0JpDt4xnOU+jHGRqH7wqiFcKppFulHHwa
 zwWs1TNKgLakLfPDXkoIF5zp3czaFvmGQXQR1Ii9OTm9USA9A3XGOrP/HpyEQYgjbzJT
 CE++Cfh/70/wQML9IfV6uMsRLoC0mj3lgLsO6sueDVdgO6QbYSlkuVyN+OJi27F5d2IC
 cwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bceLBdb3iGzpfJ2NpcGXJpz+JJSn554nq+lipt4b8U=;
 b=RTXVox6u2Xk6HI+w60BocTLMY/4QaQ0d2awYjb1app7Mdx7fYFMWKtbYOo16PG3BR4
 7MgGsaYw0BBiyEofhAqxN6VJRViv3xTiyQuwpOXgkoFiRkT6ri27YlmCFGrxsFiZeo2g
 MNmGocnZR/XD5Gk+q7MAWIlw4VD7GrJqskbgU52C0TPFl4hc9xLwFPchvL4fKhDbbGmP
 LcZH4QG9UoQQ5haYeNrvSencsnTxlp190jNlfxSHgJBbQ4iCIz+pUitZJt1f5ilpT9id
 RSdlEZbMGBxT9jQqEqr3fPdrHFb/eKjCesHAMdnn2DVYnFhAra+BMxtp+igoSH+kd5dw
 iDtA==
X-Gm-Message-State: AOAM530is8XZi2VL8z6xRKlenhhOLDIcXOOapcyvjvuZAx9p85Tpa1dT
 kItju8hVhlVs2k2Vcw3C86/dmEAYeMp4UA==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr7496639wrd.304.1613385139338; 
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/display/tc6393xb: Remove dead code for handling
 non-32bpp surfaces
Date: Mon, 15 Feb 2021 10:32:08 +0000
Message-Id: <20210215103215.4944-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JrIwOJGk2rUt

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the tc6393xb display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/ui/console.h  | 10 ----------
 hw/display/tc6393xb.c | 33 +--------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..ed086f9f1ad 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -266,16 +266,6 @@ PixelFormat qemu_default_pixelformat(int bpp);
 DisplaySurface *qemu_create_displaysurface(int width, int height);
 void qemu_free_displaysurface(DisplaySurface *surface);
 
-static inline int is_surface_bgr(DisplaySurface *surface)
-{
-    if (PIXMAN_FORMAT_BPP(surface->format) == 32 &&
-        PIXMAN_FORMAT_TYPE(surface->format) == PIXMAN_TYPE_ABGR) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
 static inline int is_buffer_shared(DisplaySurface *surface)
 {
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0e..4cddb1a99ad 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -410,43 +410,12 @@ static void tc6393xb_nand_writeb(TC6393xbState *s, hwaddr addr, uint32_t value)
                                         (uint32_t) addr, value & 0xff);
 }
 
-#define BITS 8
-#include "tc6393xb_template.h"
-#define BITS 15
-#include "tc6393xb_template.h"
-#define BITS 16
-#include "tc6393xb_template.h"
-#define BITS 24
-#include "tc6393xb_template.h"
 #define BITS 32
 #include "tc6393xb_template.h"
 
 static void tc6393xb_draw_graphic(TC6393xbState *s, int full_update)
 {
-    DisplaySurface *surface = qemu_console_surface(s->con);
-
-    switch (surface_bits_per_pixel(surface)) {
-        case 8:
-            tc6393xb_draw_graphic8(s);
-            break;
-        case 15:
-            tc6393xb_draw_graphic15(s);
-            break;
-        case 16:
-            tc6393xb_draw_graphic16(s);
-            break;
-        case 24:
-            tc6393xb_draw_graphic24(s);
-            break;
-        case 32:
-            tc6393xb_draw_graphic32(s);
-            break;
-        default:
-            printf("tc6393xb: unknown depth %d\n",
-                   surface_bits_per_pixel(surface));
-            return;
-    }
-
+    tc6393xb_draw_graphic32(s);
     dpy_gfx_update_full(s->con);
 }
 
-- 
2.20.1

