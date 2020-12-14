Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877509lfq;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1R2iDI/uagTi57gP1R8Bbghrx57kbjW48kxN442UtTBjlh4hxW6Ag5WLOYPG2aUHvctpa
X-Received: by 2002:aa7:9f0f:0:b029:19b:c68f:61cd with SMTP id g15-20020aa79f0f0000b029019bc68f61cdmr19232713pfr.45.1607976442016;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976442; cv=none;
        d=google.com; s=arc-20160816;
        b=fD+p4yGKtBnLi9+482yv8DY00nSMdKZ6JoG1LMn+3OFu26VPEH7oxh6Mu0Uz1cqYfA
         2tZ3/9/0pYpAKYL1EtsMSLre1R5uo9Tbw8i51BfRGN2Qy82FBtu6boJpUezMMcqHJs9A
         0BhdiRZkhrqwUNZ0852WWO1SIu5U+GTdBa/Lf7djO0ZsgmBI+J/shd4cdhniHnddLVac
         Yr75q/rO3Ndg9z+9v1IwFfX0M+y18OiwkmQFur2r6QKFHOLF+Ylz6QN1klwI28Ix8k5q
         /C2TcZld32F4XCEAt6AK1B6ndY+7SbdVmuxdW14pzZzguZEfWoS1WiVs5IHYFpP7jP00
         Iq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QJp82fJyHE1Gre3UwZcMoAj5kMmKZQ6nbF8e1W+WZWQ=;
        b=k3x6qaW1yg4ahEjvygx2lDQUidYdCTS3mQOJDUYo/TA8y7Q3SoangEqvtSP0566Qxi
         IwCKmlcgTeX0XWVIq5HBDJd6cRXdWJLqfLWO/0LdWd7bbMWawT0sTiCPhQWDwWMGuR3X
         bkqaVmJRa0tVgcfv2KXJ8fbCCKwfjMJdOFtrBtm3oLnFW4KRhnImR6uwaegiK02/0nHg
         uvRY0j/1Cp0pJ115RLFq4htzCcP5CUX0H3H8qQQqoLIEKpjySz33eM+LnkcJaK6trFQM
         Clazr/U7UuEwzhGpujzMSJoscDSXVfLXA3lYrL/XPGMO2uNL1JtB4ETep83BmDiMYwOJ
         MEjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=AiNFmKDX;
       dkim=pass header.i=@keithp.com header.s=mail header.b=kX0aD8NE;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id a4si17238199plm.126.2020.12.14.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:21 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=AiNFmKDX;
       dkim=pass header.i=@keithp.com header.s=mail header.b=kX0aD8NE;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 70D5A3F2E379;
	Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976440; bh=hQi7XNjThMLl/udTyFPvqRIZNTAapk1ep38UsAcUgpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AiNFmKDXy+2EReHVKgyGFXDfEAfC2J0Kc8gAnr+HOhZpZqZBLxY7OkdbNfpzOi/Yy
	 oBkMFXwWjGIwefR0MpOdyb01amqNN/0pZYsH+iFOEKXV9MG2zRnud8zHj2YistQuWC
	 TshnwKaOFKOpn/dfS7ON/kL72ypcn5nUivjWxk1I3DxK51Y5p403Kz/ygmwSqtd20u
	 3RFmWWYdB7bXz36QVhKZXSnX9m0DKy+MHqK7S1XqSYk5JsffgdJwdmVelCMmuSOh7c
	 KbXDKZRqIOWJc8jK83AwnZNVHBmQTl7V1p8DwC9TlK2lofkjoWmN6/gEjIG2YKzz8d
	 ZWnOgOMaN2s7Q==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L4_QGprx9P5J; Mon, 14 Dec 2020 12:07:20 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id BC7EC3F2E37D;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=hQi7XNjThMLl/udTyFPvqRIZNTAapk1ep38UsAcUgpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kX0aD8NEdURO+6Mrpfe1Qv2/XSx6SMl4OMPu9dvz1P8vXXU9UhvjUM/4H7E8sPQ6O
	 L+AKZHCrdKdnU81ZdrqCBjfq8CoHhMdurG0+9j3ogN6MsYYfjajVxdOfbk0SB7rnmu
	 4j9yg240nYq8LCXszUoBDOVlwozDzInVFZyg6WJ7Hsul5jaRpAmNumPZpb20ifF0Z/
	 K9jKLLnTpF1lwHHVwNTuATHqeYjSXn5YxcQFlFr/mLC/apC38yTQ2aroiB48XB2gs2
	 IUQqbbGDer3+9MUn4FtX27I38R6pEK8PIcDB0L1z0sauV+KqLD+gWLqipP1IUo1UIm
	 FPygFfyZkU//g==
