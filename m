Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1994755lfi;
        Thu, 2 Apr 2020 06:49:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypL+5aigV/9ph10JXlrtPhgXjsy0BU+5qJtc1OOlWNCbUk5Vah49c3O5JencBK7D1ZysqTgg
X-Received: by 2002:ac8:f85:: with SMTP id b5mr2925501qtk.158.1585835344925;
        Thu, 02 Apr 2020 06:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585835344; cv=none;
        d=google.com; s=arc-20160816;
        b=kWVUzqxpuvPZUq5YcnI0n+GKuce5nz3GGN5YhIP9pV4oA/DpuqZbYFV4O67QwOggqH
         qepV6BaqyxZLCuY060FIi3Gh74eHgjq3L/IYJIlwgi17FTlmUtpPmp+THrG5vfBGcQno
         x9psIxU9PxE4bNj9pBpQVNcYWySXjRELM0V8nNLyXS6xn2gpXlxppZllobznpjKh6D9n
         w2t1SXizHt8kSL0Le+E3nKPu0TpgZi5+b9pkUXAnv8SNG9sWymlaqFDTmI4CfGxVwVDw
         HZaiBQG09w3af4JScWGzIad9aKjqYfNdOoeXDuZit9pEPGLfzna2YiSHmwhJUhV7JqC/
         bsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TLzE2qyREnbaDqlCoLajdWkY9S6FLWSn1nRwtU02lS4=;
        b=WKbjGh0Fz1UIilnC0KlJl4B9Zxz01mAYv7KMn8N9ZCGDCB+REOGZOxHCErPqxwaRG4
         48In1djylBOZvu8/xFn4c8/YLzPFZSLwyvJGLLWsnCH9Vr7FElDe6BBiI1cLlg5H6YJh
         C8d1Xn+cMUMMX5dwhgthec2xdv1Upp/1RUkuytRkazV6wdl5c/YbX90slGqLQxHsx2mW
         9osMbaHmsMGB7wm5UJk0LGk0+Pu5n2aqTSsU3bHZCFcqp4v5jvdBLL+gLsAuR2rWbJ/Z
         GWzU5ws8ujD1i3B63MXs7xHon8mf+Q+3wIsD7IxRDl3x+lFKrjloj335YW1VmqjqyaWN
         T9tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cWf4kD0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p36si3468700qtc.183.2020.04.02.06.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 06:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cWf4kD0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK0DQ-0002CX-C0
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 09:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Aq-0006gC-Qa
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 09:46:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ap-00029H-L5
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 09:46:24 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jK0Am-00021z-3i; Thu, 02 Apr 2020 09:46:20 -0400
Received: by mail-lj1-x242.google.com with SMTP id 19so3265853ljj.7;
 Thu, 02 Apr 2020 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLzE2qyREnbaDqlCoLajdWkY9S6FLWSn1nRwtU02lS4=;
 b=cWf4kD0tqff1FpoKtDsdz4F13D6TjBFJCPrBpb9VYbAme1/R22JtubShlbYm1T1E90
 VcOr61DgvfL1dUNH8Zer0wFTvazpz2Bd3Ga2YpENcjDtiuPXmR9qesMiWBB/DaAY4251
 UsbMQLb1v/ARH0fmmDjiLpWwf1AAdILrwaJUphF8vZQeEhlfIBsYsuWt5BEOiQcd9+s9
 o7M10bVknTttz2fT8kxztLG3kG+GOPQ+NCAW9LFVxGOnYldYdzuqRUgjVm27dRze7noU
 vgH/kndj1+J88hyW1n27o3r8tD+y1quAiK9UppG0pGk4jTBtMfL8gVpqrIRJpFTfM78o
 S+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLzE2qyREnbaDqlCoLajdWkY9S6FLWSn1nRwtU02lS4=;
 b=s3JhNkFMpp3W4ROoXWHHIKPGC16NT/7x9N0UcEOXlQmXIVIbZVRKMxjAfTzOvAJxuV
 mYpsOdY4SoV/0Z2tTYji+i4zOYJvtCSnSWYD0ZaNBYJmb3UJzouJfH0mkasZ47lsWeZj
 KwJw8m+LqSZWt88V1217VSu6HGs1zrlyLiezVWOCRVyPqP9e8d/aoXFNJfown23TuuzL
 F4yJcPPSKu0JGPX9RSpLN+BYxEpHgdtf3BbebXr0K/FrRnH9a5w+pCl9ci64W6g85/nu
 myab3sR3RuCu0OmReJNZGTVjTe0B5XyjF5avbjVf2g7YVytdcTgfEltj5VviVvJ/Pcvm
 K+aA==
