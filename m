Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp892670ejb;
        Tue, 18 Jun 2024 08:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKw32VORYeGv0VbV0BdL6n+KDsRUx7eoshw7k0o0Oc4jtcI9sMSRMz6cAfaL28hY9IHMXAWAistN1Qao26w2X92ZQHBLaB
X-Google-Smtp-Source: AGHT+IFa1NdRP5eJfcoNXeChykyREJtaGYt3mmHao+NFTtGu5MFbIfD617GQe3Q0I2N9n3a9x1fz
X-Received: by 2002:a05:6102:1889:b0:48d:af56:5a50 with SMTP id ada2fe7eead31-48f130b788cmr87326137.28.1718725837839;
        Tue, 18 Jun 2024 08:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718725837; cv=none;
        d=google.com; s=arc-20160816;
        b=Plkw0M2zEezKExiXywDj/G1lcdvkec11IefuuWk6iJxbxpq4XTWDNcYzXLA6G1BrZ7
         38CxBiIn3bQ5YVPD+/KnVQlHLynQWAQgDmxpWseQPaqVV/BE75I4KPU36ily02THLrGD
         phYmhahEKw4rLGAQcBB2KCWqaXSM1a4fc8tLgMkLcgp46OXuDFBnx3wvl6Ki/E4NSllo
         CXL/w/ATjWFqH2GFU1+mtT1ZPBbDpDlLkos8XX0ALSf3H1CkGkOieUBYngXx/TY4hJ/f
         PYKcLrUjwcVzv7joUbCEvT1KiqlY/Z0ly1zoNOLsjc8MMCuS58JtVR3EsXntq0QIxuz0
         Z3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8qbMh/+soO3OUYSOJXYHB1YaDc9kxQNjBaN1zGLpxa4=;
        fh=Nb7f6BRaWfGRhYIP5GXWYgHe+FL3J148CC28+EKFKqk=;
        b=idQqqX/lP45FHxL8uzrONdLGQ27l31sRxXInhT/UeEmeAsLuktcUhtitX1t8DikYKj
         6Q2oaRqiM4Pjr5Hl0YNv1x2FVrqFULbqaO/Q59pi3DopbwC4NKi8DRLjRc1h2NbncjT9
         /zyQGmG/p0rXcnENYXreWqsPIdQlkN2d6v2vHa39bjP0hfRUzZYaGy5E4YuDhtd8S+1p
         sBmiWIgsQruJStK+3NyBsv0HAylDyusSFoGS9eB2eg6iO9vkyTnPWj3hsu67kmWWRvx5
         t9D8oHOGTxuIOz8hn8QnmyvN8GZdpu/V1JfShaZshkFzP97LxjEo7Fpm08AXIbs+FWuR
         dDKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2kgyG80;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48de41572bdsi829952137.726.2024.06.18.08.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 08:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2kgyG80;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sJb5f-0003BZ-2x; Tue, 18 Jun 2024 11:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sJb5d-0003AQ-Fq; Tue, 18 Jun 2024 11:49:45 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sJb5b-0004sV-O4; Tue, 18 Jun 2024 11:49:45 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso60715061fa.2; 
 Tue, 18 Jun 2024 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718725781; x=1719330581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qbMh/+soO3OUYSOJXYHB1YaDc9kxQNjBaN1zGLpxa4=;
 b=S2kgyG80QXlLs3UaKD+oZNd9jSPxAA5sr6P+XaoseAiApyuHeiBjSbJG6vsd7S4O7n
 cup7v4bB8/ERYFsILGcz2UnsDv1g7edrtwH8oyUirXUL3Q6vYZpjnvRuX9CR7qNRYnsY
 dV0p/H/OFKm03UULIMRc6+HL6jgCz14Yc/fet/DFHKhw6Hf+8Z5h2cDiju1B/27g2DdF
 K7bu2FVFiBHbJO5QA9R7+nRBLvbzIBWkmGm2JJRoM9yoY9qZOtay44yHF8RX0SuqOl4l
 IfwYhUunmoPbbaGwq5YdPyd+oZEsYqKH+2cJ3KL60CoaDmwBLqKLUhvqIT5DMV78QV6t
 9PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718725781; x=1719330581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qbMh/+soO3OUYSOJXYHB1YaDc9kxQNjBaN1zGLpxa4=;
 b=Lxlh8I3TJw2kRLHF17Q2DY30tjDbeV3kqGryn7GmxNUrQDNgoIPefF/QYdrC0pz8Pj
 kLKpTbjjqECvyrpApzqoUQXQKEwoa0ASWssOtki9688ZFHU0S8TvgcofIImuc4fvbfKT
 s/d1wHSUf0ms8R56BvFiPGHeeYCZJsRuVaPzD9f51ynQjV3qKWghKEM2CC2GBJvpkvw9
 PVfFy5eRvGUJ/QG0n0qNCeo9FJwDjr8TVRN2FXkIVbelZZcsDGz2TuT77FcF/6vk0B3n
 Fx3bO8PfN3WCFTk1Hj7LRq6MqBAONw1nFvhz10zb+TQQYxmLb7FWuyb3XV2l57E5g3jq
 UWsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqxT/nNlosj2yIdUZAKuZ5sz/jfwZUdhEd24M9cf/KXUBVGNMkzgyGNMu1a9qIL8ugxnt31cR/IhtylnFCS0ip4N5x
