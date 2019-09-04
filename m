Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1146033wrp;
        Wed, 4 Sep 2019 13:08:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKHAp8VnaS6zAu5jbdX2ZiEqI5urSiEDE0P0VJh83f/zSsHJnbEsdtb4qFOwDyZBNadKla
X-Received: by 2002:ac8:43c8:: with SMTP id w8mr10914970qtn.322.1567627691155;
        Wed, 04 Sep 2019 13:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627691; cv=none;
        d=google.com; s=arc-20160816;
        b=whlGbumTaWbkN13Xht7AMB63N1Fvuyy+r68EdVhbA3lVtsSBqJncs13uLTI0vRW1Xl
         Dtt+aFVRm0PaZojeezKIG2PGFeDbMGIknybhZELBDOd4U2gBMKUZFgt4GX4uq3+WRNTt
         2PPtopotlhuXfLZzPF6cBofeXWnVJ0CbFF1bJyPfQWppPX1Ohxx2iXE4qjZlGdotTvdT
         sDoqaEKRs1kCmfIxg6whe/mNV8UIoHxxCp818Msk0EGL1qzQvQzw5thESBX6I3c2z8mh
         NvfqMLKt10G/AAoA6kzOhhTpTlBnnnGJoDgNATaBsfTwdIduvHyAcu7EdOxGkd3jxbPK
         rLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0Xeagu+uHVK2sO684+uTrIYgzxrvd15EJGaykrkk5Oc=;
        b=vOX2tFUPEihS4cArDvZ1L/8hKeem0+rkbuZDDBDZlq/WlUHI69xwk3ZfF4lGz3VQ68
         Jqh92U1+vQiEk6/hnxPkYcsucqbIP36hgGmiLF5/mW6smOecO3LdjOvZ9GIdp/BMhQYN
         k7/zhWvc1wcV/ODNlH39fc2ZQUOGYh3+w6pNpz1xZU+Ffuu4ms8/3nhpiPC4z7ACo64Q
         YZbD8fUEZFSDFJ9K/bX2RGx9zmexuet90aROwF4EXYn2darg7cfPwsfLXyYlLjRFLCt0
         GTp3dfqoadGR2MUpLamK70LRMbSZ63ja+qu8Zp/xGm72H8F/lzagpz5KmtSATCXtIIXj
         kp2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BS78uIzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k42si16339372qtf.138.2019.09.04.13.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BS78uIzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bZa-0002SS-2k
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0c-0005JG-11
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0Z-0002u0-TN
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:01 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33501)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0Z-0002t2-JM
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id n190so11796165pgn.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Xeagu+uHVK2sO684+uTrIYgzxrvd15EJGaykrkk5Oc=;
 b=BS78uIzA2V0Ik7j6VEbA7aI72ZgTwaaKBBGMTUeQviINV0kX4qtTKqHJt8e6tArPUo
 UyD4fJg9iQ+tUEFxjwxQERsd8G6YShBq0RWaLha6aQ2QKLZdxMljZOQCEWQ6vgI+jRmY
 p1GiTpIFObExKRSUhk1Pmv9jTdMF509w23YrQw3kcNo2+igLvm7Oo93bmvtYdQ4d1oVT
 xdWbXzvHK7CEbvWhJDf42eONr4Km+2g3Z4wceZGLkCFcltzmD2Sh6Y+UzL2QLT9vrv2K
 pCNu0JLYsqUObqszMpMJQV8qo8f5McC3eyIl236Ac0HWVsrQpzeoE7C19bwBHsMvy7UO
 qZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Xeagu+uHVK2sO684+uTrIYgzxrvd15EJGaykrkk5Oc=;
 b=NxxhedTSbaZrHhYSX0XDfKS7ICbum3hQDLWSG7jLMg0KDCHz0RTqVEn3VP8PVT/V7r
 F0j8xJPcKglvvjKBm13IxVcSIL8EaxHxusG/ltZGWoxc55C6AYE1g7O56G+4MIv/jelp
 aR8B9IxM2rNHLwyXKyHcXY5M6ZMa7F01oWo93aS8pTU2aqlgR2cs5UQ9SqjoFoTgmEZq
 xx7kIDZZGdBN3cgL1bwUUjMHbi5V/qzB+LYESXqLgBGIF3vOWEbgDNdTWknU04cUwEft
 mDXpT3lM9NW0S6bhHdJtpy3wmT2EMSCIWR2ojvDirMSVsJaI6KEMCHH6xJe0v7hCBR0s
 9YGA==
X-Gm-Message-State: APjAAAWU4OdjlkIhtU6Uqu8SIb95849vQjTLzDQpcVsFQ9NyLgp46ao4
 3NVbEi1YUMv9q+Nf3cVMC419dg==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr36581969pgk.378.1567625518491; 
 Wed, 04 Sep 2019 12:31:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:35 -0700
Message-Id: <20190904193059.26202-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: [Qemu-arm] [PATCH v4 45/69] target/arm: Add skeleton for T16
 decodetree
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KF3p7ASXQeD8

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c   |  6 ++++++
 target/arm/Makefile.objs |  6 ++++++
 target/arm/t16.decode    | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 target/arm/t16.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7f2a46100e..7e530f1fdc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7560,6 +7560,7 @@ static int t32_branch24(DisasContext *s, int x)
 #include "decode-a32.inc.c"
 #include "decode-a32-uncond.inc.c"
 #include "decode-t32.inc.c"
+#include "decode-t16.inc.c"
 
 /* Helpers to swap operands for reverse-subtract.  */
 static void gen_rsb(TCGv_i32 dst, TCGv_i32 a, TCGv_i32 b)
@@ -10669,6 +10670,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 tmp2;
     TCGv_i32 addr;
 
+    if (disas_t16(s, insn)) {
+        return;
+    }
+    /* fall back to legacy decoder */
+
     switch (insn >> 12) {
     case 0: case 1:
 
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7806b4dac0..cf26c16f5f 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -43,12 +43,18 @@ target/arm/decode-t32.inc.c: $(SRC_PATH)/target/arm/t32.decode $(DECODETREE)
 	  $(PYTHON) $(DECODETREE) --static-decode disas_t32 -o $@ $<,\
 	  "GEN", $(TARGET_DIR)$@)
 
+target/arm/decode-t16.inc.c: $(SRC_PATH)/target/arm/t16.decode $(DECODETREE)
+	$(call quiet-command,\
+	  $(PYTHON) $(DECODETREE) -w 16 --static-decode disas_t16 -o $@ $<,\
+	  "GEN", $(TARGET_DIR)$@)
+
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 target/arm/translate.o: target/arm/decode-a32.inc.c
 target/arm/translate.o: target/arm/decode-a32-uncond.inc.c
 target/arm/translate.o: target/arm/decode-t32.inc.c
+target/arm/translate.o: target/arm/decode-t16.inc.c
 
 obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
new file mode 100644
index 0000000000..e954f61fe4
--- /dev/null
+++ b/target/arm/t16.decode
@@ -0,0 +1,20 @@
+# Thumb1 instructions
+#
+#  Copyright (c) 2019 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
-- 
2.17.1

