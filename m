Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B378CCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeU-00024K-9u; Wed, 15 Oct 2025 05:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xeM-0001xU-3H
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xdp-0007E9-QJ
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:25 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so996471466b.0
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519867; x=1761124667; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAzXeDlEK8qSzXnIDjrAjNLtR8aANbiQ58/Bcioz01U=;
 b=H3vSA1t+PyJ1Dqj0IweTRWoAwTVdBUiS1qFdwArTwJ7378L0btypjuxQBfXTjg1xnf
 0Mp5pVSadIUsOdvh1Q0iWEefi7LZ3Hj5kXIF+TKPsdreMI6B49xH1qoObq9zsUavfakr
 AjE60csEqtUxqR0ziRs0LF+7MPXM1TypQC6je8kCaGJjYlydNk390tezff94xkB/cpR4
 0C/CKNJFqhZEAaAslHjokfhJ4Nu6+PqWUR+tTeP+W28OBG1HVjuB4t2Bm4LunSKJkMW1
 lcik9zsaFtjmM3OQB5456TBTktT+BsJlssg+Y9AVHAHSrkKtoXy53cfN98Q+9HZQv9Xq
 o3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519867; x=1761124667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAzXeDlEK8qSzXnIDjrAjNLtR8aANbiQ58/Bcioz01U=;
 b=j+oWaRS2AO/6LfO7fwUo8thU3R5y1bkW82mviafs+omyQYMp74p/Dm8bC2ZpX5+hHw
 wVxyjiLWGxEOavntaDy7tPmjMJ04+cv07VpUKhnnmSJnmu+efCcmnhfEuvs5UvQ+GcWD
 zyYhNrocXlyiNyjRYpZ6TepkZ1zC/GO0sijvkLqB79kBm+i7LPpmdlIAZ2THeRbR7JyE
 GWoX2bVIMCH2y7xSV3U280GtOeU8+LSztHc+lC8uC2hBG4jb/dsuYcJLW1tFHuk/Xsa7
 yH8dPVafbsVerR5upODGc3zs/dEJlNK3IGvFCDmkHYDnYXfj+lTBJ8x62tBfwYZ0pib0
 acvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8KSnokS13nT+G90jHYupPQbRKZknv7zYQ2QN9c60MqanndaAQNvdW36M1EPtKqaC4AgHptYA03g==@nongnu.org
X-Gm-Message-State: AOJu0YzHBy4ejldfnkt2SL+ckwgQnpALL7Pt70P+jcxJv4402JWl4D+6
 dMBBOoSafBeYMP2nqY0VY78j2IEsnVfi9m6/jyUUvFzUOVuVa6HNPGkk
X-Gm-Gg: ASbGnctZYejKlll1YkppxsaIXqLMs09IvGWx0+qmFuWCcy5WwUiQ4ydUtIEQ/zRATno
 5OUkQqtHnmTn/dYXs+UBf2nAnyT/YUlhk5hkmTGRjWKtE42JnnxWJlnk492NDCvFQRq0YbSJUKT
 ye4Mh18qyBeGB6cfWODKHWzgndHagrnG8XBWSYFgWbUAw2W5Mrp7XIU6I8OEGcBGWxQ40B/PfCJ
 JOiQLDkOwCbZqzEtHjKGqI5OMD4IE7mnByEkTN4ZUPWBkBqCyC1ilqLmq3Q0xg0YnQbHYQrrMRW
 MnHvKP9kYOEH2o3FK0DiKFPC0lXHxsBa71qcv+p/xhkAwAHAcAJJfE3ggetnEsztx87FdJrajol
 lEb7bbYN2R4vIyyLrQWPl9Mo/jch4ouEyq4sOr9UQOoyOgWp/zaJhlDGtbWlWnA==
X-Google-Smtp-Source: AGHT+IF3ocHUfPV/lptGradolyI4nOEpg+bL1Kgt2YrDClTJSQ3cTdze4tyaiOqAzGtD0BJ46uEJqw==
X-Received: by 2002:a17:907:7287:b0:b48:70a3:d45a with SMTP id
 a640c23a62f3a-b50acb0e5e7mr2837364166b.64.1760519867078; 
 Wed, 15 Oct 2025 02:17:47 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:46 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v3 06/14] hw/dma/zynq-devcfg: Simulate dummy PL reset
Date: Wed, 15 Oct 2025 11:17:21 +0200
Message-ID: <20251015091729.33761-7-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015091729.33761-1-corvin.koehne@gmail.com>
References: <20251015091729.33761-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x630.google.com
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

Setting PCFG_PROG_B should reset the PL. After a reset PCFG_INIT
should indicate that the reset is finished successfully.

In order to add a MMIO-Device as part of the PL in the Zynq, the
reset logic must succeed. The PCFG_INIT flag is now set when the
PL reset is triggered by PCFG_PROG_B. Indicating the reset was
successful.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index c875acd4ac..968131a691 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -49,6 +49,7 @@
 
 REG32(CTRL, 0x00)
     FIELD(CTRL,     FORCE_RST,          31,  1) /* Not supported, wr ignored */
+    FIELD(CTRL,     PCFG_PROG_B,        30,  1)
     FIELD(CTRL,     PCAP_PR,            27,  1) /* Forced to 0 on bad unlock */
     FIELD(CTRL,     PCAP_MODE,          26,  1)
     FIELD(CTRL,     MULTIBOOT_EN,       24,  1)
@@ -116,6 +117,7 @@ REG32(STATUS, 0x14)
     FIELD(STATUS,   PSS_GTS_USR_B,      11,  1)
     FIELD(STATUS,   PSS_FST_CFG_B,      10,  1)
     FIELD(STATUS,   PSS_CFG_RESET_B,     5,  1)
+    FIELD(STATUS,   PCFG_INIT,           4,  1)
 
 REG32(DMA_SRC_ADDR, 0x18)
 REG32(DMA_DST_ADDR, 0x1C)
@@ -204,6 +206,13 @@ static uint64_t r_ctrl_pre_write(RegisterInfo *reg, uint64_t val)
             val |= lock_ctrl_map[i] & s->regs[R_CTRL];
         }
     }
+
+    if (FIELD_EX32(val, CTRL, PCFG_PROG_B)) {
+        s->regs[R_STATUS] |= R_STATUS_PCFG_INIT_MASK;
+    } else {
+        s->regs[R_STATUS] &= ~R_STATUS_PCFG_INIT_MASK;
+    }
+
     return val;
 }
 
-- 
2.47.3


