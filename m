Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5087283ejc;
        Thu, 31 Aug 2023 06:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6GpfLBTNtrDdVJ4WBZ21iUFJw5q5FQyPw37J5NlJaiES5/hz2akwtTjM3Cal4ZDZGbpNN
X-Received: by 2002:a05:6808:2195:b0:3a8:72e9:e173 with SMTP id be21-20020a056808219500b003a872e9e173mr6598999oib.24.1693487793133;
        Thu, 31 Aug 2023 06:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487793; cv=none;
        d=google.com; s=arc-20160816;
        b=UttStpp1zcYGX6KVmEBAm3a9i8tCrKc4gS4ynGy0dPmdY9ztGUKk0FROCKOpaBVKq0
         OBqhtQkETpjNzv2kQwwsFTZ9s06lk/j2DSBZB36s3kWoNByRdySpPf1U2FJyWNV3jpc0
         J2DOo6IKEKaPbkiAlIGZzooZPCfinoBmWHp1x0Vt5xNO43vJfz1lB50Vra2DTvrCaWVh
         RBjwm0B6QmglWkh2kgUF3X21++p6U29PCfK31XpUCTc8M6sjdZC+px2fGMaLGKlAw+Dm
         tTwlTAKHfGDgAOH8y3j0tUMLRAb+2CMYqXCSWUiPvrLmMX4fPRJyMPrKWyOszxF02U4+
         w8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ly1kC7+EX0Gl6t88DEpIhyLj6K5uYKTE96gtcEHiBoc=;
        fh=InycMM+Oh6rqwA0cm9k5CHcWLr7leqYWXRRFXNd6De4=;
        b=Fh9xhFRFnQ8uEmLt+/m+gTJGgwEiMmkC+S5W1TVcLeeAxqY17gYg/0/p3lcWKmZYbM
         l5Zdy99uRDvlJ7E+mfeENTy0TGLDjqrQmoPKW02vXMbjX7R13A4X8ULactIwP9iIALxl
         sY25jni2rogI8GuU/5/NC/JTKPHtgauvpJGUBZO8YODwilZ/HzFNB0Fj4PJsrmGGsCAI
         ke6CNGP8uEgLl2sjKeDt+qK6ObIrwZMgaWu7qQw7LruJbvrycU0tlSxM/yVMiGmBONoy
         JN8KD7JsMUGEq3MRm8CRq1B5KWzHtxaaQ0wzseYEWzc72s1i1ZaGApw+CwH6RBrYaPb4
         VThg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5tp9k2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25-20020a05620a269900b0076ce7431548si970524qkp.618.2023.08.31.06.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5tp9k2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhUj-0000As-D7; Thu, 31 Aug 2023 09:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhUh-0008Dd-FL
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 09:13:55 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhUf-0002pH-2B
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 09:13:55 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso91969166b.0
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693487631; x=1694092431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ly1kC7+EX0Gl6t88DEpIhyLj6K5uYKTE96gtcEHiBoc=;
 b=w5tp9k2M9/hzQZeSRe3Z+kbtEcpoT4YhYcZVUQ1xqYIEM03V7pXwr+dYqVUUcQCDAc
 ESmJO4NXyc9ENkL32+6qQLEp5PlomnTrB34jTye3uIAzmMFY8Se6YWLonvmJVd+9i+i6
 WjNZ+9dK2DDQK7HTPK27v6CBE1tNpg5yVg0+u1LrAtNeTdfF1vw6tJjZupkAX5r9BhNV
 6KehFw/HIdMMNbsdXmKAJamHso+W0mpYbn83sXambwfLXalw7Czujw2WrTMoVbSFwznO
 sH2HhSkURAT37mXTjh/L7Os5LDoDoCQRh+qx6agQXoM818zCNzJ0roROIbwocDgiKjG6
 RnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487631; x=1694092431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ly1kC7+EX0Gl6t88DEpIhyLj6K5uYKTE96gtcEHiBoc=;
 b=CoOKZLCCLDnQER/TUl7STGn/d0kl674QtGXk4Hi6PkcHwUudjRikdbUemsXzQ4tT4t
 R7QF24nHLB4xJwFemJQJT9IxB7iA/u3kyQV08KzWm85qntOynMpKCG1BD/ipXZBFG4GG
 NI8NyO8dw2SUqYT29urybFwSyum94157aQfGAKGu6kxBeEXEs5tadskGe341eZ/pOF72
 2cO/QNb3wHy6bgFPKa4fen0lkXcq5+wykfN99UiYF+FZiLNBISGDlgyg8OIFww+fS2Fb
 VQsgsG+iznyIaWC9hrMkvlaJI1rro+OP2ORhsGzh4vS2MsezG/zNpQ7ACcrQIGIdwGK6
 bL5w==
