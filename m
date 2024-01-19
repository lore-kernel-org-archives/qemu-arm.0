Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878411ejg;
        Fri, 19 Jan 2024 03:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5Fl58KqPL2GDdQazhkBuWBxTVeLIQ5D11+cdWc+2yj+fY42e600jq9onAO+V+/4IrFni4
X-Received: by 2002:ae9:e646:0:b0:781:193c:9a83 with SMTP id x6-20020ae9e646000000b00781193c9a83mr1086883qkl.72.1705664167026;
        Fri, 19 Jan 2024 03:36:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664167; cv=none;
        d=google.com; s=arc-20160816;
        b=N1TokiKWXdTcB3IbWMk6Ji7QhBSg/z8dguxgb691/mbkpOpCI6qYok8DmYDG3XxlNl
         hxZ8hEBN1C6RSqbd6udjNYUd7+4UN4e7OCQRPbE4UwGCO12X7POVxyj/RpQBIzvA77UH
         UBgw6NmEXSXsww2hPuiSp1eOlaSxhKwQNPxslsAdC5fF2pHZfOZh+Plp6bmM/IiV86P6
         AnSoes+5Le8Z4BjZTSFWfk+0RV8hmnepctapKc6g8kJkJpLDKQgifduWiL1jtEMz35PK
         S7i9dS8cwe5M3RJMBs5xUtmVe9HQLaVqzlBQIVtzPqxBOQX6kRGFbWJzHdzUDHngqQcR
         p2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7/u3zpIICoMRx+hk0gsj8/1K/WruFMiJJIe2/2+mB0M=;
        fh=6tP4L9XjCvdhkEFVfS9C+TY7ruUfmb06A1hD+CUqGXU=;
        b=gFDdif1B5TgFALUOsz1Llz8qr+BniYHoauWsRvL6W5dzZMlNmuSVEonjWhWUGuXe1k
         zAulb9Btx31yCVvYcn0FlyrMvQ95w6AnDrUxeZJjQpDJ+nCS8MeF+bfgjDd3xnq5abBA
         9Z4EYvzhIIrRQaglBFNcv3W/qmlRXb5yUCbozD1KOdCnejPdlf+9jX/kMYYhWr7FJYwa
         +CRpit7gaEM75TlQC+f1HhwM89P7N9Um+I8iHh74P6aVirEM6spD5tSjwNDOZglAq6KE
         xD8dGalh99KTfEZYSu1b5IZvLeauJfpW15L8YkhevgAT7+1NFTI0YVdWjT8bPNlKtR0F
         aBiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhwK7cP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs7-20020a05620a394700b007816c894164si17509302qkn.370.2024.01.19.03.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:36:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhwK7cP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnA9-00025g-VY; Fri, 19 Jan 2024 06:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA8-00023N-Hj
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA6-0000d3-RN
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso4012065e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664149; x=1706268949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/u3zpIICoMRx+hk0gsj8/1K/WruFMiJJIe2/2+mB0M=;
 b=QhwK7cP5DoX1xzoqiuN9TK6m7HDpFJy6312Tmp8XlpxCNfM28jUO9G07cGF9UZr7jD
 +Sw/s+8zchXnrNeN+joMYVpaZjBht3yr46fM5BuC6/YF/gapLhGEKGwOmDBaVdRmZSBe
 Hthn3CndVy8Wzy6a6zivzA7dkS+ct04rjiR/3XIFfLq/CBtDdpxZ5zFoKJesA9HImcfV
 9XnPXNWPn1gu25VfRsgQ1Ef0c82ybKNDin9PiuWXQyBNaJ1kEzJ28MbAFQnxuohj+J4o
 hWE3HEbZhEgc3NT80EXFRJiequu0iS/u1TgCHHpUN11fPjP1npe4iiUZ89aqe7AAAQRk
 D79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664149; x=1706268949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/u3zpIICoMRx+hk0gsj8/1K/WruFMiJJIe2/2+mB0M=;
 b=vH4FDa7j4hGFMs0mSjSU009DFMnoRM+C5pd4vJx4yIqwIry7wiBG3E1I8RLAvJ3yub
 YfK0dmQ7aBfPvs7clwtoqpVAgbwjyo1baKWVtlLeth3k6LtWUHTDRcIJMZFNZHen7xwp
 v4lkAdDVSwLYhFRcZOVKlPB4SZOuGtO/rDyYzm9X24JE9PEIDJtKkpLy3Y6jZSwa1vJZ
 VJkgNQVSsSxz1egh6sNsqpR6N6NBQ28g3iJ3brKi8fMsaocG+BBDhH9NXSAgDGqPyUqo
 3gsc9Rji9n+fPDwsYOhrU57F2oaJimvbJ0HiXwkNfGRRMKQw9yDq1ZK8eOo0Kffr0J8p
 jglg==
