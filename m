Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp486012ejs;
        Fri, 31 May 2024 05:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUc1guw6gtmZFxbs1JNaWduZGL9oIU0U4NDuRTfFTRlG6IL1LvV/95p+yhT38PZyWgCyYHbTmxidaviwgoEcOaRXfEUP+OK
X-Google-Smtp-Source: AGHT+IFv3MpZ6HxO/CoGvIsO6fx4X5xktfvcS+aDNEkH5VJ53T+EfMfDs0eHGKNym1e5/1ti1LcL
X-Received: by 2002:ac8:5711:0:b0:43d:f71d:98d8 with SMTP id d75a77b69052e-43ff524bcacmr15869361cf.25.1717159598225;
        Fri, 31 May 2024 05:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717159598; cv=none;
        d=google.com; s=arc-20160816;
        b=RiRu3K20EhEBlJeoZczzH51Usb1mTDGTlzGqMWfXhN6wLyoGxQuvxS8aFV5hQZz2Bi
         1RC103CiZ5tHrktV+151CFRbi0/kvgzQPT22Yx8w8uqOVYN1UZ8mZBbNl34vaIk+AB9p
         qyZyqE069Zi9S9vl4xSoxMPuph9Tj5MwlqT7jaF7yesbrvbkkZ3OBOiiOIhDSOeg6SJY
         7NeiMGRPYXQeEPqTa55vvxHUnOyxvE4l4ALkstIc4m9S2Rd254KKK9nW4095WCDAV6KH
         c6qvoFQN5XRDFqAD31BmK5d2kbslXsQ54weA+2Xjwe71fposc2uV/KkyzSGCh1UmiBqv
         Arpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KNkb3HO1mvzGdO6PMr4OlLUGGePFzcV+YKoXtQ1aEQw=;
        fh=MXw26uABifrty87+dX1qnWxaVbPh1TPVlOEhJxGdRfA=;
        b=vK3kaFUFYpxlYhY/Xdju+pTiuUcdHgT1ZxSFOtFy4/JXd0YxNv+8upbQJ1VO6clFwh
         LUBRtzfeHdnRWIwVH0yOR3GQpiL0zNl1u22GrHYp3XtitUrE0jgVR08baWAWaXTYHp4r
         +bUgAh2GGpS137/bH1y6H1R+XmxSSVeYyWNJOy5bdGWoM1MEUq10dh/csZ1EmeKk6dtm
         isCASvlDXjsvtmhOtzAJ0zg+8+nRa/Z29AUy0LbtH4/pW6H6VpsUI/+PQTUeEQTYRpSI
         mf1oO7tZvEBYuhSR4n2Ahfamx8aq2LIrvoBCYh6Kv/sP+FnOng9aJPh7LCPAEP53KvTn
         1HYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jJ2Dxt+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff23ae857si10590051cf.30.2024.05.31.05.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 05:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jJ2Dxt+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sD1eU-0008HP-OJ; Fri, 31 May 2024 08:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sD1eT-0008H5-L8
 for qemu-arm@nongnu.org; Fri, 31 May 2024 08:46:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sD1eS-0002vR-0I
 for qemu-arm@nongnu.org; Fri, 31 May 2024 08:46:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42011507a54so11329005e9.0
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717159590; x=1717764390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KNkb3HO1mvzGdO6PMr4OlLUGGePFzcV+YKoXtQ1aEQw=;
 b=jJ2Dxt+elG1xV10f1wiisVgRyrKsAh2rMAhHlxr6AbD8HnHoKDexktJmrIlFXf/qs6
 9q1pGZXCd3P5oJ0npy1eBvlHiIUQcmYnx+MWI0o/q1vtcXaAWXj4zd57rnzD5ddWHJyp
 CT68oRyYZg4zLSyoQ8fwaWtrqONEoD8BbWU0fjmjLgKiZoq4zruvftlC6ds6gnVVK5pQ
 Bpza0G4j8OD4RYrgbqKtaSov4M4GIaUPcCIN42fPj7b+IOGV3av9sAXsflws9UnEcDWh
 tfiZbXCP+po7U1qccRDXb7N44DBNHqndRR99BBkJ6s97JKAvNaaadoeMiWhizqrJzymm
 vjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717159590; x=1717764390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KNkb3HO1mvzGdO6PMr4OlLUGGePFzcV+YKoXtQ1aEQw=;
 b=aoUqxhI3MuOdjSvAcsovalX45/A0GcMwOi9g3XrTpUL2SwZFNxKxodL0lXDk7wH0f7
 hwsPufblzA+PgZ4dc43g2u81ww9r8NH4ylG1uaEyqBnbYT+gfLKffaVVE/9vIjVF6m8s
 IrBnu9ZosZJFuJsApYFx+XzL0SvjFCA/SJY+WUtYux9c7Tq8yJpNycHKJd8UD0KLgyrI
 tulst4HDTPaAY+ZRglNuKNoNP4iPotpppX4B+WRFc44Y400rA/DPEltM7ycvB1xYJ7TP
 HVGcwy1HATqxFFWKnEPbwHxsEL1XU6r1NQ1iPGtoz93e8mHqOqoJSq80uKPeP47fVMCp
 GlLg==
