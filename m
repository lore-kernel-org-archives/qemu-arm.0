Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp286710ejb;
        Thu, 22 Dec 2022 13:57:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuX1k+uEm7iqnyh6Qvm9aNEKKlifZGPMnR6x+jOUEGwmCsIPVWk1nvPVzSTTeB4cF15G9Bx
X-Received: by 2002:ac8:5499:0:b0:3a8:104c:11cd with SMTP id h25-20020ac85499000000b003a8104c11cdmr9009702qtq.35.1671746221235;
        Thu, 22 Dec 2022 13:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671746221; cv=none;
        d=google.com; s=arc-20160816;
        b=J23v+An4hUqa/uPP/A/CRa2FxeFV1S6ZRjYwhfgINqfuoRHljdvzFVHbuZoolmadRc
         6pCM49A9CLeZ69yxP5LbJXGXHMbYa5M60tasbnRZKrvVGzLK/9DV1GTwe+PvBldi5DJY
         VLCEFjuRT5WMiZqlKEnBx/LmsZ6TGlZHsS5Gbyj1F6Wb7CAD6AAQEulR0RXXrfVzpIz1
         J2hSTnKaxjECRrw5Hi/bqHNJIvwcrV5rXjmtMIyD07y2QuAmsFWaCUBJ8WLZ6TjBJ5N8
         9LI+lrRZLDQoLvgnyRzHj+vvadUv9m9RfeoeAACgsmatF61gGh1D0R/OX0wkWHmOf2Ov
         0E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eJ7KNsaeAIcuwibRTmPK9N9xgsftdW4nEKhohT2Tqnw=;
        b=DTht4qYo5GAxQfI3kr7DPv17Z64H54oBU0obBxi26YIrHNgTPmjhCCrhP9qh7vL4eR
         kT922rB/SjbnE1rlvZdlwlakoYgyVIttRT3Cvg5l3X42kHGlQs5oK/H4JTtpYw4XeVMB
         H9dgcYA55bgiE/gB8M5pNcM+NCNqkfxicl3WTpHcNcNtTqAhyKlAbc8bUGBNuSHbe7Ps
         zpJJN48uSGGG1qLAIvyemv9SXzR2ftndSdhFPbFZyxn2B6+bEvYnjQBrtShFq50l7iS9
         rv2Bv7CzdKnMoGaIT1qLp8wbRbQOHlLe5oWvJqsm0fl+2XA/6244TMj4X/jvVcNNpWW0
         0iDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iEJLpHzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020a05620a28d000b006feb9d4e1efsi579605qkp.254.2022.12.22.13.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 13:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iEJLpHzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8TYc-0006Np-7f; Thu, 22 Dec 2022 16:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYZ-0006JU-PB
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:56:51 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYX-0007Dd-CZ
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:56:51 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vm8so1115506ejc.2
 for <qemu-arm@nongnu.org>; Thu, 22 Dec 2022 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJ7KNsaeAIcuwibRTmPK9N9xgsftdW4nEKhohT2Tqnw=;
 b=iEJLpHzxwaMTP58pZ88b0id+U1wBqsANL8xy71bWCVFNFM5kcDG3ZdVXfazrcPtyX/
 ixcgwz+TC0oP0uRW97t/ytQ+1XJdlDOFCwuC/hjbSiIu/IMX9NUMtXef0b+/rjzN6iaG
 wsFz61/5/GT/yfanAI+qySmtDVLSMasDNPux5GBjDmQ3RamY1zvRJ5gDjKuoEN8BaIGg
 /hqnFlGpvU+xN5E/MOOZj0aavFIXbWtp9CcjTT5txDXZp+mVNxK/cIYN0FXI4s3UDx6s
 lX32iIwQD3rrfo/yVo0IAAOTWfhwD8XXnC5Rc1ZGXNyIEFKN+xvaZwWcLT4b85wIxC/F
 cJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJ7KNsaeAIcuwibRTmPK9N9xgsftdW4nEKhohT2Tqnw=;
 b=k8zuh4E31K5Uc59AsAxmYEDsdcyoNa25Z7IvPj/boXrQmV6poHVlBav5O3VALexakH
 0YUQqChjOrwdk1LzVTyrIRBcuY4T18ROfVpD7/qWh8tBLti9pSS7fhvP1QRfbnxyxMOj
 XPYqwKI4s8R+P53c/ncCbyEhQRJ1y7pq83xmZAHY23Q7b1lpgln83DbSQ6ZyoaIzI1yP
 s3cDyauf0ywyUglWK+LfybHXGxRhodPIdGeczlz/I5GlU7ZqpQgVOvaLTAc8MyTf0eCf
 x9MgbW/QNF7irzRXYcLAv8x2UlkNF/xADFvxBtotVTOQM/Khy6ED42WF7DRmOMQSSfOf
 Yy4A==
