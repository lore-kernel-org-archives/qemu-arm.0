Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4CC982D9
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 10:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7VZm-0003Lf-TS; Fri, 18 Sep 2026 06:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1x7VZg-0003ID-IC
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 06:12:08 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1x7VZe-0007Zr-AK
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 06:12:08 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4858bc96fabso423323f8f.3
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789726324; x=1790331124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B+hQqjm9SfOhf2ajgDo0RLSHqaRysZxCYOMqoEpP3cs=;
 b=s+sTfumdAzkZS46GjixZAyCVe+tG+/H6HNm+pI5Inn9gdpstiRBKk9bj1uZ9dWtyMO
 XmNteOg1ELh0Qw8PqMpmJ74qZx3pHYrnMsZesCMl1+WDBcWywez85PMmGlNwxfR2j1XP
 M0nWjZyiKR8qluR8fHwtN7yGjREaSLiAArYKhTDx582eOw2f63GcsnYzVGZNzI80Lz71
 yvrLCpuniIe0J3ZI1CL7WCR+xkK9RVy5Q/KtpzPxWIQ+1JPxQeHVAhfKU9OQ2Yi4dGZ+
 dSMoTzT9G/NVSYrqBloFSndXOOb23A+SXeJtGWb5KutwkBqmFKARKnC03aTS3vewWzKM
 3hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789726324; x=1790331124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B+hQqjm9SfOhf2ajgDo0RLSHqaRysZxCYOMqoEpP3cs=;
 b=DQ2viDLXsMPxpmuHlhZCH+eBWWh/BezJBsXnGI4EmK9gIIi39y7YMhIVo+88YF9gbB
 opOJO10tbAmj6Zq4f8ifVoL20A8n3w3gwRfA3TecGmGruji+itmc2g4c0JGSDmjl3OG2
 EfLtk7Dl9KmvBg5iv86eRVk9/VrcObjBIL6P1kkPERD7A3Doga2v5WYNFo96NT+b7Nqs
 GjlS4MIAyBdN3GiH3nT2NZk1PcRxSGxSk46HgtA1kDuMNtYuFhDH5ONMKaxOQB9RCMUx
 OeTskjKGzJcDso0L7wlIWTB6nwkgUb19kZLt9tFjLCPtMYYdMHOX1LImR1/G4SU9yZTX
 xvvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzGBz042d/t6RdfL/rKGHWLFTZ/a4pQDBfL7fs8ZMROeX6uvYAidaIVoOtJ5QicJvEJQXWTL/awNQ==@nongnu.org
X-Gm-Message-State: AFuF++mzks+6qTJgMruysM5EMrHnBqKdrfNaJLIlxscftCaC1EZG68Yz
 hHBq/uxGsvtmgRsD/M3XxTzJSz2qtT92jvO9Uz1CtZ36cFOTL0XL2b3a
X-Gm-Gg: AYBFou0zLICBNiQPbzgFM6rwdtJ119dLm/LOfPTjQFXtfRWMJXR0avVGfnrSVI9G1dF
 goMDpzRAUshhL1yvojeernh93NYMCBNGDcpwuDitJ4poz5Z8KXeh+aS8vEFe/z5BXH4ovv/6mdh
 QNRvwDT5xYPVGRTxySdGw7GnzHvmZZfLSe2WRGn0txOKqhxUEIyGs+zuUIRbyBlReZuRp+r5uEi
 fRDiATloTutzQ/TJabCrl9nF06Y/7VNnHVewmESTvIho/cWAoUsBC0ezJDqBnN05y0RKUgr1qAr
 PeYxt/6ik6gPe7JlOl6zySS0cTNiHlX6toHI5u11Bn0Ch4vbH7uMUMg035igMlaosw9euvGLgnz
 b6ehrFpJ1Ev7cf24zzE7dOCTwFizbWcUp7milMhnKq8w+vEndFfsIEjTKTqQF4NkcWKKtpl5wUE
 8BPoBZJhheKxesBQ6jLPO9d/+hs/G2A2+IOXxBFtEiG0IwQzRIWSgJAAyHjs8zr7GO7VFRPYKOd
 48rldYGDQMNZdDWwLvU/dy1KfjUeQcH
X-Received: by 2002:a05:600c:674f:b0:49d:4ef:bf70 with SMTP id
 5b1f17b1804b1-49fc56aef4fmr23457615e9.10.1789726323573; 
 Fri, 18 Sep 2026 03:12:03 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc20:5e84:de9d:56c6:df83:7819])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd225898sm153886245e9.9.2026.09.18.03.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 03:12:03 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Corvin Koehne <C.Koehne@beckhoff.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yannick Vossen <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v8 3/7] hw/misc/zynq_slcr: Add CPU clock outputs and ratios
