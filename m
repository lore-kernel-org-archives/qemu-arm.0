Received: by 10.28.4.212 with SMTP id 203csp544854wme;
        Fri, 4 May 2018 03:05:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo+16Xaej1syh6jlTK2fXJ0Vqi1HEnLdNf3fBWpBq1l53K+JRTq7tGwkyeMMla2Kz5ZDq6P
X-Received: by 2002:adf:bc0f:: with SMTP id s15-v6mr16508684wrg.58.1525428349749;
        Fri, 04 May 2018 03:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525428349; cv=none;
        d=google.com; s=arc-20160816;
        b=YMKzDB9bYra2FKcQAYirhisUOfp8ZaBt6BanDvp7+FQvdjRCh3UsmzopodTzU5boYL
         5yYLt8oVvXKg78rS6Na9d2js8gJ1NYumDa+jOzkarixPUfRj4eZHOTIwFUMx6ZYVdiSZ
         xb1f8hVETR6njPpO0pVnpWgMW95kNJ+xNWRunft8YkfPyS9z04RcPkgKMaikKxla3kD3
         /ZxF68EdK4L+VBEgVg7wjYt4vDuRvK9vm2mqUzcDHMo+FDtB69EywAuOug5PnBGoLvvR
         P3PQO84qX7Cwgwvjs5B3RRz3v0den1VA9XTsq2tb/P4kCaJzqs61XorWoSSgL1Ra9IuV
         aQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=ip+9i/ctX/maWcJbSUnjmA9kaKqE7fC4VZ64c3mu65A=;
        b=ZHpH1cUdRrtGKYrPayEE/ovHEMC2WZBRUAbWF1qdGcaub/zqabZJvCk0N3rny1jXjR
         J1Xn/lBhMQQd3UB13/ak+AyUfOyUwKe3jdNQPj7sFhqxWE3s/1KrsTJusL2X1B1ya5qS
         w3VXmoh6w1rHFTyo+wlcIPE9B4Co4mXFJdOuTB5ZwJjooDZ1YGWBDriQzE8yJBEmPd7d
         pQWvgMM0qoANDlVrihfSc/RCwXlXP8QrKdaCZLzaA33HVSrgJDJsLtrnrchlEVtEaoV5
         dVpsW99Ot6XWIjCvBf25nPB4hs/rhwtQ7JWWLsmgt7mIV0po0xf6XrP3TcLp+Wx8Np5+
         gVvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n189-v6si974840wme.90.2018.05.04.03.05.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 May 2018 03:05:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fEXb2-0002du-P0; Fri, 04 May 2018 11:05:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] softfloat: Handle default NaN mode after pickNaNMulAdd, not before
Date: Fri,  4 May 2018 11:05:47 +0100
Message-Id: <20180504100547.14621-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-TUID: DfCdojK1mPGf

It is implementation defined whether a multiply-add of
(0,inf,qnan) or (inf,0,qnan) raises InvalidaOperation or
not, so we let the target-specific pickNaNMulAdd function
handle this. This means that we must do the "return the
default NaN in default NaN mode" check after the call,
not before. Correct the ordering, and restore the comment
from the old propagateFloat64MulAddNaN() that warned about
this corner case.

This fixes a regression from 2.11 for Arm guests where we would
incorrectly fail to set the Invalid flag for these cases.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat.c | 52 ++++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 70e0c40a1c..8401b37bd4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -602,34 +602,42 @@ static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
 static FloatParts pick_nan_muladd(FloatParts a, FloatParts b, FloatParts c,
                                   bool inf_zero, float_status *s)
 {
+    int which;
+
     if (is_snan(a.cls) || is_snan(b.cls) || is_snan(c.cls)) {
         s->float_exception_flags |= float_flag_invalid;
     }
 
-    if (s->default_nan_mode) {
-        a.cls = float_class_dnan;
-    } else {
-        switch (pickNaNMulAdd(is_qnan(a.cls), is_snan(a.cls),
-                              is_qnan(b.cls), is_snan(b.cls),
-                              is_qnan(c.cls), is_snan(c.cls),
-                              inf_zero, s)) {
-        case 0:
-            break;
-        case 1:
-            a = b;
-            break;
-        case 2:
-            a = c;
-            break;
-        case 3:
-            a.cls = float_class_dnan;
-            return a;
-        default:
-            g_assert_not_reached();
-        }
+    which = pickNaNMulAdd(is_qnan(a.cls), is_snan(a.cls),
+                          is_qnan(b.cls), is_snan(b.cls),
+                          is_qnan(c.cls), is_snan(c.cls),
+                          inf_zero, s);
 
-        a.cls = float_class_msnan;
+    if (s->default_nan_mode) {
+        /* Note that this check is after pickNaNMulAdd so that function
+         * has an opportunity to set the Invalid flag.
+         */
+        a.cls = float_class_dnan;
+        return a;
     }
+
+    switch (which) {
+    case 0:
+        break;
+    case 1:
+        a = b;
+        break;
+    case 2:
+        a = c;
+        break;
+    case 3:
+        a.cls = float_class_dnan;
+        return a;
+    default:
+        g_assert_not_reached();
+    }
+    a.cls = float_class_msnan;
+
     return a;
 }
 
-- 
2.17.0
