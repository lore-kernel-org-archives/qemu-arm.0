Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2942057ejm;
        Mon, 24 Apr 2023 09:51:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350YvoNO5DTK04P5jTJ/m9iOo4s21pA5ELFkBkd9uXnu5F7MWRwZP9u+eIkTxqubU7+RY7y2N
X-Received: by 2002:ad4:5aae:0:b0:5f1:5f73:aed7 with SMTP id u14-20020ad45aae000000b005f15f73aed7mr26985205qvg.27.1682355073681;
        Mon, 24 Apr 2023 09:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682355073; cv=none;
        d=google.com; s=arc-20160816;
        b=IvVDq1M1hVFuqQehLgwVZRuNIU/nTrEGNjeX0qDuNPeQ+7A0tW1hT6pgxBW1FRrFg6
         pHckLUDgobznhlLSe+1rk6nPt0RGGfAn6P9bwdfiA28QTczLJpXXkIG7vMDUqmceR2Nx
         cS+ERwZLHgHCFDHnjn0awl2urG6OsnXx+KzQS1/B76e1/fpzOHL87BbQy7Rw9IheEt6i
         ngq/s/zVvsE/JN8FAAnbal6VO+kRdjcLvvoC63MNSanAdH8+Z6ASYCN9QOWp0RFonsyB
         zgE4caSeXqpFAoC99sfBu33aQTa6+5D4vdRV55XqINQa5/IPqwj6/ua8BUaVVMN5cdmY
         yWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M0ZbXxb0hmj0vZqrNkooEeAN2y7lCrT/j7W1IOTwXQ4=;
        b=f9M2i6O4iLBJMQAhY9+g9EsQrS4lasrd1TcXekdICDhiHYLKBR6H7TB4pd9fH6zIXK
         07E/fZHmlaDYeA85OstNnP8PO8v8dH+8ribiMrEh7fHGtR9Bd/WZiMw11zQ0lILh3bC/
         o3Ky7WnIoMIXbNKJtywIorJeF+JRNvTb4flRC/NtuznvXBjaShQqZmmryw4pJz1R1Uyy
         cCwO5ehE8VQCnTkMssF477nZ0CG8Qh2ZKm1j8MU4z4QcPOeL59hJBRqMhVKREnBc5gqs
         e3N1BQXb6Z+1qHJcb4YJ8JyZXMGNokM1uEWTc3f4hMJ5dINq8CvNSZDrUIY/AD/Di8Fy
         vjvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p665vZMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a056214076c00b006162358da4esi1454102qvz.128.2023.04.24.09.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p665vZMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqzP9-00037m-S7; Mon, 24 Apr 2023 12:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP3-00034w-30
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:51:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP0-00029m-0z
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:51:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so2834614f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0ZbXxb0hmj0vZqrNkooEeAN2y7lCrT/j7W1IOTwXQ4=;
 b=p665vZMaDiTOgl6tOWtCZi/7VVua0cSUHcT1Rlo/pV6W+KE9RkRUmKjmvF/QJEieGC
 C0QGaMuwYwejXa+LcrvNJF1bGAkv8Ro7cZAdfe99mdapNIW6PK0NrWmvY0myT/d7B53P
 AmV6d6Eb2zKtq8NZHTHXwjjrbARAcq+3xdBi6OeOd9P6y8trB9MgFfnwLZ9z2NVNydSc
 Lza0Aip6E09eJtIA5oAqMla/N/jjiFGBM7P8X7dIMuR3Xh5Qpxud6KyJgTqapTyQByV9
 jFcz2EoNScNe/RDD+YPzMlhA50H7hdaHRMTlxtMA1cbHl4x3Ck3vGwy6ovnzOwbcsWv0
 KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0ZbXxb0hmj0vZqrNkooEeAN2y7lCrT/j7W1IOTwXQ4=;
 b=Y1E+xYagYxI79ukRNKGdsov8jTAqk58pzun48158FgNODTInd+P/5jTf82u/UHgk6C
 4CyXhWKdNqQmGU3bmS5BojZSxSkj0x0QYHN0wnVvjIm+H8CMJwrYaK0xZdRR5ElzhYxt
 1JUyB3o4CHaebh1SMx3An18VptioeFLtJ3msIoBNBegRsBSF7fWO+AWplnwFxNzn/kk0
 Lo6bMA9PcZ1I5+qbKYjH/luJV8e2PrA/zFmSj/u475YZ1Cg9ecMl0bmL9MlcQ320+Aln
 Ljbq5p9dpb8Yvc406rNjzMGbCpXZDN340tJXq2swBbzjlmLsp25wJBfeAa+g8zVvhdrM
 /KCA==
