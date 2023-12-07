Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1704153ejb;
        Thu, 7 Dec 2023 07:46:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4ObpKxpq7mtYdZAooRxCLdBuE3G7peLwc7kkTnToFbw7ggi/rEWJemtlAujI7AlMt+JfV
X-Received: by 2002:a05:620a:21cb:b0:77e:fba3:4f26 with SMTP id h11-20020a05620a21cb00b0077efba34f26mr1391254qka.124.1701964017372;
        Thu, 07 Dec 2023 07:46:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701964017; cv=none;
        d=google.com; s=arc-20160816;
        b=jYDsr90hm67N+Rj9ALpbVJtgrTePjO95weDLwmgF9nhwlfaRkQUDY01olyg2lTMvii
         WxNeFiGgYiN/cGgtw2hCqunC2HaGbTjLB5M/dSLGwwLGB6y8FFx7Wlh0xh7SAkEyMh1N
         7oYe1KFpILEJ9635j+yZB9vR8Kbo24hvrlgEedaLpvmuqljjUZmpQ32V5gMzMwkpK5HE
         oXblW2a0XNQWMLVsQp/gYO8t8StRc6d7HkNUpTK1wr6L2BQybP3VjVPfx+IWV3sd1rWE
         UDTVQ+MRoW0ezyXJLobcXYIJoB2fdwUjw2iDox/KNYN90ihMHi5Q+WaX4UwIrKeA+0hA
         zuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GD2b69B4k+YDchTVBa/HFQBkt48CNiIjHc0JPprtaKQ=;
        fh=A8ftaDMzewcMA0xKw++MSYMuCBPymoWdeCEx+9KcU8w=;
        b=nCCUXYIo6g0aNF8FU0gJ5KtWp+T0Fp65upA50D96kwXlSInVYKAEPWHJlSa36JFS/A
         1yRzIoaDxhdvUXzslzl3FbN/q0Wn7SfcUm9Yu2Xx5YrbLhp4D7VNxg4wTF7FT1EhDRYC
         nWo0QHiFVYtnkm36zS/gi4fqJOUl2VAuay+gL/tEp6m7xbjUpqzEvDjye6kUhREk3VVD
         vPSZSvdTYE4cYY9QnXYiz8wxi3UPMM7r+bAcoqON/f9YBUFkU63ypV87xrRmC8r4U34u
         crOnieAjUEcLjXHL5cxmcTCJXzhyEYcTzzKIz9KpoXLdbKf8U0t2/7e/CS2FyV5kEAp3
         icNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0RHE60I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a126200b0077d6c50a665si1433518qkl.214.2023.12.07.07.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 07:46:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0RHE60I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBGZv-0000hr-8Z; Thu, 07 Dec 2023 10:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZg-0000ea-Ga
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:46:08 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZd-00028w-Fk
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:46:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1ef2f5ed02so81976266b.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701963959; x=1702568759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GD2b69B4k+YDchTVBa/HFQBkt48CNiIjHc0JPprtaKQ=;
 b=w0RHE60IScxlQdqsLiw7R6unjeVl/ojfx7S8JR1Y/mCrBOEpsd4OM+Is8S5O/zP0Sy
 TccDQHlTch2Df7buvAi3K3klnWuA9xC869fG9AMCIx3EM08rDks/wGnqmrPSb1Ns760X
 5ZNA0h10Z412AK/5kM0jZfHbRTpuwnVqrbcY2zdzqbR4GZ/qmsEHurRw0X7X3yLtiPx8
 1/tENbX2VFVKwo8Hey7mIC+YMgWYM66Feow6AGiVXeTEL5Bx2N074/i52ZVqg2AG2+jU
 MkC3j1gMdGZmkFriHYAfhGq6NsITRLCIMNK8224Go9C3b58G7lrafYWbaKP0a89WA3Ai
 4Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701963959; x=1702568759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GD2b69B4k+YDchTVBa/HFQBkt48CNiIjHc0JPprtaKQ=;
 b=fi7xXwWG2XX2SeTbNXiS9Q9b7fihDeQKhUGIqLdzxoA3baeJ4p5mtveTC5pQQksmJa
 zlHMK1pkyUKD27QEiVKVVuoAEDMKLSZGkUim+zbssQgAgP7XmQl/mHwglzq5j/TmzRhI
 pr389Kv3NjyQc4xCrFKZGM26HYiaH+zPo2GpNJMZavp8O5CnZucHW9QP+Qi9yfFRPSc4
 LdjdAfTkW5xTfOBOxZC7kOYEqqDPOU6RTzhUDjX5fZXovakObmLRvlD/9N3THI45IB+A
 6ECVsAKoE84cZ69crtGNsgDbwRyTeJG0huATVeA7o3qPp5Noe1WoHdJEIDn7tbaSIdPL
 MvPA==
X-Gm-Message-State: AOJu0YxsR00axdzadhKzRtdxL7kWTLKuWpFRypKkoOQZpXPautYvGXFl
 H2x2CTNkJf78TeKzoVnrUen5ZT5A/xGpOGA36jc=