X-Gm-Message-State: AOJu0YxNlyUYmoX3NTQw8IXgdww4NuTtx9MV8ppUZz6VBxbuLatYBaBr
 o5P8q0zj152BPpIsuBejNky2tuIaf4/TkqVETc5jQWGmj+uBSVDhIWclNEse+bi1pYpYLKj3VGA
 qBaD8oQ==
X-Received: by 2002:a05:600c:2291:b0:40e:937f:16d8 with SMTP id
 17-20020a05600c229100b0040e937f16d8mr521040wmf.50.1705664149390; 
 Fri, 19 Jan 2024 03:35:49 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040e42391a12sm28532878wmo.13.2024.01.19.03.35.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/36] target/alpha: Extract clk_helper.c from sys_helper.c
Date: Fri, 19 Jan 2024 12:34:38 +0100
Message-ID: <20240119113507.31951-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U+s9lBv65uz9

Except helper_load_pcc(), all helpers from sys_helper.c
are system-emulation specific. In preparation of restricting
sys_helper.c to system emulation, extract helper_load_pcc()
to clk_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231207105426.49339-2-philmd@linaro.org>
---
 target/alpha/clk_helper.c | 32 ++++++++++++++++++++++++++++++++
 target/alpha/sys_helper.c | 15 ---------------
 target/alpha/meson.build  |  1 +
 3 files changed, 33 insertions(+), 15 deletions(-)
 create mode 100644 target/alpha/clk_helper.c

diff --git a/target/alpha/clk_helper.c b/target/alpha/clk_helper.c
new file mode 100644
index 0000000000..26ffc231cd
--- /dev/null
+++ b/target/alpha/clk_helper.c
@@ -0,0 +1,32 @@
+/*
+ *  QEMU Alpha clock helpers.
+ *
+ *  Copyright (c) 2007 Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "exec/helper-proto.h"
+#include "cpu.h"
+
+uint64_t helper_load_pcc(CPUAlphaState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    /*
+     * In system mode we have access to a decent high-resolution clock.
+     * In order to make OS-level time accounting work with the RPCC,
+     * present it with a well-timed clock fixed at 250MHz.
+     */
+    return (((uint64_t)env->pcc_ofs << 32)
+            | (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) >> 2));
+#else
+    /*
+     * In user-mode, QEMU_CLOCK_VIRTUAL doesn't exist.  Just pass through
+     * the host cpu clock ticks.  Also, don't bother taking PCC_OFS into
+     * account.
+     */
+    return (uint32_t)cpu_get_host_ticks();
+#endif
+}
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index c83c92dd4c..98d9a0fff7 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -27,21 +27,6 @@
 #include "qemu/timer.h"
 
 
-uint64_t helper_load_pcc(CPUAlphaState *env)
-{
-#ifndef CONFIG_USER_ONLY
-    /* In system mode we have access to a decent high-resolution clock.
-       In order to make OS-level time accounting work with the RPCC,
-       present it with a well-timed clock fixed at 250MHz.  */
-    return (((uint64_t)env->pcc_ofs << 32)
-            | (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) >> 2));
-#else
-    /* In user-mode, QEMU_CLOCK_VIRTUAL doesn't exist.  Just pass through the host cpu
-       clock ticks.  Also, don't bother taking PCC_OFS into account.  */
-    return (uint32_t)cpu_get_host_ticks();
-#endif
-}
-
 /* PALcode support special instructions */
 #ifndef CONFIG_USER_ONLY
 void helper_tbia(CPUAlphaState *env)
diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index d3502dd823..ea252c99a5 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -4,6 +4,7 @@ alpha_ss.add(files(
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
+  'clk_helper.c',
   'int_helper.c',
   'mem_helper.c',
   'sys_helper.c',
-- 
2.41.0

