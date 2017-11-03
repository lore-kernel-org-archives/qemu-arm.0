Received: by 10.223.150.237 with SMTP id u100csp244099wrb;
        Fri, 3 Nov 2017 13:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+STkf2SrKoi4/nir+Ykf2ncNLs17n71gFR0k5vUodr94bMMdP402cNup+QO31K0ootRdVfD
X-Received: by 10.37.192.67 with SMTP id c64mr5246604ybf.415.1509740839717;
        Fri, 03 Nov 2017 13:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509740839; cv=none;
        d=google.com; s=arc-20160816;
        b=wKExOOp2EUH6eQs3PmN+1wG2E8XGDTfp/oRVlxQrn4Fzr1yyFW2s9HUjyHqTfWnwxi
         uQmMVOxEY/Pw+zKgbtV3bYg5VzaBl+wNC0XnqOWoyBRxPt2cHLiIzXGuNLCR+dRpOLY1
         wrW7C/aJiE9iBJE8a54QHTcsMn/rgUkh6MSWgCad+gQme/iv0Gwb0Dwo+z/o7wD/1s1w
         GDJAPdUvEkFN3GI1iTFDcowyUDYOeq90o7+YU6QElkU3MhGObxryn19L+FbWAIudql9O
         a/YL/0eh/AYZr6Efx0DD4i0v+G3Q4mmuu3IF9p9TJzJ09VRY7oyFMQlRLXiu/a9OvL0L
         Jw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cXsu7fL6uPi6qQMd28Nb5yDiXAuBukV+hBcOTVBdvuo=;
        b=F7U9SliNISwK9klCWgknw6NAkqd6kpUGWHzxKRcLnE4oS5W7llugBWNVWRwqPWAsnB
         TTJzIj0Nx3EBADBQ/zIg+brfAzPbYiSsVHCYegU01LG/1sGyr8zidvTUE04K7xdix0Ph
         Hj9p1+V8uWM2TyZ7pjxzOuFjAauIJaYrjpoxcqN/Ewm/mgim0UsUvgCY9jNlcizdX2aj
         AIv4gn2zEreuAiSrLS0WXlcP0z2KXXxjj1ZWAPWI/AknsfiKtbopC8hiLOw0mw7inctq
         UYyhiqcbpkAZtp1ipYb1uNOpaMpT8+DzsQpYBR/HbfKv8xcI8lehIzHXa2Us/wmpqv8M
         ebtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si1663364ybe.83.2017.11.03.13.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiYh-0001rj-4u
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYE-0001Xl-7r
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYB-0000Z8-3g
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:50 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:61141)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAiYA-0000Xy-Pl; Fri, 03 Nov 2017 16:26:47 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0MBFvV-1e18Hx2iQv-00AFqS; Fri, 03 Nov 2017 21:26:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 21:26:23 +0100
Message-Id: <20171103202624.5956-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171103202624.5956-1-laurent@vivier.eu>
References: <20171103202624.5956-1-laurent@vivier.eu>
X-Provags-ID: V03:K0:jKnaAGW+3t6b8ts5+0nBOFzmxdCCTSLVg/fr+T/NnUn940VPpnx
	QXHTNe16Nd6mr2Mkn48ZCexjj5lJbFBRvTMATXM2r4gbkDSkNYvP/Div53Z9i6mKX+pQgyg
	3MDFe2A7nMrsXVHOVAkoF7AtYNXOflBl9ea3+yL5rB9xc3ohcSq/d4Iq1gHd/gkNHBTaEPM
	oFPJPXPjUFjboRc76OLAw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wps4dm/rXCQ=:dYzW642U1bw+hRIL9kayIn
	Cts/GGBjqFTDkDr7pE5i5QaEt2cbVAm8FsTGWmAVCqOPFFlwp7OFnG9c8B6MStsi2sqo5951H
	/tQTVGeIsBMTEJpJIvNRNeyPAVbyWZJBFAVMUWw9dX8pihvClRnbpRSWLKB5iJZrV0fd9T93k
	Fq8Z2bqTiJ/kxhBBAo2hGwDqWkVVcIMnyiwqfLk75k2l+cK8agUmOIWfMoZIeDBV1iEyUvZLy
	BHf814VY6U+5r6FvhsyLw0dmHJCs6js3F1dTHD4AvarkL+iCWXkJrYxOiIrHWIoGypcov12aO
	ko0aMc9ANHKBOceun5oUytM9RDVx3jLyIdH9x2zXOfOKx3V2zgYCbUdMPU9qSLvdQjXzzAX25
	pD1Bau7EpaGyGpn14ALEY+8fiduPTTqOyjqVrbVX5y0sQg7LO5URwdN3cwVFVhjkM7UuPnJPU
	VDrRrjzhgc5Np62mBSREno5z0QEiNF50dMo7jtBVkExi3dVct+4OG7DYU/xOWoMOEFtgCZ9tQ
	0KRFbyrnyyTJTjJ9djkZEEaolvTxkYn9XJg4UTyrW7b869rmv/o2vFd2ArzWiS0FoKmO0jQSj
	LQomWUudRm3giNvG0o/uNjM0CemZHsR8ZBGaI90cPQMSds1EPz/h60nFZt1Pc5Re6VZomYPSt
	4F9KOw71cDFXDJUS0kMr86ZHC9YPwyypMDSUCPz8un2bW+J0zj8KCkNXZ8SFIV9By0Wfx8PXG
	gIauoEf3fVDPao77pl8OwKsccgo+59cET0b2Xg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: [Qemu-arm] [PATCH 3/4] tricore: use make_float32() and float32_val()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Stafford Horne <shorne@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Fb+96Vut7pK

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/tricore/fpu_helper.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/tricore/fpu_helper.c b/target/tricore/fpu_helper.c
index 7979bb6692..d233d010c5 100644
--- a/target/tricore/fpu_helper.c
+++ b/target/tricore/fpu_helper.c
@@ -21,10 +21,10 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 
-#define QUIET_NAN 0x7fc00000
-#define ADD_NAN   0x7fc00001
-#define DIV_NAN   0x7fc00008
-#define MUL_NAN   0x7fc00002
+#define QUIET_NAN make_float32(0x7fc00000)
+#define ADD_NAN   make_float32(0x7fc00001)
+#define DIV_NAN   make_float32(0x7fc00008)
+#define MUL_NAN   make_float32(0x7fc00002)
 #define FPU_FS PSW_USB_C
 #define FPU_FI PSW_USB_V
 #define FPU_FV PSW_USB_SV
