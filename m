Received: by 10.223.197.9 with SMTP id q9csp8159886wrf;
        Fri, 20 Oct 2017 10:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SwirB+SpRlVqpK3ZlVG8A94DvG47AKAadgH/0ng30L1KemI3IH6COnlPn6nhlTttzM1ChJ
X-Received: by 10.200.53.111 with SMTP id z44mr9020898qtb.12.1508522181138;
        Fri, 20 Oct 2017 10:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508522181; cv=none;
        d=google.com; s=arc-20160816;
        b=LaT4Ys3s6gtBvZvEIBem5RKCLfO4FsAmBJqLTw5VkV/8pz+cZrUwNPMp9WbVbdaJjF
         k8AhzSadWBa9sPdbgE0VOTaf23zoG/t6BwsqP/oEu3Txg4iuT5GWVTBXhQX8o/L4UCbr
         90Ia/LI4GehK+pkHww/h41Y/8xBjxlKmYy+3LuUjDW9uIulFULeWBuBODrYaARzPy3cz
         73q6dLhAv/09BF0+tFSLLCxw/0iWx7pQ7wVQBlFmyEkLHRtnd3PdO42n+R1R4jcu832I
         Tk1/85Mp4e2AGpvuyFEAkVos1MFJW+z469916rwyeijFpKYguaN4mM1k+ziviwWuAT4a
         a6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=NZiCeSpWn2q7J5FvdwW1n6VArOoRa/x2H34QB6vQb6A=;
        b=Q2tZZCXnCo7KDxNPgP+qqM37FxPnGC3U6jyFHiQSqsB/pMMM6TGDlpDTLtQWmKIdFz
         Lrs6V/+5VFjako14iXtMmOFrVOeC/livSlD5XfqNf/BPTpNsWN50xUhQ+Uku3FFye9Qd
         ZW3/oSfUPsOfPECI6jT9OCjIEpt98bqZrXXusbsMH+q4FuJggXotKKN9HgP7A5uHJylg
         JppCwp2gsaQTi21ahAPsZLdzejhtftuBsuLm8Oy4rzJKYBefe2u3DV+l4xOwBWxg36JX
         6J3lxZ2loNuw4LHLJitgMA2EmXY1X8D/oNDM9RktevhZBpXW98feKcZgx1T9/nfYmguC
         Uc8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si1155377qkd.105.2017.10.20.10.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Oct 2017 10:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5bWs-00046f-Sp
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 13:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e5bWh-00045a-Pi
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 13:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e5bWg-0000Tb-Ir
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 13:56:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e5bWg-0000Qt-CM; Fri, 20 Oct 2017 13:56:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e5bWW-0008C8-Qz; Fri, 20 Oct 2017 18:55:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Oct 2017 18:56:10 +0100
Message-Id: <1508522170-22539-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] translate.c: Fix usermode big-endian AArch32
 LDREXD and STREXD
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
Cc: christophe.lyon@linaro.org, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3KyPQ9OVhv86

For AArch32 LDREXD and STREXD, architecturally the 32-bit word at the
lowest address is always Rt and the one at addr+4 is Rt2, even if the
CPU is big-endian. Our implementation does these with a single
64-bit store, so if we're big-endian then we need to put the two
32-bit halves together in the opposite order to little-endian,
so that they end up in the right places. We were trying to do
this with the gen_aa32_frob64() function, but that is not correct
for the usermode emulator, because there there is a distinction
between "load a 64 bit value" (which does a BE 64-bit access
and doesn't need swapping) and "load two 32 bit values as one
64 bit access" (where we still need to do the swapping, like
system mode BE32).

Fixes: https://bugs.launchpad.net/qemu/+bug/1725267

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is very much "last thing on Friday", but I'm going to be
travelling next week so thought I'd shove it out for review
and testing. It does fix the test case in the bug. I have
not tested:
 * BE32 system mode
 * BE8
 * little endian :-)

This should probably be cc: stable when it gets through
review and testing.
---
 target/arm/translate.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4da1a4c..88892e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7902,9 +7902,25 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        gen_aa32_ld_i64(s, t64, addr, get_mem_index(s), opc);
+        /* For AArch32, architecturally the 32-bit word at the lowest
+         * address is always Rt and the one at addr+4 is Rt2, even if
+         * the CPU is big-endian. That means we don't want to do a
+         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
+         * for an architecturally 64-bit access, but instead do a
+         * 64-bit access using MO_BE if appropriate and then split
+         * the two halves.
+         * This only makes a difference for BE32 user-mode, where
+         * frob64() must not flip the two halves of the 64-bit data
+         * but this code must treat BE32 user-mode like BE32 system.
+         */
+        TCGv a = gen_aa32_addr(s, addr, opc);
+        tcg_gen_qemu_ld_i64(t64, a, get_mem_index(s), opc);
         tcg_gen_mov_i64(cpu_exclusive_val, t64);
-        tcg_gen_extr_i64_i32(tmp, tmp2, t64);
+        if (s->be_data) {
+            tcg_gen_extr_i64_i32(tmp2, tmp, t64);
+        } else {
+            tcg_gen_extr_i64_i32(tmp, tmp2, t64);
+        }
         tcg_temp_free_i64(t64);
 
         store_reg(s, rt2, tmp2);
@@ -7953,15 +7969,29 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        tcg_gen_concat_i32_i64(n64, t1, t2);
+        /* For AArch32, architecturally the 32-bit word at the lowest
+         * address is always Rt and the one at addr+4 is Rt2, even if
+         * the CPU is big-endian. Since we're going to treat this as a
+         * single 64-bit BE store, we need to put the two halves in the
+         * opposite order for BE to LE, so that they end up in the right
+         * places.
+         * We don't want gen_aa32_frob64() because that does the wrong
+         * thing for BE32 usermode.
+         */
+        if (s->be_data) {
+            tcg_gen_concat_i32_i64(n64, t2, t1);
+        } else {
+            tcg_gen_concat_i32_i64(n64, t1, t2);
+        }
         tcg_temp_free_i32(t2);
-        gen_aa32_frob64(s, n64);
 
         tcg_gen_atomic_cmpxchg_i64(o64, taddr, cpu_exclusive_val, n64,
                                    get_mem_index(s), opc);
         tcg_temp_free_i64(n64);
 
-        gen_aa32_frob64(s, o64);
+        if (s->be_data) {
+            tcg_gen_rotri_i64(o64, o64, 32);
+        }
         tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);
         tcg_gen_extrl_i64_i32(t0, o64);
 
-- 
2.7.4

