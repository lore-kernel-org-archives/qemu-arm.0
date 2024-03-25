Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp701914ejj;
        Mon, 25 Mar 2024 06:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv320SKA8Rr69HJliZoNgcxcnCV5DNXvJ/L0isEnosZfTQE662TpXMdlK6CAr0djXkHcLymOCfPtYEj2GAr/+kzV11oicP
X-Google-Smtp-Source: AGHT+IFsJ1sz4KpLCHiK91C8RjqQuaxB/KsGfdgw65/0HoyCF6TdJcl7t3k5dO76ldpCq5KvlNKO
X-Received: by 2002:a05:620a:36c7:b0:789:e3de:f338 with SMTP id cz7-20020a05620a36c700b00789e3def338mr6671983qkb.66.1711373656995;
        Mon, 25 Mar 2024 06:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373656; cv=none;
        d=google.com; s=arc-20160816;
        b=Tw4blcUzJUxOeYtmK1iW6q92gLjk3yxZXBNyPWj2mgD16JcPJXcxpNXBxWhOtIkjcH
         Bz9It9965C38TwaDQGb81fw7O7bVMFEQ+wK95xznDMDfccYmuWb04bNsDf7RY/irzpcH
         ZFOACuP6wD/BY+agGk6Q1P7EFigTFVd5/3B6LOA/bVch0rRMQvQjmEEPX+glMpJyY0iC
         EDceYQX7w0pE6KMlIlEWrVCaLzez/p5/nMtXfror6UD5R6jerL+rlatT+OdKM3c9BrE4
         ZSbH/Zsew97M4NluyNvgTPSMfJo5gD7Ebn/3zV3j2AUDHrXaq5zO7xCFwRV1RMR6lQ31
         45Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cC2Yz91nzGrohL4G/Awv0+dd4I3kt82iWAFcfxuwSZM=;
        fh=vmPOAMqvHft5e67RgXLuvn52EnvXn4vjEKCXfn8ORwc=;
        b=KA6M7HXxz5zRkkknFEaiPcW0nv7cKg1uy8a5OOigJmYlPCfs5zUtnrn5eir+PDSmLt
         b94aTYLbMzonu3dcwvnysIbfmX/klktjZlK5BLVyc23LXioIz8mAGcb5pBDtD608obh2
         k/tb/io3SLoaRm2gk5XwsDwS0rPz7OCe1UqZY+N7tbt6HtxnLIAT89SfZfi/eJs464DM
         Os6Z8HuCkmFbtniU/A66tVSUtTIl9yi5ilSM3Ok1E/frdSQpohqbFcD1O4vsh4q/S0s3
         sgC4E9twlFHTqqvNOagl0VQpWkCMTq03qVjpR9QBNxKwmylGdYKhN11R9SnyGlxlE1bz
         3oyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4m9fmaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a05620a118700b0078a13742bb3si5192160qkk.516.2024.03.25.06.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4m9fmaT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokSa-0003Yr-Qv; Mon, 25 Mar 2024 09:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSY-0003Xt-Hz
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:54 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSW-0007TN-Ov
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:54 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a474c4faf5eso161723366b.2
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373631; x=1711978431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC2Yz91nzGrohL4G/Awv0+dd4I3kt82iWAFcfxuwSZM=;
 b=c4m9fmaTqK/XPlEjig0UaahEDKAgnSNSNyONhgN2JpiiC+wfIcfy7dBlhYqNmpYUfC
 aCKRiUq70AOpnD71r4N54Woy78+uYREu5w6Rivg3xvEdeUeEP7eEBA9SXC5FUZ9maV0u
 OZhNWV5wOedNB9N6Xer7K1Wme8cPLzA6JjfNh8LSflmQ8vAYeKoaKITVEdiXZpezQjnN
 VKubYafax35ySvIIHThW+3884YE//pMREyfmwCXlBz5F8VvL9v3gv7QGdujosmr8Ol7g
 PcZeeAIWE9sie2oMFo/7pZgqB+p+KKYeUZuzUxBNSaF5Tsus606LtNvgyi53N8fDKqE/
 6y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373631; x=1711978431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC2Yz91nzGrohL4G/Awv0+dd4I3kt82iWAFcfxuwSZM=;
 b=NmhdA6T9iWWnFpVooURHjGV4ZjGRdAgSgA7siWNv2hQOsAzq2D7r4bZb+gr8ykx52i
 n6WV9StbqS09yT31peKdd+KQBbEEA3jLwcX5TdkkKs1hpfmkeLyOvM6bKO8w9W7X0aVb
 +erzwQPfv2/MOSsAyHnG8w0+Yao3SNkd6EwZl5G4s1k+1b1kDucOAmehTu1zE/iWrwiA
 6Rzk+WfLL07wlmU2CaCXP9JYQL/o0Veg1EigMZrpAsFLK+8ps53IJfm72iVka5XnuHPF
 Ls1yKd8zQ8qYmcopG09/y/uhOSXzruWR4UbBEiK6b8zGBMzOj4+wqpgexDQJKs8dj8dx
 s6AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP0/eSA5q8vKFj9Zpg5Ib9h3gkcWLOi601yQhZyJ4LP8NBHgtTtt/nN2A3uCexhP/xuibCEZLNxMNV3TV58BQlyfTF