Date: Fri, 18 Sep 2026 12:11:54 +0200
Message-ID: <20260918101158.42101-4-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918101158.42101-1-corvin.koehne@gmail.com>
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: YannickV <Y.Vossen@beckhoff.com>

Add CPU clock outputs and derive the related domains from the base CPU
clock ratio. This makes the CPU clock domains visible and keeps their
ratios consistent with the hardware clock tree.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
---
 hw/misc/zynq_slcr.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index d0f899c3be4d..86f8685d2b2e 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -61,6 +61,13 @@ REG32(DDR_PLL_CFG, 0x114)
 REG32(IO_PLL_CFG, 0x118)
 
 REG32(ARM_CLK_CTRL, 0x120)
+    FIELD(ARM_CLK_CTRL, CPU_PERI_CLKACT, 28, 1);
+    FIELD(ARM_CLK_CTRL, CPU_1XCLKACT, 27, 1);
+    FIELD(ARM_CLK_CTRL, CPU_2XCLKACT, 26, 1);
+    FIELD(ARM_CLK_CTRL, CPU_3OR2XCLKACT, 25, 1);
+    FIELD(ARM_CLK_CTRL, CPU_6OR4XCLKACT, 24, 1);
+    FIELD(ARM_CLK_CTRL, DIVISOR, 8, 6);
+    FIELD(ARM_CLK_CTRL, SRCSEL, 4, 2);
 REG32(DDR_CLK_CTRL, 0x124)
 REG32(DCI_CLK_CTRL, 0x128)
 REG32(APER_CLK_CTRL, 0x12c)
@@ -98,6 +105,7 @@ FPGA_CTRL_REGS(3, 0x1a0)
 REG32(BANDGAP_TRIP, 0x1b8)
 REG32(PLL_PREDIVISOR, 0x1c0)
 REG32(CLK_621_TRUE, 0x1c4)
+    FIELD(CLK_621_TRUE, CLK_621_TRUE, 0, 1)
 
 REG32(PSS_RST_CTRL, 0x200)
     FIELD(PSS_RST_CTRL, SOFT_RST, 0, 1)
@@ -206,6 +214,10 @@ struct ZynqSLCRState {
     Clock *ps_clk;
     Clock *uart0_ref_clk;
     Clock *uart1_ref_clk;
+    Clock *cpu_1x;
+    Clock *cpu_2x;
+    Clock *cpu_3x2x;
+    Clock *cpu_6x4x;
     uint8_t boot_mode;
 };
 
@@ -286,14 +298,31 @@ static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
     uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
     uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
     uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
+    uint64_t cpu_base;
 
     uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
+    uint64_t cpu_mux[4] = {arm_pll, arm_pll, ddr_pll, io_pll};
+
+    bool use_621 = FIELD_EX32(s->regs[R_CLK_621_TRUE], CLK_621_TRUE,
+                              CLK_621_TRUE);
+    /* Select 6:2:1 (true) or 4:2:1 (false) CPU clock ratios. */
+    uint32_t ratio_6x4x = use_621 ? 6 : 4;
+    uint32_t ratio_3x2x = use_621 ? 3 : 2;
+
 
     /* compute uartX reference clocks */
     clock_set(s->uart0_ref_clk,
               ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
     clock_set(s->uart1_ref_clk,
               ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
+
+    /* Base is CPU clock (6x/4x domain). Derive other CPU domains via ratios. */
+    cpu_base = ZYNQ_COMPUTE_CLK(s, cpu_mux, R_ARM_CLK_CTRL, CPU_6OR4XCLKACT);
+
+    clock_set(s->cpu_6x4x, cpu_base);
+    clock_set(s->cpu_3x2x, cpu_base * ratio_6x4x / ratio_3x2x);
+    clock_set(s->cpu_2x,   cpu_base * ratio_6x4x / 2);
+    clock_set(s->cpu_1x,   cpu_base * ratio_6x4x);
 }
 
 /**
@@ -322,6 +351,10 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
 {
     clock_propagate(s->uart0_ref_clk);
     clock_propagate(s->uart1_ref_clk);
+    clock_propagate(s->cpu_1x);
+    clock_propagate(s->cpu_2x);
+    clock_propagate(s->cpu_3x2x);
+    clock_propagate(s->cpu_6x4x);
 }
 
 static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)
@@ -619,6 +652,10 @@ static const ClockPortInitArray zynq_slcr_clocks = {
     QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback, ClockUpdate),
     QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
     QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, cpu_1x),
+    QDEV_CLOCK_OUT(ZynqSLCRState, cpu_2x),
+    QDEV_CLOCK_OUT(ZynqSLCRState, cpu_3x2x),
+    QDEV_CLOCK_OUT(ZynqSLCRState, cpu_6x4x),
     QDEV_CLOCK_END
 };
 
-- 
2.47.3


