Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp78315lfb;
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDyqUEyGZb2wULIhEXiFCAX8VpibBzl2F/gCR7jW5Ew0alDdw62CMs9uC1KHJ7fxenfV+e
X-Received: by 2002:a92:cf08:: with SMTP id c8mr23451193ilo.246.1630466980420;
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630466980; cv=none;
        d=google.com; s=arc-20160816;
        b=WEv0vJULznLRVQ6lhnWRwEpIJT5lyzv+15h1iHUWHXHgoqPLgDL3XI2jCANcY+MlPE
         0LbDWFEuMAMsJSq0uy8ox5trik8/41b7lNtO18ygGpje4uSvP53yukAGw/EUiB8rOn36
         2SLhAwUmeggvWqW6Mfz/cczkyqnUnfgP+4fsI/Vu5hu0CxNHI50TprkSaeMR1Xw9Rhnn
         alrkzr2UVcxtVfRlofKuGjmtGYiiQ5smPcwbKnER7qHgImp4BeJhtVblArmewlfgeLfk
         hQHakX+v1LCDfFHteNMgImgdrkncQaIMIyDzHBEkkhrudxaNgAVsYRMRQA9KYkznDaJb
         laSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OlYdG5CL+Flfktq7nA7fm3IZi6O9XqY7j7tbZJONm54=;
        b=FfOCfg7NAaEyKezdmJNRiYnBdltuEj+V2l7HN6AsxbN3MJ/rJtqnfkJrwfsg97fCny
         Sqd+LI1Oud5ey8qwunmHnjyCRh/Ug7M6TUmp/UxA2JjSKQnzQFcPhIiZwRMJEsJJ3GVf
         XM//May4gsfQ+35KKbrCOpaJ1Ekg1RiAdO1L3sxxB3H7wy3W+Ou6m5+5WM3HUc32r31X
         SX+5B/aLEm05ISQvnh5zCJtoopPGMIhh5S6qsyEOUEs0CteQRwlt0JqusB6EcFQ4VwJX
         x9mdVIZUgLSeVxd2Qve8kjrIjUqoQaKSXkxJoKC1XKoy+2R6w+RPqMaFKCXarShpMd6d
         2dHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=k+qW6L40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si20487046ilf.112.2021.08.31.20.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 20:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=k+qW6L40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLGwV-0005u7-LK
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 23:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGum-0002wV-Lf; Tue, 31 Aug 2021 23:27:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGud-0007Ni-Ot; Tue, 31 Aug 2021 23:27:52 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u1so674058plq.5;
 Tue, 31 Aug 2021 20:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OlYdG5CL+Flfktq7nA7fm3IZi6O9XqY7j7tbZJONm54=;
 b=k+qW6L40H3D6wKBWfcfK/pzvrYEwVP5XD02SkVm3fWZkb5EWwkoMwtZ8oUbhnGjiO7
 JuiIJ+nTgUVFFoY0t6GTPxs9SwKm8ycsXEJcetb7KIqy6ofUQErLpBz1dknnhYLIfeV+
 NE7Xy3c/i+/WCxS7/c4677ZZhSn0JD4QHHr6ULdmPNvyzVWsd7BlAmmD2O5bElkozQad
 bF/zYcCjuynIRszCEbkoR/1rOljZw7P/bmQGZLao+MmhSoZ4sRCBbiHhO9mYDAhYH837
 XHnJFj+CmLC6kE/ajt3VnL2vBSFD3mWgwFpJy+wMeKz1hT0NBt2uK1J0DGuC2B7ZrRcU
 dDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OlYdG5CL+Flfktq7nA7fm3IZi6O9XqY7j7tbZJONm54=;
 b=m4AMTu/TkCB9ROuCWly3pNPq6hi0kOeXXjd6ILY+jCX0gON+h7ta2ihvgejiVsKuEh
 zUEbjL2T/sgYkr2rW+zYtE7ZOH103rdAF8zblIrHIHLvQB+huT1Ylzwl643C4hUzvZ34
 Bya7VFzBxAhvJa61L/lZ+cA7jWFKGDInDN8HSLEiDpQcLYabf+fQnS6irjGBlnZ43j6U
 T9kD5FYWgK9pAqIwAxa5jayrQjJ1Czczx/fdgrQAhXzXSvDo+4AktZcg2F4f7giUKCUL
 V8e1J7SV3XfqjtHc1GEf/p3R6Ax//peuKHcAQKoPp03q23kooE3cUI3V473uP5aLQdX/
 D6Xw==
X-Gm-Message-State: AOAM531rB519jyfLpJYS11l3t1rxTDG5KynbqHjrKsPibpxMHCltnDIf
 Yb9eq9rqqdLq5PlOI0dEiKI=
X-Received: by 2002:a17:90b:155:: with SMTP id
 em21mr9245848pjb.116.1630466860544; 
 Tue, 31 Aug 2021 20:27:40 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/5] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
Date: Wed,  1 Sep 2021 11:27:22 +0800
Message-Id: <20210901032724.23256-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901032724.23256-1-bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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
X-TUID: 5v83Mj7ED21i

Currently the clock/reset check is done in uart_receive(), but we
can move the check to uart_can_receive() which is earlier.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- avoid declaring variables mid-scope

 hw/char/cadence_uart.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 154be34992..fff8be3619 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *s)
 static int uart_can_receive(void *opaque)
 {
     CadenceUARTState *s = opaque;
-    int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
-    uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
+    int ret;
+    uint32_t ch_mode;
+
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return 0;
+    }
+
+    ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
+    ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         ret = MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
@@ -358,11 +366,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
     CadenceUARTState *s = opaque;
     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
-    /* ignore characters when unclocked or in reset */
-    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
-        return;
-    }
-
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
-- 
2.25.1

