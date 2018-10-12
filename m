Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp896174wrt;
        Fri, 12 Oct 2018 07:43:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62NvAUN19WAy1sOVV1wjLNjRogMwGef2BGQWVFz0n3PjlIqDGn24as2sD4HXkF+2y3pnlz3
X-Received: by 2002:aed:31a3:: with SMTP id 32-v6mr5880845qth.191.1539355383025;
        Fri, 12 Oct 2018 07:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355383; cv=none;
        d=google.com; s=arc-20160816;
        b=YHD4H1eR3YJou5QLgYXoocPX28zS4Dc9pXEZ3t4I4jrF+EQFQZPzmf72c0pf2EXrR2
         Wdyx3QMRSfVeHTnM3Pdc6vkyv0e/dHNNxWkBHtFUk99+T4gpVkPNrSDwnfESikl4gnV3
         Mh3NmpPcjPpOexEG/lb7LQda6p0lwb0ok4I7M1khUMFphiDhox2jOlSEHc7SlFYdVx31
         2pTaWJQR21lMsQG4QLqIeBrDBbzat9r16d7To09L+dE+7tyCLSo9EeLp41oyRwdYbtUy
         NmylSIwUd29z7FRKIjeEIb6/VmRYro2DqUW/1fDxGZGtnyl/FyBW9vDpL2Bcj78EHeFX
         QxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5NELGqkVegsuFLiL+w9oa4KbdKG/pxd6jjvzB2xcjf8=;
        b=d/J0XXu1ziITyOCY6mgdJZU9TlT59FnhJQAujRlA2rk1gcCDyDbA9vwEWVlnH8qTXc
         JDodkhnBr9k4zARmTswCeBkoYfAyMvQVTkUd5K/Ol9h6vQZiyehO48aS8G8k3L4SHl40
         o9zFmAy1F7LivC6UBAmWuG111Z7zMkpXdbKR53mhbdOJFl0w0RO6k4msx3z2SXPzKTw7
         5usbIzWyg00lJw/ngmVqLIhXgRIUkpioanxm2FEyfeIKqxtHuz3RZY4kl6w1JcP/WNZS
         5Ny9CQjPEALTyHKqmEf/s8w/0LyWGkSQvk4kKLCoDOWGS3GWT44R3vWNoFG6oBpwrwNm
         hMqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o43-v6si1250397qtb.200.2018.10.12.07.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyeb-0007yx-Sa
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:43:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeJ-0007xF-2n
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeI-0002nf-9a
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeI-0002ix-1r; Fri, 12 Oct 2018 10:42:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeG-0000O3-FA; Fri, 12 Oct 2018 15:42:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:27 +0100
Message-Id: <20181012144235.19646-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/10] target/arm: Make switch_mode() file-local
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zXWYG2DqK4g

The switch_mode() function is defined in target/arm/helper.c and used
only in that file and nowhere else, so we can make it file-local
rather than global.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 1 -
 target/arm/helper.c    | 6 ++++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index abe4d73b59c..d4b1973efa1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -145,7 +145,6 @@ static inline int bank_number(int mode)
     g_assert_not_reached();
 }
 
-void switch_mode(CPUARMState *, int);
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0fa5ac0450f..0253a971099 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -56,6 +56,8 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
                                 V8M_SAttributes *sattrs);
 #endif
 
+static void switch_mode(CPUARMState *env, int mode);
+
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     int nregs;
@@ -6313,7 +6315,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return 0;
 }
 
-void switch_mode(CPUARMState *env, int mode)
+static void switch_mode(CPUARMState *env, int mode)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
 
@@ -6335,7 +6337,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
 #else
 
-void switch_mode(CPUARMState *env, int mode)
+static void switch_mode(CPUARMState *env, int mode)
 {
     int old_mode;
     int i;
-- 
2.19.0

