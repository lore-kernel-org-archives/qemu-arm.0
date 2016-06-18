Received: by 10.25.21.96 with SMTP id l93csp539145lfi;
        Fri, 17 Jun 2016 21:05:29 -0700 (PDT)
X-Received: by 10.129.156.78 with SMTP id t75mr3197192ywg.295.1466222723994;
        Fri, 17 Jun 2016 21:05:23 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com. [2607:f8b0:4002:c05::242])
        by mx.google.com with ESMTPS id w190si14491893ybc.219.2016.06.17.21.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 21:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) client-ip=2607:f8b0:4002:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x242.google.com with SMTP id z186so277158ywd.2
        for <alex.bennee@linaro.org>; Fri, 17 Jun 2016 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G6yLmrpdclgDOShDtEdyKBIDcYQqq1REIGF4rkbambs=;
        b=AOnzbaSvQgxEiHFWHLZCdTATCDpfPmXRIRO0ESQvm83UGLE5zsVMtosXQ4lJIuvQyD
         nkoH/HCO+aY7/zfQxoTLlEjG92iW/nOPJOLGqQnjx5RC7fA0Qk7FSoN+1k899jUBF0x7
         x3DUfgQD9KG5CQWgixAK8RjE8qUVOyT3D5aXKVGcBiKaldQMu9+oxbqc84hW+Hztn7ly
         qMwBpRzYNi+ytrYhCE72QsE7tosBAt0ggGDvcrfRJm/sDicHg1YzW1dWHm1ppYAiifwj
         PwFynRoRQ47P5tMJd6rixFMV9K4A2obS8BhqwzDGiIiUQieRi+nraOVLiI5ppFngd+/r
         6W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G6yLmrpdclgDOShDtEdyKBIDcYQqq1REIGF4rkbambs=;
        b=S6W7LcbxCxryOhJuVmT5wRgyT4fFtN3uVxFg8WXYn/sL/LczMq/+RD9Ffw0keCvmDh
         lmoACUJAyLSmHMg842e4Hv+LdEF5AYsKp1vXY1gEMyHevJcx4MKFLsgzo+K9qcYjhKuf
         Gr18eJ2e1H+Hb6SiQac3SsR+viTTgDfMUeZKXXDQZSY1H0eXrHLradkajtVky/8rDT1f
         whj3ToYJ8R8MIEz8xpmT17Ayk4ql9etY42sVrEoEielmHS2h58NjEiEIz4LyowFyothP
         138uV8tqCD5VReo0FknmJCRZtc42dZf5M0ENfARoP9Ke6ktkSrc4k7XjVMfBH+CmBypw
         6HfQ==
X-Gm-Message-State: ALyK8tKMk86xPB6zRieWolQmwwTR42W3UxcI2XEAbM6fAf7+axdhf15HahteZdmEo8u9AA==
X-Received: by 10.129.102.8 with SMTP id a8mr3047650ywc.76.1466222723699;
        Fri, 17 Jun 2016 21:05:23 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id q7sm19517992ywg.16.2016.06.17.21.05.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 21:05:22 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:AArch64 target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	Claudio Fontana <claudio.fontana@gmail.com>
Subject: [RFC v3 PATCH 03/14] tcg/aarch64: Add support for fence
Date: Sat, 18 Jun 2016 00:03:32 -0400
Message-Id: <20160618040343.19517-4-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160618040343.19517-1-bobby.prani@gmail.com>
References: <20160618040343.19517-1-bobby.prani@gmail.com>
X-TUID: to/UVW/P+emf

Cc: Claudio Fontana <claudio.fontana@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 tcg/aarch64/tcg-target.inc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 1447f7c..bc8ac9c 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -372,6 +372,11 @@ typedef enum {
     I3510_EOR       = 0x4a000000,
     I3510_EON       = 0x4a200000,
     I3510_ANDS      = 0x6a000000,
+
+    /* System instructions.  */
+    DMB_ISH         = 0xd50338bf,
+    DMB_LD          = 0x00000100,
+    DMB_ST          = 0x00000200,
 } AArch64Insn;
 
 static inline uint32_t tcg_in32(TCGContext *s)
@@ -971,6 +976,21 @@ static inline void tcg_out_addsub2(TCGContext *s, int ext, TCGReg rl,
     tcg_out_mov(s, ext, orig_rl, rl);
 }
 
+static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    switch (a0 & TCG_MO_ALL) {
+    case TCG_MO_LD_LD:
+        tcg_out32(s, DMB_ISH | DMB_LD);
+        break;
+    case TCG_MO_ST_ST:
+        tcg_out32(s, DMB_ISH | DMB_ST);
+        break;
+    default:
+        tcg_out32(s, DMB_ISH | DMB_LD | DMB_ST);
+        break;
+    }
+}
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
@@ -1637,6 +1657,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
         break;
 
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
@@ -1761,6 +1785,7 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
     { INDEX_op_muluh_i64, { "r", "r", "r" } },
     { INDEX_op_mulsh_i64, { "r", "r", "r" } },
 
+    { INDEX_op_mb, { } },
     { -1 },
 };
 
-- 
2.9.0
