Received: by 10.25.159.19 with SMTP id i19csp1754422lfe;
        Sun, 17 Jan 2016 23:14:59 -0800 (PST)
X-Received: by 10.140.167.86 with SMTP id n83mr30162602qhn.41.1453101297133;
        Sun, 17 Jan 2016 23:14:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si29556794qhb.48.2016.01.17.23.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL41g-0006h2-GX
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:14:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zu-0003Ep-3n
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zs-00075R-NE
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:06 -0500
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:34653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zp-00073s-FT; Mon, 18 Jan 2016 02:13:01 -0500
Received: by mail-pf0-x230.google.com with SMTP id q63so157718288pfb.1;
	Sun, 17 Jan 2016 23:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tMlqCStbzkG3ZflZ0YQ3ogg19VWPLqt6VEYZkRGYeUk=;
	b=EPz3MWAMdDZE5ZbnWmA3drSH1t+f3egKYlotFvq6V9jwTsYORlW7y3AxF2OgQaNu7l
	b7piJr8IEP1775sQTk8FqRSqnIOM3Jxmy6Cq873rRlXhKlEGSWR7FRyOK9ktiTfNp4ZV
	9cjMwa5AonWw9rquE8r5w2eoN2OquSxMQej/1RgRfaZE8QlXfOSpackUgMTU4w2T9p2L
	ang6kL609LlG/HdPFFsWdSR866I6W+SeLyy1IvPrQiuhR4ajlETYGmWSei4E9x3Jr9r9
	bBqublmhC3Cv4ZqJt/U+cuEBzl+K04eFrdYqjeD0FiAp6hKlLZ35tB84kvRmrgduFGKq
	47OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=tMlqCStbzkG3ZflZ0YQ3ogg19VWPLqt6VEYZkRGYeUk=;
	b=lQW0h7VQ9Wiryvs8Wh8ki/SBXsAH/z53npUv1UYP6daxXgLqxyV/QVQwqaBSqHzGKh
	/26aB9AypCSsNnbZcIcEE8KMw1F7OFi+022i3Tk3Hy1CQAX5VWPorgC8Xj1XTep+vXMA
	6DwTXsQ11VBfugR6ROwxqUctBhvs0Um/U1uRd5cjQ21FQLY0mYNe6nUxbxq+jRwZu9Ft
	rMq0TVV7KmBbAhCOeldVQAnFV0CKa9K89t1q7IZSngmjNWCDVsoWa1Dq1ke/tlBfLY5D
	k/PF8RZZBfwV6nB/4mjKXB+FDvY2Nt4OvGuYva7MOnp7xfvlakUzBhQ7AKP/E0lVnFGG
	daxg==
X-Gm-Message-State: ALoCoQmWOxOVBU30p77ZVjuB2+2RiGv+LpJiMPAllZcQl6s01KntTOiOsgyRQgARCkH4jnbDLr/6CICKRhAH0ncQYiDjKZFZMg==
X-Received: by 10.98.67.67 with SMTP id q64mr34487309pfa.133.1453101180941;
	Sun, 17 Jan 2016 23:13:00 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:00 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:34 -0800
Message-Id: <f4c3a866026a7246ab93dcb5202ce750d90d5029.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::230
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 07/17] target-arm: a64: Add endianness support
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
X-TUID: dgwMD7MBhKKA

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Set the dc->mo_endianness flag for AA64 and use it in all ldst ops.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 target-arm/translate-a64.c | 49 ++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index d826b92..59026b6 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -726,7 +726,7 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
                              TCGv_i64 tcg_addr, int size, int memidx)
 {
     g_assert(size <= 3);
-    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, MO_TE + size);
+    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->mo_endianness + size);
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
@@ -741,7 +741,7 @@ static void do_gpr_st(DisasContext *s, TCGv_i64 source,
 static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
                              int size, bool is_signed, bool extend, int memidx)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->mo_endianness + size;
 
     g_assert(size <= 3);
 
@@ -773,13 +773,18 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmp = tcg_temp_new_i64();
     tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TE + size);
