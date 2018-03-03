Received: by 10.28.91.67 with SMTP id p64csp729891wmb;
        Sat, 3 Mar 2018 06:42:11 -0800 (PST)
X-Google-Smtp-Source: AG47ELsQdrkXlni1JZPVDvcaP9gx5MG0MY2nXFKSQ8vDOw6boDPSGRd1osltg+xI6u7pgWkOHiyp
X-Received: by 2002:a25:910c:: with SMTP id v12-v6mr5799628ybl.2.1520088131312;
        Sat, 03 Mar 2018 06:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520088131; cv=none;
        d=google.com; s=arc-20160816;
        b=tM10s5AP0E4x8EldbVZ2miEOwSGz6UNoOHOl/7+hTgJUrNReQ0ojX6UbkeCiLvitmR
         lBQmKJTbMLPGI9gWINXXwXEogDKFtSSYceuknXcRq6vH/6/oRns65JYRKJwPMYZhfGXM
         jYCAlBWHwZaL4XGyhkDWXns6WNPDm2ntOqD0vG0S6THquodqXGT9MCVlcU3uAA7bjq6n
         8hSIfmsc+RAuvhMmZPG0GghZ8s1sz3W2X41kZ3nJP60lt0nE9l5L4tRGXsDkNVExJuO2
         MQsRgZkdxWlbU3IGaoX7zi9siD30/e6MxcQOweD9XKjOOf+tkL3XESFb6VMQ57ud+KkE
         TZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TzbfQHhRuCXJGiOFy0Tfsa3XjAPdBD+AVNn/qejvqyY=;
        b=Lxxa18ZY4HNXsl71hHW5qV7CQlO8JC5amTyaLft7AS4Ef8nO59bQiyK0ZGkasvzSL8
         W+d5h9UvQVWDVpsouR8wGKzKMn6r57pT7S3ndYhrNM3TkbaAOG74F7sQC80TPrmnAKWA
         HsnK3Y7k63bNNrqtrvat4LJYr+zKYr74BARJt80WLmQHqNK/8wg79JB4O9shzo1SkNXZ
         Ko0lvLWD2jW2FmKfLRw5GopJBUYlajIg6CXJkT8+gUwO7JlS0deGH+7Ny2glVn/yN4KY
         t+tja78kEImeQv0cLGbQn2cUuLXkUnXNBmOZubVtvQO6vk4R4h1HzZjDkoRByxWvvuS1
         wZUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hx6NL43f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7si1166924ywb.516.2018.03.03.06.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:42:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hx6NL43f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8MU-0000oO-P9
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:42:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8J0-00067o-WF
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8J0-0003wi-2C
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:35 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:42211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8Iz-0003wM-PL
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 09:38:34 -0500
Received: by mail-wr0-x244.google.com with SMTP id k9so12843266wre.9
	for <qemu-arm@nongnu.org>; Sat, 03 Mar 2018 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TzbfQHhRuCXJGiOFy0Tfsa3XjAPdBD+AVNn/qejvqyY=;
	b=hx6NL43fVhtQWG7PX5fjtXNseFHPToq0LApuS5efWPyMEQsUTX9oeMovpNrtx0HAdG
	nlJT/bOrlkTgKsax5mqQBtXPMQy5bsmiPGLajkKBFaUGDlQTLNrRYKTMCjeM4yBZP6m5
	VgxHazsxc1OiwSQgm3VL3K8rPkdxkDKTQXqhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TzbfQHhRuCXJGiOFy0Tfsa3XjAPdBD+AVNn/qejvqyY=;
	b=KGcV61M9hlVPryplPTKJlaGUBv7vLUpqstch7KoJdx92Chb2c3xwWjhBujx7jlB/SJ
	OI0PVyCcak0tc48bniT7WRlLJNbTo7KuF9pzbEzVRNo0KM/WRP8ZUUMIZ1iJWCF4HzQ0
	pRwt49DTVYY4kzYAb8y/ETbaS9tpkMoIR1vndPrsJhCdZ6xDq7DFxm3PImJi5RFL6O4e
	+fC3TfK9D53n1B/DbgeF0M2kWiunkjTepyphMtI0Sju5QqJXRMqvBGis39LphAkFQypE
	aQSTB+a8gMf/4+V3ARYQcLTBqnj+s+1z+sINNaPDErDc8cJ2LlWBY9dQsyfK0Fke2jxM
	vNbg==
X-Gm-Message-State: APf1xPBk8T+u+e4jO5ENH9vK/f1w4LnTva1MHXNmWXia/ulzGYtHAw76
	Dt5HeSYQs0xNhyf8cSsZMoMVVQ==
X-Received: by 10.223.195.147 with SMTP id p19mr8203044wrf.224.1520087912713; 
	Sat, 03 Mar 2018 06:38:32 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:22 +0000
