Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812339ejb;
        Thu, 25 May 2023 17:24:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ejv6IM7/nZ4qVVC8DvihtHuWOZkIrecsOaovcjQJQJHKfmdzUQNzbXxAxR/TnAccTfFHl
X-Received: by 2002:ac8:5909:0:b0:3f5:c9f:1b27 with SMTP id 9-20020ac85909000000b003f50c9f1b27mr241901qty.1.1685060667881;
        Thu, 25 May 2023 17:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060667; cv=none;
        d=google.com; s=arc-20160816;
        b=e7SJG48uQHsqWr1ycXmZmcVcH00NmPzK0DXV3MDJdEnC8Vw/ApT3w5rSDI9OcJXuiN
         gmMCkNfp8QSoFNrJuyyTO3mMKfWiSCQ1f4tbOQmNXieJzs3Q7hQg+LDQOvbe+KvylPil
         BipSoANPD1kNfr2UGcRCVNtms7SpcfcpH58bY/OXbHaN4R40v6ynfwTEMAl81VWy/yiT
         WqP3fgZP8MWkdCmW71/HjSlUb3Q7T4DsSTT2DUYz1H2EWDUDPJLBg/DqYG8Ad43fHoc+
         FFk0P3s45vPwQBZbmsHy1aGLxZsJZ7l8hpLX9gjCLPOdj2UytCh7lyQ25Gikr9q3dBut
         kHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k9zblclqYPHjXAc9J8dhxRq0a0SpKKfcw5wbjQnIz2w=;
        b=uC+zs3EVayMnrtpbhUAt6/Qo6ITdDoYxA1F8ZI7gUX90N6qZJSmABliD6QuBSgbM7e
         Ji5OtjCCzhsxfo0kXqJj4+sQNdTOC4tob+QU9T27p67tTWVSVmI/wD1us1tvx7b38COL
         ZnAaIsWBGDVhyjAD9kNBnCoVkuIFPqA+grl7rymptpOt2SysAWp6bSkgcXYagyuEj7z+
         9O+f1mjJVn/f2Y1YUvUYUJ4C975+UjRB6ICYiQZCmzhDYkSkpQqFXqmuFE+hiv4iT1Un
         VqkZO/QEGIjbPx45qaTfR4rSZiBSe12VAknsrMZaukR+ROnNIoU8P0D/jXnNM05KSxzi
         Wr9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l6gyj/Yh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30-20020a05622a1a1e00b003ec47188b74si949143qtb.253.2023.05.25.17.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l6gyj/Yh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LFJ-0002dC-22; Thu, 25 May 2023 20:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFF-0002bB-UN
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFD-0002BU-6Z
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64d3491609fso284733b3a.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060625; x=1687652625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9zblclqYPHjXAc9J8dhxRq0a0SpKKfcw5wbjQnIz2w=;
 b=l6gyj/YhlNXXL4dL6FTfvAuvz9MScaOHX50l0Lk23OP1Vr7MLgUKgZugwRMek//kUx
 X0xvkJWzs/886npzuUhm11Xw7WQNjIEV/V1G3FwZEAG0rEwU0Hx+1WPXtDs8rkLSGeE1
 7+diKi9VUnobGUOgvzmuDFxxotuMcMV6jbnDVPeNoWtKDerqKyNznR/mvJh1irSG+7+n
 F3VNYGGUmXTWxP3rnnbtq0IA12v54BEZ8yzsthuWOUyfjXI5hp4naYrbKUGAqmfXUnP1
 5x2IbP+K+J/PPGleRmcwKof9ifpjAQobQ6QRiPiVU5Nm01fTPuiOndzRXJ0gMpv6bvV0
 PSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060625; x=1687652625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9zblclqYPHjXAc9J8dhxRq0a0SpKKfcw5wbjQnIz2w=;
 b=VbRBXWynjFQqnW4EoTo5Tn7k68NxKzmxk8ZS31udDqjLJ9PnPXwgd7KNajKasGTZ8p
 NIEOGq8uSLBtChpbcdTIfH1/1kX0Z37G5eXbIGxkhdztShdnnYr7SwE5PpyoEQzFxIXT
 3BiJQFQD4NCcE8M4Ucjd8RPX2d+zvaXxlw4J2u1mWgGD+5STaJ0pE3/6aaXCAYZrOlfj
 ysTYkkq3CzAEvHejqn09daA8mYrgoCyn3nQYD793u7xooo5SypYVXoYTcV66wh1F+LPz
 3Yozrt1vwk/Y0NgCjsO9xe3GNoXlQNSpqb9KGXmlDrPtKhaGZNVsNMtZgOge0d4/cVdA
 3N3A==