X-Gm-Message-State: AAQBX9fToAVWdXStqh16uNONVD4YFEzv6EsOVFzn3E6CJIYfu8M9jX9I
 q9thqjFGSDtzaKkBQ++IKfkxT+QDd079/nv0Wbo=
X-Received: by 2002:adf:e686:0:b0:2ce:9877:84ae with SMTP id
 r6-20020adfe686000000b002ce987784aemr8693521wrm.16.1682355055722; 
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm11211279wrf.73.2023.04.24.09.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Date: Mon, 24 Apr 2023 17:50:52 +0100
Message-Id: <20230424165053.1428857-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424165053.1428857-1-peter.maydell@linaro.org>
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: GAVdFiNQ6mMn

In allwinner_sdhost_process_desc() we just read directly from
guest memory into a host TransferDescriptor struct and back.
This only works on little-endian hosts. Abstract the reading
and writing of descriptors into functions that handle the
byte-swapping so that TransferDescriptor structs as seen by
the rest of the code are always in host-order.

This fixes a failure of one of the avocado tests on s390.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/allwinner-sdhost.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 51e5e908307..92a0f42708d 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -302,6 +302,30 @@ static void allwinner_sdhost_auto_stop(AwSdHostState *s)
     }
 }
 
+static void read_descriptor(AwSdHostState *s, hwaddr desc_addr,
+                            TransferDescriptor *desc)
+{
+    uint32_t desc_words[4];
+    dma_memory_read(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
+                    MEMTXATTRS_UNSPECIFIED);
+    desc->status = le32_to_cpu(desc_words[0]);
+    desc->size = le32_to_cpu(desc_words[1]);
+    desc->addr = le32_to_cpu(desc_words[2]);
+    desc->next = le32_to_cpu(desc_words[3]);
+}
+
+static void write_descriptor(AwSdHostState *s, hwaddr desc_addr,
+                             const TransferDescriptor *desc)
+{
+    uint32_t desc_words[4];
+    desc_words[0] = cpu_to_le32(desc->status);
+    desc_words[1] = cpu_to_le32(desc->size);
+    desc_words[2] = cpu_to_le32(desc->addr);
+    desc_words[3] = cpu_to_le32(desc->next);
+    dma_memory_write(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
+                     MEMTXATTRS_UNSPECIFIED);
+}
+
 static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
                                               hwaddr desc_addr,
                                               TransferDescriptor *desc,
@@ -312,9 +336,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
     uint32_t num_bytes = max_bytes;
     uint8_t buf[1024];
 
-    /* Read descriptor */
-    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc),
-                    MEMTXATTRS_UNSPECIFIED);
+    read_descriptor(s, desc_addr, desc);
     if (desc->size == 0) {
         desc->size = klass->max_desc_size;
     } else if (desc->size > klass->max_desc_size) {
@@ -356,8 +378,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
 
     /* Clear hold flag and flush descriptor */
     desc->status &= ~DESC_STATUS_HOLD;
-    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc),
-                     MEMTXATTRS_UNSPECIFIED);
+    write_descriptor(s, desc_addr, desc);
 
     return num_done;
 }
-- 
2.34.1