X-Received: by 2002:a17:906:21a:b0:a1d:511c:5be6 with SMTP id
 26-20020a170906021a00b00a1d511c5be6mr1786381ejd.76.1701963959621; 
 Thu, 07 Dec 2023 07:45:59 -0800 (PST)
Received: from m1x-phil.lan ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906374300b00a1e2aa3d090sm961641ejc.206.2023.12.07.07.45.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Dec 2023 07:45:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/5] sysemu/cpu-timers: Introduce ICountMode enumerator
Date: Thu,  7 Dec 2023 16:45:46 +0100
Message-ID: <20231207154550.65087-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207154550.65087-1-philmd@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: wxCUzHvvbLEb

Rather than having to lookup for what the 0, 1, 2, ...
icount values are, use a enum definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/cpu-timers.h | 20 +++++++++++++-------
 accel/tcg/icount-common.c   | 16 +++++++---------
 stubs/icount.c              |  2 +-
 system/cpu-timers.c         |  2 +-
 target/arm/helper.c         |  3 ++-
 5 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index 2e786fe7fb..e909ffae47 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -17,18 +17,24 @@ void cpu_timers_init(void);
 
 /* icount - Instruction Counter API */
 
-/*
- * icount enablement state:
+/**
+ * ICountMode: icount enablement state:
  *
- * 0 = Disabled - Do not count executed instructions.
- * 1 = Enabled - Fixed conversion of insn to ns via "shift" option
- * 2 = Enabled - Runtime adaptive algorithm to compute shift
+ * @ICOUNT_DISABLED: Disabled - Do not count executed instructions.
+ * @ICOUNT_PRECISE: Enabled - Fixed conversion of insn to ns via "shift" option
+ * @ICOUNT_ADAPTATIVE: Enabled - Runtime adaptive algorithm to compute shift
  */
+typedef enum {
+    ICOUNT_DISABLED = 0,
+    ICOUNT_PRECISE = 1,
+    ICOUNT_ADAPTATIVE = 2,
+} ICountMode;
+
 #ifdef CONFIG_TCG
-extern int use_icount;
+extern ICountMode use_icount;
 #define icount_enabled() (use_icount)
 #else
-#define icount_enabled() 0
+#define icount_enabled() ICOUNT_DISABLED
 #endif
 
 /*
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index ec57192be8..067c93a9ae 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -49,21 +49,19 @@ static bool icount_sleep = true;
 /* Arbitrarily pick 1MIPS as the minimum allowable speed.  */
 #define MAX_ICOUNT_SHIFT 10
 
-/*
- * 0 = Do not count executed instructions.
- * 1 = Fixed conversion of insn to ns via "shift" option
- * 2 = Runtime adaptive algorithm to compute shift
- */
-int use_icount;
+/* Do not count executed instructions */
+ICountMode use_icount = ICOUNT_DISABLED;
 
 static void icount_enable_precise(void)
 {
-    use_icount = 1;
+    /* Fixed conversion of insn to ns via "shift" option */
+    use_icount = ICOUNT_PRECISE;
 }
 
 static void icount_enable_adaptive(void)
 {
-    use_icount = 2;
+    /* Runtime adaptive algorithm to compute shift */
+    use_icount = ICOUNT_ADAPTATIVE;
 }
 
 /*
@@ -256,7 +254,7 @@ static void icount_warp_rt(void)
         int64_t warp_delta;
 
         warp_delta = clock - timers_state.vm_clock_warp_start;
-        if (icount_enabled() == 2) {
+        if (icount_enabled() == ICOUNT_ADAPTATIVE) {
             /*
              * In adaptive mode, do not let QEMU_CLOCK_VIRTUAL run too far
              * ahead of real time (it might already be ahead so careful not
diff --git a/stubs/icount.c b/stubs/icount.c
index 6df8c2bf7d..f8e6a014b8 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -4,7 +4,7 @@
 
 /* icount - Instruction Counter API */
 
-int use_icount;
+ICountMode use_icount = ICOUNT_DISABLED;
 
 void icount_update(CPUState *cpu)
 {
diff --git a/system/cpu-timers.c b/system/cpu-timers.c
index 7452d97b67..6befb82e48 100644
--- a/system/cpu-timers.c
+++ b/system/cpu-timers.c
@@ -154,7 +154,7 @@ static bool adjust_timers_state_needed(void *opaque)
 
 static bool icount_shift_state_needed(void *opaque)
 {
-    return icount_enabled() == 2;
+    return icount_enabled() == ICOUNT_ADAPTATIVE;
 }
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2746d3fdac..adb0960bba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -934,7 +934,8 @@ static int64_t cycles_ns_per(uint64_t cycles)
 
 static bool instructions_supported(CPUARMState *env)
 {
-    return icount_enabled() == 1; /* Precise instruction counting */
+    /* Precise instruction counting */
+    return icount_enabled() == ICOUNT_PRECISE;
 }
 
 static uint64_t instructions_get_count(CPUARMState *env)
-- 
2.41.0

