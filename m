Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1464725lfg;
        Sun, 22 Aug 2021 19:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDIjZAj9UUX7QMy13bzC0eU14eRBV5QkQWzGvkbRqLyGT24wfJWkzE7AyiTUQV4H+XmX2F
X-Received: by 2002:a92:d741:: with SMTP id e1mr21212244ilq.18.1629684640740;
        Sun, 22 Aug 2021 19:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629684640; cv=none;
        d=google.com; s=arc-20160816;
        b=mtpJ34ZpC9vIzSr6WR3xDtn6hlDM3o7U5UvJCOWbe6gzfvrvoCQh3rM7LfqdcglGyl
         H1OWdLXttlDkDtMpul9Ar8R6lFsU8kDtkD43cDKA0L+sMj+XG7of6aBI4ruVwHJNBaCj
         /jRgdQln09ELIr+3yKGZnlnlz9YmRydf/d8hsX6xI4PpQfL/WpErJxtK88eBsSIbOu9M
         oBhQ+LNEhucwSwi5xLFZFpbP20oJLwRUuNfE6k1QpETbO5AxI5OaqNUykVgdWlMmbKSi
         RLVHhxuqZ3SX0sWrnakpe+S//qqAWQ75iEFLopX2/aKDVfV6sGTaG6rhPj0xiY+nTAEP
         aKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Hy7Ff52qHjcDuSbVdO/SFd5G6FprlXnCV76MTgKBecE=;
        b=TxyS45VNZ16na6ZAvnBBD5hsZgHbLz3pfqHpqdR8uErhc3gwUx17+NSSgBfCum+zT8
         v5VEgH/rRfLfRuMCflw6K5n74xsNEzTWpi/dVqpdVJAWUwcQkAImzB7HUcuSY1p53X+C
         y/EWIl0YrPMWzPklfoIBuENVKCuyZco8bA+Z0emmiOur5unwfu2NE++fZ8wvICR1dxUK
         ZQntdnk3oZ3k6KtLcuPxoodNJf8dqcQepcDuhP9Hll7IGnqT4ZY24a+NlGRMpHh/CT/+
         RA5nzJJj1UZAltrefkKDZrSICN7uQnoh8Asrp9UpgO9y5SeKL2nzwW2uQ5Ysy9zbznMV
         M2iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OB0QI6VU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si17398671jat.85.2021.08.22.19.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 19:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OB0QI6VU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHzQ8-0006uw-3L
	for alex.bennee@linaro.org; Sun, 22 Aug 2021 22:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzO4-0004UK-Ax; Sun, 22 Aug 2021 22:08:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzO2-0005td-JU; Sun, 22 Aug 2021 22:08:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso653869pjq.4; 
 Sun, 22 Aug 2021 19:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hy7Ff52qHjcDuSbVdO/SFd5G6FprlXnCV76MTgKBecE=;
 b=OB0QI6VUiB++ENtQOwLSN6XuD8Uxi12SKUaT8ZmxEaL3byb6Jd1CBN1WCVvggYNFNh
 wczFFVwhBy/1RvLe1ixKvQjv/nW0uT1gntYdUCR/ZJZ9FxLppb9pTo0IB1k1tfxU7YsM
 scsI9/s370YWIlPqjEr2TAR1qoPS5pKeRikiHT7qf+xvtWSKyLL32ac8yNx3H9RPqNAP
 gp3qsU/RxRUUcHyGSI3WOlfSZJU+y2+X0Gz3pEPcyrj5AbMp8iB9rDdZdfa7nhddWtbA
 Gcw0MifBNH6ABuQHL1yMTYjAe1D6TQJ+Z0dQo1PvupMOtmDUGOzpVHxfaexbofIKRgo3
 1H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hy7Ff52qHjcDuSbVdO/SFd5G6FprlXnCV76MTgKBecE=;
 b=iY5I9aTGlrqW94pGl7U6RbP5L8Tei5djZdtO6ALGyc82GLfGl6F47izrqBLXt2EtWR
 B3fc1zZKiGA0sLl+Xz6LffRI5htWJx/5PYoIuPQVDdM2w2ROR+94Kn/J95N8QiPNaCk4
 kV4bsDjLV+4z6ZKnPrlKJWPrdKgVDp8+5lmzLdIlbcYl3gEtFuFhCVT/hzTKT3+DiXaN
 3BvrIHIo66/i3PSxEl9PDwSJG6xqIju92wdnKmyILZwSWZq09kxRuPscZGtatmSR98Wq
 aTVQO/1jUUF/cCQFy1WiU4gfWIzJc2pJQOz98v3rLWrf8Tf+XMTNpfjL2JZjRa6qK4rZ
 EQug==
X-Gm-Message-State: AOAM5304BMPfQLtRhKT42XL4r6PxN33fUYnOEGQpG0wgvJOJayughYwR
 niSs4lnfsUPRHU531Zl+s0I=
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr17469269pju.227.1629684509018; 
 Sun, 22 Aug 2021 19:08:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e26sm13804358pfj.46.2021.08.22.19.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:08:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/3] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
Date: Mon, 23 Aug 2021 10:08:13 +0800
Message-Id: <20210823020813.25192-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823020813.25192-1-bmeng.cn@gmail.com>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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
X-TUID: b0CSIMX/tgGd

Currently the clock/reset check is done in uart_receive(), but we
can move the check to uart_can_receive() which is earlier.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 hw/char/cadence_uart.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 154be34992..7326445385 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -235,6 +235,12 @@ static void uart_parameters_setup(CadenceUARTState *s)
 static int uart_can_receive(void *opaque)
 {
     CadenceUARTState *s = opaque;
+
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return 0;
+    }
+
     int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
@@ -358,11 +364,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
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