X-Gm-Message-State: AC+VfDwt0lFmVWhFaJKnWLK9PIRb9BttqIzQ7qVuMdfWsIHnth4pmqkd
 gKQc7NvBYUbf2NDr1Co3EH0ckG61Eg68q+XwASM=
X-Received: by 2002:a05:6a20:3955:b0:10b:1c98:59b6 with SMTP id
 r21-20020a056a20395500b0010b1c9859b6mr20157pzg.14.1685060625475; 
 Thu, 25 May 2023 17:23:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 12/16] accel/tcg: Extract load_atom_extract_al16_or_al8 to
 host header
Date: Thu, 25 May 2023 17:23:30 -0700
Message-Id: <20230526002334.1760495-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: 1VO4/d+X2M9H

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../generic/host/load-extract-al16-al8.h      | 45 +++++++++++++++++++
 accel/tcg/ldst_atomicity.c.inc                | 36 +--------------
 2 files changed, 47 insertions(+), 34 deletions(-)
 create mode 100644 host/include/generic/host/load-extract-al16-al8.h

diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
new file mode 100644
index 0000000000..d95556130f
--- /dev/null
+++ b/host/include/generic/host/load-extract-al16-al8.h
@@ -0,0 +1,45 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Atomic extract 64 from 128-bit, generic version.
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
+#define HOST_LOAD_EXTRACT_AL16_AL8_H
+
+/**
+ * load_atom_extract_al16_or_al8:
+ * @pv: host address
+ * @s: object size in bytes, @s <= 8.
+ *
+ * Load @s bytes from @pv, when pv % s != 0.  If [p, p+s-1] does not
+ * cross an 16-byte boundary then the access must be 16-byte atomic,
+ * otherwise the access must be 8-byte atomic.
+ */
+static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
+load_atom_extract_al16_or_al8(void *pv, int s)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int o = pi & 7;
+    int shr = (HOST_BIG_ENDIAN ? 16 - s - o : o) * 8;
+    Int128 r;
+
+    pv = (void *)(pi & ~7);
+    if (pi & 8) {
+        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
+        uint64_t a = qatomic_read__nocheck(p8);
+        uint64_t b = qatomic_read__nocheck(p8 + 1);
+
+        if (HOST_BIG_ENDIAN) {
+            r = int128_make128(b, a);
+        } else {
+            r = int128_make128(a, b);
+        }
+    } else {
+        r = atomic16_read_ro(pv);
+    }
+    return int128_getlo(int128_urshift(r, shr));
+}
+
+#endif /* HOST_LOAD_EXTRACT_AL16_AL8_H */
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 57163f5ca2..39ad89800d 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -9,6 +9,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "host/load-extract-al16-al8.h"
+
 #ifdef CONFIG_ATOMIC64
 # define HAVE_al8          true
 #else
@@ -311,40 +313,6 @@ static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
     return int128_getlo(r);
 }
 
-/**
- * load_atom_extract_al16_or_al8:
- * @p: host address
- * @s: object size in bytes, @s <= 8.
- *
- * Load @s bytes from @p, when p % s != 0.  If [p, p+s-1] does not
- * cross an 16-byte boundary then the access must be 16-byte atomic,
- * otherwise the access must be 8-byte atomic.
- */
-static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
-load_atom_extract_al16_or_al8(void *pv, int s)
-{
-    uintptr_t pi = (uintptr_t)pv;
-    int o = pi & 7;
-    int shr = (HOST_BIG_ENDIAN ? 16 - s - o : o) * 8;
-    Int128 r;
-
-    pv = (void *)(pi & ~7);
-    if (pi & 8) {
-        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
-        uint64_t a = qatomic_read__nocheck(p8);
-        uint64_t b = qatomic_read__nocheck(p8 + 1);
-
-        if (HOST_BIG_ENDIAN) {
-            r = int128_make128(b, a);
-        } else {
-            r = int128_make128(a, b);
-        }
-    } else {
-        r = atomic16_read_ro(pv);
-    }
-    return int128_getlo(int128_urshift(r, shr));
-}
-
 /**
  * load_atom_4_by_2:
  * @pv: host address
-- 
2.34.1

