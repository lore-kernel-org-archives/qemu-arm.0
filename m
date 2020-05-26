Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2676550lfc;
        Mon, 25 May 2020 23:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpc3nGGnMzBH6D4QkXq4tVhzZpsOplZ4DhcMnmTrQqDHrALHJif+n+YYF/xAT8Ce0nj4Lk
X-Received: by 2002:a05:620a:158d:: with SMTP id d13mr22095343qkk.327.1590474589865;
        Mon, 25 May 2020 23:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474589; cv=none;
        d=google.com; s=arc-20160816;
        b=B841I8BBi1149/keQnRvVDYWMcMToFT7wPI7ltAmch1YIN3FvxZMMX918Fz5UMEynC
         /qrmMDmwKx09iP9V/G9RLsfyrR1lytRQ24hOQrsBcCJvJfd29znTQLjl6ZbwPNmO8MLY
         Q4ppt1bU9CSPHDUevPgrAFDxZvl6/D6tfpNOzNXGhy/Rn5LU2DpPyW12avx5BZTArKzt
         SyPuiPWp8Pl9qU9udgr8EA7ifp7AATZSbSjfZVxEWHhR3Kwl9PgCWkmfYiqj70PciJfg
         z72vvWv6IoONR/bm87emXqr4F9x2TBUG3aabp42+ExL7dpJ8R6cNNOHVA56o5st/PQpS
         Rh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yn9oNpTD/XdTf2DEjAkyFUg8dJuNz3jGF81w8HFPrT8=;
        b=RubsMBzvEoVecVjaJXEru1JkI8auD2LD5KfcDuWa01J3nyvwGg1bg5DkGz9OWN+wcm
         jdC6hhr593huYhh0HIaHqI7rdRRQXFfe1q7HhfQpN9qAQ6m74pFBKhINt5rtPIguBWg7
         YaNEO5JbSw1Y0s68c1fs81zQMKQ920NTkMdkoIx0coelQ0u8acQNhkxDgf4UqwvYuMM/
         37Bjt1KSXOzbzZTJz22NMVFFsd4z55ycNlUWuarlFmyGeYnRr8XZE5bJWybuVLImgxZs
         25BFKMgZnHXU8aBS6isVM1y5nZ5u7wXbXqPJqQcFBHf3aMOR0at2Jd5i977CpUXGolvm
         eUFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cj+Z5OJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si6149673qtn.206.2020.05.25.23.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cj+Z5OJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdT5x-0000sB-9Y
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzX-0006wN-0s; Tue, 26 May 2020 02:23:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzW-0002UQ-88; Tue, 26 May 2020 02:23:10 -0400
Received: by mail-wr1-x442.google.com with SMTP id x13so4549745wrv.4;
 Mon, 25 May 2020 23:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yn9oNpTD/XdTf2DEjAkyFUg8dJuNz3jGF81w8HFPrT8=;
 b=Cj+Z5OJDXje6OrxIPtC/pOTk/A8GILcMS8bEqcnmQs8Xd7Bt4SdPNteB3iLgzsCTYr
 0r907ofrtp2JZkANGLQ85LK+xQWP4leINpXeqTSvND/KOIw3jpIT87ISFVZI9+fDKdKd
 jH361tcM8Rv52EfgDlMbSUX/cDiKplWsPfAdX9zje740JI20TzsLsAZuIXqvhi/YXUkN
 5JSmipdY2jv5dAx5s/69+CH11WnUGYMkdaC8kEkw3iFTIM3cWhXHeFLg+MRBRskPC/uW
 mIOcuSmhxUtVNcDZHVix6+Y224wF2qTdPmnWk9h9298Kp/j2igjMfOrZJy7CoJHjcDVe
 WDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yn9oNpTD/XdTf2DEjAkyFUg8dJuNz3jGF81w8HFPrT8=;
 b=FIA6A9yBCtfpfRWipcgG/E2WIWPBt+a10v9UJgR7eT3BggzqbWxuZetJm2xmsrpT9L
 YYgeYWwycxBUEczWtArChFzUcCpQL8QxXhpAH0A/CD6vTY8j9qp42+kb0nDlBbpJZ2sA
 kwi5MlR/vZfNvEZnFokNAt9IH1qJsWbHvEdj1Pxv2PyWQX5buxGPV1epWg7337MSKUAk
 mvaaXk3tpeYfv54Nlr3mHKiw4+aIws0P9qaChsCWsrDlQkSohn+1dzHhNMbEIjNOOeg7
 cab5qJFAfa6YCkT9GelAFJjKdVjP+w7MubPCQz0NOwbxJUg42ki0NDCMhRV8DHSMSYYo
 o4zQ==
X-Gm-Message-State: AOAM533z+NSFCLBPHAhYXOfd+OU91HJhyRdQJMW97K33lXr/mv7wFfqV
 wr/QaC/oUkX/M3sgVK/i6KE=
X-Received: by 2002:adf:92c1:: with SMTP id 59mr4016354wrn.401.1590474188282; 
 Mon, 25 May 2020 23:23:08 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:23:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 09/14] hw/display/xlnx_dp: Replace disabled DPRINTF() by
 error_report()
Date: Tue, 26 May 2020 08:22:47 +0200
Message-Id: <20200526062252.19852-10-f4bug@amsat.org>
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
X-TUID: Ulsxhea8BInK

DPRINTF() calls are disabled by default, so when unexpected
data is used, the whole process abort without information.

Display a bit of information with error_report() before crashing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/xlnx_dp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 3e5fb44e06..8d940cd8d1 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1,5 +1,5 @@
 /*
- * xlnx_dp.c
+ * Xilinx Display Port
  *
  *  Copyright (C) 2015 : GreenSocs Ltd
  *      http://www.greensocs.com/ , email: info@greensocs.com
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/display/xlnx_dp.h"
@@ -465,7 +466,7 @@ static uint8_t xlnx_dp_aux_pop_tx_fifo(XlnxDPState *s)
     uint8_t ret;
 
     if (fifo8_is_empty(&s->tx_fifo)) {
-        DPRINTF("tx_fifo underflow..\n");
+        error_report("%s: TX_FIFO underflow", __func__);
         abort();
     }
     ret = fifo8_pop(&s->tx_fifo);
@@ -525,6 +526,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
         qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
         break;
     default:
+        error_report("%s: invalid command: %u", __func__, cmd);
         abort();
     }
 
@@ -631,8 +633,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
         s->g_plane.format = PIXMAN_b8g8r8;
         break;
     default:
-        DPRINTF("error: unsupported graphic format %u.\n",
-                s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
+        error_report("%s: unsupported graphic format %u", __func__,
+                     s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
         abort();
     }
 
@@ -647,8 +649,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
         s->v_plane.format = PIXMAN_x8b8g8r8;
         break;
     default:
-        DPRINTF("error: unsupported video format %u.\n",
-                s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
+        error_report("%s: unsupported video format %u", __func__,
+                     s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
         abort();
     }
 
-- 
2.21.3

