Received: by 10.25.21.96 with SMTP id l93csp539291lfi;
        Fri, 17 Jun 2016 21:06:03 -0700 (PDT)
X-Received: by 10.13.237.130 with SMTP id w124mr3055505ywe.248.1466222732998;
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com. [2607:f8b0:4002:c05::242])
        by mx.google.com with ESMTPS id w125si7566162ywc.204.2016.06.17.21.05.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) client-ip=2607:f8b0:4002:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x242.google.com with SMTP id b75so10800166ywe.1;
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IeskbTnnZFI33w8YztYnKUdHGvwGRb8S1dtITSiNuXg=;
        b=di6Q5MRQSr/5FNp9CIn9AV9hnAsDovD2c1hWPQQdoPx6RwnuOMHUsjjpI3GLhCzkvq
         5Uz9IAzyMZXll46k82l6PgMDNE3b/8o+0l2WNO0UHR18Q0WW/jdo4fGPvyhqb1kSflno
         Lw4wdU+BkG4FJvC1NotL7AFN1IBqC6eOUk7UfMysy68mnqqp8m14OPLmD5ikhbLAgl1o
         L2OxRQmkNSaEn2G4cNZtUjz+VNZLdSzIr4oil4Ks74f4odmMwzrvM4mZv+Gg8938V0uE
         fsXe2tdElEis08huukO3w6uQhz8z/WlNU5/57FwV0/f/rGnFvBwUWMEWBkloo6Y4C9vK
         87nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IeskbTnnZFI33w8YztYnKUdHGvwGRb8S1dtITSiNuXg=;
        b=I6Sm2kbzf0EacSn2YovhkaEeIpRfE7+VjZrOEBah34AUubRo0o+CcEpnPGbFQ6pUk9
         S37/aa4NAVHBH5nxlSVCidNDrMwsKU3FN+DkyJfN3XDXm6jSPTu+huL0SE7oI+laFZYh
         OSgbOR2J/FKds++CV+77SukMzzr+4xCL3pkzATjJxdFMm6V7h9WbyGiSBQxy+qAwHh7X
         +Ax4Mn/oPsBiCWbXyjEPMJeU1PDQL0wNTZE1mfz8vBAcrz5kkGusmK0ThZcAAZZKW5qN
         GrQLYPFGNKfmWtm2RZ63jW6Bw91Rpc//gm0l61GqgQV2ZI/ZFYajlcVo5tyv1Iw0PbyX
         Clxg==
X-Gm-Message-State: ALyK8tKZPe3BykObbz0BfOib915fGLz/xYJh6AxP8WRjoFtXCD6G2N3B9DFR1HzUuq8n4Q==
X-Received: by 10.129.125.139 with SMTP id y133mr2848879ywc.151.1466222732674;
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id q7sm19517992ywg.16.2016.06.17.21.05.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net
Subject: [RFC v3 PATCH 13/14] aarch64: Generate fences for aarch64
Date: Sat, 18 Jun 2016 00:03:42 -0400
Message-Id: <20160618040343.19517-14-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160618040343.19517-1-bobby.prani@gmail.com>
References: <20160618040343.19517-1-bobby.prani@gmail.com>
X-TUID: vXzKIieQCZDe

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target-arm/translate-a64.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index ce8141a..fa24bf2 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1250,7 +1250,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
         return;
     case 4: /* DSB */
     case 5: /* DMB */
-        /* We don't emulate caches so barriers are no-ops */
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         return;
     case 6: /* ISB */
         /* We need to break the TB after this insn to execute
@@ -1855,23 +1855,31 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     }
     tcg_addr = read_cpu_reg_sp(s, rn, 1);
 
-    /* Note that since TCG is single threaded load-acquire/store-release
-     * semantics require no extra if (is_lasr) { ... } handling.
-     */
-
     if (is_excl) {
         if (!is_store) {
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_ACQ);
+            }
         } else {
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_REL);
+            }
             gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         if (is_store) {
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_REL);
+            }
             do_gpr_st(s, tcg_rt, tcg_addr, size);
         } else {
             do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_ACQ);
+            }
         }
     }
 }
-- 
2.9.0
