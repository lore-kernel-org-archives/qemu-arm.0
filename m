Received: by 10.223.161.27 with SMTP id o27csp1967486wro;
        Thu, 2 Nov 2017 04:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tj4GmNw/5nw1nhGDN3QeV/u6DkXLgWHwfOu9Z6q5D0OMV1iQWDPCORfCNRqu7ytVs6IeFZ
X-Received: by 10.37.27.132 with SMTP id b126mr1912909ybb.329.1509622392580;
        Thu, 02 Nov 2017 04:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509622392; cv=none;
        d=google.com; s=arc-20160816;
        b=S0F6cQaAN3o0evvwOiRpIyJxihEbFLY/jrqNI75O8hViryq0IujeLhWqntjveefiTn
         IWSlLbwh0NzrkMCk/ruHu7r+XvdD2KoRaTgFsbrUAZcP5FtXWGPT2OAZGB6KB68uMzir
         Jrsc1/gz47jMSFsZ9Jn46B29CACQDbhsjztyHtlpe9RmQyONdKjYGOHCtVvJ+Ep0rcLc
         IYxpvE8gpHDhiMleN0+UPzQ+jspzJrW3pkJoRcPWXOTGyw+/ht+85jW0PkNWsJS8TByk
         vul8mfQAoGvFYbdAmNRQy0iPpXifEwHtNtmDnDvYLwvr09IZ5gpu/38zUaN97ZdOOqPM
         Yupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=8JxDy1pwxfTCd20t6quAPjqTPT2Rivz4Mpt6uBS18uM=;
        b=xjQ87SA1KmsYCNb1Cxuq0XJs6V8w1xD9P18yWdWy18AW6qGRzAvNWltv1wjkK/p6kc
         7yfAbaHCD1zupNmOHghs7e9PIMkfnwsbadTXoFJQ++7Zzi4IODPhv8wITZBh8bU+52iU
         L6wyevLK8VHmZC6/5ok1WO5rtS8xjvNqOQAFpWVlHTHn+Koc57op/Nw1XdEReI/1y8gM
         3EIwOK7kjGQRDgZdaFv48M/InqDemSZtHCDP3GkiI1yQebZThgBbnzR5Z6rHZR+nHvTQ
         LC3p1jmk0lZdLwn0I38XXzMZvL50yKj8xtNLZmQagsRBgnapP7TXawbqQxlPSX6sZYlv
         16Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c131si714812ywb.297.2017.11.02.04.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 04:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eADkG-0006z7-0C
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 07:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eADk6-0006z0-3Z
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 07:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eADk4-0007Sw-P5
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 07:33:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eADk4-0007Pu-IY; Thu, 02 Nov 2017 07:33:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eADjw-0002cf-1u; Thu, 02 Nov 2017 11:32:52 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  2 Nov 2017 11:33:20 +0000
Message-Id: <1509622400-13351-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2] translate.c: Fix usermode big-endian AArch32
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
X-TUID: 2JvA6m7gemwP

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
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2:
 * use correct "s->be_data == MO_BE" check for bigendian
 * don't mangle the data from the atomic-cmpxchg before
   comparing against expected value
 * tcg_temp_free() the TCGv from gen_aa32_addr()
 * name that TCGv "taddr" rather than "a"...

 target/arm/translate.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6ba4ae9..0ed03d7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7903,9 +7903,27 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
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
+        TCGv taddr = gen_aa32_addr(s, addr, opc);
+
+        tcg_gen_qemu_ld_i64(t64, taddr, get_mem_index(s), opc);
+        tcg_temp_free(taddr);
         tcg_gen_mov_i64(cpu_exclusive_val, t64);
-        tcg_gen_extr_i64_i32(tmp, tmp2, t64);
+        if (s->be_data == MO_BE) {
+            tcg_gen_extr_i64_i32(tmp2, tmp, t64);
+        } else {
+            tcg_gen_extr_i64_i32(tmp, tmp2, t64);
+        }
         tcg_temp_free_i64(t64);
 
         store_reg(s, rt2, tmp2);
@@ -7954,15 +7972,26 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
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
+        if (s->be_data == MO_BE) {
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
         tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);
         tcg_gen_extrl_i64_i32(t0, o64);
 
-- 
2.7.4

