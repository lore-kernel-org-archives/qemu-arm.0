Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp78314lfb;
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiy8pL1rQaesBRNOT5vObTinhZdEYA4HdpxUB4sAsY1OzEsnIIfoxHT8evGeCKSskYaFSq
X-Received: by 2002:a05:6638:521:: with SMTP id j1mr5817483jar.122.1630466980341;
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630466980; cv=none;
        d=google.com; s=arc-20160816;
        b=Odvcb/rpqvv5Sff/cehNYFLZceJZo0yYTkOEN3m/3ehUXTunYrq0Wlk88E6dnpV35e
         8UB1UaK5qrGsAsPTIYweyRrbgfk/PqN/s4Zrp5CeEZ52GWLGQa5M8+Ia/fbi7WrLIHDL
         g/LVRT/EgRs6hbYFcFFBQtqLX3pEXePAiqpFlWSZ5dUI5KUROKUWl7EqKQ3f4oDnFIHr
         VMnCoSrET9b0hL8zwtnu9iONS5EAlftfT2DCjuT2lOjUIZiXqcIXx7rKj4UdurAPUTKk
         KDAYNnk34tW78+US20Vy15Pv4aJzc/dV/ZWQqBkemkUrINuuB81gskCyxzyzayWQvAxE
         N7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5t8z8W2/Z4HnNDfJxkUtulZXcpKeSL8+hbjbGr7gaxg=;
        b=EEA0lxV065RGuOU+ev8KFa/ERgQ45TE6xIh6XyAjdmTvrkMbXO5RFAgzPgWoSFj5kO
         xfYv9E/tojhn/PdFe/rWax1jRWH+xTPX/N/lUdmS0WpK8+LxxL8FNDo1Rcsfntl0wPY2
         UdaOaieLgag55H0JcJ16WLWcwxGldbVDoCD9nqXr55PlHoWxYSopv+uY36AhUJ6p1eK3
         Oz9XxP73R1vzI/0MEC53Y6+85UTyr7rHUFUl+n75e39SpPxEyCyxiOeGO+JblPphFXuX
         wRy0WJjCAG7o5e7FpsFkfVW8vyB9ldORwI7jm0S5KT07RLUDUNxhl+zvFgpaAT2Ad2ef
         AVQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArUA0TJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si19441779jac.86.2021.08.31.20.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArUA0TJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLGwV-0005uV-Ik
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 23:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuZ-0002e5-0B; Tue, 31 Aug 2021 23:27:39 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuX-0007Jx-7U; Tue, 31 Aug 2021 23:27:38 -0400
Received: by mail-pl1-x630.google.com with SMTP id e7so663615plh.8;
 Tue, 31 Aug 2021 20:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5t8z8W2/Z4HnNDfJxkUtulZXcpKeSL8+hbjbGr7gaxg=;
 b=ArUA0TJIJ0DUwnCvbGNlGvIYNv0YqgqsPZE38gsaIFGire7UT7708NYFnBAG2GZhDE
 2xX7Hh0LIeN6mZ/KF2RuOdDojdAUtLD8/pZHlnByKuD+M1IAWo/g9R0rJvQ2U9WI5x5u
 dwl5/WDvVBdx36GG9B8bQYNp3Hbc0FJaERTbojqGL0+9LsW7lU4xgcTMtoUxPrRitFy9
 ghwpXVZAXZ0Nf3kgSmuOwFv7V8vDFOQ6IpVlupxg2hrj2q5TZUmQ0VU3T06I79/L/Faq
 tUjlPBKoAUaOFMM5sZmZkFrwdE9L3/7g6CmXVcrNuh4bFe5XfKT5XDZCWvL9dXlvG6UM
 CgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5t8z8W2/Z4HnNDfJxkUtulZXcpKeSL8+hbjbGr7gaxg=;
 b=afWQ6JRGVBtDP1JFEXR+x63q/dWj4lGxFHsg08i3LpxhdXMwVXA90whSJl41xbHUjU
 vyphntfoVhd+l3bc3euJ59gZRJJx0vBGwyPwqD/uwtMmY82kGbPVLpNFvxlyN4SdmBnx
 kUjfqCcd3Xed47ujqALksrsvSoh7SNxCxVv941DEnpWVlw0F6m7j24bd7+GvCJjuolQO
 SpxF91MdJvAV2iN30ttAMANrL67Uoi4aXsbiBzAWDNDU4JyMgjAlNJm9gjxbOC4RKCWT
 VTrIk4z295EtwUgQNZrugEiVyc01P6vR1z+504gEKL7Vd0mt0mnLKOqZmxkF1lIj9M2K
 K+rg==
X-Gm-Message-State: AOAM5328vqxiY7Qv02RVxVyjslX5P9235XCTiROPOke74dUeCVZqdrxT
 2vSNeflRCD74uCq6+Jf8vIX7jJZuvJb5Wg==
X-Received: by 2002:a17:902:a415:b029:129:5342:eab7 with SMTP id
 p21-20020a170902a415b02901295342eab7mr7663547plq.26.1630466855399; 
 Tue, 31 Aug 2021 20:27:35 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/5] hw/misc: zynq_slcr: Correctly compute output clocks in
 the reset exit phase
Date: Wed,  1 Sep 2021 11:27:20 +0800
Message-Id: <20210901032724.23256-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901032724.23256-1-bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J07QKQdQGmAa

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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

(no changes since v1)

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

