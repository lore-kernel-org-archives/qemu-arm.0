Received: by 10.28.71.155 with SMTP id m27csp2389388wmi;
        Mon, 9 Apr 2018 03:39:04 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49Dp3QL5n3BiUVwVNaW/M1FiXx8euMy/JFdKYGUCvMvRXRRrU5AcJf9p4J8qYu8h5yULUUB
X-Received: by 10.237.42.55 with SMTP id c52mr51263797qtd.145.1523270344859;
        Mon, 09 Apr 2018 03:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523270344; cv=none;
        d=google.com; s=arc-20160816;
        b=Vg3xlYOpE5X+LGrEFFBM7mzc1oiDftQi/l9rI09qMTeiSthDrMXvZNUuUOshf0O73Q
         /GLsWpiU6ZjJMKkujv6/e7imjpATp0zay4kcMTaXE3nTO+GGaO9BxqF6g4FiGe0oz/i4
         +ihKzODDt3CuoAgT9rwwL0WIwTEQSu2bBP/6L/kZXZsmGLEEow+V9H9uJY+b0ZkpAxUh
         slm14Zc2gUzc5hmG1pd3bWutM/c4L9cKPeSa4A1LbRiBf3UbwMqGg3Yol4Mlg2rt6G3G
         cbKw80DXOIBAnMciscQqg7KyiwtCN3I/F0OnpxWCmP72KtIK+9xP7DU8yXfH/hmaVG72
         HJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=h0NvyXJGp5kBwLzV3fFPo9PbJofvrfohYvu+vyicQNY=;
        b=mhq+uDwexg45siIdLmzbos8tW3AqEIhuRAo1TDIgFP/8XK0oqON+iT7ylquAlexyZJ
         zGs/8/UuVHWASAJc6SK3TAkn2elIY8ZrsGR7hEaFREuawrY4Zo+QUVK+6ec0KI9fGmcq
         NqU7xgUR/ObpHJzVeX5OF+/rgO9l7G85VnE/RdmMEUuGhwTKKQvhTLd9FtL2EJY6N0IJ
         KkxunQ32BxYZ5gzx5jkZm+/uhMBBp7S4jzxnxVPeEQRwTvHLnr95rbK19QkO1a1aBSbi
         yt4xKvEsn2syo9KiPJFU44dzK+x5FI+/hV5+X29ULv5cKzVEsvfMcY10Dfj2BojMmb2A
         i79A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20si50905qkm.120.2018.04.09.03.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 03:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5UCW-00082a-Dt
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 06:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5UCH-00080q-CR
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 06:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5UCG-0003l0-EK
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 06:38:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f5UCG-0003iC-5v; Mon, 09 Apr 2018 06:38:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f5UC4-00057C-65; Mon, 09 Apr 2018 11:38:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Apr 2018 11:38:34 +0100
Message-Id: <20180409103834.11285-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] target/arm: Don't corrupt insn_start
 arguments on 32-bit hosts
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
Cc: alarson@ddci.com, Richard Henderson <rth@twiddle.net>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFD1+xzgJxak

For the Arm target, we have a 3-operand tcg_insn_start,
where the 3 arguments are the PC, condexec bits, and
a syndrome value. We set it up like this:

    tcg_gen_insn_start(dc->pc,
                       (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
                       0);
    dc->insn_start = tcg_last_op();

and then we patch in the 3rd operand later in disas_set_insn_syndrome():
    tcg_set_insn_param(s->insn_start, 2, syn);

Unfortunately, if we're running on a setup where
TARGET_LONG_BITS > TCG_TARGET_REG_BITS (ie 64 bit guest
on 32 bit host), tcg_gen_insn_start() has under the hood
split the 3 operands we gave it into 6, and so we end
up patching a syndrome value into the condexec bits.
This means we'll end up with corrupted guest condexec
state if we have to do a cpu_restore_state(), which happens
often when using icount and occasionally for load/store
instructions that fault.

Fix the bug by using the correct operand offset for the
64-on-32 case.

Cc: qemu-stable@nongnu.org
Reported-by: alarson@ddci.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This doesn't apply as-is to the stable branch, but the
difference is minor (insn_start was insn_start_idx, but
the 2 vs 4 for argument 2 is still the same.)
---
 target/arm/translate.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c47febf99d..f04ece9cfd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -120,7 +120,15 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
     /* We check and clear insn_start_idx to catch multiple updates.  */
     assert(s->insn_start != NULL);
+#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
     tcg_set_insn_param(s->insn_start, 2, syn);
+#else
+    /* tcg_gen_insn_start has split every target_ulong argument to
+     * op_insn_start into two 32-bit arguments, so we want the low
+     * half of the 3rd argument, which is at index 4.
+     */
+    tcg_set_insn_param(s->insn_start, 4, syn);
+#endif
     s->insn_start = NULL;
 }
 
-- 
2.16.2

