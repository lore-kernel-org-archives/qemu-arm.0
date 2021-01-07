Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458815lfq;
        Thu, 7 Jan 2021 09:07:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg1p+K46wdnWFKFsxk6LiO8SHbSbsOzscTNNt2s6YaN3VqpAo7z3ffiro/jIROjc3b7dXO
X-Received: by 2002:a63:cc05:: with SMTP id x5mr2761400pgf.254.1610039250251;
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039250; cv=none;
        d=google.com; s=arc-20160816;
        b=jEJXE+pWDMvV9xuU87uxMiNNXjfTZnEp8a9bmhJbz8oU1XnBGeHwabKe7BDRb1PjS3
         NCSUhim906AODjbjh4mLVH9aCJqlzEtiE4hrxxlNLGKc8Vzc62gpM2MjXz2WjOUSoPZ2
         iiYTZ9Ir4dRQ9LHSkaq4hkDlizys7xMTY4n3oduxk/ifXNbCKYiBabmlUh9Na39fq7c+
         sEdfofxe46Oux3GcKdebY3RZyyc58p+Mj4RTyUw2sk3npFLFWD8wTWe/PibqFY3ZQYij
         saLB4KYRalHM+B92azPw4kigaiPvF97XyhPj6v0A9cqVVzCJXq3fm4Xbr1QqZPtGBCcw
         1oMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T1nT969KuUYdfI3m9Q/iDSXSzl9KoeVO5a4UIV36cyg=;
        b=jX5ihQ8fJsuUZDSygu2crTHb2MJWD1HKYi6h1alWgzvQ07NGz/7LVBb+riEoZNDkDz
         VlL2GFvO3CpOkVgaJUVUwLMtsrQxq3ftKkVD4g4YO1UUuYXEcj4jHW7Tww4AhLkgN8Ye
         4QUaYDNkFuxEiSW5sSjOgxvNI/g7skQFDccG5zA+YvoJmcMBg7fXz6frNQcYL1AI2lRK
         bJ9iw902L1bZYyk0Ih1ENKICJVV7d/yVOcGljn/c24dhWwuhc/d7VIYlrdXejifETrGI
         qE6pAjgRLAs6v0mB+afBnH8WyJc31gYF6iXiqFnDIHBRVGrd9mz8PYrwPdgmTWsRtOSn
         qUJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="q6QV/diK";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id h8si6543062pgd.119.2021.01.07.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="q6QV/diK";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id D649F3F2E33F;
	Thu,  7 Jan 2021 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039247; bh=HQ2no4pmFUfdvBf2Fr5onjS6Anm6WNhxIKyNg4sErU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q6QV/diK9I+bDV+cCRonS0Dqr3ZqElKCegoM3HjGg9Nay1O7PBIThyocXEMQX2dl7
	 MPpFVmlQGb1JmvRPMF9uKdnyNHKKg5wwJMca3YgIhpfusHOcanyVQde8VqwLVdJxhc
	 MEoYJPXtKC5BsjwQgIgjt59UKHGfLr9Liu4ySwThthx8FZP5d26r018fQkH0XB71pg
	 GY+5SJWzHn5eLxE9M7w1J1C3jQURLbAfWI/KyXnYW1wf+vnhLtB/wQDHg0fV1XIuNp
	 Qd278RITnaO4AYUZYm/+DmLFBMsdOZyWBjaJSmHKA03MKZtv3AsgpdwFdiWKWUKnFf
	 AAv5r+TxQ508Q==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gq7fO4VHvDkL; Thu,  7 Jan 2021 09:07:27 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id 3F63E3F2E381;
	Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 2CFD2742D0D; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
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
Date: Thu,  7 Jan 2021 09:07:15 -0800
Message-Id: <20210107170717.2098982-8-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +PdLvEL/C8tu

These are part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20201214200713.3886611-8-keithp@keithp.com>
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
