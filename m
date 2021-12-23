Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3320116lfb;
        Thu, 23 Dec 2021 04:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz430VrSdgT/eV9uxZTASzgIJ3ZQg5dGGkYzCSzZvFRxul7pBoT7DB33q+7k9r2ENtNW980
X-Received: by 2002:a5e:c807:: with SMTP id y7mr936364iol.9.1640261674283;
        Thu, 23 Dec 2021 04:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640261674; cv=none;
        d=google.com; s=arc-20160816;
        b=q1h0WSQE+Sfe4+6bVcUL4EG9cQkB2ijaoI+M4KI6R7CF9JSXsn/lt98IXN293xzB3Q
         wxrLZ2VppC20z/oDObHtS2jqAA1Xz5wyZrkcMYBxOLJHJNT1z5miLKZGzmwOc3Lzl1WI
         3oGGGw9ReuUJWqQBQafPVZ1aRtTGbhNYKfn0FgM/ngs6mxjz+YhtQDn9MuQEXNG+V47R
         OgvNkJYW1JZlRt+P2x1hKqr3JsfCp+zKeuKdy+j3QvKiM63Po7mdgDZPgHKttz+9/0lx
         LEMqkk+6rU4X4Ba+pZQ8WuaZXiTzSYpOCOKlTRE0h8FvlXH0yoTtG8NnB9IIyct6hEWQ
         ijpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XDiu/1Y9UJG/Mr1Uyi7hIwmLFqroGRXmqVVQxLYL8lo=;
        b=VtN4Xnf7XDtibAPdR5fWGWpkS8R+7b5SY0ulMbSQIkWPIsJvQVNLl9FwAuyoPTJYYk
         /EGO/dymspPCpbB6mfTnASsfN64DWs1ROjoPi5Gd7E/1lOdNz44xO+dqyqjUFw3dKTmf
         qcnzUA0ERS3bbZJAY/65pmZRVIb4k/fvhaLowMlVuIyWjvZnF2w6dtzM+0DCv7OYEcTn
         GzCqcJWsIUVU54UCe4suJVs5c2aQ6gIpocGdaPmvjp4y0JJm3SJvChXtVkCNcjK6IzPZ
         Q4FN2iq214fkNnYr4bCc6F0SlxV5zKspeU8LtV/LNhLr1nO5/1e/k+wDbmY7x2LGtkm/
         JIkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tiulbcsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si2234440iln.53.2021.12.23.04.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tiulbcsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0MzR-0000hR-KF
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MkZ-0002R8-Le
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MkY-000148-3E
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDiu/1Y9UJG/Mr1Uyi7hIwmLFqroGRXmqVVQxLYL8lo=;
 b=TiulbcsfZwrNZarz/1A79y6uDaykKBCASQm6+6TVY0asc5TeQJZfcma5IEOF8JAPHWA9/U
 funOYhgwB1TXT9MoulOHd9T/29sVtShQCWbuBPTlJb4pUVMcbelVufGumP2UvsDNmSyCvH
 shz5K5FclEtJ3Vg0+jF6ZTVy49yDmwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-reMfIuL-PmS7XYI5frjAFA-1; Thu, 23 Dec 2021 06:59:02 -0500
X-MC-Unique: reMfIuL-PmS7XYI5frjAFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r8-20020a05600c35c800b00345bfa31160so1893081wmq.0
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDiu/1Y9UJG/Mr1Uyi7hIwmLFqroGRXmqVVQxLYL8lo=;
 b=zkjTSJNooCE4ZNhwBC0zCAv63P15UtINVajLOQAgBsD2zF1LyTOBG8Zv+Ehlkctefm
 IxafbGHj7SlEt2ZAdEwJqpIuyAPO9DyUW9wxSc+YkK/ACxmPV4W/SvY5n3Xj4MgKwAYp
 Y3tdRpDxadHZOO4OkdjOeKwMee67Tbi57Bg1CVFVFu0BKJXm0dQhXab2YpmcBRvdq/Jq
 B6GZYXlGUTt89epR2U2EBTHhtR00PlMJiXaXiNr++UqkQkjt0UVPMv4ZngWfpgfbs7Vo
 CDuRL5+CmYLj5v8S3HyqFQIg8XbLDau6qQ3m+HRgvvwuSnDl96v8Z6ILPflv0hXnGJEH
 c1fg==
X-Gm-Message-State: AOAM533zJ37A0tDn4WY2wyAUuz5iaLrNFeAcDUtNmu6KH0fIuIjL0RZz
 uaZKUT07pX32tx+crKCGRC83OsEbJQkNk9epNefv/MprIg5oiTlhOEfZ91wiSqHdtYwCs+KJyTg
 NZoBvY9ElKDbC
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr1468860wri.711.1640260741419; 
 Thu, 23 Dec 2021 03:59:01 -0800 (PST)
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr1468844wri.711.1640260741252; 
 Thu, 23 Dec 2021 03:59:01 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id j13sm8693839wmq.11.2021.12.23.03.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] dma: Let dma_buf_rw() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:44 +0100
Message-Id: <20211223115554.3155328-14-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owCWq6dCcsza

dma_memory_rw() returns a MemTxResult type. Do not discard
it, return it to the caller.

Since dma_buf_rw() was previously returning the QEMUSGList
size not consumed, add an extra argument where this size
can be stored.

Update the 2 callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index a391773c296..b0be1564797 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,12 +294,14 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir, MemTxAttrs attrs)
+static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
+                              QEMUSGList *sg, DMADirection dir,
+                              MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
     int sg_cur_index;
+    MemTxResult res = MEMTX_OK;
 
     resid = sg->size;
     sg_cur_index = 0;
@@ -307,23 +309,34 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
+        res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
     }
 
-    return resid;
+    if (residp) {
+        *residp = resid;
+    }
+    return res;
 }
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+    uint64_t resid;
+
+    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+
+    return resid;
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+    uint64_t resid;
+
+    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+
+    return resid;
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1

