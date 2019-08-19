Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3191473wrs;
        Mon, 19 Aug 2019 15:06:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7rjvf4potmYSNWuS8/bO52OavkcvRtqPo1q6tgcH/NVfuw+niJwKW9ZdApfKY+uyMETB/
X-Received: by 2002:ac8:4903:: with SMTP id e3mr16813987qtq.130.1566252370645;
        Mon, 19 Aug 2019 15:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252370; cv=none;
        d=google.com; s=arc-20160816;
        b=VbHxbTHVd48rX3l/sQMzcm7VMAQ6oBwv5a8Stgp6inwy2bDgyeak8lgnGyBY+XPQ8W
         NDKGykbuuDmeOjPkTbYALkLCj9nL3N6BLkmluAbwX0nJklcwVL43yjJRj1Mm032OdbCh
         CYilwR5M5cJG1vFYOmSHUSjSTk746XFQmVEL1Gfx9ZbB5wMdzB8YVkIptAAEWXzB61qw
         3i+zRAM90XBGkQWtomrVwrJPWp9aPHso//+BSSta6Kxahf1ElWJK89Yo3R5x86x/ht2p
         0U4WKLwwkfObn03t4nHfm1h7678Ei6bLxie8AMqfddy5ovELzq+O+9BHm+V//gWjRIEV
         pIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=BfxhiN9KVAYzZaSCSHTjQwUy5qzA5PRPe+BsdkgEMbc=;
        b=pVHyBOZXD0mQzWxPwsBtLKofWs5ULu8gMKZw3N3aZ0R4zvvl5dul/S8ptysFEgaJxb
         HDyyD2rLwELUFY9gYzSzHhMaCNg9jJIMySwjhXMdNdmf320lbduCuNsw9cyHY/pNbaSs
         HrdWtMyj7lBqBJOm/cb7cGkz3TNkNAB4mguAFSnrrjNRuIVULaYiVpTum8FLzroJ7VB8
         Jrjl6f/NdlYueJfMhEG5SsXnqP1sSx1HkK65yY1fr6tqDI17pYIW5vWCgbi6uPGjZM/f
         6+QACN4Kv7W78cvBR8W4wFcb8xONlg9iIoCt7Cgv+5XZ5IM2x6DKxFFFviYSK9q2TUM9
         cZng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YbWqlQ1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f54si9671337qtk.348.2019.08.19.15.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YbWqlQ1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpmz-0004gP-JG
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMf-0002S6-BU
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMd-0006dG-B3
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMb-0006ZX-9s
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:55 -0400
Received: by mail-pl1-x644.google.com with SMTP id m12so1591096plt.5
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BfxhiN9KVAYzZaSCSHTjQwUy5qzA5PRPe+BsdkgEMbc=;
 b=YbWqlQ1FUre1zS50UU5iFqvHcfv/hidgQU2q+eCjx+H5GQoVPigDyYNImUtMo7qeiP
 hMs+geXRTiCY+ia4a+J+BylzQXYdF/OU3VJgUKxdqQd1UO+xK0O8aVh6bl6iFGnjHERG
 Za7xa5ltWcUupTh/YLjw7TpMgO8ifjM4p8cR52gyxKa//FSlTQLdFN3DQGeZvjM9hkUP
 8uDw6emDiSiKK/SA/39lwgXKegAgzhefeShGmMNabU+12NBCUIY3xBuWT8JeL6QXexGl
 pTVIZQeexKcTeaUw5jiYeykQiJcrE8IOm4FPYch8ZxydXQTpH0b9t+lvxuJIOr4vVmtc
 ZYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BfxhiN9KVAYzZaSCSHTjQwUy5qzA5PRPe+BsdkgEMbc=;
 b=phrxlc+9ZQOHTGR0Soon0mAjhKQMCEFZCLGmP/j/9ZxXk/FOISAnefrX6aeEZa/bIB
 l7hUJUWmF//ZjcC1YZg/Jy3GF8varXnj/avV0MRM0rTGt1JMeORvXz2zItjYaN5aEBbk
 ZYqcSby3DTz5P9hJnVik/UOISX1SG+spvydxejpnQbY2gzH0vp7kuV6H4Y+qEFRm5SZM
 OoxdwrTg21h82vNWsIHq7A67pQLCNOYhU83/5UnTGJqFwJWvExSa+JWs5ZBcilHC3dIv
 XpsoaE1/uahkSg3vW5OmWFC0o2ap24VKUE5fDlQp/Uj9FQOTvKw0qu6MkmEfmJdoAGit
 8iIQ==
X-Gm-Message-State: APjAAAUrRswJ3QA/c7iUoHkOV2PnfjllRtGH3gcJDnTAaFQJd31Bc4En
 XROxo3PJECZ5iEjNut5Xu/VoEw==
X-Received: by 2002:a17:902:6bc7:: with SMTP id
 m7mr25197711plt.60.1566250730808; 
 Mon, 19 Aug 2019 14:38:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:31 -0700
Message-Id: <20190819213755.26175-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v2 44/68] target/arm: Add skeleton for T16
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
X-TUID: VMyFGHGbtn4V

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c   |  6 ++++++
 target/arm/Makefile.objs |  6 ++++++
 target/arm/t16.decode    | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 target/arm/t16.decode

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 49bab7d863..90d608a2d2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7538,6 +7538,7 @@ static int t32_branch24(DisasContext *s, int x)
 #include "decode-a32.inc.c"
 #include "decode-a32-uncond.inc.c"
 #include "decode-t32.inc.c"
+#include "decode-t16.inc.c"
 
 /* Helpers to swap operands for reverse-subtract.  */
 static void gen_rsb(TCGv_i32 dst, TCGv_i32 a, TCGv_i32 b)
@@ -10550,6 +10551,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

