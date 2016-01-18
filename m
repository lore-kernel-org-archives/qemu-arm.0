Received: by 10.25.159.19 with SMTP id i19csp1754706lfe;
        Sun, 17 Jan 2016 23:15:43 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr28829696qka.58.1453101343255;
        Sun, 17 Jan 2016 23:15:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si29644906qgc.16.2016.01.17.23.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL42Q-0007cj-H4
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:15:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zk-0002x4-TJ
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zj-00071s-Is
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:56 -0500
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:35183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zj-00071n-98; Mon, 18 Jan 2016 02:12:55 -0500
Received: by mail-pa0-x236.google.com with SMTP id ho8so168645230pac.2;
	Sun, 17 Jan 2016 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jyI6HZ3J6T0DeAHvaqyV6k/CCRhz0dY/B6UDCldtmo0=;
	b=0WE8eUJKCkAt1rTv+/6a8/Ku063U4r7cY5tg0uddpA03wOfK/poIppNBr32CX+JYt7
	Zpz72DHiVJx6ffoVDTKHyvbD4wDM74Q6Gl2Z4M9RMZtCfNNt2xrAVBeWoAeZPQlbC6zM
	CWpXFjkihz1FdBbEhSt753rd8SlodZHBzPVHB9rf1oD1hI1CEDDk7yFlzAC7FgXX5k2s
	mNO9cobyGZfF+EM5Rhl9/BINfjpaKgePb6xondj9PkM1d9xJnrFUcEiZp6n5w3p754j1
	Wqp320CcXsK+61ly9hTdc8gO8KnHiVuGjgSLzVs6lsAdpUr9GslPKIqSz59CfB/ibwuE
	zz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jyI6HZ3J6T0DeAHvaqyV6k/CCRhz0dY/B6UDCldtmo0=;
	b=UIwh78JMlC2dTWH8APx8Ji8s1JzmPC7Dg+sWemfTe8kNvE4LCVOc4k6OsIR4yTmBuG
	8ZxsVuW6P1xr6IijFPuV5sYkp3f2jKda8H5U940wjIAt4IAkeNIcAe1nCnr3M0qWNCxQ
	q2KCDosFXVvm8JyvjgVYXXryfSNgemQbXQuI9YefGziTXny+8SjoryB0AIH1eyj3xBqU
	BcOLYFuKfp80rMhWyVCvRRlY85KcTg68v+B9wimvkrWHRBb5vgQ7y13hn1w8Penof1NH
	4zhwHv4URlDVV0Dld1JtIEM5V5ohpkXFmUcn9sgIskJF/93DJYzsUwT5/+yPc1lD/gaV
	aHGg==
X-Gm-Message-State: ALoCoQlxccJkjZgyK6oNG4BgpOeRjXdFFefBScgbSdOzzgGHV8KMwAR0RIGpyFDYHDaWRcy786HP18CpTPz0c+Ganzp/DZxrIQ==
X-Received: by 10.66.102.73 with SMTP id fm9mr34658709pab.32.1453101174727;
	Sun, 17 Jan 2016 23:12:54 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:53 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:30 -0800
Message-Id: <dd65260edbfddabf929355be5e1f4145b12ab964.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::236
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 03/17] linux-user: arm: handle CPSR.E
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
X-TUID: axG0sN5MzDUu

From: Paolo Bonzini <pbonzini@redhat.com>

Now that CPSR.E is set correctly, prepare for when setend will be able
to change it; bswap data in and out of strex manually by comparing
SCTLR.B, CPSR.E and TARGET_WORDS_BIGENDIAN (we do not have the luxury
of using TCGMemOps).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ PC changes:
  * Remove BE32 support
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 linux-user/main.c | 50 +++++++++++++++++++++++++++++++++++++++++++-------
 target-arm/cpu.h  | 21 +++++++++++++++++++++
 2 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4f8ea9c..8348ddc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -455,6 +455,38 @@ void cpu_loop(CPUX86State *env)
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
 
@@ -614,11 +646,11 @@ static int do_strex(CPUARMState *env)
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
@@ -629,12 +661,16 @@ static int do_strex(CPUARMState *env)
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
@@ -646,11 +682,11 @@ static int do_strex(CPUARMState *env)
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
@@ -659,7 +695,7 @@ static int do_strex(CPUARMState *env)
     }
     if (size == 3) {
         val = env->regs[(env->exclusive_info >> 12) & 0xf];
-        segv = put_user_u32(val, addr + 4);
+        segv = put_user_data_u32(val, addr + 4, env);
         if (segv) {
             env->exception.vaddress = addr + 4;
             goto done;
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..f83070a 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1934,6 +1934,27 @@ static inline int fp_exception_el(CPUARMState *env)
     return 0;
 }
 
+#ifdef CONFIG_USER_ONLY
+/* get_user and put_user respectively return and expect data according
+ * to TARGET_WORDS_BIGENDIAN, but ldrex/strex emulation needs to take
+ * into account CPSR.E.
+ *
+ *            TARGET_WORDS_BIGENDIAN  CPSR.E    need swap?
+ *   LE/LE                 no           0          no
+ *   LE/BE                 no           1          yes
+ *   BE8/LE                yes          0          yes
+ *   BE8/BE                yes          1          no
+ */
+static inline bool arm_cpu_bswap_data(CPUARMState *env)
+{
+    return
+#ifdef TARGET_WORDS_BIGENDIAN
+       !
+#endif
+       !(env->uncached_cpsr & CPSR_E);
+}
+#endif
+
 static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                                         target_ulong *cs_base, int *flags)
 {
-- 
1.9.1

