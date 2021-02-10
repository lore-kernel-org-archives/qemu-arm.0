Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1142904lfc;
        Wed, 10 Feb 2021 02:15:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB/kxwGqlPnjr8vD2aytakHeSGmVa8rgjmjpGunH14sV3QjNkYTnvk70RciQyC6l65xZV4
X-Received: by 2002:a05:6902:701:: with SMTP id k1mr3272333ybt.342.1612952143522;
        Wed, 10 Feb 2021 02:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612952143; cv=none;
        d=google.com; s=arc-20160816;
        b=DMvVk0uDpzm3C69lDguf+RvTzjYEwOs6VSncRMvA3e4x+8aVIVlKJWa5Rrj3R9Qyuf
         v1Vc5yF+Ib9CCnXrbrZDEXApGToiCEmMOtnaDPcOaeFcsK44l3oLW2qnsXkIN9tiwLlZ
         ZTWFCAJmNN7eRPngwjuIXMv6k4CAnUYHMeEEZuqeCqQET3BvRqvAw+wcgQ/PxsNxBbmj
         g+db0Wk4kDQ3WjEWYPtOXGM2gAIRlsY5DF3aqMCeGlDMMkhjK3jB0QJN/A6cFRkfe2+G
         IQeevWFQnj9UVLKSQ+lnx+oIzTnG0zQm8XkCh47PnzAJ1FdTiOhLsNkP2qzy3gfSILqS
         sw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=HgooUYReWht3R5owWvQqwU/EQ/eHh1JGCNZbl+Tx3t8=;
        b=tM0gRr2MYMwHmJ8d+nBTS/7U06J9zd8gLBBkpbLYTltXnpvipBoHHieF7/JabA/3me
         Zq/z/c8xjnaKBnU532ylCWCr+Qjr9xjGTkTXqkbcxlFEGUMh1B6ALeEA4Kc5HXA7L0oY
         33iUL36XGRKMrx5OGhECCoZhMUamgvtsfx4a6/K2EXrcJ7+W2YI5eX0MPqVF4/VDOh2Z
         sOF7sybzPqneta0rxvhvJTITIOXn330OEcAJyYnQdEVT/MySW0byeY9FOJEEW/ovXhMr
         eYdaawthHuw4QEW8RTpmBRbcV2dK7+L6eWJLMEGA8gU7+pyuKM5jV6GAuMnf9YmD1HGR
         ZjWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPjMKQHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si1928018ybm.306.2021.02.10.02.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 02:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPjMKQHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9mX8-0005Qb-VM
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 05:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSS-0000KR-6z; Wed, 10 Feb 2021 05:10:53 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSP-00036S-3v; Wed, 10 Feb 2021 05:10:51 -0500
Received: by mail-ed1-x529.google.com with SMTP id z22so2202024edb.9;
 Wed, 10 Feb 2021 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HgooUYReWht3R5owWvQqwU/EQ/eHh1JGCNZbl+Tx3t8=;
 b=oPjMKQHyICiOcbWHy4+v7LXW4LE3Wl/BxWeCHnPmXAcK8/pWX9tDiGhDR3N26pWySI
 xcU+Ca93DISmD5XGYpq9lmG+vOzA4vOVLvQrVhfpljFTngz3N2Z1gfarAU/Z81vT5QPR
 4ByTkW7w6OV/f4JTzZTxDmludxGfv3sSOWzQ0JM8ql8E39vd4HEXF8DLOLGhvn9xRzMH
 WijSuRGMkcBxUMi45RExlenm4TRP5iVocZ6nMaExTBOMx9Gm1leFNN13ZI+mMobMGs2l
 bJdcW3JN5pKsE/z30jUxqNMd1EpqBboQL2s+MokUtL4jprjdfBJERgCwWWmTGD1l0a0u
 4Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HgooUYReWht3R5owWvQqwU/EQ/eHh1JGCNZbl+Tx3t8=;
 b=Z3nP/wr/2zuEmQOmdiy1btEUsFqM/ghfRkQjjz9tV+I66Ph6uEPtPByJgWEtJyGh74
 gdfn4Eq1A4UUnbaiow59IJL0pLlpJSBs9j0LAoxMOwbPWAla9Z8S6Ve4c8RrBUljiQ4X
 lOnorC5M3Ved7BsmHz5j/UABxbrxhD96oYkVtiJoHxCdxnpA1CQ4laLisPVJEbngjjLc
 sfI35z+ZMtYfXQfvuxaoPG3nNcEe9mUjgfLW9QuNbIGihrzxOGzlxbfP1ZyKLckm1ihU
 cHC4cX4rKIaTBNhyUP7S0OZDj26UXvJ7uhI8oiEy8kYlKwdi9h193GNf/yqgiFxCrgiN
 3VSQ==
X-Gm-Message-State: AOAM531cukk+/RlmpnvMpsA5Ts2VHkVNmPUrtjHvelGUU2sR98K2O/Dh
 ++0pV/LjJatPyKoC4B9Bujw=
X-Received: by 2002:aa7:c351:: with SMTP id j17mr2398898edr.261.1612951847297; 
 Wed, 10 Feb 2021 02:10:47 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/5] hw/ssi: xilinx_spips: Remove DMA related code from
 zynqmp_qspips
Date: Wed, 10 Feb 2021 18:10:13 +0800
Message-Id: <1612951813-50542-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQmGuJC8m+/j

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Now that the XLNX CSU DMA model is implemented, the existing codes
in the ZynqMP QSPIS are useless and should be removed.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

 hw/ssi/xilinx_spips.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8a0cc22..1e9dba2 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -195,13 +195,6 @@
 #define R_GQSPI_MOD_ID        (0x1fc / 4)
 #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
 
-#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
-#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
-#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
-#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
-#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
-#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
-
 /* size of TXRX FIFOs */
 #define RXFF_A          (128)
 #define TXFF_A          (128)
@@ -417,9 +410,6 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     s->regs[R_GQSPI_GPIO] = 1;
     s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
     s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
-    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
     s->man_start_com_g = false;
     s->gqspi_irqline = 0;
     xlnx_zynqmp_qspips_update_ixr(s);
-- 
2.7.4

