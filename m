Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C63BC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:49:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhb8o-0008WK-H0; Thu, 31 Jul 2025 17:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapT-0001Zs-9G
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapR-0007wX-BM
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso106330f8f.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997324; x=1754602124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pz9zKdw2mAwFUG5tOQkJs8yneXKkyowJKPF8euu8n00=;
 b=EV9gm93jUFHfcb3/gr62rvYL656pVoqwvyWbRYy0XoShF95fyeAvNYQaexhY+z6LWq
 9MhNRSv53jn98jG14MSOaZuFmgrOUBKHibnz6VVU6WSMLLRbQvDTyh3jem481dWD5snT
 ZYv8id9c0v5CvgIPTU8UVBBj0+u2Ld6FSnvEewChId2mJ8pjg+rAWUZNFDJA0wcKHL/u
 Xmf6rsA+Ox3d4jIVw5GHPoRdkFIP+FhWPtaHAzJZsQ3aV4+4AaoVM71wtVA5iI2vnRz+
 QEKoguo1AV6RXEocTtVBMJs4geK1FRF+md/2rcrHQhV5YSACZb3DMoQZpnIdcPgAiAyS
 74Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997324; x=1754602124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pz9zKdw2mAwFUG5tOQkJs8yneXKkyowJKPF8euu8n00=;
 b=G66oL16VLwO+Iwlq/cklkEsB4xIsVVOC7Z/p/qnS4nFGjTyyFO0Zgq+4hcsImb3BM8
 LOCm5Ey5bfsQw8iBCz9EqwLpOUCnotWlQKldskjSANfvFFEq95kUbt0w09wZVTAu9YGE
 /LH/AIR69EJa6/wDuqLLHOp50Vt5Z5g1LGMyuvgs056kWryEhoV3aws+BgjeCVJTDTL1
 ezqVuAwyEpm5xVyf+E9yCDbacvZBNpXEfCTbtBuT4cdCSn5pq0BjLZfjPO87sZTFcWBp
 pkZdb2B0+lAY02nLNAcm6w//rPZ3Xw/tTV+V/+vAW6+fTREs/amY5omp+9AEmKdC32Hj
 ZtkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmS2T/7oLSV85q97yQAZm07Os/jixu34Aal3iTEVGgHaxK5dUmbN4q2W/j9gghXKk9Kh+lcZiQ9w==@nongnu.org
X-Gm-Message-State: AOJu0YwtE3xAdnHbgxP2dTD4KzSjPvjkl+ndDz0SwPgDxgjEwUCidhdB
 /Md07KBcCwa8qB+6jEDoJpu909nRJL81Szxax89lE4w15xiYB5DdUKehnp5EZlEiOSQ=
X-Gm-Gg: ASbGncsaFbfmtxqBwGwFY1r3osATj8CrW3n+dWlvfWe4eL0zLKZ+WWXJVJlMRRhcSno
 4BPib9FBA9Xuaaog5yOY4d1BQ3V0O5eV+RoEVIuWyGdvlyMVlHA57d0WZVAMtULCnl36wExZ3/8
 1OOGY5Bg2ywXBFenhB/y3/I3mmoNX4rTXwPjSQ8MUVFMY/OGYZDYpgdW17NkYEDTP0nJNgcKsCD
 hBIiFC92C+nkK1yx5rDZubG/KYDBUV9qIt+eJqavVnPW7FUDRJb20VK/Ejz+xJlhbHcxnK+k6JX
 fKlT0YXUkjrz7xKFvWypIoojtlGEaAwR3nuaaxwgjqe6Q2Pc+HOCoFPbM//eG9xi1VnTGVZIvKz
 0vLn+8Myb16D0UTDltFQjBWCXFdbj/5qtRWbi9eYvCi8ihxFPF88qUNp88yfRERrju4y+rhji
X-Google-Smtp-Source: AGHT+IEf9L3k7mfDKxCRxFGVv3T8l+t3zTYDAGh09vGam0zAIiUHP2i3KvQ/qNWaJmBtAOVyMC+K1w==
X-Received: by 2002:a05:6000:4310:b0:3b7:8914:cd95 with SMTP id
 ffacd0b85a97d-3b794fc2b55mr8104682f8f.7.1753997323705; 
 Thu, 31 Jul 2025 14:28:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee628fcsm40155635e9.31.2025.07.31.14.28.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 06/11] hw/sd/sdcard: Use complete SEND_OP_COND
 implementation in SPI mode
Date: Thu, 31 Jul 2025 23:28:01 +0200
Message-ID: <20250731212807.2706-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

While spi_cmd_SEND_OP_COND() is incomplete, sd_cmd_SEND_OP_COND()
is, except it doesn't return the correct value in SPI mode.
Correct and use, removing the need for spi_cmd_SEND_OP_COND().

Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 078bc5ef091..d6493d44734 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1402,14 +1402,6 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
     return sd_is_spi(sd) ? sd_r1 : sd_r0;
 }
 
-/* CMD1 */
-static sd_rsp_type_t spi_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
-{
-    sd->state = sd_transfer_state;
-
-    return sd_r1;
-}
-
 /* CMD2 */
 static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
 {
@@ -2034,6 +2026,9 @@ static sd_rsp_type_t sd_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
         sd->state = sd_ready_state;
     }
 
+    if (sd_is_spi(sd)) {
+        return sd_r1;
+    }
     return sd_r3;
 }
 
@@ -2580,7 +2575,7 @@ static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
         [0]  = {0,  sd_spi, "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
-        [1]  = {0,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [1]  = {0,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [5]  = {9,  sd_spi, "IO_SEND_OP_COND", sd_cmd_optional},
         [6]  = {10, sd_spi, "SWITCH_FUNCTION", sd_cmd_SWITCH_FUNCTION},
         [8]  = {0,  sd_spi, "SEND_IF_COND", sd_cmd_SEND_IF_COND},
@@ -2616,7 +2611,7 @@ static const SDProto sd_proto_spi = {
         [13] = {8,  sd_spi, "SD_STATUS", sd_acmd_SD_STATUS},
         [22] = {8,  sd_spi, "SEND_NUM_WR_BLOCKS", sd_acmd_SEND_NUM_WR_BLOCKS},
         [23] = {8,  sd_spi, "SET_WR_BLK_ERASE_COUNT", sd_acmd_SET_WR_BLK_ERASE_COUNT},
-        [41] = {8,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [41] = {8,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [42] = {8,  sd_spi, "SET_CLR_CARD_DETECT", sd_acmd_SET_CLR_CARD_DETECT},
         [51] = {8,  sd_spi, "SEND_SCR", sd_acmd_SEND_SCR},
     },
-- 
2.49.0


