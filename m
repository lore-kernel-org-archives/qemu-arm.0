Received: by 10.25.27.66 with SMTP id b63csp2226143lfb;
        Tue, 31 May 2016 11:40:41 -0700 (PDT)
X-Received: by 10.37.228.195 with SMTP id b186mr2440316ybh.185.1464720032945;
        Tue, 31 May 2016 11:40:32 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com. [2607:f8b0:4002:c05::243])
        by mx.google.com with ESMTPS id f4si17673836ybb.180.2016.05.31.11.40.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2016 11:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) client-ip=2607:f8b0:4002:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x243.google.com with SMTP id l126so20063851ywe.3;
        Tue, 31 May 2016 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T6PuX4e7a7GK6HSuNJUebhj5QWFGs1F0cr7XWHWi/+g=;
        b=fTsWHRTv3wIY2cnF/XrmbZG5SMsxyr/Kww2WWc22JaQparoG6P+e0dCxeSxSo1kTYM
         sDvjHR+06GFtZvIvqbNREdWMUOAoGlCb27cRpJtEDAngaEOmHDJ0uVDmfvbfSXqiRnLa
         2yoIjdaA7SWmWbw6tKyUnTYlG3TC5aru1sQLalQzs0N1OcLwAJ99e68WnQz+AawFYsOk
         Y55FiEt0PHhIlX78Vkbd2FaEojd5jNGjJ/A0v8uIGdqtdfpVXizggrDgLhN6NaGh5rg6
         mQHXGrrdr6amQaPi5R9216EOWNCV9aKrQRW9/4cqkROH5pLMm1VWjfF95gRyaQIJ3FZY
         zuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T6PuX4e7a7GK6HSuNJUebhj5QWFGs1F0cr7XWHWi/+g=;
        b=mJDT1gsr8VJth44NlG1g5BsdZ8yxBxKqiHEKy58k3BRrkK2CTAYF2inSPCDpYb9Rtx
         qX06Hxgjs/06Xu6IRB3wMT/QYu3MB0opUk+zK5DCMuRf2p/2Aujy5HtGh37RxG+A5nXx
         EgjIeHu8cmMkCI/NmFrlWLz3rE7JK4czl0foQuNSey6GTGMCDDNeGI9hPUnm6JSf14hz
         lSmEeUziRS5fxbGf7qvRBwwRc6sREN1RluOQFCM/ZdqdqSsqW7nSsAh8IdzEdQU+LMey
         1nyKaoM23FcmOsZvJE8QFkjANZo5hCxxqcsx860tVLaUBDRMx1UOwr7kLYuT9KKNGKjs
         duHg==
X-Gm-Message-State: ALyK8tLgnquvggqBwFViEEUPRa61qFAXU5Xu1oV1i/sitZ+7tfODIFBWE4Mu4B+/0Rmvew==
X-Received: by 10.13.209.133 with SMTP id t127mr23627137ywd.232.1464720032640;
        Tue, 31 May 2016 11:40:32 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id c62sm17150085ywf.12.2016.05.31.11.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 31 May 2016 11:40:31 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Andrzej Zaborowski <balrogg@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:ARM target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@linaro.org,
	qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v2 PATCH 04/13] tcg/arm: Add support for fence
Date: Tue, 31 May 2016 14:39:19 -0400
Message-Id: <20160531183928.29406-5-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531183928.29406-1-bobby.prani@gmail.com>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
X-TUID: 4iPQt92RKetq

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.inc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index a914762..e88d8ce 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -305,6 +305,10 @@ typedef enum {
     INSN_LDRD_REG  = 0x000000d0,
     INSN_STRD_IMM  = 0x004000f0,
     INSN_STRD_REG  = 0x000000f0,
+
+    INSN_DMB_ISH   = 0x5bf07ff5,
+    INSN_DMB_MCR   = 0xba0f07ee,
+
 } ARMInsn;
 
 #define SHIFT_IMM_LSL(im)	(((im) << 7) | 0x00)
@@ -1905,6 +1909,13 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_udiv(s, COND_AL, args[0], args[1], args[2]);
         break;
 
+    case INDEX_op_mb:
+        if (use_armv7_instructions) {
+            tcg_out32(s, INSN_DMB_ISH);
+        } else if (use_armv6_instructions) {
+            tcg_out32(s, INSN_DMB_MCR);
+        }
+        break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -1979,6 +1990,7 @@ static const TCGTargetOpDef arm_op_defs[] = {
     { INDEX_op_div_i32, { "r", "r", "r" } },
     { INDEX_op_divu_i32, { "r", "r", "r" } },
 
+    { INDEX_op_mb, { "r" } },
     { -1 },
 };
 
-- 
2.8.3
