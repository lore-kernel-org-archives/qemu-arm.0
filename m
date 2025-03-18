Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2914636njb;
        Tue, 18 Mar 2025 06:10:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxYgajgvwPfdys/BUUmDu/6SBzVtPn2zAVQZTETveW0oRH9AuaE6zjwjiGGsXjw39LlO7iDYRgXhm84w==@linaro.org
X-Google-Smtp-Source: AGHT+IFMtx4DlTT9Tvum5xGOpvaXTxCaMZmkQjfasqfw9hNMMke9JnQYPUtJXVUsIy8e1FOu0sA8
X-Received: by 2002:ac8:5807:0:b0:475:ce:3c59 with SMTP id d75a77b69052e-476c8166e16mr262427001cf.30.1742303438458;
        Tue, 18 Mar 2025 06:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742303438; cv=none;
        d=google.com; s=arc-20240605;
        b=M+AZ5cTzvUxFa2vnYlqCH9ts8b7yEYvQEpa4VADsVNVDAaQXmDe5sWRuzSzI36Y3O1
         WCt0gijUQ/DTO7YBRIUH1NkfpdIniNH4eF9gkuz51ddgF9p7W/zGHNs4KrQrHZtSBcRr
         TeQ3mZCjNcwJapzwKC2VjWSnCec7fL0hN/9kPMBf1aPypBc7DMylNK5q93vZzr4Opmvh
         a0VQJ4BB/GlA666vr5UFjULpMKaTDt1c4+dUYqBY8HBAIHIOOOPrw67mZORTFWEDLc6w
         /dOXaa152PxKV+UlSf0JACU1obHZXGVfQ5MQk9wiEWJTjiNPr1bDb0bP7++SA46wM78x
         x3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uXgguamS/88zT4sb5yhR3Coxq4Lng1O5rbRFwYp/Un8=;
        fh=8EVprZPWJlntTalqt3EQQ2o5s+/rqqQ770azplIybdU=;
        b=VF7sRkRBKRrPAxvkXbp8wo5kaWQaKtymoDN/fRQkhhhwzG/kI5wjTvmhC9S6XKMk0y
         uL8+ilhmYonC6QTof6Mp4gl6/aMl7cbFULhbWHtC1P3iIbP0wxI34CQDA4ivGp9P0aCK
         JU2iUoPY041djbaseGHMMm+RGNYM8Uev3Hqxi/7MChxd0LoKw8Km2TyyrO8ZmSbW4SEv
         hnODNtkhMl22FbxmNIyhLREV/KAweKT7CTBwpiuMWtki8TnW9MqHkGvZvdW8mG400xgF
         PkRS6LX1fRqE9Xh9tAt56+FytvgVnJVaDG22RelwOZAYM7yVC9XkadWnp+l51+yVTwuC
         xtqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9o6ebsb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7d959csi126544951cf.322.2025.03.18.06.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 06:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9o6ebsb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuWhw-0007T6-PM; Tue, 18 Mar 2025 09:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWhn-00077R-2H; Tue, 18 Mar 2025 09:10:05 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWhk-0003KR-GZ; Tue, 18 Mar 2025 09:10:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so956375166b.1; 
 Tue, 18 Mar 2025 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303397; x=1742908197; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXgguamS/88zT4sb5yhR3Coxq4Lng1O5rbRFwYp/Un8=;
 b=R9o6ebsbhkP9cLWOYzX4g5UNnY3sYBbKu4KAB7bK/mZb+rq2AmFjfNlYhk4r4S99cq
 bMqtYa5ok/mKEsMIS3Au/Nu/wfejOMYvX2mXEhD1TVkCWK5DzjiP3m42HTipFrmIM6SK
 ZOac1/cuFaz3hXmoLT5297owLVoxT7ws84mN9Ltj2+d3HwHBUt6M4OO4Bzz+fhGb0mEU
 uxqCNEkO9IoYDz31TPFZwwG+XpLnnHYbrLqE5boeFGGYLbZaU+Dif7M41kh4eMZ/MEQ4
 zMTdxJTQYyzGP2jJ/eszVZo5zYhzk93MO1uvl1/BvFIOhRhVG9M2+IvLIxC/4qqTD+aS
 zpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303397; x=1742908197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXgguamS/88zT4sb5yhR3Coxq4Lng1O5rbRFwYp/Un8=;
 b=unfc83ZhUBBaqJzZsMEqYFzlMULN7MzUPSBdtLX4vAIszfRuJxlk1cefDVMd1p2/Ag
 DL27nwrxyLc580+Y68OjK5pgn7SJSjJFa3gnfytEcZXEWMc/fHsINsxW2XODO1c/wbfp
 kOaDmcUeItqN8atnIcZDFKO8iOVS6aEQPtichnxOAgxAu4/Pa3pZK0II+2yp6W66sGjq
 It6LLmbD2O3DpXIXGqPRK9L3+Kv2fwYvQ6dM0s16iQvoXWomPoVvWyfrXPnLXIbRdQ+G
 qa6wg2rz0g+NCHOCA/3BsgGOv3CrCUv38dbF41upJHQ+z2tiZKbBMgxSYXPjY2KIroPR
 1OfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT9nRpbhCCvekZQvyCdgYXJAWKKX/v6myOfrXOjy7w0fzYgw8V3iKfSqJ0ln/kbwUy/NOfuP4yWA==@nongnu.org
