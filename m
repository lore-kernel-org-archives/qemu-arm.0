Received: by 10.25.159.19 with SMTP id i19csp1755261lfe;
        Sun, 17 Jan 2016 23:17:09 -0800 (PST)
X-Received: by 10.55.31.9 with SMTP id f9mr29546531qkf.5.1453101428382;
        Sun, 17 Jan 2016 23:17:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si29536120qhb.113.2016.01.17.23.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL43n-0002H4-Mz
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:17:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL400-0003Ro-In
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zx-00077D-US
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:12 -0500
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:35229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zv-00076C-Io; Mon, 18 Jan 2016 02:13:07 -0500
Received: by mail-pa0-x22c.google.com with SMTP id ho8so168648094pac.2;
	Sun, 17 Jan 2016 23:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nZGKhYQOodwKlwRDt+ijnpQA9AuHDiwYHiZbJcgoQsY=;
	b=ChVId9FInMDg1m1N4tto/031JI9DbTDegTfJIf0QkxQYcU59GyGxlsgMkSP9rnDStH
	DP4zwnLci6R9hJnKoeNK8Hdn1fpH14rCZUCQTgZVVfWI9FHDt9vaKH4VgmJzAR9mIS+A
	3CkIdx+aX8ptw82f1wxkP/vJ6T9TvpbRzoGbUxeavxlPs8+BDhBMjPziMHIXEPMXh22O
	V1W6/rsETIKF2zY8wW6s08ROTbLysDm5pMhlFyFB7c0mw0KzTf9BppWCld4+yzRaV4vC
	BD1GFQz4v5TgYhoG1CHodwlmiqnCPvF/gszttK8GEt1DbZ6urGkkicGNBzvFi06vIGnn
	7T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nZGKhYQOodwKlwRDt+ijnpQA9AuHDiwYHiZbJcgoQsY=;
	b=dMvDsMNN7YWqcYfQbtZb6zs98c5nCPSRT2J5T1Zj4TOZsTEgQInbLw37DF/fZbhsBU
	V2cWEb1sm60JZ/nvchLsRj3zDSlngArGI3QaOeku2ZFuw5ElgR/0xcjLethYI0xfGx4H
	Je/ci2oht+k8nlaVYMpq29d2WmfjwRVUVpBf6ktyhACZ673KZy12cZkkLbUH79G7UI7y
	nvUZfuIKElE9Q7yFsd3rwgrS70dgfaIMWG7rKgPcKu68lMhxm8YHzWSzP2XHHBkA7E1S
	OooKdeZciMf+vf9bVtxKNH06irh6pNSa+0IQ57BkdUaQFMdMvz1RZEfUx71PCpy52Tbn
	Zleg==
X-Gm-Message-State: ALoCoQnbNvdKIh3l3Za3hk7s6Fsdnj4oKhvICvl4PWIRyAiOJMA45IDWpAb4CEvJOTM54SBwz+sT14bGLNE0dwUPi6WSPVT5dw==
X-Received: by 10.66.102.73 with SMTP id fm9mr34659625pab.32.1453101187038;
	Sun, 17 Jan 2016 23:13:07 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:05 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:38 -0800
Message-Id: <6e3fea4b53f28ef342d3de7a0668d8d65df9e6e8.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: peter.maydell@linaro.org, alistair.francis@xilinx.com,
	sridhar_kulk@yahoo.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 11/17] linux-user: arm: pass env to
	get_user_code_*
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RdlFSqCI7Z39

From: Paolo Bonzini <pbonzini@redhat.com>

This matches the idiom used by get_user_data_* later in the series,
and will help when bswap_code will be replaced by SCTLR.B.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 linux-user/main.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 8348ddc..2157774 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -439,17 +439,17 @@ void cpu_loop(CPUX86State *env)
 
 #ifdef TARGET_ARM
 
-#define get_user_code_u32(x, gaddr, doswap)             \
+#define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && (doswap)) {                         \
+        if (!__r && (env)->bswap_code) {                \
             (x) = bswap32(x);                           \
         }                                               \
         __r;                                            \
     })
 
-#define get_user_code_u16(x, gaddr, doswap)             \
+#define get_user_code_u16(x, gaddr, env)                \
     ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && (doswap)) {                         \
+        if (!__r && (env)->bswap_code) {                \
             (x) = bswap16(x);                           \
         }                                               \
         __r;                                            \
@@ -732,7 +732,7 @@ void cpu_loop(CPUARMState *env)
                 /* we handle the FPU emulation here, as Linux */
                 /* we get the opcode */
                 /* FIXME - what to do if get_user() fails? */
-                get_user_code_u32(opcode, env->regs[15], env->bswap_code);
+                get_user_code_u32(opcode, env->regs[15], env);
 
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
@@ -802,25 +802,23 @@ void cpu_loop(CPUARMState *env)
                 if (trapnr == EXCP_BKPT) {
                     if (env->thumb) {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u16(insn, env->regs[15], env->bswap_code);
+                        get_user_code_u16(insn, env->regs[15], env);
                         n = insn & 0xff;
                         env->regs[15] += 2;
                     } else {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u32(insn, env->regs[15], env->bswap_code);
+                        get_user_code_u32(insn, env->regs[15], env);
                         n = (insn & 0xf) | ((insn >> 4) & 0xff0);
                         env->regs[15] += 4;
                     }
                 } else {
                     if (env->thumb) {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u16(insn, env->regs[15] - 2,
-                                          env->bswap_code);
+                        get_user_code_u16(insn, env->regs[15] - 2, env);
                         n = insn & 0xff;
                     } else {
                         /* FIXME - what to do if get_user() fails? */
-                        get_user_code_u32(insn, env->regs[15] - 4,
-                                          env->bswap_code);
+                        get_user_code_u32(insn, env->regs[15] - 4, env);
                         n = insn & 0xffffff;
                     }
                 }
-- 
1.9.1

