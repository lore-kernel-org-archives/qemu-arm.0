Received: by 10.25.21.156 with SMTP id 28csp272580lfv;
        Thu, 14 Jul 2016 13:20:55 -0700 (PDT)
X-Received: by 10.37.57.83 with SMTP id g80mr6912207yba.59.1468527649902;
        Thu, 14 Jul 2016 13:20:49 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com. [2607:f8b0:4002:c05::241])
        by mx.google.com with ESMTPS id z128si1682095ybz.317.2016.07.14.13.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 13:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) client-ip=2607:f8b0:4002:c05::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::241 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x241.google.com with SMTP id y188so5582680ywf.3;
        Thu, 14 Jul 2016 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QCJI0UAU6jiqmgHaJY9g+DpZrbkMhKh61glpYjA3coE=;
        b=kWT4OA02QUQxqccvcvOza49jY+Sab4pJRdiB2adO3P8c6H4cpa7inT+BMe35+AGXCE
         AQV0BjDObKyXIH37ugPusNf25UT6RoYbYZnA7/ZPpE7VeQH0dexQPeRs4DLVrcE7kkWi
         v5dd8MBXqe4HMEaZNumAijejSBGK5JlnaGrOGSuFqe8Pz36JYWxv1fKxZOf4KhdU4QdE
         iftBhZ7Oxh2+/+ktgxPnjM/ZR0KvJFYcESR7ANpF1fCntHCSvYgjaVyE4QcUF0mpgHDK
         +ykErbNOlPHv8IkxC+cDct93pTKWr6nMTWS+FVMCPePEp9L6BfTIGgictlNnwIl/guIm
         zqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QCJI0UAU6jiqmgHaJY9g+DpZrbkMhKh61glpYjA3coE=;
        b=DmROCE+hQYkX2CPw2w9VR6gjBj4dKj68A1fS1TlrDgnzYDZ1jxxXndSME7xGg69Yfg
         uH02fAGN9bIPiQWbsIYEtqXabwSQ0PX6PF6nF8mtLjt/f/H9DyrBk1pJbGahW7expjqG
         3+lu/l0lXPktKZSWhGKcsn/O4BqsUzgRFZmK/WhxQmYSqaJg2j5mVtsy/o4IDmeaBBB4
         u3yFNuGtWErKvJ2fle7CAILrUAEcT3iNt35msGE7418a9UsxafEg8eKp9mfn/F4LiQHE
         UjE1SU6CCnqAujylQewT7gYU5QPLguYWPnKqoxlmoLBZL3Xr9VZ2IT8LvSpQ3zY9BHUw
         QRKQ==
X-Gm-Message-State: ALyK8tKEl4ynY7OD5u96uMsUPUnLwDDG2yEIe8DIRE2gOcRxGK3I0lx9WaOkR2ZKa7olew==
X-Received: by 10.129.4.78 with SMTP id 75mr11176624ywe.66.1468527649595;
        Thu, 14 Jul 2016 13:20:49 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id v68sm1634604ywg.31.2016.07.14.13.20.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:20:47 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:AArch64 target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org,
	Claudio Fontana <claudio.fontana@gmail.com>
Subject: [PATCH v4 03/14] tcg/aarch64: Add support for fence
Date: Thu, 14 Jul 2016 16:20:15 -0400
Message-Id: <20160714202026.9727-4-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160714202026.9727-1-bobby.prani@gmail.com>
References: <20160714202026.9727-1-bobby.prani@gmail.com>
X-TUID: e5FpmeHUZXnr

Cc: Claudio Fontana <claudio.fontana@gmail.com>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 tcg/aarch64/tcg-target.inc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 08b2d03..1d220b7 100644
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
@@ -981,6 +986,22 @@ static inline void tcg_out_addsub2(TCGContext *s, int ext, TCGReg rl,
     tcg_out_mov(s, ext, orig_rl, rl);
 }
 
+static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    uint32_t dmb_type = DMB_ISH;
+    if (a0 & (TCG_MO_LD_ST | TCG_MO_ST_LD)) {
+        tcg_out32(s, dmb_type | DMB_LD | DMB_ST);
+        return;
+    }
+    if (a0 & TCG_MO_LD_LD) {
+        dmb_type |= DMB_LD;
+    }
+    if (a0 & TCG_MO_ST_ST) {
+        dmb_type |= DMB_ST;
+    }
+    tcg_out32(s, dmb_type);
+}
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
@@ -1648,6 +1669,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
         break;
 
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
@@ -1772,6 +1797,7 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
     { INDEX_op_muluh_i64, { "r", "r", "r" } },
     { INDEX_op_mulsh_i64, { "r", "r", "r" } },
 
+    { INDEX_op_mb, { } },
     { -1 },
 };
 
-- 
2.9.0
