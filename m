Received: by 10.25.221.202 with SMTP id w71csp2287110lfi;
        Sat, 12 Aug 2017 09:20:27 -0700 (PDT)
X-Received: by 10.200.36.133 with SMTP id s5mr26021212qts.276.1502554827448;
        Sat, 12 Aug 2017 09:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502554827; cv=none;
        d=google.com; s=arc-20160816;
        b=OeGrBVY1Y30RT/XEd2Z2V1TgGpR9VfaqaOR18taxW7UFWRZyv1e+s6v9n1nEtGUsaN
         VxKat11kDPc2D427Gl/54FQXqN6omPJF4uID0UyQhIJlOq4FqVJicESGaxxh6Daj8e+6
         vc/QG/WJPH22BRU8FkZxDuLdwmGnwBHRRpcBgEG1vT8QO6roEe3FM1wW8bUUWkv04lhR
         OHqbN00SooymNSC/vhtRog2WrIhv7tMl+1zW7kJk06xzoRAYLBZOKz/cjsOjI29Yl9h4
         VGSl5ZueKdTmee7O6WJmmZlYOrUQmGd9OjCx/E29SkO+wpo5d9tR4UBYzASJ9QoRCuzP
         jAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Mc7qw1Vfs3qsF08MS8HxmRPcaiuIejYYbAVNjDiIB+k=;
        b=cCnSOnA+HKXMRRI6eCM/cfwvL5CgMHpzAwvIIG+O9UiH9fmQDV2MycXbKJXIvqpvJc
         Jhpw8+lS4si4IZLa23QWKrEpjziBGEmB4vSophwr6s6DiHT9bBPJqgjxo4kPTsUxDi4l
         0T2vb1ZEZ+zpOmzbMOfX+JrlkzCayIRHyCJIiiiYOPeR3bJmSEWd2fBlRHu5dmd5Rjzc
         2oHm+ytg/Ym2VRR1lx1mN/7qJyvaE1Lz+YXR3ceCxBS2sM7XI67i5FdeJbYm1+E9IYKy
         RhBavgp7gFAOTaBxaF+NdQ58Suu+VGC3gHfNJ6RH0djb0AIXCJ0RFHy6JybAo5V6MQvL
         u8nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ge5QRplw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o20si3090133qto.230.2017.08.12.09.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 09:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ge5QRplw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgZ9E-0003q4-VX
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 12:20:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dgZ84-0003CX-2W
	for qemu-devel@nongnu.org; Sat, 12 Aug 2017 12:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dgZ80-000173-2v
	for qemu-devel@nongnu.org; Sat, 12 Aug 2017 12:19:12 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dgZ7z-00016f-Tu; Sat, 12 Aug 2017 12:19:08 -0400
Received: by mail-pf0-x244.google.com with SMTP id t86so6089402pfe.1;
	Sat, 12 Aug 2017 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mc7qw1Vfs3qsF08MS8HxmRPcaiuIejYYbAVNjDiIB+k=;
	b=Ge5QRplw8OZm3oR/slSuRSogdsKOWsrlEqBpYO93vCYQYPrz7afH0y7ScE+Jj92S6P
	UM981lFUbm1L+n+0lOYweccyh/SGl9VTO/9mNN60lBOwV/DZFDBzyvl/N4FohbLdhakG
	D3NTqJBaU4zdb8ZrkB2YUQFBpO7XNRlGiNwxnPeFHX+qiSKRHy8VL8z0zhJsF8p01vJt
	de4oAvzpboMIgd/1iR+8Pj1UqzHQRa7iy8fApEFVUrWNbnp3GE8AifvjOw+H7rLS9yqb
	wM+IOmY3MhSEYk7Y7fdyZrCdvtSZyB87QgAN8+b6mRAMFPcbnnWWm/kHbs5Jj8Pgwyd/
	NVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mc7qw1Vfs3qsF08MS8HxmRPcaiuIejYYbAVNjDiIB+k=;
	b=d6GvYa3Pd8C/A2hklVReELh2VnUmO1Sp6zifE64S+IZfy7abH4Gx9sZktdqStgIeiD
	0QkEE1uO7Gv0ifj0y4mWLaCScq4VEZXhdGjd1LL4AKjE579zObOWQcxUeWBxoesfIY/J
	xTW8MOVupOfRbiNCcCbtYxe2KKWZahw/2ehQLAepSb2bb1CgyJrHRvORIPhYImgXUnaP
	xzUfsLgov4XtJ9WwBvbPuA44d37BKGJy5WoZsOLEDnJa9tlV1E2O8CzuOIJIdUAtV+nz
	UU9Xs55IimNGHAAayiqlnyfLaWrnxHNhfj/jbXpWdQoxmUJvB34nwnclNpf3QHRlBKuA
	sEmg==
X-Gm-Message-State: AHYfb5hVUlLLYMwMTcarI3RqU2tp+DH0Q/OtY1knymfaCY8rAHy62qJr
	kVCJJ0su3Rb2I6vlMAc=
X-Received: by 10.84.169.3 with SMTP id g3mr21509761plb.136.1502554746539;
	Sat, 12 Aug 2017 09:19:06 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	a67sm6865912pfl.167.2017.08.12.09.19.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Aug 2017 09:19:05 -0700 (PDT)
From: Richard Henderson <rth7680@gmail.com>
X-Google-Original-From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 12 Aug 2017 09:19:03 -0700
Message-Id: <20170812161903.8622-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH] target/arm: Avoid an extra temporary for
 store_exclusive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zBEZ9/6WEOi

Instead of copying addr to a local temp, reuse the value (which we
have just compared as equal) already saved in cpu_exclusive_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f3643ac8dc..f3a1b1cecc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1896,7 +1896,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 }
 
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
-                                TCGv_i64 inaddr, int size, int is_pair)
+                                TCGv_i64 addr, int size, int is_pair)
 {
     /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
      *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
@@ -1912,13 +1912,8 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      */
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
-    TCGv_i64 addr = tcg_temp_local_new_i64();
     TCGv_i64 tmp;
 
-    /* Copy input into a local temp so it is not trashed when the
-     * basic block ends at the branch insn.
-     */
-    tcg_gen_mov_i64(addr, inaddr);
     tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
@@ -1929,27 +1924,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             } else {
                 tcg_gen_concat32_i64(tmp, cpu_reg(s, rt2), cpu_reg(s, rt));
             }
-            tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, tmp,
+            tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr,
+                                       cpu_exclusive_val, tmp,
                                        get_mem_index(s),
                                        MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
         } else if (s->be_data == MO_LE) {
-            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
-                                           cpu_reg(s, rt2));
+            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
+                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         } else {
-            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, addr, cpu_reg(s, rt),
-                                           cpu_reg(s, rt2));
+            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
+                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         }
     } else {
-        TCGv_i64 val = cpu_reg(s, rt);
-        tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, val,
-                                   get_mem_index(s),
+        tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
+                                   cpu_reg(s, rt), get_mem_index(s),
                                    size | MO_ALIGN | s->be_data);
         tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
     }
-
-    tcg_temp_free_i64(addr);
-
     tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
     tcg_temp_free_i64(tmp);
     tcg_gen_br(done_label);
-- 
2.13.4

