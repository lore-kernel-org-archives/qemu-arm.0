Received: by 10.25.208.211 with SMTP id h202csp2009038lfg;
        Tue, 1 Mar 2016 22:59:22 -0800 (PST)
X-Received: by 10.140.91.225 with SMTP id z88mr30756795qgd.99.1456901962198;
        Tue, 01 Mar 2016 22:59:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si30015592qge.70.2016.03.01.22.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:59:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0kj-0001vL-NF
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:59:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iW-0006MS-JR
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iU-0003UV-L9
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:04 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:36028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iU-0003UQ-Aa; Wed, 02 Mar 2016 01:57:02 -0500
Received: by mail-pf0-x236.google.com with SMTP id l6so30962205pfl.3;
	Tue, 01 Mar 2016 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vEfI1uujKMFPy+ei7HDnvg9sLFGmMirBXsS1RvkZjrg=;
	b=wC9wBksPSlh0k27abmw/qJet7cnkxuz3krptihBVLF0XEsNKSzKQTGITnbDGbPZNAR
	baNMq7eQb6RT+RpLLyXpreCB4aBAu7RObiljMRZWDezXhA7ImzEjgumVh1b848F1evcX
	0Z9EoEW6ZQ4I7eoJAxVyM89O4SMvToB5xZ6CV5gH96FVU+kApjMex/Kl42SB6gDSu4gU
	yHjUqqIah5ktJGM2HCPmnM+Ct4tZh6ME9u41CNXQZUVuIWr6bTBlzqZ353jtitKBqQE5
	bobrSzlSAhSd4matmtqRMPy3zwkiwkbb67xxsVFviit3qbY5pbrXbnUSje2OE6haQesm
	yjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vEfI1uujKMFPy+ei7HDnvg9sLFGmMirBXsS1RvkZjrg=;
	b=UhRYTtGnT/3s/Xn0t5ylUyIarlzZsME+v/PbaQpUks+RoHxgWedIn4eIBlfzVBGE0G
	g//sa9D2LwZ561h2qVxlvOaIKLv5COWWsWk6jgibMzCNvRmQXvVyKEQ604Xog6Nk+bYd
	v1bd8xQ/k27e/5cY5124kv4ESjjkY6zm5bBXPEGXnSs7+l2sUM66AitkIifHZYW00A6e
	3D6ts0EPEYr0DhPOU53isdd3/NS+GLHvYsXFzECE+5/XVhol42A/w+9Z1yy9XEiWnpoZ
	iAQPA7+y2xYBMDYCuP/W2Gd/nyu4lB2+HgppOaZ7XB5xwhhaYLctc0PTkGvoPC0JQZP9
	QNTA==
X-Gm-Message-State: AD7BkJIwx8choFdiJD3RmUQBmD8aQFI0a6RdXVkLqm/pVgyO7nMqWv7f2KM/2z/ZKvzbxA==
X-Received: by 10.98.17.75 with SMTP id z72mr36416585pfi.16.1456901821506;
	Tue, 01 Mar 2016 22:57:01 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:00 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:11 -0800
Message-Id: <7aa451b4cadc8d4d5a342feb6011920bfc251aaa.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::236
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 07/18] linux-user: arm: handle CPSR.E
	correctly in strex emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ArSIkc44Hkw8

From: Paolo Bonzini <pbonzini@redhat.com>

Now that CPSR.E is set correctly, prepare for when setend will be able
to change it; bswap data in and out of strex manually by comparing
SCTLR.B, CPSR.E and TARGET_WORDS_BIGENDIAN (we do not have the luxury
of using TCGMemOps).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
  * Moved SCTLR/CPSR logic to arm_cpu_data_is_big_endian
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
Removed SCTLR logic from bwap_data()

 linux-user/main.c | 50 +++++++++++++++++++++++++++++++++++++++++++-------
 target-arm/cpu.h  | 11 +++++++++++
 2 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 510b3b7..2b1e755 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -451,6 +451,38 @@ void cpu_loop(CPUX86State *env)
         __r;                                            \
     })
 
