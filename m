Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5572188wrp;
        Tue, 10 Sep 2019 07:48:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJrjMIGG9OgcNTt6CGUaXTkzKyH+K+DyCzKt2s0ROa3o3xDtkoURFHHtCTJZaWcQyx6ON6
X-Received: by 2002:a50:f04e:: with SMTP id u14mr31151001edl.247.1568126921087;
        Tue, 10 Sep 2019 07:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568126921; cv=none;
        d=google.com; s=arc-20160816;
        b=03zcCS35VWBYoWsuQckm0hlNXgAeTIkQhOMizhYSAgs7vIyXjwhE+1nGcJhIrpCFKB
         Q+/ExSIHYx06fPZw+7CSXCiklW9iiViWr2/gY9Y2B/N3q3ErHgF5h5SiuF0UqgRQnQNP
         G/vF1+R18e6pyMfuWpRo/CLALRQnDilF2o2/KSPcVwCGPoAi/jTj8S0zpFisSGjOv0If
         SfsT5TrJn0VycKWpt/EwyWCkY612FOhY+EPy2msK/rla90DjXWWeNpYwvlDubxL11Xgj
         ZoiqgfCUAmndi5/4XKgn+V9g1uz800gwZIhVloe7qAva7JE5aeGCtB2iz9KvXmJVkfOX
         xC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YWOXDYdgItfE8+407vkIvvnaRwn01B+C3RlPpmYpG/U=;
        b=dGWhBeHrk1WfU5nyX43sT/boizYxU+1c6NqwWGUHb9rX2DZumhzTPPQj/Va0RMx2Ua
         YclrUWDzy/5BgwjAhnCxoiN1QgYOEo5oSD75Gb8RR7vjqxQxzSkKmmw1oVUb5qkfXTp7
         LGr+6bxiQUhgJk48X42DvlJ1OaczP6MA8k6XCB9LE2gSPcNtP+nv780LAWO3xo/sVM+t
         M1RHilfJGM4nenKug5d9eUycG5F4Bj+LbMHg0qO+z//Zx2+gc6QX/HDhMNgdUGavtswi
         dJ7MXPXJ4tB+mK5AgYtsPhaQxv8WxIms5AyWer4gxH0ojOIYMGWi/rWS1DpvfTaCVOcu
         /OcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CPOae9hg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si8398503edb.154.2019.09.10.07.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CPOae9hg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hRe-0007t3-Oo
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNo-0005Sx-8E
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNm-00051D-Rc
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:39 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNm-00050t-Lt
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:38 -0400
Received: by mail-wr1-x444.google.com with SMTP id w13so20818660wru.7
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YWOXDYdgItfE8+407vkIvvnaRwn01B+C3RlPpmYpG/U=;
 b=CPOae9hgzuSC0OuDGe9BwP3BNIZQOP1fwo3SjCfxBWaL621js/y1AppTZuhJF3YbXx
 TEQZHopJll6otD2jmKBXQ6+eldWQm2EOTurJXMwBt9IPolSIWRkthFi6Q6m25paKoNfI
 M+yvPrZXHR8w5y69dXowBN/1N22jRoAM61LgnZClKts3ccSs+x+hpFUJM+7wUiHUzWtN
 tG56sqp6K7DNFTHkrgKnQhZV/Z848IvOOQZe6ENchdYbKhzLdNeGGQP9NHQacBaeIddc
 V0XIDgJa7uBgT+7HH1etQGK45TbEws3VGphBaZ63UTv1Wm21qXQ0rcWZFw2nZJsTp1ub
 M39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWOXDYdgItfE8+407vkIvvnaRwn01B+C3RlPpmYpG/U=;
 b=uOtIsAqxKp/97xw4fttffkhPwZq5lH7EfVgkS5f/vWigjFnqehgqQoI1CmJtzbuQjl
 bs+3vj3VFvtyCE4+IFAQAU6szpAXCjDg2ui2oz3LmpTlQQTYz6aIvopCiqUlzYaBNYIH
 qwbj4VuuzYkpIgg6TuZiOczENut7nfZld6MJmaNQ1MZoT4JjMCvguEq4pbl3ElNHSFjQ
 7K7c7ZOJCERnlBZJZfFJ7lO5PGQHmN19VaL3v9pEN+6JS/KLlrmxNbU5KDquNIfjjXg7
 UiI5BEbLDL6dJLq1rqchtbSoG2MTbuA2j0TzPtIbNoIFEPK5002wSk+Mo6ezSdH1fhtD
 /JYw==
X-Gm-Message-State: APjAAAVVwkO1aQCSyxlvqG5fA9pp6ze9W81cNTgYOpjQ+/+4K4oU8Tb3
 mQhPGYSsnse8tX54VUusQpKnUg==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr9677544wrv.215.1568126677826; 
 Tue, 10 Sep 2019 07:44:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:21 +0100
Message-Id: <20190910144428.32597-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 06/13] target/arm/arm-semi: Factor out
 implementation of SYS_WRITE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y2HaLR16u9y0

Factor out the implementation of SYS_WRITE via the
new function tables.

The #ifdef around the declaration/initialization of the
local 'env' variable is unfortunate but necessary, because
the softmmu-semi.h version of lock_user implicitly uses 'env',
but the user-only version doesn't need it. Without the ifdefs
we'd get a warning about the unused variable for the user-only
compilation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 53 ++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index f3e0bf77cd3..0dec4c04e2f 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -345,27 +345,61 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
  * setting the guest errno if appropriate.
  */
 typedef uint32_t sys_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len);
 
 static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return set_swi_errno(ts, close(gf->hostfd));
 }
 
+static uint32_t host_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                             target_ulong buf, uint32_t len)
+{
+    uint32_t ret;
+#ifndef CONFIG_USER_ONLY
+    CPUARMState *env = &cpu->env;
+#endif
+    char *s = lock_user(VERIFY_READ, buf, len, 1);
+    if (!s) {
+        /* Return bytes not written on error */
+        return len;
+    }
+    ret = set_swi_errno(ts, write(gf->hostfd, s, len));
+    unlock_user(s, buf, 0);
+    if (ret == (uint32_t)-1) {
+        ret = 0;
+    }
+    /* Return bytes not written */
+    return len - ret;
+}
+
 static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
 }
 
+static uint32_t gdb_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                            target_ulong buf, uint32_t len)
+{
+    arm_semi_syscall_len = len;
+    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
+                           gf->hostfd, buf, len);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
+    sys_writefn *writefn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
         .closefn = host_closefn,
+        .writefn = host_writefn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
+        .writefn = gdb_writefn,
     },
 };
 
@@ -504,24 +538,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            arm_semi_syscall_len = len;
-            return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
-                                   gf->hostfd, arg1, len);
-        } else {
-            s = lock_user(VERIFY_READ, arg1, len, 1);
-            if (!s) {
-                /* Return bytes not written on error */
-                return len;
-            }
-            ret = set_swi_errno(ts, write(gf->hostfd, s, len));
-            unlock_user(s, arg1, 0);
-            if (ret == (uint32_t)-1) {
-                ret = 0;
-            }
-            /* Return bytes not written */
-            return len - ret;
-        }
+        return guestfd_fns[gf->type].writefn(ts, cpu, gf, arg1, len);
     case TARGET_SYS_READ:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1