X-Gm-Message-State: AFqh2krurCXceKCD1cYOsNpONSMOMRajNzSPqEzeXHBLSpDcTlMYMS4K
 nuXEyA5YGygcc7vMnDoyYCpq+A==
X-Received: by 2002:a17:907:c28f:b0:7c1:eb:b2a7 with SMTP id
 tk15-20020a170907c28f00b007c100ebb2a7mr9430560ejc.13.1671746208107; 
 Thu, 22 Dec 2022 13:56:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s22-20020aa7cb16000000b00457b5ba968csm788692edt.27.2022.12.22.13.56.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 5/6] hw/arm/xilinx_zynq: Remove tswap32() calls and constify
 smpboot[]
Date: Thu, 22 Dec 2022 22:55:48 +0100
Message-Id: <20221222215549.86872-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jGCNCFQbMZwA

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.

We call tswap32() on the array. tswap32 function swap a 32-bit
value if the target endianness doesn't match the host one.
Otherwise it is a NOP.

* On a little-endian host, the array is stored as it. tswap32()
  is a NOP, and the vCPU fetches the instructions as it, in
  little-endian.

* On a big-endian host, the array is stored as it. tswap32()
  swap the instructions to little-endian, and the vCPU fetches
  the instructions as it, in little-endian.

Using tswap() on system emulation is a bit odd: while the target
particularities might change the system emulation, the host ones
(such its endianness) shouldn't interfere.

We can simplify by using const_le32() to always store the
instructions in the array in little-endian, removing the need
for the dubious tswap().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..4316143b71 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -71,6 +71,11 @@ static const int dma_irqs[8] = {
 
 #define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1) */
 
+struct ZynqMachineState {
+    MachineState parent;
+    Clock *ps_clk;
+};
+
 #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
                         extract32((x), 12,  4) << 16)
 
@@ -79,29 +84,21 @@ static const int dma_irqs[8] = {
  */
 
 #define SLCR_WRITE(addr, val) \
-    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
-    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
-    0xe5801000 + (addr)
-
-struct ZynqMachineState {
-    MachineState parent;
-    Clock *ps_clk;
-};
+    cpu_to_le32(0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16))), /* movw r1 ... */ \
+    cpu_to_le32(0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16))), /* movt r1 ... */ \
+    const_le32(0xe5801000 + (addr))
 
 static void zynq_write_board_setup(ARMCPU *cpu,
                                    const struct arm_boot_info *info)
 {
-    int n;
-    uint32_t board_setup_blob[] = {
-        0xe3a004f8, /* mov r0, #0xf8000000 */
+    const uint32_t board_setup_blob[] = {
+        const_le32(0xe3a004f8),         /* mov r0, #0xf8000000 */
         SLCR_WRITE(SLCR_UNLOCK_OFFSET, SLCR_XILINX_UNLOCK_KEY),
         SLCR_WRITE(SLCR_ARM_PLL_OFFSET, 0x00014008),
         SLCR_WRITE(SLCR_LOCK_OFFSET, SLCR_XILINX_LOCK_KEY),
-        0xe12fff1e, /* bx lr */
+        const_le32(0xe12fff1e)          /* bx lr */
     };
-    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
-        board_setup_blob[n] = tswap32(board_setup_blob[n]);
-    }
+
     rom_add_blob_fixed("board-setup", board_setup_blob,
                        sizeof(board_setup_blob), BOARD_SETUP_ADDR);
 }
-- 
2.38.1

