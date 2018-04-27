Received: by 10.28.4.212 with SMTP id 203csp168975wme;
        Thu, 26 Apr 2018 17:30:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoD9QZIMZiReh6+8uDpKkZeVm+CvGNBZl2lZLv8ePnkNm81piFDujPzHUAnld6AIMjpuDqU
X-Received: by 2002:ac8:387d:: with SMTP id r58-v6mr200649qtb.138.1524789024761;
        Thu, 26 Apr 2018 17:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789024; cv=none;
        d=google.com; s=arc-20160816;
        b=mRutkTgO0Av1q6MSPd/rYtgmGK+CjN9aX/JVLvFLZfk1X6ZzQatL89vZFNIx66EqK8
         TZbutHEPdWvyYA3bOxTcSeX5sEypmODSSFz8DXB+sEIXqZTYEzvBrIdqnWgRiFYJeW0Y
         sZDdetDzFLSDXCRJfEzzqAQHk9PFnOtPmNzInWEiUKmHiimFB/WYy0+Y2cePnfhChIQQ
         p8kJXrVOrTGO2syRBFeEWHMnZvuIQ1r2ltZO3N9H00KFAqSNzV9cYgX15D36s9RiuRF8
         bFd9mGWq3rMw3+eX8ZRuwFb1PwaA8EVfdOg2hyKkbmgjzUXc16J9wxAB5EoRifVkjyFT
         FILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sEh2wGJE6rgMpMZZf3odblZRKaPH0BOzj0JTtUcsDDE=;
        b=fiQWdHVZI0ouoaOq+Ko83If1AHdDABzVDaDdVKODPaTIVk01r7MYwcktpRmJNcsUyX
         g1F24t4gYo7VDSe0wh1F7/P6Z7KVHXtMxIGzEbFKgnu4Cr/OCSTaOR3R4csJaBr5QTF6
         I8G5IVNTlrsFy3MTrGQ88n9F9ZFfT+6PMBpwsbPo7bqTr2fCfsW1GJGA0KHNIKzskRHW
         L2wepXExr6bSvAYWamYk16ERMKkajawLgHNwW5TakpdAk+hnu2e0lEtN8PZYxKDRXIGk
         4MjMCPuR17U7VhmGzdvW/8lGopZWh43C3rIjmEdeslpSUXtaN/1JGBhphip/kn+SD+6Y
         0BVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FI1pOc0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si87673qvl.288.2018.04.26.17.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FI1pOc0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrHM-0005Bq-4m
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:30:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEF-00025x-CL
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEE-0004UG-5v
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:11 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:44941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrED-0004Tv-Vu
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:10 -0400
Received: by mail-pg0-x241.google.com with SMTP id 82-v6so136840pge.11
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sEh2wGJE6rgMpMZZf3odblZRKaPH0BOzj0JTtUcsDDE=;
	b=FI1pOc0WIAJOl2HQNSah4DIlYL2rd2/cHstiGpsYsuHJIn+XueVQVzmXYL0mWPdgPd
	MbNl9A8QziqmF8rtCHmu9JW0sqIJbDVYYVHaVKUaUEv+9NI0wem4S+HT1TTWaCMdmTUl
	gLcRyx6FHLJ9HyH/brwdBD+p/XRcYfYmFtYbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sEh2wGJE6rgMpMZZf3odblZRKaPH0BOzj0JTtUcsDDE=;
	b=Tj+mP+85gWL+5rQtwrRO00xMsWReAWHbpF1OxlpCPPi6xCMUKned7J2rlm8qJszoI9
	HMZLYOqAqBFABb5yDQfje+a1L0TbAKV6+0zU6nBB7qVoGLiWy57xi2zSEi7Jj/fIck10
	aNnxOD71GTiS/j4qf8bkhZfLngeRHGCLHo9a6YYCNAJM85h4+ZXaihwBRfqyJHVOuiWZ
	dmzzg+zXW62sxEn8Ok3ZNBb+M07Sq9RKZiz9i62c6NZomz5Q6X7KGNHzoNz3lR8GSIIR
	GJRIGUDZjgDPGCmZYhCTGuC7F5hEFIflCUmxNyeaUnA4Gyx8Alq1xyE/YOlwH18lZkDU
	o5hA==
X-Gm-Message-State: ALQs6tC2gHAb2o+hk+vVPml8onPqZ/LjOPdrvdj42566XqmH26s5VDDk
	v2d2Yw3S9qrwLa5fbFhZnwos6HPxvzg=
