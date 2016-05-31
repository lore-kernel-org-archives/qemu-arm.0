Received: by 10.25.27.66 with SMTP id b63csp2226118lfb;
        Tue, 31 May 2016 11:40:38 -0700 (PDT)
X-Received: by 10.37.79.194 with SMTP id d185mr13947887ybb.126.1464720031807;
        Tue, 31 May 2016 11:40:31 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com. [2607:f8b0:4002:c05::243])
        by mx.google.com with ESMTPS id n186si17709565yba.54.2016.05.31.11.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2016 11:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) client-ip=2607:f8b0:4002:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x243.google.com with SMTP id y6so20073845ywe.0;
        Tue, 31 May 2016 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ELw57VLifnE6JQ9soZ0ti7Gz1tzF1SZDhJvNp1xS1Vc=;
        b=COpwBLTWIuzBvjtWH5t9VeJjBrBRm7qrNMqRtds3Z9Z9Rx8YG9ghfrKDT+KxB3pksD
         Km2IR+gt2+ZcGRJiw+IB1vjQwg7EZDXTz7jSFlTKUQZ6O+PhkAfwewBW3pa+vfWXtV7C
         l+a+zlGneF7e8eKweih+mLMXJLvruzy8efXlHBUCFj1TYl58VIwEQdecQSiu1L2aG4Ko
         iGz/OuFh5T/dPRZ3mjYoueVdyaV3C4/wybSN/PTC7pvDh+B3mhkCcAOpip9gov4pij6c
         NaaNaNNziu1VNZTwvcwQX8/+Y0fBynL1knP5d6ScW8VmnhcB6dLzN/+Bq686dNs19NPb
         FFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ELw57VLifnE6JQ9soZ0ti7Gz1tzF1SZDhJvNp1xS1Vc=;
        b=h7A7Spyw8zys554rJJiYeWERA+x1Uf0lWUe6xqoCG8jj8gLNyPaCOR1kFY538N9nxC
         4SEA2aL0blYILSBQvihaJEXR8GvYrtSuHai3CmjY2lUfDcWoWmCSVe3H1azxb5YAz+oe
         HPOE6H7qDrQvaRrrTwTwxi2V8YiXmJOBoAcnBNjX+YG9adjsJMxTjZSNDDs9OucX/Bia
         lxS6ctao6RdBfk6vvpeo3wrOAAg0ZOzDpxmJ8dNqaE565SUUKksH3ur8O4/SbMz2rVUy
         GKa5JZo6Xf+6nVSRTztstMsa6Jjy36NtUCGxeE7mt5CXZAEvCpwh0QNjmTSXGQEBlGx7
         23EA==
X-Gm-Message-State: ALyK8tIjTDZpjbC5XSWI0DIleqy3Vpek7G4BfnvqR1wJtNn4xuFsWycBOZzUr9K/O9aQ0Q==
X-Received: by 10.37.71.3 with SMTP id u3mr21083569yba.36.1464720031493;
        Tue, 31 May 2016 11:40:31 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id c62sm17150085ywf.12.2016.05.31.11.40.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 May 2016 11:40:30 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:AArch64 target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@linaro.org,
	qemu-devel@nongnu.org,
	Claudio Fontana <claudio.fontana@gmail.com>
Subject: [RFC v2 PATCH 03/13] tcg/aarch64: Add support for fence
Date: Tue, 31 May 2016 14:39:18 -0400
Message-Id: <20160531183928.29406-4-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531183928.29406-1-bobby.prani@gmail.com>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
X-TUID: N/TYQYnkBV+3

Cc: Claudio Fontana <claudio.fontana@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 tcg/aarch64/tcg-target.inc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 08efdf4..c361a5c 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -360,6 +360,9 @@ typedef enum {
     I3510_EOR       = 0x4a000000,
     I3510_EON       = 0x4a200000,
     I3510_ANDS      = 0x6a000000,
+
+    /* System instructions.  */
+    DMB_ISH         = 0xd5033bbf,
 } AArch64Insn;
 
 static inline uint32_t tcg_in32(TCGContext *s)
@@ -1625,6 +1628,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
         break;
 
+    case INDEX_op_mb:
+        tcg_out32(s, DMB_ISH);
+        break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
@@ -1749,6 +1755,7 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
     { INDEX_op_muluh_i64, { "r", "r", "r" } },
     { INDEX_op_mulsh_i64, { "r", "r", "r" } },
 
+    { INDEX_op_mb, { "r" } },
     { -1 },
 };
 
-- 
2.8.3
