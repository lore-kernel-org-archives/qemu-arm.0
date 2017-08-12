Received: by 10.25.221.202 with SMTP id w71csp2253336lfi;
        Sat, 12 Aug 2017 08:42:47 -0700 (PDT)
X-Received: by 10.55.20.220 with SMTP id 89mr1082343qku.94.1502552567131;
        Sat, 12 Aug 2017 08:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502552567; cv=none;
        d=google.com; s=arc-20160816;
        b=Bh/5uHPucPjqirR8RlKrQa4jUnn56vD/k9CqtoWCcbB1TaJ0l59fGwxynlSoyQNdth
         vu+5JYSkepbwFT5ohRXo+ZpuPV7r6erFq1jYFy2GQeHrB8XLHr6mv32WjWCJi1/bF9Ji
         bgmZ3eIxiiHU3HeLOR61kHONu6M33qWjAo2JK/gzuFjzgy1atY8Pbmfp47ATLz/LmZB9
         OVC7eE0noTsyw9r6Z9EXXJsCoDQh5Ksjr0+5aT5J6SL4EFd+cPdjf8Vdjv0JHEqIvIv6
         7lUaX2iO6+etzOTJ3yVip+hIpaFDA39qLKUw4pBl+I/kWB3vBCvtt8O51W2MFotcKKrV
         z3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=nfUiRuuW2ZaqbgUQZyDm9sycQ/8BCH8lzVvBBPXGEgc=;
        b=yWLn4DB79u4FdGsDkOwA/4hlGhCTE0/JPNupKwDNjevUU9a+Pycr7YhgiE2686gdPw
         c+KEP7fCWhzK9GPMrKwsTQrAWO7r7Y/mxxa99NwmqfXnlgXrt20/3PtHY1fuJbwgPhGz
         cQoPXvLrV0mTcdQp7t80MKWdnPLhwGl18RneBTFicIDmYn0zvkm+f0TZx0Z0BNSYh2Fe
         OmStNETERQy0wDYoSO4DSJe7bWOfyIe7gjhuoU60shUmqScSkZYpuId0GO38V3d7hyfY
         gvZPiv5V9765sD67TxLV7H/Ftrzv0BdOAg4auCF9eIMY9q50MqJgLN8FExOO/VVJS7Lp
         CLBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HLUbgPWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si2939032qtc.303.2017.08.12.08.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 08:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HLUbgPWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgYYm-0002Dx-J6
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 11:42:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dgYXl-0001nD-OJ
	for qemu-devel@nongnu.org; Sat, 12 Aug 2017 11:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dgYXi-0004Hh-Lb
	for qemu-devel@nongnu.org; Sat, 12 Aug 2017 11:41:41 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dgYXi-0004Fl-D3; Sat, 12 Aug 2017 11:41:38 -0400
Received: by mail-pg0-x244.google.com with SMTP id y192so5371443pgd.1;
	Sat, 12 Aug 2017 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nfUiRuuW2ZaqbgUQZyDm9sycQ/8BCH8lzVvBBPXGEgc=;
	b=HLUbgPWVTcLmIkt2XQYtVSu2FNDIa6yX/sIYrz0mqFLocza5UWvVMMrLpT8tDzlwlX
	8a5NzQSyR/XM17aFLU+opsatu7k50RzfmlxbQ3qtbQ+C9rxFfU3WjHEZIcEAVu9EP5Rf
	gyXuppgXLtvi8znx1LAn6lcFuu1dp5Yioz06kDKs7Sq58CQ49+8VVMq8A8cZaLnHefdt
	lY7PiB9Da1qXpHJB8gVgw4SqezJB5cwftjBKcJXyPllmEWux/89LCSAH37PKWyRHjR5A
	n8jfziY8YB9LO8WeUskeBYTj39jHT6cGNzcXT5UPJ9L42Trvfp5JrS/wvzMW4AVKvF8K
	Afzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nfUiRuuW2ZaqbgUQZyDm9sycQ/8BCH8lzVvBBPXGEgc=;
	b=lKND7I0451jy5FX79ig2J9ezbPaQFPzPT90LjJERvlgbBxqxcIAM/yvWGMAVDs3lXd
	PB70hJFtTIRTzbUdBUcsGTh+9XvlpogESKgCMTYweQPtG40yqSrYPh1QbYCBt6FbETGm
	UdvXB7QgF6BZmgL7B+vu6go3wmzDssASWj0vDhpTAVnDvaRFoeS1RG7FUQPY+LNHm5Q+
	Ur2b8TwdAaUfNYCmHFqlHPzUAh7/yfRdLWUauRbAmSBBN278ob0Z40lZ+9F8vfUtKX5W
	X+lQIREiSc97r/PcRypvdRW5ymaRaFK6nse59qRF77RmvZRdzABhpmN+lqZ6GlIf9SNT
	xSDw==
