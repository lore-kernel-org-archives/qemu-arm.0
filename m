Received: by 10.28.4.212 with SMTP id 203csp334636wme;
        Fri, 4 May 2018 11:31:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpcKXoej/MWOP9T75tk62EYtOcQYYnL4pg5Xmn9YUt7h1aNK6/00y52x6ycK6qukdvYnbLF
X-Received: by 2002:a0c:b4a2:: with SMTP id c34-v6mr8868096qve.70.1525458702923;
        Fri, 04 May 2018 11:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458702; cv=none;
        d=google.com; s=arc-20160816;
        b=ucRlEBK7CM2Lfc1RGqe+pbm1D75z0Drv0IZj6kChtJilFJiJ3O7FSVTT3JTRjm3GP3
         LeEF8oVR1KJzMrnVr8DVOM2SZkKId0wkcUqM+eZKcF38i1bQLQvbyC2F7zWfE3ZItJll
         pmMYUnEnAC0XS7ufTwVJMj9u+NdL7eo3JbkPum1PStCli8sG0OM+7TdM9oJ0pMFzN+MT
         4/FpVQHMqUxd9WLrUwqwcxwv9X7IlHOcxM9z7y6I9mEu/q2sg5gPFTdakAC8HsXln/JY
         5afU+qsADsKiRFO1k1lioFHQQDmGMgPy0iPMHkleXdnAutrQUFmdeA5x6OtJRNIXNbXm
         UCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2pebf/0PR+IvJNPCRpXipzxGfr/2aHKqB2n6O6kIo6g=;
        b=bemvfaso0CIFEa/ntdzvTo0O8pEBBPV8AzlaXS+Heoxy66wT5GrYypBEWo8iuMGvXp
         +mQB08hSouIN9fT1Zh5DKu7k7CE8RaVvdObv/xBoq8dMUgvRmm/6OSUGij3b8bWTmI1e
         dHWYXmz3J9WLQmTQqR7O1xpGrMa22viMeR4kuxmoWU7FQGwdshW0rSJmAaRKM5Jxya43
         JjrgSKC31en7Rig6uOuQXrjvLVxZgmIxV6k2krrv+xSsJohI58uOI/viJoWmY8JCNcvB
         BaSnGkvGhcg3ueVfFzywWd4Muiwv4AsvKs5BQ9DcgcxGZjPCFTM/hq/yceoveZAIgx+9
         dOfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sx5oaXRo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14-v6si11841964qvh.195.2018.05.04.11.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sx5oaXRo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfUc-0008CO-D1
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTW-0007X4-23
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTV-00019J-3g
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:34 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:37969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTU-00018i-V1
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:33 -0400
Received: by mail-pg0-x241.google.com with SMTP id n9-v6so15981405pgq.5
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2pebf/0PR+IvJNPCRpXipzxGfr/2aHKqB2n6O6kIo6g=;
	b=Sx5oaXRo4C8YWxHMGfFrR+PmOR9mtPX6JVxLGYYu3V3GG/7IRq6iEW8BjON1pnxMan
	82mZsRnMFl7U7w4hlH3FPdHvVXffsSlJ2jCVsJy/kMjZ0nx3rONYNiyd7dJ+iV/vH5aL
	A+iKhdwzi15qC+hkm3xyOZVRmndVvLWfFCm44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2pebf/0PR+IvJNPCRpXipzxGfr/2aHKqB2n6O6kIo6g=;
	b=eB45bOvc354jsaUKiXhbAYixAb3dp/93/74DDi18TC2r7Cy24+8lgwku0u6prAERtk
	R6jKPjekMbPQVyjCBD/5pxBo+XK7dtCFywKVkNK0wzDg5CWU6DuUM41gJOvFAxe2Xhhn
	oZ8OypuATPGdqdU8+5kzH9AWYQS1/43wDAbcM6iD9qwjAikjr6gPptm+9gnVIlKgu+Jz
	Ylw4ghqmQwYCchh4QhvVhcOo3o2m8/Fg4tMO7NP+vTtAA0b/fO1ElLTvVVl+s3/EljO5
	vwqbEn5Y/V9EMaiUz1+zYppDM/ezMw9DXrMgZRMfw1agpzlqRLdynJIGwwiJ968BbWbH
	TKmg==
X-Gm-Message-State: ALQs6tAxA2A7VJJnVWFq8BbV4AXUXfVv5N5ML4rb3YUjdJ0iLkkCd2VQ
	1ZHQyTzpEdkjcjT6C4rEt/zzcA==
X-Received: by 2002:a17:902:2f84:: with SMTP id
	t4-v6mr29620928plb.24.1525458632062; 
	Fri, 04 May 2018 11:30:32 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:17 -0700
Message-Id: <20180504183021.19318-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 06/10] target/riscv: Use new atomic min/max
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LlYB7tPW4S8z

Reviewed-by: Michael Clark <mjc@sifive.com>
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

