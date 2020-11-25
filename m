Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864836lfb;
        Wed, 25 Nov 2020 13:36:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBgNRfe9aWIziihV7WHj6URZnN2trHUAfYLVUFWY1TEzcE1/2N3kof65uvUdHLiQT6M1yu
X-Received: by 2002:a17:90b:e0a:: with SMTP id ge10mr6559923pjb.211.1606340195771;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340195; cv=none;
        d=google.com; s=arc-20160816;
        b=cMOq7yv40Vdm8hBo8sf1QPqgCUK7KcgvZuXwbFDdCZefz/HprxLLA4XRnA6BpH5xI5
         nCv3K8UC2pC0jA8cmdk2Ir0hWRX1YGpkgXJV2q0da3Moo665hBIlH8M/DBhAVOzogeOX
         6NKntfA/CNLVYegYRI++LyGDkTjl0zcU2Sdg+zVGRyCZ+RDzDRbQwvo0vS/GsV5ETKw3
         R6sMUbGE8j9zzmPK6p+Ado/+NuqsZpI5Qmy33BsxK08dBOphmJmdzZzAdSCIsSRZgsDH
         e4Z9tMQTLlHjhZrntiRfmkeq+V3C8/eMaMc6Xf/992N7edok9ol6MjExfN3/0bPLLcER
         +zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Cayx0LMpRbGoW11vUGACsJCxYxfI6jR9yWeom47DT7w=;
        b=dw4yn0b9of5TGNtkdVK/94Ib/IYTXvQUkk8OwwTuHHYcvIAvvz1cLZXiiny/UZQoo0
         /LVbmZkpUW3z4cuAjITjItElRzLOCeMPKWPsZjW5wEwNPBOplkijmnWxsOoWfGuiHMBY
         cMf+7KF4zKS1F0fwNzrVrUs72qgJT+5xAZa+PvuX4pD+enelb5T3dyaQfI0YenmIZjXZ
         sofO5FydIs29dpeTjdCQtA3mJy6ujJ+W2G52TyHhYMyK8IQ5gcDttvm/hQaQ2mi9h/mu
         4ygWPS2k5QTy/ZRvFxI0A3t13yvjzu4EEk2Fbdwcue86vTlvCkwVDEaOZDmMuR224apS
         HJVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ooRBkaYO;
       dkim=pass header.i=@keithp.com header.s=mail header.b="Pb/e9FqA";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id k14si3059726pgt.384.2020.11.25.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ooRBkaYO;
       dkim=pass header.i=@keithp.com header.s=mail header.b="Pb/e9FqA";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 165343F2E28B;
	Wed, 25 Nov 2020 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340194; bh=Cw84Eb20GftlPfR2b4GGp2hGK6fNq0OdbxjdyxpyqIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooRBkaYO9o8cYqWlVPe7zarLUNe/qPPBr9F9qol7Z9CZEJf/Jd/5IDmi40qZsxPQT
	 8Xc/eWdzqxQTF30byqcQ1Rj0VnQXex3xImTYQmMStdfIhJntiE2UT9EJjAFRhCdHda
	 vBzt/MBRqlPpkTX7OCFm71wDXEl0XHHx+8qkxv6dok/xuzrwLOOHeYLFOznvbnQOa/
	 2b8ElsS774lbT4pvmXSTa0/EDxKBytYwtZZqG0dtIufFzX8onnqblqYVpiXRJbAaMf
	 Qb+736Q3Pbs8rpvmbb/RK7GsbLPEUtqJHR3qRFKchg30dhs3RWg5jGagsnUCkIN6+o
	 y46nw3LuLtJIA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9-WVyI-M0toE; Wed, 25 Nov 2020 13:36:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id D16493F2E28D;
	Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340191; bh=Cw84Eb20GftlPfR2b4GGp2hGK6fNq0OdbxjdyxpyqIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pb/e9FqAYFnbrb+spiZKTq66SzJZiP3ORQEPM1Le4kR4VD+JqkgVuoONdJUeG4c5O
	 t2eFVVjMFC5EAoz3PEaSmwgkIfUrrbWLmBKn6uZjTrnWBCHM/814KmTiNOAFmmiDYc
	 HFnPncBgfus8dAF61TOKmEiVOYJ+0LTEt3cvouMTaw+oSuPcY3uy8xD9EZG9U8jIYS
	 2nR9zl7pDX3ECSKEafWCdtAx3/TpByY4LRGqwA/mGKo82CSCrNmMRWbWsQWST60zmu
	 KF7OjtIcMwsqL85BAYxzjyvupwUaySVoexjbsTV15Njb3MG2xbVWgTanaGK77tBzVy
	 PV9Nhi7f3dYxw==
Received: by keithp.com (Postfix, from userid 1000)
	id A9DE215821C6; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
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
Subject: [PATCH 6/8] semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
Date: Wed, 25 Nov 2020 13:36:15 -0800
Message-Id: <20201125213617.2496935-7-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QEcR3Tv9SeRV

These are part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 16 ++++++++++++++++
 include/qemu/timer.h         |  2 ++
 util/qemu-timer-common.c     |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 2b6a3fd9fd..c84b0d906b 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -38,6 +38,7 @@
 #include "hw/semihosting/console.h"
 #include "hw/semihosting/common-semi.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -69,6 +70,8 @@
 #define TARGET_SYS_EXIT        0x18
 #define TARGET_SYS_SYNCCACHE   0x19
 #define TARGET_SYS_EXIT_EXTENDED 0x20
+#define TARGET_SYS_ELAPSED     0x30
+#define TARGET_SYS_TICKFREQ    0x31
 
 /* ADP_Stopped_ApplicationExit is used for exit(0),
  * anything else is implemented as exit(1) */
@@ -832,6 +835,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     uint32_t ret;
     uint32_t len;
     GuestFD *gf;
+    int64_t elapsed;
 
     (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -1241,6 +1245,18 @@ target_ulong do_common_semihosting(CPUState *cs)
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