X-Gm-Message-State: AOJu0YxxWx2W1PB8iJCAz9CnAGvtqM53iBPPBus7lww0K+uPlnPhMFH5
 1kGRawBJmQpX6YpFNUCXFkvGDivvlpmMSnu4HlWGkaQa0m++KQO9i2GQLVG1AReoqw==
X-Received: by 2002:a05:6512:2209:b0:52c:ae34:26e2 with SMTP id
 2adb3069b0e04-52ccaa579a4mr18159e87.48.1718725781019; 
 Tue, 18 Jun 2024 08:49:41 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287241csm1544379e87.172.2024.06.18.08.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 08:49:39 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, edgar.iglesias@amd.com,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL v1 1/3] hw/dma: Enhance error handling in loading description
Date: Tue, 18 Jun 2024 17:49:33 +0200
Message-ID: <20240618154935.203544-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618154935.203544-1-edgar.iglesias@gmail.com>
References: <20240618154935.203544-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Q7Ig79tFoWPo

From: "Fea.Wang" <fea.wang@sifive.com>

Loading a description from memory may cause a bus-error. In this
case, the DMA should stop working, set the error flag, and return
the failure value.

When calling the loading a description function, it should be noticed
that the function may return a failure value. Breaking the loop in this
case is one of the possible ways to handle it.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xilinx_axidma.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 0ae056ed06..ad307994c2 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -71,8 +71,11 @@ enum {
 enum {
     DMASR_HALTED = 1,
     DMASR_IDLE  = 2,
+    DMASR_SLVERR = 1 << 5,
+    DMASR_DECERR = 1 << 6,
     DMASR_IOC_IRQ  = 1 << 12,
     DMASR_DLY_IRQ  = 1 << 13,
+    DMASR_ERR_IRQ  = 1 << 14,
 
     DMASR_IRQ_MASK = 7 << 12
 };
@@ -190,17 +193,32 @@ static inline int streamid_from_addr(hwaddr addr)
     return sid;
 }
 
-static void stream_desc_load(struct Stream *s, hwaddr addr)
+static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
 {
     struct SDesc *d = &s->desc;
 
-    address_space_read(&s->dma->as, addr, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
+    MemTxResult result = address_space_read(&s->dma->as,
+                                            addr, MEMTXATTRS_UNSPECIFIED,
+                                            d, sizeof *d);
+    if (result != MEMTX_OK) {
+        if (result == MEMTX_DECODE_ERROR) {
+            s->regs[R_DMASR] |= DMASR_DECERR;
+        } else {
+            s->regs[R_DMASR] |= DMASR_SLVERR;
+        }
+
+        s->regs[R_DMACR] &= ~DMACR_RUNSTOP;
+        s->regs[R_DMASR] |= DMASR_HALTED;
+        s->regs[R_DMASR] |= DMASR_ERR_IRQ;
+        return result;
+    }
 
     /* Convert from LE into host endianness.  */
     d->buffer_address = le64_to_cpu(d->buffer_address);
     d->nxtdesc = le64_to_cpu(d->nxtdesc);
     d->control = le32_to_cpu(d->control);
     d->status = le32_to_cpu(d->status);
+    return result;
 }
 
 static void stream_desc_store(struct Stream *s, hwaddr addr)
@@ -279,7 +297,9 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
     }
 
     while (1) {
-        stream_desc_load(s, s->regs[R_CURDESC]);
+        if (MEMTX_OK != stream_desc_load(s, s->regs[R_CURDESC])) {
+            break;
+        }
 
         if (s->desc.status & SDESC_STATUS_COMPLETE) {
             s->regs[R_DMASR] |= DMASR_HALTED;
@@ -336,7 +356,9 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
     }
 
     while (len) {
-        stream_desc_load(s, s->regs[R_CURDESC]);
+        if (MEMTX_OK != stream_desc_load(s, s->regs[R_CURDESC])) {
+            break;
+        }
 
         if (s->desc.status & SDESC_STATUS_COMPLETE) {
             s->regs[R_DMASR] |= DMASR_HALTED;
-- 
2.43.0

