Received: by 10.28.4.212 with SMTP id 203csp1224795wme;
        Wed, 2 May 2018 15:23:02 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpB41G6kenKLFqVS6lLWl8CM8ID9EuCF51zYuIPjF3fLyKb63qQvi7rJXOUz6UiSDtrYBXg
X-Received: by 2002:aed:3183:: with SMTP id 3-v6mr18249091qth.297.1525299782400;
        Wed, 02 May 2018 15:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299782; cv=none;
        d=google.com; s=arc-20160816;
        b=K5J77U8rDCTbrKAqW8ivkKFQCsjLUeUom/aRLcgzoESoKu5OjXMU7+w7oAxg6BtX04
         VlJnc6Are0SchklTFTPXJOeKH1S+ImnvGjyBL0pypSsQ5cKaI+3zWlmjv1q4s4n48YN/
         CweOwX2c9mQMQCceufcx2wpMGjh72KjjRdp7Ro17Q1AvjNefQmxiKtZH73hh6g4mAK5L
         aSdiZOuOjhjGQh+C0RuNkI/bTG5aP9z8GJWv2dbq25mK/MNwESlgnfDwLg6UPONAOM4Z
         poq2AItD1n2DjfP/WN6L+dMvyx/FzJJ7duYVBeLw186arAY7mv9fcj4PK83IScmNM3Er
         JliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WdCxTa5pgWvjIsEE2akqA9yOnPVSsIbNJWqXsUkxDak=;
        b=JeI7Nwhn59Y1CtdoV56GJKWd5MBskBwKj51EsaYZGlf/frtxf3R77DWWYyfC5GUMv9
         LCwCw9t0HKG3lZbODz/ek5WSUlcraaJTuFqxsav97lhkGK87eNhs/SnBAg4pQgAdHNGy
         nFpqfcIyq/oP9+H5eG+dIGCx/bRqxKRTw0XXegW6jzwBOjVgWqG3jrytzUrzw3gcAlaf
         uA1ks8hdDYOL9MK0V5vyUUbREXO6A0Uh8gaLeSaFGtxNOSKsqJOHF77XF2N8lNctGZz8
         1Ikh26J5bhNL40AqzTHhYxVcbr+loAM5Agit2QDBjIAmzfCDNgWkquL5bWY5q2yWRfo2
         J8uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wkv3xhCH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si3058852qkt.385.2018.05.02.15.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wkv3xhCH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE09N-0005m7-QO
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02j-0000lk-9i
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02h-0007wv-PF
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:09 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02h-0007wT-JQ
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:07 -0400
Received: by mail-pg0-x244.google.com with SMTP id i194-v6so11634147pgd.0
	for <qemu-devel@nongnu.org>; Wed, 02 May 2018 15:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WdCxTa5pgWvjIsEE2akqA9yOnPVSsIbNJWqXsUkxDak=;
	b=Wkv3xhCHfVS2BVCCpwYkw9knikADuJp/4otyphPboxDxwzhDRloZCRUDft7jeHx3RZ
	EBjMQIB6mC0G47W9pppW10fxQql0TVy80B4Z0fp7uIoVUx8fb6lajbQRiDqvQC69zxRo
	HniQxf6IhOrV8+98kw7TLlrmpI4nfWUGaRSyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WdCxTa5pgWvjIsEE2akqA9yOnPVSsIbNJWqXsUkxDak=;
	b=QYsodELDv54CmtMuCW9ikSRmPfgfRVVCaPbD5DnqR8olJuCinzgXDzfxGgz2ujyXKH
	JVMmEeEKAB9j9spN7iwvW6wz1iZDEKEybRlfhW4BytWBcGkvdhZZMt8t1c75xLQDLbdq
	ElzPTj6ntva1yREPYv34lDwtf9eGNICwC8LwBRfIFpjZutEsi+QZUq6tF1lKsfiT7UrJ
	JeJx4EQKOieGTP9ddl6dbP0+edu/tYuPW4sz/5fvlv3VqOJy8Dl+2Q4oRvcWBylwhxeo
	JsG6fr/Fns31IlHwC4H7fT4QyDQf/4VisEprjY8lOcPx4I6VijCH2v5g96CS/36ntHfU
	dvBA==
X-Gm-Message-State: ALQs6tDtLY0HGMc3DiDmNOE2iPllG94ZXEeEJMW/CxRPoSaYm7QpEBt0
	PYkk3NnkBkdkmqxghFWKui0irwL1sdg=
X-Received: by 10.167.133.206 with SMTP id z14mr20763807pfn.2.1525299366423;
	Wed, 02 May 2018 15:16:06 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.16.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:16:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:47 -0700
Message-Id: <20180502221552.3873-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v2 09/14] target/arm: Implement FP
 data-processing (2 source) for fp16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6t3+HbI/d+k

We missed all of the scalar fp16 binary operations.

Cc: qemu-stable@nongnu.org
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c63d5e743..d7a49ef2e4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5062,6 +5062,61 @@ static void handle_fp_2src_double(DisasContext *s, int opcode,
     tcg_temp_free_i64(tcg_res);
 }
 
+/* Floating-point data-processing (2 source) - half precision */
+static void handle_fp_2src_half(DisasContext *s, int opcode,
+                                int rd, int rn, int rm)
+{
+    TCGv_i32 tcg_op1;
+    TCGv_i32 tcg_op2;
+    TCGv_i32 tcg_res;
+    TCGv_ptr fpst;
+
+    tcg_res = tcg_temp_new_i32();
+    fpst = get_fpstatus_ptr(true);
+    tcg_op1 = read_fp_hreg(s, rn);
+    tcg_op2 = read_fp_hreg(s, rm);
+
+    switch (opcode) {
+    case 0x0: /* FMUL */
+        gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x1: /* FDIV */
+        gen_helper_advsimd_divh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x2: /* FADD */
+        gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x3: /* FSUB */
+        gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x4: /* FMAX */
+        gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x5: /* FMIN */
+        gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x6: /* FMAXNM */
+        gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x7: /* FMINNM */
+        gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    case 0x8: /* FNMUL */
+        gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
+        tcg_gen_xori_i32(tcg_res, tcg_res, 0x8000);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    write_fp_sreg(s, rd, tcg_res);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tcg_op1);
+    tcg_temp_free_i32(tcg_op2);
+    tcg_temp_free_i32(tcg_res);
+}
+
 /* Floating point data-processing (2 source)
  *   31  30  29 28       24 23  22  21 20  16 15    12 11 10 9    5 4    0
  * +---+---+---+-----------+------+---+------+--------+-----+------+------+
@@ -5094,6 +5149,16 @@ static void disas_fp_2src(DisasContext *s, uint32_t insn)
         }
         handle_fp_2src_double(s, opcode, rd, rn, rm);
         break;
+    case 3:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            unallocated_encoding(s);
+            return;
+        }
+        if (!fp_access_check(s)) {
+            return;
+        }
+        handle_fp_2src_half(s, opcode, rd, rn, rm);
+        break;
     default:
         unallocated_encoding(s);
     }
-- 
2.14.3