Received: by keithp.com (Postfix, from userid 1000)
	id 552321582258; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 7/9] semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
Date: Mon, 14 Dec 2020 12:07:11 -0800
Message-Id: <20201214200713.3886611-8-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AlmrzksrgHgM

These are part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 16 ++++++++++++++++
 include/qemu/timer.h         |  2 ++
 util/qemu-timer-common.c     |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index f0cf5f10f5..b1368d945c 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -38,6 +38,7 @@
 #include "hw/semihosting/console.h"
 #include "hw/semihosting/common-semi.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -73,6 +74,8 @@
 #define TARGET_SYS_EXIT        0x18
 #define TARGET_SYS_SYNCCACHE   0x19
 #define TARGET_SYS_EXIT_EXTENDED 0x20
+#define TARGET_SYS_ELAPSED     0x30
+#define TARGET_SYS_TICKFREQ    0x31
 
 /* ADP_Stopped_ApplicationExit is used for exit(0),
  * anything else is implemented as exit(1) */
@@ -837,6 +840,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     uint32_t ret;
     uint32_t len;
     GuestFD *gf;
+    int64_t elapsed;
 
     (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -1246,6 +1250,18 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
         gdb_exit(cs->env_ptr, ret);
         exit(ret);
+    case TARGET_SYS_ELAPSED:
+        elapsed = get_clock() - clock_start;
+        if (sizeof(target_ulong) == 8) {
+            SET_ARG(0, elapsed);
+        } else {
+            SET_ARG(0, (uint32_t) elapsed);
+            SET_ARG(1, (uint32_t) (elapsed >> 32));
+        }
+        return 0;
+    case TARGET_SYS_TICKFREQ:
+        /* qemu always uses nsec */
+        return 1000000000;
     case TARGET_SYS_SYNCCACHE:
         /*
          * Clean the D-cache and invalidate the I-cache for the specified
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index bdecc5b41f..ca6fae51f1 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -806,6 +806,8 @@ static inline int64_t get_clock_realtime(void)
     return tv.tv_sec * 1000000000LL + (tv.tv_usec * 1000);
 }
 
+extern int64_t clock_start;
+
 /* Warning: don't insert tracepoints into these functions, they are
    also used by simpletrace backend and tracepoints would cause
    an infinite recursion! */
diff --git a/util/qemu-timer-common.c b/util/qemu-timer-common.c
index baf3317f74..cc1326f726 100644
--- a/util/qemu-timer-common.c
+++ b/util/qemu-timer-common.c
@@ -27,6 +27,8 @@
 /***********************************************************/
 /* real time host monotonic timer */
 
+int64_t clock_start;
+
 #ifdef _WIN32
 
 int64_t clock_freq;
@@ -41,6 +43,7 @@ static void __attribute__((constructor)) init_get_clock(void)
         exit(1);
     }
     clock_freq = freq.QuadPart;
+    clock_start = get_clock();
 }
 
 #else
@@ -55,5 +58,6 @@ static void __attribute__((constructor)) init_get_clock(void)
     if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0) {
         use_rt_clock = 1;
     }
+    clock_start = get_clock();
 }
 #endif
-- 
2.29.2
