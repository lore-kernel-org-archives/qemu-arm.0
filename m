Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2752815ejs;
        Tue, 4 Jun 2024 00:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9TdNJVwjMr1qViDXF5UBM0jLXRugwdDp4fuPkkRtedo5WtrhPWaH6ph+6ugK0A608ej++P8dvuGGwwlkrVbeIgAqgyAms
X-Google-Smtp-Source: AGHT+IGAiieKOC0KNZTOoYaqyCn9JjCu2rSON1fneV/gBtvRlD/9HqtylQ+3ztYndY4yNnq6M4cv
X-Received: by 2002:a05:6214:5c4a:b0:6af:cd14:d238 with SMTP id 6a1803df08f44-6afcd14d23cmr22210046d6.3.1717485076514;
        Tue, 04 Jun 2024 00:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717485076; cv=none;
        d=google.com; s=arc-20160816;
        b=Po3TwaXkZe8HaNtVCUxPSa6duL3FoeT7ysNC9SN2w3pwEP53Z/Xbo9X3tlN4Av19J/
         2Jh+QRvs9dtPG429ftn/SLiDA3oLTwZwC+7xY1MpqJ3tEc1NO7/E2sWF6hwakUFXo61l
         fV1v0qZ1Ch+fcqVdmNn5kAclcmSwr569WCyNun84WZc7QHqo/XPtRpPqbKDBgw61MZvV
         gk8LkyYXQUZqtfIoBSSgp5AWfNiSA1NB+t9L7tJ/S0Ef9YuLxOY5JWkdzgDsf++56EL4
         RHz/ZWzpz1afSaNzCsb6vGf0QLMi2G80LhnvBJ2nDTaHf4LwplotwhXenVqn3U7Hg1UG
         ZfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
        fh=Df8pFlV0FM1sEVdzfzqwfI7v5Tds7ZcMcIj8r4K7/jc=;
        b=uwI9m2cTtl1tOPheAm542LHVu44ktNLislUbX4eidcFPm/qNkyAAjVpLwac0TuKdqB
         KE7hqB5OjkytfYx6IfppbLzgMXSRDiJiSxSQ4SXZzAgNEOuMqMZZJdUrOLCB5tiE1IUm
         Ic5QvwEigAK9trhTjjnjvncRkYWZGuNfykltv+R5M6r1lzksMzZ3NlmoHgM42U6NbN2o
         3yBbOOVC40TnC4ptDxc+tz/Xm19QCz5AzSkLx0mri28/4swthzhXaqyi54rkQ3BwWl6h
         4mZaMlkJlOFZ89YmQpdjeSf9qbZKogvCD+mYJ50pL51sDyiyf/2Q5dc/r/a970JwRtNH
         B3sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=FutteiJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b41536csi102355616d6.376.2024.06.04.00.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=FutteiJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOJY-0005JD-D0; Tue, 04 Jun 2024 03:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJU-0005FB-CI
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJR-0000UW-H6
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-681ad081695so3810288a12.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717485027; x=1718089827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
 b=FutteiJlNQtowCt3mYu3lbQkFyvXJgv5grMA5BEiJGehaMgYLGq6GC6wJOuVqMld4N
 0IR8YtF4CyarysAdwvjRb2flTf3W/HOsWwJQkSBYXPOa/k6oUBVUAkYpnOvbq+KFgUdI
 AMhfiVBSNvuoglswVZ58pLaOSjCq+D/XLlhIIhiYvdtP9zbw8yCoXfzMXO6MNLvf5kCc
 hdpon7LEcyUvpyyhrPWvQXsX7J5hFb+pTf311FyVmZygOOS3/eB0NAjmtOh6+8C5n8iW
 DbHiB1W7HILSqBVcmBDUyhIaYf5Pxu72CX50dbX80to/Q9CI6TIwBl4KSAYjqBvjmzF1
 ZLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717485027; x=1718089827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
 b=YK+d524PhWAS2MKnE1mZXpFBMpdXyqh3IALal/k6KAMWuXqnw8sfzkHPhkRkGukh8d
 ufqZsQc4UfE5RkivbD450tSUJ6WZHzP9mNU8Zlvu6qkdhnYKysG2ZgF8wZokxmYeCTc9
 TXbsNkbYgPCfUaLuxKZ9lAnAuD9FE4p5pl6j3fvZWXnY94IQb9jTfbtt43U0JPSMDN+r
 QKYhBFlEN7rK69Dh6SfGWB7G2ACE1MHqmncIX3JTKg9sZ/+Dy2g0xrbWaJD76B1iomxn
 +j4cNv92ctTpObp4+ft0Xj+6XRYOpaLznR1FF+IUZNlclCIpG+sHVRQYOolxDxGgNTA2
 E+ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Ylp0vLBO3fRZ3O/Nk/DzsvLGu6S6ooXKfnSuP6kcwUlyzGGfrLcN4U3+dQHWSXZ9mAgS3I39WJEEOqJr2g8S142k
X-Gm-Message-State: AOJu0YyMViT4/yhwOdVfNVUjaqEBIkqFpBW/0OeDyZd26uzDRd/Owo6w
 +ocaOo5DwpJfzCyAckvOo4TazGQeWvKP1snj+IB/115Hqau5mGgMzevhSxMGuP73WafrZQBCi6+
 i
X-Received: by 2002:a17:90b:4ac9:b0:2bd:ebd5:8bf0 with SMTP id
 98e67ed59e1d1-2c1dc5d8bbemr10451632a91.42.1717485026681; 
 Tue, 04 Jun 2024 00:10:26 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a775d68dsm9237943a91.6.2024.06.04.00.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 00:10:26 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 1/3] hw/dma: Enhance error handling in loading description
Date: Tue,  4 Jun 2024 15:15:38 +0800
Message-Id: <20240604071540.18138-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604071540.18138-1-fea.wang@sifive.com>
References: <20240604071540.18138-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hkV5KOLBOeu7

Loading a description from memory may cause a bus-error. In this
case, the DMA should stop working, set the error flag, and return
the failure value.

When calling the loading a description function, it should be noticed
that the function may return a failure value. Breaking the loop in this
case is one of the possible ways to handle it.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
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
2.34.1

