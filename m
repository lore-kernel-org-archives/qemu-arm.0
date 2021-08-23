Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1463708lfg;
        Sun, 22 Aug 2021 19:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkHTJbG60gebFWqoP4US+wL18FJHUj9snExiU/PwyIGdrKMWqX3WdO5wCowr7DA8woo+XV
X-Received: by 2002:a92:444e:: with SMTP id a14mr13943508ilm.152.1629684522028;
        Sun, 22 Aug 2021 19:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629684522; cv=none;
        d=google.com; s=arc-20160816;
        b=tL3K4lHk1wVwUBjSf6laHKYcuWugZ+F1izyRxnOkMTOkzPV6yvufTsF52tP6Jsq0nZ
         lqTwezpq0UZDmvxjX7WzF0sBL42z6xKEbI7yFD4KKLI31rizfH1a6XjUmaQGs+aWcAUf
         DwVrGkyPJHt/P9jar77+e8t8+q1fVG036sRGFcPRhRXBaOdRQ2iDUJhXzPljYSePsJTh
         gq+hFyksCnXZiSo0CiMxtQChKYbcmo9dT2SWAP6lL40x5TtaDTsrCaR0tdVY3RC2vOag
         EAE0XAt3oB+7KY7JN8V6nAwKGsiZM5sa15obbR3EnlYYLOthQaFWqk21vZFUud4uYCnB
         n/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rAAxJDG5E05zDmlgEF2APiVr8Kl3NTFeFkQ9Psjo6MM=;
        b=EYHxSIM7NF5RVwEeO8Ar2rQxgF/ZUQo2l+bkulFYxgONN4U7gksitOZogMad/KviHl
         JciWRYtp0LOVbhGWuxR62GzsSahtR1yzwQeno+YYpaCvZ+ssZMHi8Tfp61Lh57wB+5Zz
         QNpS2+ojJvQGieDFUFEoppWgyXL15e9I18xFdxzJaHtUsTG31YlOd6yhWMRrG5P49SOv
         gAcOpaKyqO0HBIOddYh7BWXAy2qQ41SKFZUoSqgM1ZDP2ScOzrI5K2ZnPKJrVFR4+E+0
         eBymukeWbXrXYjGTJOgDzP12w796r4EWY8o/FoUSyQs+yio/VgQDFQDXK/m1x7V9SmyG
         656g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=um7SXWrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si14469543ilu.111.2021.08.22.19.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 19:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=um7SXWrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHzOB-0004KI-Qz
	for alex.bennee@linaro.org; Sun, 22 Aug 2021 22:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNz-0004Fd-Iv; Sun, 22 Aug 2021 22:08:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNy-0005qL-16; Sun, 22 Aug 2021 22:08:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id o2so15238732pgr.9;
 Sun, 22 Aug 2021 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAAxJDG5E05zDmlgEF2APiVr8Kl3NTFeFkQ9Psjo6MM=;
 b=um7SXWrD0tpzrZQz81dLxIVYWGkKnOoxsPEhUERE9MmxztDGJ+d0UJbhfpJwbB8s6g
 Vo+ixF1syYf31WYKbei3RpryAsiWgRoPsez0W9F2W21Bm2xAV03C0toqSFf3WLOME7WT
 8QrHLJ1ipl/AV7lBOQ37j2Nz2BXRH18Wmeg1klfX/AQH7iZhWwKv61P4YSwBfEdVOIbv
 T1Z9k2TkNHiwrDQStR0TzfFAzhFHXvBEIlI/NeNJVeNxPVCNheFFUhNHm2Hrt7e5gjAf
 h54lno37Jdj6hkiJ8nJGSVvHykDzFbk6EgadeMFEHlXwP8g2hsoIBwr956Z16k7ABY+C
 jApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAAxJDG5E05zDmlgEF2APiVr8Kl3NTFeFkQ9Psjo6MM=;
 b=SaFvA0BNcmoY7NgNUOxXJJ/BFFkn7wbF6srjEvsDkHiKNWxahNcWFOcFUkSxpmNc6s
 0PpJ1T79QnjB7rHq55LAyUkwfisqngrpmeCUkigu4MobcuyS9sVJkUiEUKjig16dwwx7
 IaGvBoOEYe1vRzrxWFGImTv1Gs80xRKUf6JDo4XFD/HpcMUUuqQG7vV4JnBmDlULAlXs
 bvTpr1s1v/bo+P4zMzNBWs2ABM2tiIqJnhbX/2qYVLLwbOz6QUwCQx5TwmSJto+SIlCV
 Bm0oeIRAU0p7c7gg4+doWNaDpeQ4RVvSGD1SKqex6y0B3H9yaambkN0/lRtBqgLai/Ud
 EVuw==
X-Gm-Message-State: AOAM533dbfo4DON0rk5PlfwjhIhjp2beYFUA+1YhWW4jtQlZm97lsnh6
 b+U5Gf1tcUAyIYmzqBHVfdk=
X-Received: by 2002:a05:6a00:7cc:b029:3e0:e9f3:5835 with SMTP id
 n12-20020a056a0007ccb02903e0e9f35835mr30505595pfu.66.1629684504366; 
 Sun, 22 Aug 2021 19:08:24 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e26sm13804358pfj.46.2021.08.22.19.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:08:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/3] hw/misc: zynq_slcr: Correctly compute output clocks in
 the reset exit phase
Date: Mon, 23 Aug 2021 10:08:11 +0800
Message-Id: <20210823020813.25192-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823020813.25192-1-bmeng.cn@gmail.com>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZqo3paS7SRv

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Debugging shows that the UART input clock
frequency is zero which prevents the UART from receiving anything as
per the logic in uart_receive().

From zynq_slcr_reset_exit() comment, it intends to compute output
clocks according to ps_clk and registers. zynq_slcr_compute_clocks()
is called to accomplish the task, inside which device_is_in_reset()
is called to actually make the attempt in vain.

Rework reset_hold() and reset_exit() so that in the reset exit phase,
the logic can really compute output clocks in reset_exit().

With this change, upstream U-Boot boots properly again with:

$ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
    -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0

Fixes: 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/misc/zynq_slcr.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 5086e6b7ed..8b70285961 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -269,6 +269,21 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
     zynq_slcr_compute_clock((plls), (state)->regs[reg], \
                             reg ## _ ## enable_field ## _SHIFT)
 
+static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
+{
+    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
+    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
+    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
+
+    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
+
+    /* compute uartX reference clocks */
+    clock_set(s->uart0_ref_clk,
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
+    clock_set(s->uart1_ref_clk,
+              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
+}
+
 /**
  * Compute and set the ouputs clocks periods.
  * But do not propagate them further. Connected clocks
@@ -283,17 +298,7 @@ static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
         ps_clk = 0;
     }
 
-    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
-    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
-    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
-
-    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
-
-    /* compute uartX reference clocks */
-    clock_set(s->uart0_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
-    clock_set(s->uart1_ref_clk,
-              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
+    zynq_slcr_compute_clocks_internal(s, ps_clk);
 }
 
 /**
@@ -416,7 +421,7 @@ static void zynq_slcr_reset_hold(Object *obj)
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
 
     /* will disable all output clocks */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, 0);
     zynq_slcr_propagate_clocks(s);
 }
 
@@ -425,7 +430,7 @@ static void zynq_slcr_reset_exit(Object *obj)
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
 
     /* will compute output clocks according to ps_clk and registers */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
     zynq_slcr_propagate_clocks(s);
 }
 
-- 
2.25.1