@@ -63,13 +63,13 @@ static inline float32 f_maddsub_nan_result(float32 arg1, float32 arg2,
     } else if (float32_is_zero(arg1) && float32_is_infinity(arg2)) {
         return MUL_NAN;
     } else {
-        aSign = arg1 >> 31;
-        bSign = arg2 >> 31;
-        cSign = arg3 >> 31;
+        aSign = float32_val(arg1) >> 31;
+        bSign = float32_val(arg2) >> 31;
+        cSign = float32_val(arg3) >> 31;
 
-        aExp = (arg1 >> 23) & 0xff;
-        bExp = (arg2 >> 23) & 0xff;
-        cExp = (arg3 >> 23) & 0xff;
+        aExp = (float32_val(arg1) >> 23) & 0xff;
+        bExp = (float32_val(arg2) >> 23) & 0xff;
+        cExp = (float32_val(arg3) >> 23) & 0xff;
 
         if (muladd_negate_c) {
             cSign ^= 1;
@@ -139,7 +139,7 @@ uint32_t helper_f##op(CPUTriCoreState *env, uint32_t r1, uint32_t r2)          \
     } else {                                                                   \
         env->FPU_FS = 0;                                                       \
     }                                                                          \
-    return (uint32_t)f_result;                                                 \
+    return float32_val(f_result);                                              \
 }
 FADD_SUB(add)
 FADD_SUB(sub)
@@ -166,7 +166,7 @@ uint32_t helper_fmul(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
     } else {
         env->FPU_FS = 0;
     }
-    return (uint32_t)f_result;
+    return float32_val(f_result);
 
 }
 
@@ -193,7 +193,7 @@ uint32_t helper_fdiv(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
         env->FPU_FS = 0;
     }
 
-    return (uint32_t)f_result;
+    return float32_val(f_result);
 }
 
 uint32_t helper_fmadd(CPUTriCoreState *env, uint32_t r1,
@@ -219,7 +219,7 @@ uint32_t helper_fmadd(CPUTriCoreState *env, uint32_t r1,
     } else {
         env->FPU_FS = 0;
     }
-    return (uint32_t)f_result;
+    return float32_val(f_result);
 }
 
 uint32_t helper_fmsub(CPUTriCoreState *env, uint32_t r1,
@@ -247,7 +247,7 @@ uint32_t helper_fmsub(CPUTriCoreState *env, uint32_t r1,
     } else {
         env->FPU_FS = 0;
     }
-    return (uint32_t)f_result;
+    return float32_val(f_result);
 }
 
 uint32_t helper_fcmp(CPUTriCoreState *env, uint32_t r1, uint32_t r2)
@@ -304,7 +304,7 @@ uint32_t helper_itof(CPUTriCoreState *env, uint32_t arg)
     } else {
         env->FPU_FS = 0;
     }
-    return (uint32_t)f_result;
+    return float32_val(f_result);
 }
 
 uint32_t helper_ftouz(CPUTriCoreState *env, uint32_t arg)
@@ -321,7 +321,7 @@ uint32_t helper_ftouz(CPUTriCoreState *env, uint32_t arg)
         if (float32_is_any_nan(f_arg)) {
             result = 0;
         }
-    } else if (float32_lt_quiet(f_arg, 0, &env->fp_status)) {
+    } else if (float32_lt_quiet(f_arg, float32_zero, &env->fp_status)) {
         flags = float_flag_invalid;
         result = 0;
     }
-- 
2.13.6