X-Gm-Message-State: AGi0PuZzBrT6mtlyqYT+P7cvCL5Z6rtPqh55eKHrZsuLT2EQUiy2UreQ
 Pka6YR2wkuuvcNHdTMwmdf7jnC4oMrP6LA==
X-Received: by 2002:a05:651c:22e:: with SMTP id
 z14mr2017486ljn.64.1585835178613; 
 Thu, 02 Apr 2020 06:46:18 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b16sm3939517lfq.34.2020.04.02.06.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:46:18 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] dma/xlnx-zdma: Reorg to fix CUR_DSCR
Date: Thu,  2 Apr 2020 15:47:21 +0200
Message-Id: <20200402134721.27863-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200402134721.27863-1-edgar.iglesias@gmail.com>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCz4Lix8uN1Y

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Reorganize the descriptor handling so that CUR_DSCR always
points to the next descriptor to be processed.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xlnx-zdma.c | 47 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index e856d233f2..1c45367f3c 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -333,10 +333,28 @@ static void zdma_load_src_descriptor(XlnxZDMA *s)
     }
 }
 
+static void zdma_update_descr_addr(XlnxZDMA *s, bool type,
+                                   unsigned int basereg)
+{
+    uint64_t addr, next;
+
+    if (type == DTYPE_LINEAR) {
+        addr = zdma_get_regaddr64(s, basereg);
+        next = addr + sizeof(s->dsc_dst);
+    } else {
+        addr = zdma_get_regaddr64(s, basereg);
+        addr += sizeof(s->dsc_dst);
+        address_space_read(s->dma_as, addr, s->attr, (void *) &next, 8);
+    }
+
+    zdma_put_regaddr64(s, basereg, next);
+}
+
 static void zdma_load_dst_descriptor(XlnxZDMA *s)
 {
     uint64_t dst_addr;
     unsigned int ptype = ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, POINT_TYPE);
+    bool dst_type;
 
     if (ptype == PT_REG) {
         memcpy(&s->dsc_dst, &s->regs[R_ZDMA_CH_DST_DSCR_WORD0],
@@ -349,24 +367,10 @@ static void zdma_load_dst_descriptor(XlnxZDMA *s)
     if (!zdma_load_descriptor(s, dst_addr, &s->dsc_dst)) {
         ARRAY_FIELD_DP32(s->regs, ZDMA_CH_ISR, AXI_RD_DST_DSCR, true);
     }
-}
-
-static uint64_t zdma_update_descr_addr(XlnxZDMA *s, bool type,
-                                       unsigned int basereg)
-{
-    uint64_t addr, next;
 
-    if (type == DTYPE_LINEAR) {
-        next = zdma_get_regaddr64(s, basereg);
-        next += sizeof(s->dsc_dst);
-        zdma_put_regaddr64(s, basereg, next);
-    } else {
-        addr = zdma_get_regaddr64(s, basereg);
-        addr += sizeof(s->dsc_dst);
-        address_space_read(s->dma_as, addr, s->attr, &next, 8);
-        zdma_put_regaddr64(s, basereg, next);
-    }
-    return next;
+    /* Advance the descriptor pointer.  */
+    dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3, TYPE);
+    zdma_update_descr_addr(s, dst_type, R_ZDMA_CH_DST_CUR_DSCR_LSB);
 }
 
 static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
@@ -387,14 +391,7 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
         dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                               SIZE);
         if (dst_size == 0 && ptype == PT_MEM) {
-            uint64_t next;
-            bool dst_type = FIELD_EX32(s->dsc_dst.words[3],
-                                       ZDMA_CH_DST_DSCR_WORD3,
-                                       TYPE);
-
-            next = zdma_update_descr_addr(s, dst_type,
-                                          R_ZDMA_CH_DST_CUR_DSCR_LSB);
-            zdma_load_descriptor(s, next, &s->dsc_dst);
+            zdma_load_dst_descriptor(s);
             dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                                   SIZE);
         }
-- 
2.20.1

