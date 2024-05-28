Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189373ejk;
        Tue, 28 May 2024 13:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjsX5cmCDljwNaS6nivpC4qFYlu822AuxnSI9Ow+YnaM4O7+iYyzKtD0+0KUzwtrDWKDKQ1g2nX8jCd2i50HUvXthsUDnQ
X-Google-Smtp-Source: AGHT+IFgepDL7EgyD6ufxJw74T3YEMO13d714dDTaywxoEMFsiWEQliCHqEgkhVzKrbuDyqJ690D
X-Received: by 2002:ae9:e915:0:b0:790:f6c6:8277 with SMTP id af79cd13be357-794ab096fa4mr1467115685a.43.1716928318775;
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928318; cv=none;
        d=google.com; s=arc-20160816;
        b=TL+I/MUTvdzIOvOJF/whyFv9E20amwVlLS/TX2/cI0jAIeoGE7ZLZ+gqUH0sHfK/1D
         59hCoRqXRTyxenJs1Bl8cBbBQTzM3cHViIA7Um8CBYc3Jy4S63Uz3mYPNJ2wmnZUEDAk
         NgNtWkjALKmZ3RPY4xJcHBAktAPNyP2yIUv+ViQ1FL90m5TOmtJhCWcADW6KU0cm+nil
         O7uMHVX40QemrBe593nQ3hPj72x/nkuF+yNTl9hqCR7ydLOr6UtqKaEGVCe1Fn1fBgfq
         DV5ARdwKVdrrQDkJmlvXgWV2MQbQ5Nch0nQxKpQWWpjmo+tNQWErjFQfqdSf1eN7DfkH
         J4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MchPVAymmY5yNkN81n4CDKNHDxrfiZwJmhq2h//dOuw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=i3ZwPqMjdRAxIVMtLJRKB6TBppp1EBo/IxiRPc/7l5GAXYkXynMJQ8jCUhllqozkX7
         vSZ3+Hn0XRbwUszztjAJ8TcONwDvXf4a9SRASy/mRSNzuK+yGUiiqMhVgD9/vW2kzSDk
         WZynuT8ulM/IaJQboPENJ9hOe2JJfrmUW0tD3M9TmqdUnvd7Ug6xoK5tWHskQaw9r9MR
         U8SQH5svx+dYxzQUASb6X9yaxhBPSR+g7/pnyR+DWNaR5ZVOidwV0Wucvx4v30gHIU4R
         o33B2dObPCPZye/kiUa4Z3V3zcbuBhGqA7z46iJexTW9f3FdYX0NUS4i1/xox4ZfhOWP
         QEVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGaf23lP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794b31b9506si875964085a.144.2024.05.28.13.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGaf23lP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3TI-0002lA-0t; Tue, 28 May 2024 16:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TF-0002kf-Mv
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:30:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3T9-0003Z8-KL
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:30:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f8edff35a0so1097267b3a.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928247; x=1717533047; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MchPVAymmY5yNkN81n4CDKNHDxrfiZwJmhq2h//dOuw=;
 b=CGaf23lPMgnY/4e/1DFquk3rt0Gp5wlbkQtuvsb06Fkb23W9Vp8ldIbZwQX5fDXBaP
 o9/fyWm5kWLUU1ZIeBZ9s1fGMAPsvADumROhr08eJD2Ed9dxqrk8LQo71bVgTpuPzuWN
 yS0T7yamIzSBtO/60hYXZDl6HmXH8XmzGrtUZaJfE0wN8n9zTPtWtjeddh7lkw0OIKk9
 RVv8rIyU1tnpHqNty5ZupF6SallqXzeXEKAyxIZ/kbrVMVxCF/v1mjGw73sxZWFqvXl5
 LvNAZepu0lYbLGvFT7YKI3VWxNf+w+QNSDnzokzQwX15WKxd/T1tOV1QDD8nTBCjOHNI
 4IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928247; x=1717533047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MchPVAymmY5yNkN81n4CDKNHDxrfiZwJmhq2h//dOuw=;
 b=RXlvoCPgUhRgwzEACgKRYSUxvvqbATq4lIl8C8yclDXGxG3yP5+beCA28rAbrvd154
 NlaCYWMAhNOo+GuKlmomvRDL8e0WdLW+xPtxBOlPRLCaX56sJdUzwA5cg2vvuIaU1dfq
 UZ20AqJOnBE23odYfvBohuw45sQ6cxo2KLknhN3B9zQRTY61GLg9PGNW1H3ML/sXTiUT
 A0OZQET39Q9LVsS+FFCKjs3pOHgeVK5bUGlQqOHMX5C1IYOC9UDqNfvrENMBQbYsCaJO
 bLcgNPAdhPmOLlsHCJPycTkxFbqIERlyEDQmyONpstFTEe3XSkl7DuMy+CjwjJ37xUqd
 A+6w==
X-Gm-Message-State: AOJu0YzVcFYhzL21u3FYFdDcmGYU5E6PUCuRb/arehNDMn6BP34MhF0a
 XZgd48cP9EMG2nmbfSGwUG43R2GhrCuMX09P69xJfiCOrsfew8KIuXwiDel73iFmNsSXSsXkUa8
 X
X-Received: by 2002:a05:6a21:7794:b0:1ad:7bfd:54a1 with SMTP id
 adf61e73a8af0-1b212dada23mr12593803637.17.1716928246741; 
 Tue, 28 May 2024 13:30:46 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/33] target/arm: Diagnose UNPREDICTABLE operands to PLD,
 PLDW, PLI
