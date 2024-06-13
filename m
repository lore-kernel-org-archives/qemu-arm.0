Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp31610ejb;
        Wed, 12 Jun 2024 18:30:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOqjGweszgiK+zsf9rGA32LFpTizXas/aWtMEp3Dz4pPftBamU/apepBbnIB2Ub1PHxhknfunrXoHGLrC4lhWdOpfvQIio
X-Google-Smtp-Source: AGHT+IHNQJmxMl/9M+VwjkIkw3Qk1v3X2Y5SFa+wipMCld92gnYJbyj0EA02pd1dieZM17KwY1vg
X-Received: by 2002:a05:620a:3913:b0:794:f1d8:2798 with SMTP id af79cd13be357-797f61680edmr393681185a.43.1718242211841;
        Wed, 12 Jun 2024 18:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718242211; cv=none;
        d=google.com; s=arc-20160816;
        b=YFCM97KCfM0wJy2sFF6hKHk4T5XRAhexaW4A9Cov48mTBsORJVDMXLHiHkwQPjMMiM
         zCTA+9SUdvGlt0CAkqt1zvYgHjh1zcHetRGf7nbTY9fUt0cXMQfUAGBZUxpEIfk+cTf1
         /TnNadzHvxvevusqu5S3qpQqo9h7b55LNUvxFhGo6FsOFNkgxotzPFyB/A1J7z9KeLwl
         YvS4vBq3Drl1NMKhDj3zB5MGSuzGclR2YEvOC9kD0NdIA/zIW5H0x+DngQkMxR08sPEl
         giybzCWfWmO+lUAVydGLEzBA+b5uajUqb7aq5jETtWWjlKawuFu8hbR8RwrRaB929ilQ
         5sLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
        fh=pG5Ad6TGvKGi4M5AuYFniMuNBiLGF8DCC9SCH6tpOzs=;
        b=suPQN7/mNWEKOKMmaVeCipErvX9/IdmDyAv03FrN+HLRK3cLjZnHxz2o+a2UyFfekE
         7rbOVUfegflJYsSzdhB76KuKRdMzrpjOm9i0l7aOQeHrhuAWqiNuYQie6BMGM4rnV9eO
         5UZ/mQAOL2tLoCulImYeQVyK4VU2iKxqn2mpDxrkuFbPRN5MnzregF0hfPfSH4YctwSY
         ljLsmtPqJFZUURO8SniA7lADDAU2SCKLlIi3GIeFYk/RWWUwOYdLEtTzWrHTnuXSJJE5
         OMxxF2+H/3QdptSmxWEK0eiIIx+F2gdquFJ5gZanoYV7KDvG2Se6Ik/eCccJnXf2yqvQ
         9iTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mHRVZj3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe552b5si31163885a.539.2024.06.12.18.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 18:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mHRVZj3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHZHs-0001tN-T9; Wed, 12 Jun 2024 21:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHr-0001s6-6g
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:29:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHp-00089Q-HK
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:29:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f70509b811so3608125ad.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 18:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242196; x=1718846996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
 b=mHRVZj3rkDhzoSyr0ESZyHfBVR9QcI3Al7vW/DCpaL2/oSYSuBB9gwqummXQbGtgwH
 wn2a5fkBNdgUMbw3zly0sP62aPdQPAqu0waE+MbQ3IJye88DgigMhJEQ76DByn3/DJZc
 cQ8BSQICjhl77ULa7uYRGcGIv84eh53m668Cqe5mkNXxuNFtP1DSHEGPzjedHdsBYnp3
 0VlVtlKvMX62yQS9d9djKIVNfB5f8TOOHxcawWEUWR+Cg2TlKiiwcTlG4BMHC3DPUgY/
 cPg4RmvtV5iTmMpYj/rNNBCSzJNIryVQ1GtRbHi9W2NTrrGID4C+/ByIWJoDhhCosW+t
 UkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242196; x=1718846996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKkT300tlD3TQh5kFCyDOARg3WfWGx7ttZZNCCqlZ5k=;
 b=VFYTUrIqZMDU1Ld2G/wGbi6NlZ15reZWPJUSnYOsBeTizFuWRagh/3KnpCi3OxZTKl
 w77DdidswcM63AZu4y/PefZMN8r62w7TuYZcRB9EDZ5DEAMNvEtBxxSaqTtITKUp13TD
 yp3k+Tbmynerk6AtisKhreCirKJiWYQksQrtIbaM8dckiiUrQEq/2PlLLcJrSe9MLwJA
 YxjmAWXJP9eWurKWgsg5FN2DWggCqByqwzHlVjUZr5SMzxHCoygRU7QZF51sYZv6UivV
 FXhU3okP6UqSTTAwKftjxIqwyI6Iim6yazp/87UEN5i4fP1uGmZjlvQ081+sNjx48fQq
 5D/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWHk+EiDEVaVhJUyh+ulclWUdaqsWwYGlxZNt7Mt6qo7g8/JAQUPU4D+G9EmQUTPfihSqklqC7AlDK8/LajBqlo2Mo
X-Gm-Message-State: AOJu0YzFNZP6gNeNmZiVJZS1ddA7Dw2qt6RcnCHmsOM5+qcOJOv61dsJ
 7tL3pTcD6rlRS7BwRG2VDaZtAf5b7d2ZVnCJRFAf7n+5sqelz9Y4HmNywHibjHiGSmLTDyfFbpW
 M
X-Received: by 2002:a17:902:d50b:b0:1f7:38a2:f1ec with SMTP id
 d9443c01a7336-1f83b67a940mr43752995ad.36.1718242196123; 
 Wed, 12 Jun 2024 18:29:56 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:29:55 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 1/3] hw/dma: Enhance error handling in loading description
Date: Thu, 13 Jun 2024 09:34:59 +0800
Message-Id: <20240613013501.426905-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613013501.426905-1-fea.wang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62a.google.com
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
X-TUID: ILYHsItnAbtF

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

