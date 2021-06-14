Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2065906lff;
        Mon, 14 Jun 2021 08:19:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3VUjIcpfSXbISH6UufIkN5pvTiOV/2iH23KF6pngvqBbohMeQMbpP+5+QVSWL0uGW9M60
X-Received: by 2002:a5d:64af:: with SMTP id m15mr19473336wrp.364.1623683958505;
        Mon, 14 Jun 2021 08:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683958; cv=none;
        d=google.com; s=arc-20160816;
        b=sutIPltKwo0AHeKqEE3WuDV/LFFScGvGZqd4qqeDDQoNi7pz3W79AW4r0/WbMlRWu4
         xuGgLyPIYAQvLhmuwM99js2pNXfVIasV39gP/5Ort13vcIQf5Y488M8MrGBkHrBJd7Nd
         aoHDeJ7iKbrzJWnxaHXyIc31nGZ2DyUdichpQR8I4agQgvBNRmOJvgKsoBH8t1pqQ2eU
         iGT79SV6IJZ70G4lGgWHEq1jhrDVXo9yMYz8+9l5xY7Y4CtCfGrnNWYCs+SGV4jO3W2h
         dU6CmQ+0OxBf8lB9o+6DUAHob+b9t5y6ryBHtqvN1/P/15Ulg883OEI6EZB8+CthJ5YB
         0YMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S55DGDI4WqBT35wtwTquxv7rlzNFScDXQFlWVjPd8+4=;
        b=bMzvzMWBeh3++SDHQNDLzhrtIvChtwyUj9rJynYNO/3SJlgj9oW/KBeO9gT+awcorb
         t49RLN7wcMi+5IHrD1qqzQ/8ZPyzWifz2sjJrRqw98+W4aRNcyVoOePYz8/+r0Lsbml3
         sUkNNphPjxVECKBS7nQYom1n2GtCu0cnjvN6uBoo9MASXHFrVb1VqhcJky13FgKT3dY0
         dyAXKW2tN61gnQp8XoK1xjC4No6GK8LsbDuUCw2MUPoSnzHAaGjjzT7fkgqoGFwuOvp1
         qi0p3cWfbcCvH5D4pEvNz4kGWxC9sb06/WAy2jBCRl8PCMepzdto2JbyNnsOhKNKw/OW
         XgDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkUP0T5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si15363496wrr.340.2021.06.14.08.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkUP0T5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoMv-00022Q-HK
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoES-0000ct-FH
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEG-0000D3-W6
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so14940051wrp.12
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S55DGDI4WqBT35wtwTquxv7rlzNFScDXQFlWVjPd8+4=;
 b=WkUP0T5d0KQNFojPkhRtsZUfhgLp6IDTs3tClQxPZiwWD2kFYvf8H3dlgkPQjUVLOf
 xHFSkifKFHLJqIxdtvR3/4UqTBzBX9p3HWv3dgPXSkloms2bcZfQvip5BJ2KDBbRM0SO
 NA6TXDecbLzy/eDqKLybHdYv8YYsjN7iWb6OFvJznQW9OY3pyGQDKF1LyxUVTQ7u6rCV
 mlq+k3cI+WFxtjpYqVjTQq0wv8yaZYNIv4qhH38fkv0gncxRVbn5p0wt9pVWHkEE36gg
 KDrpSC9Q2oeDBEqL59W80ph8EdwtFNgxDRjTg+EN8lJ0ZUv2w7+urvJlUuqBa9R/D2IY
 vmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S55DGDI4WqBT35wtwTquxv7rlzNFScDXQFlWVjPd8+4=;
 b=Q7sDNjSecdk2LMiE1thRe2bMray0bULwehx/BUsZDf2OqKcLuSXuHC0hD0O9tW6HI+
 bDu3NcX6m9IER2kwaVx3wzgfjjaCuoZVmnW+C97He6lvUv/DEMCUNblgFbQ70WelN6Ql
 fBt7iIhHjP6Xwq51B1DsguSus5wmLMxHI+uqsP2J0XS4O0aktprZgYuwY640w2FnXQK6
 9t2Go5HtQB7H65utGdENOte4FsQspqmQbvlBiGU4fC0RU3Nom+sOOVDwgw7gq3+yeHnW
 q5S9awFHiQ2f7BDIO/q3dGNGG95uJHkT/L0TowGSkScnyMPlSrxgoagpPlObhX65PX6u
 8Qow==
X-Gm-Message-State: AOAM533QL5QI1giLKC0zxlCek6g3/c9FhnvKVx0+UREi7vKfDXyXtQ3s
 Lh8H52oEfFh+tkSiBgJHUmkIVf7h9CMlgg==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr19352648wrw.330.1623683419775; 
 Mon, 14 Jun 2021 08:10:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/57] target/arm: Add framework for MVE decode
Date: Mon, 14 Jun 2021 16:09:20 +0100
Message-Id: <20210614151007.4545-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gqqKKWEEcJpj

Add the framework for decoding MVE insns, with the necessary new
files and the meson.build rules, but no actual content yet.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h |  1 +
 target/arm/mve.decode      | 20 ++++++++++++++++++++
 target/arm/translate-mve.c | 29 +++++++++++++++++++++++++++++
 target/arm/translate.c     |  1 +
 target/arm/meson.build     |  2 ++
 5 files changed, 53 insertions(+)
 create mode 100644 target/arm/mve.decode
 create mode 100644 target/arm/translate-mve.c

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index c946ac440ce..0a0053949f5 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -22,6 +22,7 @@
 
 /* Prototypes for autogenerated disassembler functions */
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
+bool disas_mve(DisasContext *dc, uint32_t insn);
 bool disas_vfp(DisasContext *s, uint32_t insn);
 bool disas_vfp_uncond(DisasContext *s, uint32_t insn);
 bool disas_neon_dp(DisasContext *s, uint32_t insn);
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
new file mode 100644
index 00000000000..c8492bb5763
--- /dev/null
+++ b/target/arm/mve.decode
@@ -0,0 +1,20 @@
+# M-profile MVE instruction descriptions
+#
+#  Copyright (c) 2021 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
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
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
new file mode 100644
index 00000000000..e91f526a1a8
--- /dev/null
+++ b/target/arm/translate-mve.c
@@ -0,0 +1,29 @@
+/*
+ *  ARM translation: M-profile MVE instructions
+ *
+ *  Copyright (c) 2021 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/exec-all.h"
+#include "exec/gen-icount.h"
+#include "translate.h"
+#include "translate-a32.h"
+
+/* Include the generated decoder */
+#include "decode-mve.c.inc"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a51e882b867..9e2cca77077 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8919,6 +8919,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     if (disas_t32(s, insn) ||
         disas_vfp_uncond(s, insn) ||
         disas_neon_shared(s, insn) ||
+        disas_mve(s, insn) ||
         ((insn >> 28) == 0xe && disas_vfp(s, insn))) {
         return;
     }
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 5bfaf43b500..2b50be3f862 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -6,6 +6,7 @@ gen = [
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
+  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -27,6 +28,7 @@ arm_ss.add(files(
   'tlb_helper.c',
   'translate.c',
   'translate-m-nocp.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.20.1