Date: Tue, 28 May 2024 13:30:12 -0700
Message-Id: <20240528203044.612851-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 5M3RWApat9Ip

For all, rm == 15 is UNPREDICTABLE.
Prior to v8, thumb with rm == 13 is UNPREDICTABLE.
For PLDW, rn == 15 is UNPREDICTABLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a32-uncond.decode |  8 +++--
 target/arm/tcg/t32.decode        |  7 ++--
 target/arm/tcg/translate.c       | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/a32-uncond.decode b/target/arm/tcg/a32-uncond.decode
index 2339de2e94..e1b1780d37 100644
--- a/target/arm/tcg/a32-uncond.decode
+++ b/target/arm/tcg/a32-uncond.decode
@@ -24,7 +24,9 @@
 
 &empty           !extern
 &i               !extern imm
+&r               !extern rm
 &setend          E
+&nm              rn rm
 
 # Branch with Link and Exchange
 
@@ -61,9 +63,9 @@ PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, lit) 5te
 PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, lit) 7mp
 PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
 
-PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
-PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
-PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
+PLD_rr           1111 0111 -101 ---- 1111 ----- -- 0 rm:4   &r
+PLDW_rr          1111 0111 -001 rn:4 1111 ----- -- 0 rm:4   &nm
+PLI_rr           1111 0110 -101 ---- 1111 ----- -- 0 rm:4   &r
 
 # Unallocated memory hints
 #
diff --git a/target/arm/tcg/t32.decode b/target/arm/tcg/t32.decode
index d327178829..1ec12442a4 100644
--- a/target/arm/tcg/t32.decode
+++ b/target/arm/tcg/t32.decode
@@ -28,6 +28,7 @@
 &rrr_rot         !extern rd rn rm rot
 &rrr             !extern rd rn rm
 &rr              !extern rd rm
+&nm              !extern rn rm
 &ri              !extern rd imm
 &r               !extern rm
 &i               !extern imm
@@ -472,7 +473,7 @@ STR_ri           1111 1000 1100 .... .... ............        @ldst_ri_pos
   }
   LDRBT_ri       1111 1000 0001 .... .... 1110 ........       @ldst_ri_unp
   {
-    PLD          1111 1000 0001 ---- 1111 000000 -- ----      # (register)
+    PLD_rr       1111 1000 0001 ---- 1111 000000 -- rm:4      &r
     LDRB_rr      1111 1000 0001 .... .... 000000 .. ....      @ldst_rr
   }
 }
@@ -492,7 +493,7 @@ STR_ri           1111 1000 1100 .... .... ............        @ldst_ri_pos
   }
   LDRHT_ri       1111 1000 0011 .... .... 1110 ........       @ldst_ri_unp
   {
-    PLDW         1111 1000 0011 ---- 1111 000000 -- ----      # (register)
+    PLDW_rr      1111 1000 0011 rn:4 1111 000000 -- rm:4      &nm
     LDRH_rr      1111 1000 0011 .... .... 000000 .. ....      @ldst_rr
   }
 }
@@ -520,7 +521,7 @@ STR_ri           1111 1000 1100 .... .... ............        @ldst_ri_pos
   }
   LDRSBT_ri      1111 1001 0001 .... .... 1110 ........       @ldst_ri_unp
   {
-    PLI          1111 1001 0001 ---- 1111 000000 -- ----      # (register)
+    PLI_rr       1111 1001 0001 ---- 1111 000000 -- rm:4      &r
     LDRSB_rr     1111 1001 0001 .... .... 000000 .. ....      @ldst_rr
   }
 }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c5bc691d92..16b8609ec0 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7187,6 +7187,64 @@ static bool trans_PLI(DisasContext *s, arg_PLI *a)
     return ENABLE_ARCH_7;
 }
 
+/* Check for UNPREDICTABLE rm for prefetch (register). */
+static bool prefetch_check_m(DisasContext *s, int rm)
+{
+    switch (rm) {
+    case 13:
+        /* SP allowed in v8 or with A1 encoding; rejected with T1. */
+        return ENABLE_ARCH_8 || !s->thumb;
+    case 15:
+        /* PC always rejected. */
+        return false;
+    default:
+        return true;
+    }
+}
+
+static bool trans_PLD_rr(DisasContext *s, arg_PLD_rr *a)
+{
+    if (!ENABLE_ARCH_5TE) {
+        return false;
+    }
+    /* Choose UNDEF for UNPREDICTABLE rm. */
+    if (!prefetch_check_m(s, a->rm)) {
+        unallocated_encoding(s);
+    }
+    return true;
+}
+
+static bool trans_PLDW_rr(DisasContext *s, arg_PLDW_rr *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
+        return false;
+    }
+    /*
+     * For A1, rn == 15 is UNPREDICTABLE.
+     * For T1, rn == 15 is PLD (literal), and already matched.
+     * Choose UNDEF for UNPREDICTABLE rn or rm.
+     */
+    if (a->rn == 15) {
+        assert(!s->thumb);
+    } else if (prefetch_check_m(s, a->rm)) {
+        return true;
+    }
+    unallocated_encoding(s);
+    return true;
+}
+
+static bool trans_PLI_rr(DisasContext *s, arg_PLI_rr *a)
+{
+    if (!ENABLE_ARCH_7) {
+        return false;
+    }
+    /* Choose UNDEF for UNPREDICTABLE rm. */
+    if (!prefetch_check_m(s, a->rm)) {
+        unallocated_encoding(s);
+    }
+    return true;
+}
+
 /*
  * If-then
  */
-- 
2.34.1