X-Gm-Message-State: AOJu0YyMJRcjbcH0xfDVyCfBTyiC4VbAA/2TLKx6by7Lo5AdRqgR/Pps
 7cBfQozfkTAX23QrS7BXbEbmrioIBS5rIs11KmE=
X-Received: by 2002:a17:906:7685:b0:9a1:cdf1:ba7 with SMTP id
 o5-20020a170906768500b009a1cdf10ba7mr3684104ejm.15.1693487631192; 
 Thu, 31 Aug 2023 06:13:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 lg16-20020a170906f89000b009a0955a7ad0sm745041ejb.128.2023.08.31.06.13.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:13:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/intc/arm_gicv3_its: Avoid maybe-uninitialized error in
 get_vte()
Date: Thu, 31 Aug 2023 15:13:48 +0200
Message-ID: <20230831131348.69032-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: N0I1z+FaUesn

Fix when using GCC v11.4 (Ubuntu 11.4.0-1ubuntu1~22.04) with CFLAGS=-Og:

  [4/6] Compiling C object libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
  FAILED: libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
      inlined from ‘lookup_vte’ at hw/intc/arm_gicv3_its.c:453:9,
      inlined from ‘vmovp_callback’ at hw/intc/arm_gicv3_its.c:1039:14:
  hw/intc/arm_gicv3_its.c:347:9: error: ‘vte.rdbase’ may be used uninitialized [-Werror=maybe-uninitialized]
    347 |         trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsize,
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    348 |                                  vte->vptaddr, vte->rdbase);
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/intc/arm_gicv3_its.c: In function ‘vmovp_callback’:
  hw/intc/arm_gicv3_its.c:1036:13: note: ‘vte’ declared here
   1036 |     VTEntry vte;
        |             ^~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 43dfd7a35c..5f552b4d37 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -330,23 +330,20 @@ static MemTxResult get_vte(GICv3ITSState *s, uint32_t vpeid, VTEntry *vte)
     if (entry_addr == -1) {
         /* No L2 table entry, i.e. no valid VTE, or a memory error */
         vte->valid = false;
-        goto out;
+        trace_gicv3_its_vte_read_fault(vpeid);
+        return MEMTX_OK;
     }
     vteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
-        goto out;
+        trace_gicv3_its_vte_read_fault(vpeid);
+        return res;
     }
     vte->valid = FIELD_EX64(vteval, VTE, VALID);
     vte->vptsize = FIELD_EX64(vteval, VTE, VPTSIZE);
     vte->vptaddr = FIELD_EX64(vteval, VTE, VPTADDR);
     vte->rdbase = FIELD_EX64(vteval, VTE, RDBASE);
-out:
-    if (res != MEMTX_OK) {
-        trace_gicv3_its_vte_read_fault(vpeid);
-    } else {
-        trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsize,
-                                 vte->vptaddr, vte->rdbase);
-    }
+    trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsize,
+                             vte->vptaddr, vte->rdbase);
     return res;
 }
 
-- 
2.41.0

