Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF48D1F9A0
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:36:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kT-0001QB-QK; Thu, 04 Dec 2025 04:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k7-0001BU-3s
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:19 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k2-0003Ou-U1
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:17 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64080ccf749so1053393a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840910; x=1765445710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rkLVpmvYPi7YnLbLN1p5rsM99VpTuNA1PPyZs5DkRU=;
 b=UN6Dm/wZRDPKUrD1zahI5XqekPFj//tKKCJxVq3J/XLSJjomgF2rOv/bZiQG+w+IuX
 D/HlxBYJ/9e9IG6/SXfiZFfcTPOOFC0Q9WfWMJtsKr+nj7oZO5gfbJb6VjJELqg0mz2W
 gVHbhUUnkarfidd5rNX0OPZfpUcBQ0hoGN5k5+8veJ2k2aKheq/SXKtIHCo6D11puyQ5
 y+jqwq3p1MtmsKDhDniORaU9sQCK+AnnHeLR9O6ZPce5A41jpiFjslj6M1LUzQKbLwne
 qVlhiUrA/69h0aE/TyPqg5qY8PZlvYUCaqhFnQk+VYi4NzFReZdd0UY48iCmqw+G51Zp
 udgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840910; x=1765445710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/rkLVpmvYPi7YnLbLN1p5rsM99VpTuNA1PPyZs5DkRU=;
 b=HE+ywnL5aUIehOYgCyDhNWDac4BrjzVXd2Tz1jPnaVptSvn9NyBCDyG3VQbRQ/Wnyu
 RJ64CT3zzk4ywpwWCDFIjyPbetYfxB7S+DnF1dJq/3Qhve+IiHiAGu+rZQ+Z64JWE4YE
 AFLhhjA6M5z3+YVsjjPcbMb85+v0MLmN9wSD7vNLqm0DGlBL/kRErddLIzLQ+oDF6MmC
 OlFLruttnHJrPkXDvf3MpSji23MuavaTlytbLLWwpPPNBXk0zjTsZszpgjeYJrga6wO2
 xUGlTObU8T/tDD26PJUTGJe/jPgdXcHX9grjV+sKSJobgxDydqCk8Ts3EmjAWqLAKKqk
 MRMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzoORw97PcWM250E9Eroq6ie1x29dZy2jcLAnCkepuoB/8KpR8RBYmSGunELzFMXF1VZV39dstKQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRsvd5RjslLKU1ij62jpgBD7+d8ucI9QZ6Tre/M1417mjfGq7P
 pIJ5dEMUS18Xo7PSrLV6KFUsPGCg+Y9ruHNg28XruIxWXo9QsJgWgG85
X-Gm-Gg: ASbGncs08uf7T6uNvJKuYy5LDXGIk9LyITs72AaqO63uON4hjhFfxpoMT4hkt95CS/L
 U0c+OJrq+3MAaQUP+8kMtZ74vFuU2X3OWJHB5X4Iiud4ThQlw/hia6bqQIH6NVTp9/Z1qzn7TFV
 /4frCAd8+0OSpAXMVW5fc8vMN+tZcdfJ+T8mcFwcKOcdrfmQGzO3xMWbyGMCvX+KSu6PZ3Abr92
 AaLiYb6H9SioMGekJTtC7M3dqMIaWqcXuUwKdUtEY9MIsjwcXRPxbWkeg5JUovvpPs8TJq5kigK
 3jTpvy/Q5Fhs27GvHXi2eDb9cbSsxhAmhOL9qmPqkbzGmORLYAFYYdkjpLADcTvGvD3bE1P1X3k
 pLnSLb3JYbrAnKlTil/JuNy+4oj8Prq9kNYKhj0llZaJUzS9TyXvZIAMYP4BwrdXjOEe8TM/YBL
 lT79PgcN4+KVUYomjFB+PeTRYiv5jG6z0=
X-Google-Smtp-Source: AGHT+IEE/Dy9/q68MhBnUXI6cgvGWwaGEuHePLY892vj5mY8uUnlEdVaoLq+lNffPoqtZa1yM8JiKw==
X-Received: by 2002:a05:6402:4310:b0:640:f8a7:aa25 with SMTP id
 4fb4d7f45d1cf-6479c4b220cmr5051039a12.30.1764840910139; 
 Thu, 04 Dec 2025 01:35:10 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:09 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v5 06/15] hw/dma/zynq-devcfg: Simulate dummy PL reset
Date: Thu,  4 Dec 2025 10:34:53 +0100
Message-ID: <20251204093502.50582-7-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x52e.google.com
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
index 72f7b1f170..722d68a568 100644
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


