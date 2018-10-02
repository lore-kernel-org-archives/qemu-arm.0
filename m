Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5270682wrt;
        Tue, 2 Oct 2018 09:42:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60vauQsyLXpho7Qw/LCZwISGGPmIWNWAd0HeLbD2DKJ25gBjZVSC/N+skrS2SFHw87gfqAZ
X-Received: by 2002:ac8:1e1e:: with SMTP id n30-v6mr12835702qtl.181.1538498546806;
        Tue, 02 Oct 2018 09:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498546; cv=none;
        d=google.com; s=arc-20160816;
        b=qd3+HqEo/WELND8koZulLEbXrI3+85ZEb/vG68WiutXPyc6Vd21XAyNrphzixckB94
         3lnusDAbxLATxGaHc9XHF4XTCi9BGNeL0JGSXPE/h2QBcrKKA+PfLmf4b62QnFUyDNyb
         aWWMiCw2vCla2n1A1/KPLmWBBsl99O6qYo++MTBCw4xXTCSd++pSfPKAa5iEjd00+p4Y
         zzmJ92HrMK8TysPONv/mn5wm2ylpTLRaJL8hb31oz3JeDEgCOpZFEQ99gWW5KJFUl1HE
         1PkgR5ivQuqFyxIGHmFtCJQ1q7zEXcdxC94HqmZIyDg76GMc2c/LQiXTLqLtdZv25Bbp
         hYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zaH7tS8Xp5YBtUjSSjfZRfRCMQsH7Jl5qQ10znR4+Gs=;
        b=iYwvj0cjeELWAeOY9YnjAHW8/w0mkxuZz63hI+PaqVui71Gj8hN6S1ee6Ow//LbPXK
         Is9e5FkrrvuM6vR83L6ogUGO5ofpryz8iYNNqDTMZZBXFh6tWzh+VkKhqS1tfq3iwsA8
         CNJRpG2cgM8TZcKfrjyH1kOEpHQfTJLOVBYIqHv39QhHk4PHg47Db3BiMGbew2F3XCjz
         n18IpCpNSdUxyrroqEvzryvY3htRQVNljIk/rzQd3iPQv9iw+vB44osfHWiftglI9EBw
         wj6J0WsIzdsA8UhQBmJxd0UZjPW5G7gEFcvliAw5YjCmO5Kp2dPhFbcWJ3N7nk7V98cp
         JYKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62-v6si6980333qkd.89.2018.10.02.09.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Nkg-00047U-7U
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:42:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nef-0006iP-BJ
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nee-00058V-JJ
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Nee-000565-8I; Tue, 02 Oct 2018 12:36:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Nec-0007It-22; Tue, 02 Oct 2018 17:36:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:53 +0100
Message-Id: <20181002163556.10279-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/13] target/arm: Add v8M stack checks for T32
 load/store single
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jkNvz+hhkrI

Add v8M stack checks for the instructions in the T32
"load/store single" encoding class: these are the
"immediate pre-indexed" and "immediate, post-indexed"
LDR and STR instructions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3fb378a492d..65df8d6975c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11624,7 +11624,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     imm = -imm;
                     /* Fall through.  */
                 case 0xf: /* Pre-increment.  */
-                    tcg_gen_addi_i32(addr, addr, imm);
                     writeback = 1;
                     break;
                 default:
@@ -11636,6 +11635,28 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
         issinfo = writeback ? ISSInvalid : rs;
 
+        if (s->v8m_stackcheck && rn == 13 && writeback) {
+            /*
+             * Stackcheck. Here we know 'addr' is the current SP;
+             * if imm is +ve we're moving SP up, else down. It is
+             * UNKNOWN whether the limit check triggers when SP starts
+             * below the limit and ends up above it; we chose to do so.
+             */
+            if ((int32_t)imm < 0) {
+                TCGv_i32 newsp = tcg_temp_new_i32();
+
+                tcg_gen_addi_i32(newsp, addr, imm);
+                gen_helper_v8m_stackcheck(cpu_env, newsp);
+                tcg_temp_free_i32(newsp);
+            } else {
+                gen_helper_v8m_stackcheck(cpu_env, addr);
+            }
+        }
+
+        if (writeback && !postinc) {
+            tcg_gen_addi_i32(addr, addr, imm);
+        }
+
         if (insn & (1 << 20)) {
             /* Load.  */
             tmp = tcg_temp_new_i32();
-- 
2.19.0