X-Gm-Message-State: AOJu0YwhHPIZPsS1Y/rcl7urHXr/GsoX8C1M1yJkXeZ4YTp3yjIo0JE5
 qET4EVQISr9QVuEyzG0Upnx5mqpyxsCaoDlxNVj3L6icOIGab9XA0CvAFMx+MGY=
X-Received: by 2002:a17:906:4e8d:b0:a46:cea6:a7f1 with SMTP id
 v13-20020a1709064e8d00b00a46cea6a7f1mr4793519eju.51.1711373630981; 
 Mon, 25 Mar 2024 06:33:50 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 qy34-20020a17090768a200b00a4623030893sm3046795ejc.126.2024.03.25.06.33.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH-for-9.1 v2 8/8] hw/misc/zynq_slcr: Only propagate clock
 changes when necessary
Date: Mon, 25 Mar 2024 14:32:58 +0100
Message-ID: <20240325133259.57235-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325133259.57235-1-philmd@linaro.org>
References: <20240325133259.57235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eeAcB2wzhBX9

Pass &bool to zynq_slcr_compute_clocks[_internal](), so we
can pass it to the clock_set() calls which might update it.
Then check it and only call zynq_slcr_propagate_clocks()
and clock_propagate() when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/zynq_slcr.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index e637798507..ad9c575137 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -269,7 +269,8 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
     zynq_slcr_compute_clock((plls), (state)->regs[reg], \
                             reg ## _ ## enable_field ## _SHIFT)
 
-static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
+static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk,
+                                              bool *changed)
 {
     uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
     uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
@@ -279,9 +280,9 @@ static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
 
     /* compute uartX reference clocks */
     clock_set(s->uart0_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0), NULL);
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0), changed);
     clock_set(s->uart1_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1), NULL);
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1), changed);
 }
 
 /**
@@ -289,7 +290,7 @@ static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
  * But do not propagate them further. Connected clocks
  * will not receive any updates (See zynq_slcr_compute_clocks())
  */
-static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
+static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool *changed)
 {
     uint64_t ps_clk = clock_get(s->ps_clk);
 
@@ -298,7 +299,7 @@ static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
         ps_clk = 0;
     }
 
-    zynq_slcr_compute_clocks_internal(s, ps_clk);
+    zynq_slcr_compute_clocks_internal(s, ps_clk, changed);
 }
 
 /**
@@ -315,9 +316,12 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
 static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)
 {
     ZynqSLCRState *s = (ZynqSLCRState *) opaque;
+    bool propagate = false;
 
-    zynq_slcr_compute_clocks(s);
-    zynq_slcr_propagate_clocks(s);
+    zynq_slcr_compute_clocks(s, &propagate);
+    if (propagate) {
+        zynq_slcr_propagate_clocks(s);
+    }
 }
 
 static void zynq_slcr_reset_init(Object *obj, ResetType type)
@@ -419,19 +423,25 @@ static void zynq_slcr_reset_init(Object *obj, ResetType type)
 static void zynq_slcr_reset_hold(Object *obj)
 {
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
+    bool propagate = false;
 
     /* will disable all output clocks */
-    zynq_slcr_compute_clocks_internal(s, 0);
-    zynq_slcr_propagate_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, 0, &propagate);
+    if (propagate) {
+        zynq_slcr_propagate_clocks(s);
+    }
 }
 
 static void zynq_slcr_reset_exit(Object *obj)
 {
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
+    bool propagate = false;
 
     /* will compute output clocks according to ps_clk and registers */
-    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
-    zynq_slcr_propagate_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk), &propagate);
+    if (propagate) {
+        zynq_slcr_propagate_clocks(s);
+    }
 }
 
 static bool zynq_slcr_check_offset(hwaddr offset, bool rnw)
@@ -516,6 +526,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
                           uint64_t val, unsigned size)
 {
     ZynqSLCRState *s = (ZynqSLCRState *)opaque;
+    bool propagate = false;
     offset /= 4;
 
     DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx64 "\n", offset * 4, val);
@@ -569,8 +580,10 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
     case R_ARM_PLL_CTRL:
     case R_DDR_PLL_CTRL:
     case R_UART_CLK_CTRL:
-        zynq_slcr_compute_clocks(s);
-        zynq_slcr_propagate_clocks(s);
+        zynq_slcr_compute_clocks(s, &propagate);
+        if (propagate) {
+            zynq_slcr_propagate_clocks(s);
+        }
         break;
     }
 }
-- 
2.41.0