X-Gm-Message-State: AOJu0YyDkVjCgrv8uejmsvq2kWSYXoXTsS7niWgKwoVKizYGu4VNHT4M
 CeyrxVJIkHpBHIy0xaMpWSWHEdN/GSohckrfU5AvhqSVbYhZwveDzN987m2pklz/SKdvh6O4f/e
 8
X-Received: by 2002:a05:600c:444e:b0:421:29c0:b6c9 with SMTP id
 5b1f17b1804b1-42129c0b9bbmr35328005e9.12.1717159590354; 
 Fri, 31 May 2024 05:46:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42132471e01sm10905625e9.13.2024.05.31.05.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 05:46:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandra Diupina <adiupina@astralinux.ru>
Subject: [PATCH] hw/dma/xlnx_dpdma: Read descriptor into buffer,
 not into pointer-to-buffer
Date: Fri, 31 May 2024 13:46:28 +0100
Message-Id: <20240531124628.476938-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: EAcODNc9f867

In fdf029762f501 we factored out the handling of reading and writing
DMA descriptors from guest memory.  Unfortunately we accidentally
made the descriptor-read read the descriptor into the address of the
buffer rather than into the buffer, because we didn't notice we
needed to update the arguments to the dma_memory_read() call. Before
the refactoring, "&desc" is the address of a local struct DPDMADescriptor
variable in xlnx_dpdma_start_operation(), which is the correct target
for the guest-memory-read. But after the refactoring 'desc' is the
"DPDMADescriptor *desc" argument to the new function, and so it is
already an address.

This bug is an overrun of a stack variable, since a pointer is at
most 8 bytes long and we try to read 64 bytes, as well as being
incorrect behaviour.

Pass 'desc' rather than '&desc' as the dma_memory_read() argument
to fix this.

(The same bug is not present in xlnx_dpdma_write_descriptor(),
because there we are writing the descriptor from a local struct
variable "DPDMADescriptor tmp_desc" and so passing &tmp_desc to
dma_memory_write() is correct.)

Spotted by Coverity: CID 1546649

Fixes: fdf029762f50101 ("xlnx_dpdma: fix descriptor endianness bug")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xlnx_dpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index dde4aeca401..a685bd28bb8 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -619,7 +619,7 @@ static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
                                               DPDMADescriptor *desc)
 {
     MemTxResult res = dma_memory_read(&address_space_memory, desc_addr,
-                                      &desc, sizeof(DPDMADescriptor),
+                                      desc, sizeof(DPDMADescriptor),
                                       MEMTXATTRS_UNSPECIFIED);
     if (res) {
         return res;
-- 
2.34.1