X-Received: by 2002:a63:af44:: with SMTP id s4-v6mr147975pgo.295.1524788829145;
	Thu, 26 Apr 2018 17:27:09 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:47 -1000
Message-Id: <20180427002651.28356-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 5/9] target/riscv: Use new atomic min/max
 expanders
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MhNet4kE023R

Cc: Michael Clark <mjc@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 72 ++++++++++++++----------------------------------
 1 file changed, 20 insertions(+), 52 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 808eab7f50..9cab717088 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -725,7 +725,6 @@ static void gen_atomic(DisasContext *ctx, uint32_t opc,
     TCGv src1, src2, dat;
     TCGLabel *l1, *l2;
     TCGMemOp mop;
-    TCGCond cond;
     bool aq, rl;
 
     /* Extract the size of the atomic operation.  */
@@ -823,60 +822,29 @@ static void gen_atomic(DisasContext *ctx, uint32_t opc,
         tcg_gen_atomic_fetch_or_tl(src2, src1, src2, ctx->mem_idx, mop);
         gen_set_gpr(rd, src2);
         break;
-
     case OPC_RISC_AMOMIN:
-        cond = TCG_COND_LT;
-        goto do_minmax;
-    case OPC_RISC_AMOMAX:
-        cond = TCG_COND_GT;
-        goto do_minmax;
-    case OPC_RISC_AMOMINU:
-        cond = TCG_COND_LTU;
-        goto do_minmax;
-    case OPC_RISC_AMOMAXU:
-        cond = TCG_COND_GTU;
-        goto do_minmax;
-    do_minmax:
-        /* Handle the RL barrier.  The AQ barrier is handled along the
-           parallel path by the SC atomic cmpxchg.  On the serial path,
-           of course, barriers do not matter.  */
-        if (rl) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        }
-        if (tb_cflags(ctx->tb) & CF_PARALLEL) {
-            l1 = gen_new_label();
-            gen_set_label(l1);
-        } else {
-            l1 = NULL;
-        }
-
         gen_get_gpr(src1, rs1);
         gen_get_gpr(src2, rs2);
-        if ((mop & MO_SSIZE) == MO_SL) {
-            /* Sign-extend the register comparison input.  */
-            tcg_gen_ext32s_tl(src2, src2);
-        }
-        dat = tcg_temp_local_new();
-        tcg_gen_qemu_ld_tl(dat, src1, ctx->mem_idx, mop);
-        tcg_gen_movcond_tl(cond, src2, dat, src2, dat, src2);
-
-        if (tb_cflags(ctx->tb) & CF_PARALLEL) {
-            /* Parallel context.  Make this operation atomic by verifying
-               that the memory didn't change while we computed the result.  */
-            tcg_gen_atomic_cmpxchg_tl(src2, src1, dat, src2, ctx->mem_idx, mop);
-
-            /* If the cmpxchg failed, retry. */
-            /* ??? There is an assumption here that this will eventually
-               succeed, such that we don't live-lock.  This is not unlike
-               a similar loop that the compiler would generate for e.g.
-               __atomic_fetch_and_xor, so don't worry about it.  */
-            tcg_gen_brcond_tl(TCG_COND_NE, dat, src2, l1);
-        } else {
-            /* Serial context.  Directly store the result.  */
-            tcg_gen_qemu_st_tl(src2, src1, ctx->mem_idx, mop);
-        }
-        gen_set_gpr(rd, dat);
-        tcg_temp_free(dat);
+        tcg_gen_atomic_fetch_smin_tl(src2, src1, src2, ctx->mem_idx, mop);
+        gen_set_gpr(rd, src2);
+        break;
+    case OPC_RISC_AMOMAX:
+        gen_get_gpr(src1, rs1);
+        gen_get_gpr(src2, rs2);
+        tcg_gen_atomic_fetch_smax_tl(src2, src1, src2, ctx->mem_idx, mop);
+        gen_set_gpr(rd, src2);
+        break;
+    case OPC_RISC_AMOMINU:
+        gen_get_gpr(src1, rs1);
+        gen_get_gpr(src2, rs2);
+        tcg_gen_atomic_fetch_umin_tl(src2, src1, src2, ctx->mem_idx, mop);
+        gen_set_gpr(rd, src2);
+        break;
+    case OPC_RISC_AMOMAXU:
+        gen_get_gpr(src1, rs1);
+        gen_get_gpr(src2, rs2);
+        tcg_gen_atomic_fetch_umax_tl(src2, src1, src2, ctx->mem_idx, mop);
+        gen_set_gpr(rd, src2);
         break;
 
     default:
-- 
2.14.3