+#define get_user_data_u32(x, gaddr, env)                \
+    ({ abi_long __r = get_user_u32((x), (gaddr));       \
+        if (!__r && arm_cpu_bswap_data(env)) {          \
+            (x) = bswap32(x);                           \
+        }                                               \
+        __r;                                            \
+    })
+
+#define get_user_data_u16(x, gaddr, env)                \
+    ({ abi_long __r = get_user_u16((x), (gaddr));       \
+        if (!__r && arm_cpu_bswap_data(env)) {          \
+            (x) = bswap16(x);                           \
+        }                                               \
+        __r;                                            \
+    })
+
+#define put_user_data_u32(x, gaddr, env)                \
+    ({ typeof(x) __x = (x);                             \
+        if (arm_cpu_bswap_data(env)) {                  \
+            __x = bswap32(__x);                         \
+        }                                               \
+        put_user_u32(__x, (gaddr));                     \
+    })
+
+#define put_user_data_u16(x, gaddr, env)                \
+    ({ typeof(x) __x = (x);                             \
+        if (arm_cpu_bswap_data(env)) {                  \
+            __x = bswap16(__x);                         \
+        }                                               \
+        put_user_u16(__x, (gaddr));                     \
+    })
+
 #ifdef TARGET_ABI32
 /* Commpage handling -- there is no commpage for AArch64 */
 
@@ -610,11 +642,11 @@ static int do_strex(CPUARMState *env)
         segv = get_user_u8(val, addr);
         break;
     case 1:
-        segv = get_user_u16(val, addr);
+        segv = get_user_data_u16(val, addr, env);
         break;
     case 2:
     case 3:
-        segv = get_user_u32(val, addr);
+        segv = get_user_data_u32(val, addr, env);
         break;
     default:
         abort();
@@ -625,12 +657,16 @@ static int do_strex(CPUARMState *env)
     }
     if (size == 3) {
         uint32_t valhi;
-        segv = get_user_u32(valhi, addr + 4);
+        segv = get_user_data_u32(valhi, addr + 4, env);
         if (segv) {
             env->exception.vaddress = addr + 4;
             goto done;
         }
-        val = deposit64(val, 32, 32, valhi);
+        if (arm_cpu_bswap_data(env)) {
+            val = deposit64((uint64_t)valhi, 32, 32, val);
+        } else {
+            val = deposit64(val, 32, 32, valhi);
+        }
     }
     if (val != env->exclusive_val) {
         goto fail;
@@ -642,11 +678,11 @@ static int do_strex(CPUARMState *env)
         segv = put_user_u8(val, addr);
         break;
     case 1:
-        segv = put_user_u16(val, addr);
+        segv = put_user_data_u16(val, addr, env);
         break;
     case 2:
     case 3:
-        segv = put_user_u32(val, addr);
+        segv = put_user_data_u32(val, addr, env);
         break;
     }
     if (segv) {
@@ -655,7 +691,7 @@ static int do_strex(CPUARMState *env)
     }
     if (size == 3) {
         val = env->regs[(env->exclusive_info >> 12) & 0xf];
-        segv = put_user_u32(val, addr + 4);
+        segv = put_user_data_u32(val, addr + 4, env);
         if (segv) {
             env->exception.vaddress = addr + 4;
             goto done;
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ab0ea92..cbf171c 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -2102,6 +2102,17 @@ static inline int fp_exception_el(CPUARMState *env)
     return 0;
 }
 
+#ifdef CONFIG_USER_ONLY
+static inline bool arm_cpu_bswap_data(CPUARMState *env)
+{
+    return
+#ifdef TARGET_WORDS_BIGENDIAN
+       1 ^
+#endif
+       arm_cpu_data_is_big_endian(env);
+}
+#endif
+
 static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                                         target_ulong *cs_base, int *flags)
 {
-- 
1.9.1

