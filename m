Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp286807ejb;
        Thu, 22 Dec 2022 13:57:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukjPmyDehb3n7K8fjSBp2QwOLoSLF1hzcjtmXmOTF85UndkbuFbdF9/lcpYvTDDc6I+mAL
X-Received: by 2002:a05:6214:3188:b0:4c7:1a90:2297 with SMTP id lb8-20020a056214318800b004c71a902297mr29167374qvb.41.1671746233175;
        Thu, 22 Dec 2022 13:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671746233; cv=none;
        d=google.com; s=arc-20160816;
        b=pt5i7BzwlRZdue+oaA44TzQ5vRVtwg56Pe92Pv+KnEg/VGf7yZqfE8SvAu5roWjzKj
         /N9DON2iiROq0vbZfR9lXbeq3qp43AkYz2/OkyLr1Rqq1oFJlI0U6wEoCw9sSuLrCMzs
         hlOLLFDSi55EfAJM9FVe6Kpt1rwm9TduJOhQDMHWo4c9GVtRDOlCCPNc/I5csyVNUBJl
         bbpvGh2dEFEsrM5G9kF4dXY2qedKf0po3Pp+dXP+TtUkExKswpb0Gz/K/lyb2od2n711
         LIZIX+Fd+rWWKGhYd6SVBD7bzvLLxi1HULHZnG7Ovy7/ASJZesq8xCw6oe72TYLWV9g9
         zlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oaCMViCuj4W9XyEnm5VQb8sPut9cn3g3RlnYgzpwXls=;
        b=lS4a8rmvP6R5RGpfkuJ0tUNyQCy6o2BK//AecThorlvKbgjDBtQ6rufzcLdi3Ee8sV
         eCyiY0bJhteDTUptF8vFIbrVyxRWRIhpAo48igif6RNLiOsOPSFqabF8szzzYgghlgMt
         s0ifQFUEddMw5sTHD/qTyaj2gc8JcfE7l8BjaWGq8eXh9IJKWHZTA2ZPOnMEZw8vm+/4
         Klkvhvlp7SlYB3B2XXuvntP/cmv+lihI7wpkd6nDmjShnHQCzMIuixe1g53lxlZT7nyA
         A79t/AlkTngS8CGioVuxqARQQP8WbcmzZNtAijTWZ7hOrH+0Dm4GFMenHsWrf7iuKfKn
         Ri7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b63W81rK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n71-20020a37404a000000b006ff5f75ada7si559689qka.161.2022.12.22.13.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 13:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b63W81rK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8TYk-0006Uy-TA; Thu, 22 Dec 2022 16:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYj-0006TV-77
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:57:01 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYh-0007EF-ET
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 16:57:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id i9so4767281edj.4
 for <qemu-arm@nongnu.org>; Thu, 22 Dec 2022 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaCMViCuj4W9XyEnm5VQb8sPut9cn3g3RlnYgzpwXls=;
 b=b63W81rKmo4/ZnXugf6jX8/2b0n871C2CAv6YBF7wVsUO+p0rhxKUe3xLhiobUCKbk
 4fJPeXp7s0bM5I0J5UR03+whgmV/+06B7XinRm6gmT2JTtGVt67SnbecTEKjvv8JzVQ4
 PwJbBgk45AJ7195pPg2J7xIJRYMa78j63MyH4J3QMmjyKFyz9eC+HKROHiJCV06v/4T8
 9+EtVUPRf46b0PeHSLluzF7d5eHcykEuZYLZct4vgBv1+wRjhUw2znsi+qlXTEqMzCTI
 FR1IueVwJpCIAnPbgX13TIlrmFDFHbI0mq/Q3SZYgHWJowpxIh606AUPbFDrMPzg4BSv
 mAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaCMViCuj4W9XyEnm5VQb8sPut9cn3g3RlnYgzpwXls=;
 b=W6+mC6MWimcVJyD9eC8uc8WtNCAt600Y7K6fC8DjV9IvuuGub391eAwZmG6rrZtKq0
 P2Ksb65HuWng+3w2YiCValkc3EaM98dfXwVuJsZo4/T7frpHZdjetntA0tJuTqQ/PCf5
 gLNDBE4j8ZRE0aduTmdfqKOnnOKt22nqZGIQS0qbEpnXoUIGbtFdARMS8gz2GgjKq4v2
 SjkeeRKX5aZeT9dBOmLwO0CAPIeOgwne+wVI2Mj1FHnKuRWK397TZjN7agFAKjTt0DGB
 yQ05I5k3xSiXD9Ecz6r3aZiTXBUixlQCKeZCubA5m+L5daZty4Cn6X1C7wsfi6JY6mfR
 Nv6Q==