+        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
+                            s->mo_endianness + size);
     } else {
+        bool be = s->mo_endianness == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TEQ);
+
+        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
+        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
+                            s->mo_endianness | MO_Q);
         tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, tcg_hiaddr, get_mem_index(s), MO_TEQ);
+        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
+                            s->mo_endianness | MO_Q);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
@@ -796,17 +801,21 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmphi;
 
     if (size < 4) {
-        TCGMemOp memop = MO_TE + size;
+        TCGMemOp memop = s->mo_endianness + size;
         tmphi = tcg_const_i64(0);
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
     } else {
+        bool be = s->mo_endianness == MO_BE;
         TCGv_i64 tcg_hiaddr;
+
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), MO_TEQ);
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmphi, tcg_hiaddr, get_mem_index(s), MO_TEQ);
+        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
+                            s->mo_endianness | MO_Q);
+        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
+                            s->mo_endianness | MO_Q);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
@@ -945,7 +954,7 @@ static void clear_vec_high(DisasContext *s, int rd)
 static void do_vec_st(DisasContext *s, int srcidx, int element,
                       TCGv_i64 tcg_addr, int size)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->mo_endianness + size;
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
     read_vec_element(s, tcg_tmp, srcidx, element, size);
@@ -958,7 +967,7 @@ static void do_vec_st(DisasContext *s, int srcidx, int element,
 static void do_vec_ld(DisasContext *s, int destidx, int element,
                       TCGv_i64 tcg_addr, int size)
 {
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->mo_endianness + size;
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
     tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), memop);
@@ -1703,7 +1712,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGMemOp memop = MO_TE + size;
+    TCGMemOp memop = s->mo_endianness + size;
 
     g_assert(size <= 3);
     tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
@@ -1765,7 +1774,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), MO_TE + size);
+    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), s->mo_endianness + size);
     tcg_gen_brcond_i64(TCG_COND_NE, tmp, cpu_exclusive_val, fail_label);
     tcg_temp_free_i64(tmp);
 
@@ -1774,7 +1783,8 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 tmphi = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addrhi, addr, 1 << size);
-        tcg_gen_qemu_ld_i64(tmphi, addrhi, get_mem_index(s), MO_TE + size);
+        tcg_gen_qemu_ld_i64(tmphi, addrhi, get_mem_index(s),
+                            s->mo_endianness + size);
         tcg_gen_brcond_i64(TCG_COND_NE, tmphi, cpu_exclusive_high, fail_label);
 
         tcg_temp_free_i64(tmphi);
@@ -1782,13 +1792,14 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     }
 
     /* We seem to still have the exclusive monitor, so do the store */
-    tcg_gen_qemu_st_i64(cpu_reg(s, rt), addr, get_mem_index(s), MO_TE + size);
+    tcg_gen_qemu_st_i64(cpu_reg(s, rt), addr, get_mem_index(s),
+                        s->mo_endianness + size);
     if (is_pair) {
         TCGv_i64 addrhi = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addrhi, addr, 1 << size);
         tcg_gen_qemu_st_i64(cpu_reg(s, rt2), addrhi,
-                            get_mem_index(s), MO_TE + size);
+                            get_mem_index(s), s->mo_endianness + size);
         tcg_temp_free_i64(addrhi);
     }
 
@@ -2603,7 +2614,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
             tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr,
-                                get_mem_index(s), MO_TE + scale);
+                                get_mem_index(s), s->mo_endianness + scale);
             switch (scale) {
             case 0:
                 mulconst = 0x0101010101010101ULL;
@@ -2633,9 +2644,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, tcg_addr, MO_TE + scale);
+                do_vec_ld(s, rt, index, tcg_addr, s->mo_endianness + scale);
             } else {
-                do_vec_st(s, rt, index, tcg_addr, MO_TE + scale);
+                do_vec_st(s, rt, index, tcg_addr, s->mo_endianness + scale);
             }
         }
         tcg_gen_addi_i64(tcg_addr, tcg_addr, ebytes);
-- 
1.9.1