X-Gm-Message-State: AHYfb5jGuDD+zkR4o3ktle/ZHY87NJi+1SfKQ9zdLVNOWbBYRpBNuJAv
	FFCLvZr1yzo2DcUAdUQ=
X-Received: by 10.98.129.197 with SMTP id t188mr19433352pfd.318.1502552495578; 
	Sat, 12 Aug 2017 08:41:35 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	e198sm6394041pfh.36.2017.08.12.08.41.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Aug 2017 08:41:34 -0700 (PDT)
From: Richard Henderson <rth7680@gmail.com>
X-Google-Original-From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 12 Aug 2017 08:41:31 -0700
Message-Id: <20170812154131.29372-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH] target/arm: Correct load/store exclusive
 pairing and alignment
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gSIypxlrS0l

SetExclusiveMonitors in the pseudocode is on the address + width,
and says nothing about the manner of the load.  Therefore

	ldxp	w0, w1, [x2]
vs
	ldxr	x0, [x2]

must record the same metadata so that either may pair with

	stxp	w3, w0, w1, [x2]
vs
	stxr	w3, x0, [x2]

Fix this by ignoring cpu_exclusive_high except for 64-bit LDXP/STXP.

Also note that we were not providing the required single-copy atomic
semantics for 32-bit LDXP.  This is trivially fixed alongside the
cpu_exclusive_val change.

At the same time, exclusive loads require the same alignment as
exclusive stores.  For 64-bit LDXP, this means adding MO_ALIGN_16;
for the others adding MO_ALIGN.

Reported-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 65 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 24 deletions(-)
---

I have not yet constructed test cases for all of the combinations
listed above.  I wanted to put this into your hands so that you could
test against your existing code using LDXP/STXP.


r~


diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 58ed4c6d05..f3643ac8dc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1853,29 +1853,45 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = s->be_data + size;
+    int idx = get_mem_index(s);
+    TCGMemOp memop = s->be_data;
 
     g_assert(size <= 3);
-    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
-
     if (is_pair) {
-        TCGv_i64 addr2 = tcg_temp_new_i64();
-        TCGv_i64 hitmp = tcg_temp_new_i64();
-
         g_assert(size >= 2);
-        tcg_gen_addi_i64(addr2, addr, 1 << size);
-        tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s), memop);
-        tcg_temp_free_i64(addr2);
-        tcg_gen_mov_i64(cpu_exclusive_high, hitmp);
-        tcg_gen_mov_i64(cpu_reg(s, rt2), hitmp);
-        tcg_temp_free_i64(hitmp);
-    }
+        if (size == 2) {
+            /* The pair must be single-copy atomic for the doubleword.  */
+            memop |= MO_64 | MO_ALIGN;
+            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+            if (s->be_data == MO_LE) {
+                tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
+                tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 32, 32);
+            } else {
+                tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 32, 32);
+                tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
+            }
+        } else {
+            /* The pair must be single-copy atomic for *each* doubleword,
+               but not the entire quadword.  It must, however, be aligned.  */
+            TCGv_i64 addr2;
 
-    tcg_gen_mov_i64(cpu_exclusive_val, tmp);
-    tcg_gen_mov_i64(cpu_reg(s, rt), tmp);
+            memop |= MO_64;
+            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
+                                memop | MO_ALIGN_16);
 
-    tcg_temp_free_i64(tmp);
+            addr2 = tcg_temp_new_i64();
+            tcg_gen_addi_i64(addr2, addr, 8);
+            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
+            tcg_temp_free_i64(addr2);
+
+            tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
+            tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
+        }
+    } else {
+        memop |= size | MO_ALIGN;
+        tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+        tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
+    }
     tcg_gen_mov_i64(cpu_exclusive_addr, addr);
 }
 
@@ -1908,14 +1924,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tmp = tcg_temp_new_i64();
     if (is_pair) {
         if (size == 2) {
-            TCGv_i64 val = tcg_temp_new_i64();
-            tcg_gen_concat32_i64(tmp, cpu_reg(s, rt), cpu_reg(s, rt2));
-            tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
-            tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
+            if (s->be_data == MO_LE) {
+                tcg_gen_concat32_i64(tmp, cpu_reg(s, rt), cpu_reg(s, rt2));
+            } else {
+                tcg_gen_concat32_i64(tmp, cpu_reg(s, rt2), cpu_reg(s, rt));
+            }
+            tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, tmp,
                                        get_mem_index(s),
-                                       size | MO_ALIGN | s->be_data);
-            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
-            tcg_temp_free_i64(val);
+                                       MO_64 | MO_ALIGN | s->be_data);
+            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
         } else if (s->be_data == MO_LE) {
             gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
                                            cpu_reg(s, rt2));
-- 
2.13.4

