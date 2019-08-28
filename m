Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1195983wrs;
        Wed, 28 Aug 2019 12:50:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSYa08Hbd1uck0bOJenXsZnoajMRP/niTsXpX3Zme0/cXA6UL4WuL9K6GqJv53SNynVtUi
X-Received: by 2002:a17:906:8297:: with SMTP id h23mr4873493ejx.1.1567021849653;
        Wed, 28 Aug 2019 12:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021849; cv=none;
        d=google.com; s=arc-20160816;
        b=TjfS62Z9jeNRnRd6yJ7qTgI/tC5dOBv6+QxZrCSyBMB4UMHBcyseY8Yxqqzw1sVfJl
         DGjIlYdNP+H0xzaLwlV/3FnuGX7usWGDw70daXnvZrxPa1ewAZyl3BR/K+WKnbTLf1i0
         NpdxatrYKKP6pHQyo3uB9gmvVo3z5JWEBJH20oZ5DkCFrGx52V7ZGCqeOqPYaERm73//
         Frv62c9EcQpm5OQdrR7xTtYljvlAznAXlp5nhQEzd4oub5XdoSQ5oPhkIFdMP7H0eV83
         B5RbT6PLcx94kWopZDrzRcmT47ILuOv2fGhLDMHYa4L6GcHRfJZiXDXEQkD/EAR4GrhI
         IxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0SMzf99NHPKkTWoLRfHeddqKK5zZsCfVSTziSkomW74=;
        b=KinhoSNIR5J/6mfUO4sJYl+EUBGUOk/gyUY917Imjem+xvd95CFmYYbsq3bftmZl+7
         SfE23FC58I9kbrou3Zk8OAYMdrSj1HzfhcBt8GJlZAuzuFxblP0UZfUnTngwbq8t77iM
         hpJcQKTPF7whFQXX47kQRPvQGadra2t6ulQf5OkC95yLna5l5LSAvPJNdvrJ7DBZ2o18
         72UVpgq6bs/recsxhVh6WdSl3OP+AfJ6QbEeTs+BnpWq4CH8X2lYu9aEYWmpxwzM+TwC
         d1HV3SMeY3rRoqPorbSiZ1Pj0GgpIq9ylZUghT5e9Jls/8yqPWSlfNBxyNmObx1bMn+D
         Bc5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o9athz1c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd8si1733838ejb.354.2019.08.28.12.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o9athz1c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33xw-0005o0-H2
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gd-0003rS-Q1
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GZ-0000UJ-2A
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:01 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44127)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GY-0000TG-Nn
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:58 -0400
Received: by mail-pf1-x444.google.com with SMTP id c81so373155pfc.11
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SMzf99NHPKkTWoLRfHeddqKK5zZsCfVSTziSkomW74=;
 b=o9athz1cN8z7ysn/AeMY5z5p05i0NYludTqS5KfjUvY/ksbmAKVtnkPO+dMxoC8BkN
 54pGppMXIu8Gac8IRrN5YF+puPLOEQCOOFxJsPHt/9Qc3jGGqQOxPRWeqTpasKgTeV9x
 xehdyziK1ZaTSCtkXloiJ/RmFbXAHGP01PGS5IlGEYFKOi8GiVLLCtaQ1TVjz/yr522l
 np7FI2oXUPspoZXrhpVwNJi5XIfWZunr8LAmXrPpDR0g0PyGpJYYd1nAZNq5X4KQ2L3B
 hjaIMCC05Sh/3PL4Y5wWVnJHQOgUkYobvyxyw5ljFBT8mSXtAXSeVXgcq2O8Rnjmgp3Z
 mAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SMzf99NHPKkTWoLRfHeddqKK5zZsCfVSTziSkomW74=;
 b=qhGe9Qradro6PTOrav/fYSLVdT6zO6EwiCfqPV0LcvPvyq0qjQBKWFgTfuCCuI4S5F
 arA6ZGNJObtTZWoIAD3rTiq3wcS/gwzvGqrRJn12D6ZJ+zWgpcD3gnW0wFufgOKAFYBV
 AatxJ8pD0Aj7kXPnkglncUAm4aO68Oc1q5w1PMN959y5/2FBllsojKyONyGJpgQtE3NE
 GPhXGSIlsM7syj5GymVLsIAnKdgPmuxY7uDgJL0L6b13L2lsAVB0Il15W7p7YRfNvbMe
 PGoqNMUpnAlh/rL05u7YcBufKSOxWmpBJcycAAMXvC9MEo+MQPF6yfTJMr2TuTiOyrp3
 k5xw==
X-Gm-Message-State: APjAAAV1eSDIo1yMgtxSPV54YhObEeMoDefuRks+eXODqEqZNXAJHxtj
 Nox/De4yGppNcV8KeFfYQGgj4Q==
X-Received: by 2002:a62:b415:: with SMTP id h21mr6525106pfn.198.1567019157501; 
 Wed, 28 Aug 2019 12:05:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:32 -0700
Message-Id: <20190828190456.30315-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 45/69] target/arm: Add skeleton for T16
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
X-TUID: s4uc5F8nmNnG

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c   |  6 ++++++
 target/arm/Makefile.objs |  6 ++++++
 target/arm/t16.decode    | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 target/arm/t16.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index defbcf68db..106ef08ada 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7534,6 +7534,7 @@ static int t32_branch24(DisasContext *s, int x)
 #include "decode-a32.inc.c"
 #include "decode-a32-uncond.inc.c"
 #include "decode-t32.inc.c"
+#include "decode-t16.inc.c"
 
 /* Helpers to swap operands for reverse-subtract.  */
 static void gen_rsb(TCGv_i32 dst, TCGv_i32 a, TCGv_i32 b)
@@ -10646,6 +10647,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