X-Gm-Message-State: AOJu0Yxrn8J9vAdR5PYClOI6+pQN3MuDcEfBCqrweSLGcUpg3RxfpbOU
 jO+pFvg44iHCXD9nhnTslh0MMbcYlMzYu/C6NeyWl8qhx/+v55EyknOxDzql
X-Gm-Gg: ASbGncvCeKe5DSWQzbh1nt2wg8MzMGPTHeTiQOlBFzgQQkCfPOq3+j4MxYJtxiURJHH
 U+U4Gd+h11ChbOoCtBmF7cgm7GF2ukQdRWbXrs/nVj3Y09049Awrx2Uef8lqp/3BFwUXb5bn8Z0
 5C1+v2EvDxi2du6l5sirEMx/bmnCM9NwpJqlOuKfpo86Ybe4T8k2YiMFHFsMBejcotnAplhDb63
 TZKBg7QLD+h3DrAg4C9XrnX+qPzsqcx9xluurh/l3beRyv6pTWxVdEvOB6F6FkAnuKasgcpBZ0V
 i410SlNddAjCQKyyLfAaiGEA7V8GlBGn3VQ29+nD1IFxjiU5HxP3fdjmzLxoGTkw479C2nDSkIQ
 pbA==
X-Received: by 2002:a17:907:2d89:b0:abf:6cc9:7ef5 with SMTP id
 a640c23a62f3a-ac3304d6079mr1804692866b.47.1742303393389; 
 Tue, 18 Mar 2025 06:09:53 -0700 (PDT)
Received: from corvink-nb.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f3101sm850678066b.69.2025.03.18.06.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:09:13 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>, YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH 03/21] hw/dma/zynq-devcfg: Handle bitstream loading via DMA to
 0xffffffff
Date: Tue, 18 Mar 2025 14:07:54 +0100
Message-ID: <20250318130817.119636-4-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318130817.119636-1-corvin.koehne@gmail.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I+ZpyfkMLdzD

From: YannickV <Y.Vossen@beckhoff.com>

A DMA transfer to destination address `0xffffffff` should trigger a
bitstream load via the PCAP interface. Currently, this case is not
intercepted, causing loaders to enter an infinite loop when polling
the status register.

This commit adds a check for `0xffffffff` as the destination address.
If detected, the relevant status register bits (`DMA_DONE`,
`DMA_P_DONE`, and `PCFG_DONE`) are set to indicate a successful
bitstream load. If the address is different, the DMA transfer proceeds
as usual. A successful load is indicated but nothing is actually
done. Guests relying on FPGA functions are still known to fail.

This feature is required for the integration of the Beckhoff
CX7200 model.

Signed-off-by: Yannick Voßen <y.vossen@beckhoff.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 0fd0d23f57..b838c1c0d0 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -247,7 +247,14 @@ static uint64_t r_lock_pre_write(RegisterInfo *reg, uint64_t val)
 static void r_dma_dst_len_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
-
+    if ((s->regs[R_DMA_DST_ADDR]) == 0xffffffff) {
+        DB_PRINT("bitstream loading detected\n");
+        s->regs[R_INT_STS] |= R_INT_STS_DMA_DONE_MASK |
+                                R_INT_STS_DMA_P_DONE_MASK |
+                                R_INT_STS_PCFG_DONE_MASK;
+        xlnx_zynq_devcfg_update_ixr(s);
+        return;
+    }
     s->dma_cmd_fifo[s->dma_cmd_fifo_num] = (XlnxZynqDevcfgDMACmd) {
             .src_addr = s->regs[R_DMA_SRC_ADDR] & ~0x3UL,
             .dest_addr = s->regs[R_DMA_DST_ADDR] & ~0x3UL,
-- 
2.49.0