Message-Id: <20180303143823.27055-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-arm] [PATCH v4 4/5] aarch64-linux-user: Add support for EXTRA
 signal frame records
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VMtacLnZ5MEP

The EXTRA record allows for additional space to be allocated
beyon what is currently reserved.  Add code to emit and read
this record type.

Nothing uses extra space yet.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 74 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index f9eef3d753..c31cf0601d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1443,6 +1443,15 @@ struct target_fpsimd_context {
     uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
 };
 
+#define TARGET_EXTRA_MAGIC  0x45585401
+
+struct target_extra_context {
+    struct target_aarch64_ctx head;
+    uint64_t datap; /* 16-byte aligned pointer to extra space cast to __u64 */
+    uint32_t size; /* size in bytes of the extra space */
+    uint32_t reserved[3];
+};
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -1502,6 +1511,15 @@ static void target_setup_fpsimd_record(struct target_fpsimd_context *fpsimd,
     }
 }
 
+static void target_setup_extra_record(struct target_extra_context *extra,
+                                      uint64_t datap, uint32_t extra_size)
+{
+    __put_user(TARGET_EXTRA_MAGIC, &extra->head.magic);
+    __put_user(sizeof(struct target_extra_context), &extra->head.size);
+    __put_user(datap, &extra->datap);
+    __put_user(extra_size, &extra->size);
+}
+
 static void target_setup_end_record(struct target_aarch64_ctx *end)
 {
     __put_user(0, &end->magic);
@@ -1554,48 +1572,74 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 static int target_restore_sigframe(CPUARMState *env,
                                    struct target_rt_sigframe *sf)
 {
-    struct target_aarch64_ctx *ctx;
+    struct target_aarch64_ctx *ctx, *extra = NULL;
     struct target_fpsimd_context *fpsimd = NULL;
+    uint64_t extra_datap = 0;
+    bool used_extra = false;
+    bool err = false;
 
     target_restore_general_frame(env, sf);
 
     ctx = (struct target_aarch64_ctx *)sf->uc.tuc_mcontext.__reserved;
     while (ctx) {
-        uint32_t magic, size;
+        uint32_t magic, size, extra_size;
 
         __get_user(magic, &ctx->magic);
         __get_user(size, &ctx->size);
         switch (magic) {
         case 0:
             if (size != 0) {
-                return 1;
+                err = true;
+                goto exit;
+            }
+            if (used_extra) {
+                ctx = NULL;
+            } else {
+                ctx = extra;
+                used_extra = true;
             }
-            ctx = NULL;
             continue;
 
         case TARGET_FPSIMD_MAGIC:
             if (fpsimd || size != sizeof(struct target_fpsimd_context)) {
-                return 1;
+                err = true;
+                goto exit;
             }
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
 
+        case TARGET_EXTRA_MAGIC:
+            if (extra || size != sizeof(struct target_extra_context)) {
+                err = true;
+                goto exit;
+            }
+            __get_user(extra_datap,
+                       &((struct target_extra_context *)ctx)->datap);
+            __get_user(extra_size,
+                       &((struct target_extra_context *)ctx)->size);
+            extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            break;
+
         default:
             /* Unknown record -- we certainly didn't generate it.
              * Did we in fact get out of sync?
              */
-            return 1;
+            err = true;
+            goto exit;
         }
         ctx = (void *)ctx + size;
     }
 
     /* Require FPSIMD always.  */
-    if (!fpsimd) {
-        return 1;
+    if (fpsimd) {
+        target_restore_fpsimd_record(env, fpsimd);
+    } else {
+        err = true;
     }
-    target_restore_fpsimd_record(env, fpsimd);
 
-    return 0;
+ exit:
+    unlock_user(extra, extra_datap, 0);
+    return err;
 }
 
 static abi_ulong get_sigframe(struct target_sigaction *ka, CPUARMState *env)
@@ -1621,7 +1665,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                CPUARMState *env)
 {
     int size = offsetof(struct target_rt_sigframe, uc.tuc_mcontext.__reserved);
-    int fpsimd_ofs, end1_ofs, fr_ofs;
+    int fpsimd_ofs, end1_ofs, fr_ofs, end2_ofs = 0;
+    int extra_ofs = 0, extra_base = 0, extra_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
@@ -1641,7 +1686,14 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     target_setup_general_frame(frame, env, set);
     target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
+    if (extra_ofs) {
+        target_setup_extra_record((void *)frame + extra_ofs,
+                                  frame_addr + extra_base, extra_size);
+    }
     target_setup_end_record((void *)frame + end1_ofs);
+    if (end2_ofs) {
+        target_setup_end_record((void *)frame + end2_ofs);
+    }
 
     /* Set up the stack frame for unwinding.  */
     fr = (void *)frame + fr_ofs;
-- 
2.14.3

