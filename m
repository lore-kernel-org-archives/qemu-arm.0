Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650675ejb;
        Fri, 7 Apr 2023 19:49:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrSmiPGF1yo/FApgx+Z09LeJFQIhXsauGE+DO81xCykJ8n37VjYoeDUdNhmZGGbADWDDUg
X-Received: by 2002:ad4:594c:0:b0:56e:bfda:a138 with SMTP id eo12-20020ad4594c000000b0056ebfdaa138mr2296518qvb.10.1680922194843;
        Fri, 07 Apr 2023 19:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922194; cv=none;
        d=google.com; s=arc-20160816;
        b=D9ZPBls3U6YN7n5+ghoMvULytZDQKeSrKXM5yz5Kq7FzRQLApYXnmoDkG9nBXNtERm
         Fuh49fB32dWGDQDRaNMWpYE4+hQKMHHqDBmHdXRB1Jw7R0Coqs0hwnfZuR1xW0CBLnf0
         oTkJ/xMiQXcYCzolmvQp4z84rJ4j9VYxrBr8uhi6iIYxdOADCmmNocDWVA2henDCXn/P
         f7iyNbFuNh4WZCfpwKWlXZEQU3/kcrD86foOHDzRrPIrLl6uHrNhDYuPq6mJksig2tuK
         z6znNU83QvZYZfq7O0Od6CklB81HzvMuRtrrcFnYxP/C/YKqZwYD76aQH0urrPkm87Z9
         9UuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i9b6w9gWvCthNszMWt3+LpRjnTOnldmnZfV8N9JLl1Q=;
        b=N7KXd0tctO+2z6FmuGV7mJe0ei8VKvY/S2KekiNilZbzrJdqW+jih8JTr0OYgfpKTh
         M196Ts0Fv1jveDgyOA21YM1ovbEO49yr4rBX33OpC1OgI3UjWFfqxxSzPumOdDeUuPlR
         bceAhUb7adnqUKlPSfJeC8WAn0sQtgnIVLqdCfgLo5Ov8xoHJo5wKu3W4vbLtR8Q8jTl
         ba8EXKLRe6l5Pbi26cvrHmFgHSR5yE2czgg5ecLz9NZufHcGK3WycweVTb1CncujLO5f
         4l4J/KpWWb11bxEwDGCR/oNhuMkm6hekDq8Thw5hMnC9xJNHRbQQwEAk1UcFq63Rvtln
         Ct/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNqwgYQx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr1-20020a0562142a8100b005a92445f87fsi1949261qvb.533.2023.04.07.19.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNqwgYQx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkybZ-000486-JI; Fri, 07 Apr 2023 22:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybT-0003RK-N6
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:46:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybP-0007o1-Dt
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:46:59 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1799886pjp.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9b6w9gWvCthNszMWt3+LpRjnTOnldmnZfV8N9JLl1Q=;
 b=mNqwgYQxaqFP05iSLGzuLd83cPZq4R+/hfCKIZS9ZdZ9yoYtHZYv8AutYLN8pLpMJA
 JoEsqJXY2DGdoXMQvpNu+LEzuhoo/yIrL8eZdsj3MhiQ0b5yuJ5h94tu+1J/GGbYt0ou
 Lz7YACRgSDN/Lton69PVNJuBrbheW+KRiw3Rt4Ze5QWFaS9cqM7hoxCDx3rL9xXRQule
 jKieLkzOY79x1yPVsVdY2nDfgTi+O/5V8VQuFmDAHmLEO/ujNTaMxsOnfITIUa+MpMqV
 lm+4bA8322Vk2iJ7heiwVRQwpl99Uxe/zW/VIlqfF3xHRZfzjby1aze25vlLUJUPaA0l
 Mn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9b6w9gWvCthNszMWt3+LpRjnTOnldmnZfV8N9JLl1Q=;
 b=pjtlwiDpK6z6JdPJM0cNbeouyyYGM3pjB9yh9gwS0HKtBy2tpQx0mK62y1v0AyTIDE
 YS0Gfn7NGO6bIehlFLxr/UVjnak/u7dzELcb7P8HQSZ8Xjl9i16hRiFslm3sLkQaLfNj
 T5bH/iKWxfbvVuY7PzAFm4VsuKkxaEg1TnAvNPxqmC1whLm0FyASckck3EMZCtJGYfP6
 BCTxejNrbfB/hUb4unI2RYn5Ed00RSeN9iTMtd9NgFkCklmCfVGw4yk016fJ14NXsQUC
 dY61XzyK+b6yEOqIntP89PHGB9T7itzKxvg+qCmQSRgL0OdFCOWviuuIHzZE/GTW5zBr
 mH+w==
X-Gm-Message-State: AAQBX9eeYXhlImIiOiSuKQCcw0uYLIpyuVfB60P/Arka5k1BcDLKP625
 U12MXO0673qw6IhM8SHoqU2FEYu38qV/mj7muxY=
X-Received: by 2002:a17:902:ce8e:b0:1a2:56f4:d369 with SMTP id
 f14-20020a170902ce8e00b001a256f4d369mr793479plg.19.1680922014054; 
 Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 42/42] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:43:14 -0700
Message-Id: <20230408024314.3357414-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ksgdWJUpYLhF

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f3e5e856d6..05fc65faac 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1324,7 +1324,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is64)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1351,8 +1351,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
     tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   memop & MO_SIZE, data);
+                   TCG_REG_O2, d_type, memop & MO_SIZE, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
@@ -1637,16 +1636,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, a0, a1, a2, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, a0, a1, a2, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld32s_i64:
-- 
2.34.1

