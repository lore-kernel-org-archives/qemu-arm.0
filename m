Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5265421wrt;
        Tue, 2 Oct 2018 09:36:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61bC9uywMP0h2X1Enw7apztBoqn45CSkWyCVw+GrqQ4MkARmHwXZ8R6G7Qs2n2EXK3ufysb
X-Received: by 2002:a37:ae03:: with SMTP id x3-v6mr12844350qke.170.1538498208288;
        Tue, 02 Oct 2018 09:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498208; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9iS8vLslw++Kr9F/qUJl2/aA2A9+YEXJTNDZVlFVldUfPWnQVSDY2FhAQiCtHYs4V
         SCbjTLBZrcnESm9dgvzDt50WpWsonLuYgnVeulYbg8i25dqA6X+jKUN0kZIsf3YIBIte
         hx+bGq01A0QMvYifKhRz2dwXNMZfVF/NSF3sydnu+IAyOmpkikSH32nFHVwId2NAKxVo
         9B0bzIkElPhfXwQMQdwVvLD3tcp4reVSAevOMAKTQlEpEVbKCjl3WTkLD+UIS6zIPInZ
         pn/PvI05IP2MNEtAxFlCBxgYmPE+6dV5cnI4xyRqtQvN97r0Vu7DQxun6oO96uKhVmPt
         nOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KCDU3/ohzWCYsOb4tRry/i55uImP2+JAdClztFl2B9w=;
        b=jUQk6PSBFl2rVCJH6p4bBb1H9NqRNk73YGRZBRB527u5/+T/85XadHFx9OAOul9lzZ
         cfpzXouCEW3sjS8KGDPtuLWZdbJUyJr57ezBe++w9HqwGWCBytRgmByg6Kd9duRnvz2s
         kXx0fUf28KyLQ7d02ibym2mo6emCb0P+htFsHq/HIDGe7RjhMUlVIZnmXKKV+1aNTgtd
         BgRUYV/GOD6vx9KGa2wreu9vUl72l5Q6xUcT9zjxmtcdgVH/EVnYD9Ar6O9CcNMSc7nh
         +sEo3rnPLldBfGzCQBzz34+Cskpk5edoOig7iACU5LMF5tUFooRXqMe79PeGuynrGh4K
         xcXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5-v6si3120009qtm.141.2018.10.02.09.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7NfD-0006i0-OB
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:36:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Neb-0006dc-Ri
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Neb-00055r-1B
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeY-00051B-EI; Tue, 02 Oct 2018 12:36:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeW-0007Hc-JH; Tue, 02 Oct 2018 17:36:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:48 +0100
Message-Id: <20181002163556.10279-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 05/13] target/arm: Add some comments in Thumb
 decode
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RD5Ena2Pbb+g

Add some comments to the Thumb decoder indicating what bits
of the instruction have been decoded at various points in
the code.

This is not an exhaustive set of comments; we're gradually
adding comments as we work with particular bits of the code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Specifically, I figured these out as I was going through looking
for the insns which write SP. These comments turn out not to
be relevant to those instructions, but I don't want to throw
them away.
---
 target/arm/translate.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 25a8fe672f5..fcb33b8a503 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10623,6 +10623,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             tmp2 = load_reg(s, rm);
             if ((insn & 0x70) != 0)
                 goto illegal_op;
+            /*
+             * 0b1111_1010_0xxx_xxxx_1111_xxxx_0000_xxxx:
+             *  - MOV, MOVS (register-shifted register), flagsetting
+             */
             op = (insn >> 21) & 3;
             logic_cc = (insn & (1 << 20)) != 0;
             gen_arm_shift_reg(tmp, op, tmp2, logic_cc);
@@ -11674,7 +11678,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         rd = insn & 7;
         op = (insn >> 11) & 3;
         if (op == 3) {
-            /* add/subtract */
+            /*
+             * 0b0001_1xxx_xxxx_xxxx
+             *  - Add, subtract (three low registers)
+             *  - Add, subtract (two low registers and immediate)
+             */
             rn = (insn >> 3) & 7;
             tmp = load_reg(s, rn);
             if (insn & (1 << 10)) {
@@ -11711,7 +11719,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
     case 2: case 3:
-        /* arithmetic large immediate */
+        /*
+         * 0b001x_xxxx_xxxx_xxxx
+         *  - Add, subtract, compare, move (one low register and immediate)
+         */
         op = (insn >> 11) & 3;
         rd = (insn >> 8) & 0x7;
         if (op == 0) { /* mov */
@@ -11848,7 +11859,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
 
-        /* data processing register */
+        /*
+         * 0b0100_00xx_xxxx_xxxx
+         *  - Data-processing (two low registers)
+         */
         rd = insn & 7;
         rm = (insn >> 3) & 7;
         op = (insn >> 6) & 0xf;
-- 
2.19.0