X-Gm-Message-State: AFqh2kqGz4KTKuU0r+ez1h1G2/Sx1e2/VHBrHFtZuUa318UiJeyzVwJy
 MkLJ8FlM0o4TTQZbovGmBjz5Jg==
X-Received: by 2002:a05:6402:4141:b0:461:8be6:1ac4 with SMTP id
 x1-20020a056402414100b004618be61ac4mr6322707eda.20.1671746218073; 
 Thu, 22 Dec 2022 13:56:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020aa7c90f000000b0046aa78ecd8asm803616edt.3.2022.12.22.13.56.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:57 -0800 (PST)
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
Subject: [PATCH 6/6] hw/arm/boot: Remove tswap32() calls and constify
 board_setup_blob[]
Date: Thu, 22 Dec 2022 22:55:49 +0100
Message-Id: <20221222215549.86872-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: T19s/tdyZy+m

ARM CPUs fetch instructions in little-endian.

board_setup_blob[] encoded instructions are written in little-endian.

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
 hw/arm/boot.c | 52 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..22a100f19b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -189,7 +189,7 @@ static void write_bootloader(const char *name, hwaddr addr,
         default:
             abort();
         }
-        code[i] = tswap32(insn);
+        code[i] = cpu_to_le32(insn);
     }
 
     assert((len * sizeof(uint32_t)) < BOOTLOADER_MAX_SIZE);
@@ -222,34 +222,33 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             hwaddr mvbar_addr)
 {
     AddressSpace *as = arm_boot_address_space(cpu, info);
-    int n;
-    uint32_t mvbar_blob[] = {
+    static const uint32_t mvbar_blob[] = {
         /* mvbar_addr: secure monitor vectors
          * Default unimplemented and unused vectors to spin. Makes it
          * easier to debug (as opposed to the CPU running away).
          */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xe1b0f00e, /* movs pc, lr ;SMC exception return */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xe1b0f00e), /* movs pc, lr ;SMC exception return */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe)  /* (spin) */
     };
-    uint32_t board_setup_blob[] = {
+    const uint32_t board_setup_blob[] = {
         /* board setup addr */
-        0xee110f51, /* mrc     p15, 0, r0, c1, c1, 2  ;read NSACR */
-        0xe3800b03, /* orr     r0, #0xc00             ;set CP11, CP10 */
-        0xee010f51, /* mcr     p15, 0, r0, c1, c1, 2  ;write NSACR */
-        0xe3a00e00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
-        0xee0c0f30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
-        0xee110f11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
-        0xe3800031, /* orr     r0, #0x31              ;enable AW, FW, NS */
-        0xee010f11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
-        0xe1a0100e, /* mov     r1, lr                 ;save LR across SMC */
-        0xe1600070, /* smc     #0                     ;call monitor to flush SCR */
-        0xe1a0f001, /* mov     pc, r1                 ;return */
+        const_le32(0xee110f51), /* mrc  p15, 0, r0, c1, c1, 2  ;read NSACR */
+        const_le32(0xe3800b03), /* orr  r0, #0xc00             ;set CP11, CP10 */
+        const_le32(0xee010f51), /* mcr  p15, 0, r0, c1, c1, 2  ;write NSACR */
+        const_le32(0xe3a00e00 + (mvbar_addr >> 4)), /* mov r0, #mvbar_addr */
+        const_le32(0xee0c0f30), /* mcr  p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        const_le32(0xee110f11), /* mrc  p15, 0, r0, c1 , c1, 0 ;read SCR */
+        const_le32(0xe3800031), /* orr  r0, #0x31              ;enable AW, FW, NS */
+        const_le32(0xee010f11), /* mcr  p15, 0, r0, c1, c1, 0  ;write SCR */
+        const_le32(0xe1a0100e), /* mov  r1, lr                 ;save LR across SMC */
+        const_le32(0xe1600070), /* smc  #0                     ;call monitor to flush SCR */
+        const_le32(0xe1a0f001)  /* mov  pc, r1                 ;return */
     };
 
     /* check that mvbar_addr is correctly aligned and relocatable (using MOV) */
@@ -259,15 +258,8 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
     assert((mvbar_addr + sizeof(mvbar_blob) <= info->board_setup_addr)
           || (info->board_setup_addr + sizeof(board_setup_blob) <= mvbar_addr));
 
-    for (n = 0; n < ARRAY_SIZE(mvbar_blob); n++) {
-        mvbar_blob[n] = tswap32(mvbar_blob[n]);
-    }
     rom_add_blob_fixed_as("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
                           mvbar_addr, as);
-
-    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
-        board_setup_blob[n] = tswap32(board_setup_blob[n]);
-    }
     rom_add_blob_fixed_as("board-setup", board_setup_blob,
                           sizeof(board_setup_blob), info->board_setup_addr, as);
 }
-- 
2.38.1

